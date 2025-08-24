# ✨ Wand UI (Redz Library V5 Remake)

## 📌 About
**Wand UI** is a rebuilt and optimized version of **Redz Library V5**.  
It uses the same UI style as the original, with some improvements and refinements.  

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
  - CreateMobileMinimizer: (self: Minimizer, Config: { [string]: any? }) -> MobileButton
    - Destroy: (self: Minimizer) -> (nil)
    - SimulateClick: (self: Minimizer) -> (nil)
- GetNotificator: (self: Window) -> Notificator
  - SetXAlignment: (self: Notificator, Direction: "Left" | "Right") -> (nil)
  - Create: (self: Notificator, Config: { Title: string, Content: string, Countdown: number }) -> Notification
    - Play: (self: Notification) -> (nil)
    - IsPlaying: boolean
- GetDialogCreator: (self: Window) -> DialogCreator
  - Create: (self: DialogCreator, Name: string, Callback: function | "CLOSE_ACTION") -> DialogOption
    - Right: (self: DialogOption) -> DialogOption
    - Left: (self: DialogOption) -> DialogOption
    - SetName: (self: DialogOption, Name: string) -> (nil)
    - GetName: (self: DialogOption) -> string
  - Create: (self: DialogCreator, Configs: { Title: string, Content: string?, Options: { DialogOption } }) -> Dialog
    - Display: (self: Dialog) -> (nil)
    - Close: (self: Dialog) -> (nil)
    - Wait: (self: Dialog) -> (nil)
    - GetTitle: (self: Dialog) -> string
    - GetContent: (self: Dialog) -> string
    - SetTitle: (self: Dialog, Title: string) -> (nil)
    - SetContent: (self: Dialog, Content: string) -> (nil)
    - AddOptions: (self: Dialog, { DialogOption }) -> (nil)
- MakeTab: (self: Window, Configs: { Title: string, Icon: string? }) -> Tab
- SelectTab: (self: Window, Tab: Tab | number) -> (nil)
- SetUIScale: (self: Window | Library, Value: number) -> (nil)
- SetTitle: (self: Window, Title: string) -> (nil)
- SetSubTitle: (self: Window, SubTitle: string) -> (nil)
- GetTitle: (self: Window) -> string
- GetSubTitle: (self: Window) -> string
- MinimizeButton: (self: Window) -> (nil)

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
- Max Scale: ``2.0``
- Default Scale: ``1.0``

```lua
local randomScale = Random.new():NextNumber(0.6, 2)
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
local DialogCreator = Window:GetDialogCreator()

local CloseOption = DialogCreator:NewOption("Close", "CLOSE_ACTION")
local WaitOption = DialogCreator:NewOption("Wait", function(self) self:Close() print("Hi!") end)

DialogCreator:Create({
  Title = "Hello!",
  Content = "do you like Coffee?",
  Options = { CloseOption, WaitOption }
})
```
Advanced Example
```lua
local DialogCreator = Window:GetDialogCreator()

local CloseOption = DialogCreator:NewOption("Close", "CLOSE_ACTION")
local WaitOption = DialogCreator:NewOption("Wait", function(self) self:Close() print("Hi!") end)

local Dialog = DialogCreator:Create({
  Title = "Hello!",
  Content = "do you like Coffee?",
  Options = { CloseOption }
})

Dialog:AddOptions({ WaitOption })
local Title = Dialog:GetTitle()

for index = 1, 3 do
  Dialog:SetTitle(`{Title} {index}`)
  Dialog:Display()
  Dialog:Wait()
end
```
