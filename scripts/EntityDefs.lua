-- WaitState, MoveState must already be loaded.
assert(WaitState)
assert(MoveState)

-- Text Id -> Controller State
gCharacterStates =
{
    wait = WaitState,
    move = MoveState,
    npc_stand = NPCStandState,
    plan_stroll = PlanStrollState,
    follow_path = FollowPathState,
    cs_run_anim = CSRunAnim,
    cs_hurt = CSHurt,
    cs_move = CSMove,
    cs_standby = CSStandby,
    cs_die_enemy = CSEnemyDie,
    cs_hurt_enemy = CSEnemyHurt,
}

gEntities =
{
    hero =
    {
        texture     = "walk_cycle.png",
        width       = 16,
        height      = 24,
        startFrame  = 9,
        tileX       = 11,
        tileY       = 3,
        layer       = 1
    },
    thief =
    {
        texture ="walk_cycle.png",
        width = 16,
        height = 24,
        startFrame = 41,
        tileX = 11,
        tileY = 3,
        layer = 1
    },
    mage =
    {
        texture ="walk_cycle.png",
        width = 16,
        height = 24,
        startFrame = 25,
        tileX = 11,
        tileY = 3,
        layer = 1
    },
    chest =
    {
        texture = "chest.png",
        width = 16,
        height = 16,
        startFrame = 1,
        openFrame = 2,
    },
    combat_hero =
    {
        texture = "combat_hero.png",
        width = 64,
        height = 64,
        startFrame = 37,
    },
    combat_thief = {
        texture = "combat_thief.png",
        width = 64,
        height = 64,
        startFrame = 37,
    },
    combat_mage =
    {
        texture = "combat_mage.png",
        width = 64,
        height = 64,
        startFrame = 37,
    },
    goblin =
    {
        texture = "goblin.png",
        width = 32,
        height = 32,
        startFrame = 1,
    },
    slash =
    {
        texture = "combat_slash.png",
        width = 64,
        height = 64,
        startFrame = 3,
        frames = {3, 2, 1}
    },
    claw =
    {
        texture = "combat_claw.png",
        width = 64,
        height = 64,
        startFrame = 1,
        frames = {1, 2, 3}
    },
    fx_restore_hp =
    {
        texture = "fx_restore_hp.png",
        width = 16,
        height = 16,
        startFrame = 1,
        frames = {1, 2, 3, 4, 5}
    },
    fx_restore_mp =
    {
        texture = "fx_restore_mp.png",
        width = 16,
        height = 16,
        startFrame = 1,
        frames = {1, 2, 3, 4, 5, 6}
    },
    fx_revive =
    {
        texture = "fx_revive.png",
        width = 16,
        height = 16,
        startFrame = 1,
        frames = {1, 2, 3, 4, 5, 6, 7, 8}
    },
    fx_use_item =
    {
        texture = "fx_use_item.png",
        width = 16,
        height = 16,
        startFrame = 1,
        frames = {1, 2, 3, 4, 4, 3, 2, 1}
    },
    fx_fire =
    {
        texture = "fx_fire.png",
        width = 32,
        height = 48,
        startFrame = 1,
        frames = {1, 2, 3}
    },
    fx_electric =
    {
        texture = "fx_electric.png",
        width = 32,
        height = 16,
        startFrame = 1,
        frames = {1, 2, 3}
    },
    fx_ice_1 =
    {
        texture = "fx_ice.png",
        width = 16,
        height = 16,
        startFrame = 1,
        frames = {1, 2, 3, 4}
    },
    fx_ice_2 =
    {
        texture = "fx_ice.png",
        width = 16,
        height = 16,
        startFrame = 5,
        frames = {5, 6, 7, 8}
    },
    fx_ice_3 =
    {
        texture = "fx_ice.png",
        width = 16,
        height = 16,
        startFrame = 9,
        frames = {9, 10, 11, 12}
    },
    fx_ice_spark =
    {
        texture = "fx_ice.png",
        width = 16,
        height = 16,
        startFrame = 13,
        frames = {13, 14, 15, 16}
    },
}

gCharacters =
{
    hero =
    {
        actorId = "hero",
        entity = "hero",
        combatEntity = "combat_hero",
        anims =
        {
            up      = {1, 2, 3, 4},
            right   = {5, 6, 7, 8},
            down    = {9, 10, 11, 12},
            left    = {13, 14, 15, 16},
            prone   = {19, 20},
            attack  = {5, 4, 3, 2, 1},
            use     = {46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57},
            hurt    = {21, 22, 23, 24},
            standby = {36, 37, 38, 39},
            advance = {36, 37, 38, 39},
            retreat = {61, 62, 63, 64},
            death   = {26, 27, 28, 29},
            victory = {6, 7, 8, 9},
            slash = {11, 12, 13, 14, 15, 16, 17, 18, 11},
        },
        facing = "down",
        controller = {
            "wait",
            "move",
            "cs_run_anim",
            "cs_hurt",
            "cs_move",
            "cs_standby",
        },
        state = "wait",
    },
    thief =
    {
        actorId = "thief",
        entity = "thief",
        combatEntity = "combat_thief",
        anims =
        {
            up      = {33, 34, 35, 36},
            right   = {37, 38, 39, 40},
            down    = {41, 42, 43, 44},
            left    = {45, 46, 47, 48},
            prone   = {9, 10},
            attack  = {1, 2, 3, 4, 5, 6, 7, 8},
            use     = {11, 12, 13, 14, 15, 16, 17, 18, 19, 20},
            hurt    = {21, 22, 23, 24, 25, 33, 34},
            standby = {36, 37, 38, 39},
            advance = {36, 37, 38, 39},
            retreat = {61, 62, 63, 64},
            death   = {26, 27, 28, 29, 30, 31, 32},
            victory = {56, 57, 58, 59, 60, 40},
            steal_1 = {41, 42, 43, 44, 45},
            steal_2 = {46, 47, 48, 49, 50, 51, 52, 53},
            steal_3 = {49, 48, 43, 44, 45},
            steal_4 = {45, 44, 43, 42, 41},
            steal_success = {54},
            steal_failure = {55}
        },
        facing = "down",
        controller = {
            "npc_stand",
            "cs_run_anim",
            "cs_hurt",
            "cs_move",
            "cs_standby"
        },
        state = "npc_stand",
    },
    mage =
    {
        actorId = "mage",
        entity = "mage",
        combatEntity = "combat_mage",
        anims =
        {
            up      = {17, 18, 19, 20},
            right   = {21, 22, 23, 24},
            down    = {25, 26, 27, 28},
            left    = {29, 30, 31, 32},
            prone   = {51, 52},
            attack  = {1, 2, 3, 4, 5, 6, 7},
            use     = {41, 42, 43, 44, 45, 46, 47, 48},
            hurt    = {8, 9, 10, 21, 22, 23},
            standby = {36, 37, 38, 39},
            advance = {36, 37, 38, 39},
            retreat = {61, 62, 63, 64},
            death   = {26, 27, 28, 29, 30, 31, 32, 33, 34},
            victory = {56, 57, 58, 59, 60, 53, 54, 55, 49, 50, 40, 35},
            cast = {11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 25},
        },
        facing = "down",
        controller = {
            "npc_stand",
            "cs_run_anim",
            "cs_hurt",
            "cs_move",
            "cs_standby"
        },
        state = "npc_stand",
    },
    goblin =
    {
        entity = "goblin",
        controller = {
            "cs_run_anim",
            "cs_standby",
            "cs_die_enemy",
            "cs_hurt_enemy",
            "cs_move"
        },
        state = "cs_standby"
    }
}
