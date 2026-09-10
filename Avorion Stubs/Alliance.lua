---@class Alliance
Alliance = {

	alwaysAtWar = true, -- bool
	baseName = "", -- [read-only] string
	fullLogId = "", -- [read-only] string
	homeSectorUnknown = true, -- bool
	index = 0, -- [read-only] int
	infiniteResources = true, -- bool
	initialRelations = 0, -- int
	initialRelationsToPlayer = 0, -- int
	isAIFaction = true, -- [read-only] bool
	isAlliance = true, -- [read-only] bool
	isPlayer = true, -- [read-only] bool
	leader = 0, -- int
	maxNumShips = 0, -- [read-only] int
	maxNumStations = 0, -- [read-only] int
	money = 0, -- [read-only] int
	name = "", -- [read-only] string
	numCrafts = 0, -- [read-only] unsigned
	numShips = 0, -- [read-only] unsigned
	numStations = 0, -- [read-only] int
	stateForm = "", -- [read-only] string
	staticRelationsToAI = true, -- bool
	staticRelationsToAll = true, -- bool
	staticRelationsToPlayers = true, -- bool
	unformattedName = Format, -- [read-only] Format

}

---@return Alliance
function Alliance()
	return Alliance
end

---@param view SectorView
---@return any @nothing
function Alliance:addKnownSector(view)
	return nil
end

--- Inherited from Faction [Server]
---@param name string
---@param style PlanStyle
---@return any @nothing
function Alliance:addPlanStyle(name, style)
	return nil
end

---@param name string
---@param lowerName string
---@return any @nothing
function Alliance:addRank(name, lowerName)
	return nil
end

---@param name string
---@param lowerName string
---@return any @nothing
function Alliance:addRank(name, lowerName)
	return nil
end

---@param rank string
---@param privilege number
---@return any @nothing
function Alliance:addRankPrivilege(rank, privilege)
	return nil
end

---@param rank string
---@param privilege number
---@return any @nothing
function Alliance:addRankPrivilege(rank, privilege)
	return nil
end

---@return any
function Alliance:addScript()
	return nil
end

---@return any
function Alliance:addScriptOnce()
	return nil
end

--- Check how many functions are registered to a callback from the current script VM.
---@param callbackName string @The name of the callback
---@param functionName any @The name of the function for which to check. If nil, will count all functions that are registered to this callback.
---@return number @The amount of functions registered to the callback
function Alliance:callbacksRegistered(callbackName, functionName)
	return 0
end

--- Check how many functions are registered to a callback from the current script VM.
---@param callbackName string @The name of the callback
---@param functionName any @The name of the function for which to check. If nil, will count all functions that are registered to this callback.
---@return number @The amount of functions registered to the callback
function Alliance:callbacksRegistered(callbackName, functionName)
	return 0
end

---@return boolean,string,table<number,string>
function Alliance:canPay()
	return true,"",{0,""}
end

--- Inherited from Faction [Server]
---@return boolean,string,table<number,string>
function Alliance:canPay()
	return true,"",{0,""}
end

--- Inherited from Faction [Server]
---@param money number
---@return boolean,string,table<number,string>
function Alliance:canPayMoney(money)
	return true,"",{0,""}
end

--- Inherited from Faction [Server]
---@param material Material
---@param amount number
---@return boolean,string,table<number,string>
function Alliance:canPayResource(material, amount)
	return true,"",{0,""}
end

--- Removes all custom values of the object Inherited from Faction [Server]
---@return any @nothing
function Alliance:clearValues()
	return nil
end

---@param playerIndex number
---@return boolean
function Alliance:contains(playerIndex)
	return true
end

---@param playerIndex number
---@return boolean
function Alliance:contains(playerIndex)
	return true
end

---@param name string
---@param position Matrix
---@param faction any
---@return Entity
function Alliance:createCraftFromShipInfo(name, position, faction)
	return Entity
end

---@return table<number, Relation>
function Alliance:getAllRelations()
	return {Relation}
end

--- Inherited from Faction [Server]
---@return table<number, Relation>
function Alliance:getAllRelations()
	return {Relation}
end

---@return number,number
function Alliance:getHomeSectorCoordinates()
	return 0,0
end

--- Inherited from Faction [Server]
---@return number,number
function Alliance:getHomeSectorCoordinates()
	return 0,0
end

---@return Inventory
function Alliance:getInventory()
	return Inventory
end

--- Inherited from Faction [Server]
---@return Inventory
function Alliance:getInventory()
	return Inventory
end

