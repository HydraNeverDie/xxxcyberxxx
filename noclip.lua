wait(5)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character

RunService.Stepped:Connect(function()
	for i, v in ipairs(Character:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
end)
