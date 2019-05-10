FrontMenuState = {}
FrontMenuState.__index = FrontMenuState
function FrontMenuState:Create(parent, world)
    local layout = Layout:Create()
    layout:Contract('screen', 118, 40)
    layout:SplitHorz('screen', 'top',  'bottom', 0.12,  2)
    layout:SplitVert('bottom', 'left', 'party',  0.726, 2)
    layout:SplitHorz('left',   'menu', 'gold',   0.7,   2)

    local this
    this  =
    {
        mParent = parent,
        mStack = parent.mStack,
        mStateMachine = parent.mStateMachine,
        mLayout = layout,

        mSelections = Selection:Create
        {
            spacingY = 32,
            data =
            {
                "Items",
                -- "Magic",
                -- "Equipment",
                -- "Status",
                -- "Save",
            }
            OnSelection = function(...) this:OnMenuclick(...) end
        },

        mPanels =
        {
            layout:CreatePanel("gold"),
            layout:CreatePanel("top"),
            layout:CreatePanel("party"),
            layout:CreatePanel("menu"),
        }
        mTopBarText = "Current Map Name"
    }

    setmetatable(this, self)
    return this
end
