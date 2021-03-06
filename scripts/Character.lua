Character = {}
Character.__index = Character

function Character:Create(def, map)
    local entityDef = gEntities[def.entity]
    assert(entityDef) -- The endity def should always exist!

    local this =
    {
        mDef = def,
        mEntity = Entity:Create(entityDef),
        mAnims = def.anims,
        mFacing = def.facing,
        mDefaultState = def.state,

    }

    setmetatable(this, self)

    -- Create the controler states from the def
    local states = {}
    -- Make the controller state machine from the states
    this.mController = StateMachine:Create(states)

    for _, name in ipairs(def.controller) do
        local state = gCharacterStates[name]
        assert(state)
        assert(states[state.mName] == nil) -- State already in use!
        local instance = state:Create(this, map)
        states[state.mName] = function() return instance end
    end

    this.mController.mStates = states

    -- Change the statemachine to the initial state
    -- as defined in the def
    this.mController:Change(def.state)

    return this
end

function Character:GetFacedTileCoords()

    -- Change the facing information into a tile offset
    local xInc = 0
    local yInc = 0

    if self.mFacing == "left" then
        xInc = -1
    elseif self.mFacing == "right" then
        xInc = 1
    elseif self.mFacing == "up" then
        yInc = -1
    elseif self.mFacing == "down" then
        yInc = 1
    end

    local x = self.mEntity.mTileX + xInc
    local y = self.mEntity.mTileY + yInc

    return x, y
end

function Character:FollowPath(path)
    self.mPathIndex = 1
    self.mPath = path
    self.mPrevDefaultState = self.mDefaultState
    self.mDefaultState = "follow_path"
    self.mController:Change("follow_path")
end

function Character:GetCombatAnim(id)
    if self.mAnims and self.mAnims[id] then
        return self.mAnims[id]
    else
        return { self.mEntity.mStartFrame }
    end
end