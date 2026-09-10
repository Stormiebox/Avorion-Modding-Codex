---@class Slider
Slider = {

	active = true, -- bool
	caption = "", -- [write-only] string
	center = vec2, -- vec2
	color = nil, -- [write-only] var
	description = "", -- [write-only] string
	glowColor = nil, -- [write-only] var
	height = 0.0, -- float
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	max = 0.0, -- float
	min = 0.0, -- float
	mouseOver = true, -- [read-only] bool
	onChangedFunction = "", -- string
	onMouseUpChangedFunction = "", -- string
	position = vec2, -- vec2
	rect = Rect, -- Rect
	segments = 0, -- [write-only] unsigned
	showCaption = true, -- [write-only] bool
	showDescription = true, -- [write-only] bool
	showMaxValue = true, -- [write-only] bool
	showScale = true, -- [write-only] bool
	showValue = true, -- [write-only] bool
	size = vec2, -- vec2
	sliderPosition = 0.0, -- float
	stepSize = 0.0, -- [write-only] float
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	unit = "", -- [write-only] string
	upper = vec2, -- vec2
	value = 0.0, -- float
	visible = true, -- bool
	width = 0.0, -- float

}

---@return Slider
---@param index number
function Slider(index)
	return Slider
end

--- Inherited from UIElement
---@return any @nothing
function Slider:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function Slider:isMouseOverAndUnobscured()
	return true
end

---@param _in number
---@return any @nothing
function Slider:setMaxNoCallback(_in)
	return nil
end

---@param _in number
---@return any @nothing
function Slider:setMinNoCallback(_in)
	return nil
end

---@param _in number
---@return any @nothing
function Slider:setNumSegmentsNoCallback(_in)
	return nil
end

---@param inFrom number
---@param inTo number
---@return any @nothing
function Slider:setRatio(inFrom, inTo)
	return nil
end

---@param _in number
---@return any @nothing
function Slider:setSliderPositionNoCallback(_in)
	return nil
end

---@param _in number
---@return any @nothing
function Slider:setValueNoCallback(_in)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function Slider:show()
	return nil
end

