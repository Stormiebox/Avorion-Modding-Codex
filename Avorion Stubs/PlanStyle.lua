---@class PlanStyle
PlanStyle = {

	additionalFeatures = 0, -- int
	balanceForShip = true, -- bool
	forbiddenFeatures = 0, -- int
	name = "", -- string
	requiredFeatures = 0, -- int
	scaleRecommendation = true, -- bool
	seed = "", -- string
	settings = nil, -- var

}

---@return PlanStyle
function PlanStyle()
	return PlanStyle
end

--- Adds a new stage to the style.
---@param stage PlanGenerationStage
---@return any @nothing
function PlanStyle:addStage(stage)
	return nil
end

--- Removes all stages from the style.
---@return any @nothing
function PlanStyle:clearStages()
	return nil
end

--- Initializes the style. This selects which parts will be used, based on the seed, making the style deterministic. This should be the last operation on a style. Style should not be modified after this. Doing so results in undefined behavior.
---@return any @nothing
function PlanStyle:initialize()
	return nil
end

--- Replaces a stage in the style.
---@param index number
---@param stage PlanGenerationStage
---@return any @nothing
function PlanStyle:setStage(index, stage)
	return nil
end

