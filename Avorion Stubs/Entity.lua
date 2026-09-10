---@class Entity
Entity = {

	aiOwned = true, -- [read-only] bool
	allianceOwned = true, -- [read-only] bool
	canPassRifts = true, -- [read-only] bool
	controlActions = 0, -- int
	crew = Crew, -- Crew
	crewSize = nil, -- [read-only] var
	damageMultiplier = 0.0, -- float
	desiredVelocity = 0.0, -- float
	dockable = true, -- bool
	dockingParent = 0, -- [read-only] Uuid
	durability = 0.0, -- double
	excludedPlayer = 0, -- int
	exclusionTime = 0, -- int
	factionIndex = 0, -- int
	fighterCargoPickup = true, -- [read-only] bool
	firePower = 0.0, -- [read-only] double
	freeCargoSpace = nil, -- [read-only] var
	hasPilot = true, -- [read-only] bool
	hyperspaceCooldown = 0.0, -- float
	hyperspaceJumpReach = 0.0, -- float
	id = 0, -- [read-only] Uuid
	idealCrew = Crew, -- [read-only] Crew
	index = 0, -- [read-only] Uuid
	invincible = true, -- bool
	isAnomaly = true, -- [read-only] bool
	isArmedTurret = nil, -- [read-only] var
	isAsteroid = true, -- [read-only] bool
	isContainer = true, -- [read-only] bool
	isDrone = true, -- [read-only] bool
	isFighter = true, -- [read-only] bool
	isFlyable = true, -- [read-only] bool
	isLoot = true, -- [read-only] bool
	isObviouslyMineable = true, -- bool
	isOther = true, -- [read-only] bool
	isShieldActive = nil, -- [read-only] var
	isShip = true, -- [read-only] bool
	isStation = true, -- [read-only] bool
	isTurning = nil, -- [read-only] var
	isTurret = true, -- [read-only] bool
	isUnarmedTurret = nil, -- [read-only] var
	isUnknown = true, -- [read-only] bool
	isWormHole = true, -- [read-only] bool
	isWreckage = true, -- [read-only] bool
	look = vec3, -- [read-only] vec3
	mass = nil, -- [read-only] var
	maxCargoSpace = nil, -- [read-only] var
	maxCrewSize = nil, -- [read-only] var
	maxDurability = nil, -- [read-only] var
	minCrew = Crew, -- [read-only] Crew
	name = "", -- string
	numCargos = 0, -- [read-only] int
	numDefenseWeapons = 0, -- [read-only] int
	numDefenseWeaponsCurrentAttack = 0, -- [read-only] int
	numDockingPositions = nil, -- [read-only] var
	numTurrets = nil, -- [read-only] var
	occupiedCargoSpace = nil, -- [read-only] var
	orientation = Matrix, -- Matrix
	playerOrAllianceOwned = true, -- [read-only] bool
	playerOwned = true, -- [read-only] bool
	position = Matrix, -- Matrix
	radius = nil, -- [read-only] var
	reservationTime = 0.0, -- float
	reservedPlayer = 0, -- int
	right = vec3, -- [read-only] vec3
	selectedObject = nil, -- var
	shieldDurability = 0.0, -- double
	shieldMaxDurability = 0.0, -- double
	size = vec3, -- [read-only] vec3
	timeAlive = nil, -- [read-only] var
	title = "", -- string
	translatedTitle = nil, -- [read-only] var
	translation = dvec3, -- dvec3
	translationf = vec3, -- [read-only] vec3
	transporterRange = 0.0, -- [read-only] double
	type = 0, -- int
	typename = "", -- [read-only] string
	up = vec3, -- [read-only] vec3
	volume = nil, -- [read-only] var

}

---@return Entity
---@param id any @The id of the entity, must be an id of an existing entity
function Entity(id)
	return Entity
end

--- Adds a flat bias for stat of type type. This bias will be added to stat after multipliers are considered.
---@param type number @Type of Bonus, e.g. acceleration, higher level crew
---@param value number @Bias added to base stats.
---@return any @key that can be used to access the multiplier
function Entity:addAbsoluteBias(type, value)
	return nil
end

--- Adds a multiplyer for stat of type type. This is to increase a stat, so a factor of 0.3 will become 1.3.
---@param type number @Type of Bonus, e.g. acceleration, higher level crew
---@param factor number @Factor that is used as Multiplier
---@return any @key that can be used to access the multiplier
function Entity:addBaseMultiplier(type, factor)
	return nil
end

--- Adds cargo to the entity. If the amount specified exceeds the maximum capacity of the cargo bay, as much cargo as still fits in will be added.
---@param good TradingGood @TradingGood that is to be added.
---@param amount number @The amount of cargo that should be added.
---@return any @nothing
function Entity:addCargo(good, amount)
	return nil
end

---@param number number
---@param crewman CrewMan
---@return any @nothing
function Entity:addCrew(number, crewman)
	return nil
