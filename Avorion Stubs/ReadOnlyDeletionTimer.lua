---@class ReadOnlyDeletionTimer
ReadOnlyDeletionTimer = {

	enabled = true, -- [read-only] bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	timeLeft = 0.0, -- [read-only] float

}

---@return ReadOnlyDeletionTimer
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyDeletionTimer(id)
	return ReadOnlyDeletionTimer
end

