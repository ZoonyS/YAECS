local REGISTRY = {}

--// STATIC PROPERTIES //--
local REPLICATED_STORAGE = game:GetService("ReplicatedStorage")
local YAECS = REPLICATED_STORAGE.Common.YAECS

--// CONSTRUCTORS //--
function REGISTRY.new()
	local self = setmetatable({}, REGISTRY)

	--// INSTANCE PROPERTIES //--
	self.Entities = {}
	self.Components = {}
	self.Systems = {}
	self.enabled = false
	--////--
	return self
end

--// INSTANCE METHODS //--

--// Entities //--

function REGISTRY:registerEntity(name, components)
	-- create and add new entity to registry list

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot register entity")
		return
	end

	if self.Entities[name] then
		error("[YAECS] Entity with name " .. name .. " already exists")
		return
	end

	local entity = require(YAECS["Entity"])

	local componentTable = self:getComponentsInTable(components)
	print("component table:", componentTable)

	local newEntity = entity.new(#self.Entities, name, componentTable)

	self.Entities[name] = newEntity
	print("test")
end

function REGISTRY:hasEntity(entity)
	-- if registry has object return true else false

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot remove entity")
		return
	end

	--return self.Entities[entity] ~= nil

	if entity == self.Entities[entity] then
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

	if self.Entities[entity] then
		self.Entities[entity] = nil
	end
end

function REGISTRY:getEntityByName(entityName)
	-- return an object based on given name

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot remove entity")
		return
	end

	if self.Entities[entityName] then
		return self.Entities[entityName]
	else
		error("[YAECS] Could not get entity by name, returning nil")
		return nil
	end
end

function REGISTRY:getEntityByID(entityID)
	-- return an object based on ID

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot remove entity")
		return
	end

	for _, entity in pairs(self.Entities) do
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

	print("inside function", self.Components)
	print("inside function", componentName)
	if not self.Components[componentName] then
		error("[YAECS] Component " .. componentName .. " does not exist")
		return nil
	end

	return self.Components[componentName]
end

function REGISTRY:getComponentsInTable(components)
	-- returns a table of components by name
	-- name to be changed

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot get component")
		return
	end

	local componentTable = {}

	for _, v in pairs(components) do
		print(v)
		local component = self.getComponentByName(v)
		print(component)
		componentTable[#componentTable + 1] = component
		print(componentTable)
	end

	return componentTable
end
--// SYSTEM //--

function REGISTRY:registerSystem(component, onEvent, toCall)
	-- register system to component on event

	if not self.enabled then
		error("[YAECS] Registry is disabled, cannot register system")
		return
	end

	if not self.Components[component] then
		error("[YAECS] Component " .. component .. " does not exist")
		return
	end

	local system = require(YAECS["System"])()

	local componentReference = self.Components[component]

	local newSystem = system.new(componentReference, onEvent, toCall)

	newSystem:pushFunctionToOnEvents(onEvent, toCall)
end

--// REGISTRY // --

function REGISTRY:init()
	-- initialize a registry

	self.enabled = true
end

function REGISTRY:cleanRegistry()
	-- clean everything safely from registry

	for _, entity in pairs(self.Entities) do
		self.Entities[entity] = nil
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

REGISTRY.__index = REGISTRY

return REGISTRY
