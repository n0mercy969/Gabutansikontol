local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "n0mercy. 🥵🤫| Beta v0.0.0.1",
   LoadingTitle = "Project Pertama",
   LoadingSubtitle ="By n0mecy.",
   ConfigurationSaving = {Enabled = false}
})

local _G = {
    AutoFarm = false,
    AutoSell = false,
    AutoRebirth = false,
    AutoClaim = false,
    AutoClear = true, 
    AntiAFK = false, 
    CycleDelay = 0.65,
    ModQuality = 100,
    ModSize = 50,
    FixedWaterPoint = Vector3.new(-0.19334228336811066, 0.0000016488312439832953, -0.981131374835968)
}

local RemoteFunc = game:GetService("ReplicatedStorage").Msg.RemoteFunction.RemoteFunction
local RemoteEvent = game:GetService("ReplicatedStorage").Msg.RemoteEvent.RemoteEvent
local VirtualUser = game:GetService("VirtualUser")

-- [[ ULTRA VISUAL CLEANER - EXTREME EDITION ]]
-- Menghapus sampah visual di Karakter DAN Workspace agar FPS tetap stabil
local function UltraClearEffects()
    pcall(function()
        -- 1. Bersihkan di Karakter
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, obj in pairs(char:GetChildren()) do
                if obj.Name:find("Fishing") or obj.Name:find("Line") or obj.Name:find("Rod") or obj.Name:find("Tool") then
                    if obj.Name ~= "钓鱼竿" and not obj:IsA("Humanoid") and not obj:IsA("LocalScript") then
                        obj:Destroy()
                    end
                end
            end
        end
        -- 2. Bersihkan di Workspace (Sampah pancingan melayang)
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "FishingLine" or v.Name == "Bobber" or v.Name == "Droplet" then
                v:Destroy()
            end
        end
    end)
end

-- [[ ANTI-AFK STABLE ]]
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do v:Disable() end

local MainTab = Window:CreateTab("Main", 4483362458)
local SetTab = Window:CreateTab("Settings", 4483362458)

-- [[ MAIN TAB ]]
MainTab:CreateToggle({
   Name = "Auto Fishing mode BoreUp",
   CurrentValue = false,
   Flag = "FixedToggle",
   Callback = function(Value)
      _G.AutoFarm = Value
      if Value then
          task.spawn(function()
              while _G.AutoFarm do
                  task.spawn(function()
                      pcall(function()
                          RemoteFunc:InvokeServer("抛竿", _G.FixedWaterPoint)
                          task.wait(0.05)
                          RemoteFunc:InvokeServer("拉竿")
                          task.wait(0.05)
                          local fishData = {{size = _G.ModSize, onlyID = 1013, tp = 8, magic = 0, id = 8000002, count = 1, isNew = true, quality = _G.ModQuality}}
                          RemoteFunc:InvokeServer("结束钓鱼", fishData)
                      end)
                  end)
                  
                  -- Pemicu pembersihan total setiap siklus
                  if _G.AutoClear then UltraClearEffects() end
                  
                  task.wait(_G.CycleDelay)
              end
          end)
      end
   end,
})

MainTab:CreateInput({
   Name = "Cycle Speed",
   PlaceholderText = "Default 0.65",
   Callback = function(Text)
      _G.CycleDelay = tonumber(Text) or 0.65
   end,
})

MainTab:CreateToggle({
   Name = "Auto Sell",
   CurrentValue = false,
   Flag = "SellToggle",
   Callback = function(Value)
      _G.AutoSell = Value
      if Value then
          task.spawn(function()
              while _G.AutoSell do
                  pcall(function()
                      RemoteFunc:InvokeServer("\229\141\150\230\142\137\229\133\168\233\131\168\233\177\188")
                  end)
                  task.wait(2)
              end
          end)
      end
   end,
})

-- [[ SETTINGS TAB ]]
SetTab:CreateToggle({
   Name = "Anti Afk",
   CurrentValue = false,
   Callback = function(Value)
      _G.AntiAFK = Value
      if Value then
          task.spawn(function()
              while _G.AntiAFK do
                  VirtualUser:CaptureController()
                  VirtualUser:ClickButton2(Vector2.new())
                  task.wait(60)
              end
          end)
      end
   end,
})

SetTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoRebirth = Value
      if Value then
          task.spawn(function()
              while _G.AutoRebirth do
                  RemoteEvent:FireServer("\233\135\141\231\148\159", 1)
                  task.wait(5)
              end
          end)
      end
   end,
})

SetTab:CreateToggle({
   Name = "Auto claim rewards",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoClaim = Value
      if Value then
          task.spawn(function()
              while _G.AutoClaim do
                  for i = 1, 15 do
                      RemoteFunc:InvokeServer("\233\162\134\229\143\150\229\156\168\231\186\191\229\165\150\229\138\177", i)
                      task.wait(0.1)
                  end
                  task.wait(60)
              end
          end)
      end
   end,
})

SetTab:CreateToggle({
   Name = "Clear Visual",
   CurrentValue = true,
   Callback = function(Value) _G.AutoClear = Value end,
})

Rayfield:Notify({
   Title = "Tested script beta v0.0.0.1",
   Content = "By n0mercy.",
   Duration = 5
})