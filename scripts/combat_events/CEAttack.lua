CEAttack = {}
CEAttack.__index = CEAttack
function CEAttack:Create(state, owner, def, targets)
    print("Target", target)

    local this =
    {
        mState = state,
        mOwner = owner,
        mDef = def,
        mIsFinished = false,
        mCharacter = state.mActorCharMap[owner],
        mTargets = targets,
    }

    this.mController = this.mCharacter.mController
    this.mController:Change(CSRunAnim.mName, {'prone'})
    this.mName = string.format("Attack for %s", this.mOwner.mName)

    setmetatable(this, self)

    local storyboard =
    {
        SOP.RunState(this.mController, CSMove.mName, {dir = 1}),
        SOP.RunState(this.mController, CSRunAnim.mName, {'attack', false}),
        SOP.Function(function() this:DoAttack() end),
        SOP.RunState(this.mController, CSMove.mName, {dir = -1}),
        SOP.Function(function() this:OnFinish() end),
    }

    this.mStoryboard = Storyboard:Create(this.mState.mStack, storyboard)

    return this
end

function CEAttack:TimePoints(queue)
    local speed = self.mOwner.mStats:Get("speed")
    return queue:SpeedToTimePoints(speed)
end

function CEAttack:OnFinish()
    self.mIsFinished = true
end

function CEAttack:Execute(queue)
    self.mState.mStack:Push(self.mStoryboard)

    for i = #self.mTargets, 1, -1 do
        local v = self.mTargets[i]
        local hp = v.mStats:Get("hp_now")
        if hp <= 0 then
            table.remove(self.mTargets, i)
        end
    end

    if not next(self.mTargets) then
        -- Find another enemy
        self.mTargets = CombatSelector.WeakestEnemy(self.mState)
    end
end

-- Handled by the storyboard
function CEAttack:Update() end

function CEAttack:DoAttack()
    for _, target in ipairs(self.mTargets) do
        self:AttackTarget(target)
    end
end

function CEAttack:AttackTarget(target)
    local stats = self.mOwner.mStats
    local enemyStats = target.mStats

    -- Simple attack get
    local attack = stats:Get("attack")
    attack = attack + stats:Get("strength")
    local defense = enemyStats:Get("defense")

    local damage = math.max(0, attack - defense)

    local hp = enemyStats:Get("hp_now") - damage
    enemyStats:Set("hp_now", math.max(0, hp))

    -- change actor's character to hurt state
    local character = self.mState.mActorCharMap[target]
    local controller = character.mController
    if damage > 0 then
        local state = controller.mCurrent
        if state.mName ~= "cs_hurt" then
            controller:Change("cs_hurt", state)
        end
    end

    self.mState:HandleDeath()
end

function CEAttack:IsFinished()
    return self.mIsFinished
end