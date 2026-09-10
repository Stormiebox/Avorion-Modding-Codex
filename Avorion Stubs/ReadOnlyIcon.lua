---@class ReadOnlyIcon
ReadOnlyIcon = {

	dangerIcon = "", -- [read-only] string
	dangerIconColor = Color, -- [read-only] Color
	dangerIconVisible = true, -- [read-only] bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	icon = "", -- [read-only] string
	iconColor = Color, -- [read-only] Color
	secondaryIcon = "", -- [read-only] string
	secondaryIconColor = Color, -- [read-only] Color
	tertiaryIcon = "", -- [read-only] string
	tertiaryIconColor = Color, -- [read-only] Color

}

---@return ReadOnlyIcon
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyIcon(id)
	return ReadOnlyIcon
end

