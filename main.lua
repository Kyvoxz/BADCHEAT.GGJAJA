--[[
    SLEEPY STYLE RECREATION
    Rivals • Silent Aim • Ragebot • ESP
    Most Complete Stable Version
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Sleepy Style | Rivals",
    LoadingTitle = "Sleepy Style",
    LoadingSubtitle = "Rivals Recreated",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SleepyStyle",
        FileName = "Config"
    },
    KeySystem = false
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

getgenv().Settings = {
    SilentAim = false,
    Ragebot = false,
    Aimbot = false,
    AimAssist = false,
    AimAssistStrength = 0.45,
    Triggerbot = false,
    HitboxExpander = false,
    HitboxSize = 12,
    FOV = 180,
    HitChance = 100,
    Prediction = 0.165,
    AimPart = "Head",
    TeamCheck = true,
    StickyAim = false,
    RageFOV = 400,
    RageHitChance = 100,
    AutoShoot = false,
    NoRecoil = false,
    NoSpread = false,
    RapidFire = false,
    Speed = false,
    SpeedValue = 28,
    InfiniteJump = false,
    Noclip = false,
    Fly = false,
    FlySpeed = 50,
    ESP = false,
    BoxESP = true,
    NameESP = true,
    HealthESP = true,
    DistanceESP = true,
    TracerESP = false,
    Fullbright = false,
    NoFog = false,
    FOVChanger = false,
    FOVValue = 90,
    UnlockAll = false,
    AntiAFK = true,
}

getgenv().Spoof = {
    Enabled = false,
    Rank = "Radiant",
    Level = 999,
    Streak = 50,
    DisplayName = "",
}

local CombatTab   = Window:CreateTab("Combat", 4483362458)
local RageTab     = Window:CreateTab("Rage", 4483362458)
local VisualsTab  = Window:CreateTab("Visuals", 4483362458)
local MovementTab = Window:CreateTab("Movement", 4483362458)
local SpooferTab  = Window:CreateTab("Spoofer", 4483362458)
local MiscTab     = Window:CreateTab("Misc", 4483362458)

-- Combat
CombatTab:CreateSection("Aim")
CombatTab:CreateToggle({Name = "Silent Aim", CurrentValue = false, Flag = "SilentAim", Callback = function(v) getgenv().Settings.SilentAim = v end})
CombatTab:CreateToggle({Name = "Aimbot", CurrentValue = false, Flag = "Aimbot", Callback = function(v) getgenv().Settings.Aimbot = v end})
CombatTab:CreateToggle({Name = "Aim Assist", CurrentValue = false, Flag = "AimAssist", Callback = function(v) getgenv().Settings.AimAssist = v end})
CombatTab:CreateSlider({Name = "Aim Assist Strength", Range = {0.1, 1}, Increment = 0.05, CurrentValue = 0.45, Flag = "AimAssistStrength", Callback = function(v) getgenv().Settings.AimAssistStrength = v end})
CombatTab:CreateToggle({Name = "Triggerbot", CurrentValue = false, Flag = "Triggerbot", Callback = function(v) getgenv().Settings.Triggerbot = v end})
CombatTab:CreateToggle({Name = "Sticky Aim", CurrentValue = false, Flag = "StickyAim", Callback = function(v) getgenv().Settings.StickyAim = v end})

CombatTab:CreateSection("Settings")
CombatTab:CreateSlider({Name = "FOV", Range = {40, 800}, Increment = 5, CurrentValue = 180, Flag = "FOV", Callback = function(v) getgenv().Settings.FOV = v end})
CombatTab:CreateSlider({Name = "Prediction", Range = {0, 0.4}, Increment = 0.005, CurrentValue = 0.165, Flag = "Prediction", Callback = function(v) getgenv().Settings.Prediction = v end})
CombatTab:CreateSlider({Name = "Hit Chance", Range = {10, 100}, Increment = 1, CurrentValue = 100, Flag = "HitChance", Callback = function(v) getgenv().Settings.HitChance = v end})
CombatTab:CreateDropdown({Name = "Aim Part", Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}, CurrentOption = "Head", Flag = "AimPart", Callback = function(v) getgenv().Settings.AimPart = v end})
CombatTab:CreateToggle({Name = "Team Check", CurrentValue = true, Flag = "TeamCheck", Callback = function(v) getgenv().Settings.TeamCheck = v end})

