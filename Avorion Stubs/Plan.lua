---@class Plan
Plan = {

	accumulatingHealth = true, -- bool
	boundingBox = Box, -- [read-only] Box
	boundingSphere = Sphere, -- [read-only] Sphere
	centerOfMass = vec3, -- [read-only] vec3
	convex = true, -- bool
	durability = 0.0, -- [read-only] double
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	numBlocks = 0, -- [read-only] int
	radius = 0.0, -- [read-only] float
	root = BlockPlanBlock, -- [read-only] BlockPlanBlock
	rootIndex = nil, -- [read-only] var
	size = 0, -- [read-only] int
	volume = 0.0, -- [read-only] float

}

---@return Plan
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function Plan(id)
	return Plan
end

--- Add a new block to an existing plan.
---@param position vec3 @The position of the new
---@param size vec3 @The size of the new block
---@param parentIndex number @The parent index of the block the new block will be attached to. This parameter will be ignored when there are no blocks in the plan. @The index of the new block. Use -1 to assign an index automatically (recommended)
---@param index number
---@param color Color @The color of the new block
---@param material Material @The material of the new block
---@param orientation Matrix @The orientation of the new block
---@param blockIndex number @The type of the new block, must be a valid block type. See enum BlockType
---@return number @Returns the index of the new block on success, nil otherwise.
function Plan:addBlock(position, size, parentIndex, index, color, material, orientation, blockIndex)
	return 0
end

---@param parentIndex number
---@param other BlockPlan
---@param otherBlock number
---@return number
function Plan:addPlan(parentIndex, other, otherBlock)
	return 0
end

---@param parentIndex number
---@param other BlockPlan
---@param otherBlock number
---@param delta vec3
---@return number
function Plan:addPlanDisplaced(parentIndex, other, otherBlock, delta)
	return 0
end

---@param damage number
---@param block number
---@param location vec3
---@param inflictingEntity Uuid
---@param damageSource any
---@param damageType any
---@return any @nothing
function Plan:damage(damage, block, location, inflictingEntity, damageSource, damageType)
	return nil
end

---@param index number
---@return any @nothing
function Plan:deleteSubTree(index)
	return nil
end

---@return any @nothing
function Plan:destroy()
	return nil
end

---@return boolean
function Plan:empty()
	return true
end

---@param index number
---@return boolean
function Plan:exists(index)
	return true
end

--- Returns the plan of the entity. This copies the entire plan, keep that in mind when using plans with large block counts.
---@return BlockPlan @A copy of the plan of the entity
function Plan:get()
	return BlockPlan
end

---@param index number
---@return BlockPlanBlock
function Plan:getBlock(index)
	return BlockPlanBlock
end

---@return table<number, number>
function Plan:getBlockIndices()
	return {0}
end

---@param index number
---@return table<number, number>
function Plan:getBlocksByType(index)
	return {0}
end

---@return number
function Plan:getMoneyValue()
	return 0.0
end

--- Returns the plan of the entity. This function will move the plan out of the entity, and replace the entity's plan with a single block. This operation is independent of the size of the plan, use it when you have to get large plans with lots of blocks.
---@return BlockPlan @The plan of the entity
function Plan:getMove()
	return BlockPlan
end

---@param n number
---@return BlockPlanBlock
function Plan:getNthBlock(n)
	return BlockPlanBlock
end

---@param n number
---@return any
function Plan:getNthIndex(n)
	return nil
end

---@param blockIndex number
---@return number
function Plan:getNumBlocks(blockIndex)
	return 0
end

---@param index number
---@return table<number, number>
function Plan:getRemoved(index)
	return {0}
end

---@return table<number, number>
function Plan:getResourceValue()
	return {0.0}
end

---@return BlockStatistics
function Plan:getStats()
	return BlockStatistics
end

---@return number
function Plan:getUndamagedMoneyValue()
	return 0.0
end

---@return table<number, number>
function Plan:getUndamagedResourceValue()
	return {0.0}
end

---@param damage number
---@param block number
---@param location vec3
---@param inflictingEntity Uuid
---@return any @nothing
function Plan:heal(damage, block, location, inflictingEntity)
	return nil
end

--- Set the new plan of the entity. The entity will get deleted if the plan is empty. This moves all the data out of the plan that is used as the first argument. The content of the plan given as argument is then undefined, but still valid. It might be empty, it might contain the previous plan. This operation is independent of the size of the plan, use it when you have to set large plans with lots of blocks.
---@param plan BlockPlan @The new BlockPlan of the entity
---@return any @nothing
function Plan:move(plan)
	return nil
end

---@param index number
---@return any @nothing
function Plan:removeBlock(index)
	return nil
end

--- Set the new plan of the entity. The entity will get deleted if the plan is empty. This copies the entire plan that is given as argument, keep that in mind when setting plans with large block counts.
---@param plan BlockPlan @The new BlockPlan of the entity
---@return any @nothing
function Plan:set(plan)
	return nil
end

---@param index number
---@param color Color
---@return any @nothing
function Plan:setBlockColor(index, color)
	return nil
end

---@param blockIndex number
---@param factor number
---@return any @nothing
function Plan:setBlockDamageFactor(blockIndex, factor)
	return nil
end

---@param index number
---@param type number
---@return any @nothing
function Plan:setBlockType(index, type)
	return nil
end

---@param blockType number
---@param factor number
---@return any @nothing
function Plan:setBlockTypeDamageFactor(blockType, factor)
	return nil
end

---@param color Color
---@return any @nothing
function Plan:setColor(color)
	return nil
end

---@param material Material
---@return any @nothing
function Plan:setMaterial(material)
	return nil
end

