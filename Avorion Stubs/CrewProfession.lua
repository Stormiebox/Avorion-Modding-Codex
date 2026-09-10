---@class CrewProfession
CrewProfession = {

	assignable = true, -- [read-only] bool
	color = Color, -- [read-only] Color
	description = "", -- [read-only] string
	icon = "", -- [read-only] string
	price = 0, -- [read-only] unsigned
	salary = 0, -- [read-only] unsigned
	value = 0, -- int

}

---@return CrewProfession
---@param value number
function CrewProfession(value)
	return CrewProfession
end

---@param other CrewProfession
---@return boolean
function CrewProfession:__eq(other)
	return true
end

---@param amount any
---@return string
function CrewProfession:name(amount)
	return ""
end

