---@class TurretController
TurretController = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return TurretController
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function TurretController(id)
	return TurretController
end

---@param group number
---@return number
function TurretController:getGroupOrders(group)
	return 0
end

---@param group number
---@param autoFireMode number
---@return any @nothing
function TurretController:setGroupFireMode(group, autoFireMode)
	return nil
end

