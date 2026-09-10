---@class TargetIndicator
TargetIndicator = {

	color = Color, -- Color
	onScreen = true, -- bool
	position = vec2, -- vec2
	rect = Rect, -- [read-only] Rect
	relationStatus = RelationStatus.War, -- RelationStatus
	size = 0, -- int
	visible = true, -- bool
	visuals = TargetIndicatorVisuals.Default, -- TargetIndicator::Visuals

}

---@return TargetIndicator
---@param entity Entity
function TargetIndicator(entity)
	return TargetIndicator
end

