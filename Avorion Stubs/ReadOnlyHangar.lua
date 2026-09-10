---@class ReadOnlyHangar
ReadOnlyHangar = {

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

---@return ReadOnlyHangar
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyHangar(id)
	return ReadOnlyHangar
end

---@param entity Entity
---@return boolean
function ReadOnlyHangar:canLand(entity)
	return true
end

---@param fighter FighterTemplate
---@param squadIndex number
---@return boolean
function ReadOnlyHangar:fighterTypeMatchesSquad(fighter, squadIndex)
	return true
end

---@param squadIndex number
---@return FighterTemplate
function ReadOnlyHangar:getBlueprint(squadIndex)
	return FighterTemplate
end

---@param squadIndex number
---@param fighterIndex number
---@return FighterTemplate
function ReadOnlyHangar:getFighter(squadIndex, fighterIndex)
	return FighterTemplate
end

---@return number
function ReadOnlyHangar:getFighterDPS()
	return 0.0
end

---@param squadIndex number
---@return Material
function ReadOnlyHangar:getHighestMaterialInSquadMainCategory(squadIndex)
	return Material
end

--- Returns a full squad. Caution: This function has to do a lot of copy operations and is slow.
---@param index number @The index of the squad to get
---@return Squad @A Squad object containing the squad, or nil if no squad with the given index exists
function ReadOnlyHangar:getSquad(index)
	return Squad
end

---@param squadIndex number
---@return number
function ReadOnlyHangar:getSquadDPS(squadIndex)
	return 0.0
end

---@param squadIndex number
---@return any
function ReadOnlyHangar:getSquadFighterType(squadIndex)
	return nil
end

---@param squadIndex number
---@return number
function ReadOnlyHangar:getSquadFighters(squadIndex)
	return 0
end

---@param squadIndex number
---@return number
function ReadOnlyHangar:getSquadFreeSlots(squadIndex)
	return 0
end

---@param squadIndex number
---@return boolean
function ReadOnlyHangar:getSquadHasRawMinersOrSalvagers(squadIndex)
	return true
end

--- Returns the weapon type that most fighters of this squad are equipped with. Use this to determine if an AI controlled ship can use this squad to mine or salvage. In case mulitple weapon types are equally present a random one is returned.
---@param squadIndex number
---@return any
function ReadOnlyHangar:getSquadMainWeaponCategory(squadIndex)
	return nil
end

---@param squadIndex number
---@return number
function ReadOnlyHangar:getSquadMaxFighters(squadIndex)
	return 0
end

---@param squadIndex number
---@return any
function ReadOnlyHangar:getSquadName(squadIndex)
	return nil
end

---@return table<number, number>
function ReadOnlyHangar:getSquads()
	return {0}
end

