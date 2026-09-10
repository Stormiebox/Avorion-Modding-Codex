---@class Hangar
Hangar = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	freeSpace = 0.0, -- [read-only] float
	maxFighters = 0, -- [read-only] int
	maxSquads = 0, -- [read-only] int
	minFighters = 0, -- [read-only] int
	numFighters = 0, -- [read-only] unsigned
	numSquads = 0, -- [read-only] unsigned
	numSupportedSquads = 0, -- [read-only] unsigned
	occupiedSpace = 0.0, -- [read-only] float
	producing = true, -- [read-only] bool
	space = 0.0, -- [read-only] float

}

---@return Hangar
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function Hangar(id)
	return Hangar
end

---@param squad number
---@param fighter FighterTemplate
---@return any @nothing
function Hangar:addFighter(squad, fighter)
	return nil
end

---@param name string
---@return number
function Hangar:addSquad(name)
	return 0
end

---@param entity Entity
---@return boolean
function Hangar:canLand(entity)
	return true
end

---@return any @nothing
function Hangar:clear()
	return nil
end

---@param fighter FighterTemplate
---@param squadIndex number
---@return boolean
function Hangar:fighterTypeMatchesSquad(fighter, squadIndex)
	return true
end

---@param squadIndex number
---@return FighterTemplate
function Hangar:getBlueprint(squadIndex)
	return FighterTemplate
end

---@param squadIndex number
---@param fighterIndex number
---@return FighterTemplate
function Hangar:getFighter(squadIndex, fighterIndex)
	return FighterTemplate
end

---@return number
function Hangar:getFighterDPS()
	return 0.0
end

---@param squadIndex number
---@return Material
function Hangar:getHighestMaterialInSquadMainCategory(squadIndex)
	return Material
end

--- Returns a full squad. Caution: This function has to do a lot of copy operations and is slow.
---@param index number @The index of the squad to get
---@return Squad @A Squad object containing the squad, or nil if no squad with the given index exists
function Hangar:getSquad(index)
	return Squad
end

---@param squadIndex number
---@return number
function Hangar:getSquadDPS(squadIndex)
	return 0.0
end

---@param squadIndex number
---@return any
function Hangar:getSquadFighterType(squadIndex)
	return nil
end

---@param squadIndex number
---@return number
function Hangar:getSquadFighters(squadIndex)
	return 0
end

---@param squadIndex number
---@return number
function Hangar:getSquadFreeSlots(squadIndex)
	return 0
end

---@param squadIndex number
---@return boolean
function Hangar:getSquadHasRawMinersOrSalvagers(squadIndex)
	return true
end

--- Returns the weapon type that most fighters of this squad are equipped with. Use this to determine if an AI controlled ship can use this squad to mine or salvage. In case mulitple weapon types are equally present a random one is returned.
---@param squadIndex number
---@return any
function Hangar:getSquadMainWeaponCategory(squadIndex)
	return nil
end

---@param squadIndex number
---@return number
function Hangar:getSquadMaxFighters(squadIndex)
	return 0
end

---@param squadIndex number
---@return any
function Hangar:getSquadName(squadIndex)
	return nil
end

---@return table<number, number>
function Hangar:getSquads()
	return {0}
end

---@param squadIndex number
---@param fighterIndex number
---@param newSquadIndex number
---@return any @nothing
function Hangar:moveFighterToSquad(squadIndex, fighterIndex, newSquadIndex)
	return nil
end

---@param squadIndex number
---@param newSquadIndex number
---@return any @nothing
function Hangar:moveSquad(squadIndex, newSquadIndex)
	return nil
end

---@param index number
---@param squad number
---@return any @nothing
function Hangar:removeFighter(index, squad)
	return nil
end

---@param index number
---@return any @nothing
function Hangar:removeSquad(index)
	return nil
end

---@param squad number
---@param fighter nil | FighterTemplate
---@return any @nothing
function Hangar:setBlueprint(squad, fighter)
	return nil
end

--- Sets a full squad. Caution: This function has to do a lot of copy operations and is slow.
---@param index number @The index of the squad to set @A Squad object that should be set as the given squad
---@param squad Squad
---@return any @nothing
function Hangar:setSquad(index, squad)
	return nil
end

---@param index number
---@param newName string
---@return any @nothing
function Hangar:setSquadName(index, newName)
	return nil
end

