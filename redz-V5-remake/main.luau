
























local a=cloneref or(function(...)return...end)

local b=delfolder or deletefolder
local c=delfile or deletefile
local d=makefolder
local e=writefile
local f=readfile

local g=setmetatable({},{
__index=function(g,h)
rawset(g,h,a(game:GetService(h)))
return rawget(g,h)
end
})

local h=g.MarketplaceService
local i=g.UserInputService
local j=g.TweenService
local k=g.HttpService
local l=g.RunService
local m=g.Players

local n=l.Heartbeat

local o=m.LocalPlayer
local p=o:GetMouse()

local q=(gethui or function()return g.CoreGui end)()

local r={
Darker={
Colors={
Background=ColorSequence.new{
ColorSequenceKeypoint.new(0.00,Color3.fromRGB(25,25,25)),
ColorSequenceKeypoint.new(0.50,Color3.fromRGB(32.5,32.5,32.5)),
ColorSequenceKeypoint.new(1.00,Color3.fromRGB(25,25,25))
},
Primary=Color3.fromRGB(88,101,242),
OnPrimary=Color3.fromRGB(61,67,135),
ScrollBar=Color3.fromRGB(1,76,105),
Stroke=Color3.fromRGB(45,45,45),

Error=Color3.fromRGB(255,102,102),
Icons=Color3.fromRGB(232,233,235),

JoinButton=Color3.fromRGB(37,128,69),
Link=Color3.fromRGB(40,150,255),

Dialog={
Background=Color3.fromRGB(28,28,28)
},
Buttons={
Holding=Color3.fromRGB(34,34,34),
Default=Color3.fromRGB(28,28,30)
},
Border={
Holding=Color3.fromRGB(60,60,60),
Default=Color3.fromRGB(38,38,38),
},
Text={
Default=Color3.fromRGB(255,255,255),
Dark=Color3.fromRGB(200,200,200),
Darker=Color3.fromRGB(175,175,175),
},
Slider={
SliderBar=Color3.fromRGB(1,76,105),
SliderNumber=Color3.fromRGB(232,233,235),
},
Dropdown={
Holder=Color3.fromRGB(30,30,30),
}
},
Icons={
Error="rbxassetid://10709752996",
Button="rbxassetid://10709791437",
Close="rbxassetid://10747384394",
TextBox="rbxassetid://15637081879",
Search="rbxassetid://10734943674",
Keybind="rbxassetid://10734982144",
Dropdown={
Open="rbxassetid://10709791523",
Close="rbxassetid://10709790948"
}
},
Font={
Normal=Enum.Font.BuilderSans,
Medium=Enum.Font.BuilderSansMedium,
Bold=Enum.Font.BuilderSansBold,
ExtraBold=Enum.Font.BuilderSansExtraBold,
SliderValue=Enum.Font.FredokaOne
},
BackgroundTransparency=0.03
}
}

for s,t in r do
t.Name=s
table.freeze(t)
end

local s={
Information={
Version="v2.0.1",
GitHubOwner="rizz123-star"
},
Default={
Theme="Darker",
UISize=UDim2.fromOffset(550,380),
TabSize=160
},

Themes=r,

Connections={},
Options={},
Tabs={}
}

s.Info=s.Information
s.Save=s.Default

local t=workspace.CurrentCamera.ViewportSize local u=function(

u, v, w)
table.insert(s.Connections,u[w or"Connect"](u,v))end


local v={}
v.__index=v local w=function(

w, x)
for y in x:gmatch"[^%.]+"do
w=w[y]
end

return w end local x=function(


x, y, z, A)
if not A then
A=s.CurrentTheme
end

x[y]=w(A,if type(z)=="function"then z()else z)end local y=function(


y, z, A)
for B,C in A do
x(z,B,C,y)
end end local z=function(


z, A)
if d then
local B=z:split"/"
B[#B]=nil

local C=table.concat(B,"/")

if C~=""and(isfolder==nil or not isfolder(C))then
d(C)
end
end

e(z,A)end


local A=false

local B={
MAX_SCALE=1.6,
MIN_SCALE=0.6,

TEXTBOX={
PLACEHOLDER_TEXT="Input"
}
}

function v:add(C,D)
self.Descendants[D]=C

if self.IS_RENDERING then
y(s.CurrentTheme,C,D)
end
end

function v:update()
if self.IS_RENDERING and not self.UPDATED_OBJECTS then
local C=s.CurrentTheme
self.UPDATED_OBJECTS=true

for D,E in self.Descendants do
local F=typeof(E)
if F=="table"then E:update()continue end

y(C,E,D)
end
end
end

function v:destroy()
local C=self.Parent and table.find(self.Parent.Descendants)

if C then
table.remove(self.Parent.Descendants,C)
end

table.clear(self.Descendants)
setmetatable(self,nil)
end

function v:changeRendering(C)
if self.IS_RENDERING~=C then
self.IS_RENDERING=C
self.UPDATED_OBJECTS=false
end
end

function v:new()
local C=setmetatable({
IS_RENDERING=true,
UPDATED_OBJECTS=false,
Descendants={},
Parent=self.Descendants~=nil and self or nil
},v)

if self.Descendants then
table.insert(self.Descendants,C)
end

return C
end

local C=v:new()

local D,E={}do
local F={}

local G={}do
G.ElementsTable={
Corner=function(H)
return E("UICorner",{
CornerRadius=H or UDim.new(0,8)
})
end,
Stroke=function(H,I)
return E("UIStroke",{
Color=H or Color3.fromRGB(60,60,60),
Thickness=I or 1
})
end,
Image=function(H)
return E("ImageLabel",{
Image=H or"",
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1)
})
end,
Button=function()
return E("TextButton",{
Text="",
Size=UDim2.fromScale(1,1),
AutoButtonColor=false
})
end,
Padding=function(H,I,J,K)
return E("UIPadding",{
PaddingLeft=H or UDim.new(0,10),
PaddingRight=I or UDim.new(0,10),
PaddingTop=J or UDim.new(0,10),
PaddingBottom=K or UDim.new(0,10)
})
end,
ListLayout=function(H)
return E("UIListLayout",{
Padding=H or UDim.new(0,5)
})
end,
Text=function(H)
return E("TextLabel",{
BackgroundTransparency=1,
Text=H or""
})
end,
Gradient=function(H)
return E("UIGradient",{
Color=H
})
end
}

function G:Create(H,I,...)
local J=self.ElementsTable[I]

if J then
local K=J(...)
K.Parent=H
return K
end
end
end

local H={}

function H:Childs(I)
for J=1,#I do
I[J].Parent=self
end
end

function H:Elements(I)
for J,K in pairs(I)do
if type(K)=="table"then
D.SetProperties(G:Create(self,J),K)
else
G:Create(self,J,K)
end
end
end

function H:ThemeTag(I)
local J=I.OBJECTS
I.OBJECTS=nil
return(J or C):add(self,I)
end

function D:SetProperties(I)
for J,K in pairs(I)do
if H[J]then
H[J](self,K)
else
self[J]=K
end
end
end

function D:SetValues(...)
local I=self

for J,K in{...}do
local L=typeof(K)

if L=="table"then
D.SetProperties(I,K)
else
I[if L=="string"then"Name"else"Parent"]=K
end
end

return I
end

local I

function D:Draggable(J,K,L)
local M,N,O,P
local Q=K or 0.28
local R=0
local S local T=function(

T)
local U=T.Position-N
local V
R=tick()

if L then
V=L(
O.X.Scale,O.X.Offset+U.X/J.Scale,
O.Y.Scale,O.Y.Offset+U.Y/J.Scale
)
else
V=UDim2.new(
O.X.Scale,O.X.Offset+U.X/J.Scale,
O.Y.Scale,O.Y.Offset+U.Y/J.Scale
)
end
self.Position=self.Position:Lerp(V,Q)end local U=function()



while I==self do
if(tick()-R)>=1 then
S()
break
end
task.wait()
end end


local V={
[Enum.UserInputType.MouseButton1]=true,
[Enum.UserInputType.Touch]=true
}

local W={
[Enum.UserInputType.MouseMovement]=true,
[Enum.UserInputType.Touch]=true
}

u(self.InputBegan,function(X)
if A==false and I==nil and V[X.UserInputType]then
N=X.Position
O=self.Position
I=self
R=tick()
A=true

local Y;

function S()
A=false
I=nil
Y:Disconnect()
end

task.spawn(U)

Y=X.Changed:Connect(function()
if X.UserInputState==Enum.UserInputState.End then
S()
end
end)
end
end)

u(i.InputChanged,function(X)
if I==self and W[X.UserInputType]then
T(X)
end
end)
end

function D:CreateNewTemplate(J)
return D.CloneObject(F[self],J)
end

function D.new(J,...)
return D.SetValues(Instance.new(J),...)
end

E=D.new
end

local F={}local G=function(

G)
if G==nil then
return{}
end

if type(G)~="function"and type(G)~="table"then
error(`Failed to get Callback: 'function', or 'table' expected, got {typeof(G)}`,2)
end

if type(G)~="function"then
local H=G[1]
local I=G[2]

G=function(J)
H[I]=J
end
end

return table.pack(G)end local H=function(


H)
F[H]=nil end local I=function(


I, ...)
if F[I]then return end

F[I]=true

for J=1,#I do
task.spawn(I[J],...)
end

task.defer(H,I)end


local J="redz-library-v5"
local K=q:FindFirstChild(J)

if not K then
K=E("ScreenGui",J,q,{
IgnoreGuiInset=true
})
end local L=function(

L, M, N, O, ...)
local P=TweenInfo.new(O,EasingStyle or Enum.EasingStyle.Quint,...)

return j:Create(L,P,{
[M]=N
})end local M=function(


M)
local N={}
for O=1,#M do
rawset(N,M[O],true)
end
return N end


local N=M(string.split"\n\t,_:;()[]#&=!. \"'*^<>$")local O=function(

O)
return string.gsub(O:lower(),".",function(P)
return N[P]and""or P
end)end local P=function(


P)
local Q,R,S=tostring(P),"",0

for T=#Q,1,-1 do
R=Q:sub(T,T)..R
S+=1

if T>1 and S%3==0 then
R=","..R
end
end

return R end local Q=function(


Q)
local R="rbxassetid://"
return Q:sub(1,#R)==R end local R=function(


R)
return(t.Y/450)*R end local S=function(


S)
local T=math.floor(S/60)
local U=math.floor(S/60/60)
S=math.floor((S-(T*60))*10)/10
T=T-(U*60)

if U>0 then
return`{U}h {T}m {math.floor(S)}s`
elseif T>0 then
return`{T}m {math.floor(S)}s`
else
return tostring(S)
end end


local T={}do
local U={}
local V={}
local W={}
local X={}

local Y
local Z
local _
local aa
local ab
local ac
local ad
local ae
local af
local ag

local ah=""

local ai={SelectedTab=1,Minimized=false}
ai.__index=ai

local aj={}
aj.__index=aj

local ak={}
ak.__index=ak

local al={}
al.__index=al

local am={}do local an=function()

local an={}
an.__index=function(ao,ap)
return an[ap]or rawget(ak,ap)
end

return an end


local ao=an()
am.TextBox=ao

local ap=an()
am.Toggle=ap

