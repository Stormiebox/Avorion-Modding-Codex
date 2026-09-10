---@class Ray
Ray = {

	direction = vec3, -- vec3
	origin = vec3, -- vec3
	planeIntersectionThickness = 0.0, -- float

}

---@return Ray
---@param pos vec3
---@param size vec3
function Ray(pos, size)
	return Ray
end

---@param point vec3
---@return number
function Ray:distanceToPoint(point)
	return 0.0
end

---@param point vec3
---@return number
function Ray:distanceToPoint2(point)
	return 0.0
end

---@param other Ray
---@param onSelf vec3
---@param onOther vec3
---@return any @nothing
function Ray:findClosestPoints(other, onSelf, onOther)
	return nil
end

