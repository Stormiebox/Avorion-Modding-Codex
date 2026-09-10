---@class TooltipRenderer
TooltipRenderer = {

	size = vec2, -- [read-only] vec2

}

---@return TooltipRenderer
---@param tooltip Tooltip
function TooltipRenderer(tooltip)
	return TooltipRenderer
end

---@return any @nothing
function TooltipRenderer:draw(vec2)
	return nil
end

---@return any @nothing
function TooltipRenderer:drawMouseTooltip(vec2)
	return nil
end

