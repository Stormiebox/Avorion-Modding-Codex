---@class ShipDatabaseEntry
ShipDatabaseEntry = {

	faction = 0, -- int
	name = "", -- string

}

---@return ShipDatabaseEntry
---@param faction number
---@param name string
function ShipDatabaseEntry(faction, name)
	return ShipDatabaseEntry
end

--- Adds a script to the entity. For technical reasons, it's not possible to pass initialization values here. The script will be attached as if it was restored from database, so a call to initialize() won't have any parameters and _restoring will be set to true.
---@param path string
---@return any @nothing
function ShipDatabaseEntry:addScript(path)
	return nil
end

--- Adds a script to the entity, if a script with the same name is not yet already attached. For technical reasons, it's not possible to pass initialization values here. The script will be attached as if it was restored from database, so a call to initialize() won't have any parameters and _restoring will be set to true.
---@param path string
---@return any @nothing
function ShipDatabaseEntry:addScriptOnce(path)
	return nil
end

---@return boolean
function ShipDatabaseEntry:exists()
	return true
end

---@return boolean
function ShipDatabaseEntry:exists()
	return true
end

---@return ShipAvailability
function ShipDatabaseEntry:getAvailability()
	return ShipAvailability.Available
end

---@return ShipAvailability
function ShipDatabaseEntry:getAvailability()
	return ShipAvailability.Available
end

---@return Captain
function ShipDatabaseEntry:getCaptain()
	return Captain
end

---@return Captain
function ShipDatabaseEntry:getCaptain()
	return Captain
end

--- Returns the current cargo and the cargo bay size. The cargo is stored in a table of the format result = { }; result[good1] = 5; result[good2] = 4; ... etc. The goods are used as keys, the amount of the good is the value.
---@return table<TradingGood,number>,number @returns 2 values: 1. A table holding the current cargo of the ship; 2. a number containing the cargo bay size of the ship
function ShipDatabaseEntry:getCargo()
	return {TradingGood,0.0},0.0
end

--- Returns the current cargo and the cargo bay size. The cargo is stored in a table of the format result = { }; result[good1] = 5; result[good2] = 4; ... etc. The goods are used as keys, the amount of the good is the value.
---@return table<TradingGood,number>,number @returns 2 values: 1. A table holding the current cargo of the ship; 2. a number containing the cargo bay size of the ship
function ShipDatabaseEntry:getCargo()
	return {TradingGood,0.0},0.0
end

---@return number,number
function ShipDatabaseEntry:getCoordinates()
	return 0,0
end

---@return number,number
function ShipDatabaseEntry:getCoordinates()
	return 0,0
end

---@return Crew
function ShipDatabaseEntry:getCrew()
	return Crew
end

---@return Crew
function ShipDatabaseEntry:getCrew()
	return Crew
end

--- Returns a boolean whether the crew requirements of the craft are all fulfilled. These are things like overpopulation, not enough crew members, etc.
---@return boolean @A boolean whether the crew requirements of the ship are all fulfilled.
function ShipDatabaseEntry:getCrewRequirementsFulfilled()
	return true
end

--- Returns a boolean whether the crew requirements of the craft are all fulfilled. These are things like overpopulation, not enough crew members, etc.
---@return boolean @A boolean whether the crew requirements of the ship are all fulfilled.
function ShipDatabaseEntry:getCrewRequirementsFulfilled()
	return true
end

--- Returns information about the ship's DPS.
---@return number,number @2 values: Total turret DPS; Total fighter DPS
function ShipDatabaseEntry:getDPSValues()
	return 0.0,0.0
end

--- Returns information about the ship's DPS.
---@return number,number @2 values: Total turret DPS; Total fighter DPS
function ShipDatabaseEntry:getDPSValues()
	return 0.0,0.0
end

--- Returns information about the crafts's docks. If in transport mode, docks are disabled. Only valid for stations.
---@return any @A bool value indicating whether docks are enabled or not
function ShipDatabaseEntry:getDocksEnabled()
	return nil
end

--- Returns information about the crafts's docks. If in transport mode, docks are disabled. Only valid for stations.
---@return any @A bool value indicating whether docks are enabled or not
function ShipDatabaseEntry:getDocksEnabled()
	return nil
