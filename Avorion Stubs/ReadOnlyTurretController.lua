---@class ReadOnlyTurretController
ReadOnlyTurretController = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return ReadOnlyTurretController
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyTurretController(id)
	return ReadOnlyTurretController
end

---@param group number
---@return number
function ReadOnlyTurretController:getGroupOrders(group)
	return 0
end

