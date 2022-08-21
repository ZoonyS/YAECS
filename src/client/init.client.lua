print("Hello world, from client!")

local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid")

while true do
	local xOffset = math.random(-405, 200) / 500
	local yOffset = math.random(-405, 200) / 500
	local zOffset = math.random(-405, 200) / 500
	Humanoid.CameraOffset = Vector3.new(xOffset, yOffset, zOffset)
end
