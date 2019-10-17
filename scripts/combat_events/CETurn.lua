CETurn = {}
CETurn.__index = CETurn
function CETurn:Create(scene, owner)
    local this =
    {
        mScene = scene,
        mOwner = owner,
        mIsFinished = false
    }

    this.mName = string.format("Turn for %s", this.mOwner.mName)

    setmetatable(this, self)
    return this
end

function CETurn:TimePoints(queue)
    local speed = self.mOwner.mStats:Get("speed")
    return queue:SpeedToTimePoints(speed)
end

function CETurn:Execute(queue)

    if self.mState:IsPartMember(self.mOwner) then
        local state = CombatChoiceState:Create(self.mState, self.mOwner)
        self.mState.mStack:Push(state)
        self.mIsFinished = true
        return
    else
        -- 2. Am I an enemy
        -- Skip turn, we'll add AI later
        self.mIsFinished = true
        return
    end
end

function CETurn:Update() end

function CETurn:IsFinished()
    return self.mIsFinished
end