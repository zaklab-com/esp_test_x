local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local KEYBIND = Enum.KeyCode.X

local isActivated = false

UserInputService.InputBegan:Connect(function(input, gameprocessed)
	if gameprocessed then return end
	
	if input.KeyCode == KEYBIND and isActivated == false then
		isActivated = true
		for i, model in game.Workspace:GetChildren() do
			if model:FindFirstChild("Humanoid") and model.Name ~= player.Character.Name then
				local v__Weld__Constraint = Instance.new("WeldConstraint", model.HumanoidRootPart)
				v__Weld__Constraint.Part0 = model.HumanoidRootPart
				local v__Part = Instance.new("Part", model)
				v__Part.CanCollide = false
				v__Part.Size = Vector3.new(4.679, 6, 3.874)
				v__Part.Name = "Hitbox"
				v__Part.Transparency = 0.5
				local v__Highlight = Instance.new("Highlight", v__Part)
				v__Highlight.FillTransparency = 1
				v__Part.CFrame = model.HumanoidRootPart.CFrame
				v__Weld__Constraint.Part1 = v__Part
				v__Part.Parent = model
			end
		end
	elseif input.KeyCode == KEYBIND and isActivated == true then
		isActivated = false
		for i, model in game.Workspace:GetChildren() do
			if model:FindFirstChild("Humanoid") and model:FindFirstChild("Hitbox") then
				model.Hitbox:Destroy()
			end
		end
	end
end)

game.Workspace.ChildAdded:Connect(function(child)
	if isActivated == true then
		local v__Weld__Constraint = Instance.new("WeldConstraint", child.HumanoidRootPart)
		v__Weld__Constraint.Part0 = child.HumanoidRootPart
		local v__Part = Instance.new("Part", child)
		v__Part.CanCollide = false
		v__Part.Size = Vector3.new(4.679, 6, 3.874)
		v__Part.Name = "Hitbox"
		v__Part.Transparency = 0.5
		local v__Highlight = Instance.new("Highlight", v__Part)
		v__Highlight.FillTransparency = 1
		v__Part.CFrame = child.HumanoidRootPart.CFrame
		v__Weld__Constraint.Part1 = v__Part
		v__Part.Parent = child
	end
end)