---@class Durability
Durability = {

	damageFactor = 0.0, -- double
	durability = 0.0, -- double
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	filledPercentage = 0.0, -- [read-only] float
	invincibility = 0.0, -- float
	invincible = true, -- bool
	logoutInvincible = true, -- [read-only] bool
	maxDurabilityFactor = 0.0, -- float
	maximum = 0.0, -- double
	respawnInvincibilityTime = 0.0, -- float
	respawnInvincible = true, -- [read-only] bool

}

---@return Durability
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function Durability(id)
	return Durability
end

--- Adds a temporary immunity to a faction. This immunity will be not be saved to database for security reasons. When an entity is immune to a faction, it can't be healed or damaged by shots or damage that can be traced back to that faction.
---@param index number @Index of the faction the immunity should apply to
---@return any @nothing
function Durability:addFactionImmunity(index)
	return nil
end

---@return any,any
function Durability:getWeakness()
	return nil,nil
end

---@param amount number
---@param inflictorId Uuid
---@return any @nothing
function Durability:healDamage(amount, inflictorId)
	return nil
end

---@param amount number
---@param damageSource DamageSource
---@param damageType DamageType
---@param inflictorId Uuid
---@return any @nothing
function Durability:inflictDamage(amount, damageSource, damageType, inflictorId)
	return nil
end

--- Checks if the Entity is immune to another entity. This is true if the other entity belongs to a faction that the When an entity is immune to a faction, it can't be healed or damaged by shots or damage that can be traced back to that faction.
---@param index Uuid @Index of the faction the immunity should apply to
---@return boolean
function Durability:isImmuneToEntity(index)
	return true
end

--- Checks if the Entity is immune to a faction.
---@param index number @Index of the faction
---@return boolean
function Durability:isImmuneToFaction(index)
	return true
end

--- Removes a temporary immunity to a faction. When an entity is immune to a faction, it can't be healed or damaged by shots or damage that can be traced back to that faction.
---@param index number @Index of the faction the immunity should apply to
---@return any @nothing
function Durability:removeFactionImmunity(index)
	return nil
end

---@return any @nothing
function Durability:resetMalus()
	return nil
end

---@return any @nothing
function Durability:resetWeakness()
	return nil
end

---@param _in number
---@param reason DurabilityMalusReason
---@return any @nothing
function Durability:setMalusFactor(_in, reason)
	return nil
end

---@param damageType DamageType
---@param factor number
---@return any @nothing
function Durability:setWeakness(damageType, factor)
	return nil
end

