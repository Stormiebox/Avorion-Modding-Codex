---@class Sector
Sector = {

	name = "", -- string
	numEntities = 0, -- [read-only] unsigned
	numPlayers = 0, -- [read-only] unsigned
	pvpDamage = true, -- bool
	seed = Seed, -- [read-only] Seed

}

---@return Sector
function Sector()
	return Sector
end

---@return number
function Sector:addScript()
	return 0
end

---@return any
function Sector:addScriptOnce()
	return nil
end

---@param id any
---@return any @nothing
function Sector:addStaticHyperspaceGlow(id)
	return nil
end

--- Returns if the entity with the given id belongs to a specific faction. This is a performance optimization for quick checks of ids versus faction. Use if you have an id that you want to check for its faction, and not the entity. If you already have an Entity constructed, use the factionIndex property of the entity, that's faster than this function.
---@param factionIndex number @The index of the faction to test
---@param id any @The id of the entity to test
---@return boolean @A boolean indicating if the entity belongs to the faction
function Sector:belongsToFaction(factionIndex, id)
	return true
end

--- Broadcast a chat message to all players that are currently in the sector. Supports sending of format arguments so that the chat message can be translated on the client.
---@param sender any @The sender that will be displayed for the chat message
---@param messageType number @The type of chat message, 0 = Normal, 1 = Error, 2 = Warning, 3 = Info
---@param message string @The message that will be sent
---@param args table<number, PluralForm> @The format arguments that will be sent
---@return any @nothing
function Sector:broadcastChatMessage(sender, messageType, message, args)
	return nil
end

--- Check how many functions are registered to a callback from the current script VM.
---@param callbackName string @The name of the callback
---@param functionName any @The name of the function for which to check. If nil, will count all functions that are registered to this callback.
---@return number @The amount of functions registered to the callback
function Sector:callbacksRegistered(callbackName, functionName)
	return 0
end

--- Check how many functions are registered to a callback from the current script VM.
---@param callbackName string @The name of the callback
---@param functionName any @The name of the function for which to check. If nil, will count all functions that are registered to this callback.
---@return number @The amount of functions registered to the callback
function Sector:callbacksRegistered(callbackName, functionName)
	return 0
end

--- Removes all custom values of the object
---@return any @nothing
function Sector:clearValues()
	return nil
end

--- Immediately deletes all entities in the sector that are set for deletion. Don't call this function from an entity script. Only call this if you know what you're doing.
---@param entity any @The entity to delete
---@return any @nothing
function Sector:collectGarbage(entity)
	return nil
end

--- Creates a copy of an existing entity
---@param entity Entity @The entity to copy
---@param positoin Matrix @The new position of the copy
---@return //,see @The new entity
function Sector:copyEntity(entity, positoin)
	return //,see
end

--- Convenience function to create an asteroid. Creates a new asteroid in the sector. This entity will have all components required for a default asteroid.
---@param plan BlockPlan @The plan of the asteroid, this plan will be empty after the call since the plan is moved (instead of copied) into the created entity
---@param resources boolean @1 if the asteroid should have mineable resources, 0 if not
---@param position Matrix @The position of the asteroid
---@return Entity @An entity representing the new asteroid
function Sector:createAsteroid(plan, resources, position)
	return Entity
end

---@param pos vec3
---@param size number
---@param color Color
---@param lifeSpan number
---@return any @nothing
function Sector:createDust(pos, size, color, lifeSpan)
	return nil
end

---@param pos vec3
---@param size number
---@param color Color
---@return any @nothing
function Sector:createDustExplosion(pos, size, color)
	return nil
end

--- Creates a new arbitrary entity in the sector
---@param descriptor EntityDescriptor @A descriptor representing the entity to create, this descriptor will be empty after the call since the data is moved (instead of copied) into the created entity
---@param arrivalType any @The arrival type of the ship
---@return Entity @The new entity
function Sector:createEntity(descriptor, arrivalType)
	return Entity
end

---@param pos vec3
---@param size number
---@param silent boolean
---@return any @nothing
function Sector:createExplosion(pos, size, silent)
	return nil
end

---@param pos vec3
---@param size number
---@param color Color
---@return any @nothing
function Sector:createGlow(pos, size, color)
	return nil
end

---@param entity Entity
---@return any @nothing
function Sector:createHyperspaceEnteringGlowAnimation(entity)
	return nil
end

---@param entity Entity
---@param direction nil | vec3
---@param color nil | Color
---@param intensity any
---@return any @nothing
function Sector:createHyperspaceJumpAnimation(entity, direction, color, intensity)
	return nil
end

---@param from vec3
---@param to vec3
---@param color Color
---@param width number
---@return LaserFX
function Sector:createLaser(from, to, color, width)
	return LaserFX
