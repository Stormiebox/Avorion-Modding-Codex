---@class ReadOnlyBspTree
ReadOnlyBspTree = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return ReadOnlyBspTree
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyBspTree(id)
	return ReadOnlyBspTree
end

