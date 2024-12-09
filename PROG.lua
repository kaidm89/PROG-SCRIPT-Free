-- تحميل مكتبة Orion
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionUI/Orion/main/source"))()

-- إنشاء نافذة Orion
local Window = OrionLib:MakeWindow({
    Name = "404 NOT FOUND",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "404NotFound",
    IntroEnabled = true,
    IntroText = "Welcome to 404 NOT FOUND",
    Icon = "rbxassetid://6031075938"
})

-- متغيرات القفز العالي
local jumpPower = 300
local isHighJumpEnabled = false

-- وظيفة للحصول على الشخصية
local function getCharacter()
    local player = game:GetService("Players").LocalPlayer
    return player.Character or player.CharacterAdded:Wait()
end

-- وظيفة لتفعيل القفز العالي
local function toggleHighJump(enable)
    local character = getCharacter()
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if enable then
                humanoid.JumpPower = jumpPower
            else
                humanoid.JumpPower = 50 -- القيمة الافتراضية
            end
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Humanoid not found in character.",
                Image = "rbxassetid://6031075938",
                Time = 3
            })
        end
    end
end

-- زر لتفعيل القفز العالي
Window:MakeTab({
    Name = "High Jump",
    Icon = "rbxassetid://6031075938",
    PremiumOnly = false
}):AddButton({
    Name = "Toggle High Jump",
    Callback = function()
        isHighJumpEnabled = not isHighJumpEnabled
        toggleHighJump(isHighJumpEnabled)
        local status = isHighJumpEnabled and "enabled" or "disabled"
        OrionLib:MakeNotification({
            Name = "High Jump " .. status,
            Content = "High jump is now " .. status .. " with power of " .. jumpPower,
            Image = "rbxassetid://6031075938",
            Time = 3
        })
    end
})

-- شريط تمرير لتغيير قيمة القفز
Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://6031075938",
    PremiumOnly = false
}):AddSlider({
    Name = "Set Jump Power",
    Min = 50,
    Max = 500,
    Default = jumpPower,
    Increment = 1,
    ValueName = "Power",
    Callback = function(value)
        jumpPower = value
        if isHighJumpEnabled then
            toggleHighJump(true)
        end
    end
})

-- تفعيل Orion
OrionLib:Init()
