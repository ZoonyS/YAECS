local REGISTRY = {}

--// STATIC PROPERTIES //--
local REPLICATED_STORAGE = game:GetService("ReplicatedStorage")
local CLASSES = REPLICATED_STORAGE.Common.Class
local Entity = CLASSES["Entity"]

--// CONSTRUCTORS //--
function REGISTRY.new()
	local self = setmetatable({}, REGISTRY)

	--// INSTANCE PROPERTIES //--
	self.Entitys = {}
	self.Components = {}
	self.enabled = false
	--////--
	return self
end

--// INSTANCE METHODS //--

--// Entitys //--

function REGISTRY:registerEntity(name, components)
	-- create and add new entity to registry list

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot register entity")
		return
	end

	if self.Entitys[name] then
		error("[YAECS] Entity with name " .. name .. " already exists")
		return
	end

	local entity = require(Entity)()

	local newEntity = entity.new(#Entity, name, components)

	self.Entitys[newEntity] = newEntity
	print("test")
end

function REGISTRY:hasEntity(entity)
	-- if registry has object return true else false

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot remove entity")
		return
	end

	--return self.Entitys[entity] ~= nil

	if entity == self.Entitys[entity] then
		return true
	else
		return false
	end
end

function REGISTRY:removeEntity(entity)
	-- remove an object from registry list

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot remove entity")
		return
	end

	if self.Entitys[entity] then
		self.Entitys[entity] = nil
	end
end

function REGISTRY:getEntityByName(entityName)
	-- return an object based on given name

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot remove entity")
		return
	end

	if self.Entitys[entityName] then
		return self.Entitys[entityName]
	else
		return nil
	end

	-- for _, entity in pairs(self.Entitys) do
	-- 	if entity.name == entityName then
	-- 		return entity
	-- 	end
	-- end
end

function REGISTRY:getEntityByID(entityID)
	-- return an object based on ID

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot remove entity")
		return
	end

	for _, entity in pairs(self.Entitys) do
		if entity.id == entityID then
			return entity
		end
	end
end

--// COMPONENTS //--

function REGISTRY:registerComponent(name, properties)
	-- create and add new component to registry list

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot register component")
		return
	end

	if self.Components[name] then
		error("[YAECS] Component with name " .. name .. " already exists")
		return
	end
	self.Components[name] = properties
end

function REGISTRY:hasComponent(component)
	-- if registry has component return true else false

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot remove component")
		return
	end

	return self.Components[component] ~= nil
end

function REGISTRY:removeComponent(component)
	-- remove component from registry list

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot remove component")
		return
	end

	if self.Components[component] then
		self.Components[component] = nil
	end
end

function REGISTRY:getComponentByName(componentName)
	-- return component by name

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot get component")
		return
	end

	if self.Components[componentName] then
		return self.Components[componentName]
	else
		return nil
	end
end

--// COMPONENT SYSTEM //--

function REGISTRY:registerSystem(name, component, type)
	-- create and add new system to registry list

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot register system")
		return
	end

	if self.Systems[name] then
		error("[YAECS] System with name " .. name .. " already exists")
		return
	end
end

--// REGISTRY // --

function REGISTRY:init()
	-- initialize a registry

	self.enabled = true
end

function REGISTRY:cleanRegistry()
	-- clean everything safely from registry

	for _, entity in pairs(self.Entitys) do
		self.Entitys[entity] = nil
	end
end

function REGISTRY:toggleRegistry(boolean)
	-- enable or disable registry which
	-- stops or starts all objects

	if boolean == true then
		self.enabled = true
	else
		self.enabled = false
	end
end
