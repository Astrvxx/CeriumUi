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

