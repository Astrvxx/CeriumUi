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
