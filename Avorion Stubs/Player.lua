---@class Player
Player = {

	alliance = Alliance, -- [read-only] Alliance
	allianceIndex = nil, -- [read-only] var
	alwaysAtWar = true, -- bool
	baseName = "", -- [read-only] string
	craft = Entity, -- Entity
	craftFaction = UserObject, -- [read-only] UserObject
	craftIndex = 0, -- Uuid
	fullLogId = "", -- [read-only] string
	homeSectorUnknown = true, -- bool
	id = 0, -- [read-only] Uuid
	index = 0, -- [read-only] int
	infiniteResources = true, -- bool
	initialRelations = 0, -- int
	initialRelationsToPlayer = 0, -- int
	isAIFaction = true, -- [read-only] bool
	isAlliance = true, -- [read-only] bool
	isBlackMarketDLCInstalled = true, -- [read-only] bool
	isInteracting = true, -- [read-only] bool
	isPlayer = true, -- [read-only] bool
	maxBuildableMaterial = Material, -- Material
	maxBuildableSockets = 0, -- int
	maxNumMails = 0, -- [read-only] unsigned
	maxNumShips = nil, -- [read-only] var
	maxNumStations = nil, -- [read-only] var
	money = 0, -- [read-only] int
	name = nil, -- [read-only] var
	numCrafts = 0, -- [read-only] unsigned
	numMails = 0, -- [read-only] unsigned
	numShips = 0, -- [read-only] unsigned
	numStations = 0, -- [read-only] int
	ownsBlackMarketDLC = true, -- [read-only] bool
	playtime = 0, -- [read-only] unsigned
	selectedObject = Entity, -- Entity
	state = PlayerStateType.Fly, -- [read-only] PlayerStateType
	stateForm = "", -- [read-only] string
	staticRelationsToAI = true, -- bool
	staticRelationsToAll = true, -- bool
	staticRelationsToPlayers = true, -- bool
	unformattedName = Format, -- [read-only] Format

}

---@return Player
function Player()
	return Player
end

---@param item any
---@return any @nothing
function Player:addComparisonItem(item)
	return nil
end

---@param view SectorView
---@return any @nothing
function Player:addKnownSector(view)
	return nil
end

---@param mail Mail
---@return number
function Player:addMail(mail)
	return 0
end

--- Inherited from Faction [Server]
---@param name string
---@param style PlanStyle
---@return any @nothing
function Player:addPlanStyle(name, style)
	return nil
end

---@return any
function Player:addScript()
	return nil
end

---@return any
function Player:addScriptOnce()
	return nil
end

---@param entity Entity
---@return boolean,string
function Player:buildingAllowed(entity)
	return true,""
end

--- Check how many functions are registered to a callback from the current script VM.
---@param callbackName string @The name of the callback
---@param functionName any @The name of the function for which to check. If nil, will count all functions that are registered to this callback.
---@return number @The amount of functions registered to the callback
function Player:callbacksRegistered(callbackName, functionName)
	return 0
end

--- Check how many functions are registered to a callback from the current script VM.
---@param callbackName string @The name of the callback
---@param functionName any @The name of the function for which to check. If nil, will count all functions that are registered to this callback.
---@return number @The amount of functions registered to the callback. -1 if an error occurred
function Player:callbacksRegistered(callbackName, functionName)
	return 0
end

---@return boolean,string,table<number,string>
function Player:canPay()
	return true,"",{0,""}
end

--- Inherited from Faction [Server]
---@return boolean,string,table<number,string>
function Player:canPay()
	return true,"",{0,""}
end

--- Inherited from Faction [Server]
---@param money number
---@return boolean,string,table<number,string>
function Player:canPayMoney(money)
	return true,"",{0,""}
end

--- Inherited from Faction [Server]
---@param material Material
---@param amount number
---@return boolean,string,table<number,string>
function Player:canPayResource(material, amount)
	return true,"",{0,""}
end

---@param index number
---@return any @nothing
function Player:clearMail(index)
	return nil
end

--- Removes all custom values of the object Inherited from Faction [Server]
---@return any @nothing
function Player:clearValues()
	return nil
end

---@param name string
---@param position Matrix
---@param faction any
---@return Entity
function Player:createCraftFromShipInfo(name, position, faction)
	return Entity
end

---@return table<number, Relation>
function Player:getAllRelations()
	return {Relation}
end

--- Inherited from Faction [Server]
---@return table<number, Relation>
function Player:getAllRelations()
	return {Relation}
end

---@return number,number
function Player:getHomeSectorCoordinates()
	return 0,0
end

--- Inherited from Faction [Server]
---@return number,number
function Player:getHomeSectorCoordinates()
	return 0,0
end

---@return Inventory
function Player:getInventory()
	return Inventory
end

--- Inherited from Faction [Server]
---@return Inventory
function Player:getInventory()
	return Inventory
end

---@param x number
---@param y number
---@return SectorView
function Player:getKnownSector(x, y)
	return SectorView
end

---@param x number
---@param y number
---@return SectorView
function Player:getKnownSector(x, y)
	return SectorView
end

---@return table<number, ivec2>
function Player:getKnownSectorCoordinates()
	return {ivec2}
