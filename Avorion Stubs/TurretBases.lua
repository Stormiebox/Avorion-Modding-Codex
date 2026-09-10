---@class TurretBases
TurretBases = {
}

---@return TurretBases
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function TurretBases(id)
	return TurretBases
end

--- Returns a table with all turret designs. This table stores the turret base block index as a key and the design as its value.
---@return table<number,TurretDesign>
function TurretBases:getDesigns()
	return {0,TurretDesign}
end

---@param index any
---@param design TurretDesign
---@return any @nothing
function TurretBases:setDesign(index, design)
	return nil
end

---@param designs table_t
---@return any @nothing
function TurretBases:setDesigns(designs)
	return nil
end