---@param x number
---@param y number
---@return SectorView
function Alliance:getKnownSector(x, y)
	return SectorView
end

---@param x number
---@param y number
---@return SectorView
function Alliance:getKnownSector(x, y)
	return SectorView
end

---@return table<number, ivec2>
function Alliance:getKnownSectorCoordinates()
	return {ivec2}
end

---@return table<number, ivec2>
function Alliance:getKnownSectorCoordinates()
	return {ivec2}
end

---@return table<number, SectorView>
function Alliance:getKnownSectors()
	return {SectorView}
end

---@return table<number, SectorView>
function Alliance:getKnownSectors()
	return {SectorView}
end

---@param factionIndex number
---@return table<number, SectorView>
function Alliance:getKnownSectorsOfFaction(factionIndex)
	return {SectorView}
end

---@param factionIndex number
---@return table<number, SectorView>
function Alliance:getKnownSectorsOfFaction(factionIndex)
	return {SectorView}
end

---@param factionIndex number
---@return table<number, SectorView>
function Alliance:getKnownSectorsWithFaction(factionIndex)
	return {SectorView}
end

---@param factionIndex number
---@return table<number, SectorView>
function Alliance:getKnownSectorsWithFaction(factionIndex)
	return {SectorView}
end

--- Inherited from Faction [Server]
---@return Language
function Alliance:getLanguage()
	return Language
end

---@param playerIndex number
---@return number,number
function Alliance:getMemberLocation(playerIndex)
	return 0,0
end

---@param playerIndex number
---@return number,number
function Alliance:getMemberLocation(playerIndex)
	return 0,0
end

---@param playerIndex number
---@return AllianceRank
function Alliance:getMemberRank(playerIndex)
	return AllianceRank
end

---@param playerIndex number
---@return AllianceRank
function Alliance:getMemberRank(playerIndex)
	return AllianceRank
end

---@return table<number,AllianceMember>
function Alliance:getMembers()
	return {0,AllianceMember()}
end

---@param x number
---@param y number
---@return table<number, string>
function Alliance:getNamesOfShipsInSector(x, y)
	return {""}
end

---@param x number
---@param y number
---@return table<number, string>
function Alliance:getNamesOfShipsInSector(x, y)
	return {""}
end

---@return string
function Alliance:getNewMemberRank()
	return ""
end

---@return table<number, number>
function Alliance:getOnlineMembers()
	return {0}
end

---@param name string
---@return PlanStyle
function Alliance:getPlanStyle(name)
	return PlanStyle
end

--- Inherited from Faction [Server]
---@param name string
---@return PlanStyle
function Alliance:getPlanStyle(name)
	return PlanStyle
end

---@return table<number, string>
function Alliance:getPlanStyleNames()
	return {""}
end

--- Inherited from Faction [Server]
---@return table<number, string>
function Alliance:getPlanStyleNames()
	return {""}
end

---@param name string
---@return AllianceRank
function Alliance:getRank(name)
	return AllianceRank
end

---@param name string
---@return AllianceRank
function Alliance:getRank(name)
	return AllianceRank
end

---@param factionIndex number
---@return Relation
function Alliance:getRelation(factionIndex)
	return Relation
end

--- Inherited from Faction [Server]
---@param otherFactionIndex number
---@return Relation
function Alliance:getRelation(otherFactionIndex)
	return Relation
end

---@param factionIndex number
---@return number
function Alliance:getRelationStatus(factionIndex)
	return 0
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@return number
function Alliance:getRelationStatus(factionIndex)
	return 0
end

---@param factionIndex number
---@return number
function Alliance:getRelations(factionIndex)
	return 0
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@return number
function Alliance:getRelations(factionIndex)
	return 0
end

---@return table<number, number>
function Alliance:getResources()
	return {0}
end

--- Inherited from Faction [Server]
---@return table<number, number>
function Alliance:getResources()
	return {0}
end

---@return table<number,string>
function Alliance:getScripts()
	return {0,""}
end

---@param name string
---@return ShipAvailability
function Alliance:getShipAvailability(name)
	return ShipAvailability
end

---@param name string
---@return ShipAvailability
function Alliance:getShipAvailability(name)
	return ShipAvailability
end

---@param name string
---@return Box
function Alliance:getShipBoundingBox(name)
	return Box
end

---@param name string
---@return Box
function Alliance:getShipBoundingBox(name)
	return Box
end

---@param name string
---@return boolean
function Alliance:getShipCanPassRifts(name)
	return true
end