end

---@return table<number, ivec2>
function Player:getKnownSectorCoordinates()
	return {ivec2}
end

---@return table<number, SectorView>
function Player:getKnownSectors()
	return {SectorView}
end

---@return table<number, SectorView>
function Player:getKnownSectors()
	return {SectorView}
end

---@param factionIndex number
---@return table<number, SectorView>
function Player:getKnownSectorsOfFaction(factionIndex)
	return {SectorView}
end

---@param factionIndex number
---@return table<number, SectorView>
function Player:getKnownSectorsOfFaction(factionIndex)
	return {SectorView}
end

---@param factionIndex number
---@return table<number, SectorView>
function Player:getKnownSectorsWithFaction(factionIndex)
	return {SectorView}
end

--- Inherited from Faction [Server]
---@return Language
function Player:getLanguage()
	return Language
end

---@param index number
---@return Mail
function Player:getMail(index)
	return Mail
end

---@param index number
---@return Mail
function Player:getMail(index)
	return Mail
end

---@param id string
---@return table<number, Mail>
function Player:getMailsById(id)
	return {Mail}
end

---@param x number
---@param y number
---@return table<number, string>
function Player:getNamesOfShipsInSector(x, y)
	return {""}
end

---@param x number
---@param y number
---@return table<number, string>
function Player:getNamesOfShipsInSector(x, y)
	return {""}
end

---@param name string
---@return PlanStyle
function Player:getPlanStyle(name)
	return PlanStyle
end

--- Inherited from Faction [Server]
---@param name string
---@return PlanStyle
function Player:getPlanStyle(name)
	return PlanStyle
end

---@return table<number, string>
function Player:getPlanStyleNames()
	return {""}
end

--- Inherited from Faction [Server]
---@return table<number, string>
function Player:getPlanStyleNames()
	return {""}
end

---@param factionIndex number
---@return Relation
function Player:getRelation(factionIndex)
	return Relation
end

--- Inherited from Faction [Server]
---@param otherFactionIndex number
---@return Relation
function Player:getRelation(otherFactionIndex)
	return Relation
end

---@param factionIndex number
---@return number
function Player:getRelationStatus(factionIndex)
	return 0
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@return number
function Player:getRelationStatus(factionIndex)
	return 0
end

---@param factionIndex number
---@return number
function Player:getRelations(factionIndex)
	return 0
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@return number
function Player:getRelations(factionIndex)
	return 0
end

---@return table<number, number>
function Player:getResources()
	return {0}
end

--- Inherited from Faction [Server]
---@return table<number, number>
function Player:getResources()
	return {0}
end

---@return number,number
function Player:getRespawnSectorCoordinates()
	return 0,0
end

---@return number,number
function Player:getRespawnSectorCoordinates()
	return 0,0
end

---@return table<number,string>
function Player:getScripts()
	return {0,""}
end

---@return table<number,string>
function Player:getScripts()
	return {0,""}
end

---@return number, number
function Player:getSectorCoordinates()
	return 0, 0
end

---@param index number
---@return any
function Player:getSelectionGroup(index)
	return nil
end

---@return any
function Player:getSelectionGroups()
	return nil
end

---@param name string
---@return any
function Player:getShipAvailability(name)
	return nil
end

---@param name string
---@return any
function Player:getShipAvailability(name)
	return nil
end

---@param name string
---@return Box
function Player:getShipBoundingBox(name)
	return Box
end

---@param name string
---@return Box
function Player:getShipBoundingBox(name)
	return Box
end

---@param name string
---@return boolean
function Player:getShipCanPassRifts(name)
	return true
end

---@param name string
---@return boolean
function Player:getShipCanPassRifts(name)
	return true
end

---@param name string
---@return string
function Player:getShipCargo(name)
	return ""
end

---@param name string
---@return string
function Player:getShipCargo(name)
	return ""
end

---@param name string
---@return table<TradingGood,number>
function Player:getShipCargos(name)
	return {TradingGood,0}
end

---@param name string
---@return table<TradingGood,number>
function Player:getShipCargos(name)
	return {TradingGood,0}
end

---@param name string
---@return Crew
function Player:getShipCrew(name)
	return Crew
end

---@param name string
---@return any
function Player:getShipDestroyed(name)
	return nil
end

---@param name string
---@return any
function Player:getShipDestroyed(name)
	return nil
end

---@param name string
---@return number
function Player:getShipHyperspaceReach(name)
	return 0.0
end

---@param name string
---@return number
function Player:getShipHyperspaceReach(name)
	return 0.0
end

---@param name string
---@return string
function Player:getShipIcon(name)
	return ""
end

---@param name string
---@return string
function Player:getShipIcon(name)
	return ""
end

---@return table<number, string>
function Player:getShipNames()
	return {""}
end

---@return table<number, string>
function Player:getShipNames()
	return {""}
end

---@param name string
---@return any
function Player:getShipOrderInfo(name)
	return nil
end

---@param name string
---@return any
function Player:getShipOrderInfo(name)
	return nil
end

---@param name string
---@return number
function Player:getShipPayment(name)
	return 0.0
end

