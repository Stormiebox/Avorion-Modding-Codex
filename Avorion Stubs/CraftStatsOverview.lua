---@class CraftStatsOverview
CraftStatsOverview = {

	includeCrew = true, -- bool
	includeEnergy = true, -- bool
	includeUpgrades = true, -- bool

}

---@return CraftStatsOverview
---@param entity nil | Entity
function CraftStatsOverview(entity)
	return CraftStatsOverview
end

---@param stat CraftStatsOverviewStat
---@return number
function CraftStatsOverview:getEfficiency(stat)
	return 0.0
end

---@param stat CraftStatsOverviewStat
---@return string
function CraftStatsOverview:getUnit(stat)
	return ""
end

---@param key CraftStatsOverviewStat
---@return any
function CraftStatsOverview:getValue(key)
	return nil
end

---@param stat CraftStatsOverviewStat
---@return boolean
function CraftStatsOverview:isBadValue(stat)
	return true
end

---@param stat CraftStatsOverviewStat
---@return boolean
function CraftStatsOverview:isDangerousValue(stat)
	return true
end

---@param stat CraftStatsOverviewStat
---@return boolean
function CraftStatsOverview:isRelevant(stat)
	return true
end

---@param crew boolean
---@param energy boolean
---@param upgrades boolean
---@return any @nothing
function CraftStatsOverview:setIncludeImpact(crew, energy, upgrades)
	return nil
end

---@param entity Entity
---@return any @nothing
function CraftStatsOverview:update(entity)
	return nil
end

