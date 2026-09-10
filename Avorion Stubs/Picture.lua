---@class Picture
Picture = {

	allianceIndex = 0, -- [write-only] int
	center = vec2, -- vec2
	color = Color, -- [write-only] Color
	flipped = true, -- [write-only] bool
	flippedX = true, -- [write-only] bool
	height = 0.0, -- float
	index = 0, -- [read-only] int
	isIcon = true, -- [write-only] bool
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	picture = "", -- [write-only] string
	position = vec2, -- vec2
	rect = Rect, -- Rect
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return Picture
---@param index number
function Picture(index)
	return Picture
end

---@param color Color
---@return any @nothing
function Picture:clear(color)
	return nil
end

---@param str string
---@param time any
---@return any @nothing
function Picture:fadeTo(str, time)
	return nil
end

---@return any @nothing
function Picture:fitIntoRect()
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function Picture:hide()
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function Picture:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function Picture:isMouseOverAndUnobscured()
	return true
end

--- Inherited from UIElement
---@return boolean
function Picture:isMouseOverAndUnobscured()
	return true
end

--- Inherited from UIElement
---@return any @nothing
function Picture:show()
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function Picture:show()
	return nil
end

