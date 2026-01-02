-- by JackEyeKL



-- 加载Discord公告
pcall(function()
     loadstring(game:HttpGet('https://pastebin.com/raw/sqLapSu8'))()
end)
 
local repo = 'https://raw.githubusercontent.com/javaKL666/Obsidian/main/'






local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

Library:Notify("Loading LightStar for Forsaken",5,4590657391)

local function Notify(Title, Text, Duration)
    Library:Notify({
        Title = Title,
        Description = Text,
        Time = Duration,
})
end
_G._Notify = Notify

local Options = Library.Options
local Toggles = Library.Toggles

-- 准备就读
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local localPlayer = localPlayer
local Workspace = game:GetService("Workspace")
local localPlayer = Players.LocalPlayer
local PathfindingService = game:GetService("PathfindingService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local Network = replicatedStorage:WaitForChild("Modules"):WaitForChild("Network")
local gameMap = workspace.Map
local actor = Network:WaitForChild("RemoteEvent")

Library.ShowToggleFrameInKeybinds = true 
Library.ShowCustomCursor = true
Library.NotifySide = "Right"

local Window = Library:CreateWindow({
	Title = "LightStar",
	Footer = "by JackEyeKL-Hello user " ..game.Players.LocalPlayer.Name.. "-" ..identifyexecutor() .."-discord.gg/BW55cR7Z [Source can be viewed]",
	Icon = 97914301936069,
	NotifySide = "Right",
	ShowCustomCursor = false,
	Center = true,
    AutoShow = true,
    Resizable = true,
    TabPadding = 8,
    MenuFadeTime = 0
})

local Tabs = {
    new = Window:AddTab('公告','external-link','公告&信息'),
    Main = Window:AddTab('玩家','user','修改&篡改'),
    Aimbot = Window:AddTab('自瞄','mouse','让你自瞄的更准!!!'),
    Esp = Window:AddTab('ESP','scan-eye','让你能够透视他们!!!'),
    NotificationListen = Window:AddTab('通知提示','eye','让你帮助你监听杀手!!!'),
    FightingKilling = Window:AddTab('战斗&杀戮','swords','让变得打击更轻松!!!'),
    BanEffect = Window:AddTab('反效果','ban','让你无法受到效果!!!'),
    AnimationAction = Window:AddTab('动作','file','让你在别人面前动作炫酷!!!'),
    PhysicalStrength = Window:AddTab('体力','zap','让你奔跑体力最大!!!'),
    Generator = Window:AddTab('发动机','star','让你修发动机更快!!!'),
    Pizza = Window:AddTab('披萨','pencil','让你快速吃到披萨!!!'),
    ["UI Settings"] = Window:AddTab("设置","settings",'设置&调试'),
}

local _env = getgenv and getgenv() or {}
local _hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

task.spawn(function()
    while task.wait() do
        local _isKiller = false

        if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
            for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                if v:GetAttribute("Username") and game.Players:FindFirstChild(v:GetAttribute("Username")) then
                    killerModel = v
                end

                if v:GetAttribute("Username") == localPlayer.Name then
                    killerModel = v
                    _isKiller = true
                end
            end

            isSurvivor = not _isKiller
            isKiller = _isKiller
        end
    end
end)

local function hasAbility(name)
    return localPlayer.PlayerGui.MainUI:FindFirstChild("AbilityContainer")
        and localPlayer.PlayerGui.MainUI.AbilityContainer:FindFirstChild(name)
end

local function hasAbilityReady(name)
    if not hasAbility(name) then
        return false
    end

    return hasAbility(name).CooldownTime.Text == ""
end

function killerAttack()
    if hasAbilityReady("Slash") then
        Network.RemoteEvent:FireServer("UseActorAbility", {buffer.fromstring("\"Slash\"")})
    elseif hasAbilityReady("Punch") then
        Network.RemoteEvent:FireServer("UseActorAbility", {buffer.fromstring("\"Punch\"")})
    elseif hasAbilityReady("Stab") then
        Network.RemoteEvent:FireServer("UseActorAbility", {buffer.fromstring("\"Stab\"")})
    elseif hasAbilityReady("Carving Slash") then
        Network.RemoteEvent:FireServer("UseActorAbility", {buffer.fromstring("\"Carving Slash\"")})
    end
end

local information = Tabs.new:AddLeftGroupbox('玩家 信息','info')

information:AddLabel("执行器 : " ..identifyexecutor())
information:AddLabel("用户名 : " ..game.Players.LocalPlayer.Name)
information:AddLabel("用户Id : "..game.Players.LocalPlayer.UserId)
information:AddLabel("昵称 : "..game.Players.LocalPlayer.DisplayName)
information:AddLabel("账户年龄 : "..game.Players.LocalPlayer.AccountAge.." 天")


local Discord = Tabs.new:AddLeftGroupbox('Discord','external-link')

Discord:AddButton({
    Text = "复制 LightStar Discord 链接",
    Func = function ()
setclipboard("https://discord.gg/BW55cR7Z")
       end
})

Discord:AddButton({
    Text = "复制 Nolsaken Discord 链接",
    Func = function ()
setclipboard("https://discord.gg/CvB4H8xgEM")
       end
})

local Contributor = Tabs.new:AddRightGroupbox('贡献者')

Contributor:AddLabel("<b><font color=\"rgb(0, 0, 255)\">[JackEyeKL]</font></b> - 脚本作者")

Contributor:AddLabel("<b><font color=\"rgb(128, 0, 128)\">[宇星辰丫]</font></b> - 提供原脚本部分源码")

local LightStar = Tabs.new:AddRightGroupbox('日志','users')

LightStar:AddLabel("新更新<b><font color=\"rgb(0, 255, 0)\">LightStar脚本</font></b>内容 * 4")

LightStar:AddDivider()

LightStar:AddLabel("添加<b><font color=\"rgb(0, 255, 0)\">Noli VoidRush反碰撞</font></b>功能了")

LightStar:AddLabel("添加<b><font color=\"rgb(0, 255, 0)\">Noli VoidRush无视碰撞</font></b>功能了")

LightStar:AddLabel("添加<b><font color=\"rgb(0, 255, 0)\">低画质</font></b>功能了")

LightStar:AddLabel("添加<b><font color=\"rgb(0, 255, 0)\">饼干Esp</font></b>功能了")

local KillerSurvival = Tabs.Main:AddLeftGroupbox("玩家函数","user")

game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if _env.NoStun == true and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 16 then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if _env.NoStun == true and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 16 then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end)
end)

KillerSurvival:AddToggle("AntiSlow", {
    Text = "无减速",
    Default = false,
    Callback = function()
        task.spawn(function()
            while Toggles.AntiSlow.Value and task.wait() do
                if localPlayer.Character and localPlayer.Character:FindFirstChild("SpeedMultipliers") then
                    for i, v in localPlayer.Character.SpeedMultipliers:GetChildren() do
                        if v.Value < 1 then
                            v.Value = 1
                        end
                    end
                end
            end
        end)
    end
})

KillerSurvival:AddToggle("AntiStun", {
    Text = "无眩晕",
    Default = false,
    Callback = function()
        task.spawn(function()
            while Toggles.AntiStun.Value and task.wait() do
                if localPlayer.Character and localPlayer.Character:FindFirstChild("SpeedMultipliers") then
                    if localPlayer.Character.SpeedMultipliers:FindFirstChild("Stunned") then
                        localPlayer.Character.SpeedMultipliers:FindFirstChild("Stunned").Value = 1
                    end
                end
            end
        end)
    end
})

KillerSurvival:AddToggle("AlwaysSprint", {
    Text = "一直保持奔跑状态",
    Default = false,
    Callback = function (call)
        _G.alwaysSprint = call
        task.spawn(function()
            while _G.alwaysSprint and task.wait() do
                local sprint = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
                if not sprint.IsSprinting then
                    sprint.IsSprinting = true
                    sprint.__sprintedEvent:Fire(true)
                end
            end
        end)
    end
})

KillerSurvival:AddDivider()

KillerSurvival:AddSlider("SB",{
    Text = "速度调节",
    Min = 0, Max = 3,
    Default = 1, Compact = true,
    Rounding = 1,
    Callback = function(v)
        _env.SpeedBoostValue = v
    end
})

_env.SpeedBoostValue = 1

KillerSurvival:AddToggle("SB",{
    Text = "启用速度",
    Callback = function(v)
        _env.SpeedBoost = v
        while _env.SpeedBoost do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame += game.Players.LocalPlayer.Character.Humanoid.MoveDirection * _env.SpeedBoostValue
            game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
            task.wait()
        end
    end
})

KillerSurvival:AddToggle("AllowJump", {
    Text = "启用跳跃",
    Default = false,
    Callback = function (state)
        _G.AllowJump = state

        if state then
            Notify("LightStar-警告", "反复跳跃会踢你 因为游戏会认为你正在飞行！", 9)
        end

        task.spawn(function ()
            while task.wait() do
                if not _G.AllowJump then break end
                local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")

                if humanoid then
                    humanoid.JumpPower = 50
                end
            end
        end)
    end
})

local cachedParts = {}
function enableNoclip()
    if localPlayer.Character then
        for _, v in pairs(localPlayer.Character.GetChildren(localPlayer.Character)) do
            if v:IsA("BasePart") then
                cachedParts[v] = v
                v.CanCollide = false
            end
        end
    end
end
function disableNoclip()
    for _, v in pairs(cachedParts) do
        v.CanCollide = true
    end
end

KillerSurvival:AddToggle("EnableNoclip", {
    Text = "启用穿墙",
    Default = false,
    Callback = function (s)
        _G.noclipState = s
        task.spawn(function ()
            while task.wait() do
                if not _G.noclipState then
                    disableNoclip()
                    break
                end

                enableNoclip()
            end
        end)
    end
})

KillerSurvival:AddDivider()

KillerSurvival:AddToggle('AlwaysShowChat', {
        Text = "显示聊天框",
        Callback = function(state)
            if state then
                _G.showChat = true
                task.spawn(function()
                    while _G.showChat and task.wait() do                        game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration").Enabled = true
                    end
                end)
            else
                _G.showChat = false
                if playingState ~= "Spectating" then                   game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration").Enabled = false
                end
            end
        end
})

local loopRunning, loopThread, currentAnim, lastAnim
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://75804462760596"

