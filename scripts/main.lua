-- LoadLibrary("Asset")
-- Asset.Run("Dependencies.lua")

-- gRenderer = Renderer.Create()
-- gStack = StateStack:Create()
-- gWorld = World:Create()

-- gWorld.mParty:Add(Actor:Create(gPartyMemberDefs.hero))

-- gStack:Push(ExploreState:Create(gStack, CreateArenaMap(), Vector.Create(30, 18, 1)))

-- function update()
--     local dt = GetDeltaTime()
--     gStack:Update(dt)
--     gStack:Render(gRenderer)
--     gWorld:Update(dt)
-- end

LoadLibrary("System")
LoadLibrary("Renderer")
LoadLibrary("Asset")

Asset.Run("CombatScene.lua")
Asset.Run("EventQueue.lua")
Asset.Run("CETurn.lua")
Asset.Run("CEAttack.lua")

gRenderer = Renderer.Create()

gCombatScene = CombatScene:Create(
    {
        {
            mName = "hero",
            mSpeed = 3,
            mAttack = 2,
            mHP = 5,
            IsPlayer = function() return true end,
            IsKOed = function(self) return self.mHP <= 0 end,
        },
    },
    {
        {
            mName = "goblin",
            mSpeed = 2,
            mAttack = 2,
            mHP = 5,
            IsPlayer = function() return false end,
            IsKOed = function(self) return self.mHP <= 0 end,
        },
    }
)

print("--start--")

function update()
    gRenderer:AlignText("center", "center")
    gRenderer:DrawText2d(0, 0, "Testing Combat")
    gCombatScene:Update()
end
