local COMPONENT = {}

--// STATIC PROPERTIES //--


--// CONSTRUCTORS //--

function COMPONENT.new()
    local self = setmetatable({}, COMPONENT)

    --// INSTANCE PROPERTIES //--
    self.Properties = {

    }
    --////--
    return self
end

--// STATIC METHODS //--


--// INSTANCE METHODS //--


--// INSTRUCTIONS //--

COMPONENT.__index = COMPONENT

return COMPONENT