end

--- Convenience function to create a default object. Creates a new default object in the sector. This object has basic components for appearance and physics simulation, such as a plan, velocity and physics
---@param plan BlockPlan @The plan of the object, this plan will be empty after the call since the plan is moved (instead of copied) into the created entity
---@param position Matrix @The position of the object
---@param arrivalType any @The arrival type of the ship
---@return Entity @An entity representing the new object
function Sector:createObject(plan, position, arrivalType)
	return Entity
end

--- Convenience function to create a ship. Creates a new ship in the sector. This entity will have all components required for a default ship.
---@param faction Faction @The faction the ship will belong to
---@param name string @The name of the ship, pass "" for a random name
---@param plan BlockPlan @The plan of the ship, this plan will be empty after the call since the plan is moved (instead of copied) into the created entity
---@param position Matrix @The position of the ship
---@param arrivalType any @The arrival type of the ship
---@return Entity @An entity representing the new ship
function Sector:createShip(faction, name, plan, position, arrivalType)
	return Entity
end

---@param pos vec3
---@param v vec3
---@param size number
---@param aliveTime number
---@param color Color
---@param slowDownFactor number
---@param entity nil | Entity
---@return any @nothing
function Sector:createSpark(pos, v, size, aliveTime, color, slowDownFactor, entity)
	return nil
end

--- Convenience function to create a station. Creates a new station in the sector. A random name will be assigned in case of an AI station. This entity will have all components required for a default station.
---@param faction Faction @The faction the station will belong to
---@param plan BlockPlan @The plan of the station, this plan will be empty after the call since the plan is moved (instead of copied) into the created entity
---@param position Matrix @The position of the station
---@param script any @An optional script that will be used on creation of the station
---@param args table<number, any> @Arguments to the script that will be passed to its "initialize" function
---@return Entity @An entity representing the new station
function Sector:createStation(faction, plan, position, script, args)
	return Entity
end

--- Convenience function to create a wormhole. Creates a new wormhole in the sector. This entity will have all components required for a default wormhole.
---@param x number @The destination sector's X coordinate
---@param y number @The destination sector's Y coordinate
---@param color Color @The color of the wormhole
---@param size number @The size of the wormhole
---@return Entity @An entity representing the new wormhole
function Sector:createWormHole(x, y, color, size)
	return Entity
end

--- Convenience function to create a wreckage. Creates a new wreckage in the sector. This entity will have all components required for a default wreckage.
---@param plan BlockPlan @The plan of the wreckage, this plan will be empty after the call since the plan is moved (instead of copied) into the created entity
---@param position Matrix @The position of the wreckage
---@return Entity @An entity representing the new wreckage
function Sector:createWreckage(plan, position)
	return Entity
end

--- Sets an entity for deletion. The entity is not deleted right away, but will be marked for deletion and will be deleted at the end of the current frame.
---@param entity Entity @The entity to delete
---@return any @nothing
function Sector:deleteEntity(entity)
	return nil
end

--- Sets an entity for deletion. The entity is not deleted right away, but will be marked for deletion and will be deleted at the end of the current frame. This function also creates a hyperspace animation when deleting the entity.
---@param entity Entity @The entity to delete
---@return any @nothing
function Sector:deleteEntityJumped(entity)
	return nil
end

---@return any @nothing
function Sector:dropBundle()
	return nil
end

---@param position vec3
---@param reservedFor nil | Faction
---@param deniedFor nil | Faction
---@param good TradingGood
---@param owner number
---@param amount number
---@return Entity
function Sector:dropCargo(position, reservedFor, deniedFor, good, owner, amount)
	return Entity
end

---@param position vec3
---@param reservedFor nil | Faction
---@param deniedFor nil | Faction
---@param amount number
---@return Entity
function Sector:dropMoney(position, reservedFor, deniedFor, amount)
	return Entity
end

---@param position vec3
---@param reservedFor nil | Faction
---@param deniedFor nil | Faction
---@param material Material
---@param amount number
---@return Entity
function Sector:dropResources(position, reservedFor, deniedFor, material, amount)
	return Entity
end

--- Drops a random turret that is appropriate for this sector. Can return nil as well, since turrets with higher slot numbers won't always be dropped so that not too much money value is dropped all the time.
---@param position vec3 @The position of where to drop the turret
---@param reservedFor nil | Faction @Faction the loot is reserved for, or nil
---@param deniedFor nil | Faction @Faction the loot is denied for, or nil
---@return Entity @The new entity, or nil
function Sector:dropSectorTurret(position, reservedFor, deniedFor)
	return Entity
end

---@param position vec3
---@param reservedFor nil | Faction
---@param deniedFor nil | Faction
---@param desc TurretTemplate
---@return Entity
function Sector:dropTurret(position, reservedFor, deniedFor, desc)
	return Entity
