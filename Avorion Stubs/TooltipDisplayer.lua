---@class TooltipDisplayer
TooltipDisplayer = {

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
	width = 0.0, -- float

}

---@return TooltipDisplayer
---@param index number
function TooltipDisplayer(index)
	return TooltipDisplayer
end

--- Inherited from UIElement
---@return any @nothing
function TooltipDisplayer:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function TooltipDisplayer:isMouseOverAndUnobscured()
	return true
end

---@param tooltip nil | Tooltip
---@return any @nothing
function TooltipDisplayer:setTooltip(tooltip)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function TooltipDisplayer:show()
	return nil
end