---@param name string
---@return number
function Player:getShipPayment(name)
	return 0.0
end

---@param name string
---@return number
function Player:getShipPaymentTime(name)
	return 0.0
end

---@param name string
---@return number
function Player:getShipPaymentTime(name)
	return 0.0
end

---@param name string
---@return BlockPlan
function Player:getShipPlan(name)
	return BlockPlan
end

---@param name string
---@return BlockPlan
function Player:getShipPlan(name)
	return BlockPlan
end

---@param name string
---@return table<number, any>
function Player:getShipPosition(name)
	return {nil}
end

---@param name string
---@return table<number, any>
function Player:getShipPosition(name)
	return {nil}
end

---@param name string
---@return number
function Player:getShipReconstructionValue(name)
	return 0.0
end

---@param name string
---@return number
function Player:getShipReconstructionValue(name)
	return 0.0
end

---@param name string
---@return string
function Player:getShipStatus(name)
	return ""
end

---@param name string
---@return string
function Player:getShipStatus(name)
	return ""
end

---@param name string
---@return table<number, pair>
function Player:getShipSystems(name)
	return {pair}
end

---@param name string
---@return table<number, pair>
function Player:getShipSystems(name)
	return {pair}
end

---@param name string
---@return table<number,TurretDesign>
function Player:getShipTurretDesigns(name)
	return {0,TurretDesign}
end

---@param name string
---@return table<number,TurretDesign>
function Player:getShipTurretDesigns(name)
	return {0,TurretDesign}
end

---@param name string
---@return number
function Player:getShipType(name)
	return 0
end

---@param name string
---@return number
function Player:getShipType(name)
	return 0
end

--- Retrieves a trait value associated with a key Inherited from Faction [Server]
---@param trait string @The name of the trait
---@return number @The trait value associated with the key
function Player:getTrait(trait)
	return 0.0
end

--- Retrieves all key-value trait pairs of the faction Inherited from Faction [Server]
---@return table<string,number> @A table containing all custom key-value pairs
function Player:getTraits()
	return {"",0.0}
end

---@param name string
---@return any
function Player:getValue(name)
	return nil
end

--- Retrieves a custom value saved in the entity with the given key Inherited from Faction [Server]
---@param key string @A string that serves as the name of the value
---@return any @The value if the key exists, otherwise nil
function Player:getValue(key)
	return nil
end

--- Retrieves all key-value pairs of custom values Inherited from Faction [Server]
---@return table<string,any> @A table containing all custom key-value pairs
function Player:getValues()
	return {"",nil}
end

---@param name string
---@return boolean
function Player:hasScript(name)
	return true
end

---@param name string
---@return any
function Player:hasScript(name)
	return nil
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@return boolean
function Player:hasStaticRelationsToFaction(factionIndex)
	return true
end

--- Invokes a function in a script of the player. Use this function to invoke functions from one script in another script. The first return value of the function is an integer indicating whether or not the call was successful. When it was, this integer is followed by the return values of the invoked function.
---@param scriptName any @The name of the script containing the function
---@param functionName string @The name of the function that will be executed
---@param arguments table<number, any> @An arbitrary list of arguments that will be given to the invoked function. Only numbers, std::strings and nil are supported here.
---@return table<number, any> @Returns at least 1 value indicating if the call succeeded: 0 The call was successful. In this case, the return values of the script are returned in addition to the call result, following the call result. 3 The call failed because the given script was not found in the player. 4 The call failed because the given function was not found in the script.  5 The call failed because the script's state has errors and is invalid
function Player:invokeFunction(scriptName, functionName, arguments)
	return {nil}
end

--- Invokes a function in a script of the player. Use this function to invoke functions from one script in another script. The first return value of the function is an integer indicating whether or not the call was successful. When it was, this integer is followed by the return values of the invoked function.
---@param scriptName any @The name or index of the script containing the function
---@param functionName string @The name of the function that will be executed
---@param arguments table<number, any> @An arbitrary list of arguments that will be given to the invoked function
---@return table<number, any> @Returns at least 1 value indicating if the call succeeded: 0 The call was successful. In this case, the return values of the script are returned in addition to the call result, following the call result. 3 The call failed because the given script was not found  4 The call failed because the given function was not found in the script  5 The call failed because the script's state has errors and is invalid
function Player:invokeFunction(scriptName, functionName, arguments)
	return {nil}
end

---@param factionIndex number
---@return boolean
function Player:knowsFaction(factionIndex)
	return true
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@return boolean
function Player:knowsFaction(factionIndex)
	return true
end

---@param x number
---@param y number
---@return boolean
function Player:knowsSector(x, y)
	return true
end

---@param x number
---@param y number
---@return boolean
function Player:knowsSector(x, y)
	return true
end

--- @callback
--- Executed whenever all scripts values of the player have been changed at once
function Player:onAllScriptValuesChanged(playerIndex)
end

--- @callback
--- Executed whenever the player's alliance changes
function Player:onAllianceChanged(allianceIndex)
end

--- @callback
--- Executed whenever the player's alliance changes
function Player:onAllianceChanged(allianceIndex)
end

