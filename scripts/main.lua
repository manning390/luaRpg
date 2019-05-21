LoadLibrary("Asset")
Asset.Run("Dependencies.lua")

gRenderer = Renderer:Create()
local stack = StateStack:Create()

-- local mapDef = CreateMap1()
-- mapDef.on_wake = {}
-- mapDef.actions = {}
-- mapDef.trigger_types = {}
-- mapDef.triggers = {}
local intro =
{
    BlackScreen(),
    Caption("place", "title", "Village of Sontos"),
    Caption("time", "subtitle", "MIDNIGHT"),
    FadeOutCaption("place"),
    FadeOutCaption("time"),
    Wait(10)
}
local storyboard = Storyboard:Create(stack, intro)
stack:Push(storyboard)
-- local explore = ExploreState:Create(stack, mapDef, Vector.Create(11, 3, 1))
-- local menu = InGameMenuState:Create(stack)

-- gWorld = World:Create()
-- gIcons = Icons:Create(Texture.Find("inventory_icons.png"))
-- stack:Push(explore)
-- stack:Push(menu)

function update()
    local dt = GetDeltaTime(0)

    stack:Update(dt)
    stack:Render(gRenderer)
end

