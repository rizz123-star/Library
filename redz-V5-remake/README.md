# ✨ Wand UI (Redz Library V5 Remake)

## 📌 About
- **Wand UI** is a rebuilt and optimized version of **Redz Library V5**.
- It uses the same UI style as the original, with some improvements and refinements.
- The reason the UI is named **Wand** is that it should be the name of the next generation of **redz Hub** UIs

- 🔹 Made by **real_redz**  
- 🔹 Designed mainly for use in **Redz Hub** scripts  
- 🔹 Open-Source, Lightweight, and Optimized  

---

## 🚀 Getting Started
To load **Wand UI**, simply run:
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"))()
```

### Creating a Window
```lua
local Window = Library:MakeWindow({
  Title = "Nice Hub : Cool Game",
  SubTitle = "dev by real_redz",
  ScriptFolder = "redz-library-V5"
})
```

- NewMinimizer: (self: Window, Config: { KeyCode: KeyCode }) -> Minimizer
  - IsMinimied: boolean
  - Cancel: (self: Minimizer) -> (nil)
  - Minimize: (self: Minimizer) -> (nil)
  - CreateMobileMinimizer: (self: Minimizer, ButtonProperties: { [string]: any? }) -> ImageButton
- MakeTab: (self: Window, Configs: { Title: string, Icon: string? }) -> Tab
  - IsEnabled: boolean
  - Title: string
  - Icon: string
  - Select: (self: Tab) -> (nil)
- Notify: (self: Window, Configs: { Title: string, Content: string, Duration: number?, Image: string? ) -> Notification
  - Close: (self: Notification, )
  - Closed: boolean
- Dialog: (self: Window, Configs: { Title: string, Content: string, Options: { { Name: string, Callback: function? } }) -> Dialog
  - Close: (self: Dialog) -> (nil)
  - NewOption: (self: Dialog, Configs: { Name: string, Callback: function? }) -> (nil)
- SelectTab: (self: Window, Tab: Tab | number) -> (nil)
- SetUIScale: (self: Window | Library, Value: number) -> (nil)
- GetMaxScale: (self: Library) -> number
- GetMinScale: (self: Library) -> number
- SetTitle: (self: Window, Title: string) -> (nil)
- SetSubTitle: (self: Window, SubTitle: string) -> (nil)
- GetTitle: (self: Window) -> string
- GetSubTitle: (self: Window) -> string
- MinimizeButton: (self: Window) -> (nil)
- IsValidTheme: (self: Library, ThemeName: string) -> boolean
- SetTheme: (self: Library, ThemeName: string) -> (nil)
- GetTheme: (self: Library, ThemeName: string?) -> LibraryTheme
  - Name: string
- GetThemes: (self: Library) -> { string }
- GetIconByName: (self: Library, IconName: string) -> string?
- Destroy: (self: Library | Window) -> (nil)
- DeleteFlags: (self: Window) -> (Success: boolean)
- GetFlag: (self: Window, Flag: string, Value: any?) -> (nil)
- SetFlag: (self: Window, Flag: string) -> any

### Minimizer
```lua
local Minimizer = Window:NewMinimizer({
  KeyCode = Enum.KeyCode.LeftControl
})

local MobileButton = Minimizer:CreateMobileMinimizer({
  Image = "rbxassetid://0",
  BackgroundColor3 = Color3.fromRGB(0, 0, 0)
})
```

### UI Scale
- Min Scale: ``0.6``
- Max Scale: ``1.6``
- Default Scale: ``1.0``

```lua
local randomScale = Random.new():NextNumber(Library:GetMinScale(), Library:GetMaxScale())
Library:SetUIScale(randomScale)
```

### Creating a Tab
Normal
```lua
local Tab = Window:MakeTab({
  Title = "Cool Tab",
  Icon = "Home"
})
```
Compact
```lua
local Tab = Window:MakeTab({ "Cool Tab", "Home" })
```

### Creating a Dialog
```lua
Window:Dialog({
  Title = "Hello!",
  Content = "do you like Coffee?",
  Options = {
    {
      Name = "No"
    },
    {
      Name = "Yes!",
      Callback = function(self)
        print("Yes, i like Coffee")
      end
    }
  })
})
```

### Options API
- Builder: { Title: string, Description: string? }
> Options Properties & Functions
- SetTitle: (self: Option, Title: string) -> Option
- SetDescription: (self: Option, Description: string) -> Option
- SetVisible: (self: Option, Value: boolean) -> (nil)
- Destroy: (self: Option) -> (nil)
- AddCallback: (self: Option, Callback: function) -> Option
- Title: string
- Description: string
- Kind: string
> Create Options
- AddToggle: (self: Tab, Configs: Builder & { Default: boolean?, Callback: function?, Flag: string? }) -> Toggle
  - Value: boolean
  - SetValue: (self: Toggle, Value: boolean) -> (nil)
- AddSlider: (self: Tab, Configs: Builder & { Max: number, Min: number, Increment: number?, Callback: function?, Flag: string? }) -> Slider
  - Value: number
  - Min: number
  - Max: number
  - Increment: number
  - SetValue: (self: Slider, Value: number) -> Slider
- AddButton: (self: Tab, Configs: Builder & { Callback: function?, Debounce: number? }) -> Button
- AddSection: (self: Tab, Title: string?) -> Section
- AddDropdown: (self: Tab, Configs: Builder & { Options: { string? } | nil, Default: string | number | { string? | number? }, MultiSelect: boolean?, Callback: function?, Flag: string? }) -> Dropdown
  - Remove: (self: Dropdown, Option: string) -> (nil)
  - Add: (self: Dropdown, ...: string) -> (nil)
  - NewOptions: (self: Dropdown, { string? | number? }) -> (nil)
  - GetOptionsCount: (self: Dropdown) -> number
  - Clear: (self: Dropdown) -> (nil)
  - GetOptionsCount: (self: Dropdown) -> number
  - Opened: boolean
- AddTextBox: (self: Tab, Configs: Builder & { Placeholder: string?, ClearOnFocus: boolean?, Callback: function?, Flag: string? )) -> TextBox
  - CaptureFocus: (self: TextBox) -> TextBox
  - SetText: (self: TextBox, Text: string) -> TextBox
  - SetTextFilter: (self: TextBox, Filter: function?) -> TextBox
  - SetPlaceholder: (self: TextBox, Text: string) -> TextBox
  - Clear: (self: TextBox) -> TextBox
- AddDiscordInvite: (self: Tab, Configs: Builder & { Banner: Image | Color3, Image: string, Invite: string, Members: number?, Online: number?) -> DiscordInvite
### Creating Options
#### Section

```lua
Tab:AddSection("Section")
```

#### Toggle
```lua
Tab:AddToggle({
  Name = "Toggle",
  Default = false,
  Callback = function(Value)
    
  end
})
```

#### Slider
```lua
Tab:AddSlider({
  Name = "Cool Title",
  Min = -5,
  Max = 5,
  Increment = 0.25,
  Default = 0,
  Callback = function(Value)
    
  end
})
```

#### Dropdown
```lua
Tab:AddDropdown({
  Name = "Dropdown",
  MultiSelect = false,
  Options = {"one", "two", "three", "four", "five"},
  Default = "one",
  Callback = function(Value)
    
  end
})
```
