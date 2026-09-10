---@class EntityDescriptor
EntityDescriptor = {

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

---@return EntityDescriptor
function EntityDescriptor()
	return EntityDescriptor
end

--- Adds a flat bias for stat of type type. This bias will be added to stat after multipliers are considered. Inherited from Entity
---@param type number @Type of Bonus, e.g. acceleration, higher level crew
---@param value number @Bias added to base stats.
---@return any @key that can be used to access the multiplier
function EntityDescriptor:addAbsoluteBias(type, value)
	return nil
end

--- Adds a multiplyer for stat of type type. This is to increase a stat, so a factor of 0.3 will become 1.3. Inherited from Entity
---@param type number @Type of Bonus, e.g. acceleration, higher level crew
---@param factor number @Factor that is used as Multiplier
---@return any @key that can be used to access the multiplier
function EntityDescriptor:addBaseMultiplier(type, factor)
	return nil
end

--- Adds cargo to the entity. If the amount specified exceeds the maximum capacity of the cargo bay, as much cargo as still fits in will be added. Inherited from Entity
---@param good TradingGood @TradingGood that is to be added.
---@param amount number @The amount of cargo that should be added.
---@return any @nothing
function EntityDescriptor:addCargo(good, amount)
	return nil
end

---@param type ComponentType
---@return any @nothing
function EntityDescriptor:addComponent(type)
	return nil
end

---@return any @nothing
function EntityDescriptor:addComponents()
	return nil
end

--- Inherited from Entity
---@param number number
---@param crewman CrewMan
---@return any @nothing
function EntityDescriptor:addCrew(number, crewman)
	return nil
end

--- Exchanges flat bias at key with new value Inherited from Entity
---@param type number @Bonus type
---@param key number @Location of the bonus that will be changed
---@param value number @New value
---@return any @key that can be used to access the multiplier
function EntityDescriptor:addKeyedAbsoluteBias(type, key, value)
	return nil
end

--- Exchanges multiplier at key with new value Inherited from Entity
---@param type number @Bonus type
---@param key number @Location of the bonus that will be changed
---@param value number @New value
---@return any @key that can be used to access the multiplier
function EntityDescriptor:addKeyedBaseMultiplier(type, key, value)
	return nil
end

--- Exchanges multiplier at key with new value Inherited from Entity
---@param type number @Bonus type
---@param key number @Location of the bonus that will be changed
---@param value number @New value
---@return any @key that can be used to access the multiplier
function EntityDescriptor:addKeyedMultiplier(type, key, value)
	return nil
end

--- Exchanges bias at key with new value Inherited from Entity
---@param type number @Bonus type
---@param key number @Location of the bonus that will be changed
---@param value number @New value
---@return any @key that can be used to access the multiplier
function EntityDescriptor:addKeyedMultiplyableBias(type, key, value)
	return nil
end

--- Adds a multiplyer for stat of type type. The factor will be used unchanged. Inherited from Entity
---@param type number @Type of Bonus, e.g. acceleration, higher level crew
---@param factor number @Factor that is used as Multiplier
---@return any @key that can be used to access the multiplier
function EntityDescriptor:addMultiplier(type, factor)
	return nil
end

--- Adds a bias for stat of type type. This bias will be added to stat before multipliers are considered. Inherited from Entity
---@param type number @Type of Bonus, e.g. acceleration, higher level crew
---@param value number @Bias added to base stats.
---@return any @key that can be used to access the multiplier
function EntityDescriptor:addMultiplyableBias(type, value)
	return nil
end

--- Adds a new script to an entity Inherited from Entity
---@param scriptPath string @The path of the script that should be added
---@param arguments table<number, any> @An arbitrary number of arguments that will be given to the 'initialize' function of the added script
---@return any @0 on success, 1 if the entity could not be found
function EntityDescriptor:addScript(scriptPath, arguments)
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:addScriptOnce()
	return nil
end

--- Inherited from Entity
---@param turret TurretTemplate
---@param position Matrix
---@param part number
---@return Uuid
function EntityDescriptor:addTurret(turret, position, part)
	return 0
end

--- Inherited from Entity
---@param time number
---@return any @nothing
function EntityDescriptor:blockHyperspace(time)
	return nil
end

--- Check how many functions are registered to a callback from the current script VM. Inherited from Entity
---@param callbackName string @The name of the callback
---@param functionName any @The name of the function for which to check. If nil, will count all functions that are registered to this callback.
---@return number @The amount of functions registered to the callback
function EntityDescriptor:callbacksRegistered(callbackName, functionName)
	return 0
end

--- Inherited from Entity
---@param number number
---@param profession number
---@param change boolean
---@return any,any,table<number,string>
function EntityDescriptor:canAddCrew(number, profession, change)
	return nil,nil,{0,""}
end

--- Inherited from Entity
---@param number number
---@param profession number
---@return any @nothing
function EntityDescriptor:changeCrew(number, profession)
	return nil
end

--- Adds delta to shield durability Inherited from Entity
---@param delta number @Returns
---@return any
function EntityDescriptor:changeShield(delta)
	return nil
end

--- Inherited from Entity
---@return any @nothing
function EntityDescriptor:clearCargoBay()
	return nil
end

--- Removes all custom values of the object Inherited from Entity
---@return any @nothing
function EntityDescriptor:clearValues()
	return nil
end

--- Damages shield by delta amount, location and inflictorId are not necessary, but can be added if it is needed, e.g. you want to do effects on hitpoint. Inherited from Entity
---@param amount number
---@param location vec3 @inflictorId
---@param inflictorId Uuid
---@param damageSource any
---@param damageType any
---@return any @nothing
function EntityDescriptor:damageShield(amount, location, inflictorId, damageSource, damageType)
	return nil
end

--- Destroy entity by inflicting more damage than durability of entity Inherited from Entity
---@param inflictorId Uuid @Index of the entity that destroys the block
---@param damageSource any @Source of damage. Can be Weaponry, Collision, Decay, Torpedo or Arbitrary. *
---@param damageType any @Type of damage received. Damage can be of type Physical, Energy, Electric, Plasma, AntiMatter or Fragments.
---@return any @nothing
function EntityDescriptor:destroy(inflictorId, damageSource, damageType)
	return nil
end

--- Destroy one block Inherited from Entity
---@param index number @Index of the block that is destroyed
---@param inflictorId Uuid @Index of the entity that destroys the block
---@param damageSource any @Source of damage. Can be Weaponry, Collision, Decay, Torpedo or Arbitrary.
---@return any @nothing
function EntityDescriptor:destroyBlock(index, inflictorId, damageSource)
	return nil
end

--- Destroys cargo. The destruction distribution is generally equal over all goods. Inherited from Entity
---@param volume number @The amount of volume that should be destroyed.
---@return any @nothing
function EntityDescriptor:destroyCargo(volume)
	return nil
end

--- Inherited from Entity
---@param time number
---@return any @nothing
function EntityDescriptor:disableFlightAssistFor(time)
	return nil
end

--- Inherited from Entity
---@param time number
---@return any @nothing
function EntityDescriptor:distortHyperspace(time)
	return nil
end

--- Finds all cargos with the given name. Inherited from Entity
---@param name string @A string that will be matched with the 'name' property of the cargos.
---@return table<TradingGood,number> @A map containing all matching goods, with the good as key and amount as value.
function EntityDescriptor:findCargos(name)
	return {TradingGood,0}
end

--- Inherited from Entity
---@param seat number
---@return vec3
function EntityDescriptor:getAimedPositionBySeat(seat)
	return vec3
end

--- Inherited from Entity
---@return table<number, vec3>
function EntityDescriptor:getAimedPositions()
	return {vec3}
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getAllowedArbitraryTurrets()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getAllowedArmedTurrets()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getAllowedUnarmedTurrets()
	return nil
end

--- Returns the Index of the block that the turret is build on Inherited from Entity
---@return any
function EntityDescriptor:getAttachedBlockIndex()
	return nil
end

--- Returns value with included bonus, in case a bonus exists. Returns Nil if no bonuses at all, returns value if no bonuses for this stat exist. Inherited from Entity
---@param type number @type of bonus stat, e.g. acceleration, higher level crew
---@param value number @the value, that might be changed by bonuses
---@return any
function EntityDescriptor:getBoostedValue(type, value)
	return nil
end

--- Returns Bounding Box for entity, use this if you need exact Bounding Box, e.g. for collision detection when entities are close to each other. Inherited from Entity
---@return Box
function EntityDescriptor:getBoundingBox()
	return Box
end

--- Returns Bounding Sphere for entity. Much faster than Bounding Box, but not as accurate. Use this if you need to check often. Inherited from Entity
---@return Sphere
function EntityDescriptor:getBoundingSphere()
	return Sphere
end

--- Inherited from Entity
---@return Captain
function EntityDescriptor:getCaptain()
	return Captain
end

--- Inherited from Entity
---@param n number
---@return TradingGood,table<number, number>
function EntityDescriptor:getCargo(n)
	return TradingGood,{0}
end

--- Counts all goods of the given type. When given a string, it will match the 'name' property of the goods. When given a TradingGood it will match the exact good. Inherited from Entity
---@param name any @Either a TradingGood or a string containing the name of a trading good.
---@return number @The number of goods
function EntityDescriptor:getCargoAmount(name)
	return 0
end

--- Inherited from Entity
---@return table<TradingGood,number>
function EntityDescriptor:getCargos()
	return {TradingGood,0}
end

---@param type ComponentType
---@return UserObject
function EntityDescriptor:getComponent(type)
	return UserObject
end

--- Inherited from Entity
---@param profession number
---@return any
function EntityDescriptor:getCrewMembers(profession)
	return nil
end

--- Lists all players and alliances that contributed damage to the entity Inherited from Entity
---@return table<number, number> @Indices of all players and alliances that contributed damage to the entity
function EntityDescriptor:getDamageContributorPlayerFactions()
	return {0}
end

--- Lists all players that contributed damage to the entity Inherited from Entity
---@return table<number, number> @Indices of all players that contributed damage to the entity
function EntityDescriptor:getDamageContributorPlayers()
	return {0}
end

--- Lists all factions that contributed damage to the entity Inherited from Entity
---@return table<number, number> @Indices of all factions that contributed damage to the entity
function EntityDescriptor:getDamageContributors()
	return {0}
end

--- Returns Bounding Box for entity, but enlarged to also fit around all docked objects. Use this if you need exact Bounding Box, e.g. for collision detection when entities are close to each other. Inherited from Entity
---@return Box
function EntityDescriptor:getDockedGroupBoundingBox()
	return Box
end

--- Returns Bounding Box for entity, but enlarged to also fit around all docked objects. Use this if you need exact Bounding Box, e.g. for collision detection when entities are close to each other. Inherited from Entity
---@return Sphere
function EntityDescriptor:getDockedGroupBoundingSphere()
	return Sphere
end

--- Lists all docking positions that the entity has Inherited from Entity
---@return any @A table that contains a key-value pair (id, table) for each dock:
function EntityDescriptor:getDockingPositions()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getFreeArbitraryTurrets()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getFreeArmedTurrets()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getFreeUnarmedTurrets()
	return nil
end

--- Returns the plan of the entity. This copies the entire plan, keep that in mind when using plans with large block counts. Inherited from Entity
---@return BlockPlan @A copy of the plan of the entity
function EntityDescriptor:getFullPlanCopy()
	return BlockPlan
end

--- Inherited from Entity
---@return Material
function EntityDescriptor:getLowestMineableMaterial()
	return Material
end

--- Inherited from Entity
---@return any,any
function EntityDescriptor:getMalusFactor()
	return nil,nil
end

--- Inherited from Entity
---@return Material
function EntityDescriptor:getMineableMaterial()
	return Material
end

--- Inherited from Entity
---@return table<number, number>
function EntityDescriptor:getMineableResources()
	return {0}
end

--- Inherited from Entity
---@return number
function EntityDescriptor:getMoneyLootAmount()
	return 0
end

--- Returns the plan of the entity. This function will move the plan out of the entity, and replace the entity's plan with a single block. This operation is independent of the size of the plan, use it when you have to get large plans with lots of blocks. Inherited from Entity
---@return BlockPlan @The plan of the entity
function EntityDescriptor:getMovePlan()
	return BlockPlan
end

--- Inherited from Entity
---@param other Entity
---@return any
function EntityDescriptor:getNearestDistance(other)
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getNumArmedTurrets()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getNumMiningTurrets()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getNumSalvagingTurrets()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getNumUnarmedTurrets()
	return nil
end

--- Returns Indices of piloting players Inherited from Entity
---@return table<number, number> @multiple return values: indices of players
function EntityDescriptor:getPilotIndices()
	return {0}
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getPlanMoneyValue()
	return nil
end

--- Inherited from Entity
---@return table<number, number>
function EntityDescriptor:getPlanResourceValue()
	return {0.0}
end

--- Inherited from Entity
---@return number
function EntityDescriptor:getResourceLootAmount()
	return 0
end

--- Inherited from Entity
---@return table<number,string>
function EntityDescriptor:getScripts()
	return {0,""}
end

--- Retrieves the arguments to a title Inherited from Entity
---@return table<string,string>
function EntityDescriptor:getTitleArguments()
	return {"",""}
end

--- Retrieves the title as NamedFormat Inherited from Entity
---@return NamedFormat
function EntityDescriptor:getTitleFormat()
	return NamedFormat
end

--- Inherited from Entity
---@param index number
---@return Entity
function EntityDescriptor:getTurret(index)
	return Entity
end

--- Inherited from Entity
---@param turret TurretTemplate
---@param number number
---@return Matrix,table<number, number>
function EntityDescriptor:getTurretPositions(turret, number)
	return Matrix,{0}
end

--- Inherited from Entity
---@param turret TurretTemplate
---@param number number
---@return Matrix,table<number, number>
function EntityDescriptor:getTurretPositionsLineOfSight(turret, number)
	return Matrix,{0}
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getTurretSize()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getTurretTemplateSize()
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getTurretTurningSpeed()
	return nil
end

--- Inherited from Entity
---@return table<number, Entity>
function EntityDescriptor:getTurrets()
	return {Entity}
end

--- Inherited from Entity
---@return any
function EntityDescriptor:getUndamagedPlanMoneyValue()
	return nil
end

--- Inherited from Entity
---@return table<number, number>
function EntityDescriptor:getUndamagedPlanResourceValue()
	return {0.0}
end

--- Retrieves a custom value saved in the entity with the given key Inherited from Entity
---@param key string @A string that serves as the name of the value
---@return any @The value if the key exists, otherwise nil
function EntityDescriptor:getValue(key)
	return nil
end

--- Retrieves all key-value pairs of custom values of the entity Inherited from Entity
---@return table<string,any> @A table containing all custom key-value pairs
function EntityDescriptor:getValues()
	return {"",nil}
end

--- Inherited from Entity
---@param type number
---@return boolean
function EntityDescriptor:hasComponent(type)
	return true
end

--- Inherited from Entity
---@param name string
---@return any
function EntityDescriptor:hasScript(name)
	return nil
end

--- Increases durability of the plan of the Entity  Inherited from Entity
---@param damage number @The amount of durability that will be restored
---@param index number @Index of the block that will be restored
---@param location vec3 @vector containing the hit point, if unknown/unnecessary use empty vector
---@param inflictorID Uuid @Index of the entity that heals
---@return any @nothing
function EntityDescriptor:heal(damage, index, location, inflictorID)
	return nil
end

--- Increases shield durability by delta Inherited from Entity
---@param delta number @Returns
---@return any
function EntityDescriptor:healShield(delta)
	return nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:hyperspaceBlocked()
	return nil
end

--- Inflicts damage to the plan of the Entity  Inherited from Entity
---@param damage number @The amount of damage that will be dealt
---@param damageSource any @The source of the damage. Can be Weaponry, Collision, Decay, Torpedo or Arbitrary.
---@param damageType any @Type of damage received. Damage can be of type Physical, Energy, Electric, Plasma, AntiMatter or Fragments
---@param index number @Index of the block that will receive the damage
---@param location vec3 @vector containing the hit point, if unknown / unnecessary use empty vector
---@param inflictorId Uuid @Index of the entity that caused the damage
---@return any @nothing
function EntityDescriptor:inflictDamage(damage, damageSource, damageType, index, location, inflictorId)
	return nil
end

--- Invokes a function in a script of the entity. Use this function to invoke functions from one script in another script. The first return value of the function is an integer indicating whether or not the call was successful. When it was, this integer is followed by the return values of the invoked function. Inherited from Entity
---@param scriptName any @The name or index of the script containing the function
---@param functionName string @The name of the function that will be executed
---@param arguments table<number, any> @An arbitrary list of arguments that will be given to the invoked function
---@return table<number, any> @Returns at least 1 value indicating if the call succeeded: 0 The call was successful. In this case, the return values of the script are returned in addition to the call result, following the call result 1 The call failed because the entity with the specified index does not exist or has no Scripts component 2 The call failed because it came from another sector than the entity is in 3 The call failed because the given script was not found in the entity 4 The call failed because the given function was not found in the script  5 The call failed because the script's state has errors and is invalid
function EntityDescriptor:invokeFunction(scriptName, functionName, arguments)
	return {nil}
end

--- Inherited from Entity
---@param entity Entity
---@return any
function EntityDescriptor:isCollectable(entity)
	return nil
end

--- Inherited from Entity
---@param other Entity
---@return boolean
function EntityDescriptor:isInDockingArea(other)
	return true
end

--- Inherited from Entity
---@param point vec3
---@return any
function EntityDescriptor:isInsideShield(point)
	return nil
end

--- Inherited from Entity
---@param fromX number
---@param fromY number
---@param toX number
---@param toY number
---@return boolean,any
function EntityDescriptor:isJumpRouteValid(fromX, fromY, toX, toY)
	return true,nil
end

--- Inherited from Entity
---@return any
function EntityDescriptor:isManned()
	return nil
end

--- Tests if the maximum number of turrets of this kind is not reached Inherited from Entity
---@param ScriptTurretTemplate TurretTemplate @the template of the turret to be placed
---@return any
function EntityDescriptor:isTurretAllowed(ScriptTurretTemplate)
	return nil
end

--- Tests if the entity can jump to the specified coordinates Inherited from Entity
---@param x number @The x-coordinates of the target sector
---@param y number @The y-coordinates of the target sector
---@return number @Returns an error code: -1 The entity doesn't have a hyperspace drive. 0 The entity can jump. 1 The hyperspace drive needs to recharge. 2 The target sector is too far away. 3 The entity is facing the wrong direction. 4 The hyperspace drive is being jammed.
function EntityDescriptor:jumpPossible(x, y)
	return 0
end

--- Teleports entity by vector Inherited from Entity
---@param delta vec3
---@return any @nothing
function EntityDescriptor:moveBy(delta)
	return nil
end

--- Register a callback in the entity. The callback receiver has to be inside the same sector for the registration to succeed. The callback will be removed if either the entity or the receiver leaves the sector or gets destroyed. Double registration of callbacks doesn't work. When the same callback to the same callback of the same script instance is registered twice, it will still only be called once. Inherited from Entity
---@param callbackName string @The name of the callback
---@param functionName string @The name of the function that will be executed in the script when the callback happens
---@return number @0 on success, 1 if the registration failed
function EntityDescriptor:registerCallback(callbackName, functionName)
	return 0
end

--- Deletes bonus Inherited from Entity
---@param key number @Location of the bonus
---@return any @nothing
function EntityDescriptor:removeBonus(key)
	return nil
end

--- Removes cargo from the entity. When given a TradingGood, an exact check for that good will be performed. When given a string, only a name check will be performed, and which cargo will be removed first is undefined if there are multiple goods with the same name. An example would be Energy Cells vs. Stolen Energy Cells. The 'name' property is the same, but the 'stolen' property is different. Inherited from Entity
---@param good any @Either a TradingGood or a string with the name of a good.
---@param amount number @The amount of cargo that should be removed. If this is more than there is on the ship, all specified cargo will be removed.
---@return any @nothing
function EntityDescriptor:removeCargo(good, amount)
	return nil
end

---@param type ComponentType
---@return any @nothing
function EntityDescriptor:removeComponent(type)
	return nil
end

--- Inherited from Entity
---@param number number
---@param crewman CrewMan
---@return any
function EntityDescriptor:removeCrew(number, crewman)
	return nil
end

--- Inherited from Entity
---@param script any
---@return any @nothing
function EntityDescriptor:removeScript(script)
	return nil
end

--- Deletes all bonuses added by the current script Inherited from Entity
---@return any @nothing
function EntityDescriptor:removeScriptBonuses()
	return nil
end

--- Inherited from Entity
---@param path string
---@return any
function EntityDescriptor:resolveScriptPath(path)
	return nil
end

--- Inherited from Entity
---@return boolean
function EntityDescriptor:sendCallback()
	return true
end

--- If AccumulatingBlockHealth is true, a block needs to take as much damage as would be necessary to destroy all its children before it itself is destroyed. If it is set to false, the entity's blocks will have only their own durability. Set it to false if you want your entity to easily break apart, e.g. for wreckages. Inherited from Entity
---@param boolean boolean
---@return any
function EntityDescriptor:setAccumulatingBlockHealth(boolean)
	return nil
end

--- Inherited from Entity
---@param seat number
---@param _in vec3
---@return any @nothing
function EntityDescriptor:setAimedPosition(seat, _in)
	return nil
end

--- Inherited from Entity
---@param _in number
---@return any @nothing
function EntityDescriptor:setAttachedBlockIndex(_in)
	return nil
end

--- Inherited from Entity
---@param captain nil | Captain
---@return any @nothing
function EntityDescriptor:setCaptain(captain)
	return nil
end

--- Sets the entities' ability to drop its attached turrets. If set to true (default) the ship has a chance to drop a turret that's attached to it when it's destroyed. This is only enabled for NPC entities. Inherited from Entity
---@param boolean boolean
---@return any @nothing
function EntityDescriptor:setDropsAttachedTurrets(boolean)
	return nil
end

--- Sets the entities' ability to drop normal loot. Affects dropping of money, resources, cargo, turrets and upgrades. 'Loot' component is not affected by this. Inherited from Entity
---@param boolean boolean
---@return any @nothing
function EntityDescriptor:setDropsLoot(boolean)
	return nil
end

--- Inherited from Entity
---@param _in number
---@param reason number
---@return any @nothing
function EntityDescriptor:setMalusFactor(_in, reason)
	return nil
end

--- Inherited from Entity
---@param _in boolean
---@return any @nothing
function EntityDescriptor:setManned(_in)
	return nil
end

--- Set the new plan of the entity. The entity will get deleted if the plan is empty. This moves all the data out of the plan that is used as the first argument. The content of the plan given as argument is then undefined, but still valid. It might be empty, it might contain the previous plan. This operation is independent of the size of the plan, use it when you have to set large plans with lots of blocks. Inherited from Entity
---@param plan BlockPlan @The new BlockPlan of the entity
---@return any @nothing
function EntityDescriptor:setMovePlan(plan)
	return nil
end

--- Set the new plan of the entity. The entity will get deleted if the plan is empty. This copies the entire plan that is given as argument, keep that in mind when setting plans with large block counts. Inherited from Entity
---@param plan BlockPlan @The new BlockPlan of the entity
---@return any @nothing
function EntityDescriptor:setPlan(plan)
	return nil
end

--- Sets the title that can be used as title in menus Inherited from Entity
---@param title string @a string that will be used as title, can be a format string for easier translation.
---@param arguments table<number, string_pair>
---@return any
function EntityDescriptor:setTitle(title, arguments)
	return nil
end

--- Sets the arguments to a title Inherited from Entity
---@param arguments table<number, string_pair> @Set the string arguments as vector of string_pair.
---@return any @nothing
function EntityDescriptor:setTitleArguments(arguments)
	return nil
end

--- Inherited from Entity
---@param _in number
---@return any @nothing
function EntityDescriptor:setTurretSize(_in)
	return nil
end

--- Inherited from Entity
---@param _in number
---@return any @nothing
function EntityDescriptor:setTurretTurningSpeed(_in)
	return nil
end

--- Sets a custom value Inherited from Entity
---@param key string @A string that serves as the name of the value
---@param value any @The value to save. Must be bool, number, string or nil. If nil is given, the value will be deleted.
---@return any
function EntityDescriptor:setValue(key, value)
	return nil
end

--- Tells the ship to fly to given location, directly and without pathfinding. Inherited from Entity
---@param location vec3 @the location to fly to (in global coordinates) Paired with setting desiredVelocity to 0, this can be used to rotate the ship to a given direction.
---@return any @nothing
function EntityDescriptor:singleFlyToLocationTick(location)
	return nil
end

--- Inherited from Entity
---@param callbackName string
---@param functionName string
---@return number
function EntityDescriptor:unregisterCallback(callbackName, functionName)
	return 0
end

--- Inherited from Entity
---@param time any
---@return any @nothing
function EntityDescriptor:waitUntilAsyncWorkFinished(time)
	return nil
end