local aq=an()
am.Slider=aq

local ar=an()
am.Dropdown=ar

local as=an()
am.Keybind=as

local at=an()
am.Dialog=at local au=function()


aa.Closed=true
aa.Closing=false
setmetatable(aa,nil)

aa=nil
ac.Parent=nil end local av=function()



if aa~=nil then
aa:Close()
end end


function at:NewOption(aw)
local ax=aw[1]or aw.Name or aw.Title
local ay=G(aw[2]or aw.Callback)

table.insert(ay,av)

assert(type(ax)=="string",`"Dialog.NewOption.Name". 'string' expected, got {typeof(ax)}`)

local az=E("TextButton",{
AutoButtonColor=false,
Size=UDim2.fromScale(0.2,1),
BackgroundTransparency=1,
TextSize=10,
Text=ax,
Elements={
Corner=UDim.new(1,0)
},
ThemeTag={
BackgroundColor3="Colors.Buttons.Default",
TextColor3="Colors.Text.Dark",
Font="Font.Normal"
}
})

local aA=L(az,"BackgroundTransparency",0,0.3)
local aB=L(az,"BackgroundTransparency",1,0.3)

u(az.MouseLeave,function()aB:Play()end)
u(az.MouseEnter,function()aA:Play()end)
u(az.Activated,function()I(ay)end)

az.Parent=ac.Template.Options
end

function at:Close(aw)
if self.Closed or self.Closing or aa~=self then
return nil
end

self.Closing=true

local ax=L(self.TEMPLATE,"Size",self.NEW_SIZE,0.1)
ax:Play()

if aw then
ax.Completed:Wait()
au()
else
u(ax.Completed,au)
end
end

function at.new(aw,ax)
return setmetatable({
TITLE_LABEL=aw,
DESCRIPTION_LABEL=aw,
Content=aw.Text,
Title=ax.Text,

Closed=false,
Closing=false,
Kind="Dialog"
},at)
end

function ar:SetEnabled(aw)
assert(type(aw)=="table",`"Dropdown.SetEnabled[param 1]". 'table' expected, got {typeof(aw)}`)

self.SET_ENABLED_OPTIONS(aw)
end

function ar:Clear()
self.CLEAR_DROPDOWN()
end

function ar:NewOptions(...)
self:Clear()
self:Add(...)
end

function ar:GetOptionsCount()
return#self.DROPDOWN_OPTIONS
end

function ar:Remove(...)
local aw={...}
assert(#aw>0,"'Dropdown.Remove' requires one or more options.")

for ax,ay in aw do
self.REMOVE_DROPDOWN_OPTION(ay)
end
end

function ar:Add(...)
local aw={...}
assert(#aw>0,"'Dropdown.Add' requires one or more options.")

for ax,ay in aw do
self.ADD_DROPDOWN_OPTION(ay)
end
end

function ar.new(aw,ax,ay,az,aA)
return setmetatable({
CALLBACKS=aA,

DESTROY_ELEMENT=ax,
VISIBLE_ELEMENT=ax,

TITLE_LABEL=ay,
DESCRIPTION_LABEL=az,
Description=az.Text,
Title=ay.Text,

Parent=aw,
Kind="Dropdown"
},ar)
end

function aq:SetValue(aw)
assert(type(aw)=="number",`"Slider.SetValue". 'number' expected, got {typeof(aw)}`)

if self.Value~=aw then
self.WHEN_VALUE_CHANGED(aw)
end
end

function aq.new(aw,ax,ay,az,aA)
return setmetatable({
CALLBACKS=aA,

DESTROY_ELEMENT=ax,
VISIBLE_ELEMENT=ax,

TITLE_LABEL=ay,
DESCRIPTION_LABEL=az,
Description=az.Text,
Title=ay.Text,

Parent=aw,
Kind="Slider"
},aq)
end

function ap:SetValue(aw)
assert(type(aw)=="boolean",`"Toggle.SetValue". 'boolean' expected, got {typeof(aw)}`)

if self.Value~=aw then
self.Value=aw
self.WHEN_VALUE_CHANGED(aw)
end
end

function ap.new(aw,ax,ay,az,aA,aB)
return setmetatable({
CALLBACKS=aB,
WHEN_VALUE_CHANGED=aA,

DESTROY_ELEMENT=ax,
VISIBLE_ELEMENT=ax,

TITLE_LABEL=ay,
DESCRIPTION_LABEL=az,
Description=az.Text,
Title=ay.Text,

Parent=aw,
Kind="Toggle"
},ap)
end

function ao:SetText(aw)
assert(type(aw)=="string",`"TextBox.SetText". 'string' expected, got {typeof(aw)}`)

self.TEXTBOX.Text=aw
return self
end

function ao:SetPlaceholder(aw)
assert(type(aw)=="string",`"TextBox.SetPlaceholder". 'string' expected, got {typeof(aw)}`)

self.TEXTBOX.PlaceholderText=aw
return self
end

function ao:CaptureFocus()
self.TEXTBOX:CaptureFocus()
return self
end

function ao:Clear()
self.TEXTBOX.Text=""
return self
end

function ao:SetTextFilter(aw)
if aw~=nil then
assert(type(aw)=="function",`"TextBox.SetTextFilter[param 1]". 'function', or 'nil' expected, got {typeof(aw)}`)
end

self.TEXTBOX_TEXT_FILTER=aw
return self
end

function ao.new(aw,ax,ay,az,aA,aB)
return setmetatable({
Title=ax.Text,
Description=ay.Text,
DESCRIPTION_LABEL=ay,
TITLE_LABEL=ax,

CALLBACKS=aB,
DESTROY_ELEMENT=az,
VISIBLE_ELEMENT=az,

TEXTBOX=aA,
BUTTON=az,

Parent=aw,
Kind="TextBox"
},ao)
end

ao.Set=ao.SetText
ap.Set=ap.SetValue
aq.Set=aq.SetValue
end local an=function(

an, ao, ap)
local aq=E("TextButton","Button",ap,{
Size=UDim2.new(1,0,0,24),
AutoButtonColor=false,
Text="",
Elements={
Corner=UDim.new(0,6)
},
ThemeTag={
BackgroundColor3="Colors.Buttons.Default"
},
Childs={
E("TextLabel","Title",{
BackgroundTransparency=1,
Font=Enum.Font.GothamMedium,
Text=ao.Title,
TextSize=10,
TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=(FirstTab and 0.3)or 0,
TextTruncate=Enum.TextTruncate.AtEnd,
ThemeTag={
TextColor3="Colors.Text.Default"
}
})
}
})

local ar=E("Frame",aq,{
Position=UDim2.new(0,1,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
Size=UDim2.fromOffset(4,4),
BackgroundTransparency=1,
ThemeTag={
BackgroundColor3="Colors.Primary"
},
Elements={
Corner=UDim.new(0.5,0)
}
})

local as=E("ScrollingFrame","Container",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,1),
AnchorPoint=Vector2.new(0,1),
ScrollBarThickness=1.5,
BackgroundTransparency=1,
ScrollBarImageTransparency=0.2,
AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,
BorderSizePixel=0,
CanvasSize=UDim2.new(),
ThemeTag={
ScrollBarImageColor3="Colors.ScrollBar"
},
Elements={
Padding={
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingTop=UDim.new(0,10),
PaddingBottom=UDim.new(0,10)
},
ListLayout={
Padding=UDim.new(0,5)
}
}
})

local at=E("ImageLabel",aq,{
Position=UDim2.new(0,8,0.5),
Size=UDim2.new(0,13,0,13),
AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,
ImageTransparency=0.3,
Image=ao.Icon or""
})local au=function()


local au=string.sub(at.Image,1,13)=="rbxassetid://"
local av=aq.Title
at.Visible=au
av.Size=UDim2.new(1,au and-25 or-15,1)
av.Position=UDim2.fromOffset(au and 25 or 15)end


u(at:GetPropertyChangedSignal"Image",au)
au()

return aq,as,ar,at end local ao=function(


ao, ap, aq, ar)
local as=E("TextLabel",{
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,-20),
Position=UDim2.fromScale(0,0.5),
AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,
TextSize=11,
ThemeTag={
OBJECTS=C,
TextColor3="Colors.Text.Default",
Font="Font.Medium"
}
})

local at=X[ao]
local au=V[ao].Container

local av=E("TextLabel",{
TextXAlignment=Enum.TextXAlignment.Left,
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,-20),
Position=UDim2.new(0,12,0,15),
BackgroundTransparency=1,
TextWrapped=true,
TextSize=8,
RichText=true,
ThemeTag={
OBJECTS=at,
TextColor3="Colors.Text.Dark",
Font="Font.Normal"
}
})

local aw={
OBJECTS=at,
BackgroundColor3="Colors.Buttons.Default"
}

local ax=E("TextButton","Option",{
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,0,0,25),
AutoButtonColor=false,
Text="",
ThemeTag=aw,
Elements={
Corner=UDim.new(0,6)
},
Childs={
E("Frame","Holder",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=ar,
Elements={
ListLayout={
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,2)
},
Padding={
PaddingBottom=UDim.new(0,5),
PaddingTop=UDim.new(0,5)
}
},
Childs={as,av}
})
}
})

local ay=ax.Holder local az=function(

az, aA)
if aA then
if ab then
local aB=w(s.CurrentTheme,"Colors.Buttons.Default")
ab.Theme.BackgroundColor3="Colors.Buttons.Default"
L(ab.Button,"BackgroundColor3",aB,0.2):Play()
end

ab={
Button=ax,
Theme=aw
}
end

aw.BackgroundColor3=az
L(ax,"BackgroundColor3",w(s.CurrentTheme,az),0.2):Play()end


u(ax.MouseLeave,function()az("Colors.Buttons.Default",false)end)
u(ax.MouseEnter,function()az("Colors.Buttons.Holding",true)end)

u(av:GetPropertyChangedSignal"Text",function()
local aA=#av.Text>0

if av.Visible~=aA then
local aB=aA and 0 or 0.5
av.Visible=aA
ay.Position=UDim2.fromScale(0,aB)
ay.AnchorPoint=Vector2.new(0,aB)
end
end)

as.Text=ap
av.Text=aq or""

ax.Parent=au

return ax,as,av end local ap=function(


ap, aq)
if type(aq)~="table"then
error(`"Tab.Add{ap}[Configs]". 'table' expected, got {typeof(aq)}`,2)
end

local ar=aq[1]or aq.Name or aq.Title
local as=aq.Desc or aq.Description

assert(type(ar)=="string",`"Tab.Add{ap}.Title". 'string' expected, got {typeof(ar)}`)

if as~=nil and type(as)~="string"then
error(`"Tab.Add{ap}.Description". 'string', or 'nil' expected, got {typeof(as)}`,2)
end

return ar,as or""end local aq=function(


aq, ar)
if ar~=nil and type(ar)~="string"then
error(`"Tab.Add{aq}.Flag". 'nil', or 'string' expected, got {typeof(ar)}`)
end

return ar end local ar=function()



local ar=160

local as={
Corner=UDim.new(0,6),
Stroke={
ThemeTag={
Color="Colors.Stroke"
}
},
Gradient={
Rotation=45,
ThemeTag={
Color="Colors.Background"
}
}
}

