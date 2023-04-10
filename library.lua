
--Services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")
local LP = players.LocalPlayer
local Mouse = LP:GetMouse()
---------------------------------------------------
--Vars
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}

Library.Config = {}

function Library:Validate(deafults, options)
	options = options or {}
	for i, v in pairs(deafults) do
		if options[i] == nil then
			options[i] = v 
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:New(options)
	options = Library:Validate({
		name = "UI Library",
		MinX = 350,
		MinY = 350,
	}, options or {})
	
	local GUI = {
		CurrentTab = nil,
		dragToggle = nil,
		dragSpeed = 0.10,
		dragStart = nil,
		startPos = nil,
		MouseDown = false,
		Hover = false,
		MouseDown1 = false,
		Hover1 = false,
		TextboxFocus  = false,
		HoverKeybind = false,
		UIclosed = false,
		Minimized = false,
		Dragging = false,
		Connection = false,
		HoveringFrame = false,
		MinX = 250,
		MinY = 250,
		Resizing = false,
		Config = {},
	}
	
	local BlacklistedBooleans = {"UIclosed"}
	
do	--main
	-- StarterGui.ScreenGui
		-- StarterGui.UIlib(2nd)
		GUI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
		GUI["1"]["Name"] = [[UIlib(2nd)]];
		GUI["1"]["IgnoreGuiInset"] = true;

		-- StarterGui.UIlib(2nd).MainFrame
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 34);
		GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["2"]["Size"] = UDim2.new(0, 510, 0, 400);
		GUI["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		GUI["2"]["Name"] = [[MainFrame]];

		-- StarterGUI.UIlib(2nd).MainFrame.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 3);

		-- StarterGUI.UIlib(2nd).MainFrame.DropShadowHolder
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 0;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundTransparency"] = 1;
		GUI["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4"]["Name"] = [[DropShadowHolder]];

		-- StarterGUI.UIlib(2nd).MainFrame.DropShadowHolder.DropShadow
		GUI["5"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["5"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["5"]["ImageTransparency"] = 0.5;
		GUI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://6014261993]];
		GUI["5"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["5"]["Name"] = [[DropShadow]];
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGUI.UIlib(2nd).MainFrame.TopInfo
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["6"]["Name"] = [[TopInfo]];

		-- StarterGUI.UIlib(2nd).MainFrame.TopInfo.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGUI.UIlib(2nd).MainFrame.TopInfo.TopInfoLayer
		GUI["8"] = Instance.new("Frame", GUI["6"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		GUI["8"]["Size"] = UDim2.new(1, 0, 0, -15);
		GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["8"]["Name"] = [[TopInfoLayer]];

		-- StarterGUI.UIlib(2nd).MainFrame.TopInfo.Title
		GUI["9"] = Instance.new("TextLabel", GUI["6"]);
		GUI["9"]["ZIndex"] = 2;
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["TextSize"] = 16;
		GUI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["9"]["Text"] = options.name;
		GUI["9"]["Name"] = [[Title]];
		GUI["9"]["Font"] = Enum.Font.SourceSans;
		GUI["9"]["BackgroundTransparency"] = 1;

		-- StarterGUI.UIlib(2nd).MainFrame.TopInfo.Title.UIPadding
		GUI["a"] = Instance.new("UIPadding", GUI["9"]);
		GUI["a"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGUI.UIlib(2nd).MainFrame.TopInfo.Title.UIStroke
		GUI["b"] = Instance.new("UIStroke", GUI["9"]);
		GUI["b"]["Thickness"] = 0.800000011920929;
		GUI["b"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;

		-- StarterGui.UIlib(2nd).MainFrame.TopInfo.Close
		GUI["c"] = Instance.new("ImageLabel", GUI["6"]);
		GUI["c"]["ZIndex"] = 2;
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c"]["ImageColor3"] = Color3.fromRGB(255, 61, 64);
		GUI["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["c"]["Image"] = [[rbxassetid://12195649193]];
		GUI["c"]["Size"] = UDim2.new(0, 16, 0, 16);
		GUI["c"]["Name"] = [[Close]];
		GUI["c"]["BackgroundTransparency"] = 1;
		GUI["c"]["Position"] = UDim2.new(1, -15, 0.5, 0);

		-- StarterGUI.UIlib(2nd).MainFrame.TopInfo.Line
		GUI["d"] = Instance.new("Frame", GUI["6"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(123, 145, 191);
		GUI["d"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["d"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["d"]["Name"] = [[Line]];

		-- StarterGui.UIlib(2nd).MainFrame.TopInfo.Minimize
		GUI["e"] = Instance.new("ImageLabel", GUI["6"]);
		GUI["e"]["ZIndex"] = 2;
		GUI["e"]["BorderSizePixel"] = 0;
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["e"]["Image"] = [[rbxassetid://12195614424]];
		GUI["e"]["Size"] = UDim2.new(0, 20, 0, 20);
		GUI["e"]["Name"] = [[Minimize]];
		GUI["e"]["BackgroundTransparency"] = 1;
		GUI["e"]["Position"] = UDim2.new(1, -38, 0.5, 0);
		

		-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer
		GUI["1f"] = Instance.new("Frame", GUI["2"]);
		GUI["1f"]["BorderSizePixel"] = 0;
		GUI["1f"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 34);
		GUI["1f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["1f"]["Size"] = UDim2.new(1, -120, 1, -60);
		GUI["1f"]["Position"] = UDim2.new(0.5, 45, 0.5, 15);
		GUI["1f"]["Name"] = [[ContentCointainer]];

		-- StarterGui.UIlib(2nd).MainFrame.Drag1
		GUI["c9"] = Instance.new("Frame", GUI["2"]);
		GUI["c9"]["BorderSizePixel"] = 0;
		GUI["c9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["c9"]["BackgroundTransparency"] = 1;
		GUI["c9"]["Size"] = UDim2.new(0, 10, 0, 10);
		GUI["c9"]["Position"] = UDim2.new(1, -8, 1, -8);
		GUI["c9"]["Name"] = [[Drag1]];

		-- StarterGui.UIlib(2nd).MainFrame.Drag1.ImageLabel
		GUI["ca"] = Instance.new("ImageLabel", GUI["c9"]);
		GUI["ca"]["BorderSizePixel"] = 0;
		GUI["ca"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["ca"]["ImageColor3"] = Color3.fromRGB(66, 66, 77);
		GUI["ca"]["Image"] = [[rbxassetid://12392833645]];
		GUI["ca"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["ca"]["BackgroundTransparency"] = 1;

		-- StarterGui.UIlib(2nd).MainFrame.Drag1.ImageLabel.UICorner
		GUI["cb"] = Instance.new("UICorner", GUI["ca"]);
		GUI["cb"]["CornerRadius"] = UDim.new(0, 0);
		
end
	
do  --Navigation
		-- StarterGui.UIlib(2nd).MainFrame.Navigation
		GUI["f"] = Instance.new("Frame", GUI["2"]);
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(80, 85, 92);
		GUI["f"]["Size"] = UDim2.new(0, 90, 1, -31);
		GUI["f"]["Position"] = UDim2.new(0, 0, 0, 31);
		GUI["f"]["Name"] = [[Navigation]];

		-- StarterGui.UIlib(2nd).MainFrame.Navigation.UICorner
		GUI["10"] = Instance.new("UICorner", GUI["f"]);
		GUI["10"]["CornerRadius"] = UDim.new(0, 3);

		-- StarterGui.UIlib(2nd).MainFrame.Navigation.ScrollingFrame
		GUI["11"] = Instance.new("ScrollingFrame", GUI["f"]);
		GUI["11"]["Active"] = true;
		GUI["11"]["BorderSizePixel"] = 0;
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(41, 40, 45);
		GUI["11"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["11"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["11"]["ScrollBarThickness"] = 0;
		
		-- StarterGui.UIlib(2nd).MainFrame.Navigation.ScrollingFrame.UIListLayout
		GUI["16"] = Instance.new("UIListLayout", GUI["11"]);
		GUI["16"]["Padding"] = UDim.new(0, 2);
		GUI["16"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		
		-- StarterGui.UIlib(2nd).MainFrame.Navigation.ScrollingFrame.UIPadding
		GUI["1b"] = Instance.new("UIPadding", GUI["11"]);
		GUI["1b"]["PaddingTop"] = UDim.new(0, 2);
		
		-- StarterGui.UIlib(2nd).MainFrame.Navigation.Line
		GUI["1c"] = Instance.new("Frame", GUI["f"]);
		GUI["1c"]["BorderSizePixel"] = 0;
		GUI["1c"]["BackgroundColor3"] = Color3.fromRGB(123, 145, 191);
		GUI["1c"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["1c"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["1c"]["Name"] = [[Line]];

		-- StarterGui.UIlib(2nd).MainFrame.Navigation.Cover
		GUI["1d"] = Instance.new("Frame", GUI["f"]);
		GUI["1d"]["ZIndex"] = 0;
		GUI["1d"]["BorderSizePixel"] = 0;
		GUI["1d"]["BackgroundColor3"] = Color3.fromRGB(80, 85, 92);
		GUI["1d"]["Size"] = UDim2.new(0, 90, 0, 10);
		GUI["1d"]["Name"] = [[Cover]];

		-- StarterGui.UIlib(2nd).MainFrame.Navigation.Cover2
		GUI["1e"] = Instance.new("Frame", GUI["f"]);
		GUI["1e"]["ZIndex"] = 0;
		GUI["1e"]["BorderSizePixel"] = 0;
		GUI["1e"]["BackgroundColor3"] = Color3.fromRGB(80, 85, 92);
		GUI["1e"]["Size"] = UDim2.new(0, -45, 0, 10);
		GUI["1e"]["Position"] = UDim2.new(1, 0, 1, -10);
		GUI["1e"]["Name"] = [[Cover2]];

	end
	
	--NotifcationHolder
	do
		-- StarterGui.UIlib(2nd).NotficationHolder
		GUI["cc"] = Instance.new("Frame", GUI["1"]);
		GUI["cc"]["ZIndex"] = -1;
		GUI["cc"]["BorderSizePixel"] = 0;
		GUI["cc"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["cc"]["BackgroundTransparency"] = 1;
		GUI["cc"]["Size"] = UDim2.new(0, 210, 1, 0);
		GUI["cc"]["Position"] = UDim2.new(1, -210, 0, 0);
		GUI["cc"]["Name"] = [[NotficationHolder]];
		
		-- StarterGui.UIlib(2nd).NotficationHolder.UIListLayout
		GUI["d5"] = Instance.new("UIListLayout", GUI["cc"]);
		GUI["d5"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
		GUI["d5"]["Padding"] = UDim.new(0, 7);
		GUI["d5"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.UIlib(2nd).NotficationHolder.UIPadding
		GUI["d6"] = Instance.new("UIPadding", GUI["cc"]);
		GUI["d6"]["PaddingTop"] = UDim.new(0, 10);
		GUI["d6"]["PaddingRight"] = UDim.new(0, 12);
		GUI["d6"]["PaddingBottom"] = UDim.new(0, 10);
	end
	
	--methods
	do
		function GUI:DestroyUI()
			GUI:closeUI()
			wait(0.5)
			GUI["1"]:Destroy()
		end
		
		local uiElement = GUI["2"]
		local startPosition = uiElement.Position
		local endPosition = startPosition + UDim2.new(0, 0, 0, -700)
		local SizeX = uiElement.AbsoluteSize.X
		local SizeY = uiElement.AbsoluteSize.Y


		local TweenService = game:GetService("TweenService")

		function GUI:openUI()
			endPosition = startPosition + UDim2.new(0, 0, 0, -1050)
			if GUI.UIclosed then
				GUI["1"].Enabled = true
				local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back) -- animate for 0.5 seconds
				local positionTween = TweenService:Create(uiElement, tweenInfo, {Position = startPosition})
				positionTween.Completed:Connect(function()
					uiElement.Position = startPosition
				end)
				positionTween:Play()
				wait(0.5)
				GUI.UIclosed = false
			end
		end

		function GUI:closeUI()
			startPosition = uiElement.Position
			endPosition = UDim2.new(0.5, 0, 0, -uiElement.AbsoluteSize.Y) 
			GUI.UIclosed = true
			if uiElement.Position == startPosition then
				local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back) -- animate for 0.5 seconds
				local positionTween = TweenService:Create(uiElement, tweenInfo, {Position = endPosition})
				positionTween:Play()
				wait(0.5)
				GUI["1"].Enabled = false
				for i, v in pairs(GUI) do
					for __, BlacklistedBooleans in pairs(BlacklistedBooleans) do
						if type(v) == "boolean" and v == true and i ~= BlacklistedBooleans then
							v = false
						end
					end
				end
			end
		end
		
		function GUI:Minimize()
			SizeX = uiElement.AbsoluteSize.X
			SizeY = uiElement.AbsoluteSize.Y
			Library:tween(GUI["2"], {Size = UDim2.new(uiElement.Size.X,0,31)})
			for i, v in pairs(GUI["2"]:GetChildren()) do
				if v.ClassName == "Frame" and v.Name ~= "TopInfo" then
					v.Visible = false
				end
			end
			GUI.Minimized = true
		end
		
		function GUI:UnMinimize()
			GUI.Minimized = false
			Library:tween(GUI["2"], {Size = UDim2.new(0, SizeX, 0, SizeY)})
			for i, v in pairs(GUI["2"]:GetChildren()) do
				if v.ClassName == "Frame" and v.Name ~= "TopInfo" then
					v.Visible = true
				end
			end
		end
		
		function GUI:SetValue()
			local GapbeetweenDragX = Mouse.X - GUI["c9"].AbsolutePosition.X
			local GapbeetweenDragY = Mouse.Y - GUI["c9"].AbsolutePosition.Y
			
			local pixelsX = math.clamp(Mouse.X - GUI["2"].AbsolutePosition.X + GapbeetweenDragX, options.MinX, 1000)
			local pixelsY = math.clamp(Mouse.Y - GUI["2"].AbsolutePosition.Y + GapbeetweenDragY, options.MinY, 1000)
			
			GUI["2"].Size = UDim2.new(0, pixelsX, 0, pixelsY)
		end
		
		function GUI:SaveConfig()
			GUI.Config = {}
			for i, v in pairs(Library.Config) do
				GUI.Config[i] = v
			end
		end
		
	end
	
	-- logic
do
	local function updateInput(input)
		local delta = input.Position - GUI.dragStart
		local position = UDim2.new(GUI.startPos.X.Scale, GUI.startPos.X.Offset + delta.X,
			GUI.startPos.Y.Scale, GUI.startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(GUI["2"], TweenInfo.new(GUI.dragSpeed), {Position = position}):Play()
	end
		

		GUI["6"].InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				GUI.Dragging = true
			end
		end)
		
		GUI["6"].InputEnded:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				GUI.Dragging = false
			end
		end)
		
		GUI["f"].InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				GUI.Dragging = true
			end
		end)
		
		GUI["f"].InputEnded:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				GUI.Dragging = false
			end
		end)

	uis.InputBegan:Connect(function(input)
		if GUI.Dragging then
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				GUI.dragToggle = true
				GUI.dragStart = input.Position
				GUI.startPos = GUI["2"].Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						GUI.dragToggle = false
					end
				end)
			end
		end
	end)
		
		

	uis.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if GUI.dragToggle then
				updateInput(input)
			end
		end
	end)
		
		GUI["c"].MouseEnter:Connect(function()
			GUI.Hover = true
		end)
		
		
		GUI["c"].MouseLeave:Connect(function()
			GUI.Hover = false
		end)
		
		
		GUI["c9"].MouseEnter:Connect(function()
			GUI.HoveringFrame = true
			for i, v in pairs(GUI["2"]:GetDescendants()) do
				if v.ClassName == "ScrollingFrame" and v.ScrollingEnabled then
					v.ScrollingEnabled = false
				end
			end
			Mouse.Icon = "rbxassetid://12394438969"
		end)

		GUI["c9"].MouseLeave:Connect(function()
			GUI.HoveringFrame = false
			for i, v in pairs(GUI["2"]:GetDescendants()) do
				if v.ClassName == "ScrollingFrame" and not v.ScrollingEnabled then
					v.ScrollingEnabled = true
				end
			end
			Mouse.Icon = ""
		end)
		
		
		GUI["c9"].InputBegan:Connect(function(input, gpe)
			if not GUI["1"].Enabled then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 and GUI.HoveringFrame  then
				GUI.MouseDown = true
				if not GUI.Connection then
					GUI.Connection = runService.RenderStepped:Connect(function()
						if not GUI["1"].Enabled then
							GUI.Connection:Disconnect()
							GUI.Connection = nil	
							GUI.Resizing = false
							Mouse.Icon = ""
							for i, v in pairs(GUI["2"]:GetDescendants()) do
								if v.ClassName == "ScrollingFrame" and not v.ScrollingEnabled then
									v.ScrollingEnabled = true
								end
							end
						end
						GUI:SetValue()
						GUI.Resizing = true
						Mouse.Icon = "rbxassetid://12394438969"
						for i, v in pairs(GUI["2"]:GetDescendants()) do
							if v.ClassName == "ScrollingFrame" and v.ScrollingEnabled then
								v.ScrollingEnabled = false
							end
						end
					end)
				end
			end			
		end)
		


		GUI["c9"].InputEnded:Connect(function(input, gpe)
			if not GUI["1"].Enabled then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				GUI.MouseDown = false

				if GUI.Connection then GUI.Connection:Disconnect()
					GUI.Connection = nil
					GUI.Resizing = false
					Mouse.Icon = ""
					for i, v in pairs(GUI["2"]:GetDescendants()) do
						if v.ClassName == "ScrollingFrame" and not v.ScrollingEnabled then
							v.ScrollingEnabled = true
						end
					end
				end	

			end


		end)
		
		
		
		
		uis.InputBegan:Connect(function(input, gpe)
			
			if not GUI["1"].Enabled then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 and GUI.Hover then
				GUI.MouseDown = true
				Library:tween(GUI["c"], {ImageColor3 = Color3.fromRGB(205, 21, 24)})
			end			
		end)
		
		uis.InputEnded:Connect(function(input, gpe)
			
			if not GUI["1"].Enabled then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 and GUI.Hover then
				GUI.MouseDown = false
				GUI:closeUI()
			end			
		end)
		
		
		
		
		GUI["e"].MouseEnter:Connect(function()
			if GUI["1"].Enabled then
				GUI.Hover1 = true
			end
		end)

		GUI["e"].MouseLeave:Connect(function()
			GUI.Hover1 = false
		end)



		uis.InputBegan:Connect(function(input, gpe)
			
			if not GUI["1"].Enabled then return end
			if (input.UserInputType == Enum.UserInputType.MouseButton1 and GUI.Hover1 and GUI["1"].Enabled) then
				GUI.MouseDown1 = true
				Library:tween(GUI["e"], {ImageColor3 = Color3.fromRGB(175, 175, 175)})
			end	
			if not GUI["1"].Enabled then
				GUI.Hover1 = false
				GUI.MouseDown1 = false
				GUI["e"]["ImageColor3"] = Color3.fromRGB(255, 255, 255)
			end
		end)

		uis.InputEnded:Connect(function(input, gpe)
			
			if not GUI["1"].Enabled then return end
			if (input.UserInputType == Enum.UserInputType.MouseButton1 and GUI.Hover1 and GUI["1"].Enabled) then
				if not GUI.Minimized then
					GUI:Minimize()
				else
					GUI:UnMinimize()
				end
				GUI.MouseDown1 = false
			end			
			if not GUI["1"].Enabled then
				GUI.Hover1 = false
				GUI.MouseDown1 = false
				GUI["e"]["ImageColor3"] = Color3.fromRGB(255, 255, 255)
			end
		end)

		uis.InputBegan:Connect(function(inputObject, gpe)
			
			if inputObject.KeyCode == Enum.KeyCode.RightShift then
				if GUI["1"].Enabled then
					if GUI.CurrentTab["Active"] then
						if not GUI.TextboxFocus and not GUI.HoverKeybind and not GUI.UIclosed then
							GUI:closeUI()
						end
					end
					else
					if not GUI["1"].Enabled then
						if not GUI.TextboxFocus and not GUI.HoverKeybind and GUI.UIclosed then
							GUI:openUI()
						end
					end
				end
			end
		end)
		
		
end
		
	function GUI:CreateTab(options)
		options = Library:Validate({
			name = "Deafult",
			icon = "rbxassetid://11945335252"
		}, options or {})
		local Tab = {
			Hover = false,
			Active = false 
		}
		
		
		
		--Render
do
			
			--StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab
			Tab["20"] = Instance.new("ScrollingFrame", GUI["1f"]);
			Tab["20"]["Active"] = true;
			Tab["20"]["BorderSizePixel"] = 0;
			Tab["20"]["CanvasSize"] = UDim2.new(0, 0, 12, 0);
			Tab["20"]["BackgroundColor3"] = Color3.fromRGB(41, 40, 45);
			Tab["20"]["BackgroundTransparency"] = 1;
			Tab["20"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["20"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["20"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
			Tab["20"]["ScrollBarThickness"] = 0;
			Tab["20"]["Name"] = options.name;
			Tab["20"]["Selectable"] = false
			Tab["20"]["Visible"] = false

			-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.UIStroke
			Tab["21"] = Instance.new("UIStroke", Tab["20"]);
			Tab["21"]["Color"] = Color3.fromRGB(123, 145, 191);
			Tab["21"]["Thickness"] = 0.699999988079071;
			Tab["21"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
			
			-- StarterTab.ScreenTab.MainFrame.ContentCointainer.HomeTab.UIListLayout
			Tab["28"] = Instance.new("UIListLayout", Tab["20"]);
			Tab["28"]["Padding"] = UDim.new(0, 8);
			Tab["28"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

			-- StarterTab.ScreenTab.MainFrame.ContentCointainer.HomeTab.UIPadding
			Tab["29"] = Instance.new("UIPadding", Tab["20"]);
			Tab["29"]["PaddingTop"] = UDim.new(0, 8);
			Tab["29"]["PaddingRight"] = UDim.new(0, 8);
			Tab["29"]["PaddingLeft"] = UDim.new(0, 8);
			
		-- StarterTab.ScreenGui.MainFrame.Navigation.ScrollingFrame.HomeInActive
		Tab["16"] = Instance.new("TextLabel", GUI["11"]);
		Tab["16"]["BorderSizePixel"] = 0;
		Tab["16"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		Tab["16"]["BackgroundColor3"] = Color3.fromRGB(126, 134, 145);
		Tab["16"]["TextSize"] = 16;
		Tab["16"]["TextColor3"] = Color3.fromRGB(217, 217, 217);
		Tab["16"]["Size"] = UDim2.new(1, 0, 0, 25);
		Tab["16"]["Text"] = options.name;
		Tab["16"]["Name"] = options.name;
		Tab["16"]["Font"] = Enum.Font.Nunito;
		Tab["16"]["BackgroundTransparency"] = 1;

		-- StarterGui.ScreenGui.MainFrame.Navigation.ScrollingFrame.HomeInActive.UIPadding
		Tab["17"] = Instance.new("UIPadding", Tab["16"]);
		Tab["17"]["PaddingLeft"] = UDim.new(0, 28);

		-- StarterGui.ScreenGui.MainFrame.Navigation.ScrollingFrame.HomeInActive.UIStroke
		Tab["18"] = Instance.new("UIStroke", Tab["16"]);
		Tab["18"]["Thickness"] = 0.45;

		-- StarterGui.ScreenGui.MainFrame.Navigation.ScrollingFrame.HomeInActive.Icon
		Tab["19"] = Instance.new("ImageLabel", Tab["16"]);
		Tab["19"]["ZIndex"] = 2;
		Tab["19"]["BorderSizePixel"] = 0;
		Tab["19"]["BackgroundColor3"] = Color3.fromRGB(217, 217, 217);
		Tab["19"]["ImageColor3"] = Color3.fromRGB(217, 217, 217);
		Tab["19"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Tab["19"]["Image"] = options.icon;
		Tab["19"]["Size"] = UDim2.new(0, 20, 0, 20);
		Tab["19"]["Name"] = [[Icon]];
		Tab["19"]["BackgroundTransparency"] = 1;
		Tab["19"]["Position"] = UDim2.new(0, -14, 0.5, 0);
			
		
end
		--methods
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				Tab.Active = true 
				Library:tween(Tab["16"], {BackgroundTransparency = .8})
				Library:tween(Tab["16"], {TextColor3 = Color3.fromRGB(255,255,255)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				GUI.CurrentTab = Tab
				Tab["20"]["Visible"] = true
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false 
				Tab.Hover = false
				Library:tween(Tab["16"], {TextColor3 = Color3.fromRGB(217,217,217)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(217,217,217)})
				Library:tween(Tab["16"], {BackgroundTransparency = 1})
				Tab["20"]["Visible"] = false
			end
		end

		--logic
do
		Tab["16"].MouseEnter:Connect(function()
			Tab.Hover = true
			if not Tab.Active then
				Library:tween(Tab["16"], {TextColor3 = Color3.fromRGB(255,255,255)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255,255,255)})
			end
		end)

		Tab["16"].MouseLeave:Connect(function()
			Tab.Hover = false

			if not Tab.Active then
				Library:tween(Tab["16"], {TextColor3 = Color3.fromRGB(217,217,217)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(217,217,217)})
			end
		end)
		
			Tab["16"].InputBegan:Connect(function(Input, gpe)
				
				if not GUI["1"].Enabled then return end
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				if Tab.Hover then
					Tab:Activate()
				end
			end
		end)
		
		if GUI.CurrentTab == nil then
			Tab:Activate()
		end		
	end
		
		
		function Tab:Section(options)
			options = Library:Validate({
				name = "Section Test",
			}, options or {})


			local Section = {
				Open = false,
				Hover = false,
				MouseDown = false,
				HoverChild = false
			}
			
			
			--render
			do
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do)
				Section["6c"] = Instance.new("Frame", Tab["20"]);
				Section["6c"]["BorderSizePixel"] = 0;
				Section["6c"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 25);
				Section["6c"]["Size"] = UDim2.new(1, 0, 0, 30);
				Section["6c"]["ClipsDescendants"] = true;
				Section["6c"]["Name"] = [[Section(to do)]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do).UICorner
				Section["6d"] = Instance.new("UICorner", Section["6c"]);
				Section["6d"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do).UIStroke
				Section["6e"] = Instance.new("UIStroke", Section["6c"]);
				Section["6e"]["Color"] = Color3.fromRGB(46, 46, 53);
				Section["6e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do).Title
				Section["6f"] = Instance.new("TextLabel", Section["6c"]);
				Section["6f"]["BorderSizePixel"] = 0;
				Section["6f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Section["6f"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Section["6f"]["TextSize"] = 16;
				Section["6f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Section["6f"]["Size"] = UDim2.new(1, 0, 0, 30);
				Section["6f"]["ClipsDescendants"] = true;
				Section["6f"]["Text"] = options.name;
				Section["6f"]["Name"] = [[Title]];
				Section["6f"]["Font"] = Enum.Font.Nunito;
				Section["6f"]["BackgroundTransparency"] = 1;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do).Title.UIStroke
				Section["70"] = Instance.new("UIStroke", Section["6f"]);
				Section["70"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do).UIPadding
				Section["71"] = Instance.new("UIPadding", Section["6c"]);
				Section["71"]["PaddingRight"] = UDim.new(0, 12);
				Section["71"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do).Section
				Section["72"] = Instance.new("ImageLabel", Section["6c"]);
				Section["72"]["BorderSizePixel"] = 0;
				Section["72"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Section["72"]["ImageColor3"] = Color3.fromRGB(176, 176, 177);
				Section["72"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Section["72"]["Image"] = [[rbxassetid://12316768455]];
				Section["72"]["Size"] = UDim2.new(0, 16, 0, 16);
				Section["72"]["Name"] = [[Section]];
				Section["72"]["BackgroundTransparency"] = 1;
				Section["72"]["Position"] = UDim2.new(1, -5, 0, 15);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do).Content
				Section["73"] = Instance.new("Frame", Section["6c"]);
				Section["73"]["BorderSizePixel"] = 0;
				Section["73"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Section["73"]["BackgroundTransparency"] = 1;
				Section["73"]["Size"] = UDim2.new(1, 0, 1, -30);
				Section["73"]["ClipsDescendants"] = true;
				Section["73"]["Position"] = UDim2.new(0, 0, 0, 30);
				Section["73"]["Name"] = [[Content]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do).Content.UIListLayout
				Section["74"] = Instance.new("UIListLayout", Section["73"]);
				Section["74"]["Padding"] = UDim.new(0, 8);
				Section["74"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Section(to do).Content.UIPadding
				Section["7c"] = Instance.new("UIPadding", Section["73"]);
				Section["7c"]["PaddingTop"] = UDim.new(0, 8);
				Section["7c"]["PaddingRight"] = UDim.new(0, 1);
				Section["7c"]["PaddingBottom"] = UDim.new(0, 8);
				Section["7c"]["PaddingLeft"] = UDim.new(0, 1);

			end
			
			--Methods 
			
			function Section:Destroy()
				for i, v in pairs(Section) do
					if typeof(v) == "boolean" and v then
						v = false
					end 
				end
				Library:tween(Section["6c"], {Transparency = 1})
				wait(0.2)
				Section["6c"]:Destroy()
			end
			
			function Section:OpenSection()
				if Section.Open and not Section.HoverChild and Section.MouseDown then
					Library:tween(Section["6c"], {Size = UDim2.new(1,0,0,30)})
					Library:tween(Section["72"], {Rotation = 0})
				elseif not Section.Open and not Section.HoverChild and Section.MouseDown then
					local count = 0
					local totalHeight = 0
					local totalWidth = 0
					
					for i, child in ipairs(Section["73"]:GetChildren()) do
						if child:IsA("Frame") then
							count += 1
							totalHeight = totalHeight + child.AbsoluteSize.Y
							totalWidth = totalWidth + child.AbsoluteSize.X
						end
					end
					Library:tween(Section["6c"], {Size = UDim2.new(1,0,0,30 + totalHeight + 16 + count * 8)})
					Library:tween(Section["72"], {Rotation = 180})
				end
				Section.Open = not Section.Open
			end
			
			function Section:Update()
				if Section.Open then	
					wait(0.2)
					local count = 0
					local totalHeight = 0
					local totalWidth = 0
					
					for i, child in ipairs(Section["73"]:GetChildren()) do
						if child:IsA("Frame") then
							count += 1
							totalHeight = totalHeight + child.AbsoluteSize.Y
							totalWidth = totalWidth + child.AbsoluteSize.X
						end
					end
					Library:tween(Section["6c"], {Size = UDim2.new(1,0,0,30 + totalHeight + 16 + count * 8)})
				end
			end
			
			
			--logic
			do
				Section["6f"].MouseEnter:Connect(function()
					if GUI["1"].Enabled then
						Section.Hover = true
						Library:tween(Section["6e"], {Color = Color3.fromRGB(66, 66, 73)})
					else
						Section.Hover = false
					end
				end)

				Section["6f"].MouseLeave:Connect(function()
					Section.Hover = false
					if not Section.MouseDown then
						Library:tween(Section["6e"], {Color = Color3.fromRGB(46, 46, 53)})
						Library:tween(Section["6c"], {BackgroundColor3 = Color3.fromRGB(22, 22, 25)})
					end
				end)

				Section["6f"].InputBegan:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Section.Hover and not Section.HoverChild then
						Section.MouseDown = true
						Library:tween(Section["6e"], {Color = Color3.fromRGB(76, 76, 83)})
						Library:tween(Section["6c"], {BackgroundColor3 = Color3.fromRGB(42, 42, 45)})
					end	
					
			end)


			uis.InputEnded:Connect(function(input, gpe)
				if not GUI["1"].Enabled then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if not Section.HoverChild and Section.MouseDown then
							Section:OpenSection()
							Section.MouseDown = false
							Library:tween(Section["6e"], {Color = Color3.fromRGB(66, 66, 73)})
							Library:tween(Section["6c"], {BackgroundColor3 = Color3.fromRGB(22, 22, 25)})
						else
							--reset
							Library:tween(Section["6e"], {Color = Color3.fromRGB(46, 46, 53)})
							Library:tween(Section["6c"], {BackgroundColor3 = Color3.fromRGB(22, 22, 25)})
						end
				end			
			
			end)

			end
			
			function Section:Button(options)
				options = Library:Validate({
					name = "Deafult",
					callback = function() end
				}, options or {})


				local Button = {
					Hover = false,
					MouseDown = false
				}


				--render
				do 
					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button
					Button["22"] = Instance.new("Frame", Section["73"]);
					Button["22"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 30);
					Button["22"]["Size"] = UDim2.new(1, 0, 0, 30);
					Button["22"]["Name"] = [[Button]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.Title
					Button["23"] = Instance.new("TextLabel", Button["22"]);
					Button["23"]["BorderSizePixel"] = 0;
					Button["23"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Button["23"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					Button["23"]["TextSize"] = 16;
					Button["23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Button["23"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["23"]["ClipsDescendants"] = true;
					Button["23"]["Text"] = options.name;
					Button["23"]["Name"] = options.name;
					Button["23"]["Font"] = Enum.Font.Nunito;
					Button["23"]["BackgroundTransparency"] = 1;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.Title.UIStroke
					Button["24"] = Instance.new("UIStroke", Button["23"]);
					Button["24"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.UIPadding
					Button["25"] = Instance.new("UIPadding", Button["22"]);
					Button["25"]["PaddingRight"] = UDim.new(0, 12);
					Button["25"]["PaddingLeft"] = UDim.new(0, 10);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.UICorner
					Button["26"] = Instance.new("UICorner", Button["22"]);
					Button["26"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.Click
					Button["27"] = Instance.new("ImageLabel", Button["22"]);
					Button["27"]["BorderSizePixel"] = 0;
					Button["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["27"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["27"]["Image"] = [[rbxassetid://12195820883]];
					Button["27"]["Size"] = UDim2.new(0, 16, 0, 16);
					Button["27"]["Name"] = [[Click]];
					Button["27"]["BackgroundTransparency"] = 1;
					Button["27"]["Position"] = UDim2.new(1, 0, 0, 15);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.UIStroke
					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.UIStroke
					Button["28"] = Instance.new("UIStroke", Button["22"]);
					Button["28"]["Color"] = Color3.fromRGB(50, 50, 58);
					Button["28"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				end

				--Methods
				do
					function Button:Destroy()
						for i, v in pairs(Button) do
							if typeof(v) == "boolean" and v then
								v = false
							end 
						end
						Library:tween(Button["22"], {Transparency = 1})
						wait(0.2)
						Button["22"]:Destroy()
						Section:Update()
					end
					
					
					function Button:SetText(text)
						Button["23"].Text = text
					end

					function Button:SetCallback(fn)
						options.callback = fn
					end

				end

				--logic
				do
					Button["22"].MouseEnter:Connect(function()
						Button.Hover = true
						Section.HoverChild = true
						Library:tween(Button["28"], {Color = Color3.fromRGB(70, 70, 78)})
					end)

					Button["22"].MouseLeave:Connect(function()
						Button.Hover = false
						if not Button.MouseDown then
							Section.HoverChild = false
							Library:tween(Button["28"], {Color = Color3.fromRGB(50, 50, 58)})
							--Library:tween(Button["22"], {BackgroundColor3 = Color3.fromRGB(26, 26, 30)})
						end
					end)
				end

				Button["22"].InputBegan:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["28"], {Color = Color3.fromRGB(80, 80, 88)})
						Library:tween(Button["22"], {BackgroundColor3 = Color3.fromRGB(46, 46, 50)})
					end			
				end)


				uis.InputEnded:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.MouseDown then
						Library:tween(Button["28"], {Color = Color3.fromRGB(50, 50, 58)})
						Button.MouseDown = false
						options.callback()
					end
					if Button.Hover then
						Library:tween(Button["28"], {Color = Color3.fromRGB(70, 70, 78)})
						Library:tween(Button["22"], {BackgroundColor3 = Color3.fromRGB(26, 26, 30)})
					
					elseif not Button.MouseDown or Button.MouseDown then
						Library:tween(Button["28"], {Color = Color3.fromRGB(50, 50, 58)})
						Library:tween(Button["22"], {BackgroundColor3 = Color3.fromRGB(26, 26, 30)})
					end
				end)

				return Button
			end

			function Section:Label(options)
				options = Library:Validate({
					name = "Label",
					icon = true,
					centerText = false,
				}, options or {})


				local Label = {}	

				--Render
				do 
					-- StarterGui.ScreenGui.MainFrame.ContentCointainer.HomeTab.Label
					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label
					Label["62"] = Instance.new("Frame", Section["73"]);
					Label["62"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 30);
					Label["62"]["Size"] = UDim2.new(1, 0, 0, 30);
					Label["62"]["Name"] = [[Label]];
					Label["62"]["ClipsDescendants"] = true;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.Title
					Label["63"] = Instance.new("TextLabel", Label["62"]);
					Label["63"]["BorderSizePixel"] = 0;
					if options.centerText then
						Label["63"]["TextXAlignment"] = Enum.TextXAlignment.Center;
					else
						Label["63"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					end
					Label["63"]["TextYAlignment"] = Enum.TextYAlignment.Center;
					Label["63"]["ClipsDescendants"] = true;
					Label["63"]["TextWrapped"] = true;
					Label["63"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					Label["63"]["TextSize"] = 16;
					Label["63"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Label["63"]["Size"] = UDim2.new(1, 0, 1, 0);
					Label["63"]["Name"] = options.name
					Label["63"]["Text"] = options.name
					Label["63"]["Font"] = Enum.Font.Nunito;
					Label["63"]["BackgroundTransparency"] = 1;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.Title.UIStroke
					Label["64"] = Instance.new("UIStroke", Label["63"]);


					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.Title.UIPadding
					Label["65"] = Instance.new("UIPadding", Label["63"]);
					if options.icon then
						Label["65"]["PaddingLeft"] = UDim.new(0, 29);
						Label["65"]["PaddingRight"] = UDim.new(0, 8);
					else
						Label["65"]["PaddingLeft"] = UDim.new(0, 8);
						Label["65"]["PaddingRight"] = UDim.new(0, 8);
						if (not options.icon) and (options.centerText) then
							Label["65"]["PaddingLeft"] = UDim.new(0, 2)
							Label["65"]["PaddingRight"] = UDim.new(0, 8);
						end
					end

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.UIPadding
					Label["66"] = Instance.new("UIPadding", Label["62"]);
					Label["66"]["PaddingTop"] = UDim.new(0, 7);
					Label["66"]["PaddingRight"] = UDim.new(0, 2);
					Label["66"]["PaddingBottom"] = UDim.new(0, 7);
					Label["66"]["PaddingLeft"] = UDim.new(0, 2);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.UICorner
					Label["67"] = Instance.new("UICorner", Label["62"]);
					Label["67"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.UIStroke
					Label["68"] = Instance.new("UIStroke", Label["62"]);
					Label["68"]["Color"] = Color3.fromRGB(50, 50, 58);
					Label["68"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					if options.icon then
						-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.Label
						Label["69"] = Instance.new("ImageLabel", Label["62"]);
						Label["69"]["BorderSizePixel"] = 0;
						Label["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Label["69"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Label["69"]["Image"] = [[rbxassetid://11954508977]];
						Label["69"]["Size"] = UDim2.new(0, 16, 0, 16);
						Label["69"]["Name"] = [[Label]];
						Label["69"]["BackgroundTransparency"] = 1;
						Label["69"]["Position"] = UDim2.new(0, 15, 0, 8);
					end
				end

				--Methods
				
				function Label:Destroy()
					for i, v in pairs(Label) do
						if typeof(v) == "boolean" and v then
							v = false
						end 
					end
					Library:tween(Label["62"], {Transparency = 1})
					wait(0.2)
					Label["62"]:Destroy()
					Section:Update()
				end
				
				function Label:SetText(text)
					options.name = text
					Label:_update()
				end

				function Label:_update()
					Label["63"].Text = options.name

					Label["63"].Size = UDim2.new(Label["63"].Size.X.Scale, Label["63"].Size.X.Offset, 0, math.huge)
					Label["63"].Size = UDim2.new(Label["63"].Size.X.Scale, Label["63"].Size.X.Offset, 0, Label["63"].TextBounds.Y)
					Library:tween(Label["62"], {Size = UDim2.new(Label["62"].Size.X.Scale, Label["62"].Size.X.Offset, 0, Label["63"].TextBounds.Y + 13)})
					Section:Update()
				end

				Label:_update()
				
				--logic
				do
					Label["62"].MouseEnter:Connect(function()
						Section.HoverChild = true
					end)

					Label["62"].MouseLeave:Connect(function()
						Section.HoverChild = false
					end)
				end

				return Label
			end

			function Section:Slider(options)
				options = Library:Validate({
					name = "Slider",
					min = 0,
					max = 100,
					deafult = 50,
					Deafult2 = nil,
					callback = function(v) print(v) end
				}, options or {})

				local Slider = {
					MouseDown = false,
					Hover = false,
					Connection = nil,
					Options = options
				}

				do --render
					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider
					Slider["41"] = Instance.new("Frame", Section["73"]);
					Slider["41"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 30);
					Slider["41"]["Size"] = UDim2.new(1, 0, 0, 40);
					Slider["41"]["Name"] = [[Slider]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Title
					Slider["42"] = Instance.new("TextLabel", Slider["41"]);
					Slider["42"]["BorderSizePixel"] = 0;
					Slider["42"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Slider["42"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					Slider["42"]["TextSize"] = 16;
					Slider["42"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["42"]["Size"] = UDim2.new(1, 0, 0, 20);
					Slider["42"]["Text"] = options.name;
					Slider["42"]["Name"] = options.name;
					Slider["42"]["Font"] = Enum.Font.Nunito;
					Slider["42"]["BackgroundTransparency"] = 1;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Title.UIStroke
					Slider["43"] = Instance.new("UIStroke", Slider["42"]);
					Slider["43"]["Thickness"] = 0.699999988079071;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.UIPadding
					Slider["44"] = Instance.new("UIPadding", Slider["41"]);
					Slider["44"]["PaddingLeft"] = UDim.new(0, 8);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.UICorner
					Slider["45"] = Instance.new("UICorner", Slider["41"]);
					Slider["45"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.UIStroke
					Slider["46"] = Instance.new("UIStroke", Slider["41"]);
					Slider["46"]["Color"] = Color3.fromRGB(50, 50, 58);
					Slider["46"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Value
					Slider["47"] = Instance.new("TextLabel", Slider["41"]);
					Slider["47"]["BorderSizePixel"] = 0;
					Slider["47"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					Slider["47"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					Slider["47"]["TextSize"] = 16;
					Slider["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["47"]["Size"] = UDim2.new(0, 25, 0, 20);
					Slider["47"]["Text"] = tostring(options.deafult);
					Slider["47"]["Name"] = [[Value]];
					Slider["47"]["Font"] = Enum.Font.Nunito;
					Slider["47"]["BackgroundTransparency"] = 1;
					Slider["47"]["Position"] = UDim2.new(1, -25, 0, 0);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Value.UIStroke
					Slider["48"] = Instance.new("UIStroke", Slider["47"]);
					Slider["48"]["Thickness"] = 0.699999988079071;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Value.UIPadding
					Slider["49"] = Instance.new("UIPadding", Slider["47"]);
					Slider["49"]["PaddingRight"] = UDim.new(0, 6);
					Slider["49"]["PaddingLeft"] = UDim.new(0, 8);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.SliderBack
					Slider["4a"] = Instance.new("Frame", Slider["41"]);
					Slider["4a"]["BorderSizePixel"] = 0;
					Slider["4a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["4a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["4a"]["Size"] = UDim2.new(0, 250, 0, 5);
					Slider["4a"]["Position"] = UDim2.new(0, 125, 1, -15);
					Slider["4a"]["Name"] = [[SliderBack]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.SliderBack.UICorner
					Slider["4b"] = Instance.new("UICorner", Slider["4a"]);
					Slider["4b"]["CornerRadius"] = UDim.new(0, 2);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.SliderBack.UIStroke
					Slider["4c"] = Instance.new("UIStroke", Slider["4a"]);
					Slider["4c"]["Color"] = Color3.fromRGB(50, 50, 58);
					Slider["4c"]["Thickness"] = 0.699999988079071;
					Slider["4c"]["Transparency"] = 0.5;
					Slider["4c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.SliderBack.Draggable
					Slider["4d"] = Instance.new("Frame", Slider["4a"]);
					Slider["4d"]["BorderSizePixel"] = 0;
					Slider["4d"]["BackgroundColor3"] = Color3.fromRGB(123, 145, 191);
					Slider["4d"]["Size"] = UDim2.new(0, 125, 0, 5);
					Slider["4d"]["Name"] = [[Draggable]];
				end
				if options.Deafult2 ~= nil then
					Library.Config[options.name] = options.Deafult2
					options.callback(options.Deafult2)
				else
					Library.Config[options.name] = options.deafult
				end
				--methods
				
				function Slider:Destroy()
					for i, v in pairs(Slider) do
						if typeof(v) == "boolean" and v then
							v = false
						end 
					end
					Library:tween(Slider["41"], {Transparency = 1})
					wait(0.2)
					Slider["41"]:Destroy()
					Section:Update()
				end
				
				function Slider:SetValue(v)
					if v == nil then
						local percentage = math.clamp((Mouse.X - Slider["4a"].AbsolutePosition.X) / (Slider["4a"].AbsoluteSize.X), 0, 1)
						local value = math.floor(((options.max - options.min) * percentage) + options.min)
						Slider["47"].Text = tostring(value)

						Slider["4d"].Size = UDim2.fromScale(percentage, 1)
					else
						Slider["47"].Text = tostring(v)
						Slider["4d"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)

					end
					options.callback(Slider:GetValue())
					Library.Config[options.name] = Slider:GetValue()
				end

				function Slider:GetValue(v)
					return tonumber(Slider["47"].Text)
				end
				
				if options.Deafult2 then
					Slider:SetValue(options.Deafult2)
					Library.Config[options.name] = options.Deafult2
				end
				
				-- logic
				do
					Slider["41"].MouseEnter:Connect(function()
						Slider.Hover = true
						Section.HoverChild = true
						Library:tween(Slider["46"], {Color = Color3.fromRGB(70, 70, 78)})
						Library:tween(Slider["4c"], {Color = Color3.fromRGB(70, 70, 78)})
						Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
					end)

					Slider["41"].MouseLeave:Connect(function()
						Slider.Hover = false
						if not Slider.MouseDown then
							Section.HoverChild = false
							Library:tween(Slider["46"], {Color = Color3.fromRGB(50, 50, 58)})
							Library:tween(Slider["4c"], {Color = Color3.fromRGB(50, 50, 58)})
							Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
						end
					end)


					Slider["41"].InputBegan:Connect(function(input, gpe)
						if not GUI["1"].Enabled then return end
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover  then
							Slider.MouseDown = true
							Library:tween(Slider["4c"], {Color = Color3.fromRGB(90, 90, 98)})
							Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(143, 165, 211)})

							if not Slider.Connection then
								Slider.Connection = runService.RenderStepped:Connect(function()
									if not GUI["1"].Enabled then
										Slider.Connection:Disconnect()
										Slider.Connection = nil	
										if Slider.Hover then
											Library:tween(Slider["46"], {Color = Color3.fromRGB(70, 70, 78)})
											Library:tween(Slider["4c"], {Color = Color3.fromRGB(70, 70, 78)})
											Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
										else 
											--reset
											Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
											Library:tween(Slider["46"], {Color = Color3.fromRGB(50, 50, 58)})
											Library:tween(Slider["4c"], {Color = Color3.fromRGB(50, 50, 58)})
										end
									end
									Slider:SetValue()
								end)
							end
						end			
					end)


					uis.InputEnded:Connect(function(input, gpe)
						if not GUI["1"].Enabled then return end
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.MouseDown then
							Slider.MouseDown = false

							if Slider.Connection then Slider.Connection:Disconnect()
								Slider.Connection = nil
							end	
							if Slider.Hover then
								Library:tween(Slider["46"], {Color = Color3.fromRGB(70, 70, 78)})
								Library:tween(Slider["4c"], {Color = Color3.fromRGB(70, 70, 78)})
								Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
							else 
								--reset
								Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
								Library:tween(Slider["46"], {Color = Color3.fromRGB(50, 50, 58)})
								Library:tween(Slider["4c"], {Color = Color3.fromRGB(50, 50, 58)})
							end
						end


					end)


				end

				return Slider
			end

			function Section:Toggle(options)
				options = Library:Validate({
					name = "Toggle",
					deafult = false,
					callback = function(v) print(v) end
				}, options or {})

				local Toggle = {
					Hover = false,
					MouseDown = false,
					State = false,
				}

				-- render
				do 
					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive
					Toggle["6a"] = Instance.new("Frame", Section["73"]);
					Toggle["6a"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 30);
					Toggle["6a"]["Size"] = UDim2.new(1, 0, 0, 30);
					Toggle["6a"]["Name"] = [[ToggleInActive]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Title
					Toggle["6b"] = Instance.new("TextLabel", Toggle["6a"]);
					Toggle["6b"]["BorderSizePixel"] = 0;
					Toggle["6b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["6b"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					Toggle["6b"]["TextSize"] = 16;
					Toggle["6b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["6b"]["Size"] = UDim2.new(1, 0, 1, 0);
					Toggle["6b"]["Text"] = options.name;
					Toggle["6b"]["Name"] = options.name;
					Toggle["6b"]["Font"] = Enum.Font.Nunito;
					Toggle["6b"]["BackgroundTransparency"] = 1;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Title.UIStroke
					Toggle["6c"] = Instance.new("UIStroke", Toggle["6b"]);
					Toggle["6c"]["Thickness"] = 0.699999988079071;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.UIPadding
					Toggle["6d"] = Instance.new("UIPadding", Toggle["6a"]);
					Toggle["6d"]["PaddingLeft"] = UDim.new(0, 10);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.UICorner
					Toggle["6e"] = Instance.new("UICorner", Toggle["6a"]);
					Toggle["6e"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.UIStroke
					Toggle["6f"] = Instance.new("UIStroke", Toggle["6a"]);
					Toggle["6f"]["Color"] = Color3.fromRGB(50, 50, 58);
					Toggle["6f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Checkmark Container
					Toggle["70"] = Instance.new("Frame", Toggle["6a"]);
					Toggle["70"]["BorderSizePixel"] = 0;
					Toggle["70"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 40);
					Toggle["70"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["70"]["Size"] = UDim2.new(0, 16, 0, 16);
					Toggle["70"]["Position"] = UDim2.new(1, -16, 0.5, 0);
					Toggle["70"]["Name"] = [[Checkmark Container]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Checkmark Container.Checkmark
					Toggle["71"] = Instance.new("ImageLabel", Toggle["70"]);
					Toggle["71"]["BorderSizePixel"] = 0;
					Toggle["71"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["71"]["Size"] = UDim2.new(0, 14, 0, 14);
					Toggle["71"]["Name"] = [[Checkmark]];
					Toggle["71"]["BackgroundTransparency"] = 1;
					Toggle["71"]["Position"] = UDim2.new(1, -8, 0, 8);
					Toggle["71"]["Image"] = "";

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Checkmark Container.UICorner
					Toggle["72"] = Instance.new("UICorner", Toggle["70"]);
					Toggle["72"]["CornerRadius"] = UDim.new(0, 2);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Checkmark Container.UIStroke
					Toggle["73"] = Instance.new("UIStroke", Toggle["70"]);
					Toggle["73"]["Color"] = Color3.fromRGB(50, 50, 58);
					Toggle["73"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				end
				Library.Config[options.name] = Toggle.State
				-- Methods
				do
					function Toggle:Destroy()
						for i, v in pairs(Toggle) do
							if typeof(v) == "boolean" and v then
								v = false
							end 
						end
						Library:tween(Toggle["6a"], {Transparency = 1})
						wait(0.2)
						Toggle["6a"]:Destroy()
						Section:Update()
					end
					
					function Toggle:Toggle(b)
						if b == nil then
							Toggle.State = not Toggle.State
						else 
							Toggle.State = b 
						end

						if Toggle.State then
							Library:tween(Toggle["70"], {BackgroundColor3 = Color3.fromRGB(34, 34, 40)})
							Toggle["71"].Image = "rbxassetid://11956641232"
						else
							Library:tween(Toggle["73"], {Color = Color3.fromRGB(34, 34, 40)})
							Toggle["71"].Image = ""
						end
						options.callback(Toggle.State)
						Library.Config[options.name] = Toggle.State
					end
					
					function Toggle:SetText(text)
						Toggle["6b"].Text = text	
					end
				end
				
				if options.deafult then
					Toggle:Toggle(true)
					Library.Config[options.name] = Toggle.State
				end
				--logic
				do
					Toggle["6a"].MouseEnter:Connect(function()
						Toggle.Hover = true
						Section.HoverChild = true
						Library:tween(Toggle["6f"], {Color = Color3.fromRGB(70, 70, 78)})
						Library:tween(Toggle["73"], {Color = Color3.fromRGB(70, 70, 78)})	
					end)

					Toggle["6a"].MouseLeave:Connect(function()
						Toggle.Hover = false
						if not Toggle.MouseDown then
							Section.HoverChild = false
							Library:tween(Toggle["6f"], {Color = Color3.fromRGB(50, 50, 58)})
							Library:tween(Toggle["73"], {Color = Color3.fromRGB(50, 50, 58)})	
						end
					end)

					Toggle["6a"].InputBegan:Connect(function(input, gpe)
						if not GUI["1"].Enabled then return end
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
							Toggle.MouseDown = true
							Library:tween(Toggle["6f"], {Color = Color3.fromRGB(80, 80, 88)})
							Library:tween(Toggle["73"], {Color = Color3.fromRGB(80, 80, 88)})	
						end			
					end)


					uis.InputEnded:Connect(function(input, gpe)
						if not GUI["1"].Enabled then return end
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.MouseDown then
							Toggle.MouseDown = false

							if Toggle.Hover then
								Library:tween(Toggle["6f"], {Color = Color3.fromRGB(70, 70, 78)})
								Library:tween(Toggle["73"], {Color = Color3.fromRGB(70, 70, 78)})	
							else
								--reset
								Library:tween(Toggle["6f"], {Color = Color3.fromRGB(50, 50, 58)})
								Library:tween(Toggle["73"], {Color = Color3.fromRGB(50, 50, 58)})
							end
						end			
					end)
				end

				uis.InputEnded:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.MouseDown then
						Toggle:Toggle()	
					end
				end)


				return Toggle	
			end

			function Section:Dropdown(options)
				options = Library:Validate({
					name = "Deafult",
					deafult = nil, 
					callback = function(v) print(v) end,
					items = {}
				}, options or {})

	
				
				local Dropdown = {
					Items = {
						["id"] = {
							{},
							"Value"
						}
					},
					Open = false,
					MouseDown = false,
					Hover = false,
					HoveringItem = false,
				}			


				--render
				do

					Dropdown["2b"] = Instance.new("Frame", Section["73"]);
					Dropdown["2b"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 30);
					Dropdown["2b"]["Size"] = UDim2.new(1, 0, 0, 30);
					Dropdown["2b"]["ClipsDescendants"] = true;
					Dropdown["2b"]["Position"] = UDim2.new(0, 0, 0.13475172221660614, 0);
					Dropdown["2b"]["Name"] = [[Dropdown]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Title
					Dropdown["2c"] = Instance.new("TextLabel", Dropdown["2b"]);
					Dropdown["2c"]["BorderSizePixel"] = 0;
					Dropdown["2c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Dropdown["2c"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					Dropdown["2c"]["TextSize"] = 16;
					Dropdown["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["2c"]["Size"] = UDim2.new(1, 0, 0, 30);
					Dropdown["2c"]["Text"] = options.name;
					Dropdown["2c"]["Name"] = options.name;
					Dropdown["2c"]["Font"] = Enum.Font.Nunito;
					Dropdown["2c"]["BackgroundTransparency"] = 1;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Title.UIStroke
					Dropdown["2d"] = Instance.new("UIStroke", Dropdown["2c"]);
					Dropdown["2d"]["Thickness"] = 0.699999988079071;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UIPadding
					Dropdown["2e"] = Instance.new("UIPadding", Dropdown["2b"]);
					Dropdown["2e"]["PaddingRight"] = UDim.new(0, 12);
					Dropdown["2e"]["PaddingLeft"] = UDim.new(0, 10);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UICorner
					Dropdown["2f"] = Instance.new("UICorner", Dropdown["2b"]);
					Dropdown["2f"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UIStroke
					Dropdown["30"] = Instance.new("UIStroke", Dropdown["2b"]);
					Dropdown["30"]["Color"] = Color3.fromRGB(50, 50, 58);
					Dropdown["30"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Dropdown
					Dropdown["31"] = Instance.new("ImageLabel", Dropdown["2b"]);
					Dropdown["31"]["BorderSizePixel"] = 0;
					Dropdown["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["31"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["31"]["Image"] = [[rbxassetid://11954728818]];
					Dropdown["31"]["Size"] = UDim2.new(0, 16, 0, 16);
					Dropdown["31"]["Name"] = [[Dropdown]];
					Dropdown["31"]["BackgroundTransparency"] = 1;
					Dropdown["31"]["Position"] = UDim2.new(1, -3, 0, 15);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder
					Dropdown["32"] = Instance.new("Frame", Dropdown["2b"]);
					Dropdown["32"]["BorderSizePixel"] = 0;
					Dropdown["32"]["BackgroundColor3"] = Color3.fromRGB(73, 73, 73);
					Dropdown["32"]["BackgroundTransparency"] = 1;
					Dropdown["32"]["Size"] = UDim2.new(1, -15, 1, -30);
					Dropdown["32"]["ClipsDescendants"] = true;
					Dropdown["32"]["Position"] = UDim2.new(0, 5, 0, 30);
					Dropdown["32"]["Name"] = [[OptionHolder]];
					Dropdown["32"]["Visible"] = true;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.UIListLayout
					Dropdown["33"] = Instance.new("UIListLayout", Dropdown["32"]);
					Dropdown["33"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					Dropdown["33"]["Padding"] = UDim.new(0, 5);
					Dropdown["33"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.UIPadding
					Dropdown["34"] = Instance.new("UIPadding", Dropdown["32"]);
					Dropdown["34"]["PaddingTop"] = UDim.new(0, 4);
					Dropdown["34"]["PaddingRight"] = UDim.new(0, 4);
					Dropdown["34"]["PaddingLeft"] = UDim.new(0, 4);

				end


				--Methods
				function Dropdown:Destroy()
					for i, v in pairs(Dropdown) do
						if typeof(v) == "boolean" and v then
							v = false
						end 
					end
					Library:tween(Dropdown["2b"], {Transparency = 1})
					wait(0.2)
					Dropdown["2b"]:Destroy()
					Section:Update()
				end
				
				function Dropdown:Toggle()
					if Dropdown.Open then
						Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30)})
						Section:Update()
					else
						local count = 0
						for i, v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end
						Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30 + (count * 25) - 14)})
						Section:Update()
					end
					Dropdown.Open = not Dropdown.Open
				end


				function Dropdown:Add(id, value)
					local Item = {
						Hover = false,
						MouseDown = false,
					}

					if Dropdown.Items[id] ~= nil then
						return
					end

					-- StarterGui.ScreenGui.MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive
					Dropdown.Items[id] = {
						instance = {},
						value = value
					}

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive
					Dropdown.Items[id].instance["39"] = Instance.new("TextLabel", Dropdown["32"]);
					Dropdown.Items[id].instance["39"]["BorderSizePixel"] = 0;
					Dropdown.Items[id].instance["39"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
					Dropdown.Items[id].instance["39"]["TextSize"] = 14;
					Dropdown.Items[id].instance["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown.Items[id].instance["39"]["Size"] = UDim2.new(1, 0, 0, 20);
					Dropdown.Items[id].instance["39"]["Text"] = id;
					Dropdown.Items[id].instance["39"]["Name"] = id;
					Dropdown.Items[id].instance["39"]["Font"] = Enum.Font.SourceSans;
					Dropdown.Items[id].instance["39"]["BackgroundTransparency"] = 0.6000000238418579;
					Dropdown.Items[id].instance["39"]["Position"] = UDim2.new(0, 8, 0, 0);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UIStroke
					Dropdown.Items[id].instance["3a"] = Instance.new("UIStroke", Dropdown.Items[id].instance["39"]);


					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UICorner
					Dropdown.Items[id].instance["3b"] = Instance.new("UICorner", Dropdown.Items[id].instance["39"]);
					Dropdown.Items[id].instance["3b"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UIStroke
					Dropdown.Items[id].instance["3c"] = Instance.new("UIStroke", Dropdown.Items[id].instance["39"]);
					Dropdown.Items[id].instance["3c"]["Color"] = Color3.fromRGB(37, 37, 37);
					Dropdown.Items[id].instance["3c"]["Thickness"] = 1;
					Dropdown.Items[id].instance["3c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					
					if options.deafult ~= nil then 
						if Dropdown.Items[options.deafult] then
							Library.Config[options.name] = options.deafult
							options.callback(options.deafult)
							Library:tween(Dropdown.Items[options.deafult].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
							Library:tween(Dropdown.Items[options.deafult].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							Dropdown["2c"]["Text"] = options.name .. " | " .. options.deafult 
						end
					end
					
					Dropdown.Items[id].instance["39"].MouseEnter:Connect(function()
						Item.Hover = true
						Dropdown.HoveringItem = true
						Section.HoverChild = true
						Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(57, 57, 57)})
					end)

					Dropdown.Items[id].instance["39"].MouseLeave:Connect(function()
						Item.Hover = false
						Dropdown.HoveringItem = false
						Section.HoverChild = false
						if Dropdown.Items[id].instance["39"]["BackgroundColor3"] == Color3.fromRGB(17, 17, 17) then
							Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
						else
							Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
						end
					end)

					Dropdown.Items[id].instance["39"].InputBegan:Connect(function(input, gpe)
						if not GUI["1"].Enabled then return end
						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
							Item.MouseDown = true
							Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
							Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})

						else if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.HoveringItem then
								Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
								Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(17, 17, 17)})	
							end
						end	
					end)


					uis.InputEnded:Connect(function(input, gpe)
						
						if not GUI["1"].Enabled then return end
						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Item.MouseDown = false

							if Item.Hover then
								options.callback(id)
								Library.Config[options.name] = id
								Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
								Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
								Dropdown["2c"]["Text"] = options.name .. " | " .. id 

							else if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.HoveringItem then
									Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
									Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(17, 17, 17)})	
								end
							end


						end			
					end)
				end
				
				
				function Dropdown:Remove(id)
					if Dropdown.Items[id] ~= nil then
						if Dropdown.Items[id].instance ~= nil then
							if id ~= nil then
								for i, v in pairs(Dropdown.Items[id].instance)  do
									v:Destroy()
								end
							end
						end
						Dropdown.Items[id] = nil
						local count = 0
						for i, v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end
						if Dropdown.Open then
							Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30 + (count * 25) - 14)})
						end
					end
				end

				function Dropdown:Clear(id)
					for i, v in pairs(Dropdown.Items)  do
						Dropdown:Remove(i)
					end
				end


				--logic
				Dropdown["2b"].MouseEnter:Connect(function()
					Dropdown.Hover = true
					Section.HoverChild = true
					Library:tween(Dropdown["30"], {Color = Color3.fromRGB(70, 70, 78)})
				end)

				Dropdown["2b"].MouseLeave:Connect(function()
					Dropdown.Hover = false
					if not Dropdown.MouseDown then
						Section.HoverChild = false
						Library:tween(Dropdown["30"], {Color = Color3.fromRGB(50, 50, 58)})
						Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(26, 26, 30)})
					end
				end)

				Dropdown["2b"].InputBegan:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true
						if not Dropdown.HoveringItem then
							Library:tween(Dropdown["30"], {Color = Color3.fromRGB(80, 80, 88)})
							Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(46, 46, 50)})
						end
					end			
				end)


				uis.InputEnded:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.MouseDown then
						Dropdown.MouseDown = false

						if Dropdown.Hover then
							Library:tween(Dropdown["30"], {Color = Color3.fromRGB(70, 70, 78)})
							Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(26, 26, 30)})
		                else
							--reset
							Library:tween(Dropdown["30"], {Color = Color3.fromRGB(50, 50, 58)})
							Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(26, 26, 30)})
						end
					end			
				end)

				uis.InputEnded:Connect(function(input, gpe)
					
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if (not Dropdown.HoveringItem) and (Dropdown.MouseDown) then
							Dropdown:Toggle()
						end
					end
				end)





				return Dropdown
			end

			function Section:TextBox(options)
				options = Library:Validate({
					name = "TextBox",
					PlaceHolder = "...",
					deafult = nil,
					callback = function(v) print(v) end
				}, options or {})

				local TextBox = {
					Hover = false,
					HoverHover = false,
					MouseDown = false,
				}

				--render
				do
					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox
					TextBox["4e"] = Instance.new("Frame", Section["73"]);
					TextBox["4e"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 29);
					TextBox["4e"]["Size"] = UDim2.new(1, 0, 0, 30);
					TextBox["4e"]["Name"] = [[TextBox]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.UIPadding
					TextBox["4f"] = Instance.new("UIPadding", TextBox["4e"]);
					TextBox["4f"]["PaddingRight"] = UDim.new(0, 8);
					TextBox["4f"]["PaddingLeft"] = UDim.new(0, 10);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.UICorner
					TextBox["50"] = Instance.new("UICorner", TextBox["4e"]);
					TextBox["50"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.UIStroke
					TextBox["51"] = Instance.new("UIStroke", TextBox["4e"]);
					TextBox["51"]["Color"] = Color3.fromRGB(50, 50, 58);
					TextBox["51"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.TextBox
					TextBox["52"] = Instance.new("TextBox", TextBox["4e"]);
					TextBox["52"]["CursorPosition"] = -1;
					TextBox["52"]["BorderSizePixel"] = 0;
					TextBox["52"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["52"]["TextSize"] = 11;
					TextBox["52"]["BackgroundColor3"] = Color3.fromRGB(38, 38, 44);
					TextBox["52"]["PlaceholderText"] = options.PlaceHolder;
					TextBox["52"]["Size"] = UDim2.new(0, 100, 1, -12);
					TextBox["52"]["ClipsDescendants"] = true;
					TextBox["52"]["Text"] = [[]];
					TextBox["52"]["Position"] = UDim2.new(1, -98, 0, 7);
					TextBox["52"]["Font"] = Enum.Font.Ubuntu;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.TextBox.UICorner
					TextBox["53"] = Instance.new("UICorner", TextBox["52"]);
					TextBox["53"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.TextBox.UIStroke
					TextBox["54"] = Instance.new("UIStroke", TextBox["52"]);
					TextBox["54"]["Thickness"] = 0.75;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.Title
					TextBox["55"] = Instance.new("TextLabel", TextBox["4e"]);
					TextBox["55"]["BorderSizePixel"] = 0;
					TextBox["55"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					TextBox["55"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					TextBox["55"]["TextSize"] = 16;
					TextBox["55"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["55"]["Size"] = UDim2.new(1, 0, 1, 0);
					TextBox["55"]["Text"] = options.name;
					TextBox["55"]["Name"] = options.name;
					TextBox["55"]["Font"] = Enum.Font.Nunito;
					TextBox["55"]["BackgroundTransparency"] = 1;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.Title.UIStroke
					TextBox["56"] = Instance.new("UIStroke", TextBox["55"]);
					TextBox["56"]["Thickness"] = 0.699999988079071;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.Title.UIPadding
					TextBox["57"] = Instance.new("UIPadding", TextBox["55"]);
				end
				
				if options.deafult ~= nil then
					Library.Config[options.name] = options.deafult
					options.callback(options.deafult)
					TextBox["52"].Text = options.deafult
				end
				
				--Methods
				do
					function TextBox:Destroy()
						for i, v in pairs(TextBox) do
							if typeof(v) == "boolean" and v then
								v = false
							end 
						end
						Library:tween(TextBox["4e"], {Transparency = 1})
						wait(0.2)
						TextBox["4e"]:Destroy()
						Section:Update()
					end
					
					
				end
				--Logic
				do

					TextBox["4e"].MouseEnter:Connect(function()
						TextBox.Hover = true
						Section.HoverChild = true
						Library:tween(TextBox["51"], {Color = Color3.fromRGB(70, 70, 78)})
					end)

					TextBox["4e"].MouseLeave:Connect(function()
						TextBox.Hover = false
						Section.HoverChild = false
						Library:tween(TextBox["51"], {Color = Color3.fromRGB(50, 50, 58)})
						Library:tween(TextBox["4e"], {BackgroundColor3 = Color3.fromRGB(25, 25, 29)})
					end)

					TextBox["52"].MouseEnter:Connect(function()
						TextBox.HoverHover = true
					end)

					TextBox["52"].MouseLeave:Connect(function()
						TextBox.HoverHover = false
					end)

					TextBox["52"].InputBegan:Connect(function(input, gpe)
						if not GUI["1"].Enabled then return end
						if input.UserInputType == Enum.UserInputType.MouseButton1 and TextBox.HoverHover then
							TextBox.MouseDown = true
							Library:tween(TextBox["51"], {Color = Color3.fromRGB(90, 90, 98)})
							Library:tween(TextBox["52"], {BackgroundColor3 = Color3.fromRGB(58, 58, 54)})
						end			
					end)


					uis.InputEnded:Connect(function(input, gpe)
						if not GUI["1"].Enabled then return end
						if input.UserInputType == Enum.UserInputType.MouseButton1 and TextBox.MouseDown then
							TextBox.MouseDown = false
							if TextBox.HoverHover  then
								Library:tween(TextBox["51"], {Color = Color3.fromRGB(70, 70, 78)})
								Library:tween(TextBox["52"], {BackgroundColor3 = Color3.fromRGB(38, 38, 44)})
							else
								--reset
								Library:tween(TextBox["51"], {Color = Color3.fromRGB(50, 50, 58)})
								Library:tween(TextBox["52"], {BackgroundColor3 = Color3.fromRGB(38, 38, 44)})
							end
						end			
					end)
				end

				TextBox["52"].Focused:Connect(function()
					GUI.TextboxFocus = true
				end)

				TextBox["52"].FocusLost:Connect(function(textbox)
					GUI.TextboxFocus = false
					local TextBoxTXT = TextBox["52"].Text
					options.callback(TextBoxTXT)
					Library.Config[options.name] = TextBoxTXT
				end)

				return TextBox
			end
			
			function Section:MultiDropdown(options)
				options = Library:Validate({
					name = "Deafult",
					deafult = nil, 
					callback = function(v) print(v) end,
					items = {}
				}, options or {})

				local tableItems = {}

				local Dropdown = {
					Items = {
						["id"] = {
							{},
							"Value"
						}
					},
					Open = false,
					MouseDown = false,
					Hover = false,
					HoveringItem = false,
				}			


				--render
				do

					Dropdown["2b"] = Instance.new("Frame", Section["73"]);
					Dropdown["2b"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 30);
					Dropdown["2b"]["Size"] = UDim2.new(1, 0, 0, 30);
					Dropdown["2b"]["ClipsDescendants"] = true;
					Dropdown["2b"]["Position"] = UDim2.new(0, 0, 0.13475172221660614, 0);
					Dropdown["2b"]["Name"] = [[Dropdown]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Title
					Dropdown["2c"] = Instance.new("TextLabel", Dropdown["2b"]);
					Dropdown["2c"]["BorderSizePixel"] = 0;
					Dropdown["2c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Dropdown["2c"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					Dropdown["2c"]["TextSize"] = 16;
					Dropdown["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["2c"]["Size"] = UDim2.new(1, 0, 0, 30);
					Dropdown["2c"]["Text"] = options.name;
					Dropdown["2c"]["Name"] = options.name;
					Dropdown["2c"]["Font"] = Enum.Font.Nunito;
					Dropdown["2c"]["BackgroundTransparency"] = 1;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Title.UIStroke
					Dropdown["2d"] = Instance.new("UIStroke", Dropdown["2c"]);
					Dropdown["2d"]["Thickness"] = 0.699999988079071;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UIPadding
					Dropdown["2e"] = Instance.new("UIPadding", Dropdown["2b"]);
					Dropdown["2e"]["PaddingRight"] = UDim.new(0, 12);
					Dropdown["2e"]["PaddingLeft"] = UDim.new(0, 10);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UICorner
					Dropdown["2f"] = Instance.new("UICorner", Dropdown["2b"]);
					Dropdown["2f"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UIStroke
					Dropdown["30"] = Instance.new("UIStroke", Dropdown["2b"]);
					Dropdown["30"]["Color"] = Color3.fromRGB(50, 50, 58);
					Dropdown["30"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Dropdown
					Dropdown["31"] = Instance.new("ImageLabel", Dropdown["2b"]);
					Dropdown["31"]["BorderSizePixel"] = 0;
					Dropdown["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["31"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["31"]["Image"] = [[rbxassetid://11954728818]];
					Dropdown["31"]["Size"] = UDim2.new(0, 16, 0, 16);
					Dropdown["31"]["Name"] = [[Dropdown]];
					Dropdown["31"]["BackgroundTransparency"] = 1;
					Dropdown["31"]["Position"] = UDim2.new(1, -3, 0, 15);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder
					Dropdown["32"] = Instance.new("Frame", Dropdown["2b"]);
					Dropdown["32"]["BorderSizePixel"] = 0;
					Dropdown["32"]["BackgroundColor3"] = Color3.fromRGB(73, 73, 73);
					Dropdown["32"]["BackgroundTransparency"] = 1;
					Dropdown["32"]["Size"] = UDim2.new(1, -15, 1, -30);
					Dropdown["32"]["ClipsDescendants"] = true;
					Dropdown["32"]["Position"] = UDim2.new(0, 5, 0, 30);
					Dropdown["32"]["Name"] = [[OptionHolder]];
					Dropdown["32"]["Visible"] = true;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.UIListLayout
					Dropdown["33"] = Instance.new("UIListLayout", Dropdown["32"]);
					Dropdown["33"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					Dropdown["33"]["Padding"] = UDim.new(0, 5);
					Dropdown["33"]["SortOrder"] = Enum.SortOrder.LayoutOrder
					
					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.UIPadding
					Dropdown["34"] = Instance.new("UIPadding", Dropdown["32"]);
					Dropdown["34"]["PaddingTop"] = UDim.new(0, 4);
					Dropdown["34"]["PaddingRight"] = UDim.new(0, 4);
					Dropdown["34"]["PaddingLeft"] = UDim.new(0, 4);

				end


				--Methods
				
				function Dropdown:Destroy()
					for i, v in pairs(Dropdown) do
						if typeof(v) == "boolean" and v then
							v = false
						end 
					end
					Library:tween(Dropdown["2b"], {Transparency = 1})
					wait(0.2)
					Dropdown["2b"]:Destroy()
					Section:Update()
				end
				
				function Dropdown:Toggle()
					if Dropdown.Open then
						Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30)})
						Section:Update()
					else
						local count = 0
						for i, v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end
						Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30 + (count * 25) - 14)})
						Section:Update()
					end
					Dropdown.Open = not Dropdown.Open
				end


				function Dropdown:Add(id, value)
					local Item = {
						Hover = false,
						MouseDown = false,
					}

					if Dropdown.Items[id] ~= nil then
						return
					end

					-- StarterGui.ScreenGui.MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive
					Dropdown.Items[id] = {
						instance = {},
						value = value
					}

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive
					Dropdown.Items[id].instance["39"] = Instance.new("TextLabel", Dropdown["32"]);
					Dropdown.Items[id].instance["39"]["BorderSizePixel"] = 0;
					Dropdown.Items[id].instance["39"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
					Dropdown.Items[id].instance["39"]["TextSize"] = 14;
					Dropdown.Items[id].instance["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown.Items[id].instance["39"]["Size"] = UDim2.new(1, 0, 0, 20);
					Dropdown.Items[id].instance["39"]["Text"] = id;
					Dropdown.Items[id].instance["39"]["Name"] = id;
					Dropdown.Items[id].instance["39"]["Font"] = Enum.Font.SourceSans;
					Dropdown.Items[id].instance["39"]["BackgroundTransparency"] = 0.6000000238418579;
					Dropdown.Items[id].instance["39"]["Position"] = UDim2.new(0, 8, 0, 0);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UIStroke
					Dropdown.Items[id].instance["3a"] = Instance.new("UIStroke", Dropdown.Items[id].instance["39"]);


					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UICorner
					Dropdown.Items[id].instance["3b"] = Instance.new("UICorner", Dropdown.Items[id].instance["39"]);
					Dropdown.Items[id].instance["3b"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UIStroke
					Dropdown.Items[id].instance["3c"] = Instance.new("UIStroke", Dropdown.Items[id].instance["39"]);
					Dropdown.Items[id].instance["3c"]["Color"] = Color3.fromRGB(37, 37, 37);
					Dropdown.Items[id].instance["3c"]["Thickness"] = 1;
					Dropdown.Items[id].instance["3c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					
					if options.deafult ~= nil then 
						Library.Config[options.name] = options.deafult
						options.callback(options.deafult)
						tableItems = options.deafult
						for i, v in pairs(options.deafult) do
							if Dropdown.Items[v] then
								Library:tween(Dropdown.Items[v].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
								Library:tween(Dropdown.Items[v].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							end
						end
					end
					
					Dropdown.Items[id].instance["39"].MouseEnter:Connect(function()
						Item.Hover = true
						Dropdown.HoveringItem = true
						Section.HoverChild = true
						
						Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(57, 57, 57)})
					end)

					Dropdown.Items[id].instance["39"].MouseLeave:Connect(function()
						Item.Hover = false
						Dropdown.HoveringItem = false

						if Dropdown.Items[id].instance["39"]["BackgroundColor3"] == Color3.fromRGB(17, 17, 17) then
							Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
						end
					end)

					uis.InputBegan:Connect(function(input, gpe)

						if not GUI["1"].Enabled then return end
						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
							Item.MouseDown = true
							--Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
							--Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
						end	
					end)


					uis.InputEnded:Connect(function(input, gpe)

						if not GUI["1"].Enabled then return end
						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Item.MouseDown = false

							if Item.Hover then
								if table.find(tableItems, id) then
									local index = table.find(tableItems, id)
									if index then
										table.remove(tableItems, index)
										options.callback(tableItems)
										Library.Config[options.name] = tableItems
										Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
										Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(17, 17, 17)})
									end
								else
									table.insert(tableItems, id)
									options.callback(tableItems)
									Library.Config[options.name] = tableItems
									Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
									Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
								end
							end

							--if table.find(tableItems, id) then
							--print(id)
							--Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
							--Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(17, 17, 17)})
							--end
						end			
					end)


				end


				function Dropdown:Remove(id)
					if Dropdown.Items[id] ~= nil then
						if Dropdown.Items[id].instance ~= nil then
							if id ~= nil then
								for i, v in pairs(Dropdown.Items[id].instance)  do
									v:Destroy()
								end
							end
						end
						Dropdown.Items[id] = nil
						local count = 0
						for i, v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end
						if Dropdown.Open then
							Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30 + (count * 25) - 14)})
						end
					end
				end

				function Dropdown:Clear(id)
					for i, v in pairs(Dropdown.Items)  do
						Dropdown:Remove(i)
					end
				end


				--logic
				Dropdown["2b"].MouseEnter:Connect(function()
					Dropdown.Hover = true
					Section.HoverChild = true
					Library:tween(Dropdown["30"], {Color = Color3.fromRGB(69, 69, 77)})
				end)

				Dropdown["2b"].MouseLeave:Connect(function()
					Dropdown.Hover = false
					if not Dropdown.MouseDown then
						Section.HoverChild = false
						Library:tween(Dropdown["30"], {Color = Color3.fromRGB(49, 49, 57)})
						Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(25, 25, 29)})
					end
				end)

				Dropdown["2b"].InputBegan:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true
						if not Dropdown.HoveringItem then
							Library:tween(Dropdown["30"], {Color = Color3.fromRGB(89, 89, 97)})
							Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(45, 45, 49)})
						end
					end			
				end)


				uis.InputEnded:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.MouseDown then
						Dropdown.MouseDown = false

						if Dropdown.Hover then
							Library:tween(Dropdown["30"], {Color = Color3.fromRGB(69, 69, 77)})
							Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(25, 25, 29)})
						else			
						--reset
							Library:tween(Dropdown["30"], {Color = Color3.fromRGB(45, 45, 52)})
							Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(25, 25, 29)})
						end
					end			
				end)

				uis.InputEnded:Connect(function(input, gpe)

					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if (not Dropdown.HoveringItem) and (Dropdown.MouseDown) then
							Dropdown:Toggle()
						end
					end
				end)





				return Dropdown
			end
			
			function Section:Keybind(options)
				options = Library:Validate({
					name = "Deafult",
					deafult = Enum.KeyCode.Unknown,
					callback = function(v) print(v) end,
					items = {}
				}, options or {})

				local Keybind = {
					Hover = false,
					MouseDown = false
				}			

				local blacklistedKeys = {
					Enum.KeyCode.W,
					Enum.KeyCode.S,
					Enum.KeyCode.A,
					Enum.KeyCode.D,
					Enum.KeyCode.Unknown
				}

				
				do-- render
					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind
					Keybind["be"] = Instance.new("Frame", Section["73"]);
					Keybind["be"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 30);
					Keybind["be"]["Size"] = UDim2.new(1, 0, 0, 30);
					Keybind["be"]["Name"] = [[Keybind]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.Title
					Keybind["bf"] = Instance.new("TextLabel", Keybind["be"]);
					Keybind["bf"]["BorderSizePixel"] = 0;
					Keybind["bf"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Keybind["bf"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					Keybind["bf"]["TextSize"] = 16;
					Keybind["bf"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["bf"]["Size"] = UDim2.new(1, 0, 1, 0);
					Keybind["bf"]["ClipsDescendants"] = true;
					Keybind["bf"]["Text"] = options.name;
					Keybind["bf"]["Name"] = [[Title]];
					Keybind["bf"]["Font"] = Enum.Font.Nunito;
					Keybind["bf"]["BackgroundTransparency"] = 1;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.Title.UIStroke
					Keybind["c0"] = Instance.new("UIStroke", Keybind["bf"]);
					Keybind["c0"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.UIPadding
					Keybind["c1"] = Instance.new("UIPadding", Keybind["be"]);
					Keybind["c1"]["PaddingRight"] = UDim.new(0, 20);
					Keybind["c1"]["PaddingLeft"] = UDim.new(0, 10);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.UICorner
					Keybind["c2"] = Instance.new("UICorner", Keybind["be"]);
					Keybind["c2"]["CornerRadius"] = UDim.new(0, 3);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.UIStroke
					Keybind["c3"] = Instance.new("UIStroke", Keybind["be"]);
					Keybind["c3"]["Color"] = Color3.fromRGB(49, 49, 57);
					Keybind["c3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer
					Keybind["c4"] = Instance.new("Frame", Keybind["be"]);
					Keybind["c4"]["BorderSizePixel"] = 0;
					Keybind["c4"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 40);
					Keybind["c4"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Keybind["c4"]["Size"] = UDim2.new(0, 72, 0, 16);
					Keybind["c4"]["Position"] = UDim2.new(1, 8, 0.5, 0);
					Keybind["c4"]["Name"] = [[KeybindContainer]];

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer.UICorner
					Keybind["c5"] = Instance.new("UICorner", Keybind["c4"]);
					Keybind["c5"]["CornerRadius"] = UDim.new(0, 2);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer.UIStroke
					Keybind["c6"] = Instance.new("UIStroke", Keybind["c4"]);
					Keybind["c6"]["Color"] = Color3.fromRGB(50, 50, 58);
					Keybind["c6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer.Keybind
					Keybind["c7"] = Instance.new("TextLabel", Keybind["c4"]);
					Keybind["c7"]["BorderSizePixel"] = 0;
					Keybind["c7"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
					Keybind["c7"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
					Keybind["c7"]["TextSize"] = 14;
					Keybind["c7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["c7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["c7"]["Size"] = UDim2.new(1, 0, 1, 0);
					Keybind["c7"]["ClipsDescendants"] = true;
					if options.deafult ~= nil then
						local success, value = pcall(function() return Enum.KeyCode[options.deafult] end)

						if success then
							Keybind["c7"]["Text"] = value.Name
							options.callback(value.Name)
							Library.Config[options.name] = value.Name
						else
							Keybind["c7"]["Text"] = "nil"
						end
					else
						Keybind["c7"]["Text"] = "nil"
					end
					Keybind["c7"]["Name"] = [[Keybind]];
					Keybind["c7"]["Font"] = Enum.Font.Nunito;
					Keybind["c7"]["BackgroundTransparency"] = 1;
					Keybind["c7"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

					-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer.Keybind.UICorner
					Keybind["c8"] = Instance.new("UICorner", Keybind["c7"]);
					Keybind["c8"]["CornerRadius"] = UDim.new(0, 3);
				end

				do--methods

					function Keybind:Destroy()
						for i, v in pairs(Keybind) do
							if typeof(v) == "boolean" and v then
								v = false
							end 
						end
						Library:tween(Keybind["be"], {Transparency = 1})
						wait(0.2)
						Keybind["be"]:Destroy()
						Section:Update()
					end

				end

				--logic
				do
					Keybind["be"].MouseEnter:Connect(function()
						Keybind.Hover = true
						GUI.HoverKeybind = true
						Section.HoverChild = true
						Library:tween(Keybind["c3"], {Color = Color3.fromRGB(69, 69, 77)})
					end)

					Keybind["be"].MouseLeave:Connect(function()
						Keybind.Hover = false
						GUI.HoverKeybind = false
						Section.HoverChild = false
						Library:tween(Keybind["c3"], {Color = Color3.fromRGB(49, 49, 57)})
					end)

					uis.InputBegan:Connect(function(input, gpe)
						if not GUI["1"].Enabled then return end
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Keybind.Hover then
							Keybind.MouseDown = true
						end			
					end)


					uis.InputEnded:Connect(function(input, gpe)
						if not GUI["1"].Enabled then return end
						if Keybind.Hover then
							local isBlacklisted = false
							for _, blacklistedKey in pairs(blacklistedKeys) do
								if input.KeyCode == blacklistedKey then
									isBlacklisted = true
									break
								end
							end

							if not isBlacklisted then
								Keybind["c7"]["Text"] = input.KeyCode.Name
								options.callback(input.KeyCode.Name)
								Library.Config[options.name] = input.KeyCode.Name
							end
						end
					end)


				end

				return Keybind
			end
			
			return Section
		end
		
		function Tab:Button(options)
			options = Library:Validate({
				name = "Deafult",
				callback = function() end
			}, options or {})
			
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			
			--render
			do 
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button
				Button["22"] = Instance.new("Frame", Tab["20"]);
				Button["22"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 24);
				Button["22"]["Size"] = UDim2.new(1, 0, 0, 30);
				Button["22"]["Name"] = [[Button]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.Title
				Button["23"] = Instance.new("TextLabel", Button["22"]);
				Button["23"]["BorderSizePixel"] = 0;
				Button["23"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["23"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Button["23"]["TextSize"] = 16;
				Button["23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["23"]["Size"] = UDim2.new(1, 0, 1, 0);
				Button["23"]["ClipsDescendants"] = true;
				Button["23"]["Text"] = options.name;
				Button["23"]["Name"] = options.name;
				Button["23"]["Font"] = Enum.Font.Nunito;
				Button["23"]["BackgroundTransparency"] = 1;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.Title.UIStroke
				Button["24"] = Instance.new("UIStroke", Button["23"]);
				Button["24"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.UIPadding
				Button["25"] = Instance.new("UIPadding", Button["22"]);
				Button["25"]["PaddingRight"] = UDim.new(0, 12);
				Button["25"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.UICorner
				Button["26"] = Instance.new("UICorner", Button["22"]);
				Button["26"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.Click
				Button["27"] = Instance.new("ImageLabel", Button["22"]);
				Button["27"]["BorderSizePixel"] = 0;
				Button["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["27"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Button["27"]["Image"] = [[rbxassetid://12195820883]];
				Button["27"]["Size"] = UDim2.new(0, 16, 0, 16);
				Button["27"]["Name"] = [[Click]];
				Button["27"]["BackgroundTransparency"] = 1;
				Button["27"]["Position"] = UDim2.new(1, 0, 0, 15);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.UIStroke
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Button.UIStroke
				Button["28"] = Instance.new("UIStroke", Button["22"]);
				Button["28"]["Color"] = Color3.fromRGB(45, 45, 52);
				Button["28"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
			end
			
			--Methods
			do
				function Button:Destroy()
					for i, v in pairs(Button) do
						if typeof(v) == "boolean" and v then
							v = false
						end 
					end
					Library:tween(Button["22"], {Transparency = 1})
					wait(0.2)
					Button["22"]:Destroy()
				end

				
				function Button:SetText(text)
					Button["23"].Text = text
				end
				
				function Button:SetCallback(fn)
					options.callback = fn
				end
				
			end
			
			--logic
			do
				Button["22"].MouseEnter:Connect(function()
					Button.Hover = true
					Library:tween(Button["28"], {Color = Color3.fromRGB(65, 65, 72)})
				end)

				Button["22"].MouseLeave:Connect(function()
					Button.Hover = false
					if not Button.MouseDown then
						Library:tween(Button["28"], {Color = Color3.fromRGB(45, 45, 52)})
						Library:tween(Button["22"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
					end
				end)
			end
			
			Button["22"].InputBegan:Connect(function(input, gpe)
				if not GUI["1"].Enabled then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
					Button.MouseDown = true
					Library:tween(Button["28"], {Color = Color3.fromRGB(89, 89, 87)})
					Library:tween(Button["22"], {BackgroundColor3 = Color3.fromRGB(45, 45, 49)})
				end			
			end)
			
			
			uis.InputEnded:Connect(function(input, gpe)
				
				if not GUI["1"].Enabled then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.MouseDown then
					Button.MouseDown = false
					
					if Button.Hover then
						Library:tween(Button["28"], {Color = Color3.fromRGB(65, 65, 72)})
						Library:tween(Button["22"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
					else
						--reset
						Library:tween(Button["28"], {Color = Color3.fromRGB(45, 45, 52)})
						Library:tween(Button["22"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
					end
				end			
			end)
			
			uis.InputEnded:Connect(function(input, gpe)
				
				if not GUI["1"].Enabled then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.MouseDown then
					options.callback()
				end
			end)
				
			return Button
		end
		
		function Tab:Label(options)
			options = Library:Validate({
				name = "Label",
				icon = true,
				centerText = false,
			}, options or {})


			local Label = {}	
			
			--Render
			do 
				-- StarterGui.ScreenGui.MainFrame.ContentCointainer.HomeTab.Label
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label
				Label["62"] = Instance.new("Frame", Tab["20"]);
				Label["62"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 24);
				Label["62"]["Size"] = UDim2.new(1, 0, 0, 30);
				Label["62"]["Name"] = [[Label]];
				Label["62"]["ClipsDescendants"] = true;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.Title
				Label["63"] = Instance.new("TextLabel", Label["62"]);
				Label["63"]["BorderSizePixel"] = 0;
				if options.centerText then
					Label["63"]["TextXAlignment"] = Enum.TextXAlignment.Center;
				else
					Label["63"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				end
				Label["63"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Label["63"]["ClipsDescendants"] = true;
				Label["63"]["TextWrapped"] = true;
				Label["63"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Label["63"]["TextSize"] = 16;
				Label["63"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["63"]["Size"] = UDim2.new(1, 0, 1, 0);
				Label["63"]["Name"] = options.name
				Label["63"]["Text"] = options.name
				Label["63"]["Font"] = Enum.Font.Nunito;
				Label["63"]["BackgroundTransparency"] = 1;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.Title.UIStroke
				Label["64"] = Instance.new("UIStroke", Label["63"]);


				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.Title.UIPadding
				Label["65"] = Instance.new("UIPadding", Label["63"]);
				if options.icon then
					Label["65"]["PaddingLeft"] = UDim.new(0, 29);
					Label["65"]["PaddingRight"] = UDim.new(0, 8);
				else
					Label["65"]["PaddingLeft"] = UDim.new(0, 8);
					Label["65"]["PaddingRight"] = UDim.new(0, 8);
					if (not options.icon) and (options.centerText) then
						Label["65"]["PaddingLeft"] = UDim.new(0, 2)
						Label["65"]["PaddingRight"] = UDim.new(0, 8);
					end
				end

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.UIPadding
				Label["66"] = Instance.new("UIPadding", Label["62"]);
				Label["66"]["PaddingTop"] = UDim.new(0, 7);
				Label["66"]["PaddingRight"] = UDim.new(0, 2);
				Label["66"]["PaddingBottom"] = UDim.new(0, 7);
				Label["66"]["PaddingLeft"] = UDim.new(0, 2);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.UICorner
				Label["67"] = Instance.new("UICorner", Label["62"]);
				Label["67"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.UIStroke
				Label["68"] = Instance.new("UIStroke", Label["62"]);
				Label["68"]["Color"] = Color3.fromRGB(50, 50, 58);
				Label["68"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				
				if options.icon then
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Label.Label
				Label["69"] = Instance.new("ImageLabel", Label["62"]);
				Label["69"]["BorderSizePixel"] = 0;
				Label["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["69"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Label["69"]["Image"] = [[rbxassetid://11954508977]];
				Label["69"]["Size"] = UDim2.new(0, 16, 0, 16);
				Label["69"]["Name"] = [[Label]];
				Label["69"]["BackgroundTransparency"] = 1;
				Label["69"]["Position"] = UDim2.new(0, 15, 0, 8);
				end
			end
			
			--Methods
			function Label:Destroy()
				for i, v in pairs(Label) do
					if typeof(v) == "boolean" and v then
						v = false
					end 
				end
				Library:tween(Label["62"], {Transparency = 1})
				wait(0.2)
				Label["62"]:Destroy()
			end
			
			
			function Label:SetText(text)
				options.name = text
				Label:_update()
			end
			
			function Label:_update()
				Label["63"].Text = options.name
				
				Label["63"].Size = UDim2.new(Label["63"].Size.X.Scale, Label["63"].Size.X.Offset, 0, math.huge)
				Label["63"].Size = UDim2.new(Label["63"].Size.X.Scale, Label["63"].Size.X.Offset, 0, Label["63"].TextBounds.Y)
				Library:tween(Label["62"], {Size = UDim2.new(Label["62"].Size.X.Scale, Label["62"].Size.X.Offset, 0, Label["63"].TextBounds.Y + 16)})
				
			end
			
			Label:_update()
			
			return Label
		end
		
		
		function Tab:Slider(options)
			options = Library:Validate({
				name = "Slider",
				min = 0,
				max = 100,
				deafult = 50,
				Deafult2 = nil,
				callback = function(v) print(v) end
			}, options or {})
			
			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil,
				Options = options
			}
			
			do --render
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider
				Slider["41"] = Instance.new("Frame", Tab["20"]);
				Slider["41"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 24);
				Slider["41"]["Size"] = UDim2.new(1, 0, 0, 40);
				Slider["41"]["Name"] = [[Slider]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Title
				Slider["42"] = Instance.new("TextLabel", Slider["41"]);
				Slider["42"]["BorderSizePixel"] = 0;
				Slider["42"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["42"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Slider["42"]["TextSize"] = 16;
				Slider["42"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["42"]["Size"] = UDim2.new(1, 0, 0, 20);
				Slider["42"]["Text"] = options.name;
				Slider["42"]["Name"] = options.name;
				Slider["42"]["Font"] = Enum.Font.Nunito;
				Slider["42"]["BackgroundTransparency"] = 1;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Title.UIStroke
				Slider["43"] = Instance.new("UIStroke", Slider["42"]);
				Slider["43"]["Thickness"] = 0.699999988079071;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.UIPadding
				Slider["44"] = Instance.new("UIPadding", Slider["41"]);
				Slider["44"]["PaddingLeft"] = UDim.new(0, 8);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.UICorner
				Slider["45"] = Instance.new("UICorner", Slider["41"]);
				Slider["45"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.UIStroke
				Slider["46"] = Instance.new("UIStroke", Slider["41"]);
				Slider["46"]["Color"] = Color3.fromRGB(45, 45, 52);
				Slider["46"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Value
				Slider["47"] = Instance.new("TextLabel", Slider["41"]);
				Slider["47"]["BorderSizePixel"] = 0;
				Slider["47"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["47"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Slider["47"]["TextSize"] = 16;
				Slider["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["47"]["Size"] = UDim2.new(0, 25, 0, 20);
				Slider["47"]["Text"] = tostring(options.deafult);
				Slider["47"]["Name"] = [[Value]];
				Slider["47"]["Font"] = Enum.Font.Nunito;
				Slider["47"]["BackgroundTransparency"] = 1;
				Slider["47"]["Position"] = UDim2.new(1, -25, 0, 0);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Value.UIStroke
				Slider["48"] = Instance.new("UIStroke", Slider["47"]);
				Slider["48"]["Thickness"] = 0.699999988079071;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.Value.UIPadding
				Slider["49"] = Instance.new("UIPadding", Slider["47"]);
				Slider["49"]["PaddingRight"] = UDim.new(0, 6);
				Slider["49"]["PaddingLeft"] = UDim.new(0, 8);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.SliderBack
				Slider["4a"] = Instance.new("Frame", Slider["41"]);
				Slider["4a"]["BorderSizePixel"] = 0;
				Slider["4a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["4a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Slider["4a"]["Size"] = UDim2.new(0, 250, 0, 5);
				Slider["4a"]["Position"] = UDim2.new(0, 125, 1, -15);
				Slider["4a"]["Name"] = [[SliderBack]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.SliderBack.UICorner
				Slider["4b"] = Instance.new("UICorner", Slider["4a"]);
				Slider["4b"]["CornerRadius"] = UDim.new(0, 2);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.SliderBack.UIStroke
				Slider["4c"] = Instance.new("UIStroke", Slider["4a"]);
				Slider["4c"]["Color"] = Color3.fromRGB(50, 50, 58);
				Slider["4c"]["Thickness"] = 0.699999988079071;
				Slider["4c"]["Transparency"] = 0.5;
				Slider["4c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Slider.SliderBack.Draggable
				Slider["4d"] = Instance.new("Frame", Slider["4a"]);
				Slider["4d"]["BorderSizePixel"] = 0;
				Slider["4d"]["BackgroundColor3"] = Color3.fromRGB(123, 145, 191);
				Slider["4d"]["Size"] = UDim2.new(0, 125, 0, 5);
				Slider["4d"]["Name"] = [[Draggable]];
			end
			
			if options.Deafult2 ~= nil then
				Library.Config[options.name] = options.Deafult2
				options.callback(options.Deafult2)
			else
				Library.Config[options.name] = options.deafult
			end
			
			--methods
			function Slider:Destroy()
				for i, v in pairs(Slider) do
					if typeof(v) == "boolean" and v then
						v = false
					end 
				end
				Library:tween(Slider["41"], {Transparency = 1})
				wait(0.2)
				Slider["41"]:Destroy()
			end
			
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((Mouse.X - Slider["4a"].AbsolutePosition.X) / (Slider["4a"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)
					Slider["47"].Text = tostring(value)
				
					Slider["4d"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["47"].Text = tostring(v)
					Slider["4d"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
					
				end
				options.callback(Slider:GetValue())
				Library.Config[options.name] = Slider:GetValue()
			end
			
			function Slider:GetValue(v)
				return tonumber(Slider["47"].Text)
			end
			
			-- logic
			do
				Slider["41"].MouseEnter:Connect(function()
					Slider.Hover = true
					Library:tween(Slider["46"], {Color = Color3.fromRGB(65, 65, 72)})
					Library:tween(Slider["4c"], {Color = Color3.fromRGB(65, 65, 72)})
					Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
				end)
				
				Slider["41"].MouseLeave:Connect(function()
					Slider.Hover = false
					if not Slider.MouseDown then
						Library:tween(Slider["46"], {Color = Color3.fromRGB(45, 45, 52)})
						Library:tween(Slider["4c"], {Color = Color3.fromRGB(45, 45, 52)})
						Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
					end
				end)


				Slider["41"].InputBegan:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover  then
						Slider.MouseDown = true
						Library:tween(Slider["4c"], {Color = Color3.fromRGB(85, 85, 92)})
						Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(143, 165, 211)})
					
					if not Slider.Connection then
						Slider.Connection = runService.RenderStepped:Connect(function()
							if not GUI["1"].Enabled then
								Slider.Connection:Disconnect()
									Slider.Connection = nil	
									if Slider.Hover then
										Library:tween(Slider["46"], {Color = Color3.fromRGB(65, 65, 72)})
										Library:tween(Slider["4c"], {Color = Color3.fromRGB(65, 65, 72)})
										Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
									else 
										--reset
										Library:tween(Slider["46"], {Color = Color3.fromRGB(45, 45, 52)})
										Library:tween(Slider["4c"], {Color = Color3.fromRGB(45, 45, 52)})
										Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
									end
							end
								Slider:SetValue()
							end)
						end
					end			
				end)


			uis.InputEnded:Connect(function(input, gpe)
				if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.MouseDown then
						Slider.MouseDown = false
							
						if Slider.Connection then Slider.Connection:Disconnect()
							Slider.Connection = nil
						end	
							
						if Slider.Hover then
							Library:tween(Slider["46"], {Color = Color3.fromRGB(65, 65, 72)})
							Library:tween(Slider["4c"], {Color = Color3.fromRGB(65, 65, 72)})
							Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
						else 
							--reset
							Library:tween(Slider["46"], {Color = Color3.fromRGB(45, 45, 52)})
							Library:tween(Slider["4c"], {Color = Color3.fromRGB(45, 45, 52)})
							Library:tween(Slider["4d"], {BackgroundColor3 = Color3.fromRGB(123, 145, 191)})
						end
						
				end
				

			end)
			

		end
			
			return Slider
		end
		
		function Tab:Toggle(options)
			options = Library:Validate({
				name = "Toggle",
				deafult = false,
				callback = function() end
			}, options or {})
				
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			-- render
			do 
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive
				Toggle["6a"] = Instance.new("Frame", Tab["20"]);
				Toggle["6a"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 24);
				Toggle["6a"]["Size"] = UDim2.new(1, 0, 0, 30);
				Toggle["6a"]["Name"] = [[ToggleInActive]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Title
				Toggle["6b"] = Instance.new("TextLabel", Toggle["6a"]);
				Toggle["6b"]["BorderSizePixel"] = 0;
				Toggle["6b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["6b"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Toggle["6b"]["TextSize"] = 16;
				Toggle["6b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["6b"]["Size"] = UDim2.new(1, 0, 1, 0);
				Toggle["6b"]["Text"] = options.name;
				Toggle["6b"]["Name"] = options.name;
				Toggle["6b"]["Font"] = Enum.Font.Nunito;
				Toggle["6b"]["BackgroundTransparency"] = 1;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Title.UIStroke
				Toggle["6c"] = Instance.new("UIStroke", Toggle["6b"]);
				Toggle["6c"]["Thickness"] = 0.699999988079071;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.UIPadding
				Toggle["6d"] = Instance.new("UIPadding", Toggle["6a"]);
				Toggle["6d"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.UICorner
				Toggle["6e"] = Instance.new("UICorner", Toggle["6a"]);
				Toggle["6e"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.UIStroke
				Toggle["6f"] = Instance.new("UIStroke", Toggle["6a"]);
				Toggle["6f"]["Color"] = Color3.fromRGB(45, 45, 52);
				Toggle["6f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Checkmark Container
				Toggle["70"] = Instance.new("Frame", Toggle["6a"]);
				Toggle["70"]["BorderSizePixel"] = 0;
				Toggle["70"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 40);
				Toggle["70"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["70"]["Size"] = UDim2.new(0, 16, 0, 16);
				Toggle["70"]["Position"] = UDim2.new(1, -16, 0.5, 0);
				Toggle["70"]["Name"] = [[Checkmark Container]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Checkmark Container.Checkmark
				Toggle["71"] = Instance.new("ImageLabel", Toggle["70"]);
				Toggle["71"]["BorderSizePixel"] = 0;
				Toggle["71"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["71"]["Size"] = UDim2.new(0, 14, 0, 14);
				Toggle["71"]["Name"] = [[Checkmark]];
				Toggle["71"]["BackgroundTransparency"] = 1;
				Toggle["71"]["Position"] = UDim2.new(1, -8, 0, 8);
				Toggle["71"]["Image"] = "";

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Checkmark Container.UICorner
				Toggle["72"] = Instance.new("UICorner", Toggle["70"]);
				Toggle["72"]["CornerRadius"] = UDim.new(0, 2);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.ToggleInActive.Checkmark Container.UIStroke
				Toggle["73"] = Instance.new("UIStroke", Toggle["70"]);
				Toggle["73"]["Color"] = Color3.fromRGB(50, 50, 58);
				Toggle["73"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
			end
			
			Library.Config[options.name] = Toggle.State
			
			-- Methods
			do
				function Toggle:Destroy()
					for i, v in pairs(Toggle) do
						if typeof(v) == "boolean" and v then
							v = false
						end 
					end
					Library:tween(Toggle["6a"], {Transparency = 1})
					wait(0.2)
					Toggle["6a"]:Destroy()
				end
				
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else 
						Toggle.State = b 
					end
					
					if Toggle.State then
					Library:tween(Toggle["70"], {BackgroundColor3 = Color3.fromRGB(34, 34, 40)})
					Toggle["71"].Image = "rbxassetid://11956641232"
					else
					Library:tween(Toggle["73"], {Color = Color3.fromRGB(34, 34, 40)})
					Toggle["71"].Image = ""
					end
					options.callback(Toggle.State)
					Library.Config[options.name] = Toggle.State
				end
			end
			
			if options.deafult then
				Toggle:Toggle(true)
				Library.Config[options.name] = Toggle.State
			end
			
			--logic
			do
				Toggle["6a"].MouseEnter:Connect(function()
					Toggle.Hover = true
					Library:tween(Toggle["6f"], {Color = Color3.fromRGB(65, 65, 72)})
					Library:tween(Toggle["73"], {Color = Color3.fromRGB(65, 65, 72)})	
				end)

				Toggle["6a"].MouseLeave:Connect(function()
					Toggle.Hover = false
					if not Toggle.MouseDown then
						Library:tween(Toggle["6f"], {Color = Color3.fromRGB(45, 45, 52)})
						Library:tween(Toggle["73"], {Color = Color3.fromRGB(45, 45, 52)})	
					end
				end)

				Toggle["6a"].InputBegan:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
							Library:tween(Toggle["6f"], {Color = Color3.fromRGB(85, 85, 92)})
							Library:tween(Toggle["73"], {Color = Color3.fromRGB(85, 85, 92)})	
					end			
				end)


				uis.InputEnded:Connect(function(input, gpe)	
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.MouseDown  then
						Toggle.MouseDown = false
						Toggle:Toggle()	

						if Toggle.Hover then
							Library:tween(Toggle["6f"], {Color = Color3.fromRGB(65, 65, 72)})
							Library:tween(Toggle["73"], {Color = Color3.fromRGB(65, 65, 72)})	
						else--reset
							Library:tween(Toggle["6f"], {Color = Color3.fromRGB(45, 45, 52)})
							Library:tween(Toggle["73"], {Color = Color3.fromRGB(45, 45, 52)})	
						end
					end			
				end)
			end
		
			
			return Toggle	
		end
		
		function Tab:Dropdown(options)
			options = Library:Validate({
				name = "Deafult",
				deafult = nil, 
				callback = function(v) print(v) end,
				items = {}
			}, options or {})
			
			
			local Dropdown = {
				Items = {
					["id"] = {
						{},
						"Value"
					}
				},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false,
			}			
			
			
			--render
			do
								
				Dropdown["2b"] = Instance.new("Frame", Tab["20"]);
				Dropdown["2b"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 24);
				Dropdown["2b"]["Size"] = UDim2.new(1, 0, 0, 30);
				Dropdown["2b"]["ClipsDescendants"] = true;
				Dropdown["2b"]["Position"] = UDim2.new(0, 0, 0.13475172221660614, 0);
				Dropdown["2b"]["Name"] = [[Dropdown]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Title
				Dropdown["2c"] = Instance.new("TextLabel", Dropdown["2b"]);
				Dropdown["2c"]["BorderSizePixel"] = 0;
				Dropdown["2c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["2c"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Dropdown["2c"]["TextSize"] = 16;
				Dropdown["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2c"]["Size"] = UDim2.new(1, 0, 0, 30);
				Dropdown["2c"]["Text"] = options.name;
				Dropdown["2c"]["Name"] = options.name;
				Dropdown["2c"]["Font"] = Enum.Font.Nunito;
				Dropdown["2c"]["BackgroundTransparency"] = 1;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Title.UIStroke
				Dropdown["2d"] = Instance.new("UIStroke", Dropdown["2c"]);
				Dropdown["2d"]["Thickness"] = 0.699999988079071;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UIPadding
				Dropdown["2e"] = Instance.new("UIPadding", Dropdown["2b"]);
				Dropdown["2e"]["PaddingRight"] = UDim.new(0, 12);
				Dropdown["2e"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UICorner
				Dropdown["2f"] = Instance.new("UICorner", Dropdown["2b"]);
				Dropdown["2f"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UIStroke
				Dropdown["30"] = Instance.new("UIStroke", Dropdown["2b"]);
				Dropdown["30"]["Color"] = Color3.fromRGB(45, 45, 52);
				Dropdown["30"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Dropdown
				Dropdown["31"] = Instance.new("ImageLabel", Dropdown["2b"]);
				Dropdown["31"]["BorderSizePixel"] = 0;
				Dropdown["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["31"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Dropdown["31"]["Image"] = [[rbxassetid://11954728818]];
				Dropdown["31"]["Size"] = UDim2.new(0, 16, 0, 16);
				Dropdown["31"]["Name"] = [[Dropdown]];
				Dropdown["31"]["BackgroundTransparency"] = 1;
				Dropdown["31"]["Position"] = UDim2.new(1, -3, 0, 15);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder
				Dropdown["32"] = Instance.new("Frame", Dropdown["2b"]);
				Dropdown["32"]["BorderSizePixel"] = 0;
				Dropdown["32"]["BackgroundColor3"] = Color3.fromRGB(73, 73, 73);
				Dropdown["32"]["BackgroundTransparency"] = 1;
				Dropdown["32"]["Size"] = UDim2.new(1, -15, 1, -30);
				Dropdown["32"]["ClipsDescendants"] = true;
				Dropdown["32"]["Position"] = UDim2.new(0, 5, 0, 30);
				Dropdown["32"]["Name"] = [[OptionHolder]];
				Dropdown["32"]["Visible"] = true;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.UIListLayout
				Dropdown["33"] = Instance.new("UIListLayout", Dropdown["32"]);
				Dropdown["33"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
				Dropdown["33"]["Padding"] = UDim.new(0, 5);
				Dropdown["33"]["SortOrder"] = Enum.SortOrder.LayoutOrder

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.UIPadding
				Dropdown["34"] = Instance.new("UIPadding", Dropdown["32"]);
				Dropdown["34"]["PaddingTop"] = UDim.new(0, 4);
				Dropdown["34"]["PaddingRight"] = UDim.new(0, 4);
				Dropdown["34"]["PaddingLeft"] = UDim.new(0, 4);
				
			end
			
			
			--Methods
			function Dropdown:Destroy()
				for i, v in pairs(Dropdown) do
					if typeof(v) == "boolean" and v then
						v = false
					end 
				end
				Library:tween(Dropdown["2b"], {Transparency = 1})
				wait(0.2)
				Dropdown["2b"]:Destroy()
			end
			
			function Dropdown:Toggle()
				if Dropdown.Open then
					Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30)})
				else
					local count = 0
					for i, v in pairs(Dropdown.Items) do
						if v ~= nil then
							count += 1
						end
					end
					Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30 + (count * 25) - 14)})
				end
				Dropdown.Open = not Dropdown.Open
			end
			
			
			function Dropdown:Add(id, value)
				local Item = {
					Hover = false,
					MouseDown = false,
				}
				
				if Dropdown.Items[id] ~= nil then
					return
				end
				
				-- StarterGui.ScreenGui.MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive
				Dropdown.Items[id] = {
					instance = {},
					value = value
				}
				
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive
				Dropdown.Items[id].instance["39"] = Instance.new("TextLabel", Dropdown["32"]);
				Dropdown.Items[id].instance["39"]["BorderSizePixel"] = 0;
				Dropdown.Items[id].instance["39"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
				Dropdown.Items[id].instance["39"]["TextSize"] = 14;
				Dropdown.Items[id].instance["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown.Items[id].instance["39"]["Size"] = UDim2.new(1, 0, 0, 20);
				Dropdown.Items[id].instance["39"]["Text"] = id;
				Dropdown.Items[id].instance["39"]["Name"] = id;
				Dropdown.Items[id].instance["39"]["Font"] = Enum.Font.SourceSans;
				Dropdown.Items[id].instance["39"]["BackgroundTransparency"] = 0.6000000238418579;
				Dropdown.Items[id].instance["39"]["Position"] = UDim2.new(0, 8, 0, 0);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UIStroke
				Dropdown.Items[id].instance["3a"] = Instance.new("UIStroke", Dropdown.Items[id].instance["39"]);


				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UICorner
				Dropdown.Items[id].instance["3b"] = Instance.new("UICorner", Dropdown.Items[id].instance["39"]);
				Dropdown.Items[id].instance["3b"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UIStroke
				Dropdown.Items[id].instance["3c"] = Instance.new("UIStroke", Dropdown.Items[id].instance["39"]);
				Dropdown.Items[id].instance["3c"]["Color"] = Color3.fromRGB(37, 37, 37);
				Dropdown.Items[id].instance["3c"]["Thickness"] = 1;
				Dropdown.Items[id].instance["3c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				
				if options.deafult ~= nil then 
					if Dropdown.Items[options.deafult] then
						Library.Config[options.name] = options.deafult
						options.callback(options.deafult)
						Library:tween(Dropdown.Items[options.deafult].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
						Library:tween(Dropdown.Items[options.deafult].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
						Dropdown["2c"]["Text"] = options.name .. " | " .. options.deafult 
					end
				end
				
				Dropdown.Items[id].instance["39"].MouseEnter:Connect(function()
					Item.Hover = true
					Dropdown.HoveringItem = true
					Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(57, 57, 57)})
				end)

				Dropdown.Items[id].instance["39"].MouseLeave:Connect(function()
					Item.Hover = false
					Dropdown.HoveringItem = false
					
					if Dropdown.Items[id].instance["39"]["BackgroundColor3"] == Color3.fromRGB(17, 17, 17) then
						Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					
					if not GUI["1"].Enabled then return end
					if Dropdown.Items[id] == nil then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
						Item.MouseDown = true
						Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
						Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
						
					else if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.HoveringItem then
							Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
							Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(17, 17, 17)})	
						end
					end	
				end)


				uis.InputEnded:Connect(function(input, gpe)
					
					if not GUI["1"].Enabled then return end
					if Dropdown.Items[id] == nil then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Item.MouseDown = false

						if Item.Hover then
							options.callback(id)
							Library.Config[options.name] = id
							Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
							Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							Dropdown["2c"]["Text"] = options.name .. " | " .. id 
							
						else if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.HoveringItem then
								Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
								Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(17, 17, 17)})	
							end
						end
						
	
					end			
				end)

				
			end
			
			
			function Dropdown:Remove(id)
				if Dropdown.Items[id] ~= nil then
					if Dropdown.Items[id].instance ~= nil then
						if id ~= nil then
						for i, v in pairs(Dropdown.Items[id].instance)  do
							v:Destroy()
							end
						end
					end
					Dropdown.Items[id] = nil
					local count = 0
					for i, v in pairs(Dropdown.Items) do
						if v ~= nil then
							count += 1
						end
					end
					if Dropdown.Open then
						Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30 + (count * 25) - 14)})
					end
				end
			end
			
			function Dropdown:Clear(id)
				for i, v in pairs(Dropdown.Items)  do
					Dropdown:Remove(i)
				end
			end
			
			
			--logic
			Dropdown["2b"].MouseEnter:Connect(function()
				Dropdown.Hover = true
				Library:tween(Dropdown["30"], {Color = Color3.fromRGB(65, 65, 72)})
			end)

			Dropdown["2b"].MouseLeave:Connect(function()
				Dropdown.Hover = false
				if not Dropdown.MouseDown then
					Library:tween(Dropdown["30"], {Color = Color3.fromRGB(45, 45, 52)})
					Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
				end
			end)

			Dropdown["2b"].InputBegan:Connect(function(input, gpe)
				if not GUI["1"].Enabled then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
					Dropdown.MouseDown = true
					if not Dropdown.HoveringItem then
						Library:tween(Dropdown["30"], {Color = Color3.fromRGB(85, 85, 92)})
						Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(41, 41, 44)})
					end
				end			
			end)


		uis.InputEnded:Connect(function(input, gpe)				
			if not GUI["1"].Enabled then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.MouseDown then
					Dropdown.MouseDown = false
					
				if Dropdown.Hover then
					Library:tween(Dropdown["30"], {Color = Color3.fromRGB(65, 65, 72)})
					Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
				
				else
					--reset
					Library:tween(Dropdown["30"], {Color = Color3.fromRGB(45, 45, 52)})
					Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
				end
				if not Dropdown.HoveringItem and not Dropdown.MouseDown then
					Dropdown:Toggle()
				end	
			end			
		end)
			


			
			return Dropdown
		end
		
		function Tab:TextBox(options)
			options = Library:Validate({
				name = "TextBox",
				PlaceHolder = "...",
				deafult = nil, 
				callback = function(v) print(v) end
			}, options or {})
			
			local TextBox = {
				Hover = false,
				HoverHover = false,
				MouseDown = false,
			}
			
			--render
			do
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox
				TextBox["4e"] = Instance.new("Frame", Tab["20"]);
				TextBox["4e"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 24);
				TextBox["4e"]["Size"] = UDim2.new(1, 0, 0, 30);
				TextBox["4e"]["Name"] = [[TextBox]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.UIPadding
				TextBox["4f"] = Instance.new("UIPadding", TextBox["4e"]);
				TextBox["4f"]["PaddingRight"] = UDim.new(0, 8);
				TextBox["4f"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.UICorner
				TextBox["50"] = Instance.new("UICorner", TextBox["4e"]);
				TextBox["50"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.UIStroke
				TextBox["51"] = Instance.new("UIStroke", TextBox["4e"]);
				TextBox["51"]["Color"] = Color3.fromRGB(45, 45, 52);
				TextBox["51"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.TextBox
				TextBox["52"] = Instance.new("TextBox", TextBox["4e"]);
				TextBox["52"]["CursorPosition"] = -1;
				TextBox["52"]["BorderSizePixel"] = 0;
				TextBox["52"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				TextBox["52"]["TextSize"] = 11;
				TextBox["52"]["BackgroundColor3"] = Color3.fromRGB(38, 38, 44);
				TextBox["52"]["PlaceholderText"] = options.PlaceHolder;
				TextBox["52"]["Size"] = UDim2.new(0, 100, 1, -12);
				TextBox["52"]["ClipsDescendants"] = true;
				TextBox["52"]["Text"] = [[]];
				TextBox["52"]["Position"] = UDim2.new(1, -98, 0, 7);
				TextBox["52"]["Font"] = Enum.Font.Ubuntu;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.TextBox.UICorner
				TextBox["53"] = Instance.new("UICorner", TextBox["52"]);
				TextBox["53"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.TextBox.UIStroke
				TextBox["54"] = Instance.new("UIStroke", TextBox["52"]);
				TextBox["54"]["Thickness"] = 0.75;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.Title
				TextBox["55"] = Instance.new("TextLabel", TextBox["4e"]);
				TextBox["55"]["BorderSizePixel"] = 0;
				TextBox["55"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				TextBox["55"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				TextBox["55"]["TextSize"] = 16;
				TextBox["55"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				TextBox["55"]["Size"] = UDim2.new(1, 0, 1, 0);
				TextBox["55"]["Text"] = options.name;
				TextBox["55"]["Name"] = options.name;
				TextBox["55"]["Font"] = Enum.Font.Nunito;
				TextBox["55"]["BackgroundTransparency"] = 1;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.Title.UIStroke
				TextBox["56"] = Instance.new("UIStroke", TextBox["55"]);
				TextBox["56"]["Thickness"] = 0.699999988079071;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.TextBox.Title.UIPadding
				TextBox["57"] = Instance.new("UIPadding", TextBox["55"]);
			end
			
			if options.deafult ~= nil then
				Library.Config[options.name] = options.deafult
				options.callback(options.deafult)
				TextBox["52"].Text = options.deafult
			end
			
			--Methods
			do
				function TextBox:Destroy()
					for i, v in pairs(TextBox) do
						if typeof(v) == "boolean" and v then
							v = false
						end 
					end
					Library:tween(TextBox["4e"], {Transparency = 1})
					wait(0.2)
					TextBox["4e"]:Destroy()
				end
			end
			
			--Logic
			do

					TextBox["4e"].MouseEnter:Connect(function()
						TextBox.Hover = true
						Library:tween(TextBox["51"], {Color = Color3.fromRGB(65, 65, 72)})
					end)

					TextBox["4e"].MouseLeave:Connect(function()
						TextBox.Hover = false
						if not TextBox.MouseDown then
							Library:tween(TextBox["51"], {Color = Color3.fromRGB(45, 45, 52)})
							Library:tween(TextBox["4e"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
						end
					end)
				
				TextBox["52"].MouseEnter:Connect(function()
					TextBox.HoverHover = true
				end)

				TextBox["52"].MouseLeave:Connect(function()
					TextBox.HoverHover = false
				end)

				uis.InputBegan:Connect(function(input, gpe)
					
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and TextBox.HoverHover then
						TextBox.MouseDown = true
						Library:tween(TextBox["51"], {Color = Color3.fromRGB(85, 85, 92)})
						Library:tween(TextBox["52"], {BackgroundColor3 = Color3.fromRGB(58, 58, 54)})
					end			
				end)


				uis.InputEnded:Connect(function(input, gpe)
					if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and TextBox.MouseDown then
						TextBox.MouseDown = false
						if TextBox.HoverHover  then
							Library:tween(TextBox["51"], {Color = Color3.fromRGB(65, 65, 72)})
							Library:tween(TextBox["52"], {BackgroundColor3 = Color3.fromRGB(38, 38, 44)})
						else
							--reset
							Library:tween(TextBox["51"], {Color = Color3.fromRGB(50, 50, 58)})
							Library:tween(TextBox["52"], {BackgroundColor3 = Color3.fromRGB(38, 38, 44)})
						end
					end			
				end)
			end
			
			TextBox["52"].Focused:Connect(function()
				GUI.TextboxFocus = true
			end)

			TextBox["52"].FocusLost:Connect(function(textbox)
				GUI.TextboxFocus = false
				local TextBoxTXT = TextBox["52"].Text
				if TextBoxTXT ~= nil or " " then
					options.callback(TextBoxTXT)
					Library.Config[options.name] = TextBoxTXT
				end
			end)
			
			return TextBox
		end
		
		function Tab:MultiDropdown(options)
			options = Library:Validate({
				name = "Deafult",
				deafult = nil,
				callback = function(v) print(v) end,
				items = {}
			}, options or {})
			
			local tableItems = {}

			local Dropdown = {
				Items = {
					["id"] = {
						{},
						"Value"
					}
				},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false,
			}			


			--render
			do

				Dropdown["2b"] = Instance.new("Frame", Tab["20"]);
				Dropdown["2b"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 24);
				Dropdown["2b"]["Size"] = UDim2.new(1, 0, 0, 30);
				Dropdown["2b"]["ClipsDescendants"] = true;
				Dropdown["2b"]["Position"] = UDim2.new(0, 0, 0.13475172221660614, 0);
				Dropdown["2b"]["Name"] = [[Dropdown]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Title
				Dropdown["2c"] = Instance.new("TextLabel", Dropdown["2b"]);
				Dropdown["2c"]["BorderSizePixel"] = 0;
				Dropdown["2c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["2c"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Dropdown["2c"]["TextSize"] = 16;
				Dropdown["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2c"]["Size"] = UDim2.new(1, 0, 0, 30);
				Dropdown["2c"]["Text"] = options.name;
				Dropdown["2c"]["Name"] = options.name;
				Dropdown["2c"]["Font"] = Enum.Font.Nunito;
				Dropdown["2c"]["BackgroundTransparency"] = 1;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Title.UIStroke
				Dropdown["2d"] = Instance.new("UIStroke", Dropdown["2c"]);
				Dropdown["2d"]["Thickness"] = 0.699999988079071;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UIPadding
				Dropdown["2e"] = Instance.new("UIPadding", Dropdown["2b"]);
				Dropdown["2e"]["PaddingRight"] = UDim.new(0, 12);
				Dropdown["2e"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UICorner
				Dropdown["2f"] = Instance.new("UICorner", Dropdown["2b"]);
				Dropdown["2f"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.UIStroke
				Dropdown["30"] = Instance.new("UIStroke", Dropdown["2b"]);
				Dropdown["30"]["Color"] = Color3.fromRGB(45, 45, 52);
				Dropdown["30"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.Dropdown
				Dropdown["31"] = Instance.new("ImageLabel", Dropdown["2b"]);
				Dropdown["31"]["BorderSizePixel"] = 0;
				Dropdown["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["31"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Dropdown["31"]["Image"] = [[rbxassetid://11954728818]];
				Dropdown["31"]["Size"] = UDim2.new(0, 16, 0, 16);
				Dropdown["31"]["Name"] = [[Dropdown]];
				Dropdown["31"]["BackgroundTransparency"] = 1;
				Dropdown["31"]["Position"] = UDim2.new(1, -3, 0, 15);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder
				Dropdown["32"] = Instance.new("Frame", Dropdown["2b"]);
				Dropdown["32"]["BorderSizePixel"] = 0;
				Dropdown["32"]["BackgroundColor3"] = Color3.fromRGB(73, 73, 73);
				Dropdown["32"]["BackgroundTransparency"] = 1;
				Dropdown["32"]["Size"] = UDim2.new(1, -15, 1, -30);
				Dropdown["32"]["ClipsDescendants"] = true;
				Dropdown["32"]["Position"] = UDim2.new(0, 5, 0, 30);
				Dropdown["32"]["Name"] = [[OptionHolder]];
				Dropdown["32"]["Visible"] = true;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.UIListLayout
				Dropdown["33"] = Instance.new("UIListLayout", Dropdown["32"]);
				Dropdown["33"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
				Dropdown["33"]["Padding"] = UDim.new(0, 5);
				Dropdown["33"]["SortOrder"] = Enum.SortOrder.LayoutOrder

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.UIPadding
				Dropdown["34"] = Instance.new("UIPadding", Dropdown["32"]);
				Dropdown["34"]["PaddingTop"] = UDim.new(0, 4);
				Dropdown["34"]["PaddingRight"] = UDim.new(0, 4);
				Dropdown["34"]["PaddingLeft"] = UDim.new(0, 4);

			end


			--Methods
			function Dropdown:Destroy()
				for i, v in pairs(Dropdown) do
					if typeof(v) == "boolean" and v then
						v = false
					end 
				end
				Library:tween(Dropdown["2b"], {Transparency = 1})
				wait(0.2)
				Dropdown["2b"]:Destroy()
			end
			
			function Dropdown:Toggle()
				if Dropdown.Open then
					Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30)})
				else
					local count = 0
					for i, v in pairs(Dropdown.Items) do
						if v ~= nil then
							count += 1
						end
					end
					Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30 + (count * 25) - 14)})
				end
				Dropdown.Open = not Dropdown.Open
			end


			function Dropdown:Add(id, value)
				local Item = {
					Hover = false,
					MouseDown = false,
				}

				if Dropdown.Items[id] ~= nil then
					return
				end

				-- StarterGui.ScreenGui.MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive
				Dropdown.Items[id] = {
					instance = {},
					value = value
				}

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive
				Dropdown.Items[id].instance["39"] = Instance.new("TextLabel", Dropdown["32"]);
				Dropdown.Items[id].instance["39"]["BorderSizePixel"] = 0;
				Dropdown.Items[id].instance["39"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
				Dropdown.Items[id].instance["39"]["TextSize"] = 14;
				Dropdown.Items[id].instance["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown.Items[id].instance["39"]["Size"] = UDim2.new(1, 0, 0, 20);
				Dropdown.Items[id].instance["39"]["Text"] = id;
				Dropdown.Items[id].instance["39"]["Name"] = id;
				Dropdown.Items[id].instance["39"]["Font"] = Enum.Font.SourceSans;
				Dropdown.Items[id].instance["39"]["BackgroundTransparency"] = 0.6000000238418579;
				Dropdown.Items[id].instance["39"]["Position"] = UDim2.new(0, 8, 0, 0);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UIStroke
				Dropdown.Items[id].instance["3a"] = Instance.new("UIStroke", Dropdown.Items[id].instance["39"]);


				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UICorner
				Dropdown.Items[id].instance["3b"] = Instance.new("UICorner", Dropdown.Items[id].instance["39"]);
				Dropdown.Items[id].instance["3b"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Dropdown.OptionHolder.Option3InActive.UIStroke
				Dropdown.Items[id].instance["3c"] = Instance.new("UIStroke", Dropdown.Items[id].instance["39"]);
				Dropdown.Items[id].instance["3c"]["Color"] = Color3.fromRGB(37, 37, 37);
				Dropdown.Items[id].instance["3c"]["Thickness"] = 1;
				Dropdown.Items[id].instance["3c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				
				if options.deafult ~= nil then 
					Library.Config[options.name] = options.deafult
					options.callback(options.deafult)
					tableItems = options.deafult
					for i, v in pairs(options.deafult) do
						if Dropdown.Items[v] then
							Library:tween(Dropdown.Items[v].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
							Library:tween(Dropdown.Items[v].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
						end
					end
				end
				
				Dropdown.Items[id].instance["39"].MouseEnter:Connect(function()
					Item.Hover = true
					Dropdown.HoveringItem = true
					Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(57, 57, 57)})
				end)

				Dropdown.Items[id].instance["39"].MouseLeave:Connect(function()
					Item.Hover = false
					Dropdown.HoveringItem = false

					if Dropdown.Items[id].instance["39"]["BackgroundColor3"] == Color3.fromRGB(17, 17, 17) then
						Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)

					if not GUI["1"].Enabled then return end
					if Dropdown.Items[id] == nil then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
						Item.MouseDown = true
						--Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
						--Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
					end	
				end)


				uis.InputEnded:Connect(function(input, gpe)

					if not GUI["1"].Enabled then return end
					if Dropdown.Items[id] == nil then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Item.MouseDown = false

						if Item.Hover then
							if table.find(tableItems, id) then
								local index = table.find(tableItems, id)
								if index then
									table.remove(tableItems, index)
									options.callback(tableItems)
									Library.Config[options.name] = tableItems
									Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
									Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(17, 17, 17)})
								end
								else
								table.insert(tableItems, id)
								options.callback(tableItems)
								Library.Config[options.name] = tableItems
								Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(65, 65, 65)})
								Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							end
						end

						--if table.find(tableItems, id) then
							--print(id)
							--Library:tween(Dropdown.Items[id].instance["3c"], {Color = Color3.fromRGB(37, 37, 37)})
							--Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(17, 17, 17)})
						--end
					end			
				end)


			end


			function Dropdown:Remove(id)
				if Dropdown.Items[id] ~= nil then
					if Dropdown.Items[id].instance ~= nil then
						if id ~= nil then
							for i, v in pairs(Dropdown.Items[id].instance)  do
								v:Destroy()
							end
						end
					end
					Dropdown.Items[id] = nil
					local count = 0
					for i, v in pairs(Dropdown.Items) do
						if v ~= nil then
							count += 1
						end
					end
					if Dropdown.Open then
						Library:tween(Dropdown["2b"], {Size = UDim2.new(1,0,0,30 + (count * 25) - 14)})
					end
				end
			end

			function Dropdown:Clear(id)
				for i, v in pairs(Dropdown.Items)  do
					Dropdown:Remove(i)
				end
			end


			--logic
			Dropdown["2b"].MouseEnter:Connect(function()
				Dropdown.Hover = true
				Library:tween(Dropdown["30"], {Color = Color3.fromRGB(65, 65, 72)})
			end)

			Dropdown["2b"].MouseLeave:Connect(function()
				Dropdown.Hover = false
				if not Dropdown.MouseDown then
					Library:tween(Dropdown["30"], {Color = Color3.fromRGB(45, 45, 52)})
					Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
				end
			end)

			Dropdown["2b"].InputBegan:Connect(function(input, gpe)
				if not GUI["1"].Enabled then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
					Dropdown.MouseDown = true
					if not Dropdown.HoveringItem then
						Library:tween(Dropdown["30"], {Color = Color3.fromRGB(85, 85, 92)})
						Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(41, 41, 44)})
					end
				end			
			end)


			uis.InputEnded:Connect(function(input, gpe)
				if not GUI["1"].Enabled then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.MouseDown then
					Dropdown.MouseDown = false
					if Dropdown.Hover then
						Library:tween(Dropdown["30"], {Color = Color3.fromRGB(65, 65, 72)})
						Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
					else
						--reset
						Library:tween(Dropdown["30"], {Color = Color3.fromRGB(45, 45, 52)})
						Library:tween(Dropdown["2b"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})
					end
				end			
			end)

			uis.InputEnded:Connect(function(input, gpe)

				if not GUI["1"].Enabled then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if (not Dropdown.HoveringItem) and (Dropdown.MouseDown) then
						Dropdown:Toggle()
					end
				end
			end)





			return Dropdown
		end
		
		function Tab:Keybind(options)
			options = Library:Validate({
				name = "Deafult",
				deafult = Enum.KeyCode.Unknown,
				callback = function(v) print(v) end,
				items = {}
			}, options or {})
			
			local Keybind = {
				Hover = false,
				MouseDown = false
			}			
			
			local blacklistedKeys = {
				Enum.KeyCode.W,
				Enum.KeyCode.S,
				Enum.KeyCode.A,
				Enum.KeyCode.D,
				Enum.KeyCode.Unknown
			}
			
			
			do-- render
				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind
				Keybind["be"] = Instance.new("Frame", Tab["20"]);
				Keybind["be"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 25);
				Keybind["be"]["Size"] = UDim2.new(1, 0, 0, 30);
				Keybind["be"]["Name"] = [[Keybind]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.Title
				Keybind["bf"] = Instance.new("TextLabel", Keybind["be"]);
				Keybind["bf"]["BorderSizePixel"] = 0;
				Keybind["bf"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Keybind["bf"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Keybind["bf"]["TextSize"] = 16;
				Keybind["bf"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Keybind["bf"]["Size"] = UDim2.new(1, 0, 1, 0);
				Keybind["bf"]["ClipsDescendants"] = true;
				Keybind["bf"]["Text"] = options.name;
				Keybind["bf"]["Name"] = [[Title]];
				Keybind["bf"]["Font"] = Enum.Font.Nunito;
				Keybind["bf"]["BackgroundTransparency"] = 1;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.Title.UIStroke
				Keybind["c0"] = Instance.new("UIStroke", Keybind["bf"]);
				Keybind["c0"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.UIPadding
				Keybind["c1"] = Instance.new("UIPadding", Keybind["be"]);
				Keybind["c1"]["PaddingRight"] = UDim.new(0, 20);
				Keybind["c1"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.UICorner
				Keybind["c2"] = Instance.new("UICorner", Keybind["be"]);
				Keybind["c2"]["CornerRadius"] = UDim.new(0, 3);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.UIStroke
				Keybind["c3"] = Instance.new("UIStroke", Keybind["be"]);
				Keybind["c3"]["Color"] = Color3.fromRGB(45, 45, 52);
				Keybind["c3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer
				Keybind["c4"] = Instance.new("Frame", Keybind["be"]);
				Keybind["c4"]["BorderSizePixel"] = 0;
				Keybind["c4"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 40);
				Keybind["c4"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Keybind["c4"]["Size"] = UDim2.new(0, 72, 0, 16);
				Keybind["c4"]["Position"] = UDim2.new(1, 8, 0.5, 0);
				Keybind["c4"]["Name"] = [[KeybindContainer]];

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer.UICorner
				Keybind["c5"] = Instance.new("UICorner", Keybind["c4"]);
				Keybind["c5"]["CornerRadius"] = UDim.new(0, 2);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer.UIStroke
				Keybind["c6"] = Instance.new("UIStroke", Keybind["c4"]);
				Keybind["c6"]["Color"] = Color3.fromRGB(50, 50, 58);
				Keybind["c6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer.Keybind
				Keybind["c7"] = Instance.new("TextLabel", Keybind["c4"]);
				Keybind["c7"]["BorderSizePixel"] = 0;
				Keybind["c7"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
				Keybind["c7"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
				Keybind["c7"]["TextSize"] = 14;
				Keybind["c7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Keybind["c7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Keybind["c7"]["Size"] = UDim2.new(1, 0, 1, 0);
				Keybind["c7"]["ClipsDescendants"] = true;
				if options.deafult ~= nil then
					local success, value = pcall(function() return Enum.KeyCode[options.deafult] end)

					if success then
						Keybind["c7"]["Text"] = value.Name
						options.callback(value.Name)
						Library.Config[options.name] = value.Name
					else
						Keybind["c7"]["Text"] = "nil"
					end
				else
					Keybind["c7"]["Text"] = "nil"
				end
				Keybind["c7"]["Name"] = [[Keybind]];
				Keybind["c7"]["Font"] = Enum.Font.Nunito;
				Keybind["c7"]["BackgroundTransparency"] = 1;
				Keybind["c7"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

				-- StarterGui.UIlib(2nd).MainFrame.ContentCointainer.HomeTab.Keybind.KeybindContainer.Keybind.UICorner
				Keybind["c8"] = Instance.new("UICorner", Keybind["c7"]);
				Keybind["c8"]["CornerRadius"] = UDim.new(0, 3);
			end
			
			-- methods
			do
				function Keybind:Destroy()
					for i, v in pairs(Keybind) do
						if typeof(v) == "boolean" and v then
							v = false
						end 
					end
					Library:tween(Keybind["be"], {Transparency = 1})
					wait(0.2)
					Keybind["be"]:Destroy()
				end
			end
			
			--logic
			do
				Keybind["be"].MouseEnter:Connect(function()
					Keybind.Hover = true
					GUI.HoverKeybind = true
					Library:tween(Keybind["c3"], {Color = Color3.fromRGB(65, 65, 72)})
				end)

				Keybind["be"].MouseLeave:Connect(function()
					Keybind.Hover = false
					GUI.HoverKeybind = false
					Library:tween(Keybind["c3"], {Color = Color3.fromRGB(45, 45, 52)})
					Library:tween(Keybind["be"], {BackgroundColor3 = Color3.fromRGB(21, 21, 24)})

				end)

			uis.InputBegan:Connect(function(input, gpe)
				if not GUI["1"].Enabled then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Keybind.Hover then
					
					Keybind.MouseDown = true
				end			
			end)


			uis.InputEnded:Connect(function(input, gpe)
				if not GUI["1"].Enabled then return end
				if Keybind.Hover then
					local isBlacklisted = false
						for _, blacklistedKey in pairs(blacklistedKeys) do
							if input.KeyCode == blacklistedKey then
								isBlacklisted = true
							break
						end
					end

					if not isBlacklisted then
						Keybind["c7"]["Text"] = input.KeyCode.Name
							options.callback(input.KeyCode.Name)
							Library.Config[options.name] = input.KeyCode.Name
					end
				end
				end)
				
				
			end
			
			return Keybind
		end
			
		return Tab
	end
	
	function GUI:Notifcation(text)
		
		--render
		do
			-- StarterGui.UIlib(2nd).NotficationHolder.Notification
			GUI["cd"] = Instance.new("Frame", GUI["cc"]);
			GUI["cd"]["ZIndex"] = 0;
			GUI["cd"]["BorderSizePixel"] = 0;
			GUI["cd"]["BackgroundColor3"] = Color3.fromRGB(32, 31, 35);
			GUI["cd"]["BackgroundTransparency"] = 0.550000011920929;
			GUI["cd"]["Size"] = UDim2.new(0, 112, 0, 18);
			GUI["cd"]["ClipsDescendants"] = true;
			GUI["cd"]["Name"] = [[Notification]];

			-- StarterGui.UIlib(2nd).NotficationHolder.Notification.Notification
			GUI["ce"] = Instance.new("TextLabel", GUI["cd"]);
			GUI["ce"]["TextWrapped"] = true;
			GUI["ce"]["ZIndex"] = 2;
			GUI["ce"]["BorderSizePixel"] = 0;
			GUI["ce"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			GUI["ce"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			GUI["ce"]["TextSize"] = 14;
			GUI["ce"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			GUI["ce"]["Size"] = UDim2.new(1, 0, 1, 0);
			GUI["ce"]["ClipsDescendants"] = true;
			GUI["ce"]["Text"] = text;
			GUI["ce"]["Name"] = [[Notification]];
			GUI["ce"]["Font"] = Enum.Font.Nunito;
			GUI["ce"]["BackgroundTransparency"] = 1;

			-- StarterGui.UIlib(2nd).NotficationHolder.Notification.Notification.UIPadding
			GUI["cf"] = Instance.new("UIPadding", GUI["ce"]);
			GUI["cf"]["PaddingLeft"] = UDim.new(0, 18);

			-- StarterGui.UIlib(2nd).NotficationHolder.Notification.Notification.UIStroke
			GUI["d0"] = Instance.new("UIStroke", GUI["ce"]);
			GUI["d0"]["Thickness"] = 0.699999988079071;
			GUI["d0"]["Transparency"] = 0.5;

			-- StarterGui.UIlib(2nd).NotficationHolder.Notification.UICorner
			GUI["d1"] = Instance.new("UICorner", GUI["cd"]);
			GUI["d1"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.UIlib(2nd).NotficationHolder.Notification.NotifyIcon
			GUI["d2"] = Instance.new("ImageLabel", GUI["cd"]);
			GUI["d2"]["BorderSizePixel"] = 0;
			GUI["d2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			GUI["d2"]["Image"] = [[rbxassetid://12575190137]];
			GUI["d2"]["Size"] = UDim2.new(0, 13, 1, 0);
			GUI["d2"]["Name"] = [[NotifyIcon]];
			GUI["d2"]["BackgroundTransparency"] = 1;

			-- StarterGui.UIlib(2nd).NotficationHolder.Notification.UIPadding
			GUI["d3"] = Instance.new("UIPadding", GUI["cd"]);
			GUI["d3"]["PaddingTop"] = UDim.new(0, 2);
			GUI["d3"]["PaddingBottom"] = UDim.new(0, 2);
			GUI["d3"]["PaddingLeft"] = UDim.new(0, 8);

			-- StarterGui.UIlib(2nd).NotficationHolder.Notification.UIStroke
			GUI["d4"] = Instance.new("UIStroke", GUI["cd"]);
			GUI["d4"]["Color"] = Color3.fromRGB(68, 68, 78);
			GUI["d4"]["Transparency"] = 0.20000000298023224;
			GUI["d4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		end
		
	end
	return GUI
end

return Library