end

--- Returns information about the ship's hull durability. Returns 5 values: The maximum durability, the durability percentage, range 0 to 1; The HP malus factor (from boarding or reconstruction), 0 to 1; A MalusReason enum value, the reason for the malus; A bool indicating if the ship is currently damaged (blocks are lost)
---@return table<number, any> @5 values: Maximum durability; durability percentage; malus factor; malus reason, damaged
function ShipDatabaseEntry:getDurabilityProperties()
	return {nil}
end

--- Returns information about the ship's hull durability. Returns 5 values: The maximum durability, the durability percentage, range 0 to 1; The HP malus factor (from boarding or reconstruction), 0 to 1; A MalusReason enum value, the reason for the malus; A bool indicating if the ship is currently damaged (blocks are lost)
---@return table<number, any> @5 values: Maximum durability; durability percentage; malus factor; malus reason, damaged
function ShipDatabaseEntry:getDurabilityProperties()
	return {nil}
end

--- Returns the energy properties of the craft.
---@return table<number, any> @Two values: required energy, produced energy in watts
function ShipDatabaseEntry:getEnergyProperties()
	return {nil}
end

--- Returns the energy properties of the craft.
---@return table<number, any> @Two values: required energy, produced energy in watts
function ShipDatabaseEntry:getEnergyProperties()
	return {nil}
end

---@return number
function ShipDatabaseEntry:getEntityType()
	return 0
end

---@return number
function ShipDatabaseEntry:getEntityType()
	return 0
end

--- Returns a boolean whether the figher squad requirements of the craft are all fulfilled. That's not fulfilled when there aren't enough squads for fighters.
---@return boolean @A boolean whether the requirements are all fulfilled.
function ShipDatabaseEntry:getFighterSquadRequirementsFulfilled()
	return true
end

--- Returns a boolean whether the figher squad requirements of the craft are all fulfilled. That's not fulfilled when there aren't enough squads for fighters.
---@return boolean @A boolean whether the requirements are all fulfilled.
function ShipDatabaseEntry:getFighterSquadRequirementsFulfilled()
	return true
end

--- Returns a boolean whether the figher start requirements of the craft are all fulfilled. That's not fulfilled when there aren't any starting positions for fighters.
---@return boolean @A boolean whether the requirements are all fulfilled.
function ShipDatabaseEntry:getFighterStartRequirementsFulfilled()
	return true
end

--- Returns a boolean whether the figher start requirements of the craft are all fulfilled. That's not fulfilled when there aren't any starting positions for fighters.
---@return boolean @A boolean whether the requirements are all fulfilled.
function ShipDatabaseEntry:getFighterStartRequirementsFulfilled()
	return true
end

--- Returns the amount of free cargo space on the ship.
---@return number @A number value containing the free cargo bay space of the ship
function ShipDatabaseEntry:getFreeCargoSpace()
	return 0.0
end

--- Returns the amount of free cargo space on the ship.
---@return number @A number value containing the free cargo bay space of the ship
function ShipDatabaseEntry:getFreeCargoSpace()
	return 0.0
end

--- Returns the current hangar squads and misc info about the hangar. The squads are stored in a table of the format squads = {}; squads[index1] = squad1; squads[index2] = squad2; ... etc. The squad indices are used as keys, the value is a Squad class. The second value is information about the hangar, with a few properties such as its space, occupied space, etc. It's recommended to use printTable() to print the complete table for inspection.
---@return table<number,Squad>,table_t @returns 2 values: 1. A table holding the current squads of the ship; 2. a table containing more hangar info
function ShipDatabaseEntry:getHangar()
	return {0,Squad},table_t
end

--- Returns the current hangar squads and misc info about the hangar. The squads are stored in a table of the format squads = {}; squads[index1] = squad1; squads[index2] = squad2; ... etc. The squad indices are used as keys, the value is a Squad class. The second value is information about the hangar, with a few properties such as its space, occupied space, etc. It's recommended to use printTable() to print the complete table for inspection.
---@return table<number,Squad>,table_t @returns 2 values: 1. A table holding the current squads of the ship; 2. a table containing more hangar info
function ShipDatabaseEntry:getHangar()
	return {0,Squad},table_t
