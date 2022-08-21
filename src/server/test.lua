local REPLICATED_STORAGE = game:GetService("ReplicatedStorage")
local RESOURCES = REPLICATED_STORAGE.Common.Resources

local Regisry = require(RESOURCES.Registry)

local registry = Regisry.new()
registry:init()

registry:registerComponent("Position", {
	x = 0,
	y = 0,
	z = 0,
})

registry:registerComponents("Color", {
	r = 0,
	g = 0,
	b = 0,
	a = 0,
})

local rainbow_part = registry:registerEntity("rainbow_part", { "Position", "Color" })