end

---@param position vec3
---@param reservedFor nil | Faction
---@param deniedFor nil | Faction
---@param upgrade SystemUpgradeTemplate
---@return Entity
function Sector:dropUpgrade(position, reservedFor, deniedFor, upgrade)
	return Entity
end

---@param position vec3
---@param reservedFor nil | Faction
---@param deniedFor nil | Faction
---@param item UsableInventoryItem
---@return Entity
function Sector:dropUsableItem(position, reservedFor, deniedFor, item)
	return Entity
end

---@param position vec3
---@param reservedFor nil | Faction
---@param deniedFor nil | Faction
---@param item VanillaInventoryItem
---@return Entity
function Sector:dropVanillaItem(position, reservedFor, deniedFor, item)
	return Entity
end

--- Returns if the entity with the given id exists in the sector. This is a performance optimization for quick checks of existance. Use if you have an id (but not a constructed Entity) that you want to check for existance. If you already have an Entity constructed, use the valid() function, which is faster.
---@param id any @The id of the entity to test
---@return boolean @A boolean indicating if the entity with the index exists
function Sector:exists(id)
	return true
end

--- Returns all allies of the given faction in the sector. Allies include ships of the same faction. Allied entities are determined as follows:  - they belong to the same faction - they belong to factions whose relations are above 70.000 - they belong to players of the same group  - they belong to players of the same alliance  - they belong to a player and their alliance
---@param factionIndex number @The faction index of the faction whose ally ships are to be queried
---@return table<number, Entity> @Multiple values: All detected allies in the sector
function Sector:getAllies(factionIndex)
	return {Entity}
end

--- Returns all allies of the given faction in the sector. Allies include ships of the same faction. Allied entities are determined as follows:  - they belong to the same faction - they belong to factions whose relations are above 70.000 - they belong to players of the same group  - they belong to players of the same alliance  - they belong to a player and their alliance
---@param factionIndex number @The faction index of the faction whose ally ships are to be queried
---@return table<number, Entity> @Multiple values: All detected allies in the sector
function Sector:getAllies(factionIndex)
	return {Entity}
end

---@return number,number
function Sector:getCoordinates()
	return 0,0
end

--- Access the x, y coordinates of the sector
---@return number,number @2 return values: x, y coordinates of the sector
function Sector:getCoordinates()
	return 0,0
end

--- Returns all enemies of the given faction in the sector. Enemies are determined as ships of factions where relations are below -40.000
---@param factionIndex number @The faction index of the faction whose enemy ships are to be queried
---@return table<number, Entity> @Multiple return values: All detected enemies in the sector
function Sector:getEnemies(factionIndex)
	return {Entity}
end

--- Returns all enemies of the given faction in the sector. Enemies are determined as ships of factions where relations are below -40.000
---@param factionIndex number @The faction index of the faction whose enemy ships are to be queried
---@return table<number, Entity> @Multiple return values: All detected enemies in the sector
function Sector:getEnemies(factionIndex)
	return {Entity}
end

---@return table<number, Entity>
function Sector:getEntities()
	return {Entity}
end

--- Returns all entities in the sector
---@return table<number, Entity> @Multiple return values: All entities in the sector
function Sector:getEntities()
	return {Entity}
end

---@param component number
---@return table<number, Entity>
function Sector:getEntitiesByComponent(component)
	return {Entity}
end

--- Returns all entities in the sector that have a specific component
---@param type number @The desired component type (See enum ComponentType)
---@return table<number, Entity> @Multiple return values: All matching entities in the sector
function Sector:getEntitiesByComponent(type)
	return {Entity}
end

--- Returns all entities in the sector that have a specific set of components
---@param types table<number, ComponentType> @The desired set of component types (See enum ComponentType)
---@return table<number, Entity> @Multiple return values: All matching entities in the sector
function Sector:getEntitiesByComponents(types)
	return {Entity}
end

--- Returns all entities in the sector that have a specific set of components
---@param types table<number, ComponentType> @The desired set of component types (See enum ComponentType)
---@return table<number, Entity> @Multiple return values: All matching entities in the sector
function Sector:getEntitiesByComponents(types)
	return {Entity}
end

---@param factionIndex number
---@return table<number, Entity>
function Sector:getEntitiesByFaction(factionIndex)
	return {Entity}
end

--- Returns all entities in the sector that belong to the given faction Complexity: O(n)
---@param factionIndex number @The desired faction
---@return table<number, Entity> @Multiple return values: All matching entities in the sector
function Sector:getEntitiesByFaction(factionIndex)
	return {Entity}
end

---@param sphere Sphere
---@return table<number, Entity>
function Sector:getEntitiesByLocation(sphere)
	return {Entity}
