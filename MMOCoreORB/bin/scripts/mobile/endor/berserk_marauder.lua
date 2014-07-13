berserk_marauder = Creature:new {
	objectName = "@mob/creature_names:berserk_marauder",
	socialGroup = "endor_marauder",
	pvpFaction = "endor_marauder",
	faction = "endor_marauder",
	level = 55,
	chanceHit = 0.55,
	damageMin = 495,
	damageMax = 700,
	baseXp = 5373,
	baseHAM = 9600,
	baseHAMmax = 11800,
	armor = 0,
	resists = {40,40,0,-1,0,0,-1,-1,-1},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_feral_marauder.iff"},
	lootGroups = {},
	weapons = {"pirate_weapons_medium"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(berserk_marauder, "berserk_marauder")
