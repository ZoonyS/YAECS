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
	--////--
	return self
end

--// INSTANCE METHODS //--

function REGISTRY:registerEntity(name, components)
	-- create and add new entity to registry list

	local entity = require(Entity)()

	local newEntity = entity.new(#Entity, name, components)

	self.Entitys[newEntity] = newEntity
	print("test")
end

function REGISTRY:hasEntity(entity)
	-- if registry has object return true else false

	if entity == self.Entitys[entity] then
		return true
	else
		return false
	end
end

function REGISTRY:removeEntity(entity)
	-- remove an object from registry list
end

function REGISTRY:getEntityByName(entityName)
	-- return an object based on given name
end

function REGISTRY:getEntityByID(entityID)
	-- return an object based on ID
end

--// REGISTRY
function REGISTRY:init()
	-- initialize a registry
end

function REGISTRY:cleanRegistry()
	-- clean everything safely from registry
end

function REGISTRY:toggleRegistry(boolean)
	-- enable or disable registry which
	-- stops or starts all objects
end