end

--- Exchanges flat bias at key with new value
---@param type number @Bonus type
---@param key number @Location of the bonus that will be changed
---@param value number @New value
---@return any @key that can be used to access the multiplier
function Entity:addKeyedAbsoluteBias(type, key, value)
	return nil
end

--- Exchanges multiplier at key with new value
---@param type number @Bonus type
---@param key number @Location of the bonus that will be changed
---@param value number @New value
---@return any @key that can be used to access the multiplier
function Entity:addKeyedBaseMultiplier(type, key, value)
	return nil
end

--- Exchanges multiplier at key with new value
---@param type number @Bonus type
---@param key number @Location of the bonus that will be changed
---@param value number @New value
---@return any @key that can be used to access the multiplier
function Entity:addKeyedMultiplier(type, key, value)
	return nil
end

--- Exchanges bias at key with new value
---@param type number @Bonus type
---@param key number @Location of the bonus that will be changed
---@param value number @New value
---@return any @key that can be used to access the multiplier
function Entity:addKeyedMultiplyableBias(type, key, value)
	return nil
end

--- Adds a multiplyer for stat of type type. The factor will be used unchanged.
---@param type number @Type of Bonus, e.g. acceleration, higher level crew
---@param factor number @Factor that is used as Multiplier
---@return any @key that can be used to access the multiplier
function Entity:addMultiplier(type, factor)
	return nil
end

--- Adds a bias for stat of type type. This bias will be added to stat before multipliers are considered.
---@param type number @Type of Bonus, e.g. acceleration, higher level crew
---@param value number @Bias added to base stats.
---@return any @key that can be used to access the multiplier
function Entity:addMultiplyableBias(type, value)
	return nil
end

--- Adds a new script to an entity
---@param scriptPath string @The path of the script that should be added
---@param arguments table<number, any> @An arbitrary number of arguments that will be given to the 'initialize' function of the added script
---@return any @0 on success, 1 if the entity could not be found
function Entity:addScript(scriptPath, arguments)
	return nil
end

---@return any
function Entity:addScriptOnce()
	return nil
end

---@param turret TurretTemplate
---@param position Matrix
---@param part number
---@return Uuid
function Entity:addTurret(turret, position, part)
	return 0
end

---@param time number
---@return any @nothing
function Entity:blockHyperspace(time)
	return nil
end

--- Check how many functions are registered to a callback from the current script VM.
---@param callbackName string @The name of the callback
---@param functionName any @The name of the function for which to check. If nil, will count all functions that are registered to this callback.
---@return number @The amount of functions registered to the callback
function Entity:callbacksRegistered(callbackName, functionName)
	return 0
end

---@param number number
---@param profession number
---@param change boolean
---@return any,any,table<number,string>
function Entity:canAddCrew(number, profession, change)
	return nil,nil,{0,""}
end

---@param number number
---@param profession number
---@return any @nothing
function Entity:changeCrew(number, profession)
	return nil
end

--- Adds delta to shield durability
---@param delta number @Returns
---@return any
function Entity:changeShield(delta)
	return nil
end

---@return any @nothing
function Entity:clearCargoBay()
	return nil
end

--- Removes all custom values of the object
---@return any @nothing
function Entity:clearValues()
	return nil
end

--- Damages shield by delta amount, location and inflictorId are not necessary, but can be added if it is needed, e.g. you want to do effects on hitpoint.
---@param amount number
---@param location vec3 @inflictorId
---@param inflictorId Uuid
---@param damageSource any
---@param damageType any
---@return any @nothing
function Entity:damageShield(amount, location, inflictorId, damageSource, damageType)
	return nil
end

--- @callback
--- Executed when the availability state of the destination sector changes. When the sector is loaded into memory, it's set to true. When the sector is unloaded from memory, because there's no player near it, it's set to false.
function Entity:destinationSectorReady(sectorReady)
end

--- Destroy entity by inflicting more damage than durability of entity
---@param inflictorId Uuid @Index of the entity that destroys the block
---@param damageSource any @Source of damage. Can be Weaponry, Collision, Decay, Torpedo or Arbitrary. *
---@param damageType any @Type of damage received. Damage can be of type Physical, Energy, Electric, Plasma, AntiMatter or Fragments.
---@return any @nothing
function Entity:destroy(inflictorId, damageSource, damageType)
	return nil
end

--- Destroy one block
---@param index number @Index of the block that is destroyed
---@param inflictorId Uuid @Index of the entity that destroys the block
---@param damageSource any @Source of damage. Can be Weaponry, Collision, Decay, Torpedo or Arbitrary.
---@return any @nothing
function Entity:destroyBlock(index, inflictorId, damageSource)
	return nil
end

--- Destroys cargo. The destruction distribution is generally equal over all goods.
---@param volume number @The amount of volume that should be destroyed.
---@return any @nothing
function Entity:destroyCargo(volume)
	return nil
