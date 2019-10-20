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
    "FollowPathState.lua",
    "MoveState.lua",
    "WaitState.lua",
    "NPCStandState.lua",
    "PlanStrollState.lua",
    "ExploreState.lua",
    "InGameMenuState.lua",
    "FrontMenuState.lua",
    "ItemMenuState.lua",
    "ScreenState.lua",
    "CaptionState.lua",
    "GameOverState.lua",
    "TitleScreenState.lua",
    "CombatState.lua",
    "StatusMenuState.lua",
    "EquipMenuState.lua",
    "CSRunAnim.lua",
    "CSHurt.lua",
    "CSEnemyHurt.lua",
    "CSMove.lua",
    "CSStandby.lua",
    "CSEnemyDie.lua",
    "Tween.lua",
    "Actions.lua",
    "Trigger.lua",
    "Dice.lua",
    "StatDefs.lua",
    "PartyMemberDefs.lua",
    "Stats.lua",
    "EntityDefs.lua",
    "Character.lua",
    "Panel.lua",
    "ProgressBar.lua",
    "Selection.lua",
    "StateStack.lua",
    "Textbox.lua",
    "Scrollbar.lua",
    "Layout.lua",
    "World.lua",
    "ItemDB.lua",
    "Icons.lua",
    "Storyboard.lua",
    "StoryboardEvents.lua",
    "CaptionStyles.lua",
    "map_arena.lua",
    "MapDB.lua",
    "Party.lua",
    "Actor.lua",
    "LevelFunction.lua",
    "ActorSummary.lua",
    "EventQueue.lua",
	-- "CombatScene.lua",
	"EnemyDefs.lua",
    "CETurn.lua",
    "CEAttack.lua",
	"CombatChoiceState.lua",
	"CombatTargetState.lua",
	"JumpingNumbers.lua",
	"AnimEntityFx.lua",
	"Formula.lua",
})
