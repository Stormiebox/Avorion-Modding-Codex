---@class CrewComponent
CrewComponent = {

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

---@return CrewComponent
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function CrewComponent(id)
	return CrewComponent
end

---@param amount number
---@param crewman CrewMan
---@return any @nothing
function CrewComponent:add(amount, crewman)
	return nil
end

---@param captain Captain
---@return any @nothing
function CrewComponent:addPassenger(captain)
	return nil
end

---@param plan nil | BlockPlan
---@return Crew
function CrewComponent:buildIdealCrew(plan)
	return Crew
end

---@param number number
---@param profession number
---@param change number
---@return any,any,table<number,string>
function CrewComponent:canAddCrew(number, profession, change)
	return nil,nil,{0,""}
end

---@param passenger any
---@return any,any,table<number,string>
function CrewComponent:canAddPassenger(passenger)
	return nil,nil,{0,""}
end

---@param amount number
---@param profession number
---@return any @nothing
function CrewComponent:changeEmployment(amount, profession)
	return nil
end

---@return any @nothing
function CrewComponent:clear()
	return nil
end

---@return any @nothing
function CrewComponent:clearPassengers()
	return nil
end

---@return Captain
function CrewComponent:getCaptain()
	return Captain
end

---@return table<CrewMan,number>
function CrewComponent:getMembers()
	return {CrewMan,0}
end

---@param profession number
---@return number
function CrewComponent:getMembersByProfession(profession)
	return 0
end

---@param crewman CrewMan
---@return number
function CrewComponent:getNumMembers(crewman)
	return 0
end

---@return table<number, Captain>
function CrewComponent:getPassengers()
	return {Captain}
end

---@return table<CrewProfession,number>
function CrewComponent:getWorkforce()
	return {CrewProfession,0.0}
end

---@return boolean
function CrewComponent:hasCaptain()
	return true
end

---@param num number
---@return any @nothing
function CrewComponent:kill(num)
	return nil
end

---@param amount number
---@param crewman CrewMan
---@return any @nothing
function CrewComponent:remove(amount, crewman)
	return nil
end

---@param amount number
---@param crewProfessionType number
---@return any @nothing
function CrewComponent:removeByProfession(amount, crewProfessionType)
	return nil
end

---@param index number
---@return any @nothing
function CrewComponent:removePassenger(index)
	return nil
end

---@param captain nil | Captain
---@return any @nothing
function CrewComponent:setCaptain(captain)
	return nil
end

