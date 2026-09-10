---@class GalaxyMap
GalaxyMap = {

	showAllianceInfo = true, -- bool
	showBackgroundShipAreas = true, -- bool
	showCustomColorLayer = true, -- bool
	showFactionLayer = true, -- bool
	showGates = true, -- bool
	showNotes = true, -- bool
	showWormholes = true, -- bool
	visible = true, -- [read-only] bool

}

---@return GalaxyMap
function GalaxyMap()
	return GalaxyMap
end

---@return any @nothing
function GalaxyMap:clearCustomColors()
	return nil
end

---@return UIContainer
function GalaxyMap:createContainer()
	return UIContainer
end

---@param rect Rect
---@return Window
function GalaxyMap:createWindow(rect)
	return Window
end

---@param coordinates vec2
---@return number,number
function GalaxyMap:getCoordinatesAtScreenPosition(coordinates)
	return 0,0
end

---@param coordinates ivec2
---@return number,number
function GalaxyMap:getCoordinatesScreenPosition(coordinates)
	return 0.0,0.0
end

---@return number,number
function GalaxyMap:getHoveredCoordinates()
	return 0,0
end

---@return number,number
function GalaxyMap:getSelectedCoordinates()
	return 0,0
end

---@return number,number
function GalaxyMap:getSelectedCoordinatesScreenPosition()
	return 0.0,0.0
end

---@return any @nothing
function GalaxyMap:hide()
	return nil
end

---@param x number
---@param y number
---@return any @nothing
function GalaxyMap:lookAt(x, y)
	return nil
end

---@param x number
---@param y number
---@return any @nothing
function GalaxyMap:lookAtSmooth(x, y)
	return nil
end

---@param key any
---@return any @nothing
function GalaxyMap:removeHighlightedArea(key)
	return nil
end

---@return any @nothing
function GalaxyMap:resetHighlightedAreas()
	return nil
end

---@return any @nothing
function GalaxyMap:resetJumpRangeArea()
	return nil
end

---@return any @nothing
function GalaxyMap:setCustomColors()
	return nil
end

---@param lower vec2
---@param upper vec2
---@param color any
---@param key any
---@return any @nothing
function GalaxyMap:setHighlightedArea(lower, upper, color, key)
	return nil
end

---@param areaIn table_t
---@param key any
---@return any @nothing
function GalaxyMap:setHighlightedSectors(areaIn, key)
	return nil
end

---@param center ivec2
---@param radius number
---@param canPassBlocked boolean
---@param includeGateConnections any
---@return any @nothing
function GalaxyMap:setJumpRangeArea(center, radius, canPassBlocked, includeGateConnections)
	return nil
end

---@param x number
---@param y number
---@return any @nothing
function GalaxyMap:setSelectedCoordinates(x, y)
	return nil
end

---@param x number
---@param y number
---@return any @nothing
function GalaxyMap:show(x, y)
	return nil
end

