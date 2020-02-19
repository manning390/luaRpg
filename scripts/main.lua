LoadLibrary("Asset")
Asset.Run("Dependencies.lua")

gRenderer = Renderer.Create()
gStack = StateStack:Create()
gWorld = World:Create()

local startPos = Vector.Create(5, 9, 1)

local hero = Actor:Create(gPartyMemberDefs.hero)
local thief = Actor:Create(gPartyMemberDefs.thief)
local mage = Actor:Create(gPartyMemberDefs.mage)
gWorld.mParty:Add(hero)
gWorld.mParty:Add(thief)
gWorld.mParty:Add(mage)

gWorld.mGold = 1000
gWorld:AddItem(1, 3)
gWorld:AddItem(2, 3)
gWorld:AddItem(10, 5)

-- Equip the sword (from inventory)
hero:Equip(Actor.EquipSlotId[1], {id = 1, count = 3})

gStack:Push(ExploreState:Create(gStack, CreateTownMap(), startPos))

function update()
    local dt = GetDeltaTime()
    gStack:Update(dt)
    gStack:Render(gRenderer)
    gWorld:Update(dt)
end