--- @callback
--- Executed whenever the player receives an invitation from an alliance
function Player:onAllianceInvitationReceived(allianceIndex)
end

--- @callback
--- Executed whenever the player receives an invitation from an alliance
function Player:onAllianceInvitationReceived(allianceIndex)
end

--- @callback
--- Executed whenever the player sent a chat message to the server. Only called if the chat message is valid and the player doesn't have a chat ban.
function Player:onChatMessage(playerIndex, text, channel)
end

--- @callback
--- Executed whenever a player's chat restriction time is changed. This usually only happens when administrators need to stop a player from using chat.
function Player:onChatRestrictionTimeChanged(time)
end

--- @callback
--- Executed whenever a player's chat restriction time is changed. This usually only happens when administrators need to stop a player from using chat.
function Player:onChatRestrictionTimeChanged(time)
end

--- @callback
--- Called whenever the player changes their flown craft
function Player:onCraftChanged(id, previousId)
end

--- @callback
--- Executed whenever a keyboard-up event occurs on the galaxy map. Keyboad-Up events are transferred to all UI elements and can't be consumed.
function Player:onGalaxyMapKeyboardUp(button)
end

--- @callback
--- Executed whenever a mouse-up event occurs on the galaxy map. Mouse-Up events are transferred to all UI elements and can't be consumed.
function Player:onGalaxyMapMouseUp(button, mx, my, cx, cy, mapMoved)
end

--- @callback
--- Executed whenever the map is visible and updated by a game tick.
function Player:onGalaxyMapUpdate(timeStep)
end

--- @callback
--- Executed whenever the player's group index changes
function Player:onGroupChanged(groupIndex)
end

--- @callback
--- Executed whenever the player's group index changes
function Player:onGroupChanged(groupIndex)
end

--- @callback
--- Executed whenever the leader of the player's group changes
function Player:onGroupLeaderChanged(playerIndex)
end

--- @callback
--- Executed whenever the leader of the player's group changes
function Player:onGroupLeaderChanged(playerIndex)
end

--- @callback
--- Executed whenever another player of the player's group changes crafts
function Player:onGroupPlayerCraftChanged(playerIndex, id)
end

--- @callback
--- Executed whenever another player of the player's group changes crafts
function Player:onGroupPlayerCraftChanged(playerIndex, id)
end

--- @callback
--- Executed whenever another player of the player's group changes sectors
function Player:onGroupPlayerSectorChanged(playerIndex, x, y)
end

--- @callback
--- Executed whenever another player of the player's group changes sectors
function Player:onGroupPlayerSectorChanged(playerIndex, x, y)
end

--- @callback
--- Executed whenever the player closes the map.
function Player:onHideGalaxyMap()
end

--- @callback
--- Called whenever the home sector of the player changes
function Player:onHomeSectorChanged(x, y)
end

--- @callback
--- Called whenever the home sector of the player changes
function Player:onHomeSectorChanged(x, y)
end

--- @callback
--- Executed whenever a player's hyperspace restriction time is changed. This usually only happens when administrators need to trap a player in a specific sector.
function Player:onHyperspaceRestrictionTimeChanged(time)
end

--- @callback
--- Executed whenever a player's hyperspace restriction time is changed. This usually only happens when administrators need to trap a player in a specific sector.
function Player:onHyperspaceRestrictionTimeChanged(time)
end

--- @callback
--- Executed whenever the number of items in a particular item slot in the player's inventory increases or a new item was added.
function Player:onItemAdded(itemIndex, amount, amountBefore)
end

--- @callback
--- Called whenever an item in the player inventory is added
function Player:onItemAdded(item, index, amount, amountBefore, tagsChanged)
end

--- @callback
--- Executed whenever the number of items in a particular item slot in the player's inventory changes.
function Player:onItemChanged(itemIndex, amount, amountBefore)
end

--- @callback
--- Called whenever an item in the player inventory changes
function Player:onItemChanged(item, index, amount, amountBefore)
end

--- @callback
--- Called whenever an item in the player inventory changes properties
function Player:onItemPropertiesChanged(item, index, amount)
end

--- @callback
--- Called whenever an item in the player inventory changes properties
function Player:onItemPropertiesChanged(item, index, amount)
end

--- @callback
--- Executed whenever the number of items in a particular item slot in the player's inventory decreases or the item was removed.
function Player:onItemRemoved(itemIndex, amount, amountBefore)
end

--- @callback
--- Called whenever an item in the player inventory is removed
function Player:onItemRemoved(item, index, amount, amountBefore)
end

--- @callback
--- Executed whenever a player starts a new hyperspace jump route calculation
function Player:onJumpRouteCalculationStarted(playerIndex, craftIndex, destinationX, destinationY)
end

--- @callback
--- Called whenever a new tracked sector is added to the player database
function Player:onKnownSectorAdded(x, y)
end

--- @callback
--- Called whenever a new tracked sector is added to the player database
function Player:onKnownSectorAdded(x, y)
end

--- @callback
--- Called whenever a tracked sector was removed from the player database
function Player:onKnownSectorRemoved(x, y)
end

--- @callback
--- Called whenever a tracked sector was removed from the player database
function Player:onKnownSectorRemoved(x, y)
end

