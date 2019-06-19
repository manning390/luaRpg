LoadLibrary("Asset")
Asset.Run("Dependencies.lua")

gRenderer = Renderer:Create()

local stats =
Stats:Create
{
    ["hp_now"] = 300,
    ["hp_max"] = 300,
    ["mp_now"] = 300,
    ["mp_max"] = 300,
    ["strength"] = 10,
    ["speed"] = 10,
    ["intelligence"] = 10,
}

function PrintStat(id)
    local base = stats:GetBase(id)
    local full = stats:Get(id)
    local str = string.format("%s>%d:%d", id, base, full)
    print(str)
end
magic_hat =
{
    id = 1,
    modifier =
    {
        add =
        {
            ["strength"] = 5
        },
    }
}
magic_sword =
{
    id = 2,
    modifier =
    {
        add =
        {
            ["strength"] = 5,
        },
    }
}
spell_bravery =
{
    id = "bravery",
    modifier =
    {
        mult =
        {
            ["strength"] = 0.1
        }
    }
}
spell_curse =
{
    id = "curse",
    modifier =
    {
        mult =
        {
            ["strength"] = -0.5
        }
    }
}
stats:AddModifier(magic_hat.id, magic_hat.modifier)
stats:AddModifier(magic_sword.id, magic_sword.modifier)
stats:AddModifier(spell_bravery.id, spell_bravery.modifier)
stats:AddModifier(spell_curse.id, spell_curse.modifier)

PrintStat("strength")

function update()
    local dt = GetDeltaTime(0)
end

