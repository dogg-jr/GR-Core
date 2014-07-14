/*
 * HolocronMenuComponent.cpp
 *
 *  Created on: 04/15/2014
 *      Author: Skyyyr Death
 */

#include "HolocronMenuComponent.h"

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/player/PlayerObject.h"

#include "server/zone/ZoneServer.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/jedi/JediManager.h"

int HolocronMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* creature, byte selectedID) {
	if (selectedID != 20)
		return 0;

	if (!sceneObject->isASubChildOf(creature))
		return 0;

	ManagedReference<PlayerObject*> playerObject = creature->getPlayerObject();
	if (!creature->checkCooldownRecovery("used_holocron")){
			creature->sendSystemMessage("@jedi_spam:holocron_no_effect");
			return 0;}

		if (playerObject != NULL && playerObject->getJediState() >= 2) {
			if (playerObject->getForcePower() <= playerObject->getForcePowerMax()) {
				creature->sendSystemMessage("@jedi_spam:holocron_force_replenish"); //The holocron hums softly as you feel your Force power replenish.

				playerObject->setForcePower(playerObject->getForcePowerMax(), true);

				creature->addCooldown("used_holocron", 1 * 3600000); //3,600,000 = 1 hr
				sceneObject->destroyObjectFromWorld(true);
			} else {
				creature->sendSystemMessage("@jedi_spam:holocron_force_max"); //You are already at your maximum Force power.
			}
		} else {
			creature->sendSystemMessage("@jedi_spam:holocron_no_effect"); //The holocron hums briefly, but otherwise does nothing.
		}


	return 0;
}