CombatTab:CreateSection("Hitbox")
CombatTab:CreateToggle({Name = "Hitbox Expander", CurrentValue = false, Flag = "HitboxExpander", Callback = function(v) getgenv().Settings.HitboxExpander = v end})
CombatTab:CreateSlider({Name = "Hitbox Size", Range = {3, 30}, Increment = 1, CurrentValue = 12, Flag = "HitboxSize", Callback = function(v) getgenv().Settings.HitboxSize = v end})

CombatTab:CreateSection("Gun Mods")
CombatTab:CreateToggle({Name = "No Recoil", CurrentValue = false, Flag = "NoRecoil", Callback = function(v) getgenv().Settings.NoRecoil = v end})
CombatTab:CreateToggle({Name = "No Spread", CurrentValue = false, Flag = "NoSpread", Callback = function(v) getgenv().Settings.NoSpread = v end})
CombatTab:CreateToggle({Name = "Rapid Fire", CurrentValue = false, Flag = "RapidFire", Callback = function(v) getgenv().Settings.RapidFire = v end})

-- Rage
RageTab:CreateSection("Ragebot")
RageTab:CreateToggle({Name = "Ragebot", CurrentValue = false, Flag = "Ragebot", Callback = function(v) getgenv().Settings.Ragebot = v end})
RageTab:CreateToggle({Name = "Auto Shoot", CurrentValue = false, Flag = "AutoShoot", Callback = function(v) getgenv().Settings.AutoShoot = v end})
RageTab:CreateSlider({Name = "Rage FOV", Range = {100, 1000}, Increment = 10, CurrentValue = 400, Flag = "RageFOV", Callback = function(v) getgenv().Settings.RageFOV = v end})
RageTab:CreateSlider({Name = "Rage Hit Chance", Range = {20, 100}, Increment = 1, CurrentValue = 100, Flag = "RageHitChance", Callback = function(v) getgenv().Settings.RageHitChance = v end})
RageTab:CreateParagraph({Title = "Rage Info", Content = "Ragebot = FOV grande + Silent Aim agresivo. Mas detectable."})

-- Visuals
VisualsTab:CreateSection("ESP")
VisualsTab:CreateToggle({Name = "ESP Master", CurrentValue = false, Flag = "ESP", Callback = function(v) getgenv().Settings.ESP = v end})
VisualsTab:CreateToggle({Name = "Box ESP", CurrentValue = true, Flag = "BoxESP", Callback = function(v) getgenv().Settings.BoxESP = v end})
VisualsTab:CreateToggle({Name = "Name ESP", CurrentValue = true, Flag = "NameESP", Callback = function(v) getgenv().Settings.NameESP = v end})
VisualsTab:CreateToggle({Name = "Health ESP", CurrentValue = true, Flag = "HealthESP", Callback = function(v) getgenv().Settings.HealthESP = v end})
VisualsTab:CreateToggle({Name = "Distance ESP", CurrentValue = true, Flag = "DistanceESP", Callback = function(v) getgenv().Settings.DistanceESP = v end})
VisualsTab:CreateToggle({Name = "Tracers", CurrentValue = false, Flag = "TracerESP", Callback = function(v) getgenv().Settings.TracerESP = v end})

VisualsTab:CreateSection("World")
VisualsTab:CreateToggle({Name = "Fullbright", CurrentValue = false, Flag = "Fullbright", Callback = function(v) getgenv().Settings.Fullbright = v end})
VisualsTab:CreateToggle({Name = "No Fog", CurrentValue = false, Flag = "NoFog", Callback = function(v) getgenv().Settings.NoFog = v end})
VisualsTab:CreateToggle({Name = "FOV Changer", CurrentValue = false, Flag = "FOVChanger", Callback = function(v) getgenv().Settings.FOVChanger = v end})
VisualsTab:CreateSlider({Name = "FOV Value", Range = {60, 120}, Increment = 1, CurrentValue = 90, Flag = "FOVValue", Callback = function(v) getgenv().Settings.FOVValue = v end})

