---@class Matrix
Matrix = {

	look = vec3, -- vec3
	pos = vec3, -- vec3
	position = vec3, -- vec3
	right = vec3, -- vec3
	translation = vec3, -- vec3
	up = vec3, -- vec3

}

---@return Matrix
function Matrix()
	return Matrix
end

---@param m Matrix
---@return Matrix
function Matrix:__mul(m)
	return Matrix
end

---@return Matrix
function Matrix:getInverse()
	return Matrix
end

---@param row number
---@param col number
---@return number
function Matrix:getValue(row, col)
	return 0.0
end

---@return any @nothing
function Matrix:invert()
	return nil
end

---@param row number
---@param col number
---@param value number
---@return any @nothing
function Matrix:setValue(row, col, value)
	return nil
end

---@param _in vec3
---@return vec4
function Matrix:transform(_in)
	return vec4
end

---@param _in vec3
---@return vec3
function Matrix:transformCoord(_in)
	return vec3
end

---@param v vec3
---@return any @nothing
function Matrix:transformCoord_ip(v)
	return nil
end

---@param _in vec3
---@return vec3
function Matrix:transformNormal(_in)
	return vec3
end

---@param v vec3
---@return any @nothing
function Matrix:transformNormal_ip(v)
	return nil
end

---@param v vec4
---@return any @nothing
function Matrix:transform_ip(v)
	return nil
end

