local ENTITY = {}

--// STATIC PROPERTIES //--

--// CONSTRUCTORS //--

function ENTITY.new(id, name)
	local self = setmetatable({}, ENTITY)

	--// INSTANCE PROPERTIES //--
	self.id = id
	self.name = name
	self.enabled = true
	self.Components = {}
	--////--
	return self
end

--// STATIC METHODS //--

--// INSTANCE METHODS //--

--// PROPERTY
function ENTITY:updateProperty(Component, Property, Update)
	-- update a specific property with a new value

	if not self.enabled then
		error("[YAECS] Entity is disabled, cannot update property")
		return
	end

	if not self.Components[Component] then
		error("[YAECS] Entity does not have component " .. Component)
		return
	end

	if not self.Components[Component][Property] then
		error("[YAECS] Entity does not have property " .. Property)
		return
	end

	self.Components[Component][Property] = Update
end

function ENTITY:hasProperty(Component, propertyName)
	-- if entity has property return true

	if not self.enabled then
		error("[YAECS] Entity is disabled, cannot remove property")
		return
	end

	if not self.Components[Component] then
		error("[YAECS] Entity does not have component " .. Component)
		return
	end

	if self.Components[Component][propertyName] then
		return true
	else
		return false
	end
end

function ENTITY:getPropertyByName(Component, propertyName)
	-- return an entity's property by name

	if not self.enabled then
		error("[YAECS] Entity is disabled, cannot get property")
		return
	end

	if not self.Components[Component] then
		error("[YAECS] Entity does not have component " .. Component)
		return
	end

	if Component[propertyName] then
		return Component[propertyName]
	else
		return nil
	end
end

--// COMPONENT
function ENTITY:addComponent(Component)
	-- add a component to an entity

	if not self.enabled then
		error("[YAECS] Entity is disabled, cannot add component")
		return
	end

	if self.Components[Component] then
		error("[YAECS] Entity already has component " .. Component)
		return
	end

	self.Components[Component] = Component
end

function ENTITY:removeComponent(componentName)
	-- remove a component from an entity

	if not self.enabled then
		error("[YAECS] Entity is disabled, cannot remove component")
		return
	end

	if not self.Components[componentName] then
		error("[YAECS] Entity does not have component " .. componentName)
		return
	end

	if self.components[componentName] then
		self.components[componentName] = nil
	end
end

function ENTITY:hasComponent(componentName)
	-- if entity has component return true

	if not self.enabled then
		error("[YAECS] Entity is disabled, cannot remove component")
		return
	end

	if self.components[componentName] then
		return true
	else
		return false
	end
end

function ENTITY:getComponentByName(componentName)
	-- return a component by name

	if not self.enabled then
		error("[YAECS] Entity is disabled, cannot get component")
		return
	end

	if self.components[componentName] then
		return self.components[componentName]
	end
end

--// INSTRUCTIONS //--

ENTITY.__index = ENTITY

return ENTITY
