---@class ReadOnlyLoot
ReadOnlyLoot = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return ReadOnlyLoot
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyLoot(id)
	return ReadOnlyLoot
end

