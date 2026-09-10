---@class EntityIcon
EntityIcon = {

	dangerIcon = "", -- string
	dangerIconColor = Color, -- Color
	dangerIconVisible = true, -- bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	icon = "", -- string
	iconColor = Color, -- Color
	secondaryIcon = "", -- string
	secondaryIconColor = Color, -- Color
	tertiaryIcon = "", -- string
	tertiaryIconColor = Color, -- Color

}

---@return EntityIcon
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function EntityIcon(id)
	return EntityIcon
end

