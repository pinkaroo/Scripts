local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function Highlight(Obj, Color, Clone)
	if Obj:IsA("Model") then
		for _, Obj in pairs(Obj:GetChildren()) do
			if Obj:IsA("BasePart") and Obj.Name ~= "HumanoidRootPart" then
				Obj.Transparency = 0.8
			end
		end
	else
		Obj.Transparency = 0
	end

	local Highlight = Instance.new("Highlight")
	Highlight.Parent = Obj

	if Color then
		Highlight.FillColor = Color
	end

	if Clone then
		Obj:WaitForChild("Humanoid", 9e9)

		if not Obj.Humanoid.DisplayName:find(" Clone") then
			Obj.Humanoid.DisplayName = Obj.Humanoid.DisplayName .. "'s Clone"
		end
	end
end

for _, Clone in pairs(workspace:GetChildren()) do
	if Clone.Name:find("_Clone") and not Clone.Name:find(tostring(LocalPlayer.UserId)) then
		Highlight(Clone, nil, true)
	end
end

for _, Mine in pairs(workspace.ToolsAdds:GetChildren()) do
	if Mine.Name:sub(1, 16) == "SubspaceTripmine" and not Mine.Name:find(tostring(LocalPlayer.Name)) then
		Highlight(Mine, Color3.new(0, 0, 1))
	end
end

workspace.ChildAdded:Connect(function(Clone)
	if Clone.Name:find("_Clone") and not Clone.Name:find(tostring(LocalPlayer.UserId)) then
		Highlight(Clone, nil, true)
	end
end)

workspace.ToolsAdds.ChildAdded:Connect(function(Mine)
	if Mine.Name:sub(1, 16) == "SubspaceTripmine" and not Mine.Name:find(tostring(LocalPlayer.Name)) then
		Highlight(Mine, Color3.new(0, 0, 1))
	end
end)
