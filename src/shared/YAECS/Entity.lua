local ENTITY = {}

--// STATIC PROPERTIES //--


--// CONSTRUCTORS //--

function ENTITY.new(id, name)
    local self = setmetatable({}, ENTITY)

    --// INSTANCE PROPERTIES //--
    self.id = id
    self.name = name
    self.Components = {}
    --////--
    return self
    
end

--// STATIC METHODS //--


--// INSTANCE METHODS //--

--// PROPERTY
function ENTITY:updateProperty(Property, Update)
    -- update a specific property with a
    -- new value

end

function ENTITY:hasProperty(Component, propertyName)
    -- if entity has property return true

end

function ENTITY:getPropertyByName(Component, propertyName)
    -- return an entity's property by name

end

--// COMPONENT
function ENTITY:addComponent(componentModule)
    -- add a component to an entity
    local component = require(componentModule)()

    self.components[component.name] = component

end

function ENTITY:removeComponent(componentName)
    -- remove a component from an entity

end

function ENTITY:hasComponent(componentName)
    -- if entity has component return true
    -- else false

end

function ENTITY:getComponentByName(componentName)
    -- return a component by name
end

--// INSTRUCTIONS //--

ENTITY.__index = ENTITY

return ENTITY