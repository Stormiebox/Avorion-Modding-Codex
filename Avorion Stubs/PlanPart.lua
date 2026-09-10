---@class PlanPart
PlanPart = {

	allrounders = 0, -- int
	features = 0, -- int
	numBlocks = 0, -- [read-only] int
	othersPaddingBox = Box, -- Box
	paddingBox = Box, -- [write-only] Box
	selfPaddingBox = Box, -- Box
	symmetries = nil, -- var
	transformationFeatures = TransformationFeature.SingleRotationX, -- TransformationFeature

}

---@return PlanPart
function PlanPart()
	return PlanPart
end

--- Adds a new block to the part.
---@param parentIndex number @The index of the block this one is attached to
---@param directionOrPosition any @Direction the block is attached in. Can be a vec3 or a direction. A position must be passed as a vec3 and will be clamped so the new block and parent block touch each other. A direction can be passed as a string ("x", "-x", "px", "nx", "+x" etc.), an ivec3, or an int (-x = 0, +x = 1, -y = 2, +y = 3, -z = 4, +z = 5)
---@param blockType number @The BlockType of the new block
---@param size nil | vec3 @The size of the new block. If nil, the size of the parent will be used
---@param color any @The color of the new block. Can be passed as a Color type, a table with HSV values {h=1, s=1, v=1}, a table with RGB values {r=1, g=1, b=1}, a vec4 (will be interpreted as RGBA), a vec3 (will be interpreted as RGB), or as a number (will be interpreted as a hex int). If nil, color of the parent block will be used.
---@param orientation nil | Matrix @A matrix containing the orientation of the block. If nil, the identity matrix will be used.
---@return number @The index of the new block
function PlanPart:block(parentIndex, directionOrPosition, blockType, size, color, orientation)
	return 0
end

--- Adds a new connector to the part. Connectors are used to attach parts during the generation process. Connectors are always in the middle of a block. No 2 connectors in the same direction can exist on the same block.
---@param blockIndex number @The index of the block the connector is attached to
---@param direction any @Direction of the connector. A direction can be passed as a string ("x", "-x", "px", "nx", "+x" etc.), an ivec3, or an int (-x = 0, +x = 1, -y = 2, +y = 3, -z = 4, +z = 5)
---@param flags table_t @Optional table with flags: {mirror = "x", repeatable = true, featureWhitelist = {...}, featureBlacklist = {...}, out = true, in = true}    flags.mirror: Direction that connector should mirror in. All subsequent parts added to this connector will have the same mirror direction.  flags.out: Counterpart to "inOnly". Mutually exclusive. Connector is only used when the part was already attached to the plan. It cannot be used to attach the part itself to the plan.  flags.inOnly: Counterpart to "out". Mutually exclusive. Connector is only used to attach the part to the plan. It cannot be used to other, subsequent parts to this part.  flags.repeatable: Allows the part to repeat itself at this connector. See PlanGenerationStage docs for more details.  flags.featureWhitelist: An array-style table containing features. Only parts with the herein defined features can be added to this connector.  flags.featureBlacklist: An array-style table containing features. Only parts without the herein defined features can be added to this connector.
---@return any @nothing
function PlanPart:connector(blockIndex, direction, flags)
	return nil
end

--- Erases a block or connector
---@param blockIndex number @The index of the block
---@param direction any @Optional. If set, tries to erase a connector from the block into the direction. If nil, the block is erased.
---@return any @nothing
function PlanPart:erase(blockIndex, direction)
	return nil
end

--- Finds a block.
---@param index number @The index of the block
---@return BlockPlanBlock @BlockPlanBlock The block, or nil if not found
function PlanPart:getBlock(index)
	return BlockPlanBlock
end

--- Gathers all blocks of certain types.
---@param types table<number, number> @The types of the blocks
---@return table<number, number> @A table containing the found blocks.
function PlanPart:getBlocks(types)
	return {0}
end

---@return table<number, table_t> @Returns a table with all connectors of the part
function PlanPart:getConnectors()
	return {table_t}
end

--- returns the internal plan of the part
---@return BlockPlan
function PlanPart:getPlan()
	return BlockPlan
end

--- Merges blocks, similar to the building mode command.
---@param blocks table<number, number> @An array-style table containing all block indices that are to be merged
---@return table<number, number> @multiple return values: All block indices that remain of the blocks passed into the function
function PlanPart:merge(blocks)
	return {0}
end

--- Mirrors the entire part along an axis.
---@param axis any @Direction around which axis the part should be rotated. A direction can be passed as a string ("x", "-x", "px", "nx", "+x" etc.), an ivec3, or an int (-x = 0, +x = 1, -y = 2, +y = 3, -z = 4, +z = 5)
---@return any @nothing
function PlanPart:mirror(axis)
	return nil
end

--- Resizes a block
---@param blockIndex number @The index of the modified block @The x scale factor
---@param x any
---@param y any @The y scale factor
---@param z any @The z scale factor
---@return any @nothing
function PlanPart:resize(blockIndex, x, y, z)
	return nil
end

--- Rotates the entire part around an axis X times by 90 degrees.
---@param axis any @Direction around which axis the part should be rotated. A direction can be passed as a string ("x", "-x", "px", "nx", "+x" etc.), an ivec3, or an int (-x = 0, +x = 1, -y = 2, +y = 3, -z = 4, +z = 5)
---@param times number @The amount of times the part should be rotated. Can be -2, -1, 1, 2
---@return any @nothing
function PlanPart:rotate(axis, times)
	return nil
end

--- Scales the entire part.
---@param factor vec3 @vec3 containing the scale factors
---@return any @nothing
function PlanPart:scale(factor)
	return nil
end

--- Sets the flags of a connector. Note: internally calls erase() and then connector()
---@param blockIndex number @The index of the block the connector is coming from
---@param direction any @The direction of the connector
---@param flags table_t @The new flags of the connector. See connector() function for details on those
---@return any @nothing
function PlanPart:setConnectorFlags(blockIndex, direction, flags)
	return nil
end

--- Sets the entire plan of the part.
---@param plan BlockPlan @The used plan
---@return any @nothing
function PlanPart:setPlan(plan)
	return nil
end

--- Changes some properties of the given block.
---@param blockIndex number @The index of the block
---@param flags table_t @Flags table containing the changes of the block. If nil, this property of the part isn't changed: {type = BlockType.Hull, lower = vec3(...), upper = vec3(...), position = vec3(...), size = vec3(...), color = ..., orientation = Matrix()}   flags.type: The new type of the part  flags.lower, flags.upper: vec3s containing the new lower, upper dimensions of the block. Do not use together with position, size  flags.position, flags.size: vec3s containing the new position, size dimensions of the block. Do not use together with lower, upper  flags.color: The new color of the block. See block() for details on how to pass colors  flags.orientation: Matrix containing the new orientation of the block
---@return any @nothing
function PlanPart:transform(blockIndex, flags)
	return nil
end

