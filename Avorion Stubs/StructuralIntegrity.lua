---@class StructuralIntegrity
StructuralIntegrity = {
}

---@return StructuralIntegrity
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function StructuralIntegrity(id)
	return StructuralIntegrity
end

--- Returns the indices of the blocks that are protected by a integrity field
---@return table<number, number>
function StructuralIntegrity:getProtectedBlocks()
	return {0}
end

--- Returns whether the block at the index is protected by a integrity field
---@param index number @Index of the block
---@return boolean
function StructuralIntegrity:hasProtection(index)
	return true
end

