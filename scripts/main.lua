LoadLibrary("Asset")
Asset.Run("Dependencies.lua")

gRenderer = Renderer.Create()
gStack = StateStack:Create()
gWorld = World:Create()

-- local startPos = Vector.Create(5, 9, 1)
local startPos = Vector.Create(40, 60, 1)

local hero = Actor:Create(gPartyMemberDefs.hero)
local thief = Actor:Create(gPartyMemberDefs.thief)
local mage = Actor:Create(gPartyMemberDefs.mage)
gWorld.mParty:Add(hero)
gWorld.mParty:Add(thief)
gWorld.mParty:Add(mage)

gWorld.mGold = 500

do
	local caveMap = CreateCaveMap(gWorld.mGameState)
	gStack:Push(ExploreState:Create(gStack, caveMap, startPos))
end
-- gStack:Push(ExploreState:Create(gStack, CreateTownMap(), startPos))

local sayDef = { textScale = 1.3 }
local intro =
{
	SOP.BlackScreen(),
	SOP.RunAction("AddNPC", { "handin", { def = "thief", id = "thief", x = 4, y = 10}}, {GetMapRef}),
	SOP.RunAction("AddNPC", {"handin", { def = "mage", id = "mage", x = 6, y = 11}}, {GetMapRef}),
	SOP.FadeOutScreen(),
	SOP.MoveNPC("major", "handin",
		{
			"right",
			"right",
			"left",
			"left",
			"down"
		}),
	SOP.Say("handin", "major", "So, in conclusion...", 2.3, sayDef),
	SOP.Wait(0.75),
	SOP.Say("handin", "major", "Head north to the mine.", 2.3, sayDef),
	SOP.Wait(2),
	SOP.Say("handin", "major", "Find the skull ruby.", 2.5, sayDef),
	SOP.Wait(1.75),
	SOP.Say("handin", "major", "Then I'll give you the second half of your fee.", 3.5, sayDef),
	SOP.Wait(1.75),
	SOP.Say("handin", "major", "Do we have an agreement?", 3.0, sayDef),
	SOP.Wait(1),
	function(storyboard) -- Massive adlib here, and it worked
	    local continue = false
	    local OnSelect
	    local choiceParams =
	    {
	    	textScale = 1.2,
	    	choices =
	    	{
	    		options =
	    		{
	    			"Yes",
	    			"Also, yes"
	    		},
	    		OnSelection = function(index)
	    			print('lol')
	    			continue = true
	    		end
	    	},
	    }
	    gStack:PushFit(gRenderer, 0, 0, "What do you say?", 300, choiceParams)
    	return BlockUntilEvent:Create(function() return continue end)
	end,
	SOP.Wait(0.5),
	SOP.Say("handin", "major", "Good.", 1.0, sayDef),
	SOP.Wait(0.5),
	SOP.Say("handin", "major", "Here's the first half of the fee...", 3.0, sayDef),
	SOP.Wait(1),
	SOP.Say("handin", "major", "Now get going.", 2.5, sayDef),
	-- Party members can walk into the hero
	-- return control to the player
	SOP.NoBlock(
	    SOP.MoveNPC("thief", "handin", { "right", "up"})
    ),
    SOP.FadeOutChar("handin", "thief"),
    SOP.RunAction("RemoveNPC", {"handin", "thief"}, {GetMapRef}),
    SOP.NoBlock(
        SOP.MoveNPC("mage", "handin", { "left", "up", "up" })
    ),
    SOP.FadeOutChar("handin", "mage"),
    SOP.RunAction("RemoveNPC", {"handin", "mage"}, {GetMapRef}),
    SOP.Wait(0.1),
    SOP.HandOff("handin")
}

-- local storyboard = Storyboard:Create(gStack, intro, true)
-- local storyboard = Storyboard:Create(gStack, {SOP.HandOff("handin")}, true)
-- gStack:Push(storyboard)

function update()
    local dt = GetDeltaTime()
    gStack:Update(dt)
    gStack:Render(gRenderer)
    gWorld:Update(dt)

    if Keyboard.JustPressed(KEY_S) then
    	Save:Save()
    end
    if Keyboard.JustPressed(KEY_L) then
		Save:Load()
    end
end
