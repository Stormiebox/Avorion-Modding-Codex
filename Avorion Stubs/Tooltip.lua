---@class Tooltip
Tooltip = {

	backgroundFadeColor = Color, -- Color
	borderColor = Color, -- Color
	icon = "", -- string
	price = 0.0, -- double
	rarity = Rarity, -- [write-only] Rarity

}

---@return Tooltip
function Tooltip()
	return Tooltip
end

---@param line TooltipLine
---@return any @nothing
function Tooltip:addLine(line)
	return nil
end

---@param line TooltipLine
---@return any @nothing
function Tooltip:addLineFront(line)
	return nil
end

---@return any @nothing
function Tooltip:clear()
	return nil
end

---@return table<number, string>
function Tooltip:getIcons()
	return {""}
end

---@param i number
---@return TooltipLine
function Tooltip:getLine(i)
	return TooltipLine
end

---@return table<number, TooltipLine>
function Tooltip:getLines()
	return {TooltipLine}
end

---@param i number
---@return any @nothing
function Tooltip:removeLine(i)
	return nil
end

---@return any @nothing
function Tooltip:setIcons()
	return nil
end

---@param i number
---@param line TooltipLine
---@return any @nothing
function Tooltip:setLine(i, line)
	return nil
end