---@param name string
---@return boolean
function Alliance:getShipCanPassRifts(name)
	return true
end

---@param name string
---@return CargoBay
function Alliance:getShipCargo(name)
	return CargoBay
end

---@param name string
---@return CargoBay
function Alliance:getShipCargo(name)
	return CargoBay
end

---@param name string
---@return table<TradingGood,number>
function Alliance:getShipCargos(name)
	return {TradingGood,0}
end

---@param name string
---@return table<TradingGood,number>
function Alliance:getShipCargos(name)
	return {TradingGood,0}
end

---@param name string
---@return Crew
function Alliance:getShipCrew(name)
	return Crew
end

---@param name string
---@return boolean
function Alliance:getShipDestroyed(name)
	return true
end

---@param name string
---@return boolean
function Alliance:getShipDestroyed(name)
	return true
end

---@param name string
---@return number
function Alliance:getShipHyperspaceReach(name)
	return 0.0
end

---@param name string
---@return number
function Alliance:getShipHyperspaceReach(name)
	return 0.0
end

---@param name string
---@return string
function Alliance:getShipIcon(name)
	return ""
end

---@param name string
---@return string
function Alliance:getShipIcon(name)
	return ""
end

---@return table<number, string>
function Alliance:getShipNames()
	return {""}
end

---@return table<number, string>
function Alliance:getShipNames()
	return {""}
end

---@param name string
---@return string
function Alliance:getShipOrderInfo(name)
	return ""
end

---@param name string
---@return string
function Alliance:getShipOrderInfo(name)
	return ""
end

---@param name string
---@return number
function Alliance:getShipPayment(name)
	return 0.0
end

---@param name string
---@return number
function Alliance:getShipPayment(name)
	return 0.0
end

---@param name string
---@return number
function Alliance:getShipPaymentTime(name)
	return 0.0
end

---@param name string
---@return number
function Alliance:getShipPaymentTime(name)
	return 0.0
end

---@param name string
---@return BlockPlan
function Alliance:getShipPlan(name)
	return BlockPlan
end

---@param name string
---@return BlockPlan
function Alliance:getShipPlan(name)
	return BlockPlan
end

---@param name string
---@return number, number
function Alliance:getShipPosition(name)
	return 0, 0
end

---@param name string
---@return number, number
function Alliance:getShipPosition(name)
	return 0, 0
end

---@param name string
---@return number
function Alliance:getShipReconstructionValue(name)
	return 0.0
end

---@param name string
---@return number
function Alliance:getShipReconstructionValue(name)
	return 0.0
end

---@param name string
---@return string
function Alliance:getShipStatus(name)
	return ""
end

---@param name string
---@return string
function Alliance:getShipStatus(name)
	return ""
end

---@param name string
---@return table<number, ShipInfoUpgrade>
function Alliance:getShipSystems(name)
	return {ShipInfoUpgrade}
end

---@param name string
---@return table<number, ShipInfoUpgrade>
function Alliance:getShipSystems(name)
	return {ShipInfoUpgrade}
end

---@param name string
---@return table<number,TurretDesign>
function Alliance:getShipTurretDesigns(name)
	return {0,TurretDesign}
end

---@param name string
---@return table<number,TurretDesign>
function Alliance:getShipTurretDesigns(name)
	return {0,TurretDesign}
end

---@param name string
---@return number
function Alliance:getShipType(name)
	return 0
end

---@param name string
---@return number
function Alliance:getShipType(name)
	return 0
end

--- Retrieves a trait value associated with a key Inherited from Faction [Server]
---@param trait string @The name of the trait
---@return number @The trait value associated with the key
function Alliance:getTrait(trait)
	return 0.0
end

--- Retrieves all key-value trait pairs of the faction Inherited from Faction [Server]
---@return table<string,number> @A table containing all custom key-value pairs
function Alliance:getTraits()
	return {"",0.0}
end

--- Retrieves a custom value saved in the entity with the given key Inherited from Faction [Server]
---@param key string @A string that serves as the name of the value
---@return any @The value if the key exists, otherwise nil
function Alliance:getValue(key)
	return nil
end

--- Retrieves all key-value pairs of custom values Inherited from Faction [Server]
---@return table<string,any> @A table containing all custom key-value pairs
function Alliance:getValues()
	return {"",nil}
end

---@param playerIndex number
---@param privilege number
---@return boolean
function Alliance:hasPrivilege(playerIndex, privilege)
	return true
end

---@param playerIndex number
---@param privilege number
---@return boolean
function Alliance:hasPrivilege(playerIndex, privilege)
	return true
