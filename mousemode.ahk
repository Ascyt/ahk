,::WheelUp
r::WheelDown
a::return
s::return

mouseToFraction(xFract, yFract)
{
    WinGetPos , , &height, &width, "A"

    x := height * xFract
    y := width * yFract
    MouseMove x, y, 0   
}

'::mouseToFraction(0, 0)
/::mouseToFraction(1, 0)
`;::mouseToFraction(0, 1)
z::mouseToFraction(1, 1)

x::mouseToFraction(0.5, 0.5)

i::mouseToFraction(0, 0.5)
d::mouseToFraction(1, 0.5)

k::mouseToFraction(1/3.0, 1)
b::mouseToFraction(2/3.0, 1)

y::mouseToFraction(1/3.0, 0)
f::mouseToFraction(2/3.0, 0)


#HotIf GetKeyState("a") && !GetKeyState("s")
{
    u::
    {
        MouseMove 256, 0, 0, "R"
    }
    h::
    {
        MouseMove -256, 0, 0, "R"
    }
    e::
    {
        MouseMove 0, 256, 0, "R"
    }
    t::
    {
        MouseMove 0, -256, 0, "R"
    }

    Space::RButton
}

#HotIf !GetKeyState("a") && !GetKeyState("s")
{
    u::
    {
        MouseMove 64, 0, 0, "R"
    }
    h::
    {
        MouseMove -64, 0, 0, "R"
    }
    e::
    {
        MouseMove 0, 64, 0, "R"
    }
    t::
    {
        MouseMove 0, -64, 0, "R"
    }

    Space::LButton
}

#HotIf !GetKeyState("a") && GetKeyState("s")
{
    u::
    {
        MouseMove 16, 0, 0, "R"
    }
    h::
    {
        MouseMove -16, 0, 0, "R"
    }
    e::
    {
        MouseMove 0, 16, 0, "R"
    }
    t::
    {
        MouseMove 0, -16, 0, "R"
    }
    
    Space::MButton
}

#HotIf GetKeyState("a") && GetKeyState("s")
{
    u::
    {
        MouseMove 1, 0, 0, "R"
    }
    h::
    {
        MouseMove -1, 0, 0, "R"
    }
    e::
    {
        MouseMove 0, 1, 0, "R"
    }
    t::
    {
        MouseMove 0, -1, 0, "R"
    }

    Space::SendInput("{LButton Down}")
}