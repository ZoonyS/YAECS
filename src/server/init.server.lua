print("Hello world, from server!")

workspace.Baseplate.Color = Color3.new(0.1, 0.9, 0.3)

local REPLICATED_STORAGE = game:GetService("ReplicatedStorage")
local YAECS = REPLICATED_STORAGE.Common.YAECS

local Registry = require(YAECS["Registry"])

local registry = Registry.new()

registry:init()

registry:registerComponent("Position", {
	x = 0,
	y = 0,
	z = 0,
})

print(registry:getComponentByName("Position"))

registry:registerComponent("Color", {
	r = 0,
	g = 0,
	b = 0,
	a = 0,
})

print(registry:getComponentByName("Color"))

print(registry.components)
-- registry:registerSystem("Position", "onUpdate", function(dt)
-- 	print("onUpdate")
-- end)

registry:registerEntity("rainbow_part", { "Position", "Color" })

print(registry:getEntityByName("rainbow_part"))

print(registry.Entities)
