---@class DeletionTimer
DeletionTimer = {

	enabled = true, -- [read-only] bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	timeLeft = 0.0, -- float

}

---@return DeletionTimer
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function DeletionTimer(id)
	return DeletionTimer
end

---@return any @nothing
function DeletionTimer:disable()
	return nil
end