end

--- Returns the hyperspace range, if the ship can pass over rifts, hyperspace cooldown and if the hyperspace engine is currently impaired (blocked or distorted by enemies) .
---@return table<number, any> @returns 4 values: 1. A number containing the hyperspace range of the ship; 2. A boolean whether the ship can jump over rifts; 3. The hyperspace cooldown in seconds of the ship; 4. A boolean whether the hyperspace engine is currently impaired
function ShipDatabaseEntry:getHyperspaceProperties()
	return {nil}
end

--- Returns the hyperspace range, if the ship can pass over rifts, hyperspace cooldown and if the hyperspace engine is currently impaired (blocked or distorted by enemies) .
---@return table<number, any> @returns 4 values: 1. A number containing the hyperspace range of the ship; 2. A boolean whether the ship can jump over rifts; 3. The hyperspace cooldown in seconds of the ship; 4. A boolean whether the hyperspace engine is currently impaired
function ShipDatabaseEntry:getHyperspaceProperties()
	return {nil}
end

---@return string
function ShipDatabaseEntry:getIcon()
	return ""
end

---@return string
function ShipDatabaseEntry:getIcon()
	return ""
end

--- Returns the current hangar squads and misc info about the hangar. Lightweight version that will not return BlockPlans of fighters. The squads are stored in a table of the format squads = {}; squads[index1] = squad1; squads[index2] = squad2; ... etc. The squad indices are used as keys, the value is a Squad class. The second value is information about the hangar, with a few properties such as its space, occupied space, etc. It's recommended to use printTable() to print the complete table for inspection.
---@return table<number,Squad>,table_t @returns 2 values: 1. A table holding the current squads of the ship; 2. a table containing more hangar info
function ShipDatabaseEntry:getLightweightHangar()
	return {0,Squad},table_t
end

--- Returns the current hangar squads and misc info about the hangar. Lightweight version that will not return BlockPlans of fighters. The squads are stored in a table of the format squads = {}; squads[index1] = squad1; squads[index2] = squad2; ... etc. The squad indices are used as keys, the value is a Squad class. The second value is information about the hangar, with a few properties such as its space, occupied space, etc. It's recommended to use printTable() to print the complete table for inspection.
---@return table<number,Squad>,table_t @returns 2 values: 1. A table holding the current squads of the ship; 2. a table containing more hangar info
function ShipDatabaseEntry:getLightweightHangar()
	return {0,Squad},table_t
end

---@return Matrix
function ShipDatabaseEntry:getLocalPosition()
	return Matrix
end

---@return Matrix
function ShipDatabaseEntry:getLocalPosition()
	return Matrix
end

---@return string
function ShipDatabaseEntry:getOrderInfo()
	return ""
end

---@return string
function ShipDatabaseEntry:getOrderInfo()
	return ""
end

---@return number
function ShipDatabaseEntry:getPaymentTime()
	return 0.0
end

---@return number
function ShipDatabaseEntry:getPaymentTime()
	return 0.0
end

---@return BlockPlan
function ShipDatabaseEntry:getPlan()
	return BlockPlan
end

---@return BlockPlan
function ShipDatabaseEntry:getPlan()
	return BlockPlan
end

--- Returns whether the craft is currently being piloted by a player.
---@return any @A bool value whether the craft is currently being piloted by a player.
function ShipDatabaseEntry:getPlayerPiloted()
	return nil
end

--- Returns whether the craft is currently being piloted by a player.
---@return any @A bool value whether the craft is currently being piloted by a player.
function ShipDatabaseEntry:getPlayerPiloted()
	return nil
end

---@return number
function ShipDatabaseEntry:getReconstructionValue()
	return 0.0
end

---@return number
function ShipDatabaseEntry:getReconstructionValue()
	return 0.0
end

--- Returns the script values of the ship. These are the values that can be set via the setValue() and getValue() functions.
---@return any @A table containing the script values by name
function ShipDatabaseEntry:getScriptValues()
	return nil
end