--- @callback
--- Called whenever a tracked sector is updated in the player database
function Player:onKnownSectorUpdated(x, y)
end

--- @callback
--- Called whenever a tracked sector is updated in the player database
function Player:onKnownSectorUpdated(x, y)
end

--- @callback
--- Executed whenever the player receives a new mail
function Player:onMailAdded(playerIndex, mail, mailIndex)
end

--- @callback
--- Executed whenever the player receives a mail
function Player:onMailAdded(mail, id)
end

--- @callback
--- Executed whenever the player takes the contents of a mail
function Player:onMailCleared(playerIndex, mailIndex)
end

--- @callback
--- Executed whenever a mail was cleared
function Player:onMailCleared(mailIndex, id)
end

--- @callback
--- Executed whenever the player deletes a mail
function Player:onMailDeleted(playerIndex, mailIndex)
end

--- @callback
--- Executed whenever the player reads a mail
function Player:onMailRead(playerIndex, mailIndex)
end

--- @callback
--- Executed whenever a mail was read
function Player:onMailRead(mailIndex, id)
end

--- @callback
--- Executed whenever a mail was removed from the player's mailbox
function Player:onMailRemoved(mailIndex, id)
end

--- @callback
--- Executed whenever a mail was updated
function Player:onMailUpdated(mail, mailIndex)
end

--- @callback
--- Executed whenever the map is rendered, after its layers were rendered
function Player:onMapRenderAfterLayers()
end

--- @callback
--- Executed whenever the map is rendered, after its tooltips were rendered
function Player:onMapRenderAfterTooltips()
end

--- @callback
--- Executed whenever the map is rendered, after its UI was rendered
function Player:onMapRenderAfterUI()
end

--- @callback
--- Executed whenever the map is rendered, before its layers are rendered
function Player:onMapRenderBeforeLayers()
end

--- @callback
--- Executed whenever a player's ship building knowledge changes.
function Player:onMaxBuildableMaterialChanged(material)
end

--- @callback
--- Executed whenever a player's ship building knowledge changes.
function Player:onMaxBuildableSocketsChanged(slots)
end

--- @callback
--- Executed whenever a move to reconstruction site is triggered because the player was destroyed. Called even if the player is already at their reconstruction site.
function Player:onMoveToReconstructionSite(playerIndex)
end

--- @callback
--- Called whenever the name of the player changes
function Player:onNameChanged(newName)
end

--- @callback
--- Executed when the client reports that it entered the target sector. Clients send a message to the server once the loading screen ended. Once you receive this callback, the client has successfully loaded the sector it went into.
function Player:onPlayerArrivalConfirmed(playerIndex)
end

--- @callback
--- Executed whenever another player enters the player's group
function Player:onPlayerEnteredGroup(playerIndex)
end

--- @callback
--- Executed whenever another player enters the player's group
function Player:onPlayerEnteredGroup(playerIndex)
end

--- @callback
--- Executed whenever another player from the player's group leaves the group
function Player:onPlayerLeftGroup(playerIndex)
end

--- @callback
--- Executed whenever another player from the player's group leaves the group
function Player:onPlayerLeftGroup(playerIndex)
end

--- @callback
--- Executed every frame during rendering after rendering the HUD. All render calls that should overlay the HUD should be done here.
function Player:onPostRenderHud(state)
end

--- @callback
--- Executed every frame during rendering before rendering the HUD. All render calls that are not supposed to overlay the HUD should be done here.
function Player:onPreRenderHud(state)
end

--- @callback
--- Called whenever relations of the player to another faction change
function Player:onRelationChanged(index, level, levelBefore, notify)
end

--- @callback
--- Called whenever relations of the player to another faction change
function Player:onRelationChanged(index, level, levelBefore, notify)
end

--- @callback
--- Executed whenever the relations of the player to another faction changes.
function Player:onRelationLevelChanged(playerIndex, factionIndex, relations)
end

--- @callback
--- Called whenever relation levels of the player to another faction change
function Player:onRelationLevelChanged(index, level, levelBefore, notify)
end

--- @callback
--- Executed whenever the relation status of the player to another faction changes.
function Player:onRelationStatusChanged(playerIndex, factionIndex, status)
end

--- @callback
--- Called whenever the relation status of the player to another faction change (relation status is not yet implemented so this callback will most likely not fire until relation status is in)
function Player:onRelationStatusChanged(index, status, statusBefore, notify)
end

--- @callback
--- Executed whenever the money or resources of the player change
function Player:onResourcesChanged(playerIndex)
end

--- @callback
--- Called whenever the amount of money or resources of the player changes
function Player:onResourcesChanged(money, resources, infinite, notify)
end

--- @callback
--- Executed whenever the player's respawn sector changes
function Player:onRespawnSectorChanged(x, y)
end

--- @callback
--- Executed whenever the player's respawn sector changes
function Player:onRespawnSectorChanged(x, y)
end

--- @callback
--- Executed after a script was added to the player
function Player:onScriptAdded(playerIndex, scriptIndex, scriptPath)
end

--- @callback
--- Executed after a script was removed from the player
function Player:onScriptRemoved(playerIndex, oldScriptIndex, scriptPath)
end