end

---@param time number
---@return any @nothing
function Entity:disableFlightAssistFor(time)
	return nil
end

---@param time number
---@return any @nothing
function Entity:distortHyperspace(time)
	return nil
end

--- Finds all cargos with the given name.
---@param name string @A string that will be matched with the 'name' property of the cargos.
---@return table<TradingGood,number> @A map containing all matching goods, with the good as key and amount as value.
function Entity:findCargos(name)
	return {TradingGood,0}
end

---@param seat number
---@return vec3
function Entity:getAimedPositionBySeat(seat)
	return vec3
end

---@return table<number, vec3>
function Entity:getAimedPositions()
	return {vec3}
end

---@return any
function Entity:getAllowedArbitraryTurrets()
	return nil
end

---@return any
function Entity:getAllowedArmedTurrets()
	return nil
end

---@return any
function Entity:getAllowedUnarmedTurrets()
	return nil
end

--- Returns the Index of the block that the turret is build on
---@return any
function Entity:getAttachedBlockIndex()
	return nil
end

--- Returns value with included bonus, in case a bonus exists. Returns Nil if no bonuses at all, returns value if no bonuses for this stat exist.
---@param type number @type of bonus stat, e.g. acceleration, higher level crew
---@param value number @the value, that might be changed by bonuses
---@return any
function Entity:getBoostedValue(type, value)
	return nil
end

--- Returns Bounding Box for entity, use this if you need exact Bounding Box, e.g. for collision detection when entities are close to each other.
---@return Box
function Entity:getBoundingBox()
	return Box
end

--- Returns Bounding Sphere for entity. Much faster than Bounding Box, but not as accurate. Use this if you need to check often.
---@return Sphere
function Entity:getBoundingSphere()
	return Sphere
end

---@return Captain
function Entity:getCaptain()
	return Captain
end

---@param n number
---@return TradingGood,table<number, number>
function Entity:getCargo(n)
	return TradingGood,{0}
end

--- Counts all goods of the given type. When given a string, it will match the 'name' property of the goods. When given a TradingGood it will match the exact good.
---@param name any @Either a TradingGood or a string containing the name of a trading good.
---@return number @The number of goods
function Entity:getCargoAmount(name)
	return 0
end

---@return table<TradingGood,number>
function Entity:getCargos()
	return {TradingGood,0}
end

---@param profession number
---@return any
function Entity:getCrewMembers(profession)
	return nil
end

--- Lists all players and alliances that contributed damage to the entity
---@return table<number, number> @Indices of all players and alliances that contributed damage to the entity
function Entity:getDamageContributorPlayerFactions()
	return {0}
end

--- Lists all players that contributed damage to the entity
---@return table<number, number> @Indices of all players that contributed damage to the entity
function Entity:getDamageContributorPlayers()
	return {0}
end

--- Lists all factions that contributed damage to the entity
---@return table<number, number> @Indices of all factions that contributed damage to the entity
function Entity:getDamageContributors()
	return {0}
end

--- Returns Bounding Box for entity, but enlarged to also fit around all docked objects. Use this if you need exact Bounding Box, e.g. for collision detection when entities are close to each other.
---@return Box
function Entity:getDockedGroupBoundingBox()
	return Box
end

--- Returns Bounding Box for entity, but enlarged to also fit around all docked objects. Use this if you need exact Bounding Box, e.g. for collision detection when entities are close to each other.
---@return Sphere
function Entity:getDockedGroupBoundingSphere()
	return Sphere
end

--- Lists all docking positions that the entity has
---@return any @A table that contains a key-value pair (id, table) for each dock:
function Entity:getDockingPositions()
	return nil
end

---@return any
function Entity:getFreeArbitraryTurrets()
	return nil
end

---@return any
function Entity:getFreeArmedTurrets()
	return nil
end

---@return any
function Entity:getFreeUnarmedTurrets()
	return nil
end

--- Returns the plan of the entity. This copies the entire plan, keep that in mind when using plans with large block counts.
---@return BlockPlan @A copy of the plan of the entity
function Entity:getFullPlanCopy()
	return BlockPlan
end

---@return Material
function Entity:getLowestMineableMaterial()
	return Material
end

---@return any,any
function Entity:getMalusFactor()
	return nil,nil
end

---@return Material
function Entity:getMineableMaterial()
	return Material
end

---@return table<number, number>
function Entity:getMineableResources()
	return {0}
end

---@return number
function Entity:getMoneyLootAmount()
	return 0
end

--- Returns the plan of the entity. This function will move the plan out of the entity, and replace the entity's plan with a single block. This operation is independent of the size of the plan, use it when you have to get large plans with lots of blocks.
---@return BlockPlan @The plan of the entity
function Entity:getMovePlan()
	return BlockPlan
end