--- Returns the scripts that are currently attached to the ship, in the form of a table with key = scriptIndex, value = scriptPath.
---@return table<number,string> @A table containing script paths by script index
function ShipDatabaseEntry:getScripts()
	return {0,""}
end

--- Returns the scripts that are currently attached to the ship, in the form of a table with key = scriptIndex, value = scriptPath.
---@return table<number,string> @A table containing script paths by script index
function ShipDatabaseEntry:getScripts()
	return {0,""}
end

--- Returns the secured values of all scripts attached to the ship. Contains a table per script. This table is the one that's passed to the script in the "restore(values)" function.
---@return any @A table containing value tables by script index
function ShipDatabaseEntry:getSecuredScriptValues()
	return nil
end

--- Returns the max shields and percentage of the shields of the craft.
---@return number,number @2 number values: 1. The maximum shields, 2. the percentage of the craft's shield, range 0 to 1
function ShipDatabaseEntry:getShields()
	return 0.0,0.0
end

--- Returns the max shields and percentage of the shields of the craft.
---@return number,number @2 number values: 1. The maximum shields, 2. the percentage of the craft's shield, range 0 to 1
function ShipDatabaseEntry:getShields()
	return 0.0,0.0
end

---@return NamedFormat
function ShipDatabaseEntry:getStatusMessage()
	return NamedFormat
end

---@return NamedFormat
function ShipDatabaseEntry:getStatusMessage()
	return NamedFormat
end

--- Returns the currently equipped subsystems of the ship. The subsystems are stored in a table of the format subsystems = {}; subsystems[subsystem1] = {...}; subsystems[subsystem2] = {...}; ... etc. The keys of the returned table are the subsystems, the values are information about the subsystems. It's recommended to use printTable() to print the tables for inspection.
---@return table<number, pair> @returns a table where the subsystems are the keys, and tables holding information about the subsystems are the values
function ShipDatabaseEntry:getSystems()
	return {pair}
end

--- Returns the currently equipped subsystems of the ship. The subsystems are stored in a table of the format subsystems = {}; subsystems[subsystem1] = {...}; subsystems[subsystem2] = {...}; ... etc. The keys of the returned table are the subsystems, the values are information about the subsystems. It's recommended to use printTable() to print the tables for inspection.
---@return table<number, pair> @returns a table where the subsystems are the keys, and tables holding information about the subsystems are the values
function ShipDatabaseEntry:getSystems()
	return {pair}
end

---@return Format
function ShipDatabaseEntry:getTitle()
	return Format
end

---@return Format
function ShipDatabaseEntry:getTitle()
	return Format
end

--- Returns the current torpedo shafts and misc info about the torpedo launcher. The shafts are stored in a table of the format shafts = {}; shafts[index1] = shaft1; shafts[index2] = shaft2; ... etc. The shaft indices are used as keys, the value is a TorpedoShaft class. Shaft with index -1 is the general torpedo storage. Note that the space for the shafts is an integer number of torpedoes, while the space for the general storage is torpedo space, which torpedoes take up and which can be extended with blocks. The second value is information about the launcher, with a few properties such as its space, occupied space, etc. It's recommended to use printTable() to print the complete table for inspection.
---@return table<number, TorpedoTemplate> @returns 2 values: 1. A table holding the current shafts of the ship; 2. a table containing more launcher info
function ShipDatabaseEntry:getTorpedoes()
	return {TorpedoTemplate}
end

--- Returns the current torpedo shafts and misc info about the torpedo launcher. The shafts are stored in a table of the format shafts = {}; shafts[index1] = shaft1; shafts[index2] = shaft2; ... etc. The shaft indices are used as keys, the value is a TorpedoShaft class. Shaft with index -1 is the general torpedo storage. Note that the space for the shafts is an integer number of torpedoes, while the space for the general storage is torpedo space, which torpedoes take up and which can be extended with blocks. The second value is information about the launcher, with a few properties such as its space, occupied space, etc. It's recommended to use printTable() to print the complete table for inspection.
---@return table<number, TorpedoTemplate> @returns 2 values: 1. A table holding the current shafts of the ship; 2. a table containing more launcher info
function ShipDatabaseEntry:getTorpedoes()
	return {TorpedoTemplate}
end