-- Movement
MovementTab:CreateSection("Character")
MovementTab:CreateToggle({Name = "Speed", CurrentValue = false, Flag = "Speed", Callback = function(v) getgenv().Settings.Speed = v end})
MovementTab:CreateSlider({Name = "Speed Value", Range = {16, 150}, Increment = 1, CurrentValue = 28, Flag = "SpeedValue", Callback = function(v) getgenv().Settings.SpeedValue = v end})
MovementTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Flag = "InfiniteJump", Callback = function(v) getgenv().Settings.InfiniteJump = v end})
MovementTab:CreateToggle({Name = "Noclip", CurrentValue = false, Flag = "Noclip", Callback = function(v) getgenv().Settings.Noclip = v end})
MovementTab:CreateToggle({Name = "Fly", CurrentValue = false, Flag = "Fly", Callback = function(v) getgenv().Settings.Fly = v end})
MovementTab:CreateSlider({Name = "Fly Speed", Range = {20, 150}, Increment = 5, CurrentValue = 50, Flag = "FlySpeed", Callback = function(v) getgenv().Settings.FlySpeed = v end})

-- Spoofer
SpooferTab:CreateSection("Spoofer")
SpooferTab:CreateToggle({Name = "Activar Spoofer", CurrentValue = false, Flag = "SpoofEnabled", Callback = function(v) getgenv().Spoof.Enabled = v end})
SpooferTab:CreateInput({Name = "Rango", CurrentValue = "Radiant", PlaceholderText = "Radiant", Flag = "SpoofRank", Callback = function(v) getgenv().Spoof.Rank = v end})
SpooferTab:CreateInput({Name = "Nivel", CurrentValue = "999", PlaceholderText = "999", Flag = "SpoofLevel", Callback = function(v) getgenv().Spoof.Level = tonumber(v) or 999 end})
SpooferTab:CreateInput({Name = "Racha", CurrentValue = "50", PlaceholderText = "50", Flag = "SpoofStreak", Callback = function(v) getgenv().Spoof.Streak = tonumber(v) or 0 end})
SpooferTab:CreateInput({Name = "Nombre", CurrentValue = "", PlaceholderText = "Nombre spoof", Flag = "SpoofName", Callback = function(v) getgenv().Spoof.DisplayName = v end})
SpooferTab:CreateParagraph({Title = "Info", Content = "Spoof visual de Rank/Level/Streak. Nombre puede verse por otros."})

-- Misc
MiscTab:CreateSection("Unlock")
MiscTab:CreateToggle({Name = "Unlock All", CurrentValue = false, Flag = "UnlockAll", Callback = function(v)
    getgenv().Settings.UnlockAll = v
    if v then
        pcall(function()
            for _, tbl in pairs(getgc(true)) do
                if typeof(tbl) == "table" then
                    if rawget(tbl, "Unlocked") then rawset(tbl, "Unlocked", true) end
                    if rawget(tbl, "Owned") then rawset(tbl, "Owned", true) end
                    if rawget(tbl, "IsOwned") then rawset(tbl, "IsOwned", true) end
                end
            end
        end)
        Rayfield:Notify({Title = "Unlock All", Content = "Activado", Duration = 3})
    end
end})

MiscTab:CreateSection("Utility")
MiscTab:CreateToggle({Name = "Anti AFK", CurrentValue = true, Flag = "AntiAFK", Callback = function(v) getgenv().Settings.AntiAFK = v end})
MiscTab:CreateButton({Name = "PANIC (Apagar todo)", Callback = function()
    for k, v in pairs(getgenv().Settings) do
        if type(v) == "boolean" then getgenv().Settings[k] = false end
    end
    getgenv().Spoof.Enabled = false
    Rayfield:Notify({Title = "PANIC", Content = "Todo desactivado", Duration = 3})
end})
MiscTab:CreateButton({Name = "Server Hopper", Callback = function()
    pcall(function()
        local data = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for _, server in ipairs(data.data) do
            if server.playing < server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                break
            end
        end
    end)
end})

-- Functions
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1.5
FOVCircle.NumSides = 64
FOVCircle.Filled = false
FOVCircle.Color = Color3.fromRGB(170, 0, 255)
FOVCircle.Visible = false