--- @callback
--- Executed whenever a script value of the player was changed
function Player:onScriptValueChanged(playerIndex, name, value)
end

--- @callback
--- Executed when the client reports that it entered the target sector. Clients send a message to the server once the loading screen ended. Once you receive this callback, the client has successfully loaded the sector it went into.
function Player:onSectorArrivalConfirmed(playerIndex, x, y)
end

--- @callback
--- Executed whenever the player changes the sector
function Player:onSectorChanged(x, y)
end

--- @callback
--- Executed whenever the player changes the sector
function Player:onSectorChanged(x, y)
end

--- @callback
--- Executed whenever the player enters a new sector.
function Player:onSectorEntered(playerIndex, x, y, sectorChangeType)
end

--- @callback
--- Executed whenever the player leaves their current sector, before entities are removed
function Player:onSectorLeft(playerIndex, x, y, sectorChangeType)
end

--- @callback
--- Executed whenever a coordinate on the map is selected.
function Player:onSelectMapCoordinates(x, y)
end

--- @callback
--- Called whenever a ShipInfo changes availability status (ie. goes into background simulation)
function Player:onShipAvailabilityUpdated(name, availability)
end

--- @callback
--- Called whenever a ShipInfo changes availability status (ie. goes into background simulation)
function Player:onShipAvailabilityUpdated(name, availability)
end

--- @callback
--- Called whenever the cargo of a ShipInfo changes
function Player:onShipCargoUpdated(name)
end

--- @callback
--- Called whenever the cargo of a ShipInfo changes
function Player:onShipCargoUpdated(name)
end

--- @callback
--- Executed whenever the player changes the ship he is currently flying
function Player:onShipChanged(playerIndex, craftId)
end

--- @callback
--- Executed whenever the player changes the ship they're currently flying
function Player:onShipChanged(playerIndex, craftId, previousId)
end

--- @callback
--- Called whenever the crew of a ShipInfo changes
function Player:onShipCrewUpdated(name)
end

--- @callback
--- Called whenever the crew of a ShipInfo changes
function Player:onShipCrewUpdated(name)
end

--- @callback
--- Called whenever the hyperspace reach of a ShipInfo changes
function Player:onShipHyperspacePropertiesUpdated(name, reach, canPassRifts)
end

--- @callback
--- Called whenever the hyperspace reach of a ShipInfo changes
function Player:onShipHyperspacePropertiesUpdated(name, reach, canPassRifts)
end

--- @callback
--- Called whenever the icon of a ShipInfo changes
function Player:onShipIconUpdated(name, icon)
end

--- @callback
--- Called whenever the icon of a ShipInfo changes
function Player:onShipIconUpdated(name, icon)
end

--- @callback
--- Called whenever a ShipInfo is added to the player
function Player:onShipInfoAdded(name)
end

--- @callback
--- Called whenever a ShipInfo is added to the player
function Player:onShipInfoAdded(name)
end

--- @callback
--- Called whenever a ShipInfo is removed from the player
function Player:onShipInfoRemoved(name)
end

--- @callback
--- Called whenever a ShipInfo is removed from the player
function Player:onShipInfoRemoved(name)
end

--- @callback
--- Called whenever a ShipInfo is updated in some way
function Player:onShipInfoUpdated(name)
end

--- @callback
--- Called whenever a ShipInfo is updated in some way
function Player:onShipInfoUpdated(name)
end

--- @callback
--- Called whenever the name of a ShipInfo changes
function Player:onShipNameUpdated(name, newName)
end

--- @callback
--- Called whenever the name of a ShipInfo changes
function Player:onShipNameUpdated(name, newName)
end

--- @callback
--- Called whenever the order info of a ShipInfo changes
function Player:onShipOrderInfoUpdated(name, orderInfo)
end

--- @callback
--- Called whenever the order info of a ShipInfo changes
function Player:onShipOrderInfoUpdated(name, orderInfo)
end

--- @callback
--- Called whenever the payday of a ShipInfo changes
function Player:onShipPayDayUpdated(name, time)
end

--- @callback
--- Called whenever the payday of a ShipInfo changes
function Player:onShipPayDayUpdated(name, time)
end

--- @callback
--- Called whenever the plan of a ShipInfo changes
function Player:onShipPlanUpdated(name)
end

--- @callback
--- Called whenever the plan of a ShipInfo changes
function Player:onShipPlanUpdated(name)
end

--- @callback
--- Called whenever a ShipInfo changes sectors
function Player:onShipPositionUpdated(name, x, y)
end

--- @callback
--- Called whenever a ShipInfo changes sectors
function Player:onShipPositionUpdated(name, x, y)
end

--- @callback
--- Called whenever the reconstruction value of a ShipInfo changes
function Player:onShipReconstructionValueUpdated(name, value)
end

--- @callback
--- Called whenever the reconstruction value of a ShipInfo changes
function Player:onShipReconstructionValueUpdated(name, value)
end

--- @callback
--- Called whenever the status info of a ShipInfo changes
function Player:onShipStatusMessageUpdated(name, status, args)
end