end

---@param name string
---@return any
function Alliance:hasScript(name)
	return nil
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@return boolean
function Alliance:hasStaticRelationsToFaction(factionIndex)
	return true
end

--- Invokes a function in a script of the alliance. Use this function to invoke functions from one script in another script. The first return value of the function is an integer indicating whether or not the call was successful. When it was, this integer is followed by the return values of the invoked function.
---@param scriptName any @The name of the script containing the function
---@param functionName string @The name of the function that will be executed
---@param arguments table<number, any> @An arbitrary list of arguments that will be given to the invoked function. Only numbers, std::strings and nil are supported here.
---@return table<number, any> @Returns at least 1 value indicating if the call succeeded: 0 The call was successful. In this case, the return values of the script are returned in addition to the call result, following the call result. 3 The call failed because the given script was not found in the alliance. 4 The call failed because the given function was not found in the script.  5 The call failed because the script's state has errors and is invalid
function Alliance:invokeFunction(scriptName, functionName, arguments)
	return {nil}
end

---@return table<number, any>
function Alliance:invokeFunction()
	return {nil}
end

---@param factionIndex number
---@return boolean
function Alliance:knowsFaction(factionIndex)
	return true
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@return boolean
function Alliance:knowsFaction(factionIndex)
	return true
end

---@param x number
---@param y number
---@return boolean
function Alliance:knowsSector(x, y)
	return true
end

---@param x number
---@param y number
---@return boolean
function Alliance:knowsSector(x, y)
	return true
end

---@param name string
---@param lowerName string
---@return any @nothing
function Alliance:moveRank(name, lowerName)
	return nil
end

---@param name string
---@param lowerName string
---@return any @nothing
function Alliance:moveRank(name, lowerName)
	return nil
end

--- @callback
--- Called whenever the auto-pay-crews property was changed
function Alliance:onAutoPayCrewsChanged(autoPayCrews)
end

--- @callback
--- Called whenever the auto-pay-crews property was changed
function Alliance:onAutoPayCrewsChanged(autoPayCrews)
end

--- @callback
--- Called whenever the message of the day was changed
function Alliance:onEmblemChanged(emblem)
end

--- @callback
--- Called whenever the message of the day was changed
function Alliance:onEmblemChanged()
end

--- @callback
--- Called whenever the home sector of the alliance changes
function Alliance:onHomeSectorChanged(x, y)
end

--- @callback
--- Called whenever the home sector of the alliance changes
function Alliance:onHomeSectorChanged(x, y)
end

--- @callback
--- Called whenever an item in the alliance inventory is added
function Alliance:onItemAdded(item, index, amount, amountBefore, tagsChanged)
end

--- @callback
--- Called whenever an item in the alliance inventory is added
function Alliance:onItemAdded(item, index, amount, amountBefore, tagsChanged)
end

--- @callback
--- Called whenever an item in the alliance inventory changes
function Alliance:onItemChanged(item, index, amount, amountBefore)
end

--- @callback
--- Called whenever an item in the alliance inventory changes
function Alliance:onItemChanged(item, index, amount, amountBefore)
end

--- @callback
--- Called whenever an item in the alliance inventory changes properties
function Alliance:onItemPropertiesChanged(item, index, amount)
end

--- @callback
--- Called whenever an item in the alliance inventory changes properties
function Alliance:onItemPropertiesChanged(item, index, amount)
end

--- @callback
--- Called whenever an item in the alliance inventory is removed
function Alliance:onItemRemoved(item, index, amount, amountBefore)
end

--- @callback
--- Called whenever an item in the alliance inventory is removed
function Alliance:onItemRemoved(item, index, amount, amountBefore)
end

--- @callback
--- Called whenever a new tracked sector is added to the alliance database
function Alliance:onKnownSectorAdded(x, y)
end

--- @callback
--- Called whenever a new tracked sector is added to the alliance database
function Alliance:onKnownSectorAdded(x, y)
end

--- @callback
--- Called whenever a tracked sector was removed from the alliance database
function Alliance:onKnownSectorRemoved(x, y)
end

--- @callback
--- Called whenever a tracked sector was removed from the alliance database
function Alliance:onKnownSectorRemoved(x, y)
end

--- @callback
--- Called whenever a tracked sector is updated in the alliance database
function Alliance:onKnownSectorUpdated(x, y)
end

--- @callback
--- Called whenever a tracked sector is updated in the alliance database
function Alliance:onKnownSectorUpdated(x, y)
end

