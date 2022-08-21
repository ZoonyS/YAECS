local SYSTEM = {}

--// STATIC PROPERTIES //--

--// CONSTRUCTORS //--

function SYSTEM.new()
	local self = setmetatable({}, SYSTEM)

	--// INSTANCE PROPERTIES //--
	self.types = { "onUpdate", "onCreate", "onDestroy", "onCollision", "onTouch" }
	--////--
	return self
end

--// STATIC METHODS //--

--// INSTANCE METHODS //--

--// INSTRUCTIONS //--

SYSTEM.__index = SYSTEM

return SYSTEM
