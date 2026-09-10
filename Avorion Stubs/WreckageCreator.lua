---@class WreckageCreator
WreckageCreator = {

	active = true, -- [write-only] bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return WreckageCreator
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function WreckageCreator(id)
	return WreckageCreator
end

