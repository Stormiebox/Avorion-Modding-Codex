---@class PlanMesh
PlanMesh = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return PlanMesh
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function PlanMesh(id)
	return PlanMesh
end

---@param shading number
---@param material number
---@return any @nothing
function PlanMesh:disableMesh(shading, material)
	return nil
end

---@return any @nothing
function PlanMesh:enableAll()
	return nil
end

---@param shading number
---@param material number
---@return any @nothing
function PlanMesh:enableMesh(shading, material)
	return nil
end

