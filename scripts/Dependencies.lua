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
    "Sound",
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
    "Character.lua",
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
    "ItemDB.lua",
    "World.lua",
    "Icons.lua",
    "Storyboard.lua",
    "StoryboardEvents.lua",
    "ScreenState.lua",
	"CaptionState.lua",
	"CaptionStyles.lua",
    "map_sontos_house.lua",
	"MapDB.lua",
	"SleepState.lua",
    "FollowPathState.lua",
    "EntityDefs.lua",
})