---@param other Entity
---@return any
function Entity:getNearestDistance(other)
	return nil
end

---@return any
function Entity:getNumArmedTurrets()
	return nil
end

---@return any
function Entity:getNumMiningTurrets()
	return nil
end

---@return any
function Entity:getNumSalvagingTurrets()
	return nil
end

---@return any
function Entity:getNumUnarmedTurrets()
	return nil
end

--- Returns Indices of piloting players
---@return table<number, number> @multiple return values: indices of players
function Entity:getPilotIndices()
	return {0}
end

---@return any
function Entity:getPlanMoneyValue()
	return nil
end

---@return table<number, number>
function Entity:getPlanResourceValue()
	return {0.0}
end

---@return number
function Entity:getResourceLootAmount()
	return 0
end

---@return table<number,string>
function Entity:getScripts()
	return {0,""}
end

--- Retrieves the arguments to a title
---@return table<string,string>
function Entity:getTitleArguments()
	return {"",""}
end

--- Retrieves the title as NamedFormat
---@return NamedFormat
function Entity:getTitleFormat()
	return NamedFormat
end

---@param index number
---@return Entity
function Entity:getTurret(index)
	return Entity
end

---@param turret TurretTemplate
---@param number number
---@return Matrix,table<number, number>
function Entity:getTurretPositions(turret, number)
	return Matrix,{0}
end

---@param turret TurretTemplate
---@param number number
---@return Matrix,table<number, number>
function Entity:getTurretPositionsLineOfSight(turret, number)
	return Matrix,{0}
end

---@return any
function Entity:getTurretSize()
	return nil
end

---@return any
function Entity:getTurretTemplateSize()
	return nil
end

---@return any
function Entity:getTurretTurningSpeed()
	return nil
end

---@return table<number, Entity>
function Entity:getTurrets()
	return {Entity}
end

---@return any
function Entity:getUndamagedPlanMoneyValue()
	return nil
end

---@return table<number, number>
function Entity:getUndamagedPlanResourceValue()
	return {0.0}
end

--- Retrieves a custom value saved in the entity with the given key
---@param key string @A string that serves as the name of the value
---@return any @The value if the key exists, otherwise nil
function Entity:getValue(key)
	return nil
end

--- Retrieves all key-value pairs of custom values of the entity
---@return table<string,any> @A table containing all custom key-value pairs
function Entity:getValues()
	return {"",nil}
end

---@param type number
---@return boolean
function Entity:hasComponent(type)
	return true
end

---@param name string
---@return any
function Entity:hasScript(name)
	return nil
end

--- Increases durability of the plan of the Entity
---@param damage number @The amount of durability that will be restored
---@param index number @Index of the block that will be restored
---@param location vec3 @vector containing the hit point, if unknown/unnecessary use empty vector
---@param inflictorID Uuid @Index of the entity that heals
---@return any @nothing
function Entity:heal(damage, index, location, inflictorID)
	return nil
end

--- Increases shield durability by delta
---@param delta number @Returns
---@return any
function Entity:healShield(delta)
	return nil
end

---@return any
function Entity:hyperspaceBlocked()
	return nil
end

--- Inflicts damage to the plan of the Entity
---@param damage number @The amount of damage that will be dealt
---@param damageSource any @The source of the damage. Can be Weaponry, Collision, Decay, Torpedo or Arbitrary.
---@param damageType any @Type of damage received. Damage can be of type Physical, Energy, Electric, Plasma, AntiMatter or Fragments
---@param index number @Index of the block that will receive the damage
---@param location vec3 @vector containing the hit point, if unknown / unnecessary use empty vector
---@param inflictorId Uuid @Index of the entity that caused the damage
---@return any @nothing
function Entity:inflictDamage(damage, damageSource, damageType, index, location, inflictorId)
	return nil
end

--- Invokes a function in a script of the entity. Use this function to invoke functions from one script in another script. The first return value of the function is an integer indicating whether or not the call was successful. When it was, this integer is followed by the return values of the invoked function.
---@param scriptName any @The name or index of the script containing the function
---@param functionName string @The name of the function that will be executed
---@param arguments table<number, any> @An arbitrary list of arguments that will be given to the invoked function
---@return table<number, any> @Returns at least 1 value indicating if the call succeeded: 0 The call was successful. In this case, the return values of the script are returned in addition to the call result, following the call result 1 The call failed because the entity with the specified index does not exist or has no Scripts component 2 The call failed because it came from another sector than the entity is in 3 The call failed because the given script was not found in the entity 4 The call failed because the given function was not found in the script  5 The call failed because the script's state has errors and is invalid
function Entity:invokeFunction(scriptName, functionName, arguments)
	return {nil}
end

---@param entity Entity
---@return any
function Entity:isCollectable(entity)
	return nil
end

---@param other Entity
---@return boolean
function Entity:isInDockingArea(other)
	return true
end

