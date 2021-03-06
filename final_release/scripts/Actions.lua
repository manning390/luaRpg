Actions =
{
    -- Teleport an entity from the current position to the given position
    Teleport = function(map, tileX, tileY, layer)
        layer = layer or 1
        return function(trigger, entity)
            entity:SetTilePos(tileX, tileY, layer, map)
        end
    end,
    AddNPC = function(map, npc)
        assert(npc.id ~= "hero") -- reserved npc name
        return function(trigger, entity)
            local charDef = gCharacters[npc.def]
            assert(charDef)
            local char = Character:Create(charDef, map)

            -- use npc def location by default
            -- Drop back to entities locations if missing
            local x = npc.x or char.mEntity.mTileX
            local y = npc.y or char.mEntity.mTileY
            local layer = npc.layer or char.mEntity.mLayer

            char.mEntity:SetTilePos(x, y, layer, map)

            table.insert(map.mNPCs, char)

            assert(map.mNPCbyId[npc.id] == nil)
            char.mId = npc.id
            map.mNPCbyId[npc.id] = char
        end
    end,
    RunScript = function(map, func)
        return function(trigger, entity, tX, tY, tLayer)
            func(map, trigger, entity, tX, tY, tLayer)
        end
    end,
    RemoveNPC = function(map, npcId)
        return function(trigger, entity, tX, tY, tLayer)
            local char = map.mNPCbyId[npcId]

            local x = char.mEntity.mTileX
            local y = char.mEntity.mTileY
            local layer = char.mEntity.mLayer

             map:RemoveNPC(x, y, layer)
        end
    end,
    AddPartyMember = function(actorId)
        return function(trigger, entity, tX, tY, tLayer)
            local actorDef = gPartyMemberDefs[actorId]
            assert(actorDef)
            gWorld.mParty:Add(Actor:Create(actorDef))
        end
    end,
    OnRecruit = function()
        local fadeout =
        {
            SOP.FadeOutchar("handin", npc.mId),
            SOP.RunAction("RemoveNPC",
                {"handin", npc.mId },
                { GetMapRef }),
            SOP.RunAction("AddPartyMember", { npc.mDef.actorId }),
            SOP.HandOff("handin")
        }
        local storyboard = Storyboard:Create(gStack, fadeout, true)
        gStack:Push(storyboard)
    end,
    AddChest = function(map, entityId, loot, x, y, layer)
        layer = layer or 1

        map.mContainerCount = map.mContainerCount or 0
        map.mContainerCount = map.mContainerCount + 1
        local containerId = map.mContainerCount
        local mapId = map.mMapDef.id
        local state = gWorld.mGameState.maps[mapId]
        local isLooted = state.chests_looted[containerId] or false

        return function(trigger, entity, tX, tY, tLayer)

            local entityDef = gEntities[entityId]
            assert(entityDef ~= nil)
            local chest = Entity:Create(entityDef)

            chest:SetTilePos(x, y, layer, map)

            if isLooted then
                chest:SetFrame(entityDef.openFrame)
                return
            end

            local OnOpenChest = function()
                if loot == nil or #loot == 0 then
                    gStack:PushFit(gRenderer, 0, 0, "The chest is empty!", 300)
                else
                    gWorld:AddLoot(loot)
                    for _, item in ipairs(loot) do
                        local count = item.count or 1
                        local name = ItemDB[item.id].name
                        local message = string.format("Got %s", name)

                        if count > 1 then
                            message = message .. string.format(" x%d", count)
                        end

                        gStack:PushFit(gRenderer, 0, 0, message, 300)
                    end
                end

                -- Remove the trigger
                map:RemoveTrigger(chest.mTileX, chest.mTileY, chest.mLayer)
                chest:SetFrame(entityDef.openFrame)
                state.chests_looted[containerId] = true
            end

            local trigger = Trigger:Create( { OnUse = OnOpenChest } )
            map:AddFullTrigger(trigger, chest.mTileX, chest.mTileY, chest.mLayer)
        end
    end,
    OpenShop = function(map, def)
      return function(trigger, entity, tX, tY, tLayer)
        gStack:Push(ShopState:Create(gStack, gWorld, def))
      end
    end,
    OpenInn = function(map, def)
        def = def or {}
        local cost = def.cost or 5
        local lackGPMsg = "You need %d gp to stay at the Inn."
        local askMsg = "Stay at the inn for %d gp?"
        local resultMsg = "HP/MP Restored!"

        askMsg = string.format(askMsg, cost)
        lackGPMsg = string.format(lackGPMsg, cost)

        local OnSelection = function(index, item)
            if index == 2 then
                return
            end

            gWorld.mgold = gWorld.mGold - cost
            gWorld.mParty:Rest()

            gStack:PushFit(gRenderer, 0, 0, resultMsg)
        end

        return function(trigger, entity, tX, tY, tLayer)
            local gp = gWorld.mGold

            if gp >= cost then
                gStack:PushFit(gRenderer, 0, 0, askMsg, false,
                {
                    choices =
                    {
                        options = {"Yes", "No"},
                        OnSelection = OnSelection
                    },
                })
            else
                gStack:PushFit(gRenderer, 0, 0, lackGPMsg)
            end
        end
    end,
    ShortText = function(map, text)
        return function(trigger, entity, tX, tY, tLayer)
            tY = tY - 4
            local x, y = map:TileToScreen(tX, tY)
            gStack:PushFix(gRenderer, x, y, 9*32, 2.5*32, text)
        end
    end,
    ChangeMap = function(map, destinationId, dX, dY)
        local storyboard =
        {
            SOP.BlackScreen("blackscreen", 0),
            SOP.FadeInScreen("blackscreen", 0.5),
            SOP.ReplaceScene(
                "handin",
                {
                    map = destinationId,
                    focusX = dX,
                    focusY = dY,
                    hideHero = false
                }),
            SOP.FadeOutScreen("blackscreen", 0.5),
            SOP.Function(function() gWorld:UnlockInput() end),
            SOP.HandOff(destinationId)
        }
        return function (trigger, entity, tX, tY, tLayer)
            gWorld:LockInput()
            local storyboard = Storyboard:Create(gStack, storyboard, true)
            gStack:Push(storyboard)
        end
    end,
    Combat = function(map, def)
        return function(trigger, entity, tX, tY, tLayer)
            def.background = def.background or "combat_bg_field.png"
            def.enemy = def.enemy or { "goblin" }

            -- convert id's to enemy actors
            local enemyList = {}
            for k, v in ipairs(def.enemy) do
                local enemyDef = gEnemyDefs[v]
                enemyList[k] = Actor:Create(enemyDef)
            end

            local combatState = CombatState:Create(gStack,
            {
                background = def.background,
                actors =
                {
                    party = gWorld.mParty:ToArray(),
                    enemy = enemyList,
                },
                canFlee = def.canFlee,
                OnWin = def.OnWin,
                OnDie = def.OnDie
            })

            local storyboard =
            {
                SOP.BlackScreen("blackscreen", 0),
                SOP.FadeInScreen("blackscreen", 0.5),
                SOP.Function(
                function()
                    gStack:Push(combatState)
                end
            )
        }

        local storyboard = Storyboard:Create(gStack, storyboard)
        gStack:Push(storyboard)
    end
end,
AddSavePoint = function(map, x, y, layer)
    return function(trigger, entity, tX, tY, tLayer)
        local entityDef = gEntities["save_point"]
        local savePoint = Entity:Create(entityDef)
        savePoint:SetTilePos(x, y, layer, map)

        local function AskCallback(index)
            if index == 2 then
                return
            end

            Save:Save()
            gStack:PushFit(gRenderer, 0, 0, "Saved!")
        end

        local trigger = Trigger:Create(
        {
            OnUse = function()
                gWorld.mParty:Rest()
                local askMsg = "Save progress?"
                gStack:PushFit(gRenderer, 0, 0, askMsg, false,
                    {
                        choices =
                        {
                            options = {"Yes", "No"},
                            OnSelection = AskCallback
                        },
                    })
                end
        })
        map:AddFullTrigger(trigger, x, y, layer)
    end
end,
}