end

--- Returns all entities in the sector whose bounding spheres intersect with the given sphere. Entities without a bounding sphere component will not be considered.  Complexity: O(logn)
---@param sphere Sphere @The intersected sphere
---@return table<number, Entity> @Multiple return values: All matching entities in the sector
function Sector:getEntitiesByLocation(sphere)
	return {Entity}
end

---@param scriptName string
---@return table<number, Entity>
function Sector:getEntitiesByScript(scriptName)
	return {Entity}
end

--- Returns all entities in the sector that have a specific script attached to them
---@param script string @The script that is to check for. This operation checks if the given script name is contained in the actual script name.
---@return table<number, Entity> @Multiple return values: All matching entities in the sector
function Sector:getEntitiesByScript(script)
	return {Entity}
end

--- Returns all entities in the sector that have a specific value assigned to them. Values can be set with Entity:setValue(name, value) and read with Entity:getValue(name).
---@param name string @The value name to check for @A value to check against. If this is set, only entities will be returned whose value is equal to the passed value. If this is nil, all entities will be returned that have any value with the given name assigned.
---@param value any
---@return table<number, Entity> @Multiple return values: All matching entities in the sector
function Sector:getEntitiesByScriptValue(name, value)
	return {Entity}
end

--- Returns all entities in the sector that have a specific value assigned to them. Values can be set with Entity:setValue(name, value) and read with Entity:getValue(name).
---@param name string @The value name to check for @A value to check against. If this is set, only entities will be returned whose value is equal to the passed value. If this is nil, all entities will be returned that have any value with the given name assigned.
---@param value any
---@return table<number, Entity> @Multiple return values: All matching entities in the sector
function Sector:getEntitiesByScriptValue(name, value)
	return {Entity}
end

---@param type number
---@return table<number, Entity>
function Sector:getEntitiesByType(type)
	return {Entity}
end

--- Returns all entities in the sector that have a specific type
---@param type number @The desired entity type (See enum EntityType)
---@return table<number, Entity> @Multiple return values: All matching entities in the sector
function Sector:getEntitiesByType(type)
	return {Entity}
end

---@param id any
---@return Entity
function Sector:getEntity(id)
	return Entity
end

--- Find an entity by index in the sector.  Complexity: O(logn)
---@param index any @The index of the entity as Uuid or std::string
---@return Entity @The entity or nil if not found
function Sector:getEntity(index)
	return Entity
end

---@param factionIndex number
---@param name string
---@return Entity
function Sector:getEntityByFactionAndName(factionIndex, name)
	return Entity
end

---@param factionIndex number
---@param name string
---@return Entity
function Sector:getEntityByFactionAndName(factionIndex, name)
	return Entity
end

---@param faction number
---@return number
function Sector:getNumAllies(faction)
	return 0
end

---@param faction number
---@return number
function Sector:getNumAllies(faction)
	return 0
end

---@param factionIndex number
---@return number
function Sector:getNumEnemies(factionIndex)
	return 0
end

---@param factionIndex number
---@return number
function Sector:getNumEnemies(factionIndex)
	return 0
end

---@return number
function Sector:getNumEntities()
	return 0
end

---@return number
function Sector:getNumEntities()
	return 0
end

---@param component number
---@return number
function Sector:getNumEntitiesByComponent(component)
	return 0
end

---@param component number
---@return number
function Sector:getNumEntitiesByComponent(component)
	return 0
end

---@return number
function Sector:getNumEntitiesByComponents()
	return 0
end

---@return number
function Sector:getNumEntitiesByComponents()
	return 0
end

---@param factionIndex number
---@return number
function Sector:getNumEntitiesByFaction(factionIndex)
	return 0
end

---@param factionIndex number
---@return number
function Sector:getNumEntitiesByFaction(factionIndex)
	return 0
end

---@param sphere Sphere
---@return number
function Sector:getNumEntitiesByLocation(sphere)
	return 0
end

---@param sphere Sphere
---@return number
function Sector:getNumEntitiesByLocation(sphere)
	return 0
end

---@param scriptName string
---@return number
function Sector:getNumEntitiesByScript(scriptName)
	return 0
end

---@param scriptName string
---@return number
function Sector:getNumEntitiesByScript(scriptName)
	return 0
end

---@param valueName string
---@param value any
---@return number
function Sector:getNumEntitiesByScriptValue(valueName, value)
	return 0
end

---@param type number
---@return number
function Sector:getNumEntitiesByType(type)
	return 0
end

---@param type number
---@return number
function Sector:getNumEntitiesByType(type)
	return 0
end

--- Returns all players that are currently in the sector
---@return table<number, Player> @Multiple return values: All players in the sector
function Sector:getPlayers()
	return {Player}
end