---@param point vec3
---@return any
function Entity:isInsideShield(point)
	return nil
end

---@param fromX number
---@param fromY number
---@param toX number
---@param toY number
---@return boolean,any
function Entity:isJumpRouteValid(fromX, fromY, toX, toY)
	return true,nil
end

---@return any
function Entity:isManned()
	return nil
end

--- Tests if the maximum number of turrets of this kind is not reached
---@param ScriptTurretTemplate TurretTemplate @the template of the turret to be placed
---@return any
function Entity:isTurretAllowed(ScriptTurretTemplate)
	return nil
end

--- Tests if the entity can jump to the specified coordinates
---@param x number @The x-coordinates of the target sector
---@param y number @The y-coordinates of the target sector
---@return number @Returns an error code: -1 The entity doesn't have a hyperspace drive. 0 The entity can jump. 1 The hyperspace drive needs to recharge. 2 The target sector is too far away. 3 The entity is facing the wrong direction. 4 The hyperspace drive is being jammed.
function Entity:jumpPossible(x, y)
	return 0
end

--- Teleports entity by vector
---@param delta vec3
---@return any @nothing
function Entity:moveBy(delta)
	return nil
end

--- @callback
--- Executed whenever the AI state of the entity changes
function Entity:onAIStateChanged(entityId, state)
end

--- @callback
--- Executed whenever all scripts values of the entity have been changed at once
function Entity:onAllScriptValuesChanged(entityId)
end

--- @callback
--- Executed when the entity gets selected by the player on the client.
function Entity:onAutoSelected()
end

--- @callback
--- Executed whenever the plan of the entity is changed.
function Entity:onBlockChanged(objectIndex, blockIndex, changeFlags)
end

--- @callback
--- Executed whenever a block object is damaged in the sector. This callback is executed after the damage is dealt to the block. Don't remove the block in this callback, this will lead to a crash.
function Entity:onBlockDamaged(objectIndex, blockIndex, inflictorId, damage, damageType)
end

--- @callback
--- Executed whenever a block of the block object got destroyed This callback is executed *after* the block was destroyed
function Entity:onBlockDestroyed(objectIndex, index, block, lastDamageInflictor, damageSource)
end

--- @callback
--- Executed whenever a block of the entity is healed. Don't remove the block in this callback, this will lead to a crash.
function Entity:onBlockHealed(objectIndex, blockIndex, damage)
end

--- @callback
--- Executed whenever the plan of the entity is changed.
function Entity:onBlockPlanChanged(objectIndex, allBlocksChanged)
end

--- @callback
--- Executed whenever new block are added to the entity. This callback is executed after the blocks were added.
function Entity:onBlocksAdded(objectIndex, wasRepaired, blockIndices)
end

--- @callback
--- Executed whenever a block will be removed from the plan by building (instead of combat). This callback is executed before the block is removed.  IMPORTANT! This only fires on blocks that the player directly chose to be removed. Blocks that get removed because they don't have a connection to the root block any more get signalled after removal by 'onBlocksRemoved'.
function Entity:onBlocksRemove(objectIndex, blockIndices)
end

--- @callback
--- Executed whenever a block is removed from the plan by building (instead of combat). This callback is executed after the block is removed.
function Entity:onBlocksRemoved(objectIndex, blockIndices)
end

--- @callback
--- Executed whenever all boarders were defeated
function Entity:onBoardersDefeated(entityId, attackingFaction)
end

--- @callback
--- Executed when boarders land on an entity
function Entity:onBoardersLand(entityId, attackingFaction, firstLanding)
end

--- @callback
--- Executed on every round of fighting with boarders
function Entity:onBoardingFight(entityId, attackingFaction)
end

--- @callback
--- Executed whenever an entity was boarded successfully
function Entity:onBoardingSuccessful(entityId, oldFactionIndex, newFactionIndex)
end

--- @callback
--- Executed when the plan of the entity breaks. This callback is executed after the block broke. This callback is expensive, don't register for it if you don't absolutely need it.
function Entity:onBreak(objectIndex, table_of_plans)
end

--- @callback
--- Executed whenever the captain of an entity in the sector changes. This callback is executed *after* the captain changed on the entity.
function Entity:onCaptainChanged(index, captain)
end

--- @callback
--- Executed whenever the cargo of an entity in the sector changes. This callback is executed *after* the cargo was changed on the entity.
function Entity:onCargoChanged(objectIndex, delta, good)
end

--- @callback
--- Executed whenever trading good loot gets collected by a player
function Entity:onCargoLootCollected(collector, lootIndex, amount, good, owner)
end

--- @callback
--- Executed whenever two block objects collided in the sector
function Entity:onCollision(objectIndexA, objectIndexB, damageA, damageB, steererA, steererB)
end

--- @callback
--- Executed whenever a player enters an empty craft or the last player exits it
function Entity:onCraftSeatEntered(entityId, seat, playerIndex, firstPlayer)
end

