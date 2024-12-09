-- تحميل مكتبة Orion
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionUI/Orion/main/source"))()

-- إنشاء نافذة جديدة باستخدام مكتبة Orion
local Window = OrionLib:MakeWindow({
    Name = "404 NOT FOUND",           -- اسم الواجهة
    HidePremium = false,              -- عرض حالة بريميوم
    SaveConfig = true,                -- حفظ الإعدادات
    ConfigFolder = "404NotFound",     -- المجلد الخاص بحفظ الإعدادات
    IntroEnabled = true,              -- تفعيل واجهة البداية
    IntroText = "Welcome to 404 NOT FOUND",  -- نص واجهة البداية
    Icon = "rbxassetid://6031075938"  -- أيقونة النافذة
})

-- متغيرات للقفز العالي
local jumpHeight = 300
local isHighJumpEnabled = false

-- وظيفة لتفعيل أو تعطيل القفز العالي
local function toggleHighJump(enable)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    if enable then
        humanoid.JumpHeight = jumpHeight
    else
        humanoid.JumpHeight = 50  -- القيمة الافتراضية للقفز
    end
end

-- إنشاء زر لتفعيل القفز العالي
Window:MakeTab({
    Name = "High Jump",       -- اسم التبويب
    Icon = "rbxassetid://6031075938",  -- أيقونة التبويب
    PremiumOnly = false       -- مفتوح لجميع المستخدمين
}):AddButton({
    Name = "Toggle High Jump",
    Callback = function()
        isHighJumpEnabled = not isHighJumpEnabled
        toggleHighJump(isHighJumpEnabled)

        local status = isHighJumpEnabled and "enabled" or "disabled"
        OrionLib:MakeNotification({
            Name = "High Jump " .. status,
            Content = "High jump is now " .. status .. " with a height of " .. jumpHeight,
            Image = "rbxassetid://6031075938",  -- صورة الإشعار
            Time = 3  -- مدة عرض الإشعار
        })
    end
})

-- إنشاء شريط تمرير لضبط ارتفاع القفز
Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://6031075938",
    PremiumOnly = false
}):AddSlider({
    Name = "Set Jump Height",
    Min = 50,
    Max = 500,
    Default = jumpHeight,
    Increment = 1,
    ValueName = "Height",
    Callback = function(value)
        jumpHeight = value
        if isHighJumpEnabled then
            toggleHighJump(true)
        end
    end
})

-- تفعيل Orion
OrionLib:Init()