--- Returns all indices of all present factions
---@return table<number, number> @a list of int indices of all present factions
function Sector:getPresentFactions()
	return {0}
end

--- Returns all indices of all present factions
---@return table<number, number> @a list of int indices of all present factions
function Sector:getPresentFactions()
	return {0}
end

---@return table<number,string>
function Sector:getScripts()
	return {0,""}
end

---@param name string
---@return any
function Sector:getValue(name)
	return nil
end

--- Retrieves a custom value saved in the entity with the given key
---@param key string @A string that serves as the name of the value
---@return any @The value if the key exists, otherwise nil
function Sector:getValue(key)
	return nil
end

--- Retrieves all key-value pairs of custom values of the entity
---@return table<string,any> @A table containing all custom key-value pairs
function Sector:getValues()
	return {"",nil}
end

--- Checks if the given faction has any enemy ships or objects in the sector
---@param factionIndex number @The index of the faction
---@return boolean @true if there are enemies present, false otherwise
function Sector:hasEnemies(factionIndex)
	return true
end

---@param name string
---@return boolean
function Sector:hasScript(name)
	return true
end

--- Intersects a beam in the sector, similar to the way that weapon beams are intersected. If an entity has a shield, that shield will be part of the test. If the beam would intersect with multiple entities, then the entity with its intersection point closest to the ray origin is chosen.
---@param ray Ray @The ray that should be intersected
---@param ignoredEntity nil | Uuid @A uuid that can be optionally set. If this was set, the entity with this ID will be ignored during the intersection.
---@param ignoredEntityShields nil | Uuid @A uuid that can be optionally set. If this was set, the shields of the entity with this ID will be ignored during the intersection.
---@return table<number, UserObject> @The entity closest to the origin of the ray, that was hit (if one or more were hit), as well as the point where the ray intersects with the object (or its shield).
function Sector:intersectBeamRay(ray, ignoredEntity, ignoredEntityShields)
	return {UserObject}
end

--- Intersects a beam in the sector, similar to the way that weapon beams are intersected. If an entity has a shield, that shield will be part of the test. If the beam would intersect with multiple entities, then the entity with its intersection point closest to the ray origin is chosen.
---@param ray Ray @The ray that should be intersected
---@param ignoredEntity nil | Uuid @A uuid that can be optionally set. If this was set, the entity with this ID will be ignored during the intersection.
---@param ignoredEntityShields nil | Uuid @A uuid that can be optionally set. If this was set, the shields of the entity with this ID will be ignored during the intersection.
---@return table<number, UserObject> @The entity closest to the origin of the ray, that was hit (if one or more were hit), as well as the point where the ray intersects with the object (or its shield).
function Sector:intersectBeamRay(ray, ignoredEntity, ignoredEntityShields)
	return {UserObject}
end

--- Invokes a function in a script of the sector. Use this function to invoke functions from one script in another script. The first return value of the function is an integer indicating whether or not the call was successful. When it was, this integer is followed by the return values of the invoked function.
---@param scriptName any @The name or index of the script containing the function
---@param functionName string @The name of the function that will be executed
---@param arguments table<number, any> @An arbitrary list of arguments that will be given to the invoked function
---@return table<number, any> @Returns at least 1 value indicating if the call succeeded: 0 The call was successful. In this case, the return values of the script are returned in addition to the call result, following the call result. 3 The call failed because the given script was not found  4 The call failed because the given function was not found in the script  5 The call failed because the script's state has errors and is invalid
function Sector:invokeFunction(scriptName, functionName, arguments)
	return {nil}
end

--- Invokes a function in a script of the sector. Use this function to invoke functions from one script in another script. The first return value of the function is an integer indicating whether or not the call was successful. When it was, this integer is followed by the return values of the invoked function.
---@param scriptName any @The name of the script containing the function
---@param functionName string @The name of the function that will be executed
---@param arguments table<number, any> @An arbitrary list of arguments that will be given to the invoked function
---@return table<number, any> @Returns at least 1 value indicating if the call succeeded: 0 The call was successful. In this case, the return values of the script are returned in addition to the call result, following the call result 3 The call failed because the given script was not found in the sector 4 The call failed because the given function was not found in the script
function Sector:invokeFunction(scriptName, functionName, arguments)
	return {nil}
end

---@param entity Entity
---@return boolean
function Sector:isEntitySetForDeletion(entity)
	return true
end

--- @callback
--- Executed whenever the AI state of an entity changes
function Sector:onAIStateChanged(entityId, state)
end

--- @callback
--- Executed whenever all scripts values of an entity in the sector have been changed at once
function Sector:onAllScriptValuesChanged(entityId)
end

--- @callback
--- Executed whenever a plan of an entity is changed in the sector.
function Sector:onBlockChanged(objectIndex, blockIndex, changeFlags)
end

