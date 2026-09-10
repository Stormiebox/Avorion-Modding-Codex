---@class Squad
Squad = {

	index = 0, -- [read-only] unsigned
	name = "", -- string

}

---@return Squad
function Squad()
	return Squad
end

---@return FighterTemplate
function Squad:getBlueprint()
	return FighterTemplate
end

---@return table<number, FighterTemplate>
function Squad:getFighters()
	return {FighterTemplate}
end

