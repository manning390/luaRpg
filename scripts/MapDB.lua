assert(CreateHouseMap)
assert(CreateJailMap)
assert(CreateSewerMap)
MapDB = {
    ["player_house"] = CreateHouseMap,
    ["jail"] = CreateJailMap,
    ["sewer"] = CreateSewerMap,
}
