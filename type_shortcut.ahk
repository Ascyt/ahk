#Requires AutoHotKey v2
#SingleInstance

keyList := ""
previousKeyList := ""
oldMouseX := 0
oldMouseY := 0

confirm := false
stop := false

OnPress(key) 
{
    global keyList
    keyList .= key
}
RemoveLast()
{
    global keyList
    keyList := SubStr(keyList, 1, StrLen(keyList) - 1)
}
RemoveUntilSpace()
{
    global keyList
    ; Remove last if space 
    if (SubStr(keyList, -1) == " ")
    {
        RemoveLast()
        return
    }

    while (StrLen(keyList) > 0 && SubStr(keyList, -1) != " ")
    {
        RemoveLast()
    }
}

ExitConfirm() 
{
    global confirm
    confirm := true
}
ExitStop() 
{
    global stop
    stop := true
}

a::OnPress("a")
b::OnPress("b")
c::OnPress("c")
d::OnPress("d")
e::OnPress("e")
f::OnPress("f")
g::OnPress("g")
h::OnPress("h")
i::OnPress("i")
j::OnPress("j")
k::OnPress("k")
l::OnPress("l")
m::OnPress("m")
n::OnPress("n")
o::OnPress("o")
p::OnPress("p")
q::OnPress("q")
r::OnPress("r")
s::OnPress("s")
t::OnPress("t")
u::OnPress("u")
v::OnPress("v")
w::OnPress("w")
x::OnPress("x")
y::OnPress("y")
z::OnPress("z")
0::OnPress("0")
1::OnPress("1")
2::OnPress("2")
3::OnPress("3")
4::OnPress("4")
5::OnPress("5")
6::OnPress("6")
7::OnPress("7")
8::OnPress("8")
9::OnPress("9")

/::OnPress("/")
.::OnPress(".")
,::OnPress(",")
`;::OnPress(";")
'::OnPress("'")
[::OnPress("[")
]::OnPress("]")
\::OnPress("\")
-::OnPress("-")
=::OnPress("=")
`::OnPress("``")

Space::OnPress(" ")
BackSpace::RemoveLast()
^BackSpace::RemoveUntilSpace()
CapsLock & H::RemoveLast()
Capslock & T::RemoveUntilSpace()

Enter::ExitConfirm()
Esc::ExitStop()
LButton::ExitStop()
RButton::ExitConfirm()

while !confirm && !stop
{
    mouseX := 0
    mouseY := 0
    MouseGetPos (&mouseX, &mouseY)

    if (keyList != previousKeyList || oldMouseX != mouseX || oldMouseY != mouseY)
    {
        Tooltip "> [" keyList "]"
        previousKeyList := keyList
        oldMouseX := mouseX
        oldMouseY := mouseY
    }
}

ToolTip

if confirm 
{
    Run "python.exe program_shortcuts.py " keyList
}
ExitApp