--- @callback
--- Executed whenever a player enters an empty craft or the last player exits it
function Entity:onCraftSeatLeft(entityId, seat, playerIndex, playersRemaining)
end

--- @callback
--- Executed whenever the crew of the entity changes. This callback is executed *after* the crew was changed on the entity.
function Entity:onCrewChanged(index)
end

--- @callback
--- Executed whenever trading good loot gets collected by a player
function Entity:onCrewLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever an entity is damaged in the sector.
function Entity:onDamaged(objectIndex, amount, inflictor, damageSource, damageType)
end

--- @callback
--- Executed when the entity was destroyed
function Entity:onDestroyed(index, lastDamageInflictor)
end

--- @callback
--- Executed whenever this entity was docked to another entity
function Entity:onDockedByEntity(dockeeId, dockerId)
end

--- @callback
--- Executed whenever an entity docks to another entity
function Entity:onEntityDocked(dockerId, dockeeId)
end

--- @callback
--- Executed whenever an entity undocks from another entity
function Entity:onEntityUndocked(dockerId, dockeeId)
end

--- @callback
--- Executed whenever a fighter is added to the entity
function Entity:onFighterAdded(entityId, squadIndex, fighterIndex, landed)
end

--- @callback
--- Executed whenever a fighter starts from a hangar of the entity
function Entity:onFighterLanded(entityId, squadIndex, fighterId)
end

--- @callback
--- Executed whenever a fighter is removed from the entity, before it gets removed
function Entity:onFighterRemove(entityId, squadIndex, fighterIndex, started)
end

--- @callback
--- Executed whenever a fighter is removed from the entity, after it got removed
function Entity:onFighterRemoved(entityId, squadIndex, fighterIndex, started)
end

--- @callback
--- Executed whenever a fighter starts from a hangar of the entity
function Entity:onFighterStarted(entityId, squadIndex, fighterId)
end

--- @callback
--- Executed whenever an entity is healed in the sector.
function Entity:onHealed(objectIndex, amount, inflictor)
end

--- @callback
--- Executed whenever a block object is hit by a shot in the sector. Don't delete the block that is hit by the shot, this will lead to a crash.
function Entity:onHullHit(objectIndex, blockIndex, shooterIndex, damage, location)
end

--- @callback
--- Executed whenever an entity in the sector jumps into hyperspace. Won't be triggered when changing sector through background simulation, death, or gate/wormholes.
function Entity:onHyperspaceEntered(entityId, dx, dy)
end

--- @callback
--- Executed whenever inventory item loot gets collected by
function Entity:onInventoryItemLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever the entity jumps into another sector.
function Entity:onJump(shipIndex, x, y)
end

--- @callback
--- Executed whenever a player starts a new hyperspace jump route calculation
function Entity:onJumpRouteCalculationStarted(playerIndex, destinationX, destinationY)
end

--- @callback
--- Executed whenever loot gets collected by anyone, be it player or AI faction
function Entity:onLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever material loot gets collected by
function Entity:onMaterialLootCollected(collector, lootIndex, materialType, value)
end

--- @callback
--- Executed whenever money loot gets collected by the entity
function Entity:onMoneyLootCollected(collector, lootIndex, value)
end

--- @callback
--- Executed whenever a passenger is added to an entity in the sector. This callback is executed *after* the passenger was added.
function Entity:onPassengerAdded(index, passenger)
end

--- @callback
--- Executed whenever a passenger is removed from an entity in the sector. This callback is executed *after* the passenger was removed.
function Entity:onPassengerRemoved(index, passenger)
end

--- @callback
--- Executed whenever passengers are removed from the entity. This callback is executed *after* the passengers were removed.
function Entity:onPassengersRemoved(index, amount)
end

--- @callback
--- Executed whenever the plan of an entity was modified by building, meaning adding or removing blocks.
function Entity:onPlanModifiedByBuilding(shipIndex)
end

--- @callback
--- Executed whenever a script was added to the entity
function Entity:onScriptAdded(entityId, scriptIndex, scriptPath)
end

--- @callback
--- Executed after a script was removed from the entity
function Entity:onScriptRemoved(entityId, oldScriptIndex, scriptPath)
end

--- @callback
--- Executed whenever a script value of the entity was changed
function Entity:onScriptValueChanged(entityId, name, value)
end

--- @callback
--- Executed whenever the entity enters a sector.
function Entity:onSectorEntered(entityId, x, y)
end

--- @callback
--- Executed when the entity gets selected by the player on the client.
function Entity:onSelected()
end

--- @callback
--- Executed whenever the entity is to be deleted.
function Entity:onSetForDeletion(entityId, deletionType)
end

--- @callback
--- Executed whenever the torpedo type that is automatically loaded into a shaft was assigned
function Entity:onShaftAutomaticLoadingTypeAssign(entityId, shaftIndex, type)
end

