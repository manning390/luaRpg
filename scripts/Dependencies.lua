function Apply(f, list, iter)
    iter = iter or ipairs
    for k, v in iter(list) do
        f(v, k)
    end
end

Apply(function(v) LoadLibrary(v) end,
{
    "Renderer",
    "Sprite",
    "System",
    "Texture",
    "Vector",
    "Keyboard",
})

Apply(function(v) Asset.Run(v) end,
{
    "Animation.lua",
    "Map.lua",
    "Util.lua",
    "Entity.lua",
    "StateMachine.lua",
    "MoveState.lua",
    "WaitState.lua",
    "NPCStandState.lua",
    "PlanStrollState.lua",
    "Tween.lua",
    "Actions.lua",
    "Trigger.lua",
    "EntityDefs.lua",
    "Character.lua",
    "small_room.lua",
    "Panel.lua",
    "ProgressBar.lua",
    "Selection.lua",
    "Textbox.lua",
    "Scrollbar.lua",
    "StateStack.lua",
    "ExploreState.lua",
    "FadeState.lua",
    "Layout.lua",
    "InGameMenuState.lua",
    "FrontMenuState.lua",
    "ItemMenuState.lua",
    "small_room.lua",
    "ItemDB.lua",
    "World.lua",
    "Icons.lua",
})