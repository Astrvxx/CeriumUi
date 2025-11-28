# Cerium UI

* A clean, minimalist, and icon-free UI library for Roblox script development. Designed with a dark aesthetic, pill-styled inputs, and a focus on user experience.

# Getting Started

* Import the library into your script using the following loadstring:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Astrvxx/CeriumUi/refs/heads/main/main.lua"))()
```

# Creating a Window

```lua
local Window = Library:CreateWindow{
    Title = "Cerium UI",
    SubTitle = "v3.5.0",
    TabWidth = 160,
    Size = UDim2.fromOffset(830, 525),
    Resize = true, 
    MinSize = Vector2.new(470, 380),
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
}
```

# Creating Tabs

```lua
local Tabs = {
    Main = Window:CreateTab{
        Title = "Main",
        Icon = "" -- Leave empty for no icon
    },
    Settings = Window:CreateTab{
        Title = "Settings",
        Icon = ""
    }
}
```

# Interface Elements
## Button
Includes a built-in cooldown feature to prevent spam.

```lua
Tabs.Main:CreateButton{
    Title = "Click Me",
    Description = "Optional description text",
    Cooldown = 2, -- Time in seconds
    Callback = function()
        print("Button clicked")
    end
}
```

## Toggle

```lua
local Toggle = Tabs.Main:CreateToggle("MyToggle", {
    Title = "Auto Farm",
    Default = false 
})

Toggle:OnChanged(function(Value)
    print("Toggle state:", Value)
end)
```

## Slider

```lua
local Slider = Tabs.Main:CreateSlider("WalkSpeed", {
    Title = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        print("Speed set to:", Value)
    end
})
```

## Dropdown
Features a pill-style selection layout. Supports single and multi-select.

```lua
local Dropdown = Tabs.Main:CreateDropdown("TargetMode", {
    Title = "Target Part",
    Values = {"Head", "Torso", "Legs"},
    Multi = false, -- Set to true for multiple selections
    Default = "Head",
})

Dropdown:OnChanged(function(Value)
    print("Selected:", Value)
end)
```
## Colorpicker
Includes RGB sliders and a preview box.

```lua
Tabs.Main:CreateColorpicker("ESPColor", {
    Title = "ESP Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        -- Update color logic here
    end
})
```

## Keybind
Supports Toggle, Hold, and Always modes.

```lua
Tabs.Main:CreateKeybind("AimbotKey", {
    Title = "Aimbot Key",
    Mode = "Toggle",
    Default = "RightMouse",
    Callback = function(State)
        print("Keybind active:", State)
    end
})
```

## Input Box

```lua
Tabs.Main:CreateInput("ConfigName", {
    Title = "Config Name",
    Default = "default",
    Placeholder = "Enter name...",
    Callback = function(Text)
        print("Input text:", Text)
    end
})
```

## Vector3 Input
Useful for setting custom coordinates or offsets.

```lua
Tabs.Main:CreateVector3("TeleportPos", {
    Title = "Custom Teleport",
    Default = Vector3.new(0, 0, 0),
    Callback = function(Vec)
        print("X:", Vec.X, "Y:", Vec.Y, "Z:", Vec.Z)
    end
})
```

# Visual Elements

## Profile Card
Displays the local player's avatar, display name, and User ID automatically.

```lua
Tabs.Main:CreateProfileCard()
```

## Section & Label
Used for organizing elements and displaying read-only data.

```lua
Tabs.Main:CreateSection("Statistics")

local Label = Tabs.Main:CreateLabel({
    Title = "Ping",
    Value = "50 ms"
})

-- Update the label later
Label:Set("60 ms")
```

## Dialog / Modal
Creates a blurred overlay with options.

```lua
Window:Dialog{
    Title = "Confirmation",
    Content = "Are you sure you want to proceed?",
    Buttons = {
        {
            Title = "Yes",
            Callback = function() print("Yes") end
        },
        {
            Title = "No",
            Callback = function() print("No") end
        }
    }
}
```

## Search Bar
The library includes a built-in search bar at the top of the sidebar. It automatically filters tabs based on the text entered. No configuration is required.


# https://discord.gg/uWWqDrVRWR
