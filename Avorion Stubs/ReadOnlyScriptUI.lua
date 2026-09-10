---@class ReadOnlyScriptUI
ReadOnlyScriptUI = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return ReadOnlyScriptUI
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyScriptUI(id)
	return ReadOnlyScriptUI
end

