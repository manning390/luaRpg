LoadLibrary("Asset")
Asset.Run('Dependencies.lua')

gRenderer = Renderer.Create()
gStack = StateStack:Create()
gWorld = World:Create()
gIcons = Icons:Create(Texture.Find("inventory_icons.png"))

gStack:Push(ExploreState:Create(gStack, CreateArenaMap(), Vector.Create(30, 18, 1)))

function update()
    local dt = GetDeltaTime()
    gStack:Update(dt)
    gStack:Render(gRenderer)
    gWorld:Update(dt)
end