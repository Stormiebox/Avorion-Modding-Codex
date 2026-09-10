---@class SectorView
SectorView = {

	deathLocation = true, -- bool
	factionIndex = 0, -- int
	hasContent = true, -- [read-only] bool
	influence = 0.0, -- float
	manuallyTagged = true, -- bool
	name = "", -- string
	note = NamedFormat, -- NamedFormat
	numAsteroids = 0, -- int
	numShips = 0, -- int
	numStations = 0, -- int
	numWrecks = 0, -- int
	tagIconPath = "", -- string
	timeStamp = 0.0, -- double
	visited = true, -- [read-only] bool

}

---@return SectorView
function SectorView()
	return SectorView
end

---@param stations number
---@return number
function SectorView:calculateInfluence(stations)
	return 0.0
end

---@return number,number
function SectorView:getCoordinates()
	return 0,0
end

---@return table<number,number>
function SectorView:getCraftsByFaction()
	return {0,0}
end

---@return table<string,string>
function SectorView:getCustomEntries()
	return {"",""}
end

---@return table<number, ivec2>
function SectorView:getGateDestinations()
	return {ivec2}
end

---@return table<number,number>
function SectorView:getShipsByFaction()
	return {0,0}
end

---@return table<number, NamedFormat>
function SectorView:getStationTitles()
	return {NamedFormat}
end

---@return table<number,number>
function SectorView:getStationsByFaction()
	return {0,0}
end

---@return table<number, ivec2>
function SectorView:getWormHoleDestinations()
	return {ivec2}
end

---@param x number
---@param y number
---@return any @nothing
function SectorView:setCoordinates(x, y)
	return nil
end

---@param _in int_map_type
---@return any @nothing
function SectorView:setCraftsByFaction(_in)
	return nil
end

---@param key string
---@param line string
---@return any @nothing
function SectorView:setCustomEntry(key, line)
	return nil
end

---@return any @nothing
function SectorView:setGateDestinations()
	return nil
end

---@param _in int_map_type
---@return any @nothing
function SectorView:setShipsByFaction(_in)
	return nil
end

---@return any @nothing
function SectorView:setStationTitles()
	return nil
end

---@param _in int_map_type
---@return any @nothing
function SectorView:setStationsByFaction(_in)
	return nil
end

---@return any @nothing
function SectorView:setWormHoleDestinations()
	return nil
end