--- @callback
--- Called whenever the leader of the alliance was changed
function Alliance:onLeaderChanged(index)
end

--- @callback
--- Called whenever the leader of the alliance was changed
function Alliance:onLeaderChanged(index)
end

--- @callback
--- Called whenever a member is changed in the alliance
function Alliance:onMemberChanged(index, rank)
end

--- @callback
--- Called whenever a member is changed in the alliance
function Alliance:onMemberChanged(index, rank)
end

--- @callback
--- Called whenever a member leaves the alliance
function Alliance:onMemberLeft(index)
end

--- @callback
--- Called whenever a member leaves the alliance
function Alliance:onMemberLeft(index)
end

--- @callback
--- Called whenever the message of the day was changed
function Alliance:onMessageOfTheDayChanged(motd)
end

--- @callback
--- Called whenever the message of the day was changed
function Alliance:onMessageOfTheDayChanged(motd)
end

--- @callback
--- Called whenever the name of the alliance changes
function Alliance:onNameChanged(newName)
end

--- @callback
--- Called whenever the name of the alliance changes
function Alliance:onNameChanged(newName)
end

--- @callback
--- Called whenever a new member joins the alliance
function Alliance:onNewMember(index, rank)
end

--- @callback
--- Called whenever a new member joins the alliance
function Alliance:onNewMember(index, rank)
end

--- @callback
--- Called whenever a new rank is added
function Alliance:onNewRank(name, icon, level, privileges)
end

--- @callback
--- Called whenever a new rank is added
function Alliance:onNewRank(name, icon, level, privileges)
end

--- @callback
--- Called whenever the newbie rank was changed
function Alliance:onNewbieRankChanged(name)
end

--- @callback
--- Called whenever the newbie rank was changed
function Alliance:onNewbieRankChanged(name)
end

--- @callback
--- Called whenever a rank is changed
function Alliance:onRankChanged(name, icon, level, privileges)
end

--- @callback
--- Called whenever a rank is changed
function Alliance:onRankChanged(name, icon, level, privileges)
end

--- @callback
--- Called whenever a rank was removed
function Alliance:onRankRemoved(name)
end

--- @callback
--- Called whenever a rank was removed
function Alliance:onRankRemoved(name)
end

--- @callback
--- Called whenever relations of the alliance to another faction change
function Alliance:onRelationChanged(index, level, levelBefore, notify)
end

--- @callback
--- Called whenever relations of the alliance to another faction change
function Alliance:onRelationChanged(index, level, levelBefore, notify)
end

--- @callback
--- Called whenever relation levels of the alliance to another faction change
function Alliance:onRelationLevelChanged(index, level, levelBefore, notify)
end

--- @callback
--- Called whenever relation levels of the alliance to another faction change
function Alliance:onRelationLevelChanged(index, level, levelBefore, notify)
end

--- @callback
--- Called whenever the relation status of the alliance to another faction change (relation status is not yet implemented so this callback will most likely not fire until relation status is in)
function Alliance:onRelationStatusChanged(index, status, statusBefore, notify)
end

--- @callback
--- Called whenever the relation status of the alliance to another faction change (relation status is not yet implemented so this callback will most likely not fire until relation status is in)
function Alliance:onRelationStatusChanged(index, status, statusBefore, notify)
end

--- @callback
--- Called whenever the amount of money or resources of the alliance changes
function Alliance:onResourcesChanged(money, resources, infinite, notify)
end

--- @callback
--- Called whenever the amount of money or resources of the alliance changes
function Alliance:onResourcesChanged(money, resources, infinite, notify)
end

--- @callback
--- Executed after a script was added to the alliance
function Alliance:onScriptAdded(allianceIndex, scriptIndex, scriptPath)
end

--- @callback
--- Executed after a script was removed from the alliance
function Alliance:onScriptRemoved(allianceIndex, oldScriptIndex, scriptPath)
end

--- @callback
--- Called whenever a ShipInfo changes availability status (ie. goes into background simulation)
function Alliance:onShipAvailabilityUpdated(name, availability)
end

--- @callback
--- Called whenever a ShipInfo changes availability status (ie. goes into background simulation)
function Alliance:onShipAvailabilityUpdated(name, availability)
end

--- @callback
--- Called whenever the cargo of a ShipInfo changes
function Alliance:onShipCargoUpdated(name)
end

--- @callback
--- Called whenever the cargo of a ShipInfo changes
function Alliance:onShipCargoUpdated(name)
end

--- @callback
--- Called whenever the crew of a ShipInfo changes
function Alliance:onShipCrewUpdated(name)
end

