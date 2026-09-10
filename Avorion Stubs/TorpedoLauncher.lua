---@class TorpedoLauncher
TorpedoLauncher = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	freeStorage = 0.0, -- [read-only] float
	maxShafts = 0, -- [read-only] int
	maximumStorage = 0.0, -- [read-only] float
	numShafts = 0, -- [read-only] unsigned
	numTorpedoes = 0, -- [read-only] unsigned
	occupiedStorage = 0.0, -- [read-only] float

}

---@return TorpedoLauncher
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function TorpedoLauncher(id)
	return TorpedoLauncher
end

---@param torpedo TorpedoTemplate
---@param shaft any
---@return boolean
function TorpedoLauncher:addTorpedo(torpedo, shaft)
	return true
end

---@return any @nothing
function TorpedoLauncher:clear()
	return nil
end

---@param position Box
---@param torpedo TorpedoTemplate
---@return Entity
function TorpedoLauncher:createTorpedo(position, torpedo)
	return Entity
end

---@param shaftIndex any
---@return number
function TorpedoLauncher:getFreeSlots(shaftIndex)
	return 0
end

---@param shaftIndex any
---@return number
function TorpedoLauncher:getMaxTorpedoes(shaftIndex)
	return 0
end

---@param shaftIndex number
---@return number
function TorpedoLauncher:getNumTorpedoes(shaftIndex)
	return 0
end

---@return table<number, number>
function TorpedoLauncher:getShafts()
	return {0}
end

--- Accesses a torpedo in a specific shaft.
---@param torpedoIndex number @shaftIndex,
---@param shaftIndex number
---@return TorpedoTemplate @The torpedo, if found. nil otherwise.
function TorpedoLauncher:getTorpedo(torpedoIndex, shaftIndex)
	return TorpedoTemplate
end

---@param shaftIndex any
---@param torpedoIndex number
---@param newShaftIndex any
---@return any @nothing
function TorpedoLauncher:moveTorpedoToShaft(shaftIndex, torpedoIndex, newShaftIndex)
	return nil
end

---@param index number
---@param shaft any
---@return any @nothing
function TorpedoLauncher:removeTorpedo(index, shaft)
	return nil
end

