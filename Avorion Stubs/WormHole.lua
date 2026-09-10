---@class WormHole
WormHole = {

	color = Color, -- Color
	enabled = true, -- bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	oneWay = true, -- bool
	passageSize = 0.0, -- float
	simplifiedVisuals = true, -- bool
	visible = true, -- bool
	visualSize = 0.0, -- float

}

---@return WormHole
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function WormHole(id)
	return WormHole
end

---@param entity Entity
---@return boolean
function WormHole:fitsThrough(entity)
	return true
end

---@return number,number
function WormHole:getTargetCoordinates()
	return 0,0
end

---@param x number
---@param y number
---@return any @nothing
function WormHole:setTargetCoordinates(x, y)
	return nil
end