--- @callback
--- Called whenever the crew of a ShipInfo changes
function Alliance:onShipCrewUpdated(name)
end

--- @callback
--- Called whenever the hyperspace reach of a ShipInfo changes
function Alliance:onShipHyperspacePropertiesUpdated(name, reach, canPassRifts)
end

--- @callback
--- Called whenever the hyperspace reach of a ShipInfo changes
function Alliance:onShipHyperspacePropertiesUpdated(name, reach, canPassRifts)
end

--- @callback
--- Called whenever the icon of a ShipInfo changes
function Alliance:onShipIconUpdated(name, icon)
end

--- @callback
--- Called whenever the icon of a ShipInfo changes
function Alliance:onShipIconUpdated(name, icon)
end

--- @callback
--- Called whenever a ShipInfo is added to the alliance
function Alliance:onShipInfoAdded(name)
end

--- @callback
--- Called whenever a ShipInfo is added to the alliance
function Alliance:onShipInfoAdded(name)
end

--- @callback
--- Called whenever a ShipInfo is removed from the alliance
function Alliance:onShipInfoRemoved(name)
end

--- @callback
--- Called whenever a ShipInfo is removed from the alliance
function Alliance:onShipInfoRemoved(name)
end

--- @callback
--- Called whenever a ShipInfo is updated in some way
function Alliance:onShipInfoUpdated(name)
end

--- @callback
--- Called whenever a ShipInfo is updated in some way
function Alliance:onShipInfoUpdated(name)
end

--- @callback
--- Called whenever the name of a ShipInfo changes
function Alliance:onShipNameUpdated(name, newName)
end

--- @callback
--- Called whenever the name of a ShipInfo changes
function Alliance:onShipNameUpdated(name, newName)
end

--- @callback
--- Called whenever the order info of a ShipInfo changes
function Alliance:onShipOrderInfoUpdated(name, orderInfo)
end

--- @callback
--- Called whenever the order info of a ShipInfo changes
function Alliance:onShipOrderInfoUpdated(name, orderInfo)
end

--- @callback
--- Called whenever the payday of a ShipInfo changes
function Alliance:onShipPayDayUpdated(name, time)
end

--- @callback
--- Called whenever the payday of a ShipInfo changes
function Alliance:onShipPayDayUpdated(name, time)
end

--- @callback
--- Called whenever the plan of a ShipInfo changes
function Alliance:onShipPlanUpdated(name)
end

--- @callback
--- Called whenever the plan of a ShipInfo changes
function Alliance:onShipPlanUpdated(name)
end

--- @callback
--- Called whenever a ShipInfo changes sectors
function Alliance:onShipPositionUpdated(name, x, y)
end

--- @callback
--- Called whenever a ShipInfo changes sectors
function Alliance:onShipPositionUpdated(name, x, y)
end

--- @callback
--- Called whenever the reconstruction value of a ShipInfo changes
function Alliance:onShipReconstructionValueUpdated(name, value)
end

--- @callback
--- Called whenever the reconstruction value of a ShipInfo changes
function Alliance:onShipReconstructionValueUpdated(name, value)
end

--- @callback
--- Called whenever the status info of a ShipInfo changes
function Alliance:onShipStatusMessageUpdated(name, status, args)
end

--- @callback
--- Called whenever the status info of a ShipInfo changes
function Alliance:onShipStatusMessageUpdated(name, status, args)
end

--- @callback
--- Called whenever the title of a ShipInfo changes
function Alliance:onShipTitleUpdated(name)
end

--- @callback
--- Called whenever the title of a ShipInfo changes
function Alliance:onShipTitleUpdated(name)
end

--- @callback
--- Called whenever the entity type of a ShipInfo changes
function Alliance:onShipTypeUpdated(name, type)
end

--- @callback
--- Called whenever the entity type of a ShipInfo changes
function Alliance:onShipTypeUpdated(name, type)
end

--- @callback
--- Called whenever the state form of the alliance changes
function Alliance:onStateFormChanged(newForm)
end

--- @callback
--- Called whenever the state form of the alliance changes
function Alliance:onStateFormChanged(newForm)
end

--- @callback
--- Called whenever a "personality" trait of the alliance changes
function Alliance:onTraitChanged(trait, value)
end

--- @callback
--- Called whenever a "personality" trait of the alliance changes
function Alliance:onTraitChanged(trait, value)
end

---@param name string
---@return boolean
function Alliance:ownsShip(name)
	return true
end

---@param name string
---@return boolean
function Alliance:ownsShip(name)
	return true
