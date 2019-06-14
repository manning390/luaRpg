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
print(stats:GetBase("intelligence"))
print(stats:GetBase("hp_now"))

function update()
    local dt = GetDeltaTime(0)
end

