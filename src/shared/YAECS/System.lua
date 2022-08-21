local SYSTEM = {}

--// STATIC PROPERTIES //--

--// CONSTRUCTORS //--

function SYSTEM.new()
	local self = setmetatable({}, SYSTEM)

	--// INSTANCE PROPERTIES //--
	self.onEvents = {
		onUpdate = {},
		onCreate = {},
		onDestroy = {},
		onCollision = {},
		onTouch = {},
	}
	--////--
	return self
end

--// STATIC METHODS //--

--// INSTANCE METHODS //--

function SYSTEM:pushFunctionToOnEvents(onEvents, toCall)
	-- push functions to Events Table

	if not self.onEvents[onEvents] then
		error("[YAECS] OnEvents " .. onEvents .. " does not exist")
		return
	end

	if type(toCall) ~= "function" then
		error("[YAECS] Function to push to OnEvents " .. onEvents .. " is not a function")
		return
	end

	table.insert(self.onEvents[onEvents], toCall)
end

--// INSTRUCTIONS //--

SYSTEM.__index = SYSTEM

return SYSTEM