local at=E("TextButton",OutBox,{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
Active=true,
Text=""
})

local au=E("Frame","Dropdown",at,{
Size=UDim2.fromOffset(ar,100),
Position=UDim2.fromOffset(50,50),
Elements=as,
Active=true,
ThemeTag={
BackgroundTransparency="BackgroundTransparency"
}
})

local av=E("TextButton","Search",au,{
Position=UDim2.new(1,5,0,5),
Size=UDim2.new(0,25,0,25),
AutomaticSize=Enum.AutomaticSize.X,
Active=true,
Elements=as,
Text="",
ThemeTag={
BackgroundTransparency="BackgroundTransparency"
},
Childs={
E("UIPadding",{
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
PaddingBottom=UDim.new(0,5),
PaddingTop=UDim.new(0,5)
}),
E("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal
}),
E("TextBox","SearchBox",{
Size=UDim2.fromScale(0,1),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,
PlaceholderText="Search...",
ClearTextOnFocus=false,
Text="",
Elements={
Corner=UDim.new(0,6)
},
ThemeTag={
BackgroundColor3="Colors.Stroke",
TextColor3="Colors.Text.Default",
Font="Font.ExtraBold"
}
}),
E("ImageLabel","SearchIcon",{
Size=UDim2.fromScale(1,1),
SizeConstraint=Enum.SizeConstraint.RelativeYY,
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
ThemeTag={
BackgroundColor3="Colors.Stroke",
ImageColor3="Colors.Icons",
Image="Icons.Search"
}
})
}
})

local aw=E("ScrollingFrame",au,{
Size=UDim2.new(1,-6,1,-6),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
ScrollBarThickness=3,
BackgroundTransparency=1,
BorderSizePixel=0,
CanvasSize=UDim2.new(),
ScrollingDirection=Enum.ScrollingDirection.Y,
AutomaticCanvasSize=Enum.AutomaticSize.Y,
Active=true,
ThemeTag={
OBJECTS=C,
ScrollBarImageColor3="Colors.ScrollBar"
},
Elements={
Padding={
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingTop=UDim.new(0,5),
PaddingBottom=UDim.new(0,5)
},
ListLayout={
Padding=UDim.new(0,4)
}
}
})

local ax=av.SearchIcon
local ay=av.SearchBox

local az=130

local aA=L(au,"Size",UDim2.fromOffset(ar,0),0.2)
local aB=L(ay,"Size",UDim2.new(0,az-30,1,0),0.3)
local aC=L(ay,"Size",UDim2.new(0,0,1,0),0.2)

local aD={}
local aE=false
local aF=false
local aG
local aH
local aI
local aJ
local aK

local aL=0

local aM=25
local aN=(aM*12)+10
local aO=5 local aP=function(

aP)
local aQ=K.AbsoluteSize.Y/af.Scale
return math.min((aM*math.max(aP,0.5))+10,aN,aQ/1.75)end local aQ=function()



local aQ=au.AbsolutePosition
local aR=au.AbsoluteSize

local aS=Vector2.new(p.X,p.Y)

local aT=aS.X>=aQ.X and aS.X<=(aQ.X+aR.X)
local aU=aS.Y>=aQ.Y and aS.Y<=(aQ.Y+aR.Y)

return aT and aU end local aR=function(


aR, aS)
local aT=aK.AbsolutePosition
local aU=aK.AbsoluteSize
local aV=K.AbsoluteSize
local aW=af.Scale
local aX=aP(aR)

local aY=aV.X/aW
local aZ=aV.Y/aW
local a_=aT.X/aW
local a0=aT.Y/aW
local a1=aU.X/aW
local a2=aU.Y/aW

local a3=a0+(a2/2)
local a4=a3-(aX/2)

local a5=aO
local a6=aZ-aX-aO

local a7=math.clamp(a4,a5,a6)

local a8=Vector2.new(0,0)

if a7>(aZ*0.7)then
a8=Vector2.new(0,1)
a7=math.min(a3+(aX/2),aZ-aO)
end

local a9=math.clamp(
a_,
aO,
aY-au.Size.X.Offset-(aO*2)-(av.AbsoluteSize.X/aW)
)

return Vector2.new(a9,a7),a8 end local aS=function(...)



local aS,aT=aR(...)

au.AnchorPoint=aT
au.Position=UDim2.fromOffset(aS.X,aS.Y)end local aT=function()



if not aF then return end

aF=false

ay.Text=""
aC:Play()
aC.Completed:Wait()
ay.Visible=false end local aU=function()



if aF then return end

aF=true

ay.Visible=true
aB:Play()

ay:CaptureFocus()

local aU=au.AbsoluteSize
local aV=K.AbsoluteSize
local aW=af.Scale
local aX=au.AnchorPoint

local aY=az*aW

local aZ=au.AbsolutePosition.X

local a_=aZ+aU.X+5+aY

if a_>aV.X-(aO*aW)then
local a0=(aV.X-aU.X-aY-5-(aO*aW))/aW

a0=math.max(a0,aO)

L(au,"Position",UDim2.fromOffset(a0,au.Position.Y.Offset),0.3):Play()
end end local aV=function(


aV)
if not aE then
aG=aV
at.Parent=_
return true
end end local aW=function()



if aE then return end

if aG then
aG()
aG=nil
end

task.spawn(aT)
aE=true
aA:Play()
aA.Completed:Wait()
at.Parent=nil
aE=false end local aX=function()



if ay:IsFocused()then
aL=tick()
return nil
end

if(tick()-aL)>=0.3 and not aQ()then
aW()
end end local aY=function()



for aY,aZ in aD do
aY.Parent=nil
aD[aY]=nil
end end local aZ=function(


aZ, a_)
aZ.Selected=a_

if aZ.Instance then
local a0=aZ.Instance
local a1=a0.TextLabel
local a2=a0.Frame

local a3=a_ and 0 or(aJ and 0.8 or 1)
local a4=a_ and 0 or 0.4
local a5=UDim2.fromOffset(4,a_ and 14 or 4)

if a0.Parent then
L(a2,"BackgroundTransparency",a3,0.35):Play()
L(a1,"TextTransparency",a4,0.35):Play()
L(a2,"Size",a5,0.35):Play()
else
a1.TextTransparency=a4
a2.BackgroundTransparency=a3
a2.Size=a5
end
end end local a_=function(


a_)
if ay.Visible==false or not a_ then
local a0=aI and#aI or 0
au.Size=UDim2.fromOffset(ar,aP(a0))
return nil
end

if a_ then
local a0=a_.Instance
local a1=O(ay.Text)
a0.Visible=#a1==0 or a_.SearchText:find(a1)~=nil

if a0.Visible~=false then
SEARCH_RESULT_COUNT+=1
au.Size=UDim2.fromOffset(ar,aP(SEARCH_RESULT_COUNT))
end
end end local a0=function(


a0, a1, a2, a3)
local a4=true

if a1=="+"or a1=="-"then
a4=a0.Selected==(a1=="+")
a2=a2:sub(2,-1)
end

return a4 and a3:find(a2,1,true)~=nil end local a1=function(


a1, a2)
local a3=E("TextButton",{
Size=UDim2.new(1,0,0,21),
AutoButtonColor=false,
Text="",
Elements={
Corner=UDim.new(0,4)
},
ThemeTag={
BackgroundColor3="Colors.Buttons.Default"
},
Childs={
E("Frame",{
Position=UDim2.new(0,1,0.5),
Size=UDim2.new(0,4,0,4),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0,0.5),
Elements={
Corner=UDim.new(0.5,0)
},
ThemeTag={
BackgroundColor3="Colors.Primary"
}
}),
E("TextLabel",{
Size=UDim2.fromScale(1,1),
Position=UDim2.fromOffset(10,0),
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
TextTransparency=0.4,
Text=a1.DisplayName,
TextSize=9,
ThemeTag={
Font="Font.Bold",
TextColor3="Colors.Text.Default"
}
})
}
})

local a4=0

u(a3.Activated,function()
if(tick()-a4)<0 then return end

if at.Parent and not aE then
a4=tick()+0.2
aH(a1)
end
end)

a1.SearchText=O(a1.DisplayName)
a1.Instance=a3

if a2 then
local a5=ay.Text

if#a5>0 then
local a6=string.sub(a5,1,1)
local a7=O(ay.Text)
a3.Visible=a0(a1,a6,a7,a1.SearchText)
end

a3.Parent=aw
a_(a1)
end

aZ(a1,a1.Selected)end local a2=function(


a2)
aY()
aI=a2

for a3=1,#a2 do
local a4=a2[a3]
local a5=a4.Instance

if a5==nil then
a1(a4)
a5=a4.Instance
end

a5.Parent=aw
aD[a5]=true
end

