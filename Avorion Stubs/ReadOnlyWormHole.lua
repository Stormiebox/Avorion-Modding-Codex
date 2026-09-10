---@class ReadOnlyWormHole
ReadOnlyWormHole = {

	color = Color, -- [read-only] Color
	enabled = true, -- [read-only] bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	oneWay = true, -- [read-only] bool
	passageSize = 0.0, -- [read-only] float
	simplifiedVisuals = true, -- [read-only] bool
	visible = true, -- [read-only] bool
	visualSize = 0.0, -- [read-only] float

}

---@return ReadOnlyWormHole
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyWormHole(id)
	return ReadOnlyWormHole
end

---@param entity Entity
---@return boolean
function ReadOnlyWormHole:fitsThrough(entity)
	return true
end