--- @callback
--- Executed whenever a block object is damaged in the sector. This callback is executed after the damage is dealt to the block. Don't remove the block in this callback, this will lead to a crash.
function Sector:onBlockDamaged(objectIndex, blockIndex, inflictorId, damage, damageType)
end

--- @callback
--- Executed whenever a block of a block object got destroyed This callback is executed *after* the block was destroyed
function Sector:onBlockDestroyed(objectIndex, index, block, lastDamageInflictor, damageSource)
end

--- @callback
--- Executed whenever a block of an object is healed in the sector. Don't remove the block in this callback, this will lead to a crash.
function Sector:onBlockHealed(objectIndex, blockIndex, damage)
end

--- @callback
--- Executed whenever a plan of an entity is changed in the sector.
function Sector:onBlockPlanChanged(objectIndex, allBlocksChanged)
end

--- @callback
--- Executed whenever new blocks are added to the entity. This callback is executed after the block was added.
function Sector:onBlocksAdded(objectIndex, wasRepaired, blockIndices)
end

--- @callback
--- Executed whenever a block will be removed from the plan by building (instead of combat). This callback is executed before the block is removed.  IMPORTANT! This only fires on blocks that the player directly chose to be removed. Blocks that get removed because they don't have a connection to the root block any more get signalled after removal by 'onBlocksRemoved'.
function Sector:onBlocksRemove(objectIndex, blockIndices)
end

--- @callback
--- Executed whenever a block is removed from the plan by building (instead of combat). This callback is executed after the block is removed.
function Sector:onBlocksRemoved(objectIndex, blockIndices)
end

--- @callback
--- Executed whenever all boarders were defeated
function Sector:onBoardersDefeated(entityId, attackingFaction)
end

--- @callback
--- Executed when boarders land on an entity
function Sector:onBoardersLand(entityId, attackingFaction, firstLanding)
end

--- @callback
--- Executed on every round of fighting with boarders
function Sector:onBoardingFight(entityId, attackingFaction)
end

--- @callback
--- Executed whenever an entity was boarded successfully
function Sector:onBoardingSuccessful(entityId, oldFactionIndex, newFactionIndex)
end

--- @callback
--- Executed whenever the cargo of an entity in the sector changes. This callback is executed *after* the cargo was changed on the entity.
function Sector:onCargoChanged(objectIndex, delta, good)
end

--- @callback
--- Executed whenever trading good loot gets collected by a player
function Sector:onCargoLootCollected(collector, lootIndex, amount, good, owner)
end

--- @callback
--- Executed whenever two block objects collided in the sector
function Sector:onCollision(objectIndexA, objectIndexB, damageA, damageB, steererA, steererB)
end

--- @callback
--- Executed whenever a player enters a craft
function Sector:onCraftSeatEntered(entityId, seat, playerIndex, firstPlayer)
end

--- @callback
--- Executed whenever a player leaves a craft
function Sector:onCraftSeatLeft(entityId, seat, playerIndex, playersRemaining)
end

--- @callback
--- Executed whenever the crew of an entity in the sector changes. This callback is executed *after* the crew was changed on the entity.
function Sector:onCrewChanged(index, delta, profession)
end

--- @callback
--- Executed whenever trading good loot gets collected by a player
function Sector:onCrewLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever an entity is damaged in the sector.
function Sector:onDamaged(objectIndex, amount, inflictor, damageSource, damageType)
end

--- @callback
--- Executed whenever an entity with durability was destroyed in the sector
function Sector:onDestroyed(index, lastDamageInflictor)
end

--- @callback
--- Executed whenever an entity was docked to another entity
function Sector:onDockedByEntity(dockeeId, dockerId)
end

--- @callback
--- Executed whenever a new entity is created in the sector
function Sector:onEntityCreated(entityId)
end

--- @callback
--- Executed whenever an entity docks to another entity
function Sector:onEntityDocked(dockerId, dockeeId)
end

--- @callback
--- Executed whenever a entity enters the sector.
function Sector:onEntityEntered(shipIndex)
end

--- @callback
--- Executed whenever a entity jumps into another sector.
function Sector:onEntityJump(shipIndex, x, y)
end

--- @callback
--- Executed whenever an entity undocks from another entity
function Sector:onEntityUndocked(dockerId, dockeeId)
end

--- @callback
--- Executed whenever a fighter is added to an entity in the sector
function Sector:onFighterAdded(entityId, squadIndex, fighterIndex, landed)
end

--- @callback
--- Executed whenever a fighter lands in a hangar in the sector
function Sector:onFighterLanded(entityId, squadIndex, fighterId)
end

--- @callback
--- Executed whenever a fighter is removed from an entity in the sector, before it gets removed
function Sector:onFighterRemove(entityId, squadIndex, fighterIndex, started)
end

