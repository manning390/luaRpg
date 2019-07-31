-- LoadLibrary("Asset")
-- Asset.Run("Dependencies.lua")

-- gRenderer = Renderer.Create()
-- gStack = StateStack:Create()
-- gWorld = World:Create()

-- gWorld.mParty:Add(Actor:Create(gPartyMemberDefs.hero))

-- gStack:Push(ExploreState:Create(gStack, CreateArenaMap(), Vector.Create(30, 18, 1)))

-- function update()
--     local dt = GetDeltaTime()
--     gStack:Update(dt)
--     gStack:Render(gRenderer)
--     gWorld:Update(dt)
-- end

LoadLibrary("System")
LoadLibrary("Renderer")
LoadLibrary("Asset")

Asset.Run("EventQueue.lua")

eventQueue = EventQueue:Create()

eventQueue:Add({ mName = "Msg: Welcome to the Arena"}, -1)
eventQueue:Add({ mName = "Take Turn Goblin" }, 5)
eventQueue:Add({ mName = "Take Turn Hero"}, 4)

eventQueue:Print()

function update() end