--- @callback
--- Called whenever the status info of a ShipInfo changes
function Player:onShipStatusMessageUpdated(name, status, arguments)
end

--- @callback
--- Called whenever the title of a ShipInfo changes
function Player:onShipTitleUpdated(name)
end

--- @callback
--- Called whenever the title of a ShipInfo changes
function Player:onShipTitleUpdated(name)
end

--- @callback
--- Called whenever the entity type of a ShipInfo changes
function Player:onShipTypeUpdated(name, type)
end

--- @callback
--- Called whenever the entity type of a ShipInfo changes
function Player:onShipTypeUpdated(name, type)
end

--- @callback
--- Executed whenever the player opens the map.
function Player:onShowGalaxyMap()
end

--- @callback
--- Executed when a dialog is started.
function Player:onStartDialog(objectIndex)
end

--- @callback
--- Executed when the state of the player changes
function Player:onStateChanged(newState, oldState)
end

--- @callback
--- Called whenever the state form of the player changes
function Player:onStateFormChanged(newForm)
end

--- @callback
--- Called whenever a "personality" trait of the player changes
function Player:onTraitChanged(trait, value)
end

---@param name string
---@return boolean
function Player:ownsShip(name)
	return true
end

---@param name string
---@return boolean
function Player:ownsShip(name)
	return true
end

--- Makes the faction pay a certain amount of money and resources. If the faction can't pay, the respective money and resources will be set to 0. This function accepts an optional string for Format as first argument, as an economy notification describing the transaction that will be sent to the player, in case the faction is a player. To ease handling of transaction descriptions, the format description (if set) will receive all the remaining arguments given to the pay() function as format arguments, in the same order as they are given to the function. Dots for easier reading will be inserted as well. Examples: faction:pay("Paid %1% Credits and %2% iron.", 50000, 250)  -> "Paid 50.000 Credits and 250 iron." faction:pay(Format("%1% paid %2% Credits and %3% iron.", "Excelsior"), 50, 25000)  -> "Excelsior paid 50 Credits and 25.000 iron." Inherited from Faction [Server]
---@param description [optional] | Format | or | string @[optional] A description for the transaction. Can either be a string or a Format. If this variable is set, money and resources will be appended to the end of the list of arguments passed to the description format string. @Money that will be removed from the faction @A list of resources, starting with iron, that will be removed from the faction
---@param money number
---@param resources table<number, number>
---@return any @nothing
function Player:pay(description, money, resources)
	return nil
end

--- Makes the faction pay a certain amount of resources. If the faction can't pay, the respective resource will be set to 0. This function accepts a string for Format as first argument, as an economy notification describing the transaction that will be sent to the player, in case the faction is a player. Inherited from Faction [Server]
---@param description Format | or | string @A description for the transaction. Can either be a string or a Format.
---@param material Material @The kind of material that will be removed from the faction
---@param amount number @Amount that will be removed from the faction
---@return any @nothing
function Player:payResource(description, material, amount)
	return nil
end

--- Similar behavior to pay(), except there will not be a notification popping up in case the faction is a player, and the description for the transaction in this function isn't optional. Inherited from Faction [Server]
---@param description Format | or | string @A description for the transaction. Can either be a string or a Format. Money and resources will be appended to the end of the list of arguments passed to the description format string.
---@param money number @Money that will be removed from the faction
---@param args table<number, number> @A list of resources, starting with iron, that will be removed from the faction
---@return any @nothing
function Player:payWithoutNotify(description, money, args)
	return nil
end

---@param index number
---@return any @nothing
function Player:readMail(index)
	return nil
end

--- Makes the faction receive a certain amount of money and resources. This function accepts an optional string for Format as first argument, as an economy notification describing the transaction that will be sent to the player, in case the faction is a player. To ease handling of transaction descriptions, the format description (if set) will receive all the remaining arguments given to the receive() function as format arguments, in the same order as they are given to the function. Dots for easier reading will be inserted as well. Examples: faction:receive("Got %1% Credits and %2% iron.", 50000, 250)  -> "Got 50.000 Credits and 250 iron." faction:receive(Format("%1% received %2% Credits and %3% iron.", "Excelsior"), 50, 25000)  -> "Excelsior received 50 Credits and 25.000 iron." Inherited from Faction [Server]
---@param description [optional] | Format | or | string @[optional] A description for the transaction. Can either be a string or a Format. If this variable is set, money and resources will be appended to the end of the list of arguments passed to the description format string. @Money that will be given to the faction @A list of resources, starting with iron, that will be given to the faction
---@param money number
---@param resources table<number, number>
---@return any @nothing
function Player:receive(description, money, resources)
	return nil
end

--- Makes the faction receive a certain amount of resources. This function accepts a string for Format as first argument, as an economy notification describing the transaction that will be sent to the player, in case the faction is a player. Inherited from Faction [Server]
---@param description Format | or | string @A description for the transaction. Can either be a string or a Format.
---@param material Material @The kind of material that will be given to the faction
---@param amount number @Amount that will be given to the faction
---@return any @nothing
function Player:receiveResource(description, material, amount)
	return nil
end

