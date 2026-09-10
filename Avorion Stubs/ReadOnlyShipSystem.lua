---@class ReadOnlyShipSystem
ReadOnlyShipSystem = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	maxSockets = 0, -- [read-only] unsigned
	numSockets = 0, -- [read-only] int
	numUpgrades = 0, -- [read-only] unsigned

}

---@return ReadOnlyShipSystem
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyShipSystem(id)
	return ReadOnlyShipSystem
end

---@param socket number
---@return number
function ReadOnlyShipSystem:getProcessingPowerForSocket(socket)
	return 0.0
end

---@param index number
---@return SystemUpgradeTemplate
function ReadOnlyShipSystem:getUpgrade(index)
	return SystemUpgradeTemplate
end

---@return table<number, pair>
function ReadOnlyShipSystem:getUpgrades()
	return {pair}
end

---@param socket number
---@return boolean
function ReadOnlyShipSystem:isPermanent(socket)
	return true
end

