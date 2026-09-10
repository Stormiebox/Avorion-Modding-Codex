---@class ControlUnit
ControlUnit = {

	autoPilotEnabled = true, -- bool
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

---@return ControlUnit
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function ControlUnit(id)
	return ControlUnit
end

--- Adds a new seat.
---@return any @nothing
function ControlUnit:addSeat()
	return nil
end

--- Adds a new fighter squad for a given seat.
---@param seatIndex number @The index of the seat (0-9)
---@param fighterSquadIndex number @The index of the fighter squad (0-9)
---@return any @nothing
function ControlUnit:addSeatSquad(seatIndex, fighterSquadIndex)
	return nil
end

--- Adds a new weapon group for a given seat.
---@param seatIndex number @The index of the seat (0-9)
---@param weaponGroupIndex number @The index of the weapon group (0-9)
---@return any @nothing
function ControlUnit:addSeatWeaponGroup(seatIndex, weaponGroupIndex)
	return nil
end

--- Executes the button presses necessary to have the ship drift to the target location. Drifting to a location means using only thrusters and not the main engine. This function must be called every tick in order to work correctly.
---@param location vec3 @The target location to drift towards.
---@return any @nothing
function ControlUnit:driftToLocation(location)
	return nil
end

--- Executes the button presses necessary to have the ship turn and fly to the target location. This function must be called every tick in order to work correctly.
---@param location vec3 @The target location to fly towards
---@param velocityAtTarget number @The physical velocity that the ship should have when arriving at its destination. Use real velocity (m/s) here, not desired velocity (0% - 100%)
---@return any @nothing
function ControlUnit:flyToLocation(location, velocityAtTarget)
	return nil
end

--- Returns a list of bools representing the currently active weapon groups.
---@return bitset_10_
function ControlUnit:getActiveWeapons()
	return {0}
end

--- Returns the aimed position of a given seat.
---@param seatIndex number @The index of the seat
---@return vec3
function ControlUnit:getAimedPositionBySeat(seatIndex)
	return vec3
end

--- Returns the aimed position of the seat that controls the given weapon group.
---@param groupIndex number @The weapon group of the seat
---@return vec3
function ControlUnit:getAimedPositionByWeaponGroup(groupIndex)
	return vec3
end

--- Returns a list of aimed positions of all seats
---@return table<number, vec3>
function ControlUnit:getAimedPositions()
	return {vec3}
end

--- Returns a list of bitsets (represented as ints) of control actions of all seats.
---@return table<number, number>
function ControlUnit:getAllControlActions()
	return {0}
end

--- Returns the bitset of control actions of a given seat.
---@param seatIndex number @The index of the seat
---@return number
function ControlUnit:getControlActions(seatIndex)
	return 0
end

--- Returns the bitset of control actions of the seat that controls the given weapon group.
---@param groupIndex number @The weapon group of the seat
---@return number
function ControlUnit:getControlActionsByWeaponGroup(groupIndex)
	return 0
end

--- Returns the currently flown to location, which is set by calls to flyToLocation. Note: When the AI flies towards a location, it also sets this.
---@return vec3
function ControlUnit:getFlownToLocation()
	return vec3
end

--- Returns the seat that controls a particular weapon group.
---@param groupIndex number @The weapon group of the seat
---@return number
function ControlUnit:getSeatByWeaponGroup(groupIndex)
	return 0
end

--- Returns a list of seats of the control unit.
---@return table<number, ControlUnitSeat>
function ControlUnit:getSeats()
	return {ControlUnitSeat}
end

--- Returns the selected object of a given seat.
---@param seatIndex number @The index of the seat
---@return Entity
function ControlUnit:getSelectedObject(seatIndex)
	return Entity
end

--- Returns the id of the selected object of a given seat.
---@param seatIndex number @The index of the seat
---@return Uuid
function ControlUnit:getSelectedObjectId(seatIndex)
	return 0
end

--- Returns a list of selected target ids of all seats
---@return table<number, Uuid>
function ControlUnit:getSelectedObjectIds()
	return {0}
end

--- Checks if the given seat is currently pushing "Fire" (see ControlActionBit.Fire1)
---@param seat number
---@return boolean
function ControlUnit:isFiring(seat)
	return true
end

--- Checks if the given seat is currently pushing "Fire Torpedoes" (see ControlActionBit.Fire2)
---@param seat number
---@return boolean
function ControlUnit:isFiringTorpedoes(seat)
	return true
end

--- Checks if the given player is setting in any seat of the control unit.
---@param playerIndex number @The index of the player
---@return boolean
function ControlUnit:isPlayerAPilot(playerIndex)
	return true
end

--- Checks if the given player has the right to control the given fighter squad.
---@param playerIndex number @The index of the player
---@param squadIndex number @The index of the squad
---@return boolean
function ControlUnit:mayControlSquad(playerIndex, squadIndex)
	return true
end

--- Checks if the given player has the right to control the given weapon group.
---@param playerIndex number @The index of the player
---@param groupIndex number @The index of the weapon group
---@return boolean
function ControlUnit:mayControlWeaponGroup(playerIndex, groupIndex)
	return true
end

--- Checks if the given player has the right to pilot (steer) the ship. The player must be sitting in the pilot seat.
---@param playerIndex number @The index of the player
---@return boolean
function ControlUnit:maySteer(playerIndex)
	return true
end

--- Removes the given seat. Seat 0 can't be removed.
---@param seatIndex number @The seat index between 1 and the amount of seats minus 1
---@return any @nothing
function ControlUnit:removeSeat(seatIndex)
	return nil
end

--- Sets the current position that the non-independent turrets of the ship should aim at. This is, for example, what is set when the player aims.
---@param location vec3 @The location that the turrets should aim at
---@param seatIndex number @The seat that the position should be set for
---@return any @nothing
function ControlUnit:setAimedPosition(location, seatIndex)
	return nil
end

--- Sets the current control actions of the ship. A control action is basically a virtual button that is pressed on the control unit.
---@param mask number @A bitset of buttons that are pressed (see ControlActionBit)
---@param seatIndex number @The seat that the control actions should be set for
---@return any @nothing
function ControlUnit:setControlActions(mask, seatIndex)
	return nil
end

--- Sets the desired velocity of the ship. Desired velocity is measured from 0 (standstill) to 1 (maximum speed the ship can fly). The engine of the ship will accelerate normally until the desired velocity is reached. This will not influence boosting.
---@param desiredVelocity number @The desired velocity to use (0 to 1)
---@return any @nothing
function ControlUnit:setDesiredVelocity(desiredVelocity)
	return nil
end

--- Enables control actions of the ship. A control action is basically a virtual button that is pressed on the control unit. This function presses them (as in: pushes them down).
---@param mask number @A bitset of buttons that are pressed (see ControlActionBit)
---@param seatIndex number @The seat that the control actions should be set for
---@return any @nothing
function ControlUnit:setKeyDownMask(mask, seatIndex)
	return nil
end

--- Disables control actions of the ship. A control action is basically a virtual button that is pressed on the control unit. This function releases them.
---@param mask number @A bitset of buttons that are released (see ControlActionBit)
---@param seatIndex number @The seat that the control actions should be set for
---@return any @nothing
function ControlUnit:setKeyUpMask(mask, seatIndex)
	return nil
end

--- Sets the current position that the non-independent turrets of the ship should aim at. This is, for example, what is set when the player aims.
---@param location Uuid @The location that the turrets should aim at
---@param seatIndex number @The seat that the position should be set for
---@return any @nothing
function ControlUnit:setSelectedObjectId(location, seatIndex)
	return nil
end

--- Sets the current turning speed factor. The turning speed factor is a multiplier for the turning speed of a ship, used in flyToLocation(), to smoothen turning once the ship looks towards its target (to avoid jittering). It is set during flyToLocation(), so make sure to set it to (1, 1, 1) if you want to control the ship yourself.
---@param factor vec3 @A vec3 containing the turning speed multipliers for axis x, y, z
---@return any @nothing
function ControlUnit:setTurningSpeedFactor(factor)
	return nil
end

--- Releases all buttons and sets the ship's desired velocity to 0.
---@return any @nothing
function ControlUnit:stopShip()
	return nil
end

--- Releases all buttons but keeps the ship's desired velocity.
---@return any @nothing
function ControlUnit:stopSteering()
	return nil
end