--- @callback
--- Executed whenever a fighter is removed from an entity in the sector, after it got removed
function Sector:onFighterRemoved(entityId, squadIndex, fighterIndex, started)
end

--- @callback
--- Executed whenever a fighter starts from a hangar in the sector
function Sector:onFighterStarted(entityId, squadIndex, fighterId)
end

--- @callback
--- Executed whenever an entity is healed in the sector.
function Sector:onHealed(objectIndex, amount, inflictor)
end

--- @callback
--- Executed whenever a block object is hit by a shot in the sector. Don't delete the block that is hit by the shot, this will lead to a crash.
function Sector:onHullHit(objectIndex, blockIndex, shooterIndex, damage, location)
end

--- @callback
--- Executed whenever inventory item loot gets collected by an entity
function Sector:onInventoryItemLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever loot gets collected by anyone, be it player or AI faction
function Sector:onLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever material loot gets collected by an entity
function Sector:onMaterialLootCollected(collector, lootIndex, materialType, value)
end

--- @callback
--- Executed whenever money loot gets collected by an entity
function Sector:onMoneyLootCollected(collector, lootIndex, value)
end

--- @callback
--- Executed whenever the plan of an entity was modified by building, meaning adding or removing blocks.
function Sector:onPlanModifiedByBuilding(shipIndex)
end

--- @callback
--- Executed whenever a player enters the sector. This callback is executed immediately before the contents of the sector are sent to the player
function Sector:onPlayerEntered(playerIndex, sectorChangeType)
end

--- @callback
--- Executed whenever a player leaves the sector. Executed after the player left.
function Sector:onPlayerLeft(playerIndex, sectorChangeType)
end

--- @callback
--- Executed when a sector is loaded/restored from disk. This callback is called after the "restore" callback, for both entity and sector scripts.
function Sector:onRestoredFromDisk(time)
end

--- @callback
--- Executed after a script was added to an entity in the sector
function Sector:onScriptAdded(entityId, scriptIndex, scriptPath)
end

--- @callback
--- Executed after a script was removed from an entity in the sector
function Sector:onScriptRemoved(entityId, oldScriptIndex, scriptPath)
end

--- @callback
--- Executed whenever a script value of an entity in the sector was changed
function Sector:onScriptValueChanged(entityId, name, value)
end

--- @callback
--- Executed when a sector is generated/created for the first time for both entity and sector scripts.
function Sector:onSectorGenerated(time)
end

--- @callback
--- Executed whenever an entity is to be deleted.
function Sector:onSetForDeletion(entityId, deletionType)
end

--- @callback
--- Executed whenever a shield activates in the sector
function Sector:onShieldActivate(entityId)
end

--- @callback
--- Executed whenever a shield is damaged in the sector
function Sector:onShieldDamaged(entityId, amount, damageType, inflictorId)
end

--- @callback
--- Executed whenever a shield deactivates in the sector
function Sector:onShieldDeactivate(entityId)
end

--- @callback
--- Executed whenever a shield is healed in the sector
function Sector:onShieldHealed(entityId, amount)
end

--- @callback
--- Executed whenever an object's shield is hit by a shot in the sector.
function Sector:onShieldHit(objectIndex, shooterIndex, damage, location)
end

--- @callback
--- Executed whenever a new shot is created in the sector
function Sector:onShotCreated(shotIndex)
end

--- @callback
--- Executed whenever a shot is fired in the sector
function Sector:onShotFired(entityId)
end

--- @callback
--- Executed whenever a block object is hit by a shot in the sector.
function Sector:onShotHit(objectIndex, shooterIndex, location)
end

--- @callback
--- Executed whenever a squad is added to an entity in the sector
function Sector:onSquadAdded(entityId, index)
end

--- @callback
--- Executed whenever the orders of a squad change in the sector
function Sector:onSquadOrdersChanged(entityId, squadIndex, orders, targetId)
end

--- @callback
--- Executed whenever a squad is removed from an entity in the sector, before the squad gets removed
function Sector:onSquadRemove(entityId, index)
end

--- @callback
--- Executed whenever a squad is removed from an entity in the sector, after the squad got removed
function Sector:onSquadRemoved(entityId, index)
end

--- @callback
--- Executed whenever an entity starts firing in the sector
function Sector:onStartFiring(entityId)
end

--- @callback
--- Executed whenever an entity stops firing in the sector
function Sector:onStopFiring(entityId)
end

--- @callback
--- Executed whenever system upgrade loot gets collected by an entity
function Sector:onSystemUpgradeLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever the systems of a ship in the sector changed. This callback is executed *after* the system was changed on the entity.
function Sector:onSystemsChanged(shipIndex)
end

