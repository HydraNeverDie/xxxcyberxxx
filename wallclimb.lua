local RunService = game:GetService("RunService")
local HumanoidRootPart = script.Parent:WaitForChild("HumanoidRootPart")
local Humanoid = script.Parent:WaitForChild("Humanoid")
local Animate = script.Parent:WaitForChild("Animate")
local ClimbAnim = Humanoid:LoadAnimation(Animate.climb.ClimbAnim)
local wall = nil

RunService.Heartbeat:Connect(function()
	local RaycastParamsNew = RaycastParams.new()
	RaycastParamsNew.FilterDescendantsInstances = {script.Parent}
	local RaycastResult = workspace:Raycast(script.Parent.LeftFoot.Position, HumanoidRootPart.CFrame.LookVector * 1.3, RaycastParamsNew)
	wall = RaycastResult and RaycastResult.Instance or nil
	if wall then
		HumanoidRootPart.Velocity = Vector3.new(HumanoidRootPart.Velocity.X, 20, HumanoidRootPart.Velocity.Z)
		if Humanoid:GetState() ~= Enum.HumanoidStateType.Climbing then
			Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
		end
		if not ClimbAnim.IsPlaying then
			ClimbAnim:Play()
		end
	else
		ClimbAnim:Stop()
	end
end)
