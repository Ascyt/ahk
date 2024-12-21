#Requires AutoHotkey v2.0
#SingleInstance Force

KeypressHappened := False
OnKeypress()
{
    global KeypressHappened

    if KeypressHappened
    {
        return
    }

    KeypressHappened := True

    Run "python.exe ./takepicture.py", , "Hide"
    Sleep 3000

    MyGui := Gui("+AlwaysOnTop +Disabled -Resize")

    MyGui.BackColor := "White"
    MyGui.AddPicture("", "images\dry.jpg")
    MyGui.Show("Center")

    mute := SoundGetMute()
    volume := SoundGetVolume()
    SoundSetMute 0
    SoundSetVolume 100.0

    TrayTip "you piece of shit"

    Sleep 5000

    TrayTip
    SoundSetVolume volume
    SoundSetMute mute

    MyGui.Destroy()
    DllCall("LockWorkStation")
    ExitApp
}

Escape::OnKeypress
LShift::OnKeypress
RShift::OnKeypress
LControl::OnKeypress
RControl::OnKeypress
LAlt::OnKeypress
RAlt::OnKeypress
LWin::OnKeypress
RWin::OnKeypress
AppsKey::OnKeypress
NumLock::OnKeypress
ScrollLock::OnKeypress
PrintScreen::OnKeypress
Pause::OnKeypress
PgUp::OnKeypress
PgDn::OnKeypress
Home::OnKeypress
End::OnKeypress
Up::OnKeypress
Down::OnKeypress
Left::OnKeypress
Right::OnKeypress
Insert::OnKeypress
Delete::OnKeypress
Backspace::OnKeypress
Enter::OnKeypress
Space::OnKeypress
Tab::OnKeypress
F1::OnKeypress
F2::OnKeypress
F3::OnKeypress
F4::OnKeypress
F5::OnKeypress
F6::OnKeypress
F7::OnKeypress
F8::OnKeypress
F9::OnKeypress
F10::OnKeypress
F11::OnKeypress
F12::OnKeypress
0::OnKeypress
1::OnKeypress
2::OnKeypress
3::OnKeypress
4::OnKeypress
5::OnKeypress
6::OnKeypress
7::OnKeypress
8::OnKeypress
9::OnKeypress
a::OnKeypress
b::OnKeypress
c::OnKeypress
d::OnKeypress
e::OnKeypress
f::OnKeypress
g::OnKeypress
h::OnKeypress
i::OnKeypress
j::OnKeypress
k::OnKeypress
l::OnKeypress
m::OnKeypress
n::OnKeypress
o::OnKeypress
p::OnKeypress
q::OnKeypress
r::OnKeypress
s::OnKeypress
t::OnKeypress
u::OnKeypress
v::OnKeypress
w::OnKeypress
x::OnKeypress
y::OnKeypress
z::OnKeypress
\::OnKeypress
-::OnKeypress
=::OnKeypress
[::OnKeypress
]::OnKeypress
`;::OnKeypress
'::OnKeypress
,::OnKeypress
.::OnKeypress
/::OnKeypress
LButton::OnKeypress
RButton::OnKeypress
MButton::OnKeypress
XButton1::OnKeypress
XButton2::OnKeypress
WheelUp::OnKeypress
WheelDown::OnKeypress
WheelLeft::OnKeypress
WheelRight::OnKeypress
Numpad0::OnKeypress
Numpad1::OnKeypress
Numpad2::OnKeypress
Numpad3::OnKeypress
Numpad4::OnKeypress
Numpad5::OnKeypress
Numpad6::OnKeypress
Numpad7::OnKeypress
Numpad8::OnKeypress
Numpad9::OnKeypress
NumpadDot::OnKeypress
NumpadEnter::OnKeypress
NumpadAdd::OnKeypress
NumpadSub::OnKeypress
NumpadMult::OnKeypress
NumpadDiv::OnKeypress
NumpadUp::OnKeypress
NumpadDown::OnKeypress
NumpadLeft::OnKeypress
NumpadRight::OnKeypress
NumpadHome::OnKeypress
NumpadEnd::OnKeypress
NumpadPgUp::OnKeypress
NumpadPgDn::OnKeypress
NumpadIns::OnKeypress
NumpadDel::OnKeypress
NumpadClear::OnKeypress