--- Returns a boolean whether the turret slot requirements of the craft are all fulfilled. That's not fulfilled when there aren't enough slots for all turrets.
---@return boolean @A boolean whether the requirements are all fulfilled.
function ShipDatabaseEntry:getTurretSlotRequirementsFulfilled()
	return true
end

--- Returns a boolean whether the turret slot requirements of the craft are all fulfilled. That's not fulfilled when there aren't enough slots for all turrets.
---@return boolean @A boolean whether the requirements are all fulfilled.
function ShipDatabaseEntry:getTurretSlotRequirementsFulfilled()
	return true
end

--- Returns the currently equipped turrets of the ship. The turrets are stored in a table of the format turrets = {}; turrets[turret1] = {...}; turrets[turret2] = {...}; ... etc. The keys of the returned table are the turrets, the values are information about the turrets. It's recommended to use printTable() to print the tables for inspection.
---@return table<number, pair> @returns a table where the turrets are the keys, and tables holding information about the turrets are the values
function ShipDatabaseEntry:getTurrets()
	return {pair}
end

--- Returns the currently equipped turrets of the ship. The turrets are stored in a table of the format turrets = {}; turrets[turret1] = {...}; turrets[turret2] = {...}; ... etc. The keys of the returned table are the turrets, the values are information about the turrets. It's recommended to use printTable() to print the tables for inspection.
---@return table<number, pair> @returns a table where the turrets are the keys, and tables holding information about the turrets are the values
function ShipDatabaseEntry:getTurrets()
	return {pair}
end

--- Removes a script from the entity.
---@param script any @A path (fragment) or index of the script that should be removed.
---@return any @nothing
function ShipDatabaseEntry:removeScript(script)
	return nil
end

---@param availability ShipAvailability
---@return any @nothing
function ShipDatabaseEntry:setAvailability(availability)
	return nil
end

---@param captain Captain
---@return any @nothing
function ShipDatabaseEntry:setCaptain(captain)
	return nil
end

---@param cargo table_t
---@return any @nothing
function ShipDatabaseEntry:setCargo(cargo)
	return nil
end

---@param x number
---@param y number
---@return any @nothing
function ShipDatabaseEntry:setCoordinates(x, y)
	return nil
end

---@param other Crew
---@return any @nothing
function ShipDatabaseEntry:setCrew(other)
	return nil
end

---@param malusFactor number
---@param reason DurabilityMalusReason
---@return any @nothing
function ShipDatabaseEntry:setDurabilityMalus(malusFactor, reason)
	return nil
end

---@param percentage number
---@return any @nothing
function ShipDatabaseEntry:setDurabilityPercentage(percentage)
	return nil
end

---@param hangar table_t
---@return any @nothing
function ShipDatabaseEntry:setHangar(hangar)
	return nil
end

---@param icon string
---@return any @nothing
function ShipDatabaseEntry:setIcon(icon)
	return nil
end

---@param matrix Matrix
---@return any @nothing
function ShipDatabaseEntry:setLocalPosition(matrix)
	return nil
end

---@param newName string
---@return any @nothing
function ShipDatabaseEntry:setNewName(newName)
	return nil
end

---@param info string
---@return any @nothing
function ShipDatabaseEntry:setOrderInfo(info)
	return nil
end

---@param timeSincePayDay number
---@return any @nothing
function ShipDatabaseEntry:setPaymentTime(timeSincePayDay)
	return nil
end

---@param plan BlockPlan
---@return any @nothing
function ShipDatabaseEntry:setPlan(plan)
	return nil
end

---@param value number
---@return any @nothing
function ShipDatabaseEntry:setReconstructionValue(value)
	return nil
end

---@param percentage number
---@return any @nothing
function ShipDatabaseEntry:setShieldPercentage(percentage)
	return nil
end

---@param status NamedFormat
---@return any @nothing
function ShipDatabaseEntry:setStatusMessage(status)
	return nil
end

---@param title NamedFormat
---@return any @nothing
function ShipDatabaseEntry:setTitle(title)
	return nil
end

---@param torpedoes table_t
---@return any @nothing
function ShipDatabaseEntry:setTorpedoes(torpedoes)
	return nil
end

