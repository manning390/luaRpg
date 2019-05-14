LoadLibrary("Asset")
Asset.Run("Dependencies.lua")

gRenderer = Renderer:Create()

local mapDef = CreateMap1()
mapDef.on_wake = {}
mapDef.actions = {}
mapDef.trigger_types = {}
mapDef.triggers = {}
local stack = StateStack:Create()
local explore = ExploreState:Create(stack, mapDef, Vector.Create(11, 3, 1))
local menu = InGameMenuState:Create(stack)

gWorld = World:Create()
gIcons = Icons:Create(Texture.Find("inventory_icons.png"))
stack:Push(explore)
stack:Push(menu)

function update()
    local dt = GetDeltaTime(0)
    stack:Update(dt)
    stack:Render(gRenderer)
    gWorld:Update(dt)
end

