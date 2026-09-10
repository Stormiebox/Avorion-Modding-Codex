---@class EntityTooltip
EntityTooltip = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return EntityTooltip
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function EntityTooltip(id)
	return EntityTooltip
end

---@param i number
---@param description string
---@param str string
---@return any @nothing
function EntityTooltip:setDisplayTooltip(i, description, str)
	return nil
end

---@param i number
---@param str string
---@return any @nothing
function EntityTooltip:setTargeterTooltip(i, str)
	return nil
end

