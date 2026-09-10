---@class TradingGood
TradingGood = {

	color = Color, -- [read-only] Color
	dangerous = true, -- bool
	description = "", -- string
	displayDescription = "", -- [read-only] string
	icon = "", -- string
	illegal = true, -- bool
	mesh = "", -- string
	name = "", -- string
	plural = "", -- string
	price = 0.0, -- float
	size = 0.0, -- float
	stolen = true, -- bool
	suspicious = true, -- bool
	tagDescription = "", -- [read-only] string
	tags = table_t, -- table_t

}

---@return TradingGood
---@param name string
---@param plural string
---@param description string
---@param icon string
---@param price number
---@param size number
function TradingGood(name, plural, description, icon, price, size)
	return TradingGood
end

---@param other TradingGood
---@return boolean
function TradingGood:__eq(other)
	return true
end

---@return string
function TradingGood:__tostring()
	return ""
end

---@param amount number
---@return string
function TradingGood:displayName(amount)
	return ""
end

---@param amount number
---@return PluralForm
function TradingGood:pluralForm(amount)
	return PluralForm
end