aS(#a2)
L(au,"Size",UDim2.fromOffset(ar,aP(#a2)),0.3):Play()end local a3=function()



local a3=ay.Text
local a4=string.sub(a3,1,1)
local a5=O(a3)
local a6=#a5==0
local a7=0

for a8=1,#aI do
local a9=aI[a8]
local ba=a6 or a0(a9,a4,a5,a9.SearchText)
a9.Instance.Visible=ba

if ba then
a7+=1
end
end

SEARCH_RESULT_COUNT=a7
au.Size=UDim2.fromOffset(ar,aP(a7))end


u(ad:GetPropertyChangedSignal"Visible",aX)
u(ad:GetPropertyChangedSignal"Size",aX)
u(at.MouseButton1Down,aX)
u(at.Activated,aX)

u(av.Activated,aU)
u(ay:GetPropertyChangedSignal"Text",a3)

return table.freeze{
CreateOptionTemplate=a1,
SetOptionValue=aZ,
CloseDropdown=aW,
OpenDropdown=aV,
SetOptions=a2,
Clear=aY,
SetOnClicked=function(...)
aH=...
end,
SetMultiSelect=function(...)
aJ=...
end,
SetHolder=function(...)
aK=...
end
}end


local as

local at={"W","A","S","D","Tab","Slash","Backspace","Escape","Unknown"}
local au={"MouseButton1","MouseButton2","MouseButton3"}

local av=M({"number","string","nil","boolean","table"},true)local aw=function(

aw)
if as==nil then
as=M(Enum.KeyCode:GetEnumItems())
end

return typeof(aw)=="EnumItem"and as[aw]end


function aj:GetNoSelfCall(ax)
assert(type(ax)=="string",`"Tab.GetNoSelfCall". 'string' expected, got {typeof(ax)}`)
local ay=self[ax]
assert(type(ay)=="function",`"Tab.GetNoSelfCall". '{ay}' is not a 'function'-{ax}`)

return function(...)
return ay(self,...)
end
end

function aj:AddSection(ax)
assert(ax==nil or type(ax)=="string",`"Tab.AddSection[param 1]". 'string', or 'nil' expected, got {typeof(ax)}`)
ax=ax or""

local ay=X[self]

local az=E("Frame","Option",V[self].Container,{
Size=UDim2.new(1,0,0,20),
BackgroundTransparency=1
})

local aA=E("TextLabel",az,{
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,-25,1,0),
Position=UDim2.new(0,5),
BackgroundTransparency=1,
TextSize=17,
Text=ax,
ThemeTag={
OBJECTS=ay,
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

return setmetatable({
Title=ax,

DESTROY_ELEMENT=az,
VISIBLE_ELEMENT=az,
TITLE_LABEL=aA,

Kind="Section",
Parent=self
},ak)
end

function aj:AddToggle(ax)
local ay,az=ap("Toggle",ax)
local aA=aq("Toggle",ax[4]or ax.Flag)

local aB=ax[2]or ax.Default or false
local aC=G(ax[3]or ax.Callback)

if type(aB)~="boolean"then
error(`"Tab.AddToggle.Default". 'boolean' expected, got {typeof(aB)}`,2)
end

if aA~=nil and type(ag[aA])=="number"then
aB=ag[aA]==0
end

local aD=X[self]
local aE,aF,aG=ao(self,ay,az,UDim2.new(1,-38,0,0))

local aH=E("Frame",aE,{
Size=UDim2.new(0,35,0,18),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
Elements={
Corner=UDim.new(0.5,0)
},
ThemeTag={
OBJECTS=aD,
BackgroundColor3="Colors.Stroke"
}
})

local aI=E("Frame",aH,{
BackgroundTransparency=1,
Size=UDim2.new(0.8,0,0.8,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5)
})

local aJ={
OBJECTS=aD,
BackgroundColor3="Colors.OnPrimary"
}

local aK=E("Frame",aI,{
Size=UDim2.new(0,12,0,12),
Position=UDim2.new(0,0,0.5),
AnchorPoint=Vector2.new(0,0.5),
Elements={
Corner=UDim.new(0.5,0)
},
ThemeTag=aJ
})local aL=function(

aL)
if aA~=nil then ag[aA]=aL and 0 or 1 end
I(aC,aL)

local aM=UDim2.new(aL and 1 or 0,0,0.5,0)
local aN=Vector2.new(aL and 1 or 0,0.5)
local aO=aL and"Colors.Primary"or"Colors.OnPrimary"
local aP=w(s.CurrentTheme,aO)

aJ.BackgroundColor3=aO

if self.Selected then
L(aK,"Position",aM,0.25):Play()
L(aK,"AnchorPoint",aN,0.25):Play()
L(aK,"BackgroundColor3",aP,0.25):Play()
else
aK.Position=aM
aK.AnchorPoint=aN
aK.BackgroundColor3=aP
end end


local aM=am.Toggle.new(self,aE,aF,aG,aL,aC)

aM.Value=aB

task.defer(aL,aB)

local aN=0

u(aE.Activated,function()
if(tick()-aN)<0 then return end

aN=tick()+0.2
aM:SetValue(not aM.Value)
end)

return aM
end

function aj:AddButton(ax)
local ay,az=ap("Button",ax)
local aA=G(ax[2]or ax.Callback)
local aB=ax.Debounce or ax.Cooldown

local aC=X[self]
local aD,aE,aF=ao(self,ay,az,UDim2.new(1,-20,0,0))

local aG=E("ImageLabel",aD,{
Size=UDim2.new(0,14,0,14),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
ThemeTag={
OBJECTS=aC,
Image="Icons.Button"
}
})

local aH=0

u(aD.Activated,function()
if aB~=nil and(tick()-aH)<0 then return end

if aB~=nil then
aH=tick()+aB
end

I(aA)
end)

return setmetatable({
CALLBACKS=aA,
DESTROY_ELEMENT=aD,
VISIBLE_ELEMENT=aD,
TITLE_LABEL=aE,
DESCRIPTION_LABEL=aF,

Title=ay,
Description=az,

Parent=self,
Kind="Button"
},ak)
end

function aj:AddTextBox(ax)
local ay,az=ap("TextBox",ax)
local aA=aq("TextBox",ax[4]or ax.Flag)

local aB=ax[2]or ax.Default
local aC=G(ax[3]or ax.Callback)

local aD=ax.Placeholder or ax.PlaceholderText
local aE=ax.ClearOnFocus or ax.ClearTextOnFocus

if aB~=nil and type(aB)~="string"then
error(`"Tab.AddTextBox.Default". 'string', or 'nil' expected, got {typeof(aB)}`,2)
end

if aA and type(ag[aA])=="string"then
aB=ag[aA]
end

local aF=X[self]
local aG,aH,aI=ao(self,ay,az,UDim2.new(1,-150,0,0))

local aJ=E("Frame",aG,{
Size=UDim2.new(0,150,0,18),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
ThemeTag={
OBJECTS=aF,
BackgroundColor3="Colors.Stroke"
},
Elements={
Corner=UDim.new(0,4)
}
})

local aK=E("TextBox",aJ,{
Size=UDim2.new(0.85,0,0.85,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=1,
TextScaled=true,
Active=true,
Text="",
PlaceholderText=B.TEXTBOX.PLACEHOLDER_TEXT,
ThemeTag={
OBJECTS=aF,
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aL={
OBJECTS=aF,
Image="Icons.TextBox",
ImageColor3="Colors.Icons"
}

local aM=E("ImageLabel",aJ,{
Size=UDim2.new(0,12,0,12),
Position=UDim2.new(0,-5,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
ThemeTag=aL
})

if aB~=nil then
aK.Text=aB
end

if aE~=nil then
aK.ClearTextOnFocus=aE
end

if aD~=nil then
aK.PlaceholderText=aD
end

local aN=am.TextBox.new(self,aH,aI,aG,aK,aC)local aO=function(

aO)
aL.ImageColor3=aO
L(aM,"ImageColor3",w(s.CurrentTheme,aO),0.5):Play()end


if aA~=nil then
u(aK:GetPropertyChangedSignal"Text",function()
ag[aA]=aK.Text
end)
end

u(aK.Focused,function()
aO"Colors.Primary"
end)

u(aK.FocusLost,function()
aO"Colors.Icons"
local aP=aN.TEXTBOX_TEXT_FILTER

if aP then
local aQ=aP(aK.Text)
if type(aQ)=="string"then
aK.Text=aQ
end
end

I(aC,aK.Text)
end)

u(aG.Activated,function()
aK:CaptureFocus()
end)

return aN
end

function aj:AddSlider(ax)
local ay,az=ap("Slider",ax)
local aA=aq("Slider",ax[7]or ax.Flag)

local aB=ax[2]or ax.Min
local aC=ax[3]or ax.Max
local aD=ax[4]or ax.Increment
local aE=ax[5]or ax.Default
local aF=G(ax[6]or ax.Callback)

if aD~=nil and type(aD)~="number"then
error(`"Tab.AddSlider.Increment". 'number', or 'nil' expected, got {typeof(aD)}`,2)
end

if aE~=nil and type(aE)~="number"then
error(`"Tab.AddSlider.Default". 'number', or 'nil' expected, got {typeof(aE)}`,2)
end

assert(type(aB)=="number",`"Tab.AddSlider.Min", 'number' expected, got {typeof(aB)}`)
assert(type(aC)=="number",`"Tab.AddSlider.Max", 'number' expected, got {typeof(aC)}`)

local aG=X[self]
local aH=V[self].Container

local aI,aJ,aK=ao(self,ay,az,UDim2.new(0.55,0,0,0))

if aE==nil then
aE=aB
end

if aD==nil then
aD=1
end

if aA~=nil and type(ag[aA])=="number"then
aE=ag[aA]
end

local aL=E("TextButton",aI,{
Size=UDim2.new(0.45,0,1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
AutoButtonColor=false,
BackgroundTransparency=1,
Text=""
})

local aM=E("Frame",aL,{
Size=UDim2.new(1,-20,0,6),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
OBJECTS=aG,
BackgroundColor3="Colors.Stroke"
},
Elements={
Corner=UDim.new(0.5,0)
}
})

local aN=E("Frame",aM,{
Size=UDim2.fromScale(0,1),
BorderSizePixel=0,
ThemeTag={
OBJECTS=aG,
BackgroundColor3="Colors.Primary"
},
Elements={
Corner=UDim.new(0.5,0)
}
})

local aO=E("Frame",aM,{
Size=UDim2.new(0,6,0,12),
BackgroundColor3=Color3.fromRGB(220,220,220),
Position=UDim2.fromScale(0,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=0.2,
Elements={
Corner=UDim.new(0,6)
}
})

local aP=E("TextLabel",aL,{
Size=UDim2.new(0,50,0,14),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(0,-1,0.5,0),
BackgroundTransparency=1,
TextSize=12,
TextXAlignment=Enum.TextXAlignment.Right,
ThemeTag={
OBJECTS=aG,
TextColor3="Colors.Text.Default",
Font="Font.SliderValue"
}
})

local aQ=E("UIScale",aP)

local aR=am.Slider.new(self,aI,aJ,aK,aF)

aR.Min=aB
aR.Max=aC
aR.Increment=aD local aS=function(

aS)
return(aS-aB)/(aC-aB)end local aT=function(


aT)
return(aT*(aC-aB))+aB end local aU=function(


aU)
return math.round(aU/aD)*aD end local aV=function(


aV, aW)
if aV==aR.Value then return end

if aA~=nil then
ag[aA]=aV
end

task.defer(I,aF,aV)
aR.Value=aV

local aX=UDim2.fromScale(aW,0.5)
local aY=UDim2.fromScale(aW,1)

aP.Text=tostring(math.floor(aV*1000)/1000)

if self.Selected then
L(aO,"Position",aX,0.3):Play()
L(aN,"Size",aY,0.3):Play()
else
aO.Position=aX
aN.Size=aY
end end local aW=function(


aW)
local aX=math.clamp(aU(aW),aB,aC)
aV(aX,aS(aX))end


aR.WHEN_VALUE_CHANGED=aW local aX=function(

aX, aY)
local aZ=(p.X-aX.X)/aY.X
local a_=math.clamp(aZ,0,1)
local a0=aT(a_)
local a1=aU(a0)
local a2=math.clamp(a1,aB,aC)
aV(a2,aS(a2))end


local aY=Random.new()
aW(aE)

u(aL.MouseButton1Down,function()
if A~=false then return end

L(aO,"BackgroundTransparency",0,0.3):Play()
aH.ScrollingEnabled=false
A=true

local aZ=aM.AbsolutePosition
local a_=aM.AbsoluteSize

while i:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
aX(aZ,a_)
task.wait()
end

A=false
L(aO,"BackgroundTransparency",0.2,0.3):Play()
aH.ScrollingEnabled=true
end)

u(aP:GetPropertyChangedSignal"Text",function()
if not self.Selected then return end

aQ.Scale=0.3
L(aQ,"Scale",1.2,0.1):Play()

local aZ=L(aP,"Rotation",aY:NextNumber(-7.5,7.5),0.15)
aZ:Play()
aZ.Completed:Wait()

L(aQ,"Scale",1,0.2):Play()
L(aP,"Rotation",0,0.1):Play()
end)

return aR
end

function aj:AddDiscordInvite(ax)
local ay,az=ap("DiscordInvite",ax)
local aA=ax.Icon or ax.Image or ax.Logo
local aB=ax.Banner or ax.BannerColor
local aC=ax.Online or ax.MembersOnline
local aD=ax.Members or ax.TotalMembers
local aE=ax.Invite or ax.Link

assert(type(aE)=="string",`"Tab.AddDiscordInvite.Invite". 'string' expected, got {typeof(aE)}`)

if aB~=nil and typeof(aB)~="Color3"and type(aB)~="string"then
error(`"Tab.AddDiscordInvite.Banner". 'nil', 'Color3', or 'string' expected, got {typeof(aB)}`,2)
end

if aC~=nil and type(aC)~="number"then
error(`"Tab.AddDiscordInvite.Online". 'number' expected, got {typeof(aC)}`,2)
end

if aD~=nil and type(aD)~="number"then
error(`"Tab.AddDiscordInvite.Members". 'nil', or 'number' expected, got {typeof(aD)}`,2)
end

if K.ZIndexBehavior~=Enum.ZIndexBehavior.Sibling then
K.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
end

local aF=X[self]
local aG=V[self].Container

local aH=E("Frame","Option",aG,{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,148)
})

local aI=E("CanvasGroup",aH,{
Size=UDim2.new(0,178,1,-15),
Position=UDim2.new(0,5,1,0),
AnchorPoint=Vector2.new(0,1),
ClipsDescendants=true,
Elements={
Corner=UDim.new(0,9),
Stroke={
ThemeTag={
Color="Colors.Border.Default"
}
}
},
ThemeTag={
OBJECTS=aF,
BackgroundColor3="Colors.Buttons.Default"
}
})

local aJ=E("ImageLabel",aI,{
BackgroundColor3=Color3.new(1,1,1),
Size=UDim2.fromScale(1,0.28),
BackgroundTransparency=1
})

local aK=E("TextLabel",aH,{
Position=UDim2.fromOffset(5,0),
Size=UDim2.new(1,0,0,15),
TextColor3=Color3.fromRGB(40,150,255),
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
TextSize=9,
Text=aE,
ThemeTag={
OBJECTS=aF,
TextColor3="Colors.Link",
Font="Font.Medium"
}
})

local aL=E("ImageLabel",aI,{
Size=UDim2.fromOffset(33,33),
Position=UDim2.new(0,10,0.28,0),
AnchorPoint=Vector2.new(0,0.5),
Image=aA,
ThemeTag={
OBJECTS=aF,
BackgroundColor3="Colors.Buttons.Default"
},
Elements={
Corner=UDim.new(0,8),
Stroke={
Thickness=2.2,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
OBJECTS=aF,
Color="Colors.Buttons.Default"
}
}
}
})

local aM=E("TextLabel",aI,{
Size=UDim2.new(1,-10,0,10),
Position=UDim2.new(0,10,0.44,0),
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
TextSize=11,
Text=ay,
ThemeTag={
OBJECTS=aF,
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aN

if aC or aD then
aN=E("Frame",aI,{
Size=UDim2.new(1,-10,0,9),
Position=UDim2.new(0,0,0.52,0),
BackgroundTransparency=1,
Elements={
Padding={
PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,10)
},
ListLayout={
HorizontalAlignment=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Center,
FillDirection=Enum.FillDirection.Horizontal,
Padding=UDim.new(0,4),
}
}
})local aO=function(

aO, aP)
return E("Frame",aN,{
Size=UDim2.fromScale(0,1),
AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,
Childs={
E("Frame",{
Size=UDim2.fromOffset(3,3),
Position=UDim2.new(0,5,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=aO,
Elements={
Corner=UDim.new(1,0)
}
}),
E("TextLabel",{
Size=UDim2.new(0,0,1,0),
Position=UDim2.new(0,12,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,
TextSize=7,
Text=aP,
ThemeTag={
OBJECTS=aF,
TextColor3="Colors.Text.Darker",
Font="Font.Normal"
}
})
}
})end


if aC~=nil then
aO(Color3.fromRGB(67,181,129),P(aC).." Online")
end
if aD~=nil then
aO(Color3.fromRGB(86,101,105),P(aD).." Members")
end
end

local aO=E("TextLabel",aI,{
Size=UDim2.new(1,-50,0,8),
Position=UDim2.new(0,10,aN and 0.6 or 0.56,0),
TextXAlignment=Enum.TextXAlignment.Left,
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
TextSize=8,
Text=az or"",
TextWrapped=true,
ThemeTag={
OBJECTS=aF,
TextColor3="Colors.Text.Darker",
Font="Font.Medium"
}
})

local aP=E("Frame",aI,{
Size=UDim2.new(1,0,0.28,0),
Position=UDim2.fromScale(0,1),
AnchorPoint=Vector2.new(0,1),
BorderSizePixel=0,
ThemeTag={
OBJECTS=aF,
BackgroundColor3="Colors.Buttons.Default"
}
})

if#aO.Text>0 then
aP.Size=UDim2.new(1,0,0.42,0)

E("UIGradient",aP,{
Rotation=-90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.00,0.00),
NumberSequenceKeypoint.new(0.60,0.00),
NumberSequenceKeypoint.new(1.00,1.00)
}
})
end

local aQ=E("TextButton",aP,{
Position=UDim2.new(0.5,0,1,-9),
Size=UDim2.new(1,-18,0,18),
AnchorPoint=Vector2.new(0.5,1),
Text="Go to Server",
Elements={
Corner=UDim.new(0.5,0)
},
ThemeTag={
OBJECTS=aF,
BackgroundColor3="Colors.JoinButton",
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aR=0

u(aQ.Activated,function()
if(tick()-aR)<0 then return end

aR=tick()+5
local aS=aQ.Text
aQ.Text="Copied to Clipboard!"
setclipboard(aE)
task.wait(4)
aQ.Text=aS
end)

if type(aB)=="string"then
aJ.ScaleType=Enum.ScaleType.Crop
aJ.Image=aB
elseif typeof(aB)=="Color3"then
aJ.BackgroundTransparency=0
E("UIGradient",aJ,{
Rotation=-15,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,aB),
ColorSequenceKeypoint.new(1,aB:Lerp(Color3.new(1,1,1),0.2))
}
})
end

return setmetatable({
DESTROY_ELEMENT=aH,
VISIBLE_ELEMENT=aH,

Title=ay,
Description=az,
DESCRIPTION_LABEL=aO,
TITLE_LABEL=aM,

Kind="DiscordInvite",
Parent=self
},ak)
end

function aj:AddParagraph(ax,ay)
assert(type(ax)=="string",`"Tab.AddParagraph[param 1]". 'string' expected, got {typeof(ax)}`)

if ay~=nil and type(ay)~="string"then
error(`"Tab.AddParagraph[param 2]". 'string', or 'nil' expected, got {typeof(ay)}`,2)
end

local az=X[self]
local aA,aB,aC=ao(self,ax,ay,UDim2.new(1,0,0,0))

return setmetatable({
DESTROY_ELEMENT=aA,
VISIBLE_ELEMENT=aA,
TITLE_LABEL=aB,
DESCRIPTION_LABEL=aC,

Title=ax,
Description=ay,

Parent=self,
Kind="Paragraph"
},ak)
end

function aj:AddDropdown(ax)
local ay,az=ap("Dropdown",ax)
local aA=aq("Dropdown",ax[5]or ax.Flag)

local aB=ax[2]or ax.Options
local aC=ax[3]or ax.Default
local aD=G(ax[4]or ax.Callback)
local aE=ax.MultiSelect

if aC~=nil and type(aC)~="table"and type(aC)~="string"then
error(`"Tab.AddDropdown.Default". 'string', 'table', or 'nil' expected, got {typeof(aC)}`,2)
end

if aB~=nil and type(aB)~="table"then
error(`"Tab.AddDropdown.Options". 'table', or 'nil' expected, got {typeof(aB)}`,2)
end

if aE~=nil and type(aE)~="boolean"then
error(`"Tab.AddDropdown.MultiSelect". 'boolean', or 'nil' expected, got {typeof(aE)}`,2)
end

if aA and type(ag[aA])==(aE and"table"or"string")then
aC=ag[aA]
end

local aF=X[self]
local aG,aH,aI=ao(self,ay,az,UDim2.new(1,-150,0,0))

local aJ=E("Frame",aG,{
Size=UDim2.new(0,150,0,18),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
Elements={
Corner=UDim.new(0,4)
},
ThemeTag={
OBJECTS=aF,
BackgroundColor3="Colors.Stroke"
}
})

local aK=E("TextLabel",aJ,{
Size=UDim2.new(0.85,0,0.85,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=1,
TextScaled=true,
Text="...",
ThemeTag={
OBJECTS=aF,
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aL={
OBJECTS=aF,
Image="Icons.Dropdown.Open",
ImageColor3="Colors.Icons"
}

local aM=E("ImageLabel",aJ,{
Size=UDim2.new(0,15,0,15),
Position=UDim2.new(0,-5,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
ThemeTag=aL
})

local aN=am.Dropdown.new(self,aG,aH,aI,aD)

local aO
local aP=false
local aQ=false

local aR={}
local aS={}
local aT={}
local aU={}

aN.DROPDOWN_OPTIONS=aT
aN.Opened=aQ local aV=function(

aV, aW)
aL.ImageColor3=aV
aL.Image=aW

L(aM,"ImageColor3",w(s.CurrentTheme,aV),0.35):Play()
aM.Image=w(s.CurrentTheme,aW)end local aW=function(


aW)
aQ=aW
aN.Opened=aW

local aX=aW and"Colors.Primary"or"Colors.Icons"
local aY=aW and"Icons.Dropdown.Close"or"Icons.Dropdown.Open"
aV(aX,aY)end local aX=function()



aW(false)end local aY=function()



local aY={}
for aZ,a_ in aS do
if not a_ then continue end
aY[#aY+1]=aZ
end
return aY end local aZ=function(


aZ)
local a_=type(aZ)=="table"and table.concat(aZ,", ")or(aZ or"")

if#a_>=100 then
a_=a_:sub(1,97).."..."
end

aK.Text=#a_~=0 and a_ or"..."end local a_=function()



aP=false

local a_=aE and aY()or aO and aO.Name
I(aD,aE and aS or a_)
aZ(a_)

if aA~=nil then
ag[aA]=a_
end end local a0=function()



if not aP then
aP=true
task.delay(0.1,a_)
end end local a1=function(


a1)
if aE then
local a2=not a1.Selected
Z.SetOptionValue(a1,a2)
aS[a1.Name]=a2
else
if aO==a1 then
return nil
elseif aO~=nil then
Z.SetOptionValue(aO,false)
end

aO=a1
Z.SetOptionValue(a1,true)
end

a0()end local a2=function(


a2)
a2=tostring(a2)
if aU[a2]then return end

local a3={
Name=a2,
DisplayName=a2,
Selected=false
}

if aE and aS[a2]==nil then
aS[a2]=false
end

aU[a2]=a3
aT[#aT+1]=a3
return a3 end local a3=function(


a3)
if aQ==a3 then return end

if not Z then
Z=ar()
end

if a3 then
if not Z.OpenDropdown(aX)then return end

Z.SetHolder(aJ)
Z.SetMultiSelect(aE)
Z.SetOnClicked(a1)
Z.SetOptions(aT)
else
Z.CloseDropdown()
end

aW(a3)end local a4=function(


a4, a5)
if a5 and type(a4)=="boolean"then
return a4==true and aT[a5]
end

return if type(a4)=="number"then aT[a4]else aU[tostring(a4)]end local a5=function(


a5)
a5.Selected=true

if aE then
aS[a5.Name]=true
else
aO=a5
end end local a6=function(...)



local a6=a4(...)

if a6 then
a5(a6)
elseif aE and type(...)=="string"then
aR[select(1,...)]=true
end end local a7=function()



if not aC then return end

for a7=1,(aE and#aC or 1)do
a6(aC[a7],a7)
end end local a8=function(


a8)
local a9=table.find(aT,a8)

if a9 then
table.remove(aT,a9)
end

if a8.Instance then
a8.Instance:Destroy()
end

aU[a8.Name]=nil end local a9=function(


a9)
if aE then
local ba=a9.Name
return(aS[ba]or aR[ba])==true
else
return aO and aO.Name==a9.Name
end end


aN.ADD_DROPDOWN_OPTION=function(ba)
if type(ba)=="table"then
for bb=1,#ba do
aN:Add(ba[bb])
end

return nil
end

local bb=a2(ba)

if bb then
if aN.Opened then
Z.CreateOptionTemplate(bb,true)
end

if a9(bb)then
a5(bb)

if bb.Instance then
Z.SetOptionValue(bb,bb.Selected)
end
end

a0()
end
end

aN.REMOVE_DROPDOWN_OPTION=function(ba)
local bb=aU[tostring(ba)]
if bb then
a8(bb)
end
end

aN.CLEAR_DROPDOWN=function()
for ba=#aT,1,-1 do
local bb=aT[ba]
if bb.Instance then
bb.Instance:Destroy()
end

aU[bb.Name]=nil
aT[ba]=nil
end

if aN.Opened then
Z.Clear()
end
end

do
if aB then
for ba=1,#aB do
a2(aB[ba])
end
end

if type(aC)=="table"then
a7()
elseif type(aC)=="string"or type(aC)=="number"then
local ba=a4(aC)

if ba then
a5(ba)
end
end

if aE then
local ba=aY()
task.defer(I,aD,aS)
aZ(ba)
else
local ba=aO
local bb=ba and ba.Name or""
task.defer(I,aD,bb)
aZ(bb)
end
end

u(aG.Activated,function()
a3(not aQ)
end)

return aN
end

function aj:Destroy()
assert(type(self)=="table"and self.IS_A_TAB,`"Tab.Destroy". {tostring(self)} is not a tab`)
if self.IS_DESTROYED then return end
local ax=table.find(U,self)
assert(ax,`"Tab.Destroy". failed to destroy '{self.Title}'`)

table.remove(U,ax)

for ay,az in V[self]do
az:Destroy()
end

X[self]:destroy()

V[self]=nil
X[self]=nil

setmetatable(self,nil)
end

function aj:SetVisible(ax)
assert(type(ax)=="boolean",`"Tab.SetVisible[param 1]". 'boolean' extected, got {typeof(ax)}`)

for ay,az in V[self]do
az.Visible=ax
end
end

function aj:Select()
if ae==self then
return nil
end

if ae then
W[ae].Unselect()
end

ae=self
W[ae].Select()
end

function ak:SetTitle(ax)
assert(type(ax)=="string",`"Option.SetTitle". 'string' expected, got {typeof(ax)}`)
assert(self.TITLE_LABEL,`"Option.SetTitle". cannot change this option name {self.KIND}:{self.Title}`)

self.TITLE_LABEL.Text=ax
self.Title=ax
return self
end

function ak:SetDescription(ax)
assert(ax==nil or type(ax)=="string",`"Option.SetDescription". 'string', or 'nil' expected, got {typeof(ax)}`)
assert(self.DESCRIPTION_LABEL,`"Option.SetDescription". cannot change this option description {self.KIND}:{self.Title}`)

self.DESCRIPTION_LABEL.Text=ax
self.Description=ax
return self
end

function ak:SetVisible(ax)
assert(typeof(self.VISIBLE_ELEMENT)=="Instance",`"Option.SetVisible". cannot change this option visibility {self.KIND}:{self.Title}`)
assert(type(ax)=="boolean",`"Option.SetVisible". 'boolean' expected, got {typeof(ax)}`)

self.VISIBLE_ELEMENT.Visible=ax
end

function ak:Destroy()
assert(typeof(self.DESTROY_ELEMENT)=="Instance",`"Option.Destroy". cannot destroy this option {self.KIND}:{self.Title}`)

self.DESTROY_ELEMENT:Destroy()
setmetatable(self,nil)

self.Destroyed=true
end

function ak:AddCallback(ax)
assert(self.CALLBACKS,"\"Option.AddCallback\". cannot add callback to this option.")
assert(type(ax)=="function",`"Option.AddCallback[param 1]". 'function' expected, got {typeof(ax)}`)

table.insert(self.CALLBACKS,ax)
return self
end

ak.NewCallback=ak.AddCallback
ak.SetContent=ak.SetDescription
ak.SetDesc=ak.SetDescription

function al:CreateMobileMinimizer(ax)
local ay=E("ImageButton",K,{
Size=UDim2.fromOffset(35,35),
Position=UDim2.fromScale(0.17,0.28),
AnchorPoint=Vector2.new(0.5,0.5),
AutoButtonColor=false,
ThemeTag={
BackgroundColor3="Colors.Buttons.Default"
}
})

u(ay.Activated,function()
ai:Minimize()
end)

ax.Elements={}

if ax.Corner then
ax.Elements.Corner=ax.Corner
ax.Corner=nil
end

if ax.Stroke then
ax.Elements.Stroke=ax.Stroke
ax.Stroke=nil
end

D.Draggable(ay,af,0.5)
D.SetProperties(ay,ax)

return ay
end

function al:SetKeyCode(ax)
assert(aw(ax),`"Minimizer.SetKeyCode[param 1]". 'KeyCode' expected, got {typeof(ax)}`)

self.KeyCode=ax
end

function ai:SelectTab(ax)
local ay=type(ax)=="number"and U[ax]

if type(ax)=="table"and ax.IS_A_TAB then
ay=ax
end

if ay then
ay:Select()
elseif not ay then
assert(type(ax)=="number",`"Window.SelectTab" number or tab expected, got {typeof(ax)}`)
assert(ax>0,`"Window.SelectTab" the number must be greater than 0, value: {ax}`)
assert(ax==math.floor(ax),`"Winow.SelectTab" floor number expected, got {ax}`)

self.SelectedTab=ax
end
end

function ai:Minimize()
ad.Visible=not ad.Visible
end

function ai:MakeTab(ax)
local ay=ax[1]or ax.Name or ax.Title
local az=ax[2]or ax.Icon or ax.Image

assert(type(ay)=="string",`"Tab.Title" 'string' expected, got {typeof(ay)}`)
assert(az==nil or type(az)=="string",`"Tab.Icon" 'string' expected, got {typeof(az)}`)

local aA=setmetatable({
Selected=self.SelectedTab==#U+1,
Icon=s:GetIconByName(az),
Title=ay,

Parent=self,
IS_A_TAB=true
},aj)

local aB=self:GetElements()
local aC=aB.TabsContainer
local aD=aB.ContainerHolder

local aE,aF,aG=an(self,aA,aC)

local aH=L(aF,"Size",UDim2.new(1,0,1,0),0.3)
local aI=UDim2.new(1,0,1,150)

local aJ=0.45

local aK={
L(aG,"BackgroundTransparency",0,aJ),
L(aG,"Size",UDim2.fromOffset(4,13),aJ)
}

local aL={
L(aG,"BackgroundTransparency",1,aJ),
L(aG,"Size",UDim2.fromOffset(4,4),aJ)
}

local aM=C:new()
X[aA]=aM local aN=function(

aN)
for aO=1,#aN do
aN[aO]:Play()
end end local aO=function()



aN(aK)
aA.Selected=true
aM:changeRendering(true)
aM:update()
aF.Parent=aD
aF.Size=aI
aH:Play()end local aP=function()



aN(aL)
aA.Selected=false
aF.Parent=nil
aM:changeRendering(false)end


W[aA]=table.freeze{
Unselect=aP,
Select=aO
}

V[aA]=table.freeze{
SelectTabButton=aE,
Container=aF
}

table.insert(U,aA)

u(aE.Activated,function()
aA:Select()
end)

if aA.Selected then
aA:Select()
end

return aA
end

function ai:StartWindow(ax)
local ay=ax.MinimizeButton
local az=ax.MainFrame
local aA=ax.Resizers
local aB=ax.TopBar

local aC=ax.SubTitle
local aD=ax.Title

_=ax.Dropdowns
ad=ax.MainFrame
af=ax.UIScale
ag=ax.Flags

local aE=az.Size
local aF=0

function ai:MinimizeButton()
if(tick()-aF)<0 then
return false
end

if self.Minimized then
ay.Image="rbxassetid://10734896206"
L(az,"Size",aE,0.25):Play()
else
aE=az.Size
ay.Image="rbxassetid://10734924532"
L(az,"Size",UDim2.fromOffset(az.Size.X.Offset,aB.Size.Y.Offset),0.25):Play()
end

for aG,aH in aA do
aH.Visible=self.Minimized
end

self.Minimized=not self.Minimized
aF=tick()+0.5

return true
end

function ai:GetTitle()
return aD.Text
end

function ai:GetSubTitle()
return aC.Text
end

function ai:SetTitle(aG)
assert(type(aG)=="string",`"Window.SetTitle". 'string' expected, got {typeof(aG)}`)
assert(#aG>0,"\"Window.SetTitle\". the new 'Title' is too short.")

aD.Text=aG
end

function ai:SetSubTitle(aG)
assert(type(aG)=="string",`"Window.SetSubTitle". 'string' expected, got {typeof(aG)}`)
assert(#aG>0,"\"Window.SetSubTitle\". the new 'SubTitle' is too short.")

aC.Text=aG
end

Y=E("Frame",K,{
Size=UDim2.new(0,280,1,0),
Position=UDim2.fromScale(1,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
Elements={
Padding={
PaddingBottom=UDim.new(0,20)
},
ListLayout={
HorizontalAlignment=Enum.HorizontalAlignment.Center,
VerticalAlignment=Enum.VerticalAlignment.Bottom,
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,20)
}
}
})

ac=E("TextButton","OutBox",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0.3,
AutoButtonColor=false,
Text="",
ThemeTag={
BackgroundColor3="Colors.Buttons.Default"
},
Childs={
az:FindFirstChildOfClass"UICorner":Clone(),
E("Frame","Template",{
Size=UDim2.new(0.35,60,0.20,80),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
Elements={
Corner=UDim.new(0,6),
Gradient={
Rotation=45,
ThemeTag={
Color="Colors.Background"
}
}
},
Childs={
E("TextLabel","Title",{
Size=UDim2.new(1,-20,0,20),
TextTruncate=Enum.TextTruncate.AtEnd,
TextSize=15,
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=1,
ThemeTag={
Font="Font.ExtraBold",
TextColor3="Colors.Text.Default"
}
}),
E("TextLabel","Description",{
Position=UDim2.new(0.5,0,0,46),
Size=UDim2.new(1,-20,0,0),
AnchorPoint=Vector2.new(0.5,0),
TextWrapped=true,
TextSize=11,
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
ThemeTag={
TextColor3="Colors.Text.Darker",
Font="Font.Medium"
}
}),
E("Frame","Options",{
Size=UDim2.new(1,-20,0.15,18),
Position=UDim2.new(0.5,0,1,-10),
AnchorPoint=Vector2.new(0.5,1),
BackgroundTransparency=1,
Elements={
Padding={
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,30),
PaddingTop=UDim.new(0,30)
},
ListLayout={
HorizontalAlignment=Enum.HorizontalAlignment.Right,
VerticalAlignment=Enum.VerticalAlignment.Center,
FillDirection=Enum.FillDirection.Horizontal
}
}
})
}
})
}
})

ac.Template:SetAttribute("OriginalSize",ac.Template.Size)

u(ac.Activated,function()
if aa~=nil and not aa.Closing and not aa.Closed then
aa:Close()
end
end)

ai.StartWindow=nil
end

function ai:DeleteFlags()
return ag()
end

function ai:SetFlag(ax,ay)
assert(type(ax)=="string",`"Window.SetFlag[param 1]". 'string' expected, got {typeof(ax)}`)

if av[typeof(ay)]~=true then
local az={}

for aA,aB in av do
table.insert(az,aA)
end

return error(`"Window.SetFlag[param 2]". '{table.concat(az,"', '")}' expected, got {typeof(ay)}`,2)
end

ag[ax]=ay
end

function ai:GetFlag(ax)
return ag[ax]
end

function ai:ReadFile(ax)
assert(type(ax)=="string",`"Window.ReadFile[param 1]". 'string' expected, got {typeof(ax)}`)
ax=`{self.ScriptFolder}/{ax}`

if f~=nil and(isfile==nil or not isfile(ax))then
return f(ax)
end
end

function ai:WriteFile(ax,ay)
assert(type(ax)=="string",`"Window.WriteFile[param 1]". 'string' expected, got {typeof(ax)}`)
ax=`{self.ScriptFolder}/{ax}`

if ay~=nil and type(ay)~="string"then
error(`"Window.WriteFile[param 2]". 'string', or 'nil' expected, got {typeof(ay)}`,2)
end

if ay==nil then
if c~=nil then
c(`{self.ScriptFolder}/{ax}`)
return true
end
else
if e~=nil then
z(`{self.ScriptFolder}/{ax}`)
return true
end
end

return false
end

function ai:NewMinimizer(ax)
local ay=type(ax)=="table"and(ax[1]or ax.KeyCode)or ax

if not aw(ay)then
error(`"Window.NewMinimizer.KeyCode". 'KeyCode' expected, got {typeof(ay)}`,2)
end

local az=setmetatable({
KeyCode=ay
},al)

u(i.InputBegan,function(aA)
if aA.KeyCode==az.KeyCode then
ai:Minimize()
end
end)

return az
end

function ai:Dialog(ax)
if self.Minimized then
while not self:MinimizeButton()do task.wait()end
end

if aa then
aa:Close(true)
end

local ay=ax.Title or ax.Name
local az=ax.Content or ax.Description
local aA=ax.Options

assert(type(ay)=="string",`"Window.Dialog.Title". 'string' expected, got {typeof(ay)}`)
assert(type(az)=="string",`"Window.Dialog.Content". 'string' expected, got {typeof(az)}`)
assert(type(aA)=="table",`"Window.Dialog.Options". 'table' expected, got {typeof(aA)}`)
assert(#aA>0,"\"Window.Dialog.Options\". requires one or more options.")local aB=function()


local aB=ac.Template
local aC=aB.Description
local aD=aB.Title

local aE=aB:GetAttribute"OriginalSize"
local aF=UDim2.new(aE.X.Scale*1.2,aE.X.Offset,aE.Y.Scale*1.2,aE.Y.Offset)

aB.Size=aF
ac.Parent=ad
aC.Text=az
aD.Text=ay

L(aB,"Size",aE,0.3):Play()

local aG=am.Dialog.new(aC,aD)
aG.NEW_SIZE=aF
aG.TEMPLATE=aB

for aH,aI in aB.Options:GetChildren()do
if aI:IsA"GuiObject"then
aI:Destroy()
end
end

for aH=#aA,1,-1 do
aG:NewOption(aA[aH])
end

return aG end


aa=aB()
return aa
end

function ai:SetNotifyDefaultIcon(ax)
assert(type(ax)=="string",`"Window.SetNotifyDefaultIcon[param 1]". 'string' expected, got {typeof(ax)}`)

ah=ax
end

function ai:Notify(ax)
if type(ax)~="table"then
ax={}
end

local ay=ax[1]or ax.Name or ax.Title
local az=ax[2]or ax.Content
local aA=ax[3]or ax.Icon or ax.Image
local aB=ax[4]or ax.Duration or ax.Countdown or ax.Time

if self.NOTIFICATION_GROUP then
if aB==nil then aB=self.Duration end
if az==nil then az=self.Content end
if ay==nil then ay=self.Title end
if aA==nil then aA=self.Icon end
end

assert(type(ay)=="string",`"Window.Notify.Title". 'string' expected, got {typeof(ay)}`)
assert(type(az)=="string",`"Window.Notify.Content". 'string' expected, got {typeof(ay)}`)
assert(aA==nil or type(aA)=="string",`"Window.Notify.Icon". 'nil' or 'string' expected, got {typeof(aA)}`)

if aB~=nil and type(aB)~="number"then
error(`"Window.Notify.Time". 'number', or 'nil' expected, got {typeof(aB)}`,2)
elseif aB==nil then
aB=5
end

local aC=E("Frame","Notification",Y,{
Size=UDim2.new(0.85,0,0,60),
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.Y
})

local aD=E("TextButton",aC,{
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.fromScale(1,1),
AutoButtonColor=false,
Text="",
ThemeTag={
BackgroundTransparency="BackgroundTransparency"
},
Elements={
Corner=UDim.new(0,9),
Gradient={
Rotation=45,
ThemeTag={
Color="Colors.Background"
}
}
}
})

local aE=E("UIScale",aC)

local aF=E("Frame","Holder",aD,{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Elements={
ListLayout={
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,4)
},
Padding={
PaddingBottom=UDim.new(0,8),
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,40)
}
}
})

local aG=E("TextLabel",aF,{
Size=UDim2.new(1,0,0,20),
TextTruncate=Enum.TextTruncate.AtEnd,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Bottom,
BackgroundTransparency=1,
TextSize=14,
ThemeTag={
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aH=E("TextLabel",aF,{
Size=UDim2.new(1,0,0,20),
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
TextWrapped=true,
TextSize=12,
ThemeTag={
TextColor3="Colors.Text.Dark",
Font="Font.Normal"
}
})

local aI=E("ImageLabel",aD,{
Size=UDim2.fromOffset(24,24),
Position=UDim2.new(0,8,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Colors.Icons"
}
})

local aJ=E("TextLabel",aD,{
Size=UDim2.new(0,40,0,16),
Position=UDim2.new(1,-10,0,8),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
TextSize=10,
ThemeTag={
TextColor3="Colors.Text.Darker",
Font="Font.Normal"
}
})

local aK=false

local aL=L(aE,"Scale",1.22,0.35)
local aM=L(aE,"Scale",1.00,0.35)

local aN=setmetatable({
TITLE_LABEL=aG,
DESCRIPTION_LABEL=aH,
VISIBLE_ELEMENT=aC,
DESTROY_ELEMENT=aC,
NOTIFICATION=aD,

Kind="Notification",
Closed=false,
Parent=self
},ak)

function aN:Close()
if self.Closed==true then return end

self:Destroy()
self.Closed=true

local aO=L(aD,"Position",UDim2.fromScale(3,0),0.8)
aO:Play()
aO.Completed:Wait()
aC:Destroy()
end local aO=function()


aA=s:GetIconByName(aA or ah)
aI.Image=aA

if not Q(aA)then
aI.Visible=false
aF.UIPadding.PaddingLeft=UDim.new(0,15)
end

aD.Position=UDim2.fromScale(3,0)
L(aD,"Position",UDim2.fromScale(0,0),0.35):Play()

aG.Text=ay
aH.Text=az

local aO=aD.MouseLeave

while aB>0 do
aJ.Text=S(aB)
if aK==true then aO:Wait()end
aB-=task.wait()
end

aN:Close()end


u(aD.MouseButton1Down,function()aL:Play()aK=true end)
u(aD.MouseLeave,function()aM:Play()aK=false end)

task.defer(aO)

return aN
end

function ai:NewNotifyGroup(ax)
local ay=ax[1]or ax.Name or ax.Title
local az=ax[2]or ax.Content
local aA=ax[3]or ax.Icon or ax.Image
local aB=ax[4]or ax.Duration or ax.Countdown or ax.Time

if ay~=nil and type(ay)~="string"then
error(`"Window.NewNotifyGroup.Title". 'string', or 'nil' expected, got {typeof(ay)}`,2)
end

if az~=nil and type(az)~="string"then
error(`"Window.NewNotifyGroup.Content". 'string', or 'nil' expected, got {typeof(az)}`,2)
end

if aA~=nil and type(aA)~="string"then
error(`"Window.NewNotifyGroup.Icon". 'string', or 'nil' expected, got {typeof(aA)}`,2)
end

if aB~=nil and type(aB)~="number"then
error(`"Window.NewNotifyGroup.Time". 'number', or 'nil' expected, got {typeof(aB)}`,2)
end

return{
NOTIFICATION_GROUP=true,
Notify=ai.Notify,

Duration=aB,
Content=az,
Title=ay,
Icon=aA,
}
end

function ai:GetTabByTitle(ax)
assert(type(ax)=="string",`"Window.GetTabByTitle[param 1]". 'string' expected, got {typeof(ax)}`)

for ay=1,#U do
if U[ay].Title==ax then
return U[ay]
end
end
end

ai.NewNotificationGroup=ai.NewNotifyGroup
ai.SetDefaultNotifyIcon=SetNotifyDefaultIcon
ai.GetTabByName=ai.GetTabByTitle
ai.Notificafion=ai.Notify

T.Window=ai
end local aa=function(

aa, ab)
local ac=ab.Size.Y.Offset
local ad=UDim2.new(0,aa.TabSize or s.Default.TabSize,1,-ac)
local ae=UDim2.new(1,-ad.X.Offset,1,-ac)

local af=E("ScrollingFrame","TabsScroll",{
AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
ScrollBarThickness=2.2,
BackgroundTransparency=1,
ScrollBarImageTransparency=0.2,
CanvasSize=UDim2.new(),
BorderSizePixel=0,
Size=ad,
ThemeTag={
ScrollBarImageColor3="Colors.ScrollBar"
},
Elements={
Padding={
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingTop=UDim.new(0,10),
PaddingBottom=UDim.new(0,10)
},
ListLayout={
Padding=UDim.new(0,5)
}
}
})

local ag=E("Frame","Containers",{
Size=ae,
AnchorPoint=Vector2.new(1,1),
Position=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ClipsDescendants=true
})

return af,ag end


function s:GetIconByName(ab)
if ab==nil then return end
assert(ab,`"Library.GetIconByName". 'string' expected, got {typeof(ab)}`)

if Q(ab)or#ab==0 then
return ab
end

local ac=O(ab)

if self.Icons[ac]then
return"rbxassetid://"..self.Icons[ac]
end

for ad,ae in self.Icons do
if ad:find(ac,1,true)then
return"rbxassetid://"..ae
end
end
end

function s:IsValidTheme(ab)
assert(type(ab)=="string",`"Library.IsValidTheme". string extected, got {typeof(ab)}`)

return self.Themes[ab]~=nil
end

function s:GetThemes()
local ab={}
for ac,ad in self.Themes do
table.insert(ab,ac)
end
return ab
end

function s:GetTheme(ab)
assert(ab==nil or type(ab)=="string",`"Library.GetTheme". 'string' expected, got {typeof(ab)}`)

if ab==nil then
return self.CurrentTheme
end

local ac=self.Themes[ab]
assert(ac~=nil,`"Library.GetTheme". theme not found: {ab}`)
return ac
end

function s:SetTheme(ab)
assert(type(ab)=="string",`"Library.SetTheme". string extected, got {typeof(ab)}`)
local ac=self.Themes[ab]
assert(ac,`"Library.SetTheme". theme not found: {ab}`)

self.CurrentTheme=ac
self.WindowSettings.SelectedTheme=ac.Name

C:update()
end

function s:SetUIScale(ab)
local ac=B.MIN_SCALE
local ad=B.MAX_SCALE

assert(type(ab)=="number",`"Library.SetUIScale". 'number' expected, got {typeof(ab)}`)
assert(ab>=ac and ab<=ad,`"Library.SetUIScale". Min Scale: {ac}, Max Scale: {ad}`)

K.Scale.Scale=R(ab)
end

function s:GetMaxScale()
return B.MAX_SCALE
end

function s:GetMinScale()
return B.MIN_SCALE
end

function s:GetCurrentTheme()
if not self.LOADED_UI_LIBRARY then
return error("failed to get current theme: UI is not loaded",2)
end
return self.CurrentTheme
end

function s:Destroy()
for ab,ac in self.Connections do
ac:Disconnect()
end

if K and K:GetAttribute"UID"==self.SCREENGUI_UID then
pcall(K.Destroy,K)
end
end

function s:MakeWindow(ab)
if self.LOADED_UI_LIBRARY then
return error("you can create only 1 Window",2)
end

local ac=math.random()
K:SetAttribute("UID",ac)
self.SCREENGUI_UID=ac
K:ClearAllChildren()

local ad=E("UIScale","Scale",K,{
Scale=R(1)
})

local ae={
Title=ab[1]or ab.Name or ab.Title,
SubTitle=ab[2]or ab.SubName or ab.SubTitle,
ScriptFolder=ab[3]or ab.ScriptFolder or ab.FolderName
}

assert(type(ae.Title)=="string",`"Window.Title". 'string' expected, got {typeof(ae.Title)}`)
assert(type(ae.SubTitle)=="string",`"Window.SubTitle". 'string' expected, got {typeof(ae.SubTitle)}`)

if ae.ScriptFolder~=nil and type(ae.ScriptFolder)~="string"then
return error(`"Window.ScriptFolder". 'string', or nil expected, got {typeof(ae.ScriptFolder)}`,2)
end

if ae.ScriptFolder~=nil and string.find(ae.ScriptFolder,"/")then
return error("\"Window.ScriptFolder\" is not valid, unexpected char \"/\"",2)
end

local af=(function()
local af=ae.ScriptFolder
local ag=false

local ah,ai=pcall(function()
return af and k:JSONDecode(f(`{af}/LibrarySettings.json`))
end)

if type(ai)~="table"then
ai={}
end local aj=function()


ag=false

return pcall(function()
return z(`{af}/LibrarySettings.json`,k:JSONEncode(ai))
end)end local ak=function(


ak, al, am)
rawset(ai,al,am)

if af and not ag then
ag=true
task.delay(0.5,aj)
end end


return setmetatable({},{
__newindex=ak,
__index=ai
})
end)()

local ag=(function()
local ag=ae.ScriptFolder
local ah=false

local ai,aj=pcall(function()
return ag and k:JSONDecode(f(`{ag}/ScriptFlags.json`))
end)

if type(aj)~="table"then
aj={}
end local ak=function()


ah=false

return pcall(function()
z(`{ag}/ScriptFlags.json`,k:JSONEncode(aj))
end)end local al=function(


al, am, an)
rawset(aj,am,an)

if ag and not ah then
ah=true
task.delay(0.5,ak)
end end local am=function()



table.clear(aj)
return pcall(function()
return ag and c(`{ag}/ScriptFlags.json`)
end)end


return setmetatable({},{
__newindex=al,
__call=am,
__index=aj
})
end)()

self.ThemesObjects=C
self.WindowSettings=af
self.Flags=ag

self.Icons=(function()
local ah=ae.ScriptFolder

local ai,aj=pcall(function()
return loadstring(f(`{ah}/Icons.lua`))()
end)

if ai and type(aj)=="table"then
return aj
end

local ak=`https://raw.githubusercontent.com/{self.Information.GitHubOwner}`
local al=`{ak}/Library/refs/heads/main/redz-V5-remake/Utils/Icons.lua`
local am local an=function()


return z(`{ah}/Icons.lua`,am)end


local ao,ap=pcall(function()
am=game:HttpGet(al)
return loadstring(am)()
end)

if ao and type(ap)=="table"then
if type(am)=="string"then
pcall(an)
end

return ap
end

return{}
end)()

if type(af.SelectedTheme)=="string"and self:IsValidTheme(af.SelectedTheme)then
self:SetTheme(af.SelectedTheme)
else
self:SetTheme(self.Default.Theme)
end

self.LOADED_UI_LIBRARY=true

local ah=self.Default.UISize

if af and type(af.UISize)=="table"then
local ak,al=unpack(af.UISize)

if type(ak)=="number"and type(al)=="number"then
local am=K.AbsoluteSize
ak=math.clamp(ak,430,1000)
al=math.clamp(al,200,500)
ah=UDim2.fromOffset(ak,al)
end
end

local ak=E("Frame","Window",K,{
Position=UDim2.new(0.5,-ah.X.Offset/2,0.5,-ah.Y.Offset/2),
Active=true,
Size=ah,
ThemeTag={
BackgroundTransparency="BackgroundTransparency"
},
Elements={
Corner=UDim.new(0,8),
Gradient={
Rotation=45,
ThemeTag={
Color="Colors.Background"
}
}
}
})

u(ak.Destroying,function()
self:Destroy()
end)

u(K:GetAttributeChangedSignal"UID",function()
self:Destroy()
ak:Destroy()
end)

D.Draggable(ak,ad,0.5)

local al=E("Folder","Components",ak)
local am=E("Folder","Dropdowns",K)

local an=E("Frame","TopBar",al,{
Size=UDim2.new(1,0,0,28),
BackgroundTransparency=1
})

local ao=E("TextLabel","Title",an,{
TextXAlignment=Enum.TextXAlignment.Left,
AutomaticSize=Enum.AutomaticSize.XY,
Position=UDim2.new(0,15,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
Text=ae.Title,
TextSize=12,
BackgroundTransparency=1,
ThemeTag={
TextColor3="Colors.Text.Default",
Font="Font.Bold"
},
Childs={
E("TextLabel","SubTitle",{
Size=UDim2.fromScale(0,1),
AutomaticSize="X",
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(1,5,0.9),
Text=ae.SubTitle,
BackgroundTransparency=1,
TextXAlignment="Left",
TextYAlignment="Bottom",
TextSize=8,
ThemeTag={
TextColor3="Colors.Text.Dark",
Font="Font.Normal"
}
})
}
})

local ap=E("Folder","Buttons",an,{
Childs={
E("ImageButton","Close",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(255,35,35),
AutoButtonColor=false,
ThemeTag={
Image="Icons.Close"
},
Elements={
Corner=UDim.new(0.2,0)
}
}),
E("ImageButton","Minimize",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-35,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
Image="rbxassetid://10734896206",
AutoButtonColor=false,
Elements={
Corner=UDim.new(0.2,0)
}
})
}
})

local aq=ap.Minimize
local ar=ap.Close

local as=setmetatable(ae,{
__index=T.Window
})

local at,au=aa(af,an)

at.Parent=al
au.Parent=al

local av=table.freeze{
ContainerHolder=au,
TabsContainer=at,
Components=al,
MainFrame=ak
}

function as:GetElements()
return av
end

local aw=E("Frame","ControlWindowSize",ak,{
Size=UDim2.new(0,35,0,35),
Position=ak.Size,
AnchorPoint=Vector2.new(0.8,0.8),
BackgroundTransparency=1,
Active=true,
Elements={
Corner=UDim.new(0,6)
},
ThemeTag={
BackgroundColor3="Colors.OnPrimary"
}
})

local ax=E("Frame","ControlTabsSize",ak,{
Size=UDim2.new(0,16,0.75,-30),
Position=UDim2.new(0,at.Size.X.Offset,0.5,15),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
Elements={
Corner=UDim.new(0,6)
},
ThemeTag={
BackgroundColor3="Colors.OnPrimary"
}
})local ay=function(

ay)
local az=ay:GetAttribute"Resizing"
ay:SetAttribute("Resizing",tick())

if az and(tick()-az)<=0.1 then
return nil
end

L(ay,"BackgroundTransparency",0.5,0.3):Play()
while tick()-ay:GetAttribute"Resizing"<=0.1 do task.wait()end
L(ay,"BackgroundTransparency",1,0.4):Play()end


u(aw:GetPropertyChangedSignal"Position",function()
ay(aw)
local az=aw.Position
ak.Size=az
af.UISize={az.X.Offset,az.Y.Offset}
end)

u(ax:GetPropertyChangedSignal"Position",function()
ay(ax)
local az=ax.Position
at.Size=UDim2.new(0,az.X.Offset,1,-an.Size.Y.Offset)
au.Size=UDim2.new(1,-at.Size.X.Offset,1,-an.Size.Y.Offset)
af.TabSize=az.X.Offset
end)

D.Draggable(aw,ad,0.68,function(az,aA,aB,aC)
return UDim2.fromOffset(math.clamp(aA,430,1000),math.clamp(aC,200,500))
end)

D.Draggable(ax,ad,0.68,function(aA,aB)
return UDim2.new(0,math.clamp(aB,135,210),0.5,15)
end)

local aA={
Title="Close Window?",
Content="You Want Close UI?",
Options={
{
Title="Yes",
Callback=function()self:Destroy()end
},
{
Title="No"
}
}
}

u(aq.MouseEnter,function()aq.BackgroundTransparency=0.65 end)
u(aq.MouseLeave,function()aq.BackgroundTransparency=1.00 end)

u(ar.MouseEnter,function()ar.BackgroundTransparency=0.65 end)
u(ar.MouseLeave,function()ar.BackgroundTransparency=1.00 end)

as.SetUIScale=self.SetUIScale
as.SUBTITLE_LABEL=ao.SubTitle
as.TITLE_LABEL=ao

local aB=as:StartWindow{
Resizers={aw,ax},
MinimizeButton=aq,
Dropdowns=am,
MainFrame=ak,
TopBar=an,

SubTitle=ao.SubTitle,
Title=ao,

UIScale=ad,
Flags=ag
}

u(aq.Activated,function()
as:MinimizeButton()
end)

u(ar.Activated,function()
as:Dialog(aA)
end)

return as
end

return s