--- @callback
--- Executed whenever a block object is hit by a torpedo in the sector.
function Sector:onTorpedoHit(objectIndex, shooterIndex, torpedoIndex)
end

--- @callback
--- Executed whenever a block object is hit by a torpedo in the sector. Don't delete the block that is hit by the torpedo, this will lead to a crash.
function Sector:onTorpedoHullHit(objectIndex, blockIndex, shooterIndex, damage, torpedoIndex)
end

--- @callback
--- Executed whenever a torpedo was launched from an entity
function Sector:onTorpedoLaunched(entityId, torpedoId)
end

--- @callback
--- Executed whenever an object's shield is hit by a torpedo in the sector.
function Sector:onTorpedoShieldHit(objectIndex, shooterIndex, damage, torpedoIndex)
end

--- @callback
--- Executed whenever a turret was added to a ship in the sector
function Sector:onTurretAdded(shipIndex, turretIndex)
end

--- @callback
--- Executed whenever a turret was destroyed in the sector
function Sector:onTurretDestroyed(turretIndex, shipIndex, lastDamageInflictor)
end

--- @callback
--- Executed whenever turret loot gets collected by an entity controlled by AI
function Sector:onTurretLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever a turret was removed in the sector
function Sector:onTurretRemoved(shipIndex, turretIndex)
end

--- @callback
--- Executed whenever a turret was removed from a ship by the player in the sector
function Sector:onTurretRemovedByPlayer(shipIndex, turretIndex)
end

--- @callback
--- Executed whenever an entity was undocked from another entity
function Sector:onUndockedFromEntity(dockeeId, dockerId)
end

--- Register a callback in the sector. The callback receiver has to be inside the sector for the registration to succeed. The callback will be removed if the receiver leaves the sector or gets destroyed, or when a hyperspace jump happens. Double registration of callbacks doesn't work. When the same callback to the same callback of the same script instance is registered twice, it will still only be called once.
---@param callbackName string @The name of the callback
---@param functionName string @The name of the function that will be executed in the script when the callback happens
---@return number @0 on success, 1 if the registration failed
function Sector:registerCallback(callbackName, functionName)
	return 0
end

--- Register a callback in the sector. The callback receiver has to be inside the sector for the registration to succeed. The callback will be removed if the receiver leaves the sector or gets destroyed, or the sector gets unloaded. Double registration of callbacks doesn't work. When the same callback to the same callback of the same script instance is registered twice, it will still only be called once.
---@param callbackName string @The name of the callback
---@param functionName string @The name of the function that will be executed in the script when the callback happens
---@return number @0 on success, 1 if the registration failed
function Sector:registerCallback(callbackName, functionName)
	return 0
end

---@param laser LaserFX
---@return any @nothing
function Sector:removeLaser(laser)
	return nil
end

---@param script any
---@return any @nothing
function Sector:removeScript(script)
	return nil
end

---@param id any
---@return any @nothing
function Sector:removeStaticHyperspaceGlow(id)
	return nil
end

---@param entity Entity
---@return any @nothing
function Sector:resendEntity(entity)
	return nil
end

---@param path string
---@return string
function Sector:resolveScriptPath(path)
	return ""
end

---@return any @nothing
function Sector:sendCallback()
	return nil
end

---@return any @nothing
function Sector:sendCallback()
	return nil
end

--- Sets a custom value
---@param key string @A string that serves as the name of the value
---@param value any @The value to save. Must be bool, number, string or nil. If nil is given, the value will be deleted.
---@return any
function Sector:setValue(key, value)
	return nil
end

--- Marks an entity for transfer to another sector. Child entities such as turrets will be transferred as well. The entity will be removed from the sector after the frame ends. Default transfer type will just move the entity without any effects or other behaviours and the entity will be placed at the exact same position as in the previous sector. Jump transfer will simulate a jump behavior, including an effect on the client and placing the entity at the edge of the destination sector. Gate and Wormhole transfer will place the entity in front of the outgoing gate or wormhole, if there is any that leads to the origin sector. Otherwise, same behavior as Default transfer. While technically, Wormhole transfer and Gate transfer is the exact same thing internally, we have to distinguish it for different things like for example achievements.
---@param entity Entity @The entity that is to be transferred @The y coordinate of the target sector
---@param x number @The x coordinate of the target sector
---@param y number
---@param type number @The type of transfer: SectorChangeType
---@return any @nothing
function Sector:transferEntity(entity, x, y, type)
	return nil
end

---@param callbackName string
---@param functionName string
---@return any @nothing
function Sector:unregisterCallback(callbackName, functionName)
	return nil
end

---@param callbackName string
---@param functionName string
---@return any @nothing
function Sector:unregisterCallback(callbackName, functionName)
	return nil
end