KillerSurvival:AddToggle("Invis", {
    Text = "隐身",
    Default = false,
    Callback = function(Value)
        if Value then
            Notify("LightStar-警告", "当人们使用某些能力时 您仍然可以看到 或者如果他们有碰撞枪箱设置", 6)
            loopRunning = true

            loopThread = task.spawn(function()
                while loopRunning do
                    local hum = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("Humanoid")
                    if hum then
                        enableNoclip()
                    end

                    if hum then
                        local loadedAnim = hum:LoadAnimation(anim)
                        currentAnim = loadedAnim
                        loadedAnim.Looped = false
                        loadedAnim:Play()
                        loadedAnim:AdjustSpeed(0)
                        task.wait(0.1)
                        if lastAnim then
                            lastAnim:Stop()
                            lastAnim:Destroy()
                        end
                        lastAnim = currentAnim
                    else
                        currentAnim = nil
                    end
                    task.wait()
                end
            end)
        else
            loopRunning = false

            if loopThread then
                loopRunning = false
                task.cancel(loopThread)
            end

            if currentAnim then
                currentAnim:Stop()
                currentAnim = nil
            end

            local Humanoid = localPlayer.Character and (localPlayer.Character:FindFirstChildOfClass("Humanoid") or localPlayer.Character:FindFirstChildOfClass("AnimationController"))
            if Humanoid then
                for _, v in pairs(Humanoid:GetPlayingAnimationTracks()) do
                    v:AdjustSpeed(100000)
                end
                for _, v in pairs(localPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end

            local animateScript = localPlayer.Character and localPlayer.Character:FindFirstChild("Animate")
            if animateScript then
                animateScript.Disabled = true
                animateScript.Disabled = false
            end
        end
    end
})

KillerSurvival:AddButton({
    Text = "低画质",
    Func = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/vexroxd/My-Script-/main/roblox%20fps%20unlocker%20script.lua'))()
   end
})











local SM = Tabs.Main:AddLeftGroupbox('TweTime背刺')





function hasNotification(text)
    for i, v in pairs(localPlayer.PlayerGui.Notis:GetChildren()) do
        if string.find(v.Text:lower(), text) then
            return true
        end
    end
end
local function backstab(model)
    if not model then
        return
    else
        local stabbing = tick()
        local oldCf = localPlayer.Character.HumanoidRootPart.CFrame
        task.spawn(function()
            task.wait(0.2)
            Network:WaitForChild("RemoteEvent"):FireServer("UseActorAbility", {buffer.fromstring("\"Dagger\"")})
        end)
        repeat
            localPlayer.Character.HumanoidRootPart.CFrame = model.HumanoidRootPart.CFrame - (model.HumanoidRootPart.CFrame.LookVector * 1)
            task.wait()
        until (tick() - stabbing >= 3.5) or hasNotification("stab")
        task.wait(0.5)
        localPlayer.Character.HumanoidRootPart.CFrame = oldCf
    end
end
local function backstabClose(model)
    if not model then
        return
    else
        if (localPlayer.Character.HumanoidRootPart.Position - model.HumanoidRootPart.Position).magnitude <= Options.BackstabRange.Value then
            backstab(model)
        end
    end
end

SM:AddToggle("AutoDagger", {
    Text = "自动背刺",
    Default = false,
    Callback = function(cool)
        task.spawn(function()
            while Toggles.AutoDagger.Value and task.wait(0.1) do
                if hasAbilityReady("Dagger") and isSurvivor then
                    local suc, res = pcall(backstab, killerModel)
                    if not suc then
                        warn("error when backstabbing:", res)
                    end
                end
            end
        end)
    end
})
SM:AddToggle("DaggerAura", {
    Text = "背刺光环",
    Default = false,
    Callback = function(cool)
        task.spawn(function()
            while Toggles.DaggerAura.Value and task.wait(0.1) do
                if not Toggles.AutoDagger.Value and hasAbilityReady("Dagger") and isSurvivor then
                    local suc, res = pcall(backstabClose, killerModel)
                    if not suc then
                        warn("error when backstabbing near killer:", res)
                    end
                end
            end
        end)
    end
})


SM:AddSlider("BackstabRange", {
    Text = "背刺光环范围",
    Default = 20,
    Min = 7,
    Max = 99,
    Rounding = 0
})

























local MainTabbox = Tabs.Main:AddRightTabbox()
local Camera = MainTabbox:AddTab("相机")

Camera:AddToggle('IZD', {
    Text = "自由缩放",
    Callback = function(state)
        localPlayer.CameraMaxZoomDistance = state and math.huge or 12
    end
})

Camera:AddToggle('IZD', {
    Text = "相机穿墙",
    Callback = function(state)
        localPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode[state and "Invisicam" or "Zoom"]
    end
})

Camera:AddToggle("SpectateKiller", {
    Text = "旁观杀手",
    Default = false,
    Callback = function (state)
        if state then
            local killer = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") and workspace.Players.Killers:GetChildren()[1]
            if killer then
                workspace.CurrentCamera.CameraSubject = killer
            end
        else
            pcall(function()
                workspace.CurrentCamera.CameraSubject = localPlayer.Character
            end)
        end
    end
})







local Lighting = MainTabbox:AddTab("亮度")

Lighting:AddSlider("B",{
    Text = "亮度数值",
    Min = 0,
    Default = 0,
    Max = 3,
    Rounding = 1,
    Compact = true,
    Callback = function(v)
        _env.Brightness = v
    end
})

Lighting:AddToggle("无阴影",{
    Text = "无阴影",
    Default = false,
    Callback = function(v)
        _env.GlobalShadows = v
    end
})

Lighting:AddToggle("除雾",{
    Text = "除雾",
    Default = false,
    Callback = function(v)
        _env.NoFog = v
    end
})

Lighting:AddDivider()

Lighting:AddToggle("启用功能",{
    Text = "启用",
    Default = false,
    Callback = function(v)
        _env.Fullbright = v
        game:GetService("RunService").RenderStepped:Connect(function()
            if not game.Lighting:GetAttribute("FogStart") then 
                game.Lighting:SetAttribute("FogStart", game.Lighting.FogStart) 
            end
            if not game.Lighting:GetAttribute("FogEnd") then 
                game.Lighting:SetAttribute("FogEnd", game.Lighting.FogEnd) 
            end
            game.Lighting.FogStart = _env.NoFog and 0 or game.Lighting:GetAttribute("FogStart")
            game.Lighting.FogEnd = _env.NoFog and math.huge or game.Lighting:GetAttribute("FogEnd")
            
            local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
            if fog then
                if not fog:GetAttribute("Density") then 
                    fog:SetAttribute("Density", fog.Density) 
                end
                fog.Density = _env.NoFog and 0 or fog:GetAttribute("Density")
            end
            
            if _env.Fullbright then
                game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
                game.Lighting.Brightness = _env.Brightness or 0
                game.Lighting.GlobalShadows = not _env.GlobalShadows
            else
                game.Lighting.OutdoorAmbient = Color3.fromRGB(55,55,55)
                game.Lighting.Brightness = 0
                game.Lighting.GlobalShadows = true
            end
        end)
    end
    
})











local Telephone = Tabs.Main:AddRightGroupbox('传送')





Telephone:AddButton({
    Text = "传送杀手",
    Func = function ()
        if playingState == "Spectating" then
            return Notify("LightStar-提示", "必须在一轮 窥视时无法使用此功能", 7)
        end

        local killer = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") and workspace.Players.Killers:GetChildren()[1]
        if killer then
            pcall(function()
                localPlayer.Character.HumanoidRootPart.CFrame = killer.PrimaryPart.CFrame
            end)
        end
    end
})

Telephone:AddButton({
    Text = "传送随机幸存者",
    Func = function()
        if playingState == "Spectating" then
            return Notify("LightStar-提示", "必须在一轮 窥视时无法使用此功能", 7)
        end
        pcall(function()
            if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then return end
            local survs = workspace.Players.Survivors:GetChildren()
            if #survs == 0 then return end

            localPlayer.Character.HumanoidRootPart.CFrame = survs[math.random(1, #survs)].HumanoidRootPart.CFrame
        end)
    end
})















local ZZ = Tabs.Main:AddRightGroupbox('物品')

ZZ:AddToggle("AutoPickUpNearItems", {
    Text = "自动捡最近的物品",
    Default = false,
    Callback = function (call)
        _G.pickUpNear = call
        task.spawn(function()
            while _G.pickUpNear and task.wait() do
                pcall(function()
                    if isKiller then return end
                    local items = {}
                    if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") then
                        for _, v in pairs(gameMap.Ingame:GetChildren()) do
                            if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                                table.insert(items, v.ItemRoot)
                            end
                        end
                        for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                            if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                                table.insert(items, v.ItemRoot)
                            end
                        end
                    end
                    for _, itemRoot in pairs(items) do
                        local lp = localPlayer
                        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                            local magnitude = (lp.Character.HumanoidRootPart.Position - itemRoot.Position).Magnitude
                            if magnitude <= 10 then
                                if itemRoot:FindFirstChild("ProximityPrompt") then
                                    fireproximityprompt(itemRoot.ProximityPrompt)
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

ZZ:AddButton({
    Text = "传送拿起可用物品",
    Func = function()
        pcall(function()
            if isKiller then return end
            local items = {}
            if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") then
                for _, v in pairs(gameMap.Ingame:GetDescendants()) do
                    if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                        table.insert(items, v.ItemRoot)
                    end
                end
            end
            for _, itemRoot in pairs(items) do
                local toolName = itemRoot.Parent and itemRoot.Parent.Name
                if toolName and not localPlayer.Backpack:FindFirstChild(toolName) then
                    localPlayer.Character.HumanoidRootPart.CFrame = itemRoot.CFrame
                    task.wait(0.5)
                    if itemRoot:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(itemRoot.ProximityPrompt)
                    end
                end
            end
        end)
    end
})

local Auto = Tabs.Main:AddRightGroupbox('自动')

Auto:AddSlider("AutoShedlesktlyFriedChickenHealth",{
    Text = "低于血量",
    Min = 15,
    Default = 65,
    Max = 95,
    Callback = function()
       end
})

Auto:AddToggle("AutoShedlesktlyFriedChicken", { 
    Text = "自动谢德鸡腿",
    Tooltip = "血量低于上方的值就会自动吃鸡腿技能",
    Callback = function()
        while Toggles.AutoShedlesktly.Value and task.wait() do
            pcall(function()
                if isKiller then return end
                if localPlayer.Character.Humanoid.Health <= Options.AutoShedlesktlyFriedChickenHealth.Value then
                    actor.FireServer(actor, "UseActorAbility", {buffer.fromstring("\"FriedChicken\"")})
                end
            end)
        end
    end
})

Auto:AddDivider()

Auto:AddSlider("AutoChanceCoinFlipmew",{
    Text = "#秒抛1次硬币",
    Min = 1.8,
    Default = 1.8,
    Max = 5,
    Callback = function()
       end
})

Auto:AddToggle("AutoChanceCoinFlip", {
    Text = "自动Chance抛硬币",
    Default = false,
    Callback = function (cool)
        _G.coin = cool
        task.spawn(function()
            while _G.coin and task.wait(Options.AutoChanceCoinFlipmew.Value) do
                Network:WaitForChild("RemoteEvent"):FireServer("UseActorAbility", {buffer.fromstring("\"CoinFlip\"")})
            end
        end)
    end
})




local Size = 5
local speed = 1
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local rootPart = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")

-- 为每个自瞄功能创建独立的最大距离变量
local chanceMaxDistance = 50
local twoTimeMaxDistance = 50
local shedletskyMaxDistance = 50
local x1x4MaxDistance = 50
local coolMaxDistance = 50
local johnMaxDistance = 50
local jasonMaxDistance = 50







-- 创建UI
local SB = Tabs.Aimbot:AddLeftGroupbox('幸存者')

-- Chance自瞄距离滑块
SB:AddSlider('ChanceDistance', {
    Text = 'Chance自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        chanceMaxDistance = value
    end
})

-- TwoTime自瞄距离滑块
SB:AddSlider('TwoTimeDistance', {
    Text = 'TwoTime自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        twoTimeMaxDistance = value
    end
})

-- 谢德自瞄距离滑块
SB:AddSlider('ShedletskyDistance', {
    Text = '谢德自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        shedletskyMaxDistance = value
    end
})

-- 幸存者自瞄功能
local function chanceAimbot(state)
    CA = state
    if state then
        if game.Players.LocalPlayer.Character.Name ~= "Chance" then
            Library:Notify("你用的角色不是Chance 无法生效", nil, 4590657391)
            return
        end
        
        local RemoteEvent = game:GetService("ReplicatedStorage")
            :WaitForChild("Modules")
            :WaitForChild("Network")
            :WaitForChild("RemoteEvent")
            
        CAbotConnection = RemoteEvent.OnClientEvent:Connect(function(...)
            local args = {...}
            if args[1] == "UseActorAbility" and args[2] == "Shoot" then 
                local killerContainer = game.Workspace.Players:FindFirstChild("Killers")
                if killerContainer then 
                    local killer = killerContainer:FindFirstChildOfClass("Model")
                    if killer and killer:FindFirstChild("HumanoidRootPart") then 
                        local killerHRP = killer.HumanoidRootPart
                        local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if playerHRP then 
                            local distance = (killerHRP.Position - playerHRP.Position).Magnitude
                            if distance <= chanceMaxDistance then
                                local TMP = 0.35
                                local AMD = 2
                                local endTime = tick() + AMD
                                while tick() < endTime do
                                    RunService.RenderStepped:Wait()
                                    local predictedTarget = killerHRP.Position + (killerHRP.Velocity * TMP)
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = killerHRP.CFrame + Vector3.new(0, 0, -2)
                                end
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = PICF
                            end
                        end
                    end
                end
            end
        end)
    else
        if CAbotConnection then
            CAbotConnection:Disconnect()
            CAbotConnection = nil
        end
    end
end

local function TWO(state)
    local TWOsounds = {
        "rbxassetid://86710781315432",
        "rbxassetid://99820161736138"
    }
    
    TWOTIME = state

    if game:GetService("Players").LocalPlayer.Character.Name ~= "TwoTime" and state then
        Library:Notify("你的角色不是TwoTime 无法生效", nil, 4590657391)
        return 
    end

    if state then
        TWOloop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not TWOTIME then return end
            for _, v in pairs(TWOsounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= twoTimeMaxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            local maxIterations = 100 
                            
                            if child.Name == "rbxassetid://79782181585087" then
                                maxIterations = 220  
                            end

                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))  
                            end
                        end
                    end
                end
            end
        end)
    else
        if TWOloop then
            TWOloop:Disconnect()
            TWOloop = nil
        end
    end
end

local function shedletskyAimbot(state)
    shedaim = state
    if state then
        if game:GetService("Players").LocalPlayer.Character.Name ~= "Shedletsky" then
            Library:Notify("你的角色不是谢德 无法生效", nil, 4590657391)
            return
        end
        
        shedloop = game:GetService("Players").LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
            if not shedaim then return end
            if child:IsA("Sound") then 
                local FAN = child.Name
                if FAN == "rbxassetid://12222225" or FAN == "83851356262523" then 
                    local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                    if killersFolder then 
                        local killer = killersFolder:FindFirstChildOfClass("Model")
                        if killer and killer:FindFirstChild("HumanoidRootPart") then 
                            local killerHRP = killer.HumanoidRootPart
                            local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if playerHRP then 
                                local distance = (killerHRP.Position - playerHRP.Position).Magnitude
                                if distance <= shedletskyMaxDistance then
                                    local num = 1
                                    local maxIterations = 100
                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    else
        if shedloop then 
            shedloop:Disconnect()
            shedloop = nil
        end
    end
end

-- 杀手UI
local SC = Tabs.Aimbot:AddRightGroupbox('杀手')

-- 1x4自瞄距离滑块
SC:AddSlider('X1X4Distance', {
    Text = '1x4自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        x1x4MaxDistance = value
    end
})

-- 小孩自瞄距离滑块
SC:AddSlider('CoolDistance', {
    Text = '酷小孩自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        coolMaxDistance = value
    end
})

-- 约翰自瞄距离滑块
SC:AddSlider('JohnDistance', {
    Text = '约翰 多自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        johnMaxDistance = value
    end
})

-- 杰森自瞄距离滑块
SC:AddSlider('JasonDistance', {
    Text = '杰森自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        jasonMaxDistance = value
    end
})

-- 杀手自瞄功能
local function aimbot1x1x1x1(state)
    local aimbot1x1sounds = {
        "rbxassetid://101593173978979",
        "rbxassetid://72296288942160"
    }
    
    aimbot1x1 = state
    
    if game:GetService("Players").LocalPlayer.Character.Name ~= "1x1x1x1" and state then
        Library:Notify("你的角色不是1x4 无法生效", nil, 4590657391)
        return 
    end

    if state then
        aimbot1x1loop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not aimbot1x1 then return end
            for _, v in pairs(aimbot1x1sounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= x1x4MaxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            local maxIterations = 100 
                            
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if aimbot1x1loop then
            aimbot1x1loop:Disconnect()
            aimbot1x1loop = nil
        end
    end
end

local function cool(state)
    local coolsounds = {
        "rbxassetid://111033845010938",
        "rbxassetid://106484876889079"
    }
    
    cool = state

    if game:GetService("Players").LocalPlayer.Character.Name ~= "c00lkidd" and state then
        Library:Notify("你的角色不是c00lkidd 无法生效", nil, 4590657391)
        return 
    end

    if state then
        coolloop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not cool then return end
            for _, v in pairs(coolsounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= coolMaxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            local maxIterations = 100 
                            
                            if child.Name == "rbxassetid://79782181585087" then
                                maxIterations = 220  
                            end

                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                            end
                        end
                    end
                end
            end
        end)
    else
        if coolloop then
            coolloop:Disconnect()
            coolloop = nil
        end
    end
end

local function johnaimbot(state)
    local johnaimbotsounds = {
        "rbxassetid://109525294317144"
    }
    
    johnaim = state
    if game:GetService("Players").LocalPlayer.Character.Name ~= "JohnDoe" and state then
        Library:Notify("你的角色不是JohnDoe 无法生效", nil, 4590657391)
        return 
    end
    
    if state then
        johnloop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not johnaim then return end
            for _, v in pairs(johnaimbotsounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= johnMaxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local maxIterations = 330
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if johnloop then
            johnloop:Disconnect()
            johnloop = nil
        end
    end
end

local function jasonaimbot(state)
    local jasonaimbotsounds = {
        "rbxassetid://112809109188560",
        "rbxassetid://102228729296384"
    }
    
    jasonaim = state
    if game:GetService("Players").LocalPlayer.Character.Name ~= "Jason" and state then
        Library:Notify("你的角色不是Jason 无法生效", nil, 4590657391)
        return 
    end
    
    if state then
        jasonaimbotloop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not jasonaim then return end
            for _, v in pairs(jasonaimbotsounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= jasonMaxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local maxIterations = 70
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if jasonaimbotloop then
            jasonaimbotloop:Disconnect()
            jasonaimbotloop = nil
        end
    end
end

-- 幸存者UI
SB:AddToggle('MyToggle', {
    Text = 'Chance 自瞄 ',
    Default = false,
    Callback = chanceAimbot
})

SB:AddToggle('MyToggle', {
    Text = 'TwoTime 自瞄',
    Default = false,
    Callback = TWO
})

SB:AddToggle('MyToggle', {
    Text = '谢德 自瞄',
    Default = false,
    Callback = shedletskyAimbot
})

-- 杀手UI
SC:AddToggle('MyToggle', {
    Text = '1x4自瞄',
    Default = false,
    Callback = aimbot1x1x1x1
})

SC:AddToggle('MyToggle', {
    Text = '酷小孩自瞄',
    Default = false,
    Callback = cool
})

SC:AddToggle('MyToggle', {
    Text = '约翰 多自瞄',
    Default = false,
    Callback = johnaimbot
})

SC:AddToggle('MyToggle', {
    Text = '杰森自瞄',
    Default = false,
    Callback = jasonaimbot
})



local SpecialAimbot = Tabs.Aimbot:AddLeftGroupbox("角色自瞄(静默)")

-- 默认距离设置
local defaultAimDistance = 100
local aimDistanceSettings = {
    CSA = defaultAimDistance,
    SSA = defaultAimDistance,
    GAA = defaultAimDistance
}

-- 添加距离调节滑块
SpecialAimbot:AddSlider("CSA_Distance", {
    Text = "Chance自瞄距离",
    Default = defaultAimDistance,
    Min = 10,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        aimDistanceSettings.CSA = value
    end
})

SpecialAimbot:AddSlider("SSA_Distance", {
    Text = "谢德自瞄距离",
    Default = defaultAimDistance,
    Min = 10,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        aimDistanceSettings.SSA = value
    end
})

SpecialAimbot:AddSlider("GAA_Distance", {
    Text = "访客自瞄距离",
    Default = defaultAimDistance,
    Min = 10,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        aimDistanceSettings.GAA = value
    end
})

function AimShootChance(value)
    local aimshootchance = value
    if value then
        local chanceaimbotsounds = {
            "rbxassetid://201858045",
            "rbxassetid://139012439429121"
        }
        aimshootchance = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not aimshootchance then return end
            for _, v in ipairs(chanceaimbotsounds) do
                if child.Name == v then
                    local targetkiller = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                    if targetkiller and targetkiller:FindFirstChild("HumanoidRootPart") then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local distance = (targetkiller.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if distance <= aimDistanceSettings.CSA then
                                local number = 1
                                game:GetService("RunService").RenderStepped:Connect(function()
                                    if number <= 100 then
                                        task.wait(0.01)
                                        number = number + 1
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 
                                            targetkiller.HumanoidRootPart.Position
                                        )
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end)
    else
        if aimshootchance then
            aimshootchance:Disconnect()
        end
    end
end

function AimSlashShedletsky(value)
    local aimslashsword = value
    if value then
        local shedaimbotsounds = {
            "rbxassetid://106397684977541",
            "rbxassetid://106397684977541"
        }
        aimslash = game.Players.LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
            if not aimslashsword then return end
            for _, v in ipairs(shedaimbotsounds) do
                if child.Name == v then
                    local targetkiller = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                    if targetkiller and targetkiller:FindFirstChild("HumanoidRootPart") then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local distance = (targetkiller.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if distance <= aimDistanceSettings.SSA then
                                local number = 1
                                game:GetService("RunService").RenderStepped:Connect(function()
                                    if number <= 100 then
                                        task.wait(0.01)
                                        number = number + 1
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 
                                            targetkiller.HumanoidRootPart.Position
                                        )
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end)
    else
        if aimslash then
            aimslash:Disconnect()
        end
    end
end

function AimAttackGuest(value)
    local aimattackguest = value
    if value then
        aimguest = game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent.OnClientEvent:Connect(function(eventName, eventArg)
            if not aimattackguest then return end
            if eventName == "UseActorAbility" and eventArg == "Punch" then
                local targetkiller = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                if targetkiller and targetkiller:FindFirstChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (targetkiller.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= aimDistanceSettings.GAA then
                            local number = 1
                            local connection
                            connection = game:GetService("RunService").RenderStepped:Connect(function()
                                if number <= 100 then
                                    task.wait(0.01)
                                    number = number + 1
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 
                                        targetkiller.HumanoidRootPart.Position
                                    )
                                else
                                    connection:Disconnect()
                                end
                            end)
                        end
                    end
                end
            end
        end)
    else
        if aimguest then
            aimguest:Disconnect()
        end
    end
end

SpecialAimbot:AddToggle("CSA",{
    Text = "Chance自瞄",
    Callback = function(v)
        AimShootChance(v)
    end
})

SpecialAimbot:AddToggle("SSA",{
    Text = "谢德自瞄",
    Callback = function(v)
        AimSlashShedletsky(v)
    end
})

SpecialAimbot:AddToggle("GAA",{
    Text = "访客自瞄",
    Callback = function(v)
        AimAttackGuest(v)
    end
})


local function chanceAimbot(state)
    local settings = {
        maxDistance = 50,
        predictionFactor = 0.5,
        smoothFactor = 0.2
    }

    local CA = false
    local CAbotConnection = nil

    local function activateAimbot()
        if not game:GetService("Players").LocalPlayer.Character then return end
        if game.Players.LocalPlayer.Character.Name ~= "Chance" then
            Library:Notify("需要Chance角色才能使用", nil, 4590657391)
            return
        end

        local RemoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
        
        CAbotConnection = RemoteEvent.OnClientEvent:Connect(function(...)
            local args = {...}
            if args[1] == "UseActorAbility" and args[2] == "Shoot" then 
                local killerContainer = game.Workspace.Players:FindFirstChild("Killers")
                if killerContainer then 
                    local killer = killerContainer:FindFirstChildOfClass("Model")
                    if killer and killer:FindFirstChild("HumanoidRootPart") then 
                        local killerHRP = killer.HumanoidRootPart
                        local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then 
                            local distance = (killerHRP.Position - playerHRP.Position).Magnitude
                            if distance <= settings.maxDistance then
                                local originalCFrame = playerHRP.CFrame
                                local originalCamCFrame = workspace.CurrentCamera.CFrame
                                
                                while CA do
                                    RunService.RenderStepped:Wait()
                                    local predictedPosition = killerHRP.Position + (killerHRP.Velocity * settings.predictionFactor)
                                    local targetCFrame = CFrame.lookAt(playerHRP.Position, predictedPosition)
                                    playerHRP.CFrame = playerHRP.CFrame:Lerp(targetCFrame, settings.smoothFactor)
                                    local camTarget = CFrame.new(workspace.CurrentCamera.CFrame.Position, predictedPosition)
                                    workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(camTarget, settings.smoothFactor)
                                end
                                
                                if CA then
                                    playerHRP.CFrame = originalCFrame
                                    workspace.CurrentCamera.CFrame = originalCamCFrame
                                end
                            end
                        end
                    end
                end
            end
        end)
    end

    CA = state
    if state then
        activateAimbot()
    else
        if CAbotConnection then
            CAbotConnection:Disconnect()
            CAbotConnection = nil
        end
    end
end








local ZZ = Tabs.Aimbot:AddLeftGroupbox('自瞄杀手')


local aimSettings = {
    distance = 100,
    fov = 100,
    size = 10,
    noWall = false,
    rainbowMode = true 
}

local aimbotData = {
    FOVring = nil,
    connections = {}
}

ZZ:AddSlider('AimDistance', {
    Text = '自瞄距离',
    Default = 100,
    Min = 0,
    Max = 1000,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        aimSettings.distance = Value
    end
})

ZZ:AddSlider('FOVSize', {
    Text = '圈圈大小',
    Default = 100,
    Min = 0,
    Max = 1000,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        aimSettings.fov = Value
    end
})

ZZ:AddSlider('TargetSize', {
    Text = '自瞄大小',
    Default = 10,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        aimSettings.size = Value
    end
})

ZZ:AddToggle('NoWallToggle', {
    Text = '掩体检测',
    Default = false,
    Tooltip = '自瞄',
    Callback = function(state)
        aimSettings.noWall = state
    end
})

ZZ:AddDropdown('ColorSelector', {
    Values = {
        '红色',
        '绿色',
        '蓝色',
        '白色',
        '黄色',
        '青色',
        '洋红色',
        '彩虹'
    },
    Default = 8,  
    Multi = false,
    Text = '选择颜色',
    Tooltip = '用于自瞄圈圈的颜色',
    Callback = function(Value)
        local colorMap = {
            ["红色"] = Color3.fromRGB(255, 0, 0),
            ["绿色"] = Color3.fromRGB(0, 255, 0),
            ["蓝色"] = Color3.fromRGB(0, 0, 255),
            ["白色"] = Color3.fromRGB(255, 255, 255),
            ["黄色"] = Color3.fromRGB(255, 255, 0),
            ["青色"] = Color3.fromRGB(0, 255, 255),
            ["洋红色"] = Color3.fromRGB(255, 0, 255)
        }

        if Value == '彩虹' then
            aimSettings.rainbowMode = true
        else
            aimSettings.rainbowMode = false
            local selectedColor = colorMap[Value] or Color3.fromRGB(231, 231, 236)
            if aimbotData.FOVring then
                aimbotData.FOVring.Color = selectedColor
            end
        end
    end
})

local bai = {}
bai.Aim = false
local aimConnection

ZZ:AddToggle("AimbotToggle", {
    Text = "自瞄杀手",
    Default = false,
    Callback = function(state)
        bai.Aim = state
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local Cam = workspace.CurrentCamera
        local UserInputService = game:GetService("UserInputService")
        local RaycastParams = RaycastParams.new()
        RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist

        
        local function cleanup()
            if aimbotData.FOVring then
                aimbotData.FOVring:Remove()
                aimbotData.FOVring = nil
            end
            if aimConnection then
                aimConnection:Disconnect()
                aimConnection = nil
            end
        end

        
        if state then
            if not aimbotData.FOVring then
                aimbotData.FOVring = Drawing.new("Circle")
                aimbotData.FOVring.Visible = true
                aimbotData.FOVring.Thickness = 2
                aimbotData.FOVring.Filled = false
                aimbotData.FOVring.Color = Color3.fromHSV(0, 1, 1)  
            end

            aimConnection = RunService.RenderStepped:Connect(function()
              
                aimbotData.FOVring.Radius = aimSettings.fov
                aimbotData.FOVring.Position = Cam.ViewportSize / 2

               
                local killersFolder = workspace.Players:FindFirstChild("Killers")
                local target = nil
                local closestDist = math.huge
                local mousePos = Cam.ViewportSize / 2

                if killersFolder then
                    for _, killerModel in pairs(killersFolder:GetChildren()) do
                        local hrp = killerModel:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local screenPos, onScreen = Cam:WorldToViewportPoint(hrp.Position)
                            local distance = (Cam.CFrame.Position - hrp.Position).Magnitude
                            if onScreen and distance <= aimSettings.distance then
                                if aimSettings.noWall then
                                    RaycastParams.FilterDescendantsInstances = {
                                        Players.LocalPlayer.Character,
                                        workspace.Players
                                    }
                                    local result = workspace:Raycast(Cam.CFrame.Position, hrp.Position - Cam.CFrame.Position, RaycastParams)
                                    if result and not result.Instance:IsDescendantOf(killerModel) then
                                        break
                                    end
                                end
                                local screenDist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                                if screenDist < closestDist and screenDist <= aimSettings.fov then
                                    closestDist = screenDist
                                    target = hrp
                                end
                            end
                        end
                    end
                end

                if target then
                    local lookVector = (target.Position - Cam.CFrame.Position).Unit
                    Cam.CFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
                end

                
                if aimSettings.rainbowMode and aimbotData.FOVring then
                    local hue = (tick() * 0.2) % 1
                    aimbotData.FOVring.Color = Color3.fromHSV(hue, 1, 1)
                end
            end)

           
            aimbotData.connections.keyEvent = UserInputService.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Delete then
                    bai.Aim = false
                    Spy:SetValue(false)
                    cleanup()
                end
            end)
        else
            cleanup()
        end
    end
})





local ZZ = Tabs.Aimbot:AddRightGroupbox('自瞄幸存者')



local aimSettings = {
    distance = 100,
    fov = 100,
    size = 10,
    noWall = false,
    rainbowMode = true 
}

local aimbotData = {
    FOVring = nil,
    connections = {}
}

ZZ:AddSlider('AimDistance', {
    Text = '自瞄距离',
    Default = 100,
    Min = 0,
    Max = 1000,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
        aimSettings.distance = Value
    end
})

ZZ:AddSlider('FOVSize', {
    Text = '圈圈大小',
    Default = 100,
    Min = 0,
    Max = 1000,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
        aimSettings.fov = Value
    end
})

ZZ:AddSlider('TargetSize', {
    Text = '自瞄大小',
    Default = 10,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
        aimSettings.size = Value
    end
})

ZZ:AddToggle('NoWallToggle', {
    Text = '掩体检测',
    Default = false,
    Tooltip = '自瞄',
    Callback = function(state)
        aimSettings.noWall = state
    end
})

ZZ:AddDropdown('ColorSelector', {
    Values = {
        '红色',
        '绿色',
        '蓝色',
        '白色',
        '黄色',
        '青色',
        '洋红色',
        '彩虹'
    },
    Default = 8,
    Multi = false,
    Text = '选择颜色',
    Tooltip = '用于自瞄圈圈的颜色',
    Callback = function(Value)
        local colorMap = {
            ["红色"] = Color3.fromRGB(255, 0, 0),
            ["绿色"] = Color3.fromRGB(0, 255, 0),
            ["蓝色"] = Color3.fromRGB(0, 0, 255),
            ["白色"] = Color3.fromRGB(255, 255, 255),
            ["黄色"] = Color3.fromRGB(255, 255, 0),
            ["青色"] = Color3.fromRGB(0, 255, 255),
            ["洋红色"] = Color3.fromRGB(255, 0, 255)
        }

        if Value == '彩虹' then
            aimSettings.rainbowMode = true
        else
            aimSettings.rainbowMode = false
            local selectedColor = colorMap[Value] or Color3.fromRGB(231, 231, 236)
            if aimbotData.FOVring then
                aimbotData.FOVring.Color = selectedColor
            end
        end
    end
})

local bai = {}
bai.Aim = false
local aimConnection

ZZ:AddToggle("AimbotToggle", {
    Text = "自瞄幸存者",
    Default = false,
    Callback = function(state)
        bai.Aim = state
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local Cam = workspace.CurrentCamera
        local UserInputService = game:GetService("UserInputService")
        local RaycastParams = RaycastParams.new()
        RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist

        local function cleanup()
            if aimbotData.FOVring then
                aimbotData.FOVring:Remove()
                aimbotData.FOVring = nil
            end
            if aimConnection then
                aimConnection:Disconnect()
                aimConnection = nil
            end
        end

        if state then
            if not aimbotData.FOVring then
                aimbotData.FOVring = Drawing.new("Circle")
                aimbotData.FOVring.Visible = true
                aimbotData.FOVring.Thickness = 2
                aimbotData.FOVring.Filled = false
                aimbotData.FOVring.Color = Color3.fromHSV(0, 1, 1)
            end

            aimConnection = RunService.RenderStepped:Connect(function()
                aimbotData.FOVring.Radius = aimSettings.fov
                aimbotData.FOVring.Position = Cam.ViewportSize / 2

                local survivorsFolder = workspace.Players:FindFirstChild("Survivors")
                local target = nil
                local closestDist = math.huge
                local mousePos = Cam.ViewportSize / 2

                if survivorsFolder then
                    for _, survivorModel in pairs(survivorsFolder:GetChildren()) do
                        if survivorModel == Players.LocalPlayer.Character then
                            break
                        end

                        local hrp = survivorModel:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local screenPos, onScreen = Cam:WorldToViewportPoint(hrp.Position)
                            local distance = (Cam.CFrame.Position - hrp.Position).Magnitude
                            if onScreen and distance <= aimSettings.distance then
                                if aimSettings.noWall then
                                    RaycastParams.FilterDescendantsInstances = {
                                        Players.LocalPlayer.Character,
                                        workspace.Players
                                    }
                                    local result = workspace:Raycast(Cam.CFrame.Position, hrp.Position - Cam.CFrame.Position, RaycastParams)
                                    if result and not result.Instance:IsDescendantOf(survivorModel) then
                                        break
                                    end
                                end
                                local screenDist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                                if screenDist < closestDist and screenDist <= aimSettings.fov then
                                    closestDist = screenDist
                                    target = hrp
                                end
                            end
                        end
                    end
                end

                if target then
                    local lookVector = (target.Position - Cam.CFrame.Position).Unit
                    Cam.CFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
                end

                if aimSettings.rainbowMode and aimbotData.FOVring then
                    local hue = (tick() * 0.2) % 1
                    aimbotData.FOVring.Color = Color3.fromHSV(hue, 1, 1)
                end
            end)

            aimbotData.connections.keyEvent = UserInputService.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Delete then
                    bai.Aim = false
                    Spy:SetValue(false)
                    cleanup()
                end
            end)
        else
            cleanup()
        end
    end
})








local Visual = Tabs.Esp:AddRightGroupbox("高亮ESP")

-- 高亮ESP设置
local HighlightSettings = {
    ShowSurvivorHighlights = true,
    ShowKillerHighlights = true,
    FillTransparency = 0.5,
    OutlineTransparency = 0,
    connection = nil,
    highlights = {}  -- 存储所有高亮对象
}

-- 更新颜色预设
HighlightSettings.SurvivorColors = {
    ["绿色"] = Color3.fromRGB(0, 255, 0),
    ["白色"] = Color3.fromRGB(255, 255, 255),
    ["紫色"] = Color3.fromRGB(128, 0, 128),
    ["青色"] = Color3.fromRGB(0, 255, 255),
    ["橙色"] = Color3.fromRGB(255, 165, 0),
    ["柠檬绿"] = Color3.fromRGB(173, 255, 47)  -- 新增柠檬绿
}

HighlightSettings.KillerColors = {
    ["红色"] = Color3.fromRGB(255, 0, 0),
    ["粉色"] = Color3.fromRGB(255, 105, 180),
    ["黑色"] = Color3.fromRGB(0, 0, 0),
    ["蓝色"] = Color3.fromRGB(0, 0, 255),
    ["猩红色"] = Color3.fromRGB(220, 20, 60),  -- 新增猩红色
    ["杏色"] = Color3.fromRGB(251, 206, 177)   -- 新增杏色
}

-- 边缘颜色使用与填充颜色相同的选项
HighlightSettings.SurvivorOutlineColors = table.clone(HighlightSettings.SurvivorColors)
HighlightSettings.KillerOutlineColors = table.clone(HighlightSettings.KillerColors)

-- 默认颜色
HighlightSettings.SelectedSurvivorColor = "青色"
HighlightSettings.SelectedKillerColor = "红色"
HighlightSettings.SelectedSurvivorOutlineColor = "青色"
HighlightSettings.SelectedKillerOutlineColor = "红色"

-- 清理高亮对象
local function cleanupHighlights()
    for _, highlight in pairs(HighlightSettings.highlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    HighlightSettings.highlights = {}
end

-- 更新高亮显示
local function updateHighlights()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    
    -- 获取幸存者和杀手文件夹
    local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
    local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
    
    -- 只处理幸存者和杀手
    local function processFolder(folder, isKiller)
        if not folder then return end
        
        for _, model in ipairs(folder:GetChildren()) do
            if model:IsA("Model") then
                -- 确定颜色
                local fillColor = isKiller and HighlightSettings.KillerColors[HighlightSettings.SelectedKillerColor] 
                                          or HighlightSettings.SurvivorColors[HighlightSettings.SelectedSurvivorColor]
                
                local outlineColor = isKiller and HighlightSettings.KillerOutlineColors[HighlightSettings.SelectedKillerOutlineColor] 
                                              or HighlightSettings.SurvivorOutlineColors[HighlightSettings.SelectedSurvivorOutlineColor]
                
                -- 根据设置决定是否显示
                if (isKiller and HighlightSettings.ShowKillerHighlights) or 
                   (not isKiller and HighlightSettings.ShowSurvivorHighlights) then
                    
                    if not HighlightSettings.highlights[model] then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = game.CoreGui
                        HighlightSettings.highlights[model] = highlight
                    end
                    
                    local highlight = HighlightSettings.highlights[model]
                    highlight.Adornee = model
                    highlight.FillColor = fillColor
                    highlight.OutlineColor = outlineColor
                    highlight.FillTransparency = HighlightSettings.FillTransparency
                    highlight.OutlineTransparency = HighlightSettings.OutlineTransparency
                elseif HighlightSettings.highlights[model] then
                    HighlightSettings.highlights[model].Adornee = nil
                end
            end
        end
    end
    
    -- 处理幸存者
    processFolder(survivorsFolder, false)
    
    -- 处理杀手
    processFolder(killersFolder, true)
    
    -- 清理不再存在的模型的高亮
    for model, highlight in pairs(HighlightSettings.highlights) do
        if not model or not model.Parent then
            highlight:Destroy()
            HighlightSettings.highlights[model] = nil
        end
    end
end

-- 主开关
Visual:AddToggle("HighlightToggle", {
    Text = "启用高亮ESP",
    Default = false,
    Callback = function(enabled)
        if enabled then
            -- 初始化连接
            if not HighlightSettings.connection then
                HighlightSettings.connection = game:GetService("RunService").RenderStepped:Connect(updateHighlights)
            end
        else
            -- 关闭连接
            if HighlightSettings.connection then
                HighlightSettings.connection:Disconnect()
                HighlightSettings.connection = nil
            end
            -- 清理高亮对象
            cleanupHighlights()
        end
    end
})

-- 幸存者开关
Visual:AddToggle("ShowSurvivorHighlights", {
    Text = "ESP幸存者高亮",
    Default = true,
    Callback = function(enabled)
        HighlightSettings.ShowSurvivorHighlights = enabled
    end
})

-- 杀手开关
Visual:AddToggle("ShowKillerHighlights", {
    Text = "ESP杀手高亮",
    Default = true,
    Callback = function(enabled)
        HighlightSettings.ShowKillerHighlights = enabled
    end
})

-- 幸存者填充颜色选择
Visual:AddDropdown("SurvivorFillColor", {
    Values = {"绿色", "白色", "紫色", "青色", "橙色", "柠檬绿"},
    Default = "青色",
    Text = "幸存者填充颜色",
    Callback = function(value)
        HighlightSettings.SelectedSurvivorColor = value
    end
})

-- 杀手填充颜色选择
Visual:AddDropdown("KillerFillColor", {
    Values = {"红色", "粉色", "黑色", "蓝色", "猩红色", "杏色"},
    Default = "红色",
    Text = "杀手填充颜色",
    Callback = function(value)
        HighlightSettings.SelectedKillerColor = value
    end
})

-- 幸存者边缘颜色选择
Visual:AddDropdown("SurvivorOutlineColor", {
    Values = {"绿色", "白色", "紫色", "青色", "橙色", "柠檬绿"},
    Default = "青色",
    Text = "幸存者边缘颜色",
    Callback = function(value)
        HighlightSettings.SelectedSurvivorOutlineColor = value
    end
})

-- 杀手边缘颜色选择
Visual:AddDropdown("KillerOutlineColor", {
    Values = {"红色", "粉色", "黑色", "蓝色", "猩红色", "杏色"},
    Default = "红色",
    Text = "杀手边缘颜色",
    Callback = function(value)
        HighlightSettings.SelectedKillerOutlineColor = value
    end
})

-- 填充透明度调节滑块
Visual:AddSlider("FillTransparency", {
    Text = "填充透明度",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        HighlightSettings.FillTransparency = value
    end
})

-- 边缘透明度调节滑块
Visual:AddSlider("OutlineTransparency", {
    Text = "边缘透明度",
    Min = 0,
    Max = 1,
    Default = 0,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        HighlightSettings.OutlineTransparency = value
    end
})








local Visual = Tabs.Esp:AddRightGroupbox("假NoliESP")



local NoliHighlight = {
    Enabled = false,
    FillTransparency = 0.5,
    OutlineTransparency = 0,
    connection = nil,
    highlights = {},
    labels = {}
}

local function cleanupAll()
    for _, highlight in pairs(NoliHighlight.highlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    NoliHighlight.highlights = {}
    
    for _, label in pairs(NoliHighlight.labels) do
        if label and label.Parent then
            label:Destroy()
        end
    end
    NoliHighlight.labels = {}
end

local function isFakeNoli(model)
    local humanoidRootPart = model:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return false end
    
    for _, sound in ipairs(humanoidRootPart:GetChildren()) do
        if sound:IsA("Sound") then
            return false
        end
    end
    return true
end

local function updateHighlights()
    local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
    
    if killersFolder and NoliHighlight.Enabled then
        local noliModel = killersFolder:FindFirstChild("Noli")
        if noliModel and noliModel:IsA("Model") and isFakeNoli(noliModel) then
            if not NoliHighlight.highlights[noliModel] then
                local highlight = Instance.new("Highlight")
                highlight.Parent = game.CoreGui
                NoliHighlight.highlights[noliModel] = highlight
            end
            
            local highlight = NoliHighlight.highlights[noliModel]
            highlight.Adornee = noliModel
            highlight.FillColor = Color3.fromRGB(128, 0, 128)
            highlight.OutlineColor = Color3.fromRGB(128, 0, 128)
            highlight.FillTransparency = NoliHighlight.FillTransparency
            highlight.OutlineTransparency = NoliHighlight.OutlineTransparency
            
            if not NoliHighlight.labels[noliModel] then
                local billboardGui = Instance.new("BillboardGui")
                local textLabel = Instance.new("TextLabel")
                
                billboardGui.Name = "NoliLabel"
                billboardGui.Adornee = noliModel:FindFirstChild("Head") or noliModel:FindFirstChild("HumanoidRootPart") or noliModel.PrimaryPart
                billboardGui.Size = UDim2.new(0, 200, 0, 50)
                billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                billboardGui.AlwaysOnTop = true
                
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Text = "[假Noli]"
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextScaled = true
                textLabel.BackgroundTransparency = 1
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.TextStrokeTransparency = 0
                textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                
                textLabel.Parent = billboardGui
                billboardGui.Parent = game.CoreGui
                
                NoliHighlight.labels[noliModel] = billboardGui
            end
        end
    end
    
    for model, highlight in pairs(NoliHighlight.highlights) do
        if not model or not model.Parent then
            highlight:Destroy()
            NoliHighlight.highlights[model] = nil
            
            if NoliHighlight.labels[model] then
                NoliHighlight.labels[model]:Destroy()
                NoliHighlight.labels[model] = nil
            end
        end
    end
end

Visual:AddToggle("NoliHighlightToggle", {
    Text = "假NoliESP",
    Default = false,
    Callback = function(enabled)
        NoliHighlight.Enabled = enabled
        if enabled then
            if not NoliHighlight.connection then
                NoliHighlight.connection = game:GetService("RunService").RenderStepped:Connect(updateHighlights)
            end
        else
            if NoliHighlight.connection then
                NoliHighlight.connection:Disconnect()
                NoliHighlight.connection = nil
            end
            cleanupAll()
        end
    end
})

Visual:AddSlider("NoliFillTransparency", {
    Text = "填充透明度",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        NoliHighlight.FillTransparency = value
    end
})

Visual:AddSlider("NoliOutlineTransparency", {
    Text = "边缘透明度",
    Min = 0,
    Max = 1,
    Default = 0,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        NoliHighlight.OutlineTransparency = value
    end
})

local Visual = Tabs.Esp:AddLeftGroupbox("角色名称ESP")

local NameTagSettings = {
    ShowSurvivorNames = true,
    ShowKillerNames = true,
    BaseTextSize = 14,
    MinTextSize = 10,
    MaxTextSize = 20,
    TextOffset = Vector3.new(0, 3, 0),
    DistanceScale = {
        MinDistance = 10,
        MaxDistance = 50
    },
    SurvivorColor = Color3.fromRGB(0, 191, 255),
    KillerColor = Color3.fromRGB(255, 0, 0),
    OutlineColor = Color3.fromRGB(0, 0, 0),
    ShowDistance = true
}

local NameTagDrawings = {}

local function createNameTagDrawing()
    local drawing = Drawing.new("Text")
    drawing.Size = NameTagSettings.BaseTextSize
    drawing.Center = true
    drawing.Outline = true
    drawing.OutlineColor = NameTagSettings.OutlineColor
    drawing.Font = 2
    return drawing
end

local function getHeadPosition(character)
    local head = character:FindFirstChild("Head")
    if head then
        local headHeight = head.Size.Y
        return head.Position + Vector3.new(0, headHeight + 0.5, 0)
    end
    return character:GetPivot().Position
end

local function cleanupInvalidDrawings()
    local players = game:GetService("Players")
    local survivors = workspace.Players:FindFirstChild("Survivors")
    local killers = workspace.Players:FindFirstChild("Killers")
    
    local validCharacters = {}
    if survivors then
        for _, survivor in ipairs(survivors:GetChildren()) do
            if survivor:IsA("Model") then
                validCharacters[survivor] = true
            end
        end
    end
    if killers then
        for _, killer in ipairs(killers:GetChildren()) do
            if killer:IsA("Model") then
                validCharacters[killer] = true
            end
        end
    end
    
    for model, drawing in pairs(NameTagDrawings) do
        if not validCharacters[model] then
            drawing:Remove()
            NameTagDrawings[model] = nil
        end
    end
end

local function updateNameTags()
    local camera = workspace.CurrentCamera
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local localCharacter = localPlayer.Character
    local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")

    if not localRoot then return end
    
    cleanupInvalidDrawings()

    if NameTagSettings.ShowSurvivorNames then
        local survivors = workspace.Players:FindFirstChild("Survivors")
        if survivors then
            for _, survivor in ipairs(survivors:GetChildren()) do
                if survivor:IsA("Model") and survivor ~= localCharacter then
                    local humanoid = survivor:FindFirstChildOfClass("Humanoid")
                    
                    if not NameTagDrawings[survivor] then
                        NameTagDrawings[survivor] = createNameTagDrawing()
                    end
                    
                    local drawing = NameTagDrawings[survivor]
                    
                    if not humanoid or humanoid.Health <= 0 then
                        drawing.Visible = false
                        continue
                    end
                    
                    local headPos = getHeadPosition(survivor)
                    local screenPos, onScreen = camera:WorldToViewportPoint(headPos + NameTagSettings.TextOffset)
                    
                    if onScreen then
                        local distance = (headPos - localRoot.Position).Magnitude
                        local scale = math.clamp(
                            1 - (distance - NameTagSettings.DistanceScale.MinDistance) / 
                            (NameTagSettings.DistanceScale.MaxDistance - NameTagSettings.DistanceScale.MinDistance), 
                            0.3, 1
                        )
                        
                        local textSize = math.floor(NameTagSettings.BaseTextSize * scale)
                        textSize = math.clamp(textSize, NameTagSettings.MinTextSize, NameTagSettings.MaxTextSize)
                        
                        local displayText = survivor.Name
                        if NameTagSettings.ShowDistance then
                            displayText = string.format("%s [%d]", survivor.Name, math.floor(distance))
                        end
                        
                        drawing.Text = displayText
                        drawing.Color = NameTagSettings.SurvivorColor
                        drawing.Size = textSize
                        drawing.Position = Vector2.new(screenPos.X, screenPos.Y)
                        drawing.Visible = true
                    else
                        drawing.Visible = false
                    end
                end
            end
        end
    end

    if NameTagSettings.ShowKillerNames then
        local killers = workspace.Players:FindFirstChild("Killers")
        if killers then
            for _, killer in ipairs(killers:GetChildren()) do
                if killer:IsA("Model") then
                    local humanoid = killer:FindFirstChildOfClass("Humanoid")
                    
                    if not NameTagDrawings[killer] then
                        NameTagDrawings[killer] = createNameTagDrawing()
                    end
                    
                    local drawing = NameTagDrawings[killer]
                    
                    if not humanoid or humanoid.Health <= 0 then
                        drawing.Visible = false
                        continue
                    end
                    
                    local headPos = getHeadPosition(killer)
                    local screenPos, onScreen = camera:WorldToViewportPoint(headPos + NameTagSettings.TextOffset)
                    
                    if onScreen then
                        local distance = (headPos - localRoot.Position).Magnitude
                        local scale = math.clamp(
                            1 - (distance - NameTagSettings.DistanceScale.MinDistance) / 
                            (NameTagSettings.DistanceScale.MaxDistance - NameTagSettings.DistanceScale.MinDistance), 
                            0.3, 1
                        )
                        
                        local textSize = math.floor(NameTagSettings.BaseTextSize * scale)
                        textSize = math.clamp(textSize, NameTagSettings.MinTextSize, NameTagSettings.MaxTextSize)
                        
                        local displayText = killer.Name
                        if NameTagSettings.ShowDistance then
                            displayText = string.format("%s [%dm]", killer.Name, math.floor(distance))
                        end
                        
                        drawing.Text = displayText
                        drawing.Color = NameTagSettings.KillerColor
                        drawing.Size = textSize
                        drawing.Position = Vector2.new(screenPos.X, screenPos.Y)
                        drawing.Visible = true
                    else
                        drawing.Visible = false
                    end
                end
            end
        end
    end
end

local function cleanupNameTags()
    for _, drawing in pairs(NameTagDrawings) do
        if drawing then
            drawing:Remove()
        end
    end
    NameTagDrawings = {}
end

Visual:AddToggle("NameTagsToggle", {
    Text = "启用角色名称ESP",
    Default = false,
    Callback = function(enabled)
        if enabled then
            if not NameTagSettings.connection then
                NameTagSettings.connection = game:GetService("RunService").RenderStepped:Connect(updateNameTags)
            end
            
            if not NameTagSettings.removedConnection then
                NameTagSettings.removedConnection = game:GetService("Players").PlayerRemoving:Connect(function(player)
                    for model, drawing in pairs(NameTagDrawings) do
                        if model.Name == player.Name then
                            drawing:Remove()
                            NameTagDrawings[model] = nil
                        end
                    end
                end)
            end
        else
            if NameTagSettings.connection then
                NameTagSettings.connection:Disconnect()
                NameTagSettings.connection = nil
            end
            
            if NameTagSettings.removedConnection then
                NameTagSettings.removedConnection:Disconnect()
                NameTagSettings.removedConnection = nil
            end
            
            cleanupNameTags()
        end
    end
})

Visual:AddToggle("ShowSurvivorNames", {
    Text = "显示幸存者名称",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.ShowSurvivorNames = enabled
    end
})

Visual:AddToggle("ShowKillerNames", {
    Text = "显示杀手名称",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.ShowKillerNames = enabled
    end
})

Visual:AddToggle("ShowDistance", {
    Text = "显示距离",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.ShowDistance = enabled
    end
})




local Visual = Tabs.Esp:AddLeftGroupbox("血量条ESP")

-- 血量条设置
local HealthBarSettings = {
    ShowSurvivorBars = true,
    ShowKillerBars = true,
    BarWidth = 100,      -- 固定宽度
    BarHeight = 5,       -- 固定高度
    TextSize = 14,       -- 固定文字大小
    BarOffset = Vector2.new(0, -30), -- 基础偏移
    TextOffset = Vector2.new(0, -40)  -- 文字偏移
}

-- 预设颜色方案（修改后的幸存者颜色）
local ColorPresets = {
    Survivor = {
        FullHealth = Color3.fromRGB(0, 255, 255),    -- 青色(满血)
        HalfHealth = Color3.fromRGB(0, 255, 0),      -- 绿色(半血)
        LowHealth = Color3.fromRGB(255, 165, 0)      -- 橙色(低血)
    },
    Killer = {
        FullHealth = Color3.fromRGB(255, 0, 0),      -- 红色(满血)
        HalfHealth = Color3.fromRGB(255, 165, 0),    -- 橙色(半血)
        LowHealth = Color3.fromRGB(255, 255, 0)      -- 黄色(低血)
    },
    Common = {
        Background = Color3.fromRGB(50, 50, 50),
        Outline = Color3.fromRGB(0, 0, 0),
        Text = Color3.fromRGB(255, 255, 255)        -- 白色文字
    }
}

-- 存储所有ESP对象
local HealthBarDrawings = {}

-- 创建血量条ESP对象
local function createHealthBarDrawing()
    local drawing = {
        background = Drawing.new("Square"),
        bar = Drawing.new("Square"),
        outline = Drawing.new("Square"),
        text = Drawing.new("Text")
    }
    
    -- 背景设置
    drawing.background.Thickness = 1
    drawing.background.Filled = true
    drawing.background.Color = ColorPresets.Common.Background
    
    -- 血量条设置
    drawing.bar.Thickness = 1
    drawing.bar.Filled = true
    
    -- 边框设置
    drawing.outline.Thickness = 2
    drawing.outline.Filled = false
    drawing.outline.Color = ColorPresets.Common.Outline
    
    -- 文字设置
    drawing.text.Center = true
    drawing.text.Outline = true
    drawing.text.Font = 2
    drawing.text.Color = ColorPresets.Common.Text
    
    return drawing
end

-- 根据血量获取颜色（修改后的阈值）
local function getHealthColor(humanoid, isKiller)
    local healthPercent = (humanoid.Health / humanoid.MaxHealth) * 100
    
    if isKiller then
        if healthPercent > 50 then
            return ColorPresets.Killer.FullHealth
        elseif healthPercent > 25 then
            return ColorPresets.Killer.HalfHealth
        else
            return ColorPresets.Killer.LowHealth
        end
    else
        -- 幸存者新颜色阈值
        if healthPercent > 75 then
            return ColorPresets.Survivor.FullHealth    -- 满血(75%以上): 青色
        elseif healthPercent > 35 then
            return ColorPresets.Survivor.HalfHealth    -- 半血(35%-75%): 绿色
        else
            return ColorPresets.Survivor.LowHealth     -- 低血(35%以下): 橙色
        end
    end
end

-- 更新血量条（优化后不显示自身血条）
local function updateHealthBars()
    local camera = workspace.CurrentCamera
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    
    -- 处理幸存者
    if HealthBarSettings.ShowSurvivorBars then
        local survivors = workspace.Players:FindFirstChild("Survivors")
        if survivors then
            for _, survivor in ipairs(survivors:GetChildren()) do
                if survivor:IsA("Model") and survivor ~= localPlayer.Character then  -- 不显示自身血条
                    local humanoid = survivor:FindFirstChildOfClass("Humanoid")
                    local head = survivor:FindFirstChild("Head")
                    
                    if humanoid and head then
                        -- 获取或创建ESP对象
                        if not HealthBarDrawings[survivor] then
                            HealthBarDrawings[survivor] = createHealthBarDrawing()
                        end
                        
                        local drawing = HealthBarDrawings[survivor]
                        local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)
                        
                        if onScreen then
                            -- 计算血量百分比
                            local healthPercent = math.floor((humanoid.Health / humanoid.MaxHealth) * 100)
                            local healthBarWidth = HealthBarSettings.BarWidth * (healthPercent / 100)
                            
                            -- 设置位置
                            local barPos = Vector2.new(
                                screenPos.X + HealthBarSettings.BarOffset.X - (HealthBarSettings.BarWidth / 2),
                                screenPos.Y + HealthBarSettings.BarOffset.Y
                            )
                            
                            -- 背景和边框
                            drawing.background.Size = Vector2.new(HealthBarSettings.BarWidth, HealthBarSettings.BarHeight)
                            drawing.background.Position = barPos
                            drawing.background.Visible = true
                            
                            drawing.outline.Size = Vector2.new(HealthBarSettings.BarWidth, HealthBarSettings.BarHeight)
                            drawing.outline.Position = barPos
                            drawing.outline.Visible = true
                            
                            -- 血量条（使用新颜色方案）
                            drawing.bar.Color = getHealthColor(humanoid, false)
                            drawing.bar.Size = Vector2.new(healthBarWidth, HealthBarSettings.BarHeight)
                            drawing.bar.Position = barPos
                            drawing.bar.Visible = true
                            
                            -- 文字
                            drawing.text.Text = tostring(healthPercent) .. "%"
                            drawing.text.Size = HealthBarSettings.TextSize
                            drawing.text.Position = Vector2.new(
                                screenPos.X + HealthBarSettings.TextOffset.X,
                                screenPos.Y + HealthBarSettings.TextOffset.Y
                            )
                            drawing.text.Visible = true
                        else
                            -- 不在屏幕内则隐藏
                            for _, obj in pairs(drawing) do
                                obj.Visible = false
                            end
                        end
                    end
                end
            end
        end
    end
    
    -- 处理杀手
    if HealthBarSettings.ShowKillerBars then
        local killers = workspace.Players:FindFirstChild("Killers")
        if killers then
            for _, killer in ipairs(killers:GetChildren()) do
                if killer:IsA("Model") then
                    local humanoid = killer:FindFirstChildOfClass("Humanoid")
                    local head = killer:FindFirstChild("Head")
                    
                    if humanoid and head then
                        -- 获取或创建ESP对象
                        if not HealthBarDrawings[killer] then
                            HealthBarDrawings[killer] = createHealthBarDrawing()
                        end
                        
                        local drawing = HealthBarDrawings[killer]
                        local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)
                        
                        if onScreen then
                            -- 计算血量百分比
                            local healthPercent = math.floor((humanoid.Health / humanoid.MaxHealth) * 100)
                            local healthBarWidth = HealthBarSettings.BarWidth * (healthPercent / 100)
                            
                            -- 设置位置
                            local barPos = Vector2.new(
                                screenPos.X + HealthBarSettings.BarOffset.X - (HealthBarSettings.BarWidth / 2),
                                screenPos.Y + HealthBarSettings.BarOffset.Y
                            )
                            
                            -- 背景和边框
                            drawing.background.Size = Vector2.new(HealthBarSettings.BarWidth, HealthBarSettings.BarHeight)
                            drawing.background.Position = barPos
                            drawing.background.Visible = true
                            
                            drawing.outline.Size = Vector2.new(HealthBarSettings.BarWidth, HealthBarSettings.BarHeight)
                            drawing.outline.Position = barPos
                            drawing.outline.Visible = true
                            
                            -- 血量条
                            drawing.bar.Color = getHealthColor(humanoid, true)
                            drawing.bar.Size = Vector2.new(healthBarWidth, HealthBarSettings.BarHeight)
                            drawing.bar.Position = barPos
                            drawing.bar.Visible = true
                            
                            -- 文字
                            drawing.text.Text = tostring(healthPercent) .. "%"
                            drawing.text.Size = HealthBarSettings.TextSize
                            drawing.text.Position = Vector2.new(
                                screenPos.X + HealthBarSettings.TextOffset.X,
                                screenPos.Y + HealthBarSettings.TextOffset.Y
                            )
                            drawing.text.Visible = true
                        else
                            -- 不在屏幕内则隐藏
                            for _, obj in pairs(drawing) do
                                obj.Visible = false
                            end
                        end
                    end
                end
            end
        end
    end
end

-- 清理血量条
local function cleanupHealthBars()
    for _, drawing in pairs(HealthBarDrawings) do
        for _, obj in pairs(drawing) do
            if obj then
                obj:Remove()
            end
        end
    end
    HealthBarDrawings = {}
end

-- 主开关
Visual:AddToggle("HealthBarsToggle", {
    Text = "启用血量条",
    Default = false,
    Callback = function(enabled)
        if enabled then
            -- 初始化连接
            if not HealthBarSettings.connection then
                HealthBarSettings.connection = game:GetService("RunService").RenderStepped:Connect(updateHealthBars)
            end
            
            -- 监听角色移除
            if not HealthBarSettings.removedConnection then
                HealthBarSettings.removedConnection = workspace.DescendantRemoving:Connect(function(descendant)
                    if HealthBarDrawings[descendant] then
                        for _, obj in pairs(HealthBarDrawings[descendant]) do
                            obj:Remove()
                        end
                        HealthBarDrawings[descendant] = nil
                    end
                end)
            end
        else
            -- 关闭连接
            if HealthBarSettings.connection then
                HealthBarSettings.connection:Disconnect()
                HealthBarSettings.connection = nil
            end
            
            if HealthBarSettings.removedConnection then
                HealthBarSettings.removedConnection:Disconnect()
                HealthBarSettings.removedConnection = nil
            end
            
            -- 清理ESP对象
            cleanupHealthBars()
        end
    end
})

-- 幸存者开关
Visual:AddToggle("ShowSurvivorBars", {
    Text = "显示幸存者血量条",
    Default = true,
    Callback = function(enabled)
        HealthBarSettings.ShowSurvivorBars = enabled
    end
})

-- 杀手开关
Visual:AddToggle("ShowKillerBars", {
    Text = "显示杀手血量条",
    Default = true,
    Callback = function(enabled)
        HealthBarSettings.ShowKillerBars = enabled
    end
})

-- 大小设置
Visual:AddSlider("BarWidth", {
    Text = "血量条宽度",
    Min = 50,
    Max = 200,
    Default = 100,
    Rounding = 0,
    Callback = function(value)
        HealthBarSettings.BarWidth = value
    end
})

Visual:AddSlider("BarHeight", {
    Text = "血量条高度",
    Min = 3,
    Max = 15,
    Default = 5,
    Rounding = 0,
    Callback = function(value)
        HealthBarSettings.BarHeight = value
    end
})

Visual:AddSlider("TextSize", {
    Text = "文字大小",
    Min = 10,
    Max = 20,
    Default = 14,
    Rounding = 0,
    Callback = function(value)
        HealthBarSettings.TextSize = value
    end
})

-- 位置调整
Visual:AddSlider("BarOffsetY", {
    Text = "垂直偏移",
    Min = -50,
    Max = 50,
    Default = -30,
    Rounding = 0,
    Callback = function(value)
        HealthBarSettings.BarOffset = Vector2.new(HealthBarSettings.BarOffset.X, value)
        HealthBarSettings.TextOffset = Vector2.new(HealthBarSettings.TextOffset.X, value - 10)
    end
})








Visual = Tabs.Esp:AddLeftGroupbox("血量ESP[备用]")


local camera = workspace.CurrentCamera
local localPlayer = game:GetService("Players").LocalPlayer

Visual:AddToggle("SurvivorHealth", {
    Text = "ESP幸存者血量(文字)",
    Default = false,
    Callback = function(v)
        if v then
            local sur = workspace.Players.Survivors
            
            local function survivoresp(char)
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(3, 0, 1, 0)
                billboard.StudsOffset = Vector3.new(0, 1.5, 0)
                billboard.Adornee = char.Head
                billboard.Parent = char.Head
                billboard.AlwaysOnTop = true
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Position = UDim2.new(0, 0, 0, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextScaled = false
                textLabel.Text = "血量: "..char.Humanoid.Health.."/"..char.Humanoid.MaxHealth
                textLabel.TextColor3 = Options.SurvivorHealthColor.Value
                textLabel.Font = Enum.Font.Arcade
                textLabel.Parent = billboard

              
                local distanceUpdate
                distanceUpdate = game:GetService("RunService").RenderStepped:Connect(function()
                    if char:FindFirstChild("Head") and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (char.Head.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
                        
                        local textSize = math.clamp(30 - (distance / 2), 12, 20)
                        textLabel.TextSize = textSize
                    end
                end)

                local healthUpdate = char:FindFirstChild("Humanoid").HealthChanged:Connect(function()
                    textLabel.Text = "血量: "..char:FindFirstChild("Humanoid").Health.."/"..char:FindFirstChild("Humanoid").MaxHealth
                end)

                char:FindFirstChild("Humanoid").Died:Connect(function()
                    distanceUpdate:Disconnect()
                    healthUpdate:Disconnect()
                    textLabel.Text = ""
                end)

                return {billboard = billboard, connections = {distanceUpdate, healthUpdate}}
            end

            getgenv().SurvivorHealthConnections = {
                Added = sur.DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                        repeat wait() until v:FindFirstChild("Humanoid")
                        survivoresp(v)
                    end
                end)
            }

            for _,v in pairs(sur:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                    repeat wait() until v:FindFirstChild("Humanoid")
                    survivoresp(v)
                end
            end
        else
            if getgenv().SurvivorHealthConnections then
                getgenv().SurvivorHealthConnections.Added:Disconnect()
            end
            
            for _,v in pairs(workspace.Players.Survivors:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Head") then
                    for _,child in pairs(v.Head:GetChildren()) do
                        if child:IsA("BillboardGui") then
                            child:Destroy()
                        end
                    end
                end
            end
        end
    end
}):AddColorPicker("SurvivorHealthColor", {
    Default = Color3.fromRGB(0, 255, 0),
    Title = "幸存者血量(文字)颜色",
})

Visual:AddToggle("KillerHealth", {
    Text = "ESP杀手血量(文字)",
    Default = false,
    Callback = function(v)
        if v then
            local kil = workspace.Players.Killers
            
            local function killeresp(char)
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(3, 0, 1, 0)
                billboard.StudsOffset = Vector3.new(0, 1.5, 0)
                billboard.Adornee = char.Head
                billboard.Parent = char.Head
                billboard.AlwaysOnTop = true
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Position = UDim2.new(0, 0, 0, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextScaled = false
                textLabel.Text = "血量: "..char.Humanoid.Health.."/"..char.Humanoid.MaxHealth
                textLabel.TextColor3 = Options.KillerHealthColor.Value
                textLabel.Font = Enum.Font.Arcade
                textLabel.Parent = billboard

                -- 添加距离检测更新
                local distanceUpdate
                distanceUpdate = game:GetService("RunService").RenderStepped:Connect(function()
                    if char:FindFirstChild("Head") and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (char.Head.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
                        -- 根据距离动态调整文字大小 (10-30米范围内变化)
                        local textSize = math.clamp(30 - (distance / 2), 12, 20)
                        textLabel.TextSize = textSize
                    end
                end)

                local healthUpdate = char:FindFirstChild("Humanoid").HealthChanged:Connect(function()
                    textLabel.Text = "血量: "..char:FindFirstChild("Humanoid").Health.."/"..char:FindFirstChild("Humanoid").MaxHealth
                end)

                char:FindFirstChild("Humanoid").Died:Connect(function()
                    distanceUpdate:Disconnect()
                    healthUpdate:Disconnect()
                    textLabel.Text = ""
                end)

                return {billboard = billboard, connections = {distanceUpdate, healthUpdate}}
            end

            getgenv().KillerHealthConnections = {
                Added = kil.DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                        repeat wait() until v:FindFirstChild("Humanoid")
                        killeresp(v)
                    end
                end)
            }

            for _,v in pairs(kil:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                    repeat wait() until v:FindFirstChild("Humanoid")
                    killeresp(v)
                end
            end
        else
            if getgenv().KillerHealthConnections then
                getgenv().KillerHealthConnections.Added:Disconnect()
            end
            
            for _,v in pairs(workspace.Players.Killers:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Head") then
                    for _,child in pairs(v.Head:GetChildren()) do
                        if child:IsA("BillboardGui") then
                            child:Destroy()
                        end
                    end
                end
            end
        end
    end
}):AddColorPicker("KillerHealthColor", {
    Default = Color3.fromRGB(255, 255, 0),
    Title = "杀手血量(文字)颜色",
})





local Visual   = Tabs.Esp:AddLeftGroupbox('发动机ESP')
-- 真发动机ESP
Visual:AddToggle("RealGeneratorESP", {
    Text = "ESP真发动机",
    Default = false,
    Callback = function(enabled)
        if not _G.RealGeneratorESP then
            _G.RealGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.RealGeneratorESP.Active then
                for _, connection in pairs(_G.RealGeneratorESP.Connections) do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.RealGeneratorESP.Data) do
                    if type(data) == "table" then
                        if data.Billboard and data.Billboard.Parent then
                            data.Billboard:Destroy()
                        end
                        if data.DistanceBillboard and data.DistanceBillboard.Parent then
                            data.DistanceBillboard:Destroy()
                        end
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                    end
                end
                
                _G.RealGeneratorESP.Data = {}
                _G.RealGeneratorESP.Connections = {}
                _G.RealGeneratorESP.Active = false
            end
            return
        end
        
        if _G.RealGeneratorESP.Active then
            return
        end
        
        _G.RealGeneratorESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        local maxGenerators = 20
        
        local distanceSettings = {
            MinDistance = 5,
            MaxDistance = 500,
            MinScale = 0.8,
            MaxScale = 1.5,
            MinTextSize = 8,
            MaxTextSize = 10
        }
        
        local function updateGeneratorESP(gen, data)
            if not gen or not gen.Parent or not gen:FindFirstChild("Main") then
                return false
            end
            
            if table.getn(_G.RealGeneratorESP.Data) > maxGenerators then
                return false
            end
            
            if gen:FindFirstChild("Progress") then
                local progress = gen.Progress.Value
                if progress >= 99 then
                    return false
                end
                
                if data.TextLabel then
                    data.TextLabel.Text = string.format("真发动机: %d%%", progress)
                end
                
                local character = game:GetService("Players").LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart and data.DistanceLabel then
                    local distance = (gen.Main.Position - humanoidRootPart.Position).Magnitude
                    
                    data.DistanceLabel.Text = string.format("距离: %d米", math.floor(distance))
                    
                    local distanceRatio = math.clamp(
                        (distance - distanceSettings.MinDistance) / 
                        (distanceSettings.MaxDistance - distanceSettings.MinDistance),
                        0, 1
                    )
                    
                    local scale = distanceSettings.MinScale + 
                        distanceRatio * (distanceSettings.MaxScale - distanceSettings.MinScale)
                    
                    local textSize = distanceSettings.MinTextSize + 
                        distanceRatio * (distanceSettings.MaxTextSize - distanceSettings.MinTextSize)
                    
                    if data.Billboard then 
                        data.Billboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                        data.Billboard.Enabled = true
                    end
                    
                    if data.DistanceBillboard then 
                        data.DistanceBillboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                        data.DistanceBillboard.Enabled = true
                    end
                    
                    if data.TextLabel then 
                        data.TextLabel.TextSize = textSize
                        data.TextLabel.Visible = true
                    end
                    
                    if data.DistanceLabel then 
                        data.DistanceLabel.TextSize = textSize
                        data.DistanceLabel.Visible = true
                    end
                    
                    if data.Highlight then
                        data.Highlight.Enabled = true
                        local transparency = math.clamp((distance - 50) / 100, 0, 0.4)
                        data.Highlight.FillTransparency = 0.85 + (transparency * 0.5)
                        data.Highlight.OutlineColor = Color3.fromRGB(0, 255, 0) -- 绿色
                        data.Highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    end
                end
            end
            
            return true
        end
        
        local function createGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.RealGeneratorESP.Data[gen] then 
                return 
            end
            
            if table.getn(_G.RealGeneratorESP.Data) >= maxGenerators then
                return
            end
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "RealGeneratorESP"
            billboard.Size = UDim2.new(4, 0, 1, 0)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            billboard.Enabled = true
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 0.5, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextScaled = false
            textLabel.Text = "真发动机加载中..."
            textLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- 绿色
            textLabel.Font = Enum.Font.Arcade
            textLabel.TextStrokeTransparency = 0
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            textLabel.TextSize = 8
            textLabel.Parent = billboard
            
            local distanceBillboard = Instance.new("BillboardGui")
            distanceBillboard.Name = "RealGeneratorDistanceESP"
            distanceBillboard.Size = UDim2.new(4, 0, 1, 0)
            distanceBillboard.StudsOffset = Vector3.new(0, 3.5, 0)
            distanceBillboard.Adornee = gen.Main
            distanceBillboard.Parent = gen.Main
            distanceBillboard.AlwaysOnTop = true
            distanceBillboard.Enabled = true
            
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.TextScaled = false
            distanceLabel.Text = "计算距离中..."
            distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            distanceLabel.Font = Enum.Font.Arcade
            distanceLabel.TextStrokeTransparency = 0
            distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            distanceLabel.TextSize = 8
            distanceLabel.Parent = distanceBillboard
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "RealGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(0, 255, 0) -- 绿色
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            _G.RealGeneratorESP.Data[gen] = {
                Billboard = billboard,
                DistanceBillboard = distanceBillboard,
                TextLabel = textLabel,
                DistanceLabel = distanceLabel,
                Highlight = highlight
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.RealGeneratorESP.Data[gen] then
                    if _G.RealGeneratorESP.Data[gen].Billboard then 
                        _G.RealGeneratorESP.Data[gen].Billboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].DistanceBillboard then 
                        _G.RealGeneratorESP.Data[gen].DistanceBillboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].Highlight then 
                        _G.RealGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    _G.RealGeneratorESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.RealGeneratorESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            if mapFolder then
                local ingameFolder = mapFolder:FindFirstChild("Ingame")
                if ingameFolder then
                    local mapSubFolder = ingameFolder:FindFirstChild("Map")
                    if mapSubFolder then
                        local generators = mapSubFolder:GetDescendants()
                        for _, gen in pairs(generators) do
                            if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "Generator" then
                                createGeneratorESP(gen)
                            end
                        end
                    end
                end
            end
        end
        
        local mainConnection
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                local mapSubFolder = ingameFolder:FindFirstChild("Map")
                if mapSubFolder then
                    mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                        if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "Generator" then
                            createGeneratorESP(v)
                        end
                    end)
                end
            end
        end
        
        if mainConnection then
            table.insert(_G.RealGeneratorESP.Connections, mainConnection)
        end
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
            end
            
            local gensToRemove = {}
            for gen, data in pairs(_G.RealGeneratorESP.Data) do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                else
                    if not updateGeneratorESP(gen, data) then
                        table.insert(gensToRemove, gen)
                    end
                end
            end
            
            for _, gen in ipairs(gensToRemove) do
                if _G.RealGeneratorESP.Data[gen] then
                    if _G.RealGeneratorESP.Data[gen].Billboard then 
                        _G.RealGeneratorESP.Data[gen].Billboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].DistanceBillboard then 
                        _G.RealGeneratorESP.Data[gen].DistanceBillboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].Highlight then 
                        _G.RealGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    _G.RealGeneratorESP.Data[gen] = nil
                end
            end
        end)
        
        table.insert(_G.RealGeneratorESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})

-- 假发动机ESP
Visual:AddToggle("FakeGeneratorESP", {
    Text = "ESP假发动机",
    Default = false,
    Callback = function(enabled)
        if not _G.FakeGeneratorESP then
            _G.FakeGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.FakeGeneratorESP.Active then
                for _, connection in pairs(_G.FakeGeneratorESP.Connections) do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                    if type(data) == "table" then
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                        if data.NameLabel and data.NameLabel.Parent then
                            data.NameLabel:Destroy()
                        end
                    end
                end
                
                _G.FakeGeneratorESP.Data = {}
                _G.FakeGeneratorESP.Connections = {}
                _G.FakeGeneratorESP.Active = false
            end
            return
        end
        
        if _G.FakeGeneratorESP.Active then
            _G.FakeGeneratorESP.Callback(false)
        end
        
        _G.FakeGeneratorESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        
        local function createFakeGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.FakeGeneratorESP.Data[gen] then 
                return 
            end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "FakeGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local nameBillboard = Instance.new("BillboardGui")
            nameBillboard.Name = "FakeGeneratorNameESP"
            nameBillboard.Size = UDim2.new(4, 0, 1, 0)
            nameBillboard.StudsOffset = Vector3.new(0, 2.5, 0)
            nameBillboard.Adornee = gen.Main
            nameBillboard.Parent = gen.Main
            nameBillboard.AlwaysOnTop = true
            nameBillboard.Enabled = true
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextScaled = false
            nameLabel.Text = "假发动机"
            nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            nameLabel.Font = Enum.Font.Arcade
            nameLabel.TextStrokeTransparency = 0
            nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            nameLabel.TextSize = 12
            nameLabel.Parent = nameBillboard
            
            _G.FakeGeneratorESP.Data[gen] = {
                Highlight = highlight,
                NameLabel = nameLabel,
                NameBillboard = nameBillboard
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then 
                        _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                        _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                        _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                    end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.FakeGeneratorESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            if mapFolder then
                local ingameFolder = mapFolder:FindFirstChild("Ingame")
                if ingameFolder then
                    local mapSubFolder = ingameFolder:FindFirstChild("Map")
                    if mapSubFolder then
                        local generators = mapSubFolder:GetDescendants()
                        for _, gen in pairs(generators) do
                            if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "FakeGenerator" then
                                createFakeGeneratorESP(gen)
                            end
                        end
                    end
                end
            end
        end
        
        local mainConnection
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                local mapSubFolder = ingameFolder:FindFirstChild("Map")
                if mapSubFolder then
                    mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                        if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "FakeGenerator" then
                            createFakeGeneratorESP(v)
                        end
                    end)
                end
            end
        end
        
        if mainConnection then
            table.insert(_G.FakeGeneratorESP.Connections, mainConnection)
        end
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
            end
            
            local gensToRemove = {}
            for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                end
            end
            
            for _, gen in ipairs(gensToRemove) do
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then 
                        _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                        _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                        _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                    end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
            end
        end)
        
        table.insert(_G.FakeGeneratorESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})

-- 特殊发动机ESP
Visual:AddToggle("NoliWarningESP", {
    Text = "ESPNoli传送发动机",
    Default = false,
    Callback = function(enabled)
        if not _G.NoliWarningESP then
            _G.NoliWarningESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.NoliWarningESP.Active then
                for _, connection in pairs(_G.NoliWarningESP.Connections) do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.NoliWarningESP.Data) do
                    if type(data) == "table" then
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                        if data.Label and data.Label.Parent then
                            data.Label:Destroy()
                        end
                    end
                end
                
                _G.NoliWarningESP.Data = {}
                _G.NoliWarningESP.Connections = {}
                _G.NoliWarningESP.Active = false
            end
            return
        end
        
        if _G.NoliWarningESP.Active then
            return
        end
        
        _G.NoliWarningESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        
        local function hasNoliWarning(gen)
            if string.find(gen.Name, "NoliWarningIncoming") then
                return true
            end
            
            for _, child in pairs(gen:GetDescendants()) do
                if (child:IsA("StringValue") or child:IsA("ObjectValue")) and 
                   string.find(tostring(child.Value), "NoliWarningIncoming") then
                    return true
                elseif child:IsA("BasePart") and string.find(child.Name, "NoliWarningIncoming") then
                    return true
                end
            end
            
            return false
        end
        
        local function createNoliWarningESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.NoliWarningESP.Data[gen] then 
                return 
            end
            
            if not hasNoliWarning(gen) then
                return
            end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "NoliWarningHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
            highlight.FillColor = Color3.fromRGB(255, 0, 255)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NoliWarningBillboard"
            billboard.Size = UDim2.new(6, 0, 2, 0)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "[Noli即将传送]"
            label.TextColor3 = Color3.fromRGB(255, 0, 255)
            label.Font = Enum.Font.Arcade
            label.TextSize = 14
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            label.Parent = billboard
            
            _G.NoliWarningESP.Data[gen] = {
                Highlight = highlight,
                Label = label,
                Billboard = billboard,
                LastCheck = os.time()
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then 
                        _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Label then 
                        _G.NoliWarningESP.Data[gen].Label:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Billboard then 
                        _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                    end
                    _G.NoliWarningESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.NoliWarningESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local generators = workspace:GetDescendants()
            for _, gen in pairs(generators) do
                if gen:IsA("Model") and gen:FindFirstChild("Main") and 
                   (gen.Name == "Generator" or gen.Name == "FakeGenerator") then
                    createNoliWarningESP(gen)
                end
            end
        end
        
        local function updateExistingGenerators()
            local gensToRemove = {}
            for gen, data in pairs(_G.NoliWarningESP.Data) do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                else
                    if os.time() - data.LastCheck > 5 then
                        if not hasNoliWarning(gen) then
                            table.insert(gensToRemove, gen)
                        else
                            data.LastCheck = os.time()
                        end
                    end
                end
            end
            
            for _, gen in ipairs(gensToRemove) do
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then 
                        _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Label then 
                        _G.NoliWarningESP.Data[gen].Label:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Billboard then 
                        _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                    end
                    _G.NoliWarningESP.Data[gen] = nil
                end
            end
        end
        
        local mainConnection = workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") and v:FindFirstChild("Main") and 
               (v.Name == "Generator" or v.Name == "FakeGenerator") then
                createNoliWarningESP(v)
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, mainConnection)
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
                updateExistingGenerators()
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})










local Visual = Tabs.Esp:AddRightGroupbox("2D方框")


Visual:AddToggle("SE", {
    Text = "ESP幸存者方框",
    Default = false,
    Callback = function(v)
        if v then
            local a = workspace:WaitForChild("Players")
            local c = a:WaitForChild("Survivors")
            local d = game:GetService("RunService")
            local e = game:GetService("Players").LocalPlayer
            
            local function f(g, h)
                if not g:IsA("Model") then return end
                if g == e.Character then return end
                local i = g:FindFirstChild("HumanoidRootPart")
                if not i then return end
                if i:FindFirstChild("playeresp") then return end
                
                local j = Instance.new("BillboardGui")
                j.Name = "playeresp"
                j.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                j.Active = true
                j.AlwaysOnTop = true
                j.LightInfluence = 1.000
                j.Size = UDim2.new(3, 0, 5, 0)
                j.Adornee = i
                j.Parent = i
                
                local k = Instance.new("Frame")
                k.Name = "playershow"
                k.BackgroundColor3 = Color3.fromRGB(255, 25, 25)
                k.BackgroundTransparency = 1
                k.Size = UDim2.new(1, 0, 1, 0)
                k.Parent = j
                
                local l = Instance.new("UIStroke")
                l.Color = h
                l.Thickness = 2
                l.Transparency = 0.2
                l.Parent = k
            end
            
            SurvivorESPConnection = d.RenderStepped:Connect(function()
                for m, o in ipairs(c:GetChildren()) do
                    f(o, Color3.fromRGB(0, 255, 0))
                end
            end)
            
            -- 添加新加入的幸存者
            SurvivorAddedConnection = c.ChildAdded:Connect(function(o)
                f(o, Color3.fromRGB(0, 255, 0))
            end)
        else
            if SurvivorESPConnection then
                SurvivorESPConnection:Disconnect()
            end
            if SurvivorAddedConnection then
                SurvivorAddedConnection:Disconnect()
            end
            
            -- 清除所有幸存者ESP
            local a = workspace:WaitForChild("Players")
            local c = a:WaitForChild("Survivors")
            for _, o in ipairs(c:GetChildren()) do
                if o:IsA("Model") then
                    local i = o:FindFirstChild("HumanoidRootPart")
                    if i and i:FindFirstChild("playeresp") then
                        i.playeresp:Destroy()
                    end
                end
            end
        end
    end
})

Visual:AddToggle("KE", {
    Text = "ESP杀手方框",
    Default = false,
    Callback = function(v)
        if v then
            local a = workspace:WaitForChild("Players")
            local b = a:WaitForChild("Killers")
            local d = game:GetService("RunService")
            local e = game:GetService("Players").LocalPlayer
            
            local function f(g, h)
                if not g:IsA("Model") then return end
                if g == e.Character then return end
                local i = g:FindFirstChild("HumanoidRootPart")
                if not i then return end
                if i:FindFirstChild("playeresp") then return end
                
                local j = Instance.new("BillboardGui")
                j.Name = "playeresp"
                j.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                j.Active = true
                j.AlwaysOnTop = true
                j.LightInfluence = 1.000
                j.Size = UDim2.new(3, 0, 5, 0)
                j.Adornee = i
                j.Parent = i
                
                local k = Instance.new("Frame")
                k.Name = "playershow"
                k.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                k.BackgroundTransparency = 1
                k.Size = UDim2.new(1, 0, 1, 0)
                k.Parent = j
                
                local l = Instance.new("UIStroke")
                l.Color = h
                l.Thickness = 2
                l.Transparency = 0.2
                l.Parent = k
            end
            
            KillerESPConnection = d.RenderStepped:Connect(function()
                for m, o in ipairs(b:GetChildren()) do
                    f(o, Color3.fromRGB(255, 0, 0))
                end
            end)
            
            -- 添加新加入的杀手
            KillerAddedConnection = b.ChildAdded:Connect(function(o)
                f(o, Color3.fromRGB(255, 0, 0))
            end)
        else
            if KillerESPConnection then
                KillerESPConnection:Disconnect()
            end
            if KillerAddedConnection then
                KillerAddedConnection:Disconnect()
            end
            
            -- 清除所有杀手ESP
            local a = workspace:WaitForChild("Players")
            local b = a:WaitForChild("Killers")
            for _, o in ipairs(b:GetChildren()) do
                if o:IsA("Model") then
                    local i = o:FindFirstChild("HumanoidRootPart")
                    if i and i:FindFirstChild("playeresp") then
                        i.playeresp:Destroy()
                    end
                end
            end
        end
    end
})



local Visual = Tabs.Esp:AddRightGroupbox("3D方框ESP")

-- 3D方框ESP设置
local Box3DSettings = {
    -- 基本设置
    Enabled = false,
    ShowSurvivorBoxes = true,
    ShowKillerBoxes = true,
    
    -- 颜色设置
    SurvivorColor = Color3.fromRGB(0, 255, 255), -- 青色
    KillerColor = Color3.fromRGB(255, 0, 0),     -- 红色
    UseTeamColor = true,
    
    -- 样式设置
    Thickness = 1,
    Transparency = 0.7,
    BoxHeightOffset = 0.5,
    
    -- 比例设置
    SurvivorBoxScale = 1.0,
    KillerBoxScale = 1.2,
    
    -- 宽度调节
    LeftWidthScale = 1.0,
    RightWidthScale = 1.0,
    
    -- 深度调节 (加强版)
    FrontExtend = 1.0,
    BackExtend = 1.0,
    FrontExtendMultiplier = 1.0,  -- 前延伸倍数
    BackExtendMultiplier = 1.0,   -- 后延伸倍数
    
    -- 高度调节
    HeadOffset = 1.5,
    FootOffset = 0.2,
    BoxHeightScale = 1.0,         -- 方框高度比例
    VerticalOffset = 0,           -- 垂直偏移
    
    -- 连接线
    connection = nil,
    removedConnection = nil
}

-- 存储所有3D方框ESP对象
local Box3DDrawings = {}

-- 创建3D方框ESP对象
local function create3DBoxDrawing()
    local drawing = {
        lines = {},
        visible = false
    }
    
    for i = 1, 12 do
        drawing.lines[i] = Drawing.new("Line")
        drawing.lines[i].Thickness = Box3DSettings.Thickness
        drawing.lines[i].Transparency = Box3DSettings.Transparency
        drawing.lines[i].Visible = false
    end
    
    return drawing
end

-- 计算模型的3D边界框（全方位调节）
local function calculateModelBoundingBox(model, isKiller)
    local rootPart = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Torso") or model:FindFirstChild("UpperTorso")
    local head = model:FindFirstChild("Head")
    
    if rootPart then
        local size = rootPart.Size
        local cframe = rootPart.CFrame
        
        -- 应用比例调整
        local scale = isKiller and Box3DSettings.KillerBoxScale or Box3DSettings.SurvivorBoxScale
        size = size * scale
        
        -- 计算基础高度并应用高度比例
        local baseHeight = 5
        if head then
            baseHeight = (head.Position.Y - rootPart.Position.Y) * 2
        end
        local height = (baseHeight + Box3DSettings.HeadOffset + Box3DSettings.FootOffset) * Box3DSettings.BoxHeightScale
        
        -- 调整左右宽度
        local leftOffset = (size.X/2) * Box3DSettings.LeftWidthScale
        local rightOffset = (size.X/2) * Box3DSettings.RightWidthScale
        
        -- 调整前后延伸 (加强版)
        local frontOffset = (size.Z/2) * Box3DSettings.FrontExtend * Box3DSettings.FrontExtendMultiplier
        local backOffset = (size.Z/2) * Box3DSettings.BackExtend * Box3DSettings.BackExtendMultiplier
        
        -- 计算最小和最大点
        local min = Vector3.new(
            cframe.Position.X - leftOffset,
            cframe.Position.Y - height/2 + Box3DSettings.FootOffset,
            cframe.Position.Z - backOffset
        )
        
        local max = Vector3.new(
            cframe.Position.X + rightOffset,
            cframe.Position.Y + height/2 + Box3DSettings.HeadOffset,
            cframe.Position.Z + frontOffset
        )
        
        -- 应用高度偏移和垂直偏移
        min = Vector3.new(min.X, min.Y + Box3DSettings.BoxHeightOffset + Box3DSettings.VerticalOffset, min.Z)
        max = Vector3.new(max.X, max.Y + Box3DSettings.BoxHeightOffset + Box3DSettings.VerticalOffset, max.Z)
        
        return min, max
    else
        -- 回退到遍历所有部件的方法
        local min = Vector3.new(math.huge, math.huge, math.huge)
        local max = Vector3.new(-math.huge, -math.huge, -math.huge)
        
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                local cframe = part.CFrame
                local size = part.Size
                
                local scale = isKiller and Box3DSettings.KillerBoxScale or Box3DSettings.SurvivorBoxScale
                size = size * scale
                
                -- 调整左右宽度
                local leftOffset = (size.X/2) * Box3DSettings.LeftWidthScale
                local rightOffset = (size.X/2) * Box3DSettings.RightWidthScale
                
                -- 调整前后延伸 (加强版)
                local frontOffset = (size.Z/2) * Box3DSettings.FrontExtend * Box3DSettings.FrontExtendMultiplier
                local backOffset = (size.Z/2) * Box3DSettings.BackExtend * Box3DSettings.BackExtendMultiplier
                
                -- 计算顶点（考虑前后延伸）
                local vertices = {
                    cframe * Vector3.new(rightOffset, (size.Y/2) * Box3DSettings.BoxHeightScale, frontOffset),
                    cframe * Vector3.new(-leftOffset, (size.Y/2) * Box3DSettings.BoxHeightScale, frontOffset),
                    cframe * Vector3.new(rightOffset, (-size.Y/2) * Box3DSettings.BoxHeightScale, frontOffset),
                    cframe * Vector3.new(-leftOffset, (-size.Y/2) * Box3DSettings.BoxHeightScale, frontOffset),
                    cframe * Vector3.new(rightOffset, (size.Y/2) * Box3DSettings.BoxHeightScale, -backOffset),
                    cframe * Vector3.new(-leftOffset, (size.Y/2) * Box3DSettings.BoxHeightScale, -backOffset),
                    cframe * Vector3.new(rightOffset, (-size.Y/2) * Box3DSettings.BoxHeightScale, -backOffset),
                    cframe * Vector3.new(-leftOffset, (-size.Y/2) * Box3DSettings.BoxHeightScale, -backOffset)
                }
                
                -- 更新最小和最大点
                for _, vertex in ipairs(vertices) do
                    min = Vector3.new(
                        math.min(min.X, vertex.X),
                        math.min(min.Y, vertex.Y),
                        math.min(min.Z, vertex.Z)
                    )
                    max = Vector3.new(
                        math.max(max.X, vertex.X),
                        math.max(max.Y, vertex.Y),
                        math.max(max.Z, vertex.Z)
                    )
                end
            end
        end
        
        -- 应用高度偏移和垂直偏移
        min = Vector3.new(min.X, min.Y + Box3DSettings.BoxHeightOffset + Box3DSettings.VerticalOffset, min.Z)
        max = Vector3.new(max.X, max.Y + Box3DSettings.BoxHeightOffset + Box3DSettings.VerticalOffset, max.Z)
        
        return min, max
    end
end

-- 更新单个3D方框
local function updateSingle3DBox(model, drawing, color, isKiller)
    local camera = workspace.CurrentCamera
    local min, max = calculateModelBoundingBox(model, isKiller)
    
    -- 计算立方体的8个顶点
    local vertices = {
        Vector3.new(max.X, max.Y, max.Z), -- 右上后
        Vector3.new(min.X, max.Y, max.Z), -- 左上后
        Vector3.new(max.X, min.Y, max.Z), -- 右下后
        Vector3.new(min.X, min.Y, max.Z), -- 左下后
        Vector3.new(max.X, max.Y, min.Z), -- 右上前
        Vector3.new(min.X, max.Y, min.Z), -- 左上前
        Vector3.new(max.X, min.Y, min.Z), -- 右下前
        Vector3.new(min.X, min.Y, min.Z)  -- 左下前
    }
    
    -- 转换顶点到屏幕空间
    local screenVertices = {}
    local anyVisible = false
    
    for i, vertex in ipairs(vertices) do
        local screenPos, onScreen = camera:WorldToViewportPoint(vertex)
        screenVertices[i] = Vector2.new(screenPos.X, screenPos.Y)
        if onScreen then anyVisible = true end
    end
    
    -- 设置线条属性
    for _, line in pairs(drawing.lines) do
        line.Color = color
        line.Thickness = Box3DSettings.Thickness
        line.Transparency = Box3DSettings.Transparency
    end
    
    -- ESP立方体边线
    if anyVisible then
        -- 前面4条边
        drawing.lines[1].From = screenVertices[5] drawing.lines[1].To = screenVertices[6] -- 上面前
        drawing.lines[2].From = screenVertices[6] drawing.lines[2].To = screenVertices[8] -- 左边前
        drawing.lines[3].From = screenVertices[8] drawing.lines[3].To = screenVertices[7] -- 下面前
        drawing.lines[4].From = screenVertices[7] drawing.lines[4].To = screenVertices[5] -- 右边前
        
        -- 后面4条边
        drawing.lines[5].From = screenVertices[1] drawing.lines[5].To = screenVertices[2] -- 上面后
        drawing.lines[6].From = screenVertices[2] drawing.lines[6].To = screenVertices[4] -- 左边后
        drawing.lines[7].From = screenVertices[4] drawing.lines[7].To = screenVertices[3] -- 下面后
        drawing.lines[8].From = screenVertices[3] drawing.lines[8].To = screenVertices[1] -- 右边后
        
        -- 连接前后面的4条边
        drawing.lines[9].From = screenVertices[1] drawing.lines[9].To = screenVertices[5] -- 右上
        drawing.lines[10].From = screenVertices[2] drawing.lines[10].To = screenVertices[6] -- 左上
        drawing.lines[11].From = screenVertices[3] drawing.lines[11].To = screenVertices[7] -- 右下
        drawing.lines[12].From = screenVertices[4] drawing.lines[12].To = screenVertices[8] -- 左下
        
        -- 显示所有线条
        for _, line in pairs(drawing.lines) do
            line.Visible = true
        end
        
        drawing.visible = true
    else
        if drawing.visible then
            for _, line in pairs(drawing.lines) do
                line.Visible = false
            end
            drawing.visible = false
        end
    end
end

-- 更新所有3D方框
local function update3DBoxes()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    -- 先隐藏所有现有的方框
    for model, drawing in pairs(Box3DDrawings) do
        if not model or not model.Parent then
            -- 模型已不存在，清理ESP对象
            for _, line in pairs(drawing.lines) do
                line:Remove()
            end
            Box3DDrawings[model] = nil
        else
            -- 暂时隐藏
            for _, line in pairs(drawing.lines) do
                line.Visible = false
            end
            drawing.visible = false
        end
    end
    
    -- 处理幸存者方框
    if Box3DSettings.ShowSurvivorBoxes then
        local survivors = workspace:FindFirstChild("Survivors") or workspace.Players:FindFirstChild("Survivors")
        if survivors then
            for _, survivor in ipairs(survivors:GetChildren()) do
                if survivor:IsA("Model") and survivor ~= localPlayer.Character then
                    -- 获取或创建ESP对象
                    if not Box3DDrawings[survivor] then
                        Box3DDrawings[survivor] = create3DBoxDrawing()
                    end
                    
                    updateSingle3DBox(survivor, Box3DDrawings[survivor], Box3DSettings.SurvivorColor, false)
                end
            end
        end
        
        -- 额外检查玩家列表中的幸存者
        for _, player in ipairs(players:GetPlayers()) do
            if player ~= localPlayer and player.Character and not player.Character:FindFirstChild("IsKiller") then
                if not Box3DDrawings[player.Character] then
                    Box3DDrawings[player.Character] = create3DBoxDrawing()
                end
                
                updateSingle3DBox(player.Character, Box3DDrawings[player.Character], Box3DSettings.SurvivorColor, false)
            end
        end
    end
    
    -- 处理杀手方框
    if Box3DSettings.ShowKillerBoxes then
        local killers = workspace:FindFirstChild("Killers") or workspace.Players:FindFirstChild("Killers")
        if killers then
            for _, killer in ipairs(killers:GetChildren()) do
                if killer:IsA("Model") and killer ~= localPlayer.Character then
                    -- 获取或创建ESP对象
                    if not Box3DDrawings[killer] then
                        Box3DDrawings[killer] = create3DBoxDrawing()
                    end
                    
                    updateSingle3DBox(killer, Box3DDrawings[killer], Box3DSettings.KillerColor, true)
                end
            end
        end
        
        -- 额外检查玩家列表中的杀手
        for _, player in ipairs(players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("IsKiller") then
                if not Box3DDrawings[player.Character] then
                    Box3DDrawings[player.Character] = create3DBoxDrawing()
                end
                
                updateSingle3DBox(player.Character, Box3DDrawings[player.Character], Box3DSettings.KillerColor, true)
            end
        end
    end
end

-- 清理3D方框
local function cleanup3DBoxes()
    for _, drawing in pairs(Box3DDrawings) do
        if drawing then
            for _, line in pairs(drawing.lines) do
                line:Remove()
            end
        end
    end
    Box3DDrawings = {}
end

-- 主开关
Visual:AddToggle("Box3DToggle", {
    Text = "启用3D方框",
    Default = false,
    Callback = function(enabled)
        Box3DSettings.Enabled = enabled
        if enabled then
            -- 初始化连接
            if not Box3DSettings.connection then
                Box3DSettings.connection = game:GetService("RunService").RenderStepped:Connect(update3DBoxes)
            end
            
            -- 监听角色移除
            if not Box3DSettings.removedConnection then
                Box3DSettings.removedConnection = workspace.DescendantRemoving:Connect(function(descendant)
                    if Box3DDrawings[descendant] then
                        for _, line in pairs(Box3DDrawings[descendant].lines) do
                            line:Remove()
                        end
                        Box3DDrawings[descendant] = nil
                    end
                end)
            end
        else
            -- 关闭连接
            if Box3DSettings.connection then
                Box3DSettings.connection:Disconnect()
                Box3DSettings.connection = nil
            end
            
            if Box3DSettings.removedConnection then
                Box3DSettings.removedConnection:Disconnect()
                Box3DSettings.removedConnection = nil
            end
            
            -- 清理ESP对象
            cleanup3DBoxes()
        end
    end
})

-- 幸存者开关
Visual:AddToggle("ShowSurvivorBoxes", {
    Text = "显示幸存者方框",
    Default = true,
    Callback = function(enabled)
        Box3DSettings.ShowSurvivorBoxes = enabled
    end
})

-- 杀手开关
Visual:AddToggle("ShowKillerBoxes", {
    Text = "显示杀手方框",
    Default = true,
    Callback = function(enabled)
        Box3DSettings.ShowKillerBoxes = enabled
    end
})

-- 样式设置
Visual:AddSlider("BoxThickness", {
    Text = "线条粗细",
    Min = 1,
    Max = 5,
    Default = 1,
    Rounding = 0,
    Callback = function(value)
        Box3DSettings.Thickness = value
    end
})

Visual:AddSlider("BoxTransparency", {
    Text = "透明度",
    Min = 0,
    Max = 1,
    Default = 0.7,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.Transparency = value
    end
})

Visual:AddSlider("BoxHeightOffset", {
    Text = "高度偏移",
    Min = 0,
    Max = 2,
    Default = 0.5,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.BoxHeightOffset = value
    end
})


Visual:AddSlider("BoxHeightScale", {
    Text = "方框高度比例",
    Min = 0.5,
    Max = 2.5,
    Default = 1.2,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.BoxHeightScale = value
    end
})


Visual:AddSlider("VerticalOffset", {
    Text = "垂直偏移",
    Min = -5,
    Max = 5,
    Default = -1,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.VerticalOffset = value
    end
})


Visual:AddSlider("SurvivorBoxScale", {
    Text = "幸存者方框比例",
    Min = 1.7,
    Max = 2,
    Default = 1.7,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.SurvivorBoxScale = value
    end
})

Visual:AddSlider("KillerBoxScale", {
    Text = "杀手方框比例",
    Min = 1.7,
    Max = 2,
    Default = 1.7,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.KillerBoxScale = value
    end
})

Visual:AddSlider("LeftWidthScale", {
    Text = "左侧宽度比例",
    Min = 1.0,
    Max = 2,
    Default = 1.0,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.LeftWidthScale = value
    end
})

Visual:AddSlider("RightWidthScale", {
    Text = "右侧宽度比例",
    Min = 0.9,
    Max = 2,
    Default = 0.9,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.RightWidthScale = value
    end
})


Visual:AddSlider("FrontExtend", {
    Text = "前延伸基础值",
    Min = 1.9,
    Max = 2,
    Default = 1.9,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.FrontExtend = value
    end
})

Visual:AddSlider("BackExtend", {
    Text = "后延伸基础值",
    Min = 1.8,
    Max = 2,
    Default = 1.8,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.BackExtend = value
    end
})

Visual:AddSlider("FrontExtendMultiplier", {
    Text = "前延伸倍数",
    Min = 1.0,
    Max = 3.0,
    Default = 1.0,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.FrontExtendMultiplier = value
    end
})

Visual:AddSlider("BackExtendMultiplier", {
    Text = "后延伸倍数",
    Min = 1.0,
    Max = 3.0,
    Default = 1.0,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.BackExtendMultiplier = value
    end
})

-- 高度调节
Visual:AddSlider("HeadOffset", {
    Text = "头部偏移",
    Min = 1.5,
    Max = 3,
    Default = 1.5,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.HeadOffset = value
    end
})

Visual:AddSlider("FootOffset", {
    Text = "脚部偏移",
    Min = 0.2,
    Max = 1,
    Default = 0.2,
    Rounding = 1,
    Callback = function(value)
        Box3DSettings.FootOffset = value
    end
})







local Visual = Tabs.Esp:AddLeftGroupbox("物品ESP")

local LibESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImamGV/Script/main/ESP"))()

Visual:AddToggle("EKE",{
    Text = "杀手机器人ESP",
    Callback = function(v)
        if v then
            for _, v in ipairs(workspace:GetDescendants()) do
                      if v:IsA("Model") and 
                      v.Name == "PizzaDeliveryRig" or 
                      v.Name == "Bunny" or 
                      v.Name == "Mafiaso1" or 
                      v.Name == "Mafiaso2" or 
                      v.Name == "Mafiaso3" then
                    LibESP:AddESP(v, "c00lkidd小弟", Color3.fromRGB(255, 52, 179), 14, "Other_ESP")
                elseif v:IsA("Model") and v.Name == "1x1x1x1Zombie" then
                    LibESP:AddESP(v, "1x1x1x1 (僵尸)", Color3.fromRGB(224, 102, 255), 14, "Other_ESP")
                end
            end
            OtherESP = workspace.DescendantAdded:Connect(function(v)
                     if v:IsA("Model") and 
                     v.Name == "PizzaDeliveryRig" or
                     v.Name == "Bunny" or 
                     v.Name == "Mafia1" or 
                     v.Name == "Mafia2" or
                     v.Name == "Mafia3" or
                     v.Name == "Mafia4" then
                    LibESP:AddESP(v, "c00lkidd小弟", Color3.fromRGB(255, 52, 179), 14, "Other_ESP")
                elseif v:IsA("Model") and v.Name == "1x1x1x1Zombie" then
                    LibESP:AddESP(v, "1x1x1x1 (僵尸)", Color3.fromRGB(224, 102, 255), 14, "Other_ESP")
                end
            end)
        else
            OtherESP:Disconnect()
            LibESP:Delete("Other_ESP")
        end
    end
})

Visual:AddToggle("ST",{
Text = "空间炸弹ESP",
Callback = function(v)
      if v then
             for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name == "SubspaceTripmine" and       not v:FindFirstChild("SubspaceTripmine_ESP") then
       LibESP:AddESP(v, "", Color3.fromRGB(255, 0, 255), 14,      "SubspaceTripmine_ESP")
   end
end
     SubspaceTripmineESP = workspace.   DescendantAdded:Connect(function(v)
     if v:IsA("Model") and v.Name == "SubspaceTripmine" and not    v:FindFirstChild("SubspaceTripmine_ESP") then
        LibESP:AddESP(v, "", Color3.fromRGB(255, 0, 255), 14,  "SubspaceTripmine_ESP")
  end
end)
     else
   SubspaceTripmineESP:Disconnect()
        LibESP:Delete("SubspaceTripmine_ESP")
  end
end
})

Visual:AddToggle("ME",{
Text = "医疗箱ESP",
Callback = function(v)
         if v then
     for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name == "Medkit" and not v:FindFirstChild("Medkit_ESP") then
       LibESP:AddESP(v, "Medkit", Color3.fromRGB(187, 255, 255), 14, "Medkit_ESP")
   end
end
      MedkitESP = workspace.DescendantAdded:Connect(function(v)
     if v:IsA("Model") and v.Name == "Medkit" and not    v:FindFirstChild("Medkit_ESP") then
          LibESP:AddESP(v, "Medkit", Color3.fromRGB(187, 255, 255), 14, "Medkit_ESP")
    end
end)
    else
        Medkit:Disconnect()
     LibESP:Delete("Medkit_ESP")
    end
end
})

Visual:AddToggle("BCE",{
Text = "可乐ESP",
Callback = function(v)
      if v then
      for _, v in ipairs(workspace:GetDescendants()) do
   if v:IsA("Model") and v.Name == "BloxyCola" and not    v:FindFirstChild("BloxyCola_ESP") then
        LibESP:AddESP(v, "Bloxy Cola", Color3.fromRGB(131, 111, 255), 14, "BloxyCola_ESP")
   end
end
     ColaESP = workspace.DescendantAdded:Connect(function(v)
        if v:IsA("Model") and v.Name == "BloxyCola" and not v:FindFirstChild("BloxyCola_ESP") then
     LibESP:AddESP(v, "Bloxy Cola", Color3.fromRGB(131, 111, 255), 14, "BloxyCola_ESP")
    end
end)
      else
    ColaESP:Disconnect()
         LibESP:Delete("BloxyCola_ESP")
end
end
})

Visual:AddToggle("GingerbreadESP", {
    Text = "饼干ESP",
})

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if not Toggles.GingerbreadESP.Value then return end
            for i, v in pairs(gameMap.Ingame.CurrencyLocations:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChildWhichIsA("Part").Position.Y > -200 then
                    if not v:FindFirstChild("gingerbread_esp") then
                        local hl = Instance.new("Highlight", v)
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Name = "gingerbread_esp"
                    else
                        v.gingerbread_esp.FillColor = Color3.fromRGB(255, 50, 204)
                        v.gingerbread_esp.OutlineTransparency = 1
                    end
                end
            end
        end)
    end
end)






local Warning = Tabs.NotificationListen:AddLeftGroupbox("杀手靠近提示")

-- 杀手靠近提示设置
local KillerWarningSettings = {
    Enabled = false,
    WarningDistance = 100, -- 警告距离(米)
    WarningColor = Color3.fromRGB(255, 0, 0), -- 警告颜色(红色)
    TextSize = 20, -- 文字大小
    BlinkInterval = 0.5, -- 闪烁间隔(秒)
    LastWarningTime = 0, -- 上次警告时间
    WarningCooldown = 5, -- 警告冷却时间(秒)
}

-- 存储ESP对象
local warningLabel = Drawing.new("Text")
warningLabel.Visible = false
warningLabel.Center = true
warningLabel.Outline = true
warningLabel.Font = 2 -- 粗体字体
warningLabel.Color = KillerWarningSettings.WarningColor
warningLabel.Size = KillerWarningSettings.TextSize

-- 更新警告显示
local function updateKillerWarning()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local killersFolder = workspace.Players:FindFirstChild("Killers")
    if not killersFolder then return end
    
    local closestDistance = math.huge
    local closestKiller = nil
    
    -- 寻找最近的杀手
    for _, killer in ipairs(killersFolder:GetChildren()) do
        if killer:IsA("Model") and killer:FindFirstChild("HumanoidRootPart") then
            local distance = (character.HumanoidRootPart.Position - killer.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestKiller = killer
            end
        end
    end
    
    -- 检查距离并显示警告
    if closestKiller and closestDistance <= KillerWarningSettings.WarningDistance then
        local currentTime = tick()
        
        -- 闪烁效果
        if currentTime - KillerWarningSettings.LastWarningTime >= KillerWarningSettings.BlinkInterval then
            warningLabel.Visible = not warningLabel.Visible
            KillerWarningSettings.LastWarningTime = currentTime
        end
        
        -- 设置警告文本
        warningLabel.Text = string.format("警告! 杀手 %s 在 %d 米内!", closestKiller.Name, math.floor(closestDistance))
        warningLabel.Position = Vector2.new(
            workspace.CurrentCamera.ViewportSize.X / 2,
            workspace.CurrentCamera.ViewportSize.Y * 0.2
        )
        
        -- 播放警告音效(冷却时间内只播放一次)
        if currentTime - KillerWarningSettings.LastWarningTime >= KillerWarningSettings.WarningCooldown then
            warningSound:Play()
            KillerWarningSettings.LastWarningTime = currentTime
        end
    else
        warningLabel.Visible = false
    end
end

-- 主开关
Warning:AddToggle("KillerWarningToggle", {
    Text = "杀手靠近提示",
    Default = false,
    Callback = function(enabled)
        KillerWarningSettings.Enabled = enabled
        if enabled then
            -- 初始化连接
            if not KillerWarningSettings.connection then
                KillerWarningSettings.connection = game:GetService("RunService").RenderStepped:Connect(updateKillerWarning)
            end
        else
            -- 关闭连接
            if KillerWarningSettings.connection then
                KillerWarningSettings.connection:Disconnect()
                KillerWarningSettings.connection = nil
            end
            warningLabel.Visible = false
        end
    end
})

-- 距离设置
Warning:AddSlider("WarningDistance", {
    Text = "警告距离(米)",
    Min = 10,
    Max = 200,
    Default = 100,
    Rounding = 0,
    Callback = function(value)
        KillerWarningSettings.WarningDistance = value
    end
})

-- 文字大小设置
Warning:AddSlider("WarningTextSize", {
    Text = "文字大小",
    Min = 10,
    Max = 30,
    Default = 20,
    Rounding = 0,
    Callback = function(value)
        KillerWarningSettings.TextSize = value
        warningLabel.Size = value
    end
})

-- 闪烁速度设置
Warning:AddSlider("BlinkSpeed", {
    Text = "闪烁速度",
    Min = 0.1,
    Max = 1,
    Default = 0.5,
    Rounding = 1,
    Callback = function(value)
        KillerWarningSettings.BlinkInterval = value
    end
})

-- 警告颜色选择
Warning:AddDropdown("WarningColor", {
    Values = {"红色", "橙色", "黄色", "粉色", "紫色"},
    Default = "红色",
    Text = "警告颜色",
    Callback = function(value)
        local colorMap = {
            ["红色"] = Color3.fromRGB(255, 0, 0),
            ["橙色"] = Color3.fromRGB(255, 165, 0),
            ["黄色"] = Color3.fromRGB(255, 255, 0),
            ["粉色"] = Color3.fromRGB(255, 192, 203),
            ["紫色"] = Color3.fromRGB(128, 0, 128)
        }
        KillerWarningSettings.WarningColor = colorMap[value] or Color3.fromRGB(255, 0, 0)
        warningLabel.Color = KillerWarningSettings.WarningColor
    end
})








































local Visual = Tabs.NotificationListen:AddRightGroupbox('其他监听')

Visual:AddToggle("NGT",{
        Text = "007n7分身生成提示",
        Default = false,
        Callback = function(v)
            if v then
                Notify007n7 =
                    workspace.Map.Ingame.DescendantAdded:Connect(
                    function(v)
                        if v.Name == "007n7" then
                            Library:Notify("LightStar-提示\n'007n7分身' 已生成！")
                        end
                    end
                )
            else
                Notify007n7:Disconnect()
            end
        end
})

Visual:AddToggle("NKT",{
        Text = "哨兵生成提示",
        Default = false,
        Callback = function(v)
            if v then
                NotifyBuildermanSentry =
                    workspace.Map.Ingame.DescendantAdded:Connect(
                    function(v)
                        if v.Name == "BuildermanSentry" then
                            Library:Notify("LightStar-提示\n'哨兵' 已生成！")
                        end
                    end
                )
            else
                NotifyBuildermanSentry:Disconnect()
            end
        end
})

Visual:AddToggle("NUT",{
        Text = "分配器生成提示",
        Default = false,
        Callback = function(v)
            if v then
                NotifyBuildermanDispenser =
                    workspace.Map.Ingame.DescendantAdded:Connect(
                    function(v)
                        if v.Name == "BuildermanDispenser" then
                            Library:Notify("LightStar-提示\n'分配器' 已生成！")
                        end
                    end
                )
            else
                NotifyBuildermanDispenser:Disconnect()
            end
        end
})


Visual:AddToggle("NST",{
        Text = "三角炸弹生成提示",
        Default = false,
        Callback = function(v)
            if v then
                NotifySubspaceTripmine =
                    workspace.Map.Ingame.DescendantAdded:Connect(
                    function(v)
                        if v.Name == "SubspaceTripmine" then
                            Library:Notify("LightStar-提示\n'三角炸弹' 已生成！")
                        end
                    end
                )
            else
                NotifySubspaceTripmine:Disconnect()
            end
        end
})

Visual:AddToggle("NST",{
        Text = "披萨生成提示",
        Default = false,
        Callback = function(v)
            if v then
                NotifyPizza =
                    workspace.Map.Ingame.DescendantAdded:Connect(
                    function(v)
                        if v.Name == "Pizza" then
                            Library:Notify("LightStar-提示\n'披萨' 已生成！")
                        end
                    end
                )
            else
                NotifyPizza:Disconnect()
            end
        end
})

Visual:AddToggle("NEK",{
        Text = "实体生成提示",
        Default = false,
        Callback = function(v)
            if v then
                NotifyEntityKillers =
                    workspace.DescendantAdded:Connect(
                    function(v)
                        if
                            v:IsA("Model") and 
                                v.Name == "PizzaDeliveryRig" or          
                                v.Name == "Bunny" or 
                                v.Name == "Mafia1" or
                                v.Name == "Mafia2" or
                                v.Name == "Mafia3" or
                                v.Name == "Mafia4"
                         then
                            Library:Notify("LightStar-警告\n实体 '" .. v.Name .. "' 生成了！")
                        elseif v:IsA("Model") and v.Name == "1x1x1x1Zombie" then
                            Library:Notify("LightStar-警告\n实体 '1x1x1x1 (僵尸)' 生成了！")
                        end
                    end
                )
            else
                NotifyEntityKillers:Disconnect()
            end
        end
})

local Player = Tabs.AnimationAction:AddLeftGroupbox("动作功能")


Player:AddToggle("SillyBillyToggle", {
    Text = "Silly Billy",
    Default = false,
    Tooltip = "播放Silly Billy表情动作",
    Callback = function(state)
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        
        if state then
            -- 激活状态
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
            
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://107464355830477"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
            
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://77601084987544"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()
            
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
                
                for _, assetName in ipairs({"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}) do
                    local asset = char:FindFirstChild(assetName)
                    if asset then asset:Destroy() end
                end
            end)
        else
            -- 关闭状态
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
            
            for _, assetName in ipairs({"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}) do
                local asset = char:FindFirstChild(assetName)
                if asset then asset:Destroy() end
            end
            
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then bodyVelocity:Destroy() end
            
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
            
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://107464355830477" then
                    track:Stop()
                end
            end
        end
    end
})

-- Silly of it 动作按钮
Player:AddToggle("SillyOfItToggle", {
    Text = "Silly of it",
    Default = false,
    Tooltip = "播放Silly of it表情动作",
    Callback = function(state)
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        
        if state then
            -- 激活状态（完整实现，与原始函数相同）
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
            
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://107464355830477"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
            
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://120176009143091"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()
            
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
                
                for _, assetName in ipairs({"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}) do
                    local asset = char:FindFirstChild(assetName)
                    if asset then asset:Destroy() end
                end
            end)
        else
            -- 关闭状态（完整实现）
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
            
            for _, assetName in ipairs({"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}) do
                local asset = char:FindFirstChild(assetName)
                if asset then asset:Destroy() end
            end
            
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then bodyVelocity:Destroy() end
            
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
            
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://107464355830477" then
                    track:Stop()
                end
            end
        end
    end
})

-- Subterfuge 动作按钮
Player:AddToggle("SubterfugeToggle", {
    Text = "Subterfuge",
    Default = false,
    Tooltip = "播放Subterfuge表情动作",
    Callback = function(state)
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        
        if state then
            -- 激活状态（完整实现）
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
            
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://87482480949358"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
            
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://132297506693854"
            sound.Parent = rootPart
            sound.Volume = 2
            sound.Looped = false
            sound:Play()
            
            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "_Subterfuge"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
            end)
        else
            -- 关闭状态（完整实现）
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
            
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then bodyVelocity:Destroy() end
            
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
            
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://87482480949358" then
                    track:Stop()
                end
            end
        end
    end
})

-- Aw Shucks 动作按钮
Player:AddToggle("AwShucksToggle", {
    Text = "Aw Shucks",
    Default = false,
    Tooltip = "播放Aw Shucks表情动作",
    Callback = function(state)
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        
        if state then
            -- 激活状态（完整实现）
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
            
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://74238051754912"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
            
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://123236721947419"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()
            
            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "Shucks"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
            end)
        else
            -- 关闭状态（完整实现）
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
            
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then bodyVelocity:Destroy() end
            
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
            
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://74238051754912" then
                    track:Stop()
                end
            end
        end
    end
})

-- Miss The Quiet 动作按钮
Player:AddToggle("MissTheQuietToggle", {
    Text = "Miss The Quiet",
    Default = false,
    Tooltip = "播放Miss The Quiet表情动作",
    Callback = function(state)
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        
        if state then
            -- 激活状态（完整实现）
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
            
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://100986631322204"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
            
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://131936418953291"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()
            
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
                
                for _, assetName in ipairs({"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}) do
                    local asset = char:FindFirstChild(assetName)
                    if asset then asset:Destroy() end
                end
            end)
        else
            -- 关闭状态（完整实现）
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
            
            for _, assetName in ipairs({"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}) do
                local asset = char:FindFirstChild(assetName)
                if asset then asset:Destroy() end
            end
            
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then bodyVelocity:Destroy() end
            
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
            
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://100986631322204" then
                    track:Stop()
                end
            end
        end
    end
})



local Player = Tabs.AnimationAction:AddRightGroupbox('VIP舞蹈')




Player:AddToggle("VIPToggleNew", {
    Text = "VIP (新音频)",
    Default = false,
    Tooltip = "播放VIP表情动作（新版音频）",
    Callback = function(state)
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        
        if state then
            -- 激活状态（完整实现）
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
            
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://138019937280193"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
            
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://109474987384441"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = true
            sound:Play()
            
            local effect = game:GetService("ReplicatedStorage").Assets.Emotes.HakariDance.HakariBeamEffect:Clone()
            effect.Name = "PlayerEmoteVFX"
            effect.CFrame = char.PrimaryPart.CFrame * CFrame.new(0, -1, -0.3)
            effect.WeldConstraint.Part0 = char.PrimaryPart
            effect.WeldConstraint.Part1 = effect
            effect.Parent = char
            effect.CanCollide = false
            
            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "HakariDance"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
            end)
        else
            -- 关闭状态（完整实现）
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
            
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then bodyVelocity:Destroy() end
            
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
            
            local effect = char:FindFirstChild("PlayerEmoteVFX")
            if effect then effect:Destroy() end
            
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://138019937280193" then
                    track:Stop()
                end
            end
        end
    end
})

-- VIP动作（旧音频）按钮
Player:AddToggle("VIPToggleOld", {
    Text = "VIP (旧音频)",
    Default = false,
    Tooltip = "播放VIP表情动作（旧版音频）",
    Callback = function(state)
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        
        if state then
            -- 激活状态（完整实现）
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
            
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://138019937280193"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
            
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://87166578676888"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = true
            sound:Play()
            
            local effect = game:GetService("ReplicatedStorage").Assets.Emotes.HakariDance.HakariBeamEffect:Clone()
            effect.Name = "PlayerEmoteVFX"
            effect.CFrame = char.PrimaryPart.CFrame * CFrame.new(0, -1, -0.3)
            effect.WeldConstraint.Part0 = char.PrimaryPart
            effect.WeldConstraint.Part1 = effect
            effect.Parent = char
            effect.CanCollide = false
            
            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "HakariDance"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
            end)
        else
            -- 关闭状态（完整实现）
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
            
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then bodyVelocity:Destroy() end
            
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
            
            local effect = char:FindFirstChild("PlayerEmoteVFX")
            if effect then effect:Destroy() end
            
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://138019937280193" then
                    track:Stop()
                end
            end
        end
    end
})






local Disabled = Tabs.BanEffect:AddLeftGroupbox("约翰 多反效果")

-- Helper function to safely destroy objects
local function safeDestroy(obj)
    if obj and obj.Parent then
        obj:Destroy()
    end
end

-- Helper function to remove touch interests
local function removeTouchInterests(object)
    for _, child in ipairs(object:GetDescendants()) do
        if child:IsA("TouchTransmitter") or child.Name == "TouchInterest" then
            safeDestroy(child)
        end
    end
end

Disabled:AddLabel("<b><font color=\"rgb(255, 0, 0)\">[注意]</font></b> 开启下面 功能 会造成卡顿")

-- Anti John Doe Trail
Disabled:AddToggle("AJDT", {
    Text = "反约翰 多乱码路径", 
    Default = false,
    Callback = function(v)
        if DisabledJohnDoeTrail then
            DisabledJohnDoeTrail:Disconnect()
            DisabledJohnDoeTrail = nil
        end

        if v then
            local function RemoveTouchInterests()
                local playersFolder = workspace:FindFirstChild("Players")
                if not playersFolder then return end
                
                local killers = playersFolder:FindFirstChild("Killers")
                if not killers then return end

                for _, killer in ipairs(killers:GetChildren()) do
                    if killer:FindFirstChild("JohnDoeTrail") then
                        for _, trail in ipairs(killer.JohnDoeTrail:GetDescendants()) do
                            if trail.Name == "Trail" then
                                removeTouchInterests(trail)
                            end
                        end
                    end
                end
            end

            RemoveTouchInterests()

            DisabledJohnDoeTrail = game:GetService("RunService").Heartbeat:Connect(function()
                RemoveTouchInterests()
            end)

            -- Setup descendant added listeners
            local killers = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
            if killers then
                for _, killer in ipairs(killers:GetChildren()) do
                    if killer:FindFirstChild("JohnDoeTrail") then
                        killer.JohnDoeTrail.DescendantAdded:Connect(function(newObj)
                            if newObj.Name == "Trail" then
                                removeTouchInterests(newObj)
                            end
                        end)
                    end
                end
            end
        end
    end
})

-- Anti John Doe Spikes
Disabled:AddToggle("AJDSp", {
    Text = "反约翰 多尖刺",
    Default = false,
    Callback = function(v)
        if AntiJohnDoeSpike then
            AntiJohnDoeSpike:Disconnect()
            AntiJohnDoeSpike = nil
        end

        if v then
            local function RemoveSpikes()
                local map = workspace:FindFirstChild("Map")
                if not map then return end
                
                for _, spike in ipairs(map:GetDescendants()) do
                    if spike.Name == "Spike" then
                        safeDestroy(spike)
                    end
                end
            end

            RemoveSpikes()

            AntiJohnDoeSpike = game:GetService("RunService").Heartbeat:Connect(RemoveSpikes)

            local map = workspace:FindFirstChild("Map")
            if map then
                map.DescendantAdded:Connect(function(obj)
                    if obj.Name == "Spike" then
                        safeDestroy(obj)
                    end
                end)
            end
        end
    end
})

-- Anti John Doe Stomp
Disabled:AddToggle("AJDS", {
    Text = "反约翰 多陷阱",
    Default = false,
    Callback = function(v)
        if AntiJohnDoeStomp then
            AntiJohnDoeStomp:Disconnect()
            AntiJohnDoeStomp = nil
        end

        if v then
            local function CleanShadows()
                local map = workspace:FindFirstChild("Map")
                if not map then return end
                
                local ingame = map:FindFirstChild("Ingame")
                if not ingame then return end
                
                for _, shadow in ipairs(ingame:GetDescendants()) do
                    if shadow.Name == "Shadow" then
                        removeTouchInterests(shadow)
                        safeDestroy(shadow)
                    end
                end
            end

            CleanShadows()

            AntiJohnDoeStomp = game:GetService("RunService").Heartbeat:Connect(function()
                CleanShadows()
            end)

            local map = workspace:FindFirstChild("Map")
            if map then
                local ingame = map:FindFirstChild("Ingame")
                if ingame then
                    ingame.DescendantAdded:Connect(function(obj)
                        if obj.Name == "Shadow" then
                            removeTouchInterests(obj)
                            safeDestroy(obj)
                        end
                    end)
                end
            end
        end
    end
})












local ZZ = Tabs.BanEffect:AddLeftGroupbox('Noli反效果')


local RunService = game:GetService("RunService")
local Players = game:GetService("Players")


local noliDeleterActive = false
local deletionConnection = nil
local allowedNoli = nil


local function deleteNewNoli()
    local killersFolder = workspace:WaitForChild("Players")
    local killers = killersFolder:WaitForChild("Killers")
    
   
    allowedNoli = killers:FindFirstChild("Noli")
    
   
    deletionConnection = RunService.Heartbeat:Connect(function()
        for _, child in ipairs(killers:GetChildren()) do
            if child.Name == "Noli" and child ~= allowedNoli then
                child:Destroy()
                Library:Notify("✅ 已删除新Noli: "..child:GetFullName())
            end
        end
    end)
end

ZZ:AddLabel("<b><font color=\"rgb(255, 0, 0)\">[注意]</font></b> VoidRush无视碰撞 每1局都要重开")


ZZ:AddToggle("NoliDeleter", {
    Text = "反假Noli",
    Default = false,
    Tooltip = "你的杀手角色是Noli 杀手快到你的时候 必须关闭这功能",
    Callback = function(enabled)
        noliDeleterActive = enabled
        
        if enabled then
          
            local success, err = pcall(function()
                deleteNewNoli()
            end)
            
            if success then
                Library:Notify("🟢 Noli清理器已激活 白名单: "..(allowedNoli and allowedNoli:GetFullName() or "无"))
            else
                warn("❌ 初始化失败: "..tostring(err))
                noliDeleterActive = false
            end
        else
         
            if deletionConnection then
                deletionConnection:Disconnect()
                deletionConnection = nil
            end
            Library:Notify("🔴 Noli清理器已停用")
        end
    end
})

ZZ:AddToggle('VoidRushNoclip', {
    Text = "VoidRush穿墙"
})

task.spawn(function()
    function isNoliVoidRush()
        return isKiller and localPlayer.Character and localPlayer.Character.Name == "Noli" and "Dashing" == localPlayer.Character:GetAttribute("VoidRushState")
    end
    while true do
        if isNoliVoidRush() and Toggles.VoidRushNoclip.Value and (not Toggles.EnableNoclip.Value) then
            enableNoclip()
        elseif (not isNoliVoidRush()) and (not Toggles.EnableNoclip.Value) then
            disableNoclip()
        end
        task.wait()
    end
end)

ZZ:AddToggle('VoidRushCollision', {
    Text = "VoidRush反碰撞"
})

pcall(function()
    local old
    old = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        if type(args[1]) == "string" and string.find(args[1], localPlayer.Name) then
            if string.find(args[1], "VoidRushCollision") then
                if Toggles.VoidRushCollision.Value then
                    return
                end
            elseif string.find(args[1], "C00lkiddCollision") then
                if Toggles.WalkspeedAntiCollision.Value then
                    return
                end
            end
        end
        return old(self, ...)
    end)
end)


ZZ:AddToggle("VoidRushLgnoreCollision", {
    Text = "VoidRush无视碰撞",
    Default = false,
    Callback = function()    
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")


local ORIGINAL_DASH_SPEED = 60

local isOverrideActive = false
local connection

local function startOverride()
    if isOverrideActive then return end
    isOverrideActive = true

    
    connection = RunService.RenderStepped:Connect(function()
      
        Humanoid.WalkSpeed = ORIGINAL_DASH_SPEED
        Humanoid.AutoRotate = false
        
        local direction = HumanoidRootPart.CFrame.LookVector
        local horizontalDirection = Vector3.new(direction.X, 0, direction.Z).Unit
     
        Humanoid:Move(horizontalDirection)
    end)
end

local function stopOverride()
    if not isOverrideActive then return end
    isOverrideActive = false

    
    Humanoid.WalkSpeed = 16 
    Humanoid.AutoRotate = true
    Humanoid:Move(Vector3.new(0, 0, 0)) 
    
    if connection then
        connection:Disconnect()
        connection = nil
    end
end


RunService.RenderStepped:Connect(function()
    local voidRushState = Character:GetAttribute("VoidRushState")

    if voidRushState == "Dashing" then
        startOverride()
    else
        stopOverride()
    end
end)
     end
})







local player = game:GetService("Players").LocalPlayer
local isVoidRushCrashed = false
local characterCheckLoop = nil

local function manageVoidRushState(character)
    while isVoidRushCrashed and character and character.Parent do
        character:SetAttribute("VoidRushState", "Crashed")
        task.wait(0.5)  
    end
end

ZZ:AddToggle("VoidRushOverride", {
    Text = "VoidRush冲刺优化",
    Default = false,
    Tooltip = "需要锁定视角",
    Callback = function(enabled)
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        local Character
        local Humanoid
        local HumanoidRootPart
        local monitorTask
        local overrideConnection
        local characterAddedConnection
        
        local ORIGINAL_DASH_SPEED = 60
        local DEFAULT_WALK_SPEED = 16
        
        local function setupCharacter()
            if LocalPlayer.Character then
                Character = LocalPlayer.Character
                Humanoid = Character:WaitForChild("Humanoid")
                HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
                Humanoid.WalkSpeed = DEFAULT_WALK_SPEED
                Humanoid.AutoRotate = true
            end
        end
        
        local function startOverride()
            if overrideConnection then return end
            
            overrideConnection = RunService.RenderStepped:Connect(function()
                if not Character or not Humanoid or not HumanoidRootPart then
                    return
                end
                
                Humanoid.WalkSpeed = ORIGINAL_DASH_SPEED
                Humanoid.AutoRotate = false
                
                local direction = HumanoidRootPart.CFrame.LookVector
                local horizontalDirection = Vector3.new(direction.X, 0, direction.Z).Unit
                Humanoid:Move(horizontalDirection)
            end)
        end
        
        local function stopOverride()
            if overrideConnection then
                overrideConnection:Disconnect()
                overrideConnection = nil
            end
            
            if Humanoid then
                Humanoid.WalkSpeed = DEFAULT_WALK_SPEED
                Humanoid.AutoRotate = true
                Humanoid:Move(Vector3.new(0, 0, 0))
            end
        end
        
        local function monitorVoidRush()
            while enabled and task.wait() do
                if not Character or not Humanoid or not HumanoidRootPart then
                    setupCharacter()
                    if not Character then continue end
                end
                
                local voidRushState = Character:GetAttribute("VoidRushState")
                if voidRushState == "Dashing" then
                    startOverride()
                else
                    stopOverride()
                end
            end
            stopOverride()
        end
        
        local function cleanup()
            if monitorTask then
                task.cancel(monitorTask)
                monitorTask = nil
            end
            
            if characterAddedConnection then
                characterAddedConnection:Disconnect()
                characterAddedConnection = nil
            end
            
            stopOverride()
            setupCharacter()
        end
        
        if enabled then
            cleanup()
            setupCharacter()
            monitorTask = task.spawn(monitorVoidRush)
            
            characterAddedConnection = LocalPlayer.CharacterAdded:Connect(function(newChar)
                Character = newChar
                Humanoid = Character:WaitForChild("Humanoid")
                HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
                if not enabled then
                    Humanoid.WalkSpeed = DEFAULT_WALK_SPEED
                    Humanoid.AutoRotate = true
                end
            end)
        else
            cleanup()
        end
    end
})














local ZZ = Tabs.BanEffect:AddRightGroupbox('1x4反效果')



local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local RemoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")

local AutoPopup = {
    Enabled = false,
    Task = nil,
    Connections = {},
    Interval = 0.5
}

local function deletePopups()
    if not LocalPlayer or not LocalPlayer:FindFirstChild("PlayerGui") then
        return false
    end
    
    local tempUI = LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
    if not tempUI then
        return false
    end
    
    local deleted = false
    for _, popup in ipairs(tempUI:GetChildren()) do
        if popup.Name == "1x1x1x1Popup" then
            popup:Destroy()
            deleted = true
        end
    end
    return deleted
end

local function triggerEntangled()
    local args = { [1] = "Entangled" }
    pcall(function()
        RemoteEvent:FireServer(unpack(args))
    end)
end

local function setupPopupListener()
    if not LocalPlayer or not LocalPlayer:FindFirstChild("PlayerGui") then return end
    
    local tempUI = LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
    if not tempUI then
        tempUI = Instance.new("Folder")
        tempUI.Name = "TemporaryUI"
        tempUI.Parent = LocalPlayer.PlayerGui
    end
    
    if AutoPopup.Connections.ChildAdded then
        AutoPopup.Connections.ChildAdded:Disconnect()
    end
    
    AutoPopup.Connections.ChildAdded = tempUI.ChildAdded:Connect(function(child)
        if AutoPopup.Enabled and child.Name == "1x1x1x1Popup" then
            task.defer(function()
                child:Destroy()
            end)
        end
    end)
end

local function runMainTask()
    while AutoPopup.Enabled do
        deletePopups()
        triggerEntangled()
        task.wait(AutoPopup.Interval) -- 使用设置的间隔时间
    end
end

local function startAutoPopup()
    if AutoPopup.Enabled then return end
    
    AutoPopup.Enabled = true
    setupPopupListener()
    
    if AutoPopup.Task then
        task.cancel(AutoPopup.Task)
    end
    AutoPopup.Task = task.spawn(runMainTask)
end

local function stopAutoPopup()
    if not AutoPopup.Enabled then return end
    
    AutoPopup.Enabled = false
    
    if AutoPopup.Task then
        task.cancel(AutoPopup.Task)
        AutoPopup.Task = nil
    end
    
    for _, connection in pairs(AutoPopup.Connections) do
        connection:Disconnect()
    end
    AutoPopup.Connections = {}
end

-- 添加间隔时间调整滑块
ZZ:AddSlider('AutoPopupInterval', {
    Text = '执行间隔(秒)',
    Default = 0.5,
    Min = 0.5,
    Max = 2,
    Rounding = 0,
    Tooltip = '设置自动执行的间隔时间(1-5秒)',
    Callback = function(value)
        AutoPopup.Interval = value
    end
})

ZZ:AddToggle('AutoPopupToggle', {
    Text = '反1x4弹窗(反懒惰效果)',
    Default = false,
    Tooltip = '反弹窗和懒惰效果',
    Callback = function(state)
        if state then
            startAutoPopup()
        else
            stopAutoPopup()
        end
    end
})

if LocalPlayer then
    LocalPlayer:GetPropertyChangedSignal("Parent"):Connect(function()
        if not LocalPlayer.Parent then
            stopAutoPopup()
        end
    end)
end



ZZ:AddToggle("RemoveUnstableEye", {
    Text = "反不稳定之眼不能移动", 
    Default = false,
    Callback = function(v)
        if not _G.UnstableEyeCleanup then _G.UnstableEyeCleanup = {} end
        local connections = _G.UnstableEyeCleanup

        -- 先清理现有的连接
        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.UnstableEyeCleanup = {}

        -- 如果关闭按钮，直接返回
        if not v then return end

        local function CleanUnstableEyeEffects()
            local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
            if not killersFolder then return end
            
            for _, killer in ipairs(killersFolder:GetDescendants()) do
                if killer.Name == "UnstableEye" then
                    killer:Destroy()
                end
            end
        end

        -- 初始清理
        task.spawn(CleanUnstableEyeEffects)

        -- 设置定期清理
        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanUnstableEyeEffects()
        end)

        -- 设置新对象添加时的监听
        local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
        if killersFolder then
            connections.descendantAdded = killersFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "UnstableEye" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

ZZ:AddToggle("RemoveBlindness", {
    Text = "反失明效果", 
    Default = false,
    Callback = function(v)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        
        -- 获取 Modules.StatusEffects 路径
        local modulesFolder = ReplicatedStorage:FindFirstChild("Modules")
        local statusEffects = modulesFolder and modulesFolder:FindFirstChild("StatusEffects")
        
        if v then
            -- 确保路径存在
            if not statusEffects then
                warn("未找到 ReplicatedStorage.Modules.StatusEffects 路径")
                return
            end
            
            -- 查找并删除 Blindness 模块
            local blindness = statusEffects:FindFirstChild("Blindness")
            if blindness then
                blindness:Destroy()
                print("已删除 Blindness 模块")
            else
                print("未找到 Blindness 模块")
            end
            
            -- 设置持续检查
            if not _G.BlindnessCleanup then _G.BlindnessCleanup = {} end
            local connections = _G.BlindnessCleanup
            
            -- 定期检查
            connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
                task.wait(1.5)
                local blindness = statusEffects:FindFirstChild("Blindness")
                if blindness then
                    blindness:Destroy()
                end
            end)
            
            -- 监听新增模块
            connections.descendantAdded = statusEffects.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "Blindness" then
                    task.wait(0.1) -- 确保模块完全加载
                    descendant:Destroy()
                end
            end)
        else
            -- 关闭时清理连接
            if _G.BlindnessCleanup then
                for _, conn in pairs(_G.BlindnessCleanup) do
                    conn:Disconnect()
                end
                _G.BlindnessCleanup = {}
            end
        end
    end
})

local ZZ = Tabs.BanEffect:AddRightGroupbox('谢德反效果')

ZZ:AddToggle("RemoveStunningKiller", {
    Text = "反谢德出剑缓慢移速", 
    Default = false,
    Callback = function(v)
        -- 初始化全局变量
        if not _G.StunningKillerCleanup then _G.StunningKillerCleanup = {} end
        local connections = _G.StunningKillerCleanup

        -- 关闭时清理所有连接
        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.StunningKillerCleanup = {}

        -- 如果关闭按钮，直接返回
        if not v then return end

        local function CleanStunningKillers()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            local survivorList = survivorsFolder:GetChildren()
            for i = 1, #survivorList, 5 do
                task.spawn(function()
                    for j = i, math.min(i + 4, #survivorList) do
                        local survivor = survivorList[j]
                        local stunningKiller = survivor:FindFirstChild("StunningKiller")
                        if stunningKiller then
                            stunningKiller:Destroy()
                        end
                    end
                end)
            end
        end

        -- 初始清理
        task.spawn(CleanStunningKillers)

        -- 设置定期清理
        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(2)
            CleanStunningKillers()
        end)

        -- 设置新对象添加时的监听
        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "StunningKiller" then
                    descendant:Destroy()
                end
            end)
        end
    end
})


local ZZ = Tabs.BanEffect:AddRightGroupbox('菜鸟反效果')

ZZ:AddToggle("RemoveSlateskin", {
    Text = "反菜鸟石板皮肤缓慢效果", 
    Default = false,
    Callback = function(v)
        if SlateskinCleanupConnection then
            SlateskinCleanupConnection:Disconnect()
            SlateskinCleanupConnection = nil
            table.clear(slateskinCache)
        end

        if v then
            local function CleanSlateskins()
                local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
                if not survivorsFolder then return end
                
                local survivorList = survivorsFolder:GetChildren()
                for i = 1, #survivorList, 5 do
                    task.spawn(function()
                        for j = i, math.min(i + 4, #survivorList) do
                            local survivor = survivorList[j]
                            local slateskin = survivor:FindFirstChild("SlateskinStatus")
                            if slateskin then
                                slateskin:Destroy()
                            end
                        end
                    end)
                end
            end

            task.spawn(CleanSlateskins)

            SlateskinCleanupConnection = game:GetService("RunService").Heartbeat:Connect(function()
                task.wait(2)
                CleanSlateskins()
            end)

            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if survivorsFolder then
                survivorsFolder.DescendantAdded:Connect(function(descendant)
                    if descendant.Name == "SlateskinStatus" then
                        descendant:Destroy()
                    end
                end)
            end
        end
    end
})




local Disabled = Tabs.BanEffect:AddLeftGroupbox('访客1337反效果')
-- 1. 反访客冲刺没有击中都缓慢
Disabled:AddToggle("RemoveSlowed", {
    Text = "反冲刺没有击中都缓慢", 
    Default = false,
    Callback = function(v)
        -- 修复点：使用局部变量保存连接
        if not _G.SlowedCleanup then _G.SlowedCleanup = {} end
        local connections = _G.SlowedCleanup

        -- 关闭时断开所有连接
        if not v then
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            _G.SlowedCleanup = {}
            return
        end

        -- 修复点：显式保存 DescendantAdded 事件
        local function CleanSlowedStatuses()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "SlowedStatus" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanSlowedStatuses)

        -- 保存心跳连接
        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanSlowedStatuses()
        end)

        -- 保存新增监听
        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "SlowedStatus" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

-- 2. 反访客格挡时移速问题 (独立变量名)
Disabled:AddToggle("RemoveBlockingSlow", {
    Text = "反格挡时移速问题", 
    Default = false,
    Callback = function(v)
        if not _G.BlockingCleanup then _G.BlockingCleanup = {} end
        local connections = _G.BlockingCleanup

        if not v then
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            _G.BlockingCleanup = {}
            return
        end

        local function CleanStatuses()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "ResistanceStatus" or survivor.Name == "GuestBlocking" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanStatuses)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanStatuses()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "ResistanceStatus" or descendant.Name == "GuestBlocking" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

-- 3. 反访客拳击时移速问题 (独立变量名)
Disabled:AddToggle("RemovePunchSlow", {
    Text = "反拳击时移速问题", 
    Default = false,
    Callback = function(v)
        if not _G.PunchCleanup then _G.PunchCleanup = {} end
        local connections = _G.PunchCleanup

        if not v then
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            _G.PunchCleanup = {}
            return
        end

        local function CleanStatuses()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "ResistanceStatus" or survivor.Name == "PunchAbility" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanStatuses)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanStatuses()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "ResistanceStatus" or descendant.Name == "PunchAbility" then
                    descendant:Destroy()
                end
            end)
        end
    end
})



-- 5. 反访客冲刺结束效果
Disabled:AddToggle("RemoveChargeEnded", {
    Text = "反冲刺结束效果", 
    Default = false,
    Callback = function(v)
        if not _G.ChargeEndedCleanup then _G.ChargeEndedCleanup = {} end
        local connections = _G.ChargeEndedCleanup

        if not v then
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            _G.ChargeEndedCleanup = {}
            return
        end

        local function CleanChargeEndedEffects()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "GuestChargeEnded" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanChargeEndedEffects)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanChargeEndedEffects()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "GuestChargeEnded" then
                    descendant:Destroy()
                end
            end)
        end
    end
})





local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 创建一个体力功能组
local MVP = Tabs.PhysicalStrength:AddLeftGroupbox("体力功能")

-- 体力系统设置
local StaminaSettings = {
    MaxStamina = 100,      -- 最大体力值
    StaminaGain = 25,      -- 体力恢复速度
    StaminaLoss = 10,      -- 体力消耗速度
    SprintSpeed = 28,      -- 奔跑速度
    InfiniteGain = 9999    -- 无限体力恢复速度
}

-- 体力控制开关
local SettingToggles = {
    MaxStamina = true,
    StaminaGain = true,
    StaminaLoss = true,
    SprintSpeed = true
}

-- 获取游戏体力模块
local SprintingModule = ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting")
local GetModule = function() return require(SprintingModule) end

-- 实时更新体力设置
task.spawn(function()
    while true do
        local m = GetModule()
        for key, value in pairs(StaminaSettings) do
            if SettingToggles[key] then
                m[key] = value
            end
        end
        task.wait(0.5)
    end
end)

-- 无限体力功能
local bai = {Spr = false}
local connection

MVP:AddToggle('MyToggle', {
    Text = '无限体力',
    Default = false,
    Callback = function(state)
        bai.Spr = state
        local Sprinting = GetModule()

        if state then
            Sprinting.StaminaLoss = 0
            Sprinting.StaminaGain = StaminaSettings.InfiniteGain or 9999

            if connection then connection:Disconnect() end
            connection = RunService.Heartbeat:Connect(function()
                if not bai.Spr then return end
                Sprinting.StaminaLoss = 0
                Sprinting.StaminaGain = StaminaSettings.InfiniteGain or 9999
            end)
        else
            Sprinting.StaminaLoss = StaminaSettings.StaminaLoss or 10
            Sprinting.StaminaGain = StaminaSettings.StaminaGain or 25

            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
})

MVP:AddToggle('MaxStaminaToggle', {
    Text = '启用体力大小调节',
    Default = true,
    Callback = function(Value)
        SettingToggles.MaxStamina = Value
    end
})


MVP:AddToggle('StaminaGainToggle', {
    Text = '启用体力恢复调节',
    Default = true,
    Callback = function(Value)
        SettingToggles.StaminaGain = Value
    end
})

MVP:AddToggle('StaminaLossToggle', {
    Text = '启用体力消耗调节',
    Default = true,
    Callback = function(Value)
        SettingToggles.StaminaLoss = Value
    end
})

MVP:AddToggle('SprintSpeedToggle', {
    Text = '启用奔跑速度调节',
    Default = true,
    Callback = function(Value)
        SettingToggles.SprintSpeed = Value
    end
})







local MVP = Tabs.PhysicalStrength:AddRightGroupbox("调试区")



MVP:AddSlider('InfStaminaGainSlider', {
    Text = '无限体力恢复速度',
    Default = 9999,
    Min = 0,
    Max = 50000,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.InfiniteGain = Value
    end
})


MVP:AddSlider('MySlider1', {
    Text = '体力大小',
    Default = 100,
    Min = 0,
    Max = 99999,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.MaxStamina = Value
    end
})


MVP:AddSlider('MySlider2', {
    Text = '体力恢复',
    Default = 25,
    Min = 0,
    Max = 250,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.StaminaGain = Value
    end
})


MVP:AddSlider('MySlider3', {
    Text = '体力消耗',
    Default = 10,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.StaminaLoss = Value
    end
})


MVP:AddSlider('MySlider4', {
    Text = '奔跑速度',
    Default = 28,
    Min = 0,
    Max = 200,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.SprintSpeed = Value
    end
})




local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local PZ = Tabs.Pizza:AddLeftGroupbox("披萨功能")

local pizzaConnection = nil
local pizzaTPConnection = nil
local pizzaAttractionActive = false
local pizzaCache = {}
local pizzaEffects = {}

local function createPizzaEffect(pizza, effectName)
    if not pizza:FindFirstChild(effectName) then
        local effect = Instance.new("ParticleEmitter")
        effect.Name = effectName
        effect.Texture = "rbxassetid://242487987"
        effect.LightEmission = 0.8
        effect.Size = NumberSequence.new(0.5)
        if effectName == "TeleportEffect" then
            effect.Lifetime = NumberRange.new(0.5)
        end
        effect.Parent = pizza
        pizzaEffects[pizza] = effect
        return effect
    end
    return pizzaEffects[pizza]
end

local function cleanUpEffects()
    for pizza, effect in pairs(pizzaEffects) do
        if not pizza or not pizza.Parent then
            effect:Destroy()
            pizzaEffects[pizza] = nil
        end
    end
end

local function findClosestPizza(rootPart)
    local pizzaFolder = workspace:FindFirstChild("Pizzas") or workspace.Map
    if not pizzaFolder then return nil end
    
    local closestPizza, closestDistance = nil, math.huge
    for _, pizza in ipairs(pizzaFolder:GetDescendants()) do
        if pizza:IsA("BasePart") and pizza.Name == "Pizza" and not pizzaCache[pizza] then
            local distance = (rootPart.Position - pizza.Position).Magnitude
            if distance < closestDistance then
                closestPizza = pizza
                closestDistance = distance
            end
        end
    end
    return closestPizza
end

PZ:AddToggle("AEP", {
    Text = "自动吃披萨(追踪传送)",
    Default = false,
    Tooltip = "当生命值低于设定值时自动吸引附近的披萨",
    Callback = function(enabled)
        _G.AutoEatPizza = enabled
        
        if pizzaConnection then
            pizzaConnection:Disconnect()
            pizzaConnection = nil
        end
        
        if enabled then
            pizzaConnection = RunService.Heartbeat:Connect(function()
                local player = Players.LocalPlayer
                local character = player.Character
                if not character or not character:FindFirstChild("Humanoid") or not character:FindFirstChild("HumanoidRootPart") then
                    return
                end
                
                local humanoid = character.Humanoid
                local rootPart = character.HumanoidRootPart
                
                if _G.HealthEatPizza and humanoid.Health >= _G.HealthEatPizza then
                    return
                end
                
                local closestPizza = findClosestPizza(rootPart)
                if closestPizza then
                    closestPizza.CFrame = closestPizza.CFrame:Lerp(
                        rootPart.CFrame * CFrame.new(0, 0, -2),
                        0.5
                    )
                    createPizzaEffect(closestPizza, "AttractEffect")
                end
                cleanUpEffects()
            end)
        end
    end
})

PZ:AddToggle("ATP", {
    Text = "自动吃披萨(传送)",
    Default = false,
    Tooltip = "当生命值低于设定值时自动将最近的披萨传送到玩家",
    Callback = function(enabled)
        _G.AutoTeleportPizza = enabled
        
        if pizzaTPConnection then
            pizzaTPConnection:Disconnect()
            pizzaTPConnection = nil
        end
        
        if enabled then
            pizzaTPConnection = RunService.Heartbeat:Connect(function()
                local player = Players.LocalPlayer
                local character = player.Character
                if not character or not character:FindFirstChild("Humanoid") or not character:FindFirstChild("HumanoidRootPart") then
                    return
                end
                
                local humanoid = character.Humanoid
                local rootPart = character.HumanoidRootPart
                
                if _G.HealthEatPizza and humanoid.Health >= _G.HealthEatPizza then
                    return
                end
                
                local closestPizza = findClosestPizza(rootPart)
                if closestPizza then
                    closestPizza.CFrame = rootPart.CFrame * CFrame.new(0, 0, -2)
                    local effect = createPizzaEffect(closestPizza, "TeleportEffect")
                    task.delay(1, function()
                        if effect and effect.Parent then
                            effect:Destroy()
                            pizzaEffects[closestPizza] = nil
                        end
                    end)
                end
                cleanUpEffects()
            end)
        end
    end
})


PZ:AddDivider()  

PZ:AddSlider("HealthThreshold", {
    Text = "生命值",
    Default = 50,
    Min = 10,
    Max = 130,
    Rounding = 0,
    Tooltip = "当生命值低于设置生命值吃披萨",
    
    Callback = function(value)
        _G.HealthEatPizza = value
    end
})






PZ:AddDivider()  

PZ:AddButton("InstantAttract", {
    Text = "将披萨送到脚下",
    Func = function()
        local player = Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local rootPart = character.HumanoidRootPart
            for _, pizza in ipairs(workspace:GetDescendants()) do
                if pizza:IsA("BasePart") and pizza.Name == "Pizza" then
                    pizza.CFrame = rootPart.CFrame
                    break
                end
            end
        end
    end
})

local Misc = Tabs.Pizza:AddRightGroupbox('自动吃披萨［2］')

Misc:AddSlider("HealthEatPizza",{
Text = "生命值",
Min = 1,
Default = 50,
Max = 50,
Rounding = 1,
Compact = true,
Callback = function(v)
_G.HealthEatPizza = v
end})
Misc:AddSlider("DistanceEatPizza",{
Text = "距离范围",
Min = 10,
Default = 10,
Max = 50,
Rounding = 1,
Compact = true,
Callback = function(v)
_G.DistanceEatPizza = v
end})

_G.HealthEatPizza = 50
_G.DistanceEatPizza = 10

Misc:AddToggle("AlwaysEatPizza",{
Text = "自动吃披萨",
Default = false,
Callback = function(v)
_G.AlwaysEatPizza = v
game:GetService("RunService").RenderStepped:Connect(function()
if _G.AlwaysEatPizza and workspace.Map:FindFirstChild("Ingame"):FindFirstChild("Pizza") then
if game.Players.LocalPlayer.Character.Humanoid.Health < _G.HealthEatPizza and (workspace.Map:FindFirstChild("Ingame"):FindFirstChild("Pizza").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < _G.DistanceEatPizza then
workspace.Map:FindFirstChild("Ingame"):FindFirstChild("Pizza").Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end
end
end)
end})



local SM = Tabs.FightingKilling:AddLeftGroupbox('杀戮功能[杀手]')



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local silentAimEnabled = false
local targetPlayer = nil
local maxDistance = 100
local silentAimConnection = nil

local function isKiller()
    local killersFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Killers")
    if killersFolder and LocalPlayer.Character and table.find(killersFolder:GetChildren(), LocalPlayer.Character) then
        return true
    end
    return false
end

local function getClosestSurvivor()
    local survivorsFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
    if not survivorsFolder then return nil end

    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end
    local myPos = myChar.HumanoidRootPart.Position

    local closest = nil
    local shortest = math.huge

    for _, model in ipairs(survivorsFolder:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
            local dist = (model.HumanoidRootPart.Position - myPos).Magnitude
            if dist < shortest and dist <= maxDistance then
                shortest = dist
                closest = model
            end
        end
    end

    return closest
end

local function faceTarget(model)
    if not model or not model:FindFirstChild("HumanoidRootPart") then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    local root = char.HumanoidRootPart
    local targetPos = model.HumanoidRootPart.Position
    local look = CFrame.new(root.Position, Vector3.new(targetPos.X, root.Position.Y, targetPos.Z))
    root.CFrame = look
end

getgenv().GetSilentAimTargetPosition = function()
    if silentAimEnabled and isKiller() then
        local target = getClosestSurvivor()
        if target and target:FindFirstChild("Head") then
            return target.Head.Position
        end
    end
    return nil
end

SM:AddToggle("静默瞄准", {
    Text = "静默瞄准",
    Callback = function(state)
        silentAimEnabled = state
       
        if state then
            if not silentAimConnection then
                silentAimConnection = RunService.Heartbeat:Connect(function()
                    if not isKiller() then return end
                    targetPlayer = getClosestSurvivor()
                    if targetPlayer then
                        faceTarget(targetPlayer)
                    end
                end)
            end
        else
   
            if silentAimConnection then
                silentAimConnection:Disconnect()
                silentAimConnection = nil
            end
            targetPlayer = nil
        end
    end
}):AddKeyPicker("AimKeyPicker", {
    Text = "静默瞄准",
    Default = "Z",
    Mode = "Toggle",
    SyncToggleState = true,
})



-- 创建全局连接管理表
if not _G.HitboxTracking then
    _G.HitboxTracking = {
        Connection = nil,
        Active = false
    }
end

SM:AddToggle("HitboxTrackingToggle", {
    Text = "吸附杀戮光环",
    Tooltip = "启用/禁用命中框追踪",
    Default = false,
    Disabled = false,
    Visible = true,
    Risky = false,

    Callback = function(state)
        -- 关闭功能
        if not state then
            if _G.HitboxTracking.Connection then
                _G.HitboxTracking.Connection:Disconnect()
                _G.HitboxTracking.Connection = nil
            end
            _G.HitboxTracking.Active = false
            return
        end

        -- 确保游戏加载完成
        repeat task.wait() until game:IsLoaded()

        -- 初始化服务
        local Players = game:GetService('Players')
        local RunService = game:GetService('RunService')
        local Player = Players.LocalPlayer

        -- 初始化角色部件
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

        -- 角色变化处理
        Player.CharacterAdded:Connect(function(NewCharacter)
            Character = NewCharacter
            Humanoid = Character:WaitForChild("Humanoid")
            HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
        end)

local AttackAnimations = {
	'rbxassetid://131430497821198', --// MassInfection, 1x1x1x1
	'rbxassetid://83829782357897', --// Slash, 1x1x1x1
	'rbxassetid://126830014841198', --// Slash, Jason
	'rbxassetid://126355327951215', --// Behead, Jason
	'rbxassetid://121086746534252', --// GashingWoundStart, Jason
	'rbxassetid://105458270463374', --// Slash, JohnDoe
	'rbxassetid://127172483138092', --// CorruptEnergy, JohnDoe
	'rbxassetid://18885919947', --// CorruptNature, c00lkidd
	'rbxassetid://18885909645', --// Attack, c00lkidd
	'rbxassetid://87259391926321', --// ParryPunch, Guest1337
	'rbxassetid://106014898528300', --// Charge, Guest1337
	'rbxassetid://87259391926321', --// Punch, Guest1337
	'rbxassetid://86545133269813', --// Stab, TwoTime
	'rbxassetid://89448354637442', --// LungeStart, TwoTime
	'rbxassetid://90499469533503', --// GunFire, Chance
	'rbxassetid://116618003477002', --// Slash, Shedletsky
	'rbxassetid://106086955212611', --// Stab, TwoTime, Skin: PhilosopherTwotime
	'rbxassetid://107640065977686', --// LungeStart, TwoTime, Skin: PhilosopherTwotime
	'rbxassetid://77124578197357', --// GunFire, Chance, Skin: OutlawChance
	'rbxassetid://101771617803133', --// GunFire, Chance, Skin: #CassidyChance
	'rbxassetid://134958187822107', --// GunFire, Chance, Skin: RetroChance
	'rbxassetid://111313169447787', --// GunFire, Chance, Skin: MLGChance
	'rbxassetid://71685573690338', --// GunFire, Chance, Skin: Milestone100Chance
	'rbxassetid://71685573690338', --// GunFire, Chance, Skin: Milestone75Chance
	'rbxassetid://129843313690921', --// ParryPunch, Guest1337, Skin: #NerfedDemomanGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: #NerfedDemomanGuest
	'rbxassetid://129843313690921', --// Punch, Guest1337, Skin: #NerfedDemomanGuest
	'rbxassetid://136007065400978', --// ParryPunch, Guest1337, Skin: LittleBrotherGuest
	'rbxassetid://136007065400978', --// Punch, Guest1337, Skin: LittleBrotherGuest
	'rbxassetid://86096387000557', --// ParryPunch, Guest1337, Skin: Milestone100Guest
	'rbxassetid://86096387000557', --// ParryPunch, Guest1337, Skin: Milestone75Guest
	'rbxassetid://108807732150251', --// ParryPunch, Guest1337, Skin: GreenbeltGuest
	'rbxassetid://138040001965654', --// Punch, Guest1337, Skin: GreenbeltGuest
	'rbxassetid://73502073176819', --// Charge, Guest1337, Skin: GreenbeltGuest
	'rbxassetid://129843313690921', --// ParryPunch, Guest1337, Skin: #DemomanGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: #DemomanGuest
	'rbxassetid://129843313690921', --// Punch, Guest1337, Skin: #DemomanGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: GunnerGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: BobbyGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: !JuggernautGuest
	'rbxassetid://86709774283672', --// ParryPunch, Guest1337, Skin: SorcererGuest
	'rbxassetid://106014898528300', --// Charge, Guest1337, Skin: SorcererGuest
	'rbxassetid://87259391926321', --// Punch, Guest1337, Skin: SorcererGuest
	'rbxassetid://140703210927645', --// ParryPunch, Guest1337, Skin: DragonGuest
	'rbxassetid://96173857867228', --// Charge, Guest1337, Skin: AllyGuest
	'rbxassetid://121255898612475', --// Slash, Shedletsky, Skin: RetroShedletsky
	'rbxassetid://98031287364865', --// Slash, Shedletsky, Skin: BrightEyesShedletsky
	'rbxassetid://119462383658044', --// Slash, Shedletsky, Skin: NessShedletsky
	'rbxassetid://77448521277146', --// Slash, Shedletsky, Skin: Milestone100Shedletsky
	'rbxassetid://77448521277146', --// Slash, Shedletsky, Skin: Milestone75Shedletsky
	'rbxassetid://103741352379819', --// Slash, Shedletsky, Skin: #RolandShedletsky
	'rbxassetid://119462383658044', --// Slash, Shedletsky, Skin: HeartbrokenShedletsky
	'rbxassetid://131696603025265', --// Slash, Shedletsky, Skin: JamesSunderlandShedletsky
	'rbxassetid://122503338277352', --// Slash, Shedletsky, Skin: SkiesShedletsky
	'rbxassetid://97648548303678', --// Slash, Shedletsky, Skin: #JohnWardShedletsky
	'rbxassetid://94162446513587', --// Slash, JohnDoe, Skin: !Joner
	'rbxassetid://84426150435898', --// CorruptEnergy, JohnDoe, Skin: !Joner
	'rbxassetid://93069721274110', --// Slash, JohnDoe, Skin: AnnihilationJohnDoe
	'rbxassetid://114620047310688', --// CorruptEnergy, JohnDoe, Skin: AnnihilationJohnDoe
	'rbxassetid://97433060861952', --// Slash, JohnDoe, Skin: #SK
	'rbxassetid://82183356141401', --// CorruptEnergy, JohnDoe, Skin: #SK
	'rbxassetid://100592913030351', --// MassInfection, 1x1x1x1, Skin: Fleskhjerta1x1x1x1
	'rbxassetid://121293883585738', --// Slash, 1x1x1x1, Skin: Fleskhjerta1x1x1x1
	'rbxassetid://100592913030351', --// MassInfection, 1x1x1x1, Skin: AceOfSpades1x1x1x1
	'rbxassetid://121293883585738', --// Slash, 1x1x1x1, Skin: AceOfSpades1x1x1x1
	'rbxassetid://100592913030351', --// MassInfection, 1x1x1x1, Skin: Lancer1x1x1x1
	'rbxassetid://121293883585738', --// Slash, 1x1x1x1, Skin: Lancer1x1x1x1
	'rbxassetid://70447634862911', --// MassInfection, 1x1x1x1, Skin: Hacklord1x1x1x1
	'rbxassetid://92173139187970', --// Slash, 1x1x1x1, Skin: Hacklord1x1x1x1
	'rbxassetid://106847695270773', --// GashingWoundStart, Jason, Skin: Subject0Jason
	'rbxassetid://125403313786645', --// Slash, Jason, Skin: Subject0Jason
	'rbxassetid://81639435858902', --// Behead, Jason, Skin: WhitePumpkinJason
	'rbxassetid://137314737492715', --// GashingWoundStart, Jason, Skin: WhitePumpkinJason
	'rbxassetid://120112897026015', --// Slash, Jason, Skin: WhitePumpkinJason
	'rbxassetid://82113744478546', --// Behead, Jason, Skin: KillerKyleJason
	'rbxassetid://118298475669935', --// Slash, Jason, Skin: KillerKyleJason
	'rbxassetid://82113744478546', --// Behead, Jason, Skin: #SmartestJason
	'rbxassetid://118298475669935', --// Slash, Jason, Skin: #SmartestJason
	'rbxassetid://126681776859538', --// Behead, Jason, Skin: PursuerJason
	'rbxassetid://129976080405072', --// GashingWoundStart, Jason, Skin: PursuerJason
	'rbxassetid://109667959938617', --// Slash, Jason, Skin: PursuerJason
	'rbxassetid://74707328554358', --// Slash, Jason, Skin: #DeadRabbitsJason
	'rbxassetid://133336594357903', --// Behead, Jason, Skin: #DeadRabbitsJason
	'rbxassetid://86204001129974', --// GashingWoundStart, Jason, Skin: #DeadRabbitsJason
	'rbxassetid://82113744478546', --// Behead, Jason, Skin: RetroJason
	'rbxassetid://118298475669935', --// Slash, Jason, Skin: RetroJason
	'rbxassetid://124243639579224', --// CorruptNature, c00lkidd, Skin: MafiosoC00l
	'rbxassetid://70371667919898', --// Attack, c00lkidd, Skin: MafiosoC00l
	'rbxassetid://131543461321709', --// Attack, c00lkidd, Skin: SaviorC00l
	'rbxassetid://136323728355613', --// Swing, Noli
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Devesto
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Yourself
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: YAAI
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Toolbox
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: ASPX
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: RedRoomCurse
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Saggitial
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Quimera
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: 035
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Artful
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Robert
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Ephialtes
    'rbxassetid://109230267448394' --// Swing, Noli, Skin: Umbra
};
        local RNG = Random.new()

        -- 清除旧连接
        if _G.HitboxTracking.Connection then
            _G.HitboxTracking.Connection:Disconnect()
        end

        -- 标记为活动状态
        _G.HitboxTracking.Active = true

        -- 创建新连接
        _G.HitboxTracking.Connection = RunService.Heartbeat:Connect(function()
            -- 双重活动检查
            if not _G.HitboxTracking.Active then return end
            if not HumanoidRootPart or not HumanoidRootPart:IsDescendantOf(workspace) then return end

            -- 攻击动画检测
            local isAttacking = false
            for _, track in pairs(Humanoid:GetPlayingAnimationTracks()) do
                if track.Animation and table.find(AttackAnimations, track.Animation.AnimationId) then
                    if (track.TimePosition / track.Length) < 0.75 then
                        isAttacking = true
                        break
                    end
                end
            end

            if not isAttacking then return end

            -- 目标查找
            local target, nearestDist = nil, 12

            local function findTargets(targets)
                for _, entity in pairs(targets) do
                    if entity == Character or not entity:FindFirstChild("HumanoidRootPart") then
                        continue
                    end

                    local distance = (entity.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude
                    if distance < nearestDist then
                        nearestDist = distance
                        target = entity
                    end
                end
            end

            -- 检查玩家
            if workspace:FindFirstChild("Players") then
                findTargets(workspace.Players:GetDescendants())
            end
            
            -- 检查NPC
            local npcsFolder = workspace.Map:FindFirstChild("NPCs", true)
            if npcsFolder then
                findTargets(npcsFolder:GetChildren())
            end

            if not target then return end

            -- 计算移动向量
            local ping = Player:GetNetworkPing()
            local randomOffset = Vector3.new(
                RNG:NextNumber(-1.5, 1.5),
                0,
                RNG:NextNumber(-1.5, 1.5)
            )
            
            local requiredVelocity = (target.HumanoidRootPart.Position + randomOffset + 
                                    (target.HumanoidRootPart.Velocity * (ping * 1.25)) - 
                                    HumanoidRootPart.Position) / (ping * 2)

            -- 应用移动
            local originalVelocity = HumanoidRootPart.Velocity
            HumanoidRootPart.Velocity = requiredVelocity
            task.wait()
            HumanoidRootPart.Velocity = originalVelocity
        end)
    end
})



local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerName = player.Name
local hitbox = nil
local updateConnection = nil

local hitboxesFolder = Workspace:FindFirstChild("Hitboxes")
if not hitboxesFolder then
    hitboxesFolder = Instance.new("Folder")
    hitboxesFolder.Name = "Hitboxes"
    hitboxesFolder.Parent = Workspace
end

local function createHitbox()
    local part = Instance.new("Part")
    part.Name = playerName .. "_Hitbox"
    part.Size = Vector3.new(4, 7, 4)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 0.5
    part.Material = Enum.Material.ForceField
    part.Color = Color3.fromRGB(255, 255, 200)
    part.Parent = hitboxesFolder
    return part
end

local function updateHitbox()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") and hitbox then
        local root = character.HumanoidRootPart
        local offset = root.CFrame.LookVector * 4
        hitbox.CFrame = CFrame.new(root.Position + offset, root.Position + root.CFrame.LookVector)
    end
end

SM:AddToggle("打人", {
    Text = "显示碰撞箱",
    Default = false,
    Callback = function(state)
        if state then
       
            hitbox = createHitbox()
            updateConnection = RunService.RenderStepped:Connect(updateHitbox)
         
            player.CharacterAdded:Connect(function(char)
                task.wait(1)
                if hitbox then
                    hitbox:Destroy()
                end
                hitbox = createHitbox()
            end)
        else
            
            if updateConnection then
                updateConnection:Disconnect()
                updateConnection = nil
            end
            if hitbox then
                hitbox:Destroy()
                hitbox = nil
            end
        end
    end
})



local SM = Tabs.FightingKilling:AddLeftGroupbox('自调碰撞箱追踪')

SM:AddSlider("DistanceSlider", {
    Text = "距离范围",
    Tooltip = "调整自动攻击的最大距离",
    Default = 8,
    Min = 1,
    Max = 120,
    Rounding = 0,
    Compact = false,
    Callback = function(value)
        MaxDistance = value
    end
})

SM:AddToggle("InfiniteJumpToggle", {
    Text = "自调追踪",
    Default = false,
    Disabled = false,
    Visible = true,
    Risky = false,

    Callback = function(state)
        repeat task.wait() until game:IsLoaded();

        local Players = game:GetService('Players');
        local Player = Players.LocalPlayer;
        local PlayerGui = Player:WaitForChild("PlayerGui");
        local Character = Player.Character or Player.CharacterAdded:Wait();
        local Humanoid = Character:WaitForChild("Humanoid");
        local Animator = Humanoid:WaitForChild("Animator");
        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");

        Player.CharacterAdded:Connect(function(NewCharacter)
            Character = NewCharacter;
            Humanoid = Character:WaitForChild("Humanoid");
            Animator = Humanoid:WaitForChild("Animator");
            HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
        end);

local AttackAnimations = {
	'rbxassetid://131430497821198', --// MassInfection, 1x1x1x1
	'rbxassetid://83829782357897', --// Slash, 1x1x1x1
	'rbxassetid://126830014841198', --// Slash, Jason
	'rbxassetid://126355327951215', --// Behead, Jason
	'rbxassetid://121086746534252', --// GashingWoundStart, Jason
	'rbxassetid://105458270463374', --// Slash, JohnDoe
	'rbxassetid://127172483138092', --// CorruptEnergy, JohnDoe
	'rbxassetid://18885919947', --// CorruptNature, c00lkidd
	'rbxassetid://18885909645', --// Attack, c00lkidd
	'rbxassetid://87259391926321', --// ParryPunch, Guest1337
	'rbxassetid://106014898528300', --// Charge, Guest1337
	'rbxassetid://87259391926321', --// Punch, Guest1337
	'rbxassetid://86545133269813', --// Stab, TwoTime
	'rbxassetid://89448354637442', --// LungeStart, TwoTime
	'rbxassetid://90499469533503', --// GunFire, Chance
	'rbxassetid://116618003477002', --// Slash, Shedletsky
	'rbxassetid://106086955212611', --// Stab, TwoTime, Skin: PhilosopherTwotime
	'rbxassetid://107640065977686', --// LungeStart, TwoTime, Skin: PhilosopherTwotime
	'rbxassetid://77124578197357', --// GunFire, Chance, Skin: OutlawChance
	'rbxassetid://101771617803133', --// GunFire, Chance, Skin: #CassidyChance
	'rbxassetid://134958187822107', --// GunFire, Chance, Skin: RetroChance
	'rbxassetid://111313169447787', --// GunFire, Chance, Skin: MLGChance
	'rbxassetid://71685573690338', --// GunFire, Chance, Skin: Milestone100Chance
	'rbxassetid://71685573690338', --// GunFire, Chance, Skin: Milestone75Chance
	'rbxassetid://129843313690921', --// ParryPunch, Guest1337, Skin: #NerfedDemomanGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: #NerfedDemomanGuest
	'rbxassetid://129843313690921', --// Punch, Guest1337, Skin: #NerfedDemomanGuest
	'rbxassetid://136007065400978', --// ParryPunch, Guest1337, Skin: LittleBrotherGuest
	'rbxassetid://136007065400978', --// Punch, Guest1337, Skin: LittleBrotherGuest
	'rbxassetid://86096387000557', --// ParryPunch, Guest1337, Skin: Milestone100Guest
	'rbxassetid://86096387000557', --// ParryPunch, Guest1337, Skin: Milestone75Guest
	'rbxassetid://108807732150251', --// ParryPunch, Guest1337, Skin: GreenbeltGuest
	'rbxassetid://138040001965654', --// Punch, Guest1337, Skin: GreenbeltGuest
	'rbxassetid://73502073176819', --// Charge, Guest1337, Skin: GreenbeltGuest
	'rbxassetid://129843313690921', --// ParryPunch, Guest1337, Skin: #DemomanGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: #DemomanGuest
	'rbxassetid://129843313690921', --// Punch, Guest1337, Skin: #DemomanGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: GunnerGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: BobbyGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: !JuggernautGuest
	'rbxassetid://86709774283672', --// ParryPunch, Guest1337, Skin: SorcererGuest
	'rbxassetid://106014898528300', --// Charge, Guest1337, Skin: SorcererGuest
	'rbxassetid://87259391926321', --// Punch, Guest1337, Skin: SorcererGuest
	'rbxassetid://140703210927645', --// ParryPunch, Guest1337, Skin: DragonGuest
	'rbxassetid://96173857867228', --// Charge, Guest1337, Skin: AllyGuest
	'rbxassetid://121255898612475', --// Slash, Shedletsky, Skin: RetroShedletsky
	'rbxassetid://98031287364865', --// Slash, Shedletsky, Skin: BrightEyesShedletsky
	'rbxassetid://119462383658044', --// Slash, Shedletsky, Skin: NessShedletsky
	'rbxassetid://77448521277146', --// Slash, Shedletsky, Skin: Milestone100Shedletsky
	'rbxassetid://77448521277146', --// Slash, Shedletsky, Skin: Milestone75Shedletsky
	'rbxassetid://103741352379819', --// Slash, Shedletsky, Skin: #RolandShedletsky
	'rbxassetid://119462383658044', --// Slash, Shedletsky, Skin: HeartbrokenShedletsky
	'rbxassetid://131696603025265', --// Slash, Shedletsky, Skin: JamesSunderlandShedletsky
	'rbxassetid://122503338277352', --// Slash, Shedletsky, Skin: SkiesShedletsky
	'rbxassetid://97648548303678', --// Slash, Shedletsky, Skin: #JohnWardShedletsky
	'rbxassetid://94162446513587', --// Slash, JohnDoe, Skin: !Joner
	'rbxassetid://84426150435898', --// CorruptEnergy, JohnDoe, Skin: !Joner
	'rbxassetid://93069721274110', --// Slash, JohnDoe, Skin: AnnihilationJohnDoe
	'rbxassetid://114620047310688', --// CorruptEnergy, JohnDoe, Skin: AnnihilationJohnDoe
	'rbxassetid://97433060861952', --// Slash, JohnDoe, Skin: #SK
	'rbxassetid://82183356141401', --// CorruptEnergy, JohnDoe, Skin: #SK
	'rbxassetid://100592913030351', --// MassInfection, 1x1x1x1, Skin: Fleskhjerta1x1x1x1
	'rbxassetid://121293883585738', --// Slash, 1x1x1x1, Skin: Fleskhjerta1x1x1x1
	'rbxassetid://100592913030351', --// MassInfection, 1x1x1x1, Skin: AceOfSpades1x1x1x1
	'rbxassetid://121293883585738', --// Slash, 1x1x1x1, Skin: AceOfSpades1x1x1x1
	'rbxassetid://100592913030351', --// MassInfection, 1x1x1x1, Skin: Lancer1x1x1x1
	'rbxassetid://121293883585738', --// Slash, 1x1x1x1, Skin: Lancer1x1x1x1
	'rbxassetid://70447634862911', --// MassInfection, 1x1x1x1, Skin: Hacklord1x1x1x1
	'rbxassetid://92173139187970', --// Slash, 1x1x1x1, Skin: Hacklord1x1x1x1
	'rbxassetid://106847695270773', --// GashingWoundStart, Jason, Skin: Subject0Jason
	'rbxassetid://125403313786645', --// Slash, Jason, Skin: Subject0Jason
	'rbxassetid://81639435858902', --// Behead, Jason, Skin: WhitePumpkinJason
	'rbxassetid://137314737492715', --// GashingWoundStart, Jason, Skin: WhitePumpkinJason
	'rbxassetid://120112897026015', --// Slash, Jason, Skin: WhitePumpkinJason
	'rbxassetid://82113744478546', --// Behead, Jason, Skin: KillerKyleJason
	'rbxassetid://118298475669935', --// Slash, Jason, Skin: KillerKyleJason
	'rbxassetid://82113744478546', --// Behead, Jason, Skin: #SmartestJason
	'rbxassetid://118298475669935', --// Slash, Jason, Skin: #SmartestJason
	'rbxassetid://126681776859538', --// Behead, Jason, Skin: PursuerJason
	'rbxassetid://129976080405072', --// GashingWoundStart, Jason, Skin: PursuerJason
	'rbxassetid://109667959938617', --// Slash, Jason, Skin: PursuerJason
	'rbxassetid://74707328554358', --// Slash, Jason, Skin: #DeadRabbitsJason
	'rbxassetid://133336594357903', --// Behead, Jason, Skin: #DeadRabbitsJason
	'rbxassetid://86204001129974', --// GashingWoundStart, Jason, Skin: #DeadRabbitsJason
	'rbxassetid://82113744478546', --// Behead, Jason, Skin: RetroJason
	'rbxassetid://118298475669935', --// Slash, Jason, Skin: RetroJason
	'rbxassetid://124243639579224', --// CorruptNature, c00lkidd, Skin: MafiosoC00l
	'rbxassetid://70371667919898', --// Attack, c00lkidd, Skin: MafiosoC00l
	'rbxassetid://131543461321709', --// Attack, c00lkidd, Skin: SaviorC00l
	'rbxassetid://136323728355613', --// Swing, Noli
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Devesto
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Yourself
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: YAAI
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Toolbox
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: ASPX
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: RedRoomCurse
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Saggitial
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Quimera
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: 035
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Artful
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Robert
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Ephialtes
    'rbxassetid://109230267448394' --// Swing, Noli, Skin: Umbra
};


        local RNG = Random.new();
        game:GetService('RunService').Heartbeat:Connect(function()
            if not HumanoidRootPart then
                return;
            end

            local Playing = false;
            for _,v in Humanoid:GetPlayingAnimationTracks() do
                if table.find(AttackAnimations, v.Animation.AnimationId) and (v.TimePosition / v.Length < 0.75) then
                    Playing = true;
                end
            end

            if not Playing then
                return;
            end

            local Target;
            local NearestDist = MaxDistance; -- 使用滑块设置的距离

            local function loop(t)
                for _,v in t do
                    if v == Character or not v:FindFirstChild("HumanoidRootPart") then
                        continue;
                    end

                    local Dist = (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude;

                    if Dist < NearestDist then
                        NearestDist = Dist;
                        Target = v;
                    end
                end
            end

            loop(workspace.Players:GetDescendants());
            loop(workspace.Map:FindFirstChild("NPCs", true):GetChildren());

            if not Target then
                return;
            end

            local OldVelocity = HumanoidRootPart.Velocity;
            local NeededVelocity =
            (Target.HumanoidRootPart.Position + vector.create(
                RNG:NextNumber(-1.5, 1.5),
                0,
                RNG:NextNumber(-1.5, 1.5)
            ) + (Target.HumanoidRootPart.Velocity * (Player:GetNetworkPing() * 1.25))
                - HumanoidRootPart.Position
            ) / (Player:GetNetworkPing() * 2);

            HumanoidRootPart.Velocity = NeededVelocity;
            game:GetService('RunService').RenderStepped:Wait();
            HumanoidRootPart.Velocity = OldVelocity;
        end);
    end,
})



local SM = Tabs.FightingKilling:AddRightGroupbox('碰撞')

SM:AddToggle("InfiniteJumpToggle", {
    Text = "碰撞箱追踪 [100%]",
    Default = false,
    Disabled = false,
    Visible = true,
    Risky = false,

    Callback = function(state)
       repeat task.wait() until game:IsLoaded();

local Players = game:GetService('Players');
local Player = Players.LocalPlayer;
local PlayerGui = Player:WaitForChild("PlayerGui");
local Character = Player.Character or Player.CharacterAdded:Wait();
local Humanoid = Character:WaitForChild("Humanoid");
local Animator = Humanoid:WaitForChild("Animator");
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");

Player.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter;
    Humanoid = Character:WaitForChild("Humanoid");
    Animator = Humanoid:WaitForChild("Animator");
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
end);

local AttackAnimations = {
	'rbxassetid://131430497821198', --// MassInfection, 1x1x1x1
	'rbxassetid://83829782357897', --// Slash, 1x1x1x1
	'rbxassetid://126830014841198', --// Slash, Jason
	'rbxassetid://126355327951215', --// Behead, Jason
	'rbxassetid://121086746534252', --// GashingWoundStart, Jason
	'rbxassetid://105458270463374', --// Slash, JohnDoe
	'rbxassetid://127172483138092', --// CorruptEnergy, JohnDoe
	'rbxassetid://18885919947', --// CorruptNature, c00lkidd
	'rbxassetid://18885909645', --// Attack, c00lkidd
	'rbxassetid://87259391926321', --// ParryPunch, Guest1337
	'rbxassetid://106014898528300', --// Charge, Guest1337
	'rbxassetid://87259391926321', --// Punch, Guest1337
	'rbxassetid://86545133269813', --// Stab, TwoTime
	'rbxassetid://89448354637442', --// LungeStart, TwoTime
	'rbxassetid://90499469533503', --// GunFire, Chance
	'rbxassetid://116618003477002', --// Slash, Shedletsky
	'rbxassetid://106086955212611', --// Stab, TwoTime, Skin: PhilosopherTwotime
	'rbxassetid://107640065977686', --// LungeStart, TwoTime, Skin: PhilosopherTwotime
	'rbxassetid://77124578197357', --// GunFire, Chance, Skin: OutlawChance
	'rbxassetid://101771617803133', --// GunFire, Chance, Skin: #CassidyChance
	'rbxassetid://134958187822107', --// GunFire, Chance, Skin: RetroChance
	'rbxassetid://111313169447787', --// GunFire, Chance, Skin: MLGChance
	'rbxassetid://71685573690338', --// GunFire, Chance, Skin: Milestone100Chance
	'rbxassetid://71685573690338', --// GunFire, Chance, Skin: Milestone75Chance
	'rbxassetid://129843313690921', --// ParryPunch, Guest1337, Skin: #NerfedDemomanGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: #NerfedDemomanGuest
	'rbxassetid://129843313690921', --// Punch, Guest1337, Skin: #NerfedDemomanGuest
	'rbxassetid://136007065400978', --// ParryPunch, Guest1337, Skin: LittleBrotherGuest
	'rbxassetid://136007065400978', --// Punch, Guest1337, Skin: LittleBrotherGuest
	'rbxassetid://86096387000557', --// ParryPunch, Guest1337, Skin: Milestone100Guest
	'rbxassetid://86096387000557', --// ParryPunch, Guest1337, Skin: Milestone75Guest
	'rbxassetid://108807732150251', --// ParryPunch, Guest1337, Skin: GreenbeltGuest
	'rbxassetid://138040001965654', --// Punch, Guest1337, Skin: GreenbeltGuest
	'rbxassetid://73502073176819', --// Charge, Guest1337, Skin: GreenbeltGuest
	'rbxassetid://129843313690921', --// ParryPunch, Guest1337, Skin: #DemomanGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: #DemomanGuest
	'rbxassetid://129843313690921', --// Punch, Guest1337, Skin: #DemomanGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: GunnerGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: BobbyGuest
	'rbxassetid://97623143664485', --// Charge, Guest1337, Skin: !JuggernautGuest
	'rbxassetid://86709774283672', --// ParryPunch, Guest1337, Skin: SorcererGuest
	'rbxassetid://106014898528300', --// Charge, Guest1337, Skin: SorcererGuest
	'rbxassetid://87259391926321', --// Punch, Guest1337, Skin: SorcererGuest
	'rbxassetid://140703210927645', --// ParryPunch, Guest1337, Skin: DragonGuest
	'rbxassetid://96173857867228', --// Charge, Guest1337, Skin: AllyGuest
	'rbxassetid://121255898612475', --// Slash, Shedletsky, Skin: RetroShedletsky
	'rbxassetid://98031287364865', --// Slash, Shedletsky, Skin: BrightEyesShedletsky
	'rbxassetid://119462383658044', --// Slash, Shedletsky, Skin: NessShedletsky
	'rbxassetid://77448521277146', --// Slash, Shedletsky, Skin: Milestone100Shedletsky
	'rbxassetid://77448521277146', --// Slash, Shedletsky, Skin: Milestone75Shedletsky
	'rbxassetid://103741352379819', --// Slash, Shedletsky, Skin: #RolandShedletsky
	'rbxassetid://119462383658044', --// Slash, Shedletsky, Skin: HeartbrokenShedletsky
	'rbxassetid://131696603025265', --// Slash, Shedletsky, Skin: JamesSunderlandShedletsky
	'rbxassetid://122503338277352', --// Slash, Shedletsky, Skin: SkiesShedletsky
	'rbxassetid://97648548303678', --// Slash, Shedletsky, Skin: #JohnWardShedletsky
	'rbxassetid://94162446513587', --// Slash, JohnDoe, Skin: !Joner
	'rbxassetid://84426150435898', --// CorruptEnergy, JohnDoe, Skin: !Joner
	'rbxassetid://93069721274110', --// Slash, JohnDoe, Skin: AnnihilationJohnDoe
	'rbxassetid://114620047310688', --// CorruptEnergy, JohnDoe, Skin: AnnihilationJohnDoe
	'rbxassetid://97433060861952', --// Slash, JohnDoe, Skin: #SK
	'rbxassetid://82183356141401', --// CorruptEnergy, JohnDoe, Skin: #SK
	'rbxassetid://100592913030351', --// MassInfection, 1x1x1x1, Skin: Fleskhjerta1x1x1x1
	'rbxassetid://121293883585738', --// Slash, 1x1x1x1, Skin: Fleskhjerta1x1x1x1
	'rbxassetid://100592913030351', --// MassInfection, 1x1x1x1, Skin: AceOfSpades1x1x1x1
	'rbxassetid://121293883585738', --// Slash, 1x1x1x1, Skin: AceOfSpades1x1x1x1
	'rbxassetid://100592913030351', --// MassInfection, 1x1x1x1, Skin: Lancer1x1x1x1
	'rbxassetid://121293883585738', --// Slash, 1x1x1x1, Skin: Lancer1x1x1x1
	'rbxassetid://70447634862911', --// MassInfection, 1x1x1x1, Skin: Hacklord1x1x1x1
	'rbxassetid://92173139187970', --// Slash, 1x1x1x1, Skin: Hacklord1x1x1x1
	'rbxassetid://106847695270773', --// GashingWoundStart, Jason, Skin: Subject0Jason
	'rbxassetid://125403313786645', --// Slash, Jason, Skin: Subject0Jason
	'rbxassetid://81639435858902', --// Behead, Jason, Skin: WhitePumpkinJason
	'rbxassetid://137314737492715', --// GashingWoundStart, Jason, Skin: WhitePumpkinJason
	'rbxassetid://120112897026015', --// Slash, Jason, Skin: WhitePumpkinJason
	'rbxassetid://82113744478546', --// Behead, Jason, Skin: KillerKyleJason
	'rbxassetid://118298475669935', --// Slash, Jason, Skin: KillerKyleJason
	'rbxassetid://82113744478546', --// Behead, Jason, Skin: #SmartestJason
	'rbxassetid://118298475669935', --// Slash, Jason, Skin: #SmartestJason
	'rbxassetid://126681776859538', --// Behead, Jason, Skin: PursuerJason
	'rbxassetid://129976080405072', --// GashingWoundStart, Jason, Skin: PursuerJason
	'rbxassetid://109667959938617', --// Slash, Jason, Skin: PursuerJason
	'rbxassetid://74707328554358', --// Slash, Jason, Skin: #DeadRabbitsJason
	'rbxassetid://133336594357903', --// Behead, Jason, Skin: #DeadRabbitsJason
	'rbxassetid://86204001129974', --// GashingWoundStart, Jason, Skin: #DeadRabbitsJason
	'rbxassetid://82113744478546', --// Behead, Jason, Skin: RetroJason
	'rbxassetid://118298475669935', --// Slash, Jason, Skin: RetroJason
	'rbxassetid://124243639579224', --// CorruptNature, c00lkidd, Skin: MafiosoC00l
	'rbxassetid://70371667919898', --// Attack, c00lkidd, Skin: MafiosoC00l
	'rbxassetid://131543461321709', --// Attack, c00lkidd, Skin: SaviorC00l
	'rbxassetid://136323728355613', --// Swing, Noli
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Devesto
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Yourself
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: YAAI
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Toolbox
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: ASPX
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: RedRoomCurse
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Saggitial
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Quimera
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: 035
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Artful
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Robert
    'rbxassetid://109230267448394', --// Swing, Noli, Skin: Ephialtes
    'rbxassetid://109230267448394' --// Swing, Noli, Skin: Umbra
};

local RNG = Random.new();
game:GetService('RunService').Heartbeat:Connect(function()
    if not HumanoidRootPart then
        return;
    end

    local Playing = false;
    for _,v in Humanoid:GetPlayingAnimationTracks() do
        if table.find(AttackAnimations, v.Animation.AnimationId) and (v.TimePosition / v.Length < 0.75) then
            Playing = true;
        end
    end

    if not Playing then
        return;
    end

    local Target;
    local NearestDist = 12;

    local function loop(t)
        for _,v in t do
            if v == Character or not v:FindFirstChild("HumanoidRootPart") then
                continue;
            end

            local Dist = (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude;

            if Dist < NearestDist then
                NearestDist = Dist;
                Target = v;
            end
        end
    end

    loop(workspace.Players:GetDescendants());
    loop(workspace.Map:FindFirstChild("NPCs", true):GetChildren());

    if not Target then
        return;
    end

    local OldVelocity = HumanoidRootPart.Velocity;
    local NeededVelocity =
    (Target.HumanoidRootPart.Position + vector.create(
        RNG:NextNumber(-1.5, 1.5),
        0,
        RNG:NextNumber(-1.5, 1.5)
    ) + (Target.HumanoidRootPart.Velocity * (Player:GetNetworkPing() * 1.25))
        - HumanoidRootPart.Position
    ) / (Player:GetNetworkPing() * 2);

    HumanoidRootPart.Velocity = NeededVelocity;
    game:GetService('RunService').RenderStepped:Wait();
    HumanoidRootPart.Velocity = OldVelocity;
end); 
    end,
})

SM:AddDivider()

SM:AddSlider("HitboxSizeMultiplierSlider", {
    Text = "碰撞体积倍数",
    Min = 0.1,
    Max = 5,
    Default = 1.0,
    Rounding = 1,
    Compact = false,
    Tooltip = "修改玩家碰撞体积大小(1.0为正常大小)",
    Callback = function(value)
        HitboxSizeMultiplier = value
        -- 如果功能已启用，立即应用新倍数
        if HitboxSizeEnabled and LocalPlayer.Character then
            local character = LocalPlayer.Character
            if _G.OriginalSizes and _G.OriginalSizes[character] then
                for part, originalSize in pairs(_G.OriginalSizes[character]) do
                    if part and part.Parent then
                        part.Size = originalSize * HitboxSizeMultiplier
                    end
                end
            end
        end
    end
})

SM:AddToggle("HitboxSize", {
    Text = "修改碰撞体积",
    Tooltip = "调整玩家碰撞体积大小（影响被击中判定）",
    Default = false,
    Callback = function(state)
        HitboxSizeEnabled = state
        if state then
            local function ApplyHitboxSize(character)
                if not character then return end
                
                -- 存储原始尺寸
                if not _G.OriginalSizes then
                    _G.OriginalSizes = {}
                end
                if not _G.OriginalSizes[character] then
                    _G.OriginalSizes[character] = {}
                end
                
                -- 遍历所有BasePart并应用尺寸
                for _, part in pairs(character:GetDescendants()) do
                    if typeof(part) == "Instance" and part:IsA("BasePart") then
                        -- 存储原始尺寸（如果还没有）
                        if not _G.OriginalSizes[character][part] then
                            _G.OriginalSizes[character][part] = part.Size
                        end
                        
                        -- 应用新尺寸
                        local originalSize = _G.OriginalSizes[character][part]
                        if originalSize then
                            part.Size = originalSize * HitboxSizeMultiplier
                        end
                    end
                end
            end
            
            -- 实时更新功能：当倍数改变时重新应用
            if not _G.HitboxSizeUpdateConnection then
                _G.HitboxSizeUpdateConnection = RunService.Heartbeat:Connect(function()
                    if HitboxSizeEnabled and LocalPlayer.Character then
                        local character = LocalPlayer.Character
                        if _G.OriginalSizes and _G.OriginalSizes[character] then
                            for part, originalSize in pairs(_G.OriginalSizes[character]) do
                                if part and part.Parent then
                                    part.Size = originalSize * HitboxSizeMultiplier
                                end
                            end
                        end
                    end
                end)
            end
            
            -- 为当前角色应用
            if LocalPlayer.Character then
                ApplyHitboxSize(LocalPlayer.Character)
            end
            
            -- 监听角色重生
            if HitboxSizeConnection then
                HitboxSizeConnection:Disconnect()
            end
            
            HitboxSizeConnection = LocalPlayer.CharacterAdded:Connect(function(character)
                task.wait(0.5) -- 等待角色完全加载
                ApplyHitboxSize(character)
            end)
            
        else
            if HitboxSizeConnection then
                HitboxSizeConnection:Disconnect()
                HitboxSizeConnection = nil
            end
            
            -- 恢复原始尺寸
            if LocalPlayer.Character then
                local character = LocalPlayer.Character
                if _G.OriginalSizes and _G.OriginalSizes[character] then
                    for part, originalSize in pairs(_G.OriginalSizes[character]) do
                        if part and part.Parent then
                            part.Size = originalSize
                        end
                    end
                end
            end
            
            -- 断开更新连接
            if _G.HitboxSizeUpdateConnection then
                _G.HitboxSizeUpdateConnection:Disconnect()
                _G.HitboxSizeUpdateConnection = nil
            end
            
        end
    end
})















local SM = Tabs.FightingKilling:AddRightGroupbox('暴力')

local function getASurvivor(dist)
    local char = localPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, s in ipairs(workspace.Players.Survivors:GetChildren()) do
        local h = s:FindFirstChild("HumanoidRootPart")
        if h then
            local d = (hrp.Position - h.Position).Magnitude
            if d < dist then
                return s
            end
        end
    end
end

function getClosestSurvivor()
    local closest, dist = nil, math.huge
    local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil, nil end
    for _, s in pairs(workspace.Players.Survivors:GetChildren()) do
        local hrp2 = s:FindFirstChild("HumanoidRootPart")
        if hrp2 then
            local d = (hrp.Position - hrp2.Position).Magnitude
            if d < dist then
                closest = s
                dist = d
            end
        end
    end
    return closest, dist
end

SM:AddToggle("SlashAura", { 
    Text = "攻击光环",
    Default = false,
    Callback = function()
        task.spawn(function()
            while Toggles.SlashAura.Value do
                local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    if isKiller then
                        local yh = getASurvivor(Options.SlashAuraRange.Value)
                        if yh then
                            killerAttack()
                        end
                    else
                        if killerModel and killerModel:FindFirstChild("HumanoidRootPart") then
                            local dist = (hrp.Position - killerModel.HumanoidRootPart.Position).magnitude
                            if dist <= Options.SlashAuraRange.Value then
                                killerAttack()
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

SM:AddSlider("SlashAuraRange", {
    Text = "攻击光环范围",
    Default = 7,
    Min = 4,
    Max = 11,
    Rounding = 0,
})

local function assist(target, dist)
    if target and dist <= 25 then
        local pos = localPlayer.Character.HumanoidRootPart.Position
        local targetPos = target.HumanoidRootPart.Position

        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(pos.X, pos.Y, pos.Z), Vector3.new(targetPos.X, pos.Y, targetPos.Z))
    end
end

SM:AddDivider()

SM:AddLabel("<b><font color=\"rgb(255, 0, 0)\">[注意]</font></b> 每25秒传送幸存者并攻击")

SM:AddToggle('KillAll', {
    Text = "自动攻击所有玩家",
    Callback = function(s)
        if s and playingState == "Spectating" then
            return Notify("LightStar-提示", "必须在一轮 窥视时无法使用此功能", 7)
        end
        if s and isSurvivor then
            return Notify("LightStar-提示", "要使用此功能 您必须是杀手", 7)
        end
        if not Toggles.KillAll.Value then return end
        if localPlayer:GetNetworkPing() >= 0.3 then
            Toggles.KillAll:SetValue(false)
            return game.StarterGui:SetCore("SendNotification", { Title = "LightStar-提示", Text = "杀死所有停止 因为你的ping太高了 尝试获得更好的WiFi并再试一次", Duration = 9 })
         end
        if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then Toggles.KillAll:SetValue(false) return end
        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
            if not (workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap:FindFirstChild("Ingame"):FindFirstChild("Map")) then
                Toggles.KillAll:SetValue(false)
                return
            end
            if playingState == "Spectating" then
                Toggles.KillAll:SetValue(false)
                return
            end
            local name = v:GetAttribute("Username")
            local plr = game.Players:FindFirstChild(name)
            if plr then
                local skipTimeout = tick()
                while tick() - skipTimeout <= 25 do
                    if localPlayer:GetNetworkPing() >= 0.3 then
                        Toggles.KillAll:SetValue(false)
                        return game.StarterGui:SetCore("SendNotification", { Title = "LightStar-提示", Text = "杀死所有停止 因为你的ping太高了 尝试获得更好的WiFi并再试一次", Duration = 9 })
                    end
                    if game.Players:FindFirstChild(name) == nil then
                        break 
                    end
                    if plr.Character == nil then
                        break
                    end
                    if plr.Character:FindFirstChild("Humanoid") == nil then
                        break
                    end
                    if plr.Character.Humanoid.Health <= 0 then
                        break
                    end
                    if not Toggles.KillAll.Value then
                        return
                    end
                    enableNoclip()
                    localPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                    localPlayer.Character.HumanoidRootPart.Velocity = Vector3.zero
                    killerAttack()
                    task.wait()
                end
            end
        end
    end
})














local Generator = Tabs.Generator:AddLeftGroupbox("修机")

Generator:AddDropdown('FixMode', {
    Values = {'危险模式', '安全模式', '自调模式'},
    Default = 2,
    Multi = false,
    Text = '修机模式',
    Searchable = false,
    Callback = function(v)
        _G.FixMode = v
        if v == "危险模式" then
            Generator:SetValue("RepairSpeed", 3)
        elseif v == "安全模式" then
            Generator:SetValue("RepairSpeed", 5)
        end
    end
})

Generator:AddSlider("RepairSpeed", {
    Text = "修机速度",
    Default = 4,
    Min = 1,
    Max = 5,
    Rounding = 1,
    Compact = false,
    Callback = function(v)
        _G.CustomSpeed = v
    end
})

Generator:AddToggle("AutoGenerator",{
    Text = "自动修复发电机",
    Default = false,
    Callback = function(v)
        _G.AutoGen = v
        task.spawn(function()
            while _G.AutoGen do
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                    local delayTime = _G.CustomSpeed or 3
                    
                    if _G.FixMode == "危险模式" then
                        delayTime = 2.5
                    elseif _G.FixMode == "安全模式" then
                        delayTime = 5
                    end
                    
                    wait(delayTime)
                    
                    for _,v in ipairs(workspace["Map"]["Ingame"]["Map"]:GetChildren()) do
                        if v.Name == "Generator" then
                            v["Remotes"]["RE"]:FireServer()
                        end
                    end
                end
                wait()
            end
        end)
    end
}):AddKeyPicker("AimKeyPicker", {
    Text = "自动修复发动机",
    Default = "V",
    Mode = "Toggle",
    SyncToggleState = true,
})

Generator:AddDivider()

Generator:AddToggle("AutoStartGenerator", {
    Text = "自动互动发动机",
    Default = false,
    Callback = function(bool)
        _G.autoGen = bool
        task.spawn(function()
            while _G.autoGen and task.wait() do
                if gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                    pcall(function()
                        for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                            if v.Name == "Generator" then
                                pcall(function()
                                    local function nextStep()
                                        if localPlayer.PlayerGui:FindFirstChild("PuzzleUI") then return end
                                        if activelyAutoing then return end

                                        if v.Main:FindFirstChild("Prompt") then
                                            fireproximityprompt(v.Main.Prompt)
                                        end
                                        task.wait(1)
                                    end

                                    local hello = v.Positions.Center.Position
                                    local hello2 = v.Positions.Right.Position
                                    local hello3 = v.Positions.Left.Position

                                    if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

                                    local pos = localPlayer.Character.HumanoidRootPart.Position
                                    if (pos - hello).Magnitude <= 4 then
                                        nextStep()
                                    elseif (pos - hello2).Magnitude <= 4 then
                                        nextStep()
                                    elseif (pos - hello3).Magnitude <= 4 then
                                        nextStep()
                                    end
                                end)
                            end
                        end
                    end)
                end
            end
        end)
    end
})









    

local TelephoneGenerator = Tabs.Generator:AddRightGroupbox('传送')

for a = 1, 5 do
TelephoneGenerator:AddButton({
        Text = "传送发动机 " .. a,
        Func = function ()
            if playingState == "Spectating" then
                return Notify("LightStar-提示", "必须在一轮 窥视时无法使用此功能", 7)
            end

            pcall(function ()
                if not (gameMap and gameMap.Ingame and gameMap.Ingame.Map) then return end
                local gens = {}

                for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                    if v.Name == "Generator" then
                        table.insert(gens, v)
                    end
                end

                if gens[a] and gens[a]:FindFirstChild("Positions") and gens[a].Positions:FindFirstChild("Center") then
                    localPlayer.Character.HumanoidRootPart.CFrame = gens[a].Positions.Center.CFrame + Vector3.new(0, 10, 0)
                end
            end)
        end
})
end



























local MenuGroup = Tabs["UI Settings"]:AddRightGroupbox("调试", "wrench")

MenuGroup:AddButton("Watermark", {
    Text = "显示水印",
    Func = function()
local DPIMenu = Library
Library.SetDPIScale(DPIMenu, 100)
local Watermark = Library
Library.SetWatermarkVisibility(Watermark, true)
local _ = Players.LocalPlayer
local _ = Workspace.CurrentCamera
local Startick = tick()
local Ping = 0
local Fps = 60
local Stats = game:GetService("Stats")
RunService.RenderStepped:Connect(function()
    Ping = Ping + 1
    if tick() - Startick >= 1 then
        Fps = Ping
        Startick = tick()
        Ping = 0
    end
    Library:SetWatermark(("LightStar User ♎ %s Fps | %s Ping"):format(math.floor(Fps), math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())))
end)
    end
})

MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,
    Text = "键盘菜单",
    Callback = function(value)
        Library.KeybindFrame.Visible = value
    end,
})

MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "自定义光标",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})

MenuGroup:AddDropdown("NotificationSide", {
    Values = { "Left", "Right" },
    Default = "Right",
    Text = "通知位置",
    Callback = function(Value)
        Library:SetNotifySide(Value)
    end,
})

MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "25%", "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",
    Text = "DPI菜单大小",
    Callback = function(Value)
        Value = Value:gsub("%%", "")
        local DPI = tonumber(Value)
        Library:SetDPIScale(DPI)
    end,
})

MenuGroup:AddDivider()  
MenuGroup:AddLabel("菜单打开")  
    :AddKeyPicker("MenuKeybind", { 
        Default = "RightShift",  
        NoUI = true,            
        Text = "Menu keyboard"    
})

MenuGroup:AddButton("摧毁界面", function()
    Library:Unload()  
end)

ThemeManager:SetLibrary(Library)  
SaveManager:SetLibrary(Library)   
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })  
ThemeManager:SetFolder("LightStar-Forsaken")            
SaveManager:SetFolder("LightStar-Forsaken/Config")  
SaveManager:SetSubFolder("Config")       
SaveManager:BuildConfigSection(Tabs["UI Settings"])  
ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()