--- @callback
--- Executed whenever a torpedo shaft was assigned a new weapon index
function Entity:onShaftWeaponIndexAssign(entityId, shaftIndex, weaponIndex)
end

--- @callback
--- Executed whenever the entities shield activates
function Entity:onShieldActivate(entityId)
end

--- @callback
--- Executed whenever the entities shield is damaged
function Entity:onShieldDamaged(entityId, amount, damageType, inflictorId)
end

--- @callback
--- Executed whenever the entities shield deactivates
function Entity:onShieldDeactivate(entityId)
end

--- @callback
--- Executed whenever the entities shield is healed
function Entity:onShieldHealed(entityId, amount)
end

--- @callback
--- Executed whenever an object's shield is hit by a shot in the sector.
function Entity:onShieldHit(objectIndex, shooterIndex, damage, location)
end

--- @callback
--- Executed whenever the entity fires a shot
function Entity:onShotFired(entityId)
end

--- @callback
--- Executed whenever a block object is hit by a shot in the sector.
function Entity:onShotHit(objectIndex, shooterIndex, location)
end

--- @callback
--- Executed whenever a squad is removed from the entity
function Entity:onSquadAdded(entityId, index)
end

--- @callback
--- Executed whenever the orders of a squad of the entity change
function Entity:onSquadOrdersChanged(entityId, squadIndex, orders, targetId)
end

--- @callback
--- Executed whenever a squad is removed from the entity, before the squad gets removed
function Entity:onSquadRemove(entityId, index)
end

--- @callback
--- Executed whenever a squad is removed from the entity, after the squad got removed
function Entity:onSquadRemoved(entityId, index)
end

--- @callback
--- Executed when a dialog is started.
function Entity:onStartDialog(objectIndex)
end

--- @callback
--- Executed whenever the entity starts firing
function Entity:onStartFiring(entityId)
end

--- @callback
--- Executed whenever the entity stops firing
function Entity:onStopFiring(entityId)
end

--- @callback
--- Executed whenever system upgrade loot gets collected by
function Entity:onSystemUpgradeLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever the systems of a ship in the sector changed. This callback is executed *after* the system was changed on the entity.
function Entity:onSystemsChanged(shipIndex)
end

--- @callback
--- Executed whenever a torpedo added to the entity
function Entity:onTorpedoAdded(entityId, shaftIndex, torpedoIndex, torpedo)
end

--- @callback
--- Executed whenever a block object is hit by a torpedo in the sector.
function Entity:onTorpedoHit(objectIndex, shooterIndex, torpedoIndex)
end

--- @callback
--- Executed whenever a block object is hit by a torpedo in the sector. Don't delete the block that is hit by the torpedo, this will lead to a crash.
function Entity:onTorpedoHullHit(objectIndex, blockIndex, shooterIndex, damage, torpedoIndex)
end

--- @callback
--- Executed whenever a torpedo was launched from the entity
function Entity:onTorpedoLaunched(entityId, torpedoId)
end

--- @callback
--- Executed whenever a torpedo is about to be removed from the entity
function Entity:onTorpedoRemove(entityId, shaftIndex, torpedoIndex)
end

--- @callback
--- Executed whenever a torpedo was removed from the entity
function Entity:onTorpedoRemoved(entityId, shaftIndex, torpedoIndex)
end

--- @callback
--- Executed whenever an object's shield is hit by a torpedo in the sector.
function Entity:onTorpedoShieldHit(objectIndex, shooterIndex, damage, torpedoIndex)
end

--- @callback
--- Executed whenever a turret of the entity was added
function Entity:onTurretAdded(shipIndex, turretIndex)
end

--- @callback
--- Executed whenever a turret of the entity was destroyed
function Entity:onTurretDestroyed(turretIndex, shipIndex, lastDamageInflictor)
end

--- @callback
--- Executed whenever turret loot gets collected by the entity
function Entity:onTurretLootCollected(collector, lootIndex)
end

--- @callback
--- Executed whenever a turret of the entity was removed
function Entity:onTurretRemoved(shipIndex, turretIndex)
end

--- @callback
--- Executed whenever a turret of the entity was removed by the player
function Entity:onTurretRemovedByPlayer(shipIndex, turretIndex)
end

--- @callback
--- Executed whenever this entity was undocked from another entity
function Entity:onUndockedFromEntity(dockeeId, dockerId)
end

--- Register a callback in the entity. The callback receiver has to be inside the same sector for the registration to succeed. The callback will be removed if either the entity or the receiver leaves the sector or gets destroyed. Double registration of callbacks doesn't work. When the same callback to the same callback of the same script instance is registered twice, it will still only be called once.
---@param callbackName string @The name of the callback
---@param functionName string @The name of the function that will be executed in the script when the callback happens
---@return number @0 on success, 1 if the registration failed
function Entity:registerCallback(callbackName, functionName)
	return 0
