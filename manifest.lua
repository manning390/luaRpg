--
-- A manifest of all the game's assets test
--
manifest = {
    textures = {
        ['cave.png'] = { path = "sprites/cave16x16.png" },
        ['rpg_indoor.png'] = { path = "sprites/rpg_indoor.png" },
        ['collision_graphic.png'] = { path = "assets/collision_graphic.png" },
        ['walk_cycle.png'] = { path = "sprites/walk_cycle.png" },
        ['simple_panel.png'] =
        {
            path = "sprites/simple_panel.png",
            scale = "pixelart"
        },
        ['gradient_panel.png'] = { path = "sprites/gradient_panel.png" },
        ['avatar.png'] =
        {
            path = "sprites/avatar.png",
            scale = "pixelart"
        },
        ['continue_caret.png'] =
        {
            path = "sprites/continue_caret.png",
            scale = "pixelart"
        },
        ['cursor.png'] =
        {
            path = "sprites/cursor.png",
            scale = "pixelart"
        },
        ['foreground.png'] = { path = "sprites/foreground.png"},
        ['background.png'] = { path = "sprites/background.png"},
        ['scrollbar.png'] = { path = "sprites/scrollbar.png" },
        ['inventory_icons.png'] = { path = "sprites/inventory_icons.png" },
        ['tileset_sontos_house.png'] = { path = "sprites/tileset_sontos_house.png" },
        ['tileset_jail.png'] = { path = "sprites/tileset_jail.png" },
        ['sleeping.png'] = { path = "sprites/sleeping.png" },
        ['tileset_sewer.png'] = { path = "sprites/tileset_sewer.png" },
        ['title_screen.png'] = { path = "sprites/title_screen.png" },
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
		['SleepState.lua'] = { path = 'scripts/SleepState.lua' },
		['FollowPathState.lua'] = { path = 'scripts/FollowPathState.lua' },
        ['map_sontos_house.lua'] = { path = 'assets/map_sontos_house.lua' },
		['GameOverState.lua'] = { path = 'scripts/GameOverState.lua' },
		['map_sewer.lua'] = { path = 'assets/map_sewer.lua' },
        ['map_jail.lua'] = { path = 'assets/map_jail.lua' },
        ['MapDB.lua'] = { path = 'scripts/MapDB.lua' },
        ['Stats.lua'] = { path = 'scripts/Stats.lua' },
        ['TitleScreenState.lua'] = { path = 'scripts/TitleScreenState.lua' },
    },
}
