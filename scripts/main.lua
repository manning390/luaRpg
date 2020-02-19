LoadLibrary("Asset")
Asset.Run("Dependencies.lua")

gRenderer = Renderer.Create()
gStack = StateStack:Create()
gWorld = World:Create()

gWorld.mParty:Add(Actor:Create(gPartyMemberDefs.hero))
gStack:Push(ExploreState:Create(gStack, CreateTownMap(), Vector.Create(5, 9, 1)))

function update()
    local dt = GetDeltaTime()
    gStack:Update(dt)
    gStack:Render(gRenderer)
    gWorld:Update(dt)
end
