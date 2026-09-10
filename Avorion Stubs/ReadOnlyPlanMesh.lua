---@class ReadOnlyPlanMesh
ReadOnlyPlanMesh = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return ReadOnlyPlanMesh
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyPlanMesh(id)
	return ReadOnlyPlanMesh
end

