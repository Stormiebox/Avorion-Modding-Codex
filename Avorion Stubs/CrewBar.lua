---@class CrewBar
CrewBar = {

	center = vec2, -- vec2
	height = 0.0, -- float
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	position = vec2, -- vec2
	rect = Rect, -- Rect
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	visiblePerCategory = 0, -- [write-only] int
	width = 0.0, -- float

}

---@return CrewBar
---@param index number
function CrewBar(index)
	return CrewBar
end

---@return any @nothing
function CrewBar:clear()
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function CrewBar:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function CrewBar:isMouseOverAndUnobscured()
	return true
end

---@param crewman CrewMan
---@param amount number
---@return any @nothing
function CrewBar:setCrewmen(crewman, amount)
	return nil
end

---@param crew Crew
---@param profession CrewProfession
---@param level any
---@return any @nothing
function CrewBar:setDisplayedCrew(crew, profession, level)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function CrewBar:show()
	return nil
end