end

--- Deletes bonus
---@param key number @Location of the bonus
---@return any @nothing
function Entity:removeBonus(key)
	return nil
end

--- Removes cargo from the entity. When given a TradingGood, an exact check for that good will be performed. When given a string, only a name check will be performed, and which cargo will be removed first is undefined if there are multiple goods with the same name. An example would be Energy Cells vs. Stolen Energy Cells. The 'name' property is the same, but the 'stolen' property is different.
---@param good any @Either a TradingGood or a string with the name of a good.
---@param amount number @The amount of cargo that should be removed. If this is more than there is on the ship, all specified cargo will be removed.
---@return any @nothing
function Entity:removeCargo(good, amount)
	return nil
end

---@param number number
---@param crewman CrewMan
---@return any
function Entity:removeCrew(number, crewman)
	return nil
end

---@param script any
---@return any @nothing
function Entity:removeScript(script)
	return nil
end

--- Deletes all bonuses added by the current script
---@return any @nothing
function Entity:removeScriptBonuses()
	return nil
end

---@param path string
---@return any
function Entity:resolveScriptPath(path)
	return nil
end

---@return boolean
function Entity:sendCallback()
	return true
end

--- If AccumulatingBlockHealth is true, a block needs to take as much damage as would be necessary to destroy all its children before it itself is destroyed. If it is set to false, the entity's blocks will have only their own durability. Set it to false if you want your entity to easily break apart, e.g. for wreckages.
---@param boolean boolean
---@return any
function Entity:setAccumulatingBlockHealth(boolean)
	return nil
end

---@param seat number
---@param _in vec3
---@return any @nothing
function Entity:setAimedPosition(seat, _in)
	return nil
end

---@param _in number
---@return any @nothing
function Entity:setAttachedBlockIndex(_in)
	return nil
end

---@param captain nil | Captain
---@return any @nothing
function Entity:setCaptain(captain)
	return nil
end

--- Sets the entities' ability to drop its attached turrets. If set to true (default) the ship has a chance to drop a turret that's attached to it when it's destroyed. This is only enabled for NPC entities.
---@param boolean boolean
---@return any @nothing
function Entity:setDropsAttachedTurrets(boolean)
	return nil
end

--- Sets the entities' ability to drop normal loot. Affects dropping of money, resources, cargo, turrets and upgrades. 'Loot' component is not affected by this.
---@param boolean boolean
---@return any @nothing
function Entity:setDropsLoot(boolean)
	return nil
end

---@param _in number
---@param reason number
---@return any @nothing
function Entity:setMalusFactor(_in, reason)
	return nil
end

---@param _in boolean
---@return any @nothing
function Entity:setManned(_in)
	return nil
end

--- Set the new plan of the entity. The entity will get deleted if the plan is empty. This moves all the data out of the plan that is used as the first argument. The content of the plan given as argument is then undefined, but still valid. It might be empty, it might contain the previous plan. This operation is independent of the size of the plan, use it when you have to set large plans with lots of blocks.
---@param plan BlockPlan @The new BlockPlan of the entity
---@return any @nothing
function Entity:setMovePlan(plan)
	return nil
end

--- Set the new plan of the entity. The entity will get deleted if the plan is empty. This copies the entire plan that is given as argument, keep that in mind when setting plans with large block counts.
---@param plan BlockPlan @The new BlockPlan of the entity
---@return any @nothing
function Entity:setPlan(plan)
	return nil
end

--- Sets the title that can be used as title in menus
---@param title string @a string that will be used as title, can be a format string for easier translation.
---@param arguments table<number, string_pair>
---@return any
function Entity:setTitle(title, arguments)
	return nil
end

--- Sets the arguments to a title
---@param arguments table<number, string_pair> @Set the string arguments as vector of string_pair.
---@return any @nothing
function Entity:setTitleArguments(arguments)
	return nil
end

---@param _in number
---@return any @nothing
function Entity:setTurretSize(_in)
	return nil
end

---@param _in number
---@return any @nothing
function Entity:setTurretTurningSpeed(_in)
	return nil
end

--- Sets a custom value
---@param key string @A string that serves as the name of the value
---@param value any @The value to save. Must be bool, number, string or nil. If nil is given, the value will be deleted.
---@return any
function Entity:setValue(key, value)
	return nil
end

--- Tells the ship to fly to given location, directly and without pathfinding.
---@param location vec3 @the location to fly to (in global coordinates) Paired with setting desiredVelocity to 0, this can be used to rotate the ship to a given direction.
---@return any @nothing
function Entity:singleFlyToLocationTick(location)
	return nil
end

---@param callbackName string
---@param functionName string
---@return number
function Entity:unregisterCallback(callbackName, functionName)
	return 0
end

---@param time any
---@return any @nothing
function Entity:waitUntilAsyncWorkFinished(time)
	return nil
end

