SpecialDB = {
	['slash'] =
	{
		name = "Slash",
		mp_cost = 15,
		action = "slash",
		time_points = 20,
		target =
		{
			selector = "SideEnemy",
			switch_side = false,
			type = "Side"
		}
	},
	['steal'] =
	{
		name = "Steal",
		mp_cost = 0,
		action = "steal",
		time_points = 20,
		target =
		{
			selector = "WeakestEnemy",
			switch_side = false,
			type = "One"
		}
	}
}
SpecialDB.__index = SpecialDB
