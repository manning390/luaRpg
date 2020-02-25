--
-- A manifest of all the game's assets test
--
manifest = {
    textures = {
        ['cave.png'] = { path = "sprites/cave16x16.png" },
        ['cave_tileset.png'] = { path = "sprites/cave_tileset.png" },
        ['rpg_indoor.png'] = { path = "sprites/rpg_indoor.png" },
        ['collision_graphic.png'] = { path = "assets/collision_graphic.png" },
        ['walk_cycle.png'] = { path = "sprites/walk_cycle.png" },
        ['simple_panel.png'] = { path = "sprites/simple_panel.png", scale = "pixelart" },
        ['gradient_panel.png'] = { path = "sprites/gradient_panel.png" },
        ['hero_portrait.png'] =  { path = "sprites/hero_portrait.png",  scale = "pixelart" },
        ['mage_portrait.png'] =  { path = "sprites/mage_portrait.png",  scale = "pixelart" },
        ['thief_portrait.png'] = { path = "sprites/thief_portrait.png", scale = "pixelart" },
        ['continue_caret.png'] = { path = "sprites/continue_caret.png", scale = "pixelart" },
        ['up_caret.png'] = { path = "sprites/up_caret.png", scale = "pixelart" },
        ['cursor.png'] = { path = "sprites/cursor.png", scale = "pixelart" },
        ['foreground.png'] = { path = "sprites/foreground.png" },
        ['background.png'] = { path = "sprites/background.png" },
        ['hpforeground.png'] = { path = "sprites/hpforeground.png" },
        ['hpbackground.png'] = { path = "sprites/hpbackground.png" },
        ['mpforeground.png'] = { path = "sprites/mpforeground.png" },
        ['mpbackground.png'] = { path = "sprites/mpbackground.png" },
        ['xpforeground.png'] = { path = "sprites/xpforeground.png" },
        ['xpbackground.png'] = { path = "sprites/xpbackground.png" },
        ['scrollbar.png'] = { path = "sprites/scrollbar.png" },
        ['inventory_icons.png'] = { path = "sprites/inventory_icons.png", scale = "pixelart" },
        ['town_tileset.png'] = { path = "sprites/town_tileset.png" },
        ['sleeping.png'] = { path = "sprites/sleeping.png" },
        ['tileset_sewer.png'] = { path = "sprites/tileset_sewer.png" },
        ['title_screen.png'] = { path = "sprites/title_screen.png" },
        ['chest.png'] = { path = "sprites/chest.png" },
        ['arena_background.png'] = { path = "sprites/arena_background.png" },
        ['combat_bg_field.png'] = { path = "sprites/combat_bg_field.png" },
        ['combat_bg_forest.png'] = { path = "sprites/combat_bg_forest.png" },
        ['combat_hero.png'] = { path = "sprites/combat_hero.png" },
        ['combat_thief.png'] = { path = "sprites/combat_thief.png" },
        ['combat_mage.png'] = { path = "sprites/combat_mage.png" },
        ['goblin.png'] = { path = "sprites/goblin.png" },
        ['goblin_field.png'] = { path = "sprites/goblin_field.png" },
        ['goblin_forest.png'] = { path = "sprites/goblin_forest.png" },
        ['ogre.png'] = { path = "sprites/ogre.png" },
        ['green_dragon.png'] = { path = "sprites/green_dragon.png" },
        ['combat_slash.png'] = { path = "sprites/combat_slash.png" },
        ['combat_claw.png'] = { path = "sprites/combat_claw.png" },
        ['fx_use_item.png'] = { path = "sprites/fx_use_item.png" },
        ['fx_restore_hp.png'] = { path = "sprites/fx_restore_hp.png" },
        ['fx_restore_mp.png'] = { path = "sprites/fx_restore_mp.png" },
        ['fx_revive.png'] = { path = "sprites/fx_revive.png" },
        ['fx_fire.png'] = { path = "sprites/fx_fire.png" },
        ['fx_electric.png'] = { path = "sprites/fx_electric.png" },
        ['fx_ice.png'] = { path = "sprites/fx_ice.png" },
        ['world_tileset.png'] = { path = "sprites/world_tileset.png" },
        ['cave_drake.png'] = { path = "sprites/cave_drake.png" },
        ['cave_bat.png'] = { path = "sprites/cave_bat.png" },
        ['cave_shade.png'] = { path = "sprites/cave_shade.png" },
        ['combat_bg_cave.png'] = { path = "sprites/combat_bg_cave.png" },
        ['door.png'] = { path = "sprites/door.png" },
        ['sphere.png'] = { path = "sprites/sphere.png" },
        ['teleport.png'] = { path = "sprites/teleport.png" },
    },
    ['fonts'] = {
        ["default"] = { path = "fonts/junction.ttf" },
        ["title"] = { path = "fonts/contra_italic.ttf" }
    },
    ['sounds'] = {
        ['rain'] = { path = "sounds/rain.wav" },
        ['door_break'] = { path = "sounds/door_break.wav" },
        ['wagon'] = { path = "sounds/wagon.wav" },
        ['wind'] = { path = "sounds/wind.wav" },
        ['bell'] = { path = "sounds/bell.wav" },
        ['crumble'] = { path = "sounds/crumble.wav" },
        ['key_item'] = { path = "sounds/key_item.wav" },
        ['skeleton_destroy'] = { path = "sounds/skeleton_destroy.wav" },
        ['grate'] = { path = "sounds/grate.wav" },
        ['reveal'] = { path = "sounds/reveal.wav" },
        ['unlock'] = { path = "sounds/unlock.wav" },
    },
    scripts = {
        ['main.lua'] = { path = "scripts/main.lua" },
        ['Dependencies.lua'] = { path = "scripts/Dependencies.lua" },
        ['gui_main.lua'] = { path = "scripts/gui_main.lua" },
        ['Map.lua'] = { path = "scripts/Map.lua" },
        ['Character.lua'] = { path = "scripts/Character.lua" },
        ['Util.lua'] = { path = "scripts/Util.lua" },
        ['Entity.lua'] = { path = "scripts/Entity.lua" },
        ['EntityDefs.lua'] = { path = "scripts/EntityDefs.lua" },
        ['Animation.lua'] = { path = "scripts/Animation.lua" },
        ['Actions.lua'] = { path = "scripts/Actions.lua" },
        ['Trigger.lua'] = { path = "scripts/Trigger.lua" },
        ['Tween.lua'] = { path = "scripts/Tween.lua" },
        ['StateMachine.lua'] = { path = "scripts/StateMachine.lua" },
        ['WaitState.lua'] = { path = "scripts/WaitState.lua" },
        ['MoveState.lua'] = { path = "scripts/MoveState.lua" },
        ['FadeState.lua'] = { path = "scripts/FadeState.lua" },
        ['NPCStandState.lua'] = { path = "scripts/NPCStandState.lua" },
        ['PlanStrollState.lua'] = { path = "scripts/PlanStrollState.lua" },
        ['Panel.lua'] = { path = "scripts/Panel.lua" },
        ['Textbox.lua'] = { path = "scripts/Textbox.lua" },
        ['Selection.lua'] = { path = "scripts/Selection.lua" },
        ['ProgressBar.lua'] = { path = "scripts/ProgressBar.lua" },
        ['Scrollbar.lua'] = { path = "scripts/Scrollbar.lua" },
        ['StateStack.lua'] = { path = "scripts/StateStack.lua" },
        ['ExploreState.lua'] = { path = "scripts/ExploreState.lua" },
        ['Layout.lua'] = { path = "scripts/Layout.lua" },
        ['InGameMenuState.lua'] = { path = "scripts/InGameMenuState.lua" },
        ['FrontMenuState.lua'] = { path = "scripts/FrontMenuState.lua" },
        ['World.lua'] = { path = "scripts/World.lua" },
        ['ItemDB.lua'] = { path = "scripts/ItemDB.lua" },
        ['Icons.lua'] = { path = "scripts/Icons.lua" },
        ['ItemMenuState.lua'] = { path = "scripts/ItemMenuState.lua" },
        ['Storyboard.lua'] = { path = "scripts/Storyboard.lua" },
        ['StoryboardEvents.lua'] = { path = "scripts/StoryboardEvents.lua" },
        ['ScreenState.lua'] = { path = "scripts/ScreenState.lua" },
		['CaptionState.lua'] = { path = 'scripts/CaptionState.lua' },
		['CaptionStyles.lua'] = { path = 'scripts/CaptionStyles.lua' },
		['FollowPathState.lua'] = { path = 'scripts/FollowPathState.lua' },
		['GameOverState.lua'] = { path = 'scripts/GameOverState.lua' },
        ['MapDB.lua'] = { path = 'scripts/MapDB.lua' },
		['Dice.lua'] = { path = 'scripts/Dice.lua' },
        ['Stats.lua'] = { path = 'scripts/Stats.lua' },
        ['Actor.lua'] = { path = 'scripts/Actor.lua' },
		['PartyMemberDefs.lua'] = { path = 'scripts/PartyMemberDefs.lua' },
		['Party.lua'] = { path = 'scripts/Party.lua' },
		['LevelFunction.lua'] = { path = 'scripts/LevelFunction.lua' },
		['ActorSummary.lua'] = { path = 'scripts/ActorSummary.lua' },
        ['StatDefs.lua'] = { path = 'scripts/StatDefs.lua' },
        ['TitleScreenState.lua'] = { path = 'scripts/TitleScreenState.lua' },
        ['StatusMenuState.lua'] = { path = 'scripts/StatusMenuState.lua' },
        ['EquipMenuState.lua'] = { path = 'scripts/EquipMenuState.lua' },
        ['EventQueue.lua'] = { path = 'scripts/EventQueue.lua' },
        ['CETurn.lua'] = { path = 'scripts/combat_events/CETurn.lua' },
        ['CEAttack.lua'] = { path = 'scripts/combat_events/CEAttack.lua' },
        ['CombatScene.lua'] = { path = 'scripts/CombatScene.lua' },
        ['CombatState.lua'] = { path = 'scripts/CombatState.lua' },
		['EnemyDefs.lua'] = { path = 'scripts/EnemyDefs.lua' },
        ['CSRunAnim.lua'] = { path = 'scripts/combat_states/CSRunAnim.lua' },
		['CSHurt.lua'] = { path = 'scripts/combat_states/CSHurt.lua' },
		['CSMove.lua'] = { path = 'scripts/combat_states/CSMove.lua' },
        ['CSStandby.lua'] = { path = 'scripts/combat_states/CSStandby.lua' },
        ['CombatChoiceState.lua'] = { path = 'scripts/CombatChoiceState.lua' },
        ['CombatTargetState.lua'] = { path = 'scripts/CombatTargetState.lua' },
		['CSEnemyDie.lua'] = { path = 'scripts/combat_states/CSEnemyDie.lua' },
        ['CSEnemyHurt.lua'] = { path = 'scripts/combat_states/CSEnemyHurt.lua' },
		['JumpingNumbers.lua'] = { path = 'scripts/fx/JumpingNumbers.lua' },
		['AnimEntityFx.lua'] = { path = 'scripts/fx/AnimEntityFx.lua' },
		['XPPopUp.lua'] = { path = 'scripts/XPPopUp.lua' },
		['ActorXPSummary.lua'] = { path = 'scripts/ActorXPSummary.lua' },
		['XPSummaryState.lua'] = { path = 'scripts/XPSummaryState.lua' },
		['LootSummaryState.lua'] = { path = 'scripts/LootSummaryState.lua' },
		['OddmentTable.lua'] = { path = 'scripts/OddmentTable.lua' },
		['CombatFormula.lua'] = { path = 'scripts/CombatFormula.lua' },
		['CombatTextFx.lua'] = { path = 'scripts/fx/CombatTextFx.lua' },
		['CEFlee.lua'] = { path = 'scripts/combat_events/CEFlee.lua' },
		['BrowseListState.lua'] = { path = 'scripts/BrowseListState.lua' },
		['CEUseItem.lua'] = { path = 'scripts/combat_events/CEUseItem.lua' },
		['CombatActions.lua'] = { path = 'scripts/CombatActions.lua' },
		['SpellDB.lua'] = { path = 'scripts/SpellDB.lua' },
		['CECastSpell.lua'] = { path = 'scripts/combat_events/CECastSpell.lua' },
		['SpecialDB.lua'] = { path = 'scripts/SpecialDB.lua' },
		['CESlash.lua'] = { path = 'scripts/combat_events/CESlash.lua' },
		['CESteal.lua'] = { path = 'scripts/combat_events/CESteal.lua' },
		['ArenaState.lua'] = { path = 'scripts/ArenaState.lua' },
		['ArenaCompleteState.lua'] = { path = 'scripts/ArenaCompleteState.lua' },
        ['map_town.lua'] = { path = 'assets/map_town.lua' },
        ['map_world.lua'] = { path = 'assets/map_world.lua' },
        ['map_cave.lua'] = { path = 'assets/map_cave.lua' },
		['ShopState.lua'] = { path = 'scripts/ShopState.lua' },
		['DefaultGameState.lua'] = { path = 'scripts/DefaultGameState.lua' },
		['SaveScheme.lua'] = { path = 'scripts/SaveScheme.lua' },
		['Save.lua'] = { path = 'scripts/Save.lua' },
        ['PrintTable.lua'] = { path = 'scripts/PrintTable.lua' },
        ['Blob.lua'] = { path = 'scripts/Blob.lua' },
    },
}