end

--- Makes the faction pay a certain amount of money and resources. If the faction can't pay, the respective money and resources will be set to 0. This function accepts an optional string for Format as first argument, as an economy notification describing the transaction that will be sent to the player, in case the faction is a player. To ease handling of transaction descriptions, the format description (if set) will receive all the remaining arguments given to the pay() function as format arguments, in the same order as they are given to the function. Dots for easier reading will be inserted as well. Examples: faction:pay("Paid %1% Credits and %2% iron.", 50000, 250)  -> "Paid 50.000 Credits and 250 iron." faction:pay(Format("%1% paid %2% Credits and %3% iron.", "Excelsior"), 50, 25000)  -> "Excelsior paid 50 Credits and 25.000 iron." Inherited from Faction [Server]
---@param description [optional] | Format | or | string @[optional] A description for the transaction. Can either be a string or a Format. If this variable is set, money and resources will be appended to the end of the list of arguments passed to the description format string. @Money that will be removed from the faction @A list of resources, starting with iron, that will be removed from the faction
---@param money number
---@param resources table<number, number>
---@return any @nothing
function Alliance:pay(description, money, resources)
	return nil
end

--- Makes the faction pay a certain amount of resources. If the faction can't pay, the respective resource will be set to 0. This function accepts a string for Format as first argument, as an economy notification describing the transaction that will be sent to the player, in case the faction is a player. Inherited from Faction [Server]
---@param description Format | or | string @A description for the transaction. Can either be a string or a Format.
---@param material Material @The kind of material that will be removed from the faction
---@param amount number @Amount that will be removed from the faction
---@return any @nothing
function Alliance:payResource(description, material, amount)
	return nil
end

--- Similar behavior to pay(), except there will not be a notification popping up in case the faction is a player, and the description for the transaction in this function isn't optional. Inherited from Faction [Server]
---@param description Format | or | string @A description for the transaction. Can either be a string or a Format. Money and resources will be appended to the end of the list of arguments passed to the description format string.
---@param money number @Money that will be removed from the faction
---@param args table<number, number> @A list of resources, starting with iron, that will be removed from the faction
---@return any @nothing
function Alliance:payWithoutNotify(description, money, args)
	return nil
end

---@param rank string
---@return boolean
function Alliance:rankExists(rank)
	return true
end

---@param rank string
---@return boolean
function Alliance:rankExists(rank)
	return true
end

--- Makes the faction receive a certain amount of money and resources. This function accepts an optional string for Format as first argument, as an economy notification describing the transaction that will be sent to the player, in case the faction is a player. To ease handling of transaction descriptions, the format description (if set) will receive all the remaining arguments given to the receive() function as format arguments, in the same order as they are given to the function. Dots for easier reading will be inserted as well. Examples: faction:receive("Got %1% Credits and %2% iron.", 50000, 250)  -> "Got 50.000 Credits and 250 iron." faction:receive(Format("%1% received %2% Credits and %3% iron.", "Excelsior"), 50, 25000)  -> "Excelsior received 50 Credits and 25.000 iron." Inherited from Faction [Server]
---@param description [optional] | Format | or | string @[optional] A description for the transaction. Can either be a string or a Format. If this variable is set, money and resources will be appended to the end of the list of arguments passed to the description format string. @Money that will be given to the faction @A list of resources, starting with iron, that will be given to the faction
---@param money number
---@param resources table<number, number>
---@return any @nothing
function Alliance:receive(description, money, resources)
	return nil
end

--- Makes the faction receive a certain amount of resources. This function accepts a string for Format as first argument, as an economy notification describing the transaction that will be sent to the player, in case the faction is a player. Inherited from Faction [Server]
---@param description Format | or | string @A description for the transaction. Can either be a string or a Format.
---@param material Material @The kind of material that will be given to the faction
---@param amount number @Amount that will be given to the faction
---@return any @nothing
function Alliance:receiveResource(description, material, amount)
	return nil
end

--- Similar behavior to receive(), except there will not be a notification popping up in case the faction is a player, and the description for the transaction in this function isn't optional. Inherited from Faction [Server]
---@param description Format | or | string @A description for the transaction. Can either be a string or a Format. Money and resources will be appended to the end of the list of arguments passed to the description format string.
---@param money number @Money that will be given to the faction
---@param args table<number, number> @A list of resources, starting with iron, that will be given to the faction
---@return any @nothing
function Alliance:receiveWithoutNotify(description, money, args)
	return nil
end

