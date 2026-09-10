---@class InteractionText
InteractionText = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	text = "", -- string

}

---@return InteractionText
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function InteractionText(id)
	return InteractionText
end

