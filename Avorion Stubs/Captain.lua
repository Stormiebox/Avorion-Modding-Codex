---@class Captain
Captain = {

	displayName = "", -- [read-only] string
	experience = 0, -- int
	experiencePercentage = 0, -- [read-only] int
	factionIndex = 0, -- int
	genderId = 0, -- int
	hiringPrice = 0, -- [read-only] int
	level = 0, -- int
	name = "", -- string
	nickName = "", -- string
	primaryClass = 0, -- int
	requiredLevelUpExperience = 0, -- int
	salary = 0, -- int
	secondaryClass = 0, -- int
	tier = 0, -- int

}

---@return Captain
function Captain()
	return Captain
end

---@return table<number, number>
function Captain:getPerks()
	return {0}
end

---@param captainClass number
---@return boolean
function Captain:hasClass(captainClass)
	return true
end

---@param perk number
---@return boolean
function Captain:hasPerk(perk)
	return true
end

---@return any @nothing
function Captain:setPerks()
	return nil
end

