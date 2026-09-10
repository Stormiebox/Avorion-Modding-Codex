---@class Line
Line = {

	center = vec2, -- vec2
	color = Color, -- [write-only] Color
	dynamic = true, -- bool
	from = vec2, -- vec2
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
	to = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return Line
---@param index number
function Line(index)
	return Line
end

--- Inherited from UIElement
---@return any @nothing
function Line:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function Line:isMouseOverAndUnobscured()
	return true
end

--- Inherited from UIElement
---@return any @nothing
function Line:show()
	return nil
end

