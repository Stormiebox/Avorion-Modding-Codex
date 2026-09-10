---@class ShipAI
ShipAI = {

	attackedEntity = 0, -- [read-only] uuid
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	flyTarget = vec3, -- [read-only] vec3
	isAttackingSomething = true, -- [read-only] bool
	isBusy = true, -- [read-only] bool
	isStuck = true, -- [read-only] bool
	state = 0, -- [read-only] int

}

---@return ShipAI
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function ShipAI(id)
	return ShipAI
end

--- Removes all registered entities from the enemy list so that this AI no longer always considers them their enemy.
---@return any @nothing
function ShipAI:clearEnemyEntities()
	return nil
end

--- Removes all registered factions from the enemy list so that this AI no longer always considers them their enemy.
---@return any @nothing
function ShipAI:clearEnemyFactions()
	return nil
end

--- Removes all registered entities from the friend list so that this AI no longer always considers them their ally/friend.
---@return any @nothing
function ShipAI:clearFriendEntities()
	return nil
end

--- Removes all registered factions from the friend list so that this AI no longer always considers them their ally/friend.
---@return any @nothing
function ShipAI:clearFriendFactions()
	return nil
end

--- Returns true if there are enemy fighters present in the sector.
---@return boolean
function ShipAI:enemyFightersPresent()
	return true
end

--- Returns true if there are enemy ships present in the sector.
---@param countCivilEnemies any @Set to true to also include civil ships like freighters and the like.
---@return boolean
function ShipAI:enemyShipsPresent(countCivilEnemies)
	return true
end

--- Returns a list of all entities that this AI considers hostile in the sector.
---@return table<number, Entity>
function ShipAI:getEnemies()
	return {Entity}
end

--- Returns a list of all fighters that this AI considers hostile in the sector.
---@return table<number, Entity>
function ShipAI:getEnemyFighters()
	return {Entity}
end

--- Returns a list of all non-fighter entities that this AI considers hostile in the sector.
---@return table<number, Entity>
function ShipAI:getEnemyShips()
	return {Entity}
end

--- Finds the closest enemy of the AI in the sector.
---@return Entity
function ShipAI:getNearestEnemy()
	return Entity
end

--- Returns the list of entities that are always considered enemies.
---@return table<number, Uuid>
function ShipAI:getRegisteredEnemyEntities()
	return {0}
end

--- Returns the list of factions that are always considered enemies.
---@return table<number, number>
function ShipAI:getRegisteredEnemyFactions()
	return {0}
end

--- Returns the list of entities that are always considered friends.
---@return table<number, Uuid>
function ShipAI:getRegisteredFriendEntities()
	return {0}
end

--- Returns the list of factions that are always considered friends.
---@return table<number, number>
function ShipAI:getRegisteredFriendFactions()
	return {0}
end

--- Checks if the given entity is considered an enemy.
---@param target Entity @The entity to check
---@return boolean
function ShipAI:isEnemy(target)
	return true
end

--- Returns true if there are any enemy entities present in the sector.
---@param countCivilEnemies any @Set to true to also include civil ships like freighters and the like.
---@return boolean
function ShipAI:isEnemyPresent(countCivilEnemies)
	return true
end

--- Checks if the given entity is registered to always be considered hostile.
---@param target Entity @The entity to check
---@return boolean
function ShipAI:isRegisteredEnemy(target)
	return true
end

--- Checks if the given entity is registered to always be considered friendly.
---@param target Entity @The entity to check
---@return boolean
function ShipAI:isRegisteredFriend(target)
	return true
end

--- Adds a single entity that this AI will always consider their enemy. This setting overrides normal faction relations. Registering a new enemy entity will do an internal unregisterFriendEntity(id) call and vice versa.
---@param id Uuid @The id of the entity
---@return any @nothing
function ShipAI:registerEnemyEntity(id)
	return nil
end

--- Adds a faction that this AI will always consider their enemy. This setting overrides normal faction relations. Registering a new enemy faction will do an internal unregisterFriendFaction(index) call and vice versa.
---@param index number @The index of the new friend faction
---@return any @nothing
function ShipAI:registerEnemyFaction(index)
	return nil
end

--- Adds a single entity that this AI will always consider their ally/friend. This setting overrides normal faction relations. Registering a new friend entity will do an internal unregisterEnemyEntity(id) call and vice versa.
---@param id Uuid @The id of the entity
---@return any @nothing
function ShipAI:registerFriendEntity(id)
	return nil
end

--- Adds a faction that this AI will always consider their ally/friend. This setting overrides normal faction relations. Registering a new friend faction will do an internal unregisterEnemyFaction(index) call and vice versa.
---@param index number @The index of the new friend faction
---@return any @nothing
function ShipAI:registerFriendFaction(index)
	return nil
end

--- Sets the AI's current state to 'Aggressive'. The ship will attack its enemies and switch between enemies when taking damage (classic aggro principle).
---@param attackCivilShips any @Pass "true" to have it attack civil ships as well
---@param canFinish any @Pass "true" to have the state change to 'Idle' once there are no more enemies.
---@return any @nothing
function ShipAI:setAggressive(attackCivilShips, canFinish)
	return nil
end

--- Sets the AI's current state to 'Attack'. The ship will attack the given target. It will also try to stay moving to make it harder for enemies to hit it. The state ends when the target can't be found any more, or when the target has been out of reach for more than 60 seconds. The ship will not follow through gates or jump after its target.
---@param target Entity @The attacked entity
---@return any @nothing
function ShipAI:setAttack(target)
	return nil
end

--- Sets the AI's current state to 'Board'. The ship will try to board the target. The state ends when the target can no longer be found or boarded, or when boarding was successful.
---@param target Entity @The targeted entity
---@return any @nothing
function ShipAI:setBoard(target)
	return nil
