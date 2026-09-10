---@class ReadOnlyShipAI
ReadOnlyShipAI = {

	attackedEntity = 0, -- [read-only] uuid
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	flyTarget = vec3, -- [read-only] vec3
	isAttackingSomething = true, -- [read-only] bool
	isBusy = true, -- [read-only] bool
	isStuck = true, -- [read-only] bool
	state = 0, -- [read-only] int

}

---@return ReadOnlyShipAI
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyShipAI(id)
	return ReadOnlyShipAI
end

--- Returns true if there are enemy fighters present in the sector.
---@return boolean
function ReadOnlyShipAI:enemyFightersPresent()
	return true
end

--- Returns true if there are enemy ships present in the sector.
---@param countCivilEnemies any @Set to true to also include civil ships like freighters and the like.
---@return boolean
function ReadOnlyShipAI:enemyShipsPresent(countCivilEnemies)
	return true
end

--- Returns a list of all entities that this AI considers hostile in the sector.
---@return table<number, Entity>
function ReadOnlyShipAI:getEnemies()
	return {Entity}
end

--- Returns the list of entities that are always considered enemies.
---@return table<number, Uuid>
function ReadOnlyShipAI:getRegisteredEnemyEntities()
	return {0}
end

--- Returns the list of factions that are always considered enemies.
---@return table<number, number>
function ReadOnlyShipAI:getRegisteredEnemyFactions()
	return {0}
end

--- Returns the list of entities that are always considered friends.
---@return table<number, Uuid>
function ReadOnlyShipAI:getRegisteredFriendEntities()
	return {0}
end

--- Returns the list of factions that are always considered friends.
---@return table<number, number>
function ReadOnlyShipAI:getRegisteredFriendFactions()
	return {0}
end

--- Checks if the given entity is considered an enemy.
---@param target Entity @The entity to check
---@return boolean
function ReadOnlyShipAI:isEnemy(target)
	return true
end

--- Checks if the given entity is registered to always be considered hostile.
---@param target Entity @The entity to check
---@return boolean
function ReadOnlyShipAI:isRegisteredEnemy(target)
	return true
end

--- Checks if the given entity is registered to always be considered friendly.
---@param target Entity @The entity to check
---@return boolean
function ReadOnlyShipAI:isRegisteredFriend(target)
	return true
end

