death_watch_overlord = Creature:new {
	objectName = "",
	customName = "Drartih Oure (a Death Watch Overlord)",
	socialGroup = "death_watch",
	pvpFaction = "",
	faction = "",
	level = 221,
	chanceHit = 190,
	damageMin = 1245,
	damageMax = 2200,
	baseXp = 20948,
	baseHAM = 350000,
	baseHAMmax = 350000,
	armor = 3,
	resists = {80,80,90,80,45,45,100,70,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_death_watch_gold.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_overlord_shared", chance =  10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "death_watch_bunker_overlord_shared", chance =  500000},
				{group = "death_watch_bunker_overlord_quest", chance  = 9500000}
			},
			lootChance = 5000000
		}
	},
	weapons = {"dark_trooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(death_watch_overlord, "death_watch_overlord")
