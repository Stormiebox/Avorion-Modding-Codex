---@class UIRenderer
UIRenderer = {
}

---@return UIRenderer
function UIRenderer()
	return UIRenderer
end

---@param entity Entity
---@return vec2,number
function UIRenderer:calculateEntityTargeter(entity)
	return vec2,0
end

---@return any @nothing
function UIRenderer:display()
	return nil
end

---@param entity Entity
---@return Color
function UIRenderer:getEntityTargeterColor(entity)
	return Color
end

---@param pointedAt vec2
---@param color Color
---@param layer number
---@return any @nothing
function UIRenderer:renderArrow(pointedAt, color, layer)
	return nil
end

---@param lower vec2
---@param upper vec2
---@param color Color
---@param layer number
---@return any @nothing
function UIRenderer:renderBorder(lower, upper, color, layer)
	return nil
end

---@param position vec2
---@param color Color
---@param icon string
---@param uvScale nil | vec2
---@param layer any
---@return any @nothing
function UIRenderer:renderCenteredPixelIcon(position, color, icon, uvScale, layer)
	return nil
end

---@param pointedAt vec2
---@param width number
---@param length number
---@param visibilityThreshold number
---@param color Color
---@param layer number
---@return any @nothing
function UIRenderer:renderCentralArrow(pointedAt, width, length, visibilityThreshold, color, layer)
	return nil
end

---@param position vec2
---@param action number
---@param text string
---@param layer any
---@return any @nothing
function UIRenderer:renderControls(position, action, text, layer)
	return nil
end

---@param entity Entity
---@param width number
---@param length number
---@param visibilityThreshold number
---@param color Color
---@param distanceFromCenter any
---@param layer any
---@return any @nothing
function UIRenderer:renderEntityArrow(entity, width, length, visibilityThreshold, color, distanceFromCenter, layer)
	return nil
end

---@param entity Entity
---@param color Color
---@param size any
---@param layer any
---@return any @nothing
function UIRenderer:renderEntityTargeter(entity, color, size, layer)
	return nil
end

---@param lower vec2
---@param upper vec2
---@param color Color
---@param icon string
---@param uvScale nil | vec2
---@param layer any
---@return any @nothing
function UIRenderer:renderIcon(lower, upper, color, icon, uvScale, layer)
	return nil
end

---@param a vec2
---@param b vec2
---@param color Color
---@param layer number
---@return any @nothing
function UIRenderer:renderLine(a, b, color, layer)
	return nil
end

---@param a vec2
---@param b vec2
---@param d1 number
---@param d2 number
---@param d3 number
---@param d4 number
---@param color Color
---@param layer number
---@return any @nothing
function UIRenderer:renderOutlinedLine(a, b, d1, d2, d3, d4, color, layer)
	return nil
end

---@param topLeft vec2
---@param color Color
---@param icon string
---@param uvScale nil | vec2
---@param layer any
---@return any @nothing
function UIRenderer:renderPixelIcon(topLeft, color, icon, uvScale, layer)
	return nil
end

---@param lower vec2
---@param upper vec2
---@param color Color
---@param layer number
---@return any @nothing
function UIRenderer:renderRect(lower, upper, color, layer)
	return nil
end

---@param pos vec2
---@param size number
---@param color Color
---@param layer number
---@return any @nothing
function UIRenderer:renderTargeter(pos, size, color, layer)
	return nil
end

