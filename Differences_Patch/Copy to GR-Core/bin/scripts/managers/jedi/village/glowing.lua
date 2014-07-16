local ObjectManager = require("managers.object.object_manager")
local OldManEncounter = require("managers.jedi.village.old_man_encounter")
local VillageJediManagerCommon = require("managers.jedi.village.village_jedi_manager_common")

Glowing = Object:new {}

TOTALNUMBEROFBADGESREQUIRED = 39 --39
NUMBEROFJEDIBADGESREQUIRED = 30 --30
NUMBEROFDIFFICULTBADGESREQUIRED = 7 --7
NUMBEROFEASYBADGESREQUIRED = 2 --2

JEDIBADGES = {
	EXP_TAT_TUSKEN_POOL,
	EXP_TAT_ESCAPE_POD,
	EXP_TAT_SARLACC_PIT,
	EXP_TAT_LARS_HOMESTEAD,
	EXP_NAB_GUNGAN_SACRED_PLACE,
	EXP_COR_AGRILAT_SWAMP,
	EXP_YAV_TEMPLE_WOOLAMANDER,
	EXP_YAV_TEMPLE_BLUELEAF,
	EXP_LOK_VOLCANO,
	EXP_DAT_TARPIT,
	EXP_DAT_SARLACC,
	EXP_DAT_ESCAPE_POD,
	EXP_DAN_REBEL_BASE,
	BDG_EXP_NAB_THEED_FALLS_BOTTOM,
	BDG_EXP_NAB_DEEJA_FALLS_TOP,
	BDG_EXP_NAB_AMIDALAS_SANDY_BEACH,
	BDG_EXP_COR_REBEL_HIDEOUT,
	BDG_EXP_COR_ROGUE_CORSEC_BASE,
	BDG_EXP_COR_TYRENA_THEATER,
	BDG_EXP_COR_BELA_VISTAL_FOUNTAIN,
	BDG_EXP_DAT_CRASHED_SHIP,
	BDG_EXP_DAT_IMP_PRISON,
	BDG_EXP_DAN_DANTARI_VILLAGE1,
	BDG_EXP_DAN_DANTARI_VILLAGE2,
	BDG_EXP_END_EWOK_TREE_VILLAGE,
	BDG_EXP_END_EWOK_LAKE_VILLAGE,
	BDG_EXP_END_DULOK_VILLAGE,
	BDG_EXP_END_IMP_OUTPOST,
	BDG_EXP_TAL_CREATURE_VILLAGE,
	BDG_EXP_TAL_IMP_BASE,
	BDG_EXP_TAL_IMP_VS_REB_BATTLE,
	BDG_EXP_TAL_AQUALISH_CAVE,
	BDG_EXP_ROR_KOBALA_SPICE_MINE,
	BDG_EXP_ROR_REBEL_OUTPOST,
	COUNT_5,
	COUNT_10,
	COUNT_25,
	COUNT_50,
	COUNT_75,
	BDG_EXP_10_BADGES,
	BDG_EXP_20_BADGES,
	BDG_EXP_40_BADGES,
	BDG_EXP_45_BADGES
}

DIFFICULTBADGES = {
	EXP_TAT_KRAYT_GRAVEYARD,
	EXP_TAT_KRAYT_SKELETON,
	EXP_TAT_BENS_HUT,
	EXP_DAT_MISTY_FALLS_1,
	EXP_DAT_MISTY_FALLS_2,
	EXP_DAN_JEDI_TEMPLE,
	BDG_EXP_30_BADGES
}

EASYBADGES = {
	BDG_THM_PARK_JABBA_BADGE,
	BDG_THM_PARK_IMPERIAL_BADGE,
	BDG_THM_PARK_REBEL_BADGE
}
-- Count the number of badges that the player got in the list.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param list the list of badge numbers to check if the player has.
-- @param upperLimit only count up to this limit.
-- @return the number of badges in the list that the player has been awarded
function Glowing:countBadgesInListToUpperLimit(pCreatureObject, list, upperLimit)
	local numberOfBadges = 0
	ObjectManager.withCreaturePlayerObject(pCreatureObject, function(playerObject)
		for i = 1, table.getn(list), 1 do
			if playerObject:hasBadge(list[i]) then
				numberOfBadges = numberOfBadges + 1
				if numberOfBadges >= upperLimit then
					break
				end
			end
		end
	end)
	return numberOfBadges
