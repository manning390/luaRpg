LoadLibrary("Asset")
Asset.Run("Dependencies.lua")

gRenderer = Renderer:Create()

local mapDef = CreateMap1()
mapDef.on_wake = {}
mapDef.actions = {}
mapDef.trigger_types = {}
mapDef.triggers = {}

local CreateBlock = function(stack)
    return
    {
        Enter = function() end,
        Exit = function() end,
        HandleInput = function(self)
            stack:Pop()
        end,
        Render = function() end,
        Update = function(self)
            return false
        end
    }
end

local stack = StateStack:Create()
local state = ExploreState:Create(stack, mapDef, Vector.Create(11, 3, 1))
stack:Push(state)
stack:Push(FadeState:Create(stack))
stack:Push(CreateBlock(stack))
stack:PushFit(gRenderer, 0, 0, "Where am I?")
stack:Push(CreateBlock(stack))
stack:PushFit(gRenderer, -50, 50, "My head hurts!")
stack:Push(CreateBlock(stack))
stack:PushFit(gRenderer, -100, 100, "Uh...")

local layout = Layout:Create()

layout:Contract('screen', 118, 40)
layout:SplitHorz('screen', 'top', 'bottom', 0.12, 2)
layout:SplitVert('bottom', 'left', 'party', 0.726, 2)
layout:SplitHorz('left', 'menu', 'gold', 0.7, 2)


function update()
    local dt = GetDeltaTime()
    layout:DebugRender(gRenderer)
    -- stack:Update(dt)
    -- stack:Render(gRenderer)
end