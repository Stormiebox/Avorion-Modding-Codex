---@class ShipSystem
ShipSystem = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	maxSockets = 0, -- [read-only] unsigned
	numSockets = 0, -- [read-only] int
	numUpgrades = 0, -- [read-only] unsigned

}

---@return ShipSystem
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function ShipSystem(id)
	return ShipSystem
end

---@param upgrade SystemUpgradeTemplate
---@param permanent boolean
---@return number
function ShipSystem:addUpgrade(upgrade, permanent)
	return 0
end

---@return any @nothing
function ShipSystem:clear()
	return nil
end

---@param socket number
---@return number
function ShipSystem:getProcessingPowerForSocket(socket)
	return 0.0
end

---@param index number
---@return SystemUpgradeTemplate
function ShipSystem:getUpgrade(index)
	return SystemUpgradeTemplate
end

---@return table<number, pair>
function ShipSystem:getUpgrades()
	return {pair}
end

---@param socket number
---@return boolean
function ShipSystem:isPermanent(socket)
	return true
end

---@param slot number
---@return any @nothing
function ShipSystem:removeUpgrade(slot)
	return nil
end

---@param _in number
---@return any @nothing
function ShipSystem:setNumSockets(_in)
	return nil
end

---@param upgrade SystemUpgradeTemplate
---@param socket number
---@param permanent boolean
---@return any @nothing
function ShipSystem:setUpgrade(upgrade, socket, permanent)
	return nil
end

---@param socketA number
---@param socketB number
---@return any @nothing
function ShipSystem:swap(socketA, socketB)
	return nil
end

