---@class Crew
Crew = {

	attackers = 0, -- [read-only] int
	autoAssignCrew = 0, -- [read-only] int
	engineers = 0, -- [read-only] int
	gunners = 0, -- [read-only] int
	maxSize = 0, -- unsigned
	mechanics = 0, -- [read-only] int
	miners = 0, -- [read-only] int
	pilots = 0, -- [read-only] int
	security = 0, -- [read-only] int
	size = 0, -- [read-only] unsigned
	unemployed = 0, -- [read-only] int

}

---@return Crew
function Crew()
	return Crew
end

---@param amount number
---@param crewman CrewMan
---@return any @nothing
function Crew:add(amount, crewman)
	return nil
end

---@param captain Captain
---@return any @nothing
function Crew:addPassenger(captain)
	return nil
end

---@param plan nil | BlockPlan
---@return Crew
function Crew:buildIdealCrew(plan)
	return Crew
end

---@param plan nil | BlockPlan
---@return Crew
function Crew:buildMinimumCrew(plan)
	return Crew
end

---@param amount number
---@param profession number
---@return any @nothing
function Crew:changeEmployment(amount, profession)
	return nil
end

---@return any @nothing
function Crew:clear()
	return nil
end

---@return any @nothing
function Crew:clearPassengers()
	return nil
end

---@return Captain
function Crew:getCaptain()
	return Captain
end

---@return table<CrewMan,number>
function Crew:getMembers()
	return {CrewMan,0}
end

---@param profession number
---@return number
function Crew:getMembersByProfession(profession)
	return 0
end

---@param crewman CrewMan
---@return number
function Crew:getNumMembers(crewman)
	return 0
end

---@return table<number, Captain>
function Crew:getPassengers()
	return {Captain}
end

---@return table<CrewProfession,number>
function Crew:getWorkforce()
	return {CrewProfession,0.0}
end

---@return boolean
function Crew:hasCaptain()
	return true
end

---@param num number
---@return any @nothing
function Crew:kill(num)
	return nil
end

---@param amount number
---@param crewman CrewMan
---@return any @nothing
function Crew:remove(amount, crewman)
	return nil
end

---@param amount number
---@param crewProfessionType number
---@return any @nothing
function Crew:removeByProfession(amount, crewProfessionType)
	return nil
end

---@param index number
---@return any @nothing
function Crew:removePassenger(index)
	return nil
end

---@param captain nil | Captain
---@return any @nothing
function Crew:setCaptain(captain)
	return nil
end

