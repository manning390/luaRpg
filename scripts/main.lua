LoadLibrary("Asset")
Asset.Run("Dependencies.lua")

gRenderer = Renderer.Create()
gStack = StateStack:Create()
gWorld = World:Create()

gWorld.mParty:Add(Actor:Create(gPartyMemberDefs.hero))
gWorld.mParty:Add(Actor:Create(gPartyMemberDefs.mage))
gWorld.mParty:Add(Actor:Create(gPartyMemberDefs.thief))

gCombatDef = {
    background = "arena_background.png",
    actors =
    {
        party = gWorld.mParty:ToArray(),
        enemy = {
            Actor:Create(gEnemyDefs.goblin),
            Actor:Create(gEnemyDefs.goblin),
            Actor:Create(gEnemyDefs.goblin),
            Actor:Create(gEnemyDefs.goblin),
        }
    }
}

gStack:Push(ExploreState:Create(gStack, CreateArenaMap(), Vector.Create(30, 18, 1)))
gStack:Push(CombatState:Create(gStack, gCombatDef))
gStack:Push(LootSummaryState:Create(gStack, gWorld,
    {
        xp = 30,
        gold = 100,
        loot =
        {
            { id =1, count = 2 },
            { id =2, count = 1 },
            { id =3, count = 1 },
        }
    }
))

function update()
    local dt = GetDeltaTime()
    gStack:Update(dt)
    gStack:Render(gRenderer)
    gWorld:Update(dt)
end