end

--- Sets the AI's current state to 'Escort'. The ship will follow the specified entity and attack enemies that try attacking the escorted ship. This state switches between the 'Follow' and the 'Attack' logic internally. The state ends when the escorted object can't be found any more. A ship set to escort will follow through hyperspace and gates.
---@param escortedShip Entity @The ship it should escort
---@return any @nothing
function ShipAI:setEscort(escortedShip)
	return nil
end

--- Sets the AI's current state to 'Fly'. The ship will fly towards a destination and evade obstacles. If it can't fly to its location without potentially colliding with other objects, it will remain still.
---@param location vec3 @The location it should fly to
---@param arrivalRadius number @The arrival radius of the location, once the ship is inside the radius it will stop flying
---@param collisionException Entity @Pass an Entity as an exception, which won't be considered during flight path calculation. nil for no exception.
---@param fighterOrders any @The desired fighter orders or nil
---@param lenientArrivalAllowed any @A bool indicating whether the ship is allowed to arrive at the final waypoint instead of the actual destination
---@return any @nothing
function ShipAI:setFly(location, arrivalRadius, collisionException, fighterOrders, lenientArrivalAllowed)
	return nil
end

--- Sets the AI's current state to 'Fly Linear'. The ship will fly towards a destination linearly and will not evade obstacles.
---@param location vec3 @The location it should fly to
---@param arrivalRadius number @The arrival radius of the location, once the ship is inside the radius it will stop flying
---@param avoidCollisions any
---@return any @nothing
function ShipAI:setFlyLinear(location, arrivalRadius, avoidCollisions)
	return nil
end

--- Sets the AI's current state to 'Follow'. The ship will follow the specified entity. The state ends when the escorted object can't be found any more. A ship set to follow will follow through hyperspace and gates.
---@param followedShip Entity @The ship it should follow
---@return any @nothing
function ShipAI:setFollow(followedShip)
	return nil
end

--- Sets the AI's current state to 'Guard'. The ship will remain around a specified location and attack enemies that get too close.
---@param location vec3 @The location it should guard
---@return any @nothing
function ShipAI:setGuard(location)
	return nil
end

--- Sets the AI's current state to 'Harvest'. The ship will try to mine/salvage the target. The state ends when the target can no longer be found.
---@param target Entity @The targeted entity
---@return any @nothing
function ShipAI:setHarvest(target)
	return nil
end

--- Sets the AI's current state to 'Idle', which can be compared to a player just stopping to move their hands. That means that any keys that the AI might still have pressed, will remain pressed until otherwise told so via the ControlUnit component.
---@return any @nothing
function ShipAI:setIdle()
	return nil
end

--- Sets the AI's current state to 'Jump'. The ship will turn towards a specified sector and try to jump into it. If it can't it will just turn towards the destination sector. The state ends when it arrives at its destination.
---@param x number @The x coordinate of the target sector
---@param y number @The y coordinate of the target sector
---@return any @nothing
function ShipAI:setJump(x, y)
	return nil
end

--- Sets the AI's current state to 'Passive'. The ship will actively do nothing at all and try to stand still at all cost.
---@return any @nothing
function ShipAI:setPassive()
	return nil
end

--- Enables or disables the ability to shoot enemy ships passively while flying around.
---@param enabled boolean @true to enable, false to disable
---@return any @nothing
function ShipAI:setPassiveShooting(enabled)
	return nil
end

--- Sets the AI's current state to 'Passive Turning'. The ship will turn towards a position, but not fly there and will always set its desired velocity to 0.
---@param location vec3 @The location it should turn towards.
---@return any @nothing
function ShipAI:setPassiveTurning(location)
	return nil
end

--- Sets the AI's current state to 'Repair'. Similar to 'Aggressive', but for repairs. The ship will look for allies and heal them. This state does not end.
---@return any @nothing
function ShipAI:setRepair()
	return nil
end

--- Sets the AI's current state to 'Repair Target'. Can repair itself. The state ends when the target can't be found any more.
---@param target Entity @The targeted entity
---@return any @nothing
function ShipAI:setRepairTarget(target)
	return nil
end

--- DEPRECATED, use ShipAI:setStatusMessage(). Sets the status that will be set in the ship info and other places (eg. ships/fleet tab)
---@param status string @a string that will be used as status, can be a format string for easier translation.
---@param arguments table<number, string_pair>
---@return any
function ShipAI:setStatus(status, arguments)
	return nil
end

--- Sets the status that will be set in the ship info and other places (eg. ships/fleet tab)
---@param status string @a string that will be used as status, can be a format string for easier translation.
---@param arguments table<number, string_pair>
---@return any
function ShipAI:setStatusMessage(status, arguments)
	return nil
end

--- Stops the ship and sets its state to 'Idle'.
---@return any @nothing
function ShipAI:stop()
	return nil
end

--- Removes a single entity from the enemy list so that this AI no longer always considers it their enemy.
---@param id Uuid @The id of the entity
---@return any @nothing
function ShipAI:unregisterEnemyEntity(id)
	return nil
end

--- Removes a faction from the enemy list so that this AI no longer always considers them their enemy.
---@param index number @The index of the faction to remove
---@return any @nothing
function ShipAI:unregisterEnemyFaction(index)
	return nil
end

--- Removes a single entity from the friend list so that this AI no longer always considers it their ally/friend.
---@param id Uuid @The id of the entity
---@return any @nothing
function ShipAI:unregisterFriendEntity(id)
	return nil
end

--- Removes a faction from the friend list so that this AI no longer always considers them their ally/friend.
---@param index number @The index of the faction to remove
---@return any @nothing
function ShipAI:unregisterFriendFaction(index)
	return nil
end

