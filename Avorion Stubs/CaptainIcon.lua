---@class CaptainIcon
CaptainIcon = {

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

---@return CaptainIcon
---@param index number
function CaptainIcon(index)
	return CaptainIcon
end

---@return Captain
function CaptainIcon:getCaptain()
	return Captain
end

--- Inherited from UIElement
---@return any @nothing
function CaptainIcon:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function CaptainIcon:isMouseOverAndUnobscured()
	return true
end

---@param captain nil | Captain
---@return any @nothing
function CaptainIcon:setCaptain(captain)
	return nil
end

---@param tooltip Tooltip
---@return any @nothing
function CaptainIcon:setCustomTooltip(tooltip)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function CaptainIcon:show()
	return nil
end

