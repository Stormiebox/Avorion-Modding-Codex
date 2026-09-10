---@class ReadOnlyControlUnit
ReadOnlyControlUnit = {

	autoPilotEnabled = true, -- [read-only] bool
	desiredVelocity = 0.0, -- [read-only] float
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	hasPilot = true, -- [read-only] bool
	isBoosting = true, -- [read-only] bool
	isDrifting = true, -- [read-only] bool
	isStrafing = true, -- [read-only] bool
	isTurning = true, -- [read-only] bool
	numFreeSeats = 0, -- [read-only] int
	numOccupiedSeats = 0, -- [read-only] int
	turningSpeedFactor = vec3, -- [read-only] vec3

}

---@return ReadOnlyControlUnit
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyControlUnit(id)
	return ReadOnlyControlUnit
end

--- Returns a list of bools representing the currently active weapon groups.
---@return bitset_10_
function ReadOnlyControlUnit:getActiveWeapons()
	return {0}
end

--- Returns the aimed position of a given seat.
---@param seatIndex number @The index of the seat
---@return vec3
function ReadOnlyControlUnit:getAimedPositionBySeat(seatIndex)
	return vec3
end

--- Returns the aimed position of the seat that controls the given weapon group.
---@param groupIndex number @The weapon group of the seat
---@return vec3
function ReadOnlyControlUnit:getAimedPositionByWeaponGroup(groupIndex)
	return vec3
end

--- Returns a list of aimed positions of all seats
---@return table<number, vec3>
function ReadOnlyControlUnit:getAimedPositions()
	return {vec3}
end

--- Returns a list of bitsets (represented as ints) of control actions of all seats.
---@return table<number, number>
function ReadOnlyControlUnit:getAllControlActions()
	return {0}
end

--- Returns the bitset of control actions of a given seat.
---@param seatIndex number @The index of the seat
---@return number
function ReadOnlyControlUnit:getControlActions(seatIndex)
	return 0
end

--- Returns the bitset of control actions of the seat that controls the given weapon group.
---@param groupIndex number @The weapon group of the seat
---@return number
function ReadOnlyControlUnit:getControlActionsByWeaponGroup(groupIndex)
	return 0
end

--- Returns the currently flown to location, which is set by calls to flyToLocation. Note: When the AI flies towards a location, it also sets this.
---@return vec3
function ReadOnlyControlUnit:getFlownToLocation()
	return vec3
end

--- Returns the seat that controls a particular weapon group.
---@param groupIndex number @The weapon group of the seat
---@return number
function ReadOnlyControlUnit:getSeatByWeaponGroup(groupIndex)
	return 0
end

--- Returns a list of seats of the control unit.
---@return table<number, ControlUnitSeat>
function ReadOnlyControlUnit:getSeats()
	return {ControlUnitSeat}
end

--- Returns the selected object of a given seat.
---@param seatIndex number @The index of the seat
---@return Entity
function ReadOnlyControlUnit:getSelectedObject(seatIndex)
	return Entity
end

--- Returns the id of the selected object of a given seat.
---@param seatIndex number @The index of the seat
---@return Uuid
function ReadOnlyControlUnit:getSelectedObjectId(seatIndex)
	return 0
end

--- Returns a list of selected target ids of all seats
---@return table<number, Uuid>
function ReadOnlyControlUnit:getSelectedObjectIds()
	return {0}
end

--- Checks if the given seat is currently pushing "Fire" (see ControlActionBit.Fire1)
---@param seat number
---@return boolean
function ReadOnlyControlUnit:isFiring(seat)
	return true
end

--- Checks if the given seat is currently pushing "Fire Torpedoes" (see ControlActionBit.Fire2)
---@param seat number
---@return boolean
function ReadOnlyControlUnit:isFiringTorpedoes(seat)
	return true
end

--- Checks if the given player is setting in any seat of the control unit.
---@param playerIndex number @The index of the player
---@return boolean
function ReadOnlyControlUnit:isPlayerAPilot(playerIndex)
	return true
end

--- Checks if the given player has the right to control the given fighter squad.
---@param playerIndex number @The index of the player
---@param squadIndex number @The index of the squad
---@return boolean
function ReadOnlyControlUnit:mayControlSquad(playerIndex, squadIndex)
	return true
end

--- Checks if the given player has the right to control the given weapon group.
---@param playerIndex number @The index of the player
---@param groupIndex number @The index of the weapon group
---@return boolean
function ReadOnlyControlUnit:mayControlWeaponGroup(playerIndex, groupIndex)
	return true
end

--- Checks if the given player has the right to pilot (steer) the ship. The player must be sitting in the pilot seat.
---@param playerIndex number @The index of the player
---@return boolean
function ReadOnlyControlUnit:maySteer(playerIndex)
	return true
end

