InGameMenuState = {}
InGameMenuState.__index = InGameMenuState
function InGameMenuState:Create(stack)
    local this =
    {
        mStack = stack
    }
    this.mStateMachine = StateMachine:Create
    {
        ["frontmenu"] =
        function()
            return FrontMenuState:Create(this)
        end,
        ["item"] =
        function()
            -- return ItemMenuState:Create(this)
            return this.mStateMachine.mEmpty
        end,
        ["magic"] =
        function()
            -- return MagicMenuState:Create(this)
            return this.mStateMachine.mEmpty
        end,
        ["equip"] =
        function()
            -- return EquipMenuState:Create(this)
            return this.mStateMachine.mEmpty
        end,
        ["status"] =
        function()
            -- return StatusMenuState:Create(this)
            return this.mStateMachine.mEmpty
        end,
    }
    this.mStateMachine:Change("frontmenu")

    setmetatable(this, self)
    return this
end

function InGameMenuState:Update(dt)
    if self.mStack:Top() == self then
        self.mStateMachine:Update(dt)
    end
end

function InGameMenuState:Render(renderer)
    self.mStateMachine:Render(renderer)
end

function EquipMenuState:Enter() end
function EquipMenuState:Exit() end
function EquipMenuState:HandleInput() end