--- Register a callback in the alliance. The callback will be removed when the sector is changed or the receiver, if it's an entity, is destroyed. Double registration of callbacks doesn't work. When the same callback to the same callback of the same script instance is registered twice, it will still only be called once.
---@param callbackName string @The name of the callback
---@param functionName string @The name of the function that will be executed in the script when the callback happens
---@return any @nothing
function Alliance:registerCallback(callbackName, functionName)
	return nil
end

--- Register a callback in the player. The callback will be removed when the sector is changed or the receiver, if it's an entity, is destroyed. Double registration of callbacks doesn't work. When the same callback to the same callback of the same script instance is registered twice, it will still only be called once.
---@param callbackName string @The name of the callback
---@param functionName string @The name of the function that will be executed in the script when the callback happens
---@return any @nothing
function Alliance:registerCallback(callbackName, functionName)
	return nil
end

---@param name string
---@return any @nothing
function Alliance:removeDestroyedShipInfo(name)
	return nil
end

---@param x number
---@param y number
---@return any @nothing
function Alliance:removeKnownSector(x, y)
	return nil
end

---@param name string
---@return any @nothing
function Alliance:removeRank(name)
	return nil
end

---@param name string
---@return any @nothing
function Alliance:removeRank(name)
	return nil
end

---@param rankName string
---@param privilege number
---@return any @nothing
function Alliance:removeRankPrivilege(rankName, privilege)
	return nil
end

---@param rankName string
---@param privilege number
---@return any @nothing
function Alliance:removeRankPrivilege(rankName, privilege)
	return nil
end

---@param script any
---@return any @nothing
function Alliance:removeScript(script)
	return nil
end

---@param path string
---@return any
function Alliance:resolveScriptPath(path)
	return nil
end

---@param name string
---@param position Matrix
---@param withMalus boolean
---@return Entity
function Alliance:restoreCraft(name, position, withMalus)
	return Entity
end

---@return any @nothing
function Alliance:sendCallback()
	return nil
end

--- Inherited from Faction [Server]
---@return any @nothing
function Alliance:sendCallback()
	return nil
end

--- Inherited from Faction [Server]
---@return any @nothing
function Alliance:sendChatMessage()
	return nil
end

--- Inherited from Faction [Server]
---@param x number
---@param y number
---@return any @nothing
function Alliance:setHomeSectorCoordinates(x, y)
	return nil
end

---@param playerIndex number
---@param rank string
---@return any @nothing
function Alliance:setMemberRank(playerIndex, rank)
	return nil
end

---@param playerIndex number
---@param rank string
---@return any @nothing
function Alliance:setMemberRank(playerIndex, rank)
	return nil
end

---@param rank string
---@return any @nothing
function Alliance:setNewMemberRank(rank)
	return nil
end

--- Inherited from Faction [Server]
---@return any @nothing
function Alliance:setResources()
	return nil
end

---@param name string
---@param availability ShipAvailability
---@return any @nothing
function Alliance:setShipAvailability(name, availability)
	return nil
end

---@param name string
---@param value boolean
---@return any @nothing
function Alliance:setShipDestroyed(name, value)
	return nil
end

---@param name string
---@param icon string
---@return any @nothing
function Alliance:setShipIcon(name, icon)
	return nil
end

---@param name string
---@param value any
---@return any @nothing
function Alliance:setShipOrderInfo(name, value)
	return nil
end

---@param name string
---@param value number
---@return any @nothing
function Alliance:setShipReconstructionValue(name, value)
	return nil
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@param _in boolean
---@return any @nothing
function Alliance:setStaticRelationsToFaction(factionIndex, _in)
	return nil
end

--- Sets a trait value associated with a key Inherited from Faction [Server]
---@param trait string @The name of the trait
---@param value number @The value of the trait, should be between -1 and 1
---@return any @nothing
function Alliance:setTrait(trait, value)
	return nil
end

--- Sets a custom value Inherited from Faction [Server]
---@param key string @A string that serves as the name of the value
---@param value any @The value to save. Must be bool, number, string or nil. If nil is given, the value will be deleted.
---@return any
function Alliance:setValue(key, value)
	return nil
end

---@return any @nothing
function Alliance:unregisterCallback(string, string)
	return nil
end

---@return any @nothing
function Alliance:unregisterCallback(string, string)
	return nil
end

---@param view SectorView
---@return any @nothing
function Alliance:updateKnownSector(view)
	return nil
end

---@param view SectorView
---@return any @nothing
function Alliance:updateKnownSectorPreserveNote(view)
	return nil
end