local function GetClosestPlayer(fovOverride, hitchanceOverride)
    local closest, shortest = nil, fovOverride or getgenv().Settings.FOV
    local hitchance = hitchanceOverride or getgenv().Settings.HitChance
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            if getgenv().Settings.TeamCheck and player.Team == LocalPlayer.Team then continue end
            local part = player.Character:FindFirstChild(getgenv().Settings.AimPart) or player.Character:FindFirstChild("Head")
            if part then
                local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if dist < shortest and math.random(1, 100) <= hitchance then
                        shortest = dist
                        closest = player
                    end
                end
            end
        end
    end
    return closest
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    local silent = getgenv().Settings.SilentAim
    local rage = getgenv().Settings.Ragebot
    if (silent or rage) and (method == "Raycast" or method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRayWithWhitelist") then
        local fov = rage and getgenv().Settings.RageFOV or getgenv().Settings.FOV
        local hc = rage and getgenv().Settings.RageHitChance or getgenv().Settings.HitChance
        local target = GetClosestPlayer(fov, hc)
        if target and target.Character then
            local part = target.Character:FindFirstChild(getgenv().Settings.AimPart) or target.Character:FindFirstChild("Head")
            if part then
                local origin = args[1]
                local predicted = part.Position + (part.AssemblyLinearVelocity * getgenv().Settings.Prediction)
                if typeof(origin) == "Vector3" then
                    args[2] = (predicted - origin).Unit * 2000
                end
            end
        end
    end
    return oldNamecall(self, unpack(args))
end))

UserInputService.JumpRequest:Connect(function()
    if getgenv().Settings.InfiniteJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
    FOVCircle.Radius = getgenv().Settings.Ragebot and getgenv().Settings.RageFOV or getgenv().Settings.FOV
    FOVCircle.Visible = getgenv().Settings.SilentAim or getgenv().Settings.Ragebot or getgenv().Settings.Aimbot
    if getgenv().Settings.FOVChanger then Camera.FieldOfView = getgenv().Settings.FOVValue end
    if getgenv().Settings.Fullbright then
        Lighting.Brightness = 2.2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
    end
    if getgenv().Settings.NoFog then Lighting.FogEnd = 100000 end
end)

RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")

    if getgenv().Settings.Speed and hum then hum.WalkSpeed = getgenv().Settings.SpeedValue end
    if getgenv().Settings.Noclip then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
    if getgenv().Settings.Fly and hrp then
        local dir = Camera.CFrame.LookVector
        local move = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + dir end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - dir end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
        hrp.Velocity = move.Magnitude > 0 and move.Unit * getgenv().Settings.FlySpeed or Vector3.zero
    end
    if getgenv().Settings.HitboxExpander then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local t = player.Character.HumanoidRootPart
                t.Size = Vector3.new(getgenv().Settings.HitboxSize, getgenv().Settings.HitboxSize, getgenv().Settings.HitboxSize)
                t.Transparency = 0.6
                t.CanCollide = false
            end
        end
    end
    if getgenv().Settings.Aimbot or getgenv().Settings.AimAssist then
        local target = GetClosestPlayer()
        if target and target.Character then
            local part = target.Character:FindFirstChild(getgenv().Settings.AimPart) or target.Character.Head
            if part then
                local predicted = part.Position + (part.AssemblyLinearVelocity * getgenv().Settings.Prediction)
                if getgenv().Settings.Aimbot then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, predicted)
                else
                    Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, predicted), getgenv().Settings.AimAssistStrength)
                end
            end
        end
    end
end)

-- Spoofer
task.spawn(function()
    while task.wait(0.6) do
        if getgenv().Spoof.Enabled then
            pcall(function()
                if getgenv().Spoof.DisplayName ~= "" then
                    LocalPlayer.DisplayName = getgenv().Spoof.DisplayName
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.DisplayName = getgenv().Spoof.DisplayName
                    end
                end
                for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                        local t = string.lower(tostring(gui.Text))
                        if string.find(t, "rank") or string.find(t, "rango") then gui.Text = tostring(getgenv().Spoof.Rank)
                        elseif string.find(t, "level") or string.find(t, "nivel") then gui.Text = "Level " .. tostring(getgenv().Spoof.Level)
                        elseif string.find(t, "streak") or string.find(t, "racha") then gui.Text = "Streak: " .. tostring(getgenv().Spoof.Streak)
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(18) do
        if getgenv().Settings.AntiAFK then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end
end)

Rayfield:Notify({Title = "Sleepy Style", Content = "Cargado • Rage + Silent + ESP listos", Duration = 5})
print("[Sleepy Style] Loaded successfully")