end

-- Count the total number of badges towards the jedi progression for the player
-- @param pCreatureObject pointer to the creature object of the player.
-- @return the total number of interesting badges.
function Glowing:countBadges(pCreatureObject)
	local jediBadges = self:countBadgesInListToUpperLimit(pCreatureObject, JEDIBADGES, NUMBEROFJEDIBADGESREQUIRED)
	local difficultBadges = self:countBadgesInListToUpperLimit(pCreatureObject, DIFFICULTBADGES, NUMBEROFDIFFICULTBADGESREQUIRED)
	local easyBadges = self:countBadgesInListToUpperLimit(pCreatureObject, EASYBADGES, NUMBEROFEASYBADGESREQUIRED)
	return jediBadges + difficultBadges + easyBadges
end

-- Check if the player is glowing or not.
-- @param pCreatureObject pointer to the creature object of the player.
function Glowing:isGlowing(pCreatureObject)
	local player = LuaCreatureObject(pCreatureObject)
	local pInventory = player:getSlottedObject("inventory")
	if self:countBadges(pCreatureObject) >= TOTALNUMBEROFBADGESREQUIRED then
		VillageJediManagerCommon.setJediProgressionScreenPlayState(pCreatureObject, VILLAGE_JEDI_PROGRESSION_GLOWING)
		--giveItem(pInventory, "object/tangible/loot/quest/force_sensitive/force_crystal.iff", -1)
		player:sendSystemMessage("Congratulations on becoming GLOWY! Go to any force shrine to continue your progress towards Jedi.")
	end
end

-- Event handler for the BADGEAWARDED event.
-- @param pCreatureObject pointer to the creature object of the player who was awarded with a badge.
-- @param pCreatureObject2 pointer to the creature object of the player who was awarded with a badge.
-- @param badgeNumber the badge number that was awarded.
-- @return 0 to keep the observer active.
function Glowing:badgeAwardedEventHandler(pCreatureObject, pCreatureObject2, badgeNumber)
	self:isGlowing(pCreatureObject)

	return 0
end

-- Register observer on the player for observing badge awards.
-- @param pCreatureObject pointer to the creature object of the player to register observers on.
function Glowing:registerObservers(pCreatureObject)
	createObserver(BADGEAWARDED, "Glowing", "badgeAwardedEventHandler", pCreatureObject)
end

-- Handling of the onPlayerLoggedIn event. The progression of the player will be checked and observers will be registered.
-- @param pCreatureObject pointer to the creature object of the player who logged in.
function Glowing:onPlayerLoggedIn(pCreatureObject)
	if not self:isGlowing(pCreatureObject) then
		self:registerObservers(pCreatureObject)
	end
end

-- Get the jedi progression status for the player
-- @param pCreatureObject pointer to the creature object of the player.
-- @return the jedi progression status, 0 to 5 to be used to return correct string id to the player.
function Glowing:getJediProgressionStatus(pCreatureObject)
	local numberOfBadges = self:countBadges(pCreatureObject)
	return math.floor((numberOfBadges / TOTALNUMBEROFBADGESREQUIRED) * 5)
end

-- Handling of the checkForceStatus command.
-- @param pCreatureObject pointer to the creature object of the player who performed the command
function Glowing:checkForceStatusCommand(pCreatureObject)
	ObjectManager.withCreatureObject(pCreatureObject, function(creatureObject)
		creatureObject:sendSystemMessage("@jedi_spam:fs_progress_" .. self:getJediProgressionStatus(pCreatureObject))
	end)
end

return Glowing
