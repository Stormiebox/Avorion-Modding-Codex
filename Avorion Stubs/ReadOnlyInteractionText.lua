---@class ReadOnlyInteractionText
ReadOnlyInteractionText = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	text = "", -- [read-only] string

}

---@return ReadOnlyInteractionText
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyInteractionText(id)
	return ReadOnlyInteractionText
end