--- Similar behavior to receive(), except there will not be a notification popping up in case the faction is a player, and the description for the transaction in this function isn't optional. Inherited from Faction [Server]
---@param description Format | or | string @A description for the transaction. Can either be a string or a Format. Money and resources will be appended to the end of the list of arguments passed to the description format string.
---@param money number @Money that will be given to the faction
---@param args table<number, number> @A list of resources, starting with iron, that will be given to the faction
---@return any @nothing
function Player:receiveWithoutNotify(description, money, args)
	return nil
end

--- Register a callback in the player. The callback will be removed when the sector is changed or the receiver, if it's an entity, is destroyed. Double registration of callbacks doesn't work. When the same callback to the same callback of the same script instance is registered twice, it will still only be called once.
---@param callbackName string @The name of the callback
---@param functionName string @The name of the function that will be executed in the script when the callback happens
---@return any @nothing
function Player:registerCallback(callbackName, functionName)
	return nil
end

--- Register a callback in a player. The callback may arrive with a delay. Double registration of callbacks doesn't work. When the same callback to the same callback of the same script instance is registered twice, it will still only be called once.
---@param callbackName string @The name of the callback
---@param functionName string @The name of the function that will be executed in the script when the callback happens
---@return number @0 on success, 1 if the registration failed
function Player:registerCallback(callbackName, functionName)
	return 0
end

---@param name string
---@return any @nothing
function Player:removeDestroyedShipInfo(name)
	return nil
end

---@param x number
---@param y number
---@return any @nothing
function Player:removeKnownSector(x, y)
	return nil
end

---@param index number
---@return any @nothing
function Player:removeMail(index)
	return nil
end

---@param script any
---@return any @nothing
function Player:removeScript(script)
	return nil
end

---@return any @nothing
function Player:resetHyperspaceCalculation()
	return nil
end

---@param path string
---@return any
function Player:resolveScriptPath(path)
	return nil
end

---@param name string
---@param position Matrix
---@param withMalus boolean
---@return Entity
function Player:restoreCraft(name, position, withMalus)
	return Entity
end

---@return any @nothing
function Player:sendCallback()
	return nil
end

--- Inherited from Faction [Server]
---@return any @nothing
function Player:sendCallback()
	return nil
end

---@param content any
---@param channel any
---@return any @nothing
function Player:sendChatMessage(content, channel)
	return nil
end

--- Inherited from Faction [Server]
---@return any @nothing
function Player:sendChatMessage()
	return nil
end

--- Inherited from Faction [Server]
---@param x number
---@param y number
---@return any @nothing
function Player:setHomeSectorCoordinates(x, y)
	return nil
end

--- Inherited from Faction [Server]
---@return any @nothing
function Player:setResources()
	return nil
end

---@param x number
---@param y number
---@return any @nothing
function Player:setRespawnSectorCoordinates(x, y)
	return nil
end

---@param index number
---@param group_in any
---@return any @nothing
function Player:setSelectionGroup(index, group_in)
	return nil
end

---@param name string
---@param availability ShipAvailability
---@return any @nothing
function Player:setShipAvailability(name, availability)
	return nil
end

---@param name string
---@param destroyed boolean
---@return any @nothing
function Player:setShipDestroyed(name, destroyed)
	return nil
end

---@param name string
---@param icon string
---@return any @nothing
function Player:setShipIcon(name, icon)
	return nil
end

---@param name string
---@param value any
---@return any @nothing
function Player:setShipOrderInfo(name, value)
	return nil
end

---@param name string
---@param value number
---@return any @nothing
function Player:setShipReconstructionValue(name, value)
	return nil
end

--- Inherited from Faction [Server]
---@param factionIndex number
---@param _in boolean
---@return any @nothing
function Player:setStaticRelationsToFaction(factionIndex, _in)
	return nil
end

--- Sets a trait value associated with a key Inherited from Faction [Server]
---@param trait string @The name of the trait
---@param value number @The value of the trait, should be between -1 and 1
---@return any @nothing
function Player:setTrait(trait, value)
	return nil
end

--- Sets a custom value Inherited from Faction [Server]
---@param key string @A string that serves as the name of the value
---@param value any @The value to save. Must be bool, number, string or nil. If nil is given, the value will be deleted.
---@return any
function Player:setValue(key, value)
	return nil
end

---@param entity Entity
---@return any @nothing
function Player:startBuilding(entity)
	return nil
end

---@param entity Entity
---@param scriptName string
---@param optionIndex number
---@return any @nothing
function Player:startInteracting(entity, scriptName, optionIndex)
	return nil
end

---@return any @nothing
function Player:stopInteracting()
	return nil
end

---@param callbackName string
---@param functionName string
---@return any @nothing
function Player:unregisterCallback(callbackName, functionName)
	return nil
end

---@param callbackName string
---@param functionName string
---@return number
function Player:unregisterCallback(callbackName, functionName)
	return 0
end

---@param view SectorView
---@return any @nothing
function Player:updateKnownSector(view)
	return nil
end

---@param newView SectorView
---@return any @nothing
function Player:updateKnownSectorPreserveNote(newView)
	return nil
end

---@param mail Mail
---@param index number
---@return any @nothing
function Player:updateMail(mail, index)
	return nil
end

