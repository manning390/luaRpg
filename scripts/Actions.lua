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
    RemoveNPC = function(map, id)
        return function(trigger, entity, tX, tY, tLayer)
            local npc = map.mNPCbyId[id].mEntity
            assert(npc)
            map:RemoveNPC(npc.mX, npc.mY, npc.mLayer)
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

        return function(trigger, entity, tX, tY, tLayer)
            local entityDef = gEntities[entityId]
            assert(entityDef ~= nil)
            local chest = Entity:Create(entityDef)

            chest:SetTilePos(x, y, layer, map)

            local OnOpenChest = function()
                gStack:PushFit(gRenderer, 0, 0,
                    "The chest is empty!", 300)
                map:RemoveTrigger(chest.mTileX, chest.mTileY, chest.mLayer)
                chest:SetFrame(entityDef.openFrame)
            end

            local trigger = Trigger:Create( { OnUse = OnOpenChest } )
            map:AddFullTrigger(trigger, chest.mTileX, chest.mTileY, chest.mLayer)
        end
    end,
}