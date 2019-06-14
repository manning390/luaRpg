Stats = {}
Stats.__index = Stats
function Stats:Create(stats)
    local this =
    {
        mBase = {},
        mModifiers = {}
    }

    for k, v in pairs(stats) do
        this.mBase[k] = v -- copy rather than set to avoid reference sharing
    end

    setmetatable(this, self)
    return this
end

function Stats:GetBase(id)
    return self.mBase[id]
end
