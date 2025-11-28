local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Astrvxx/CeriumUi/refs/heads/main/main.lua"))()

local Window = Library:CreateWindow{
    Title = `Holy UI {Library.Version}`,
    SubTitle = "By Astrvx",
    TabWidth = 1,
    Size = UDim2.fromOffset(850, 525),
    Resize = true, 
}

local Tabs = {
    Main = Window:CreateTab{
        Title = "Main",
    },
    Ball = Window:CreateTab{
        Title = "Ball",
    },
    Settings = Window:CreateTab{
        Title = "Settings",
    }
}

local Options = Library.Options

Library:Notify{
    Title = "Notification",
    Content = "This is a notification",
    SubContent = "SubContent", 
    Duration = 5 
}

local Paragraph = Tabs.Main:CreateParagraph("Paragraph", {
    Title = "Paragraph",
    Content = "This is a paragraph.\nSecond line!"
})

Paragraph:SetValue("This paragraph text is changed!")
Tabs.Main:CreateSection("Visuals")

local PingLabel = Tabs.Main:CreateLabel({
    Title = "Current Ping",
    Value = "0 ms"
})


task.spawn(function()
    while true do
        wait(1)
        if PingLabel.Set then
            local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():split(" ")[1])
            PingLabel:Set(ping .. " ms")
        else
            break
        end
    end
end)

Tabs.Main:CreateProfileCard() --this creates a profile card, looks really nice if you inclide it at the top of everything

Tabs.Main:CreateParagraph("Aligned Paragraph", {
    Title = "Paragraph",
    Content = "This is a paragraph with a center alignment!",
    TitleAlignment = Enum.TextXAlignment.Center,
    ContentAlignment = Enum.TextXAlignment.Center
}) --simple paragraph you can center it and stuff 

Tabs.Main:CreateButton{
    Title = "Button",
    Description = "Very important button",
    Cooldown = 0, 
    Callback = function()
        Window:Dialog{
            Title = "Title",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        print("Confirmed the dialog.")
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
} --button with cooldown set cooldown to 0 to remove cooldown

local Toggle = Tabs.Main:CreateToggle("MyToggle", {Title = "Toggle", Default = false })

Toggle:OnChanged(function()
    print("Toggle changed:", Options.MyToggle.Value)
end)

Options.MyToggle:SetValue(false)
Tabs.Main:CreateVector3("TeleportPos", {
    Title = "Teleport Position",
    Default = Vector3.new(0, 100, 0),
    Callback = function(Vec)
        print("Vector changed:", Vec)
    end
}) --simple XYZ inputs with a example
local Slider = Tabs.Main:CreateSlider("Slider", {
    Title = "Slider",
    Description = "This is a slider",
    Default = 2,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Callback = function(Value)
        print("Slider was changed:", Value)
    end
})

Slider:OnChanged(function(Value)
    print("Slider changed:", Value)
end)

Slider:SetValue(3) --slider sugima

local Dropdown = Tabs.Main:CreateDropdown("Dropdown", {
    Title = "Dropdown",
    Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    Multi = false,
    Default = 1,
})

Dropdown:SetValue("four")

Dropdown:OnChanged(function(Value)
    print("Dropdown changed:", Value)
end) --simple dropdown

local MultiDropdown = Tabs.Main:CreateDropdown("MultiDropdown", {
    Title = "Dropdown",
    Description = "You can select multiple values.",
    Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    Multi = true,
    Default = {"six", "seven"},
}) --multi dropdown!

local Colorpicker = Tabs.Main:CreateColorpicker("Colorpicker", {
    Title = "Colorpicker",
    Default = Color3.fromRGB(96, 205, 255)
}) --simple color picker!

local Keybind = Tabs.Main:CreateKeybind("Keybind", {
    Title = "KeyBind",
    Mode = "Toggle", 
    Default = "LeftControl", 
    Callback = function(Value)
        print("Keybind clicked!", Value)
    end,
    ChangedCallback = function(New)
        print("Keybind changed!", New)
    end
})

Keybind:OnClick(function()
    print("Keybind clicked:", Keybind:GetState())
end) --keybind

local Input = Tabs.Main:CreateInput("Input", {
    Title = "Input",
    Default = "Default",
    Placeholder = "Placeholder",
    Callback = function(Value)
        print("Input changed:", Value)
    end
}) --input self explanatory




Tabs.Settings:CreateKeybind("MenuKeybind", {
    Title = "Minimize Bind",
    Default = "RightControl",
    Mode = "Toggle",
    Callback = function(Value)
        local MainFrame = game.CoreGui:FindFirstChild("CeriumUI") and game.CoreGui.CeriumUI:FindFirstChild("MainFrame")
        if MainFrame then
            MainFrame.Visible = not MainFrame.Visible
        end
    end,
    ChangedCallback = function(NewKey)
        Library.MinimizeKey = NewKey
    end
}) --a simple minimize keybind!

Window:SelectTab(1)
