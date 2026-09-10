---@class ReadOnlyCrew
ReadOnlyCrew = {

	attackers = 0, -- [read-only] int
	autoAssignCrew = 0, -- [read-only] int
	engineers = 0, -- [read-only] int
	gunners = 0, -- [read-only] int
	maxSize = 0, -- [read-only] int
	mechanics = 0, -- [read-only] int
	miners = 0, -- [read-only] int
	pilots = 0, -- [read-only] int
	security = 0, -- [read-only] int
	size = 0, -- [read-only] int
	unemployed = 0, -- [read-only] int

}

---@return ReadOnlyCrew
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyCrew(id)
	return ReadOnlyCrew
end

---@param number number
---@param profession number
---@param change number
---@return any,any,table<number,string>
function ReadOnlyCrew:canAddCrew(number, profession, change)
	return nil,nil,{0,""}
end

---@param passenger any
---@return any,any,table<number,string>
function ReadOnlyCrew:canAddPassenger(passenger)
	return nil,nil,{0,""}
end

---@return Captain
function ReadOnlyCrew:getCaptain()
	return Captain
end

---@return table<CrewMan,number>
function ReadOnlyCrew:getMembers()
	return {CrewMan,0}
end

---@param profession number
---@return number
function ReadOnlyCrew:getMembersByProfession(profession)
	return 0
end

---@param crewman CrewMan
---@return number
function ReadOnlyCrew:getNumMembers(crewman)
	return 0
end

---@return table<number, Captain>
function ReadOnlyCrew:getPassengers()
	return {Captain}
end

---@return table<CrewProfession,number>
function ReadOnlyCrew:getWorkforce()
	return {CrewProfession,0.0}
end

---@return boolean
function ReadOnlyCrew:hasCaptain()
	return true
end

