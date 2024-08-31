,::WheelUp
r::WheelDown
a::return
s::return
o::return
n::return

mouseToFraction(xFract, yFract)
{
    WinGetPos , , &height, &width, "A"

    x := height * xFract
    y := width * yFract
    MouseMove x, y, 0   
}


#HotIf !GetKeyState("a") && !GetKeyState("o") && !GetKeyState("n") && !GetKeyState("s")
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

#HotIf GetKeyState("a") && !GetKeyState("o") && !GetKeyState("n") && !GetKeyState("s")
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

#HotIf !GetKeyState("a") && GetKeyState("o") && !GetKeyState("n") && !GetKeyState("s")
{
    Space::MButton
}


#HotIf GetKeyState("a") && GetKeyState("o") && !GetKeyState("n") && !GetKeyState("s")
{
    u::
    {
        MouseMove 1024, 0, 0, "R"
    }
    h::
    {
        MouseMove -1024, 0, 0, "R"
    }
    e::
    {
        MouseMove 0, 1024, 0, "R"
    }
    t::
    {
        MouseMove 0, -1024, 0, "R"
    }
}

#HotIf !GetKeyState("a") && !GetKeyState("o") && GetKeyState("n") && !GetKeyState("s")
{
}

#HotIf GetKeyState("a") && !GetKeyState("o") && GetKeyState("n") && !GetKeyState("s")
{
}

#HotIf !GetKeyState("a") && GetKeyState("o") && GetKeyState("n") && !GetKeyState("s")
{
    e::WheelDown
    t::WheelUp
}
#HotIf GetKeyState("a") && GetKeyState("o") && GetKeyState("n") && !GetKeyState("s")
{
}

#HotIf !GetKeyState("a") && !GetKeyState("o") && !GetKeyState("n") && GetKeyState("s")
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

    
    Space::
    {
        if (GetKeyState("LButton")) 
        {
            SendInput "{LButton up}"
        }
        else
        {
            SendInput "{LButton down}"
        }
    }
}

#HotIf GetKeyState("a") && !GetKeyState("o") && !GetKeyState("n") && GetKeyState("s")
{
    u::
    {
        mouseToFraction(0.75, 0.5)
    }
    h::
    {
        mouseToFraction(0.25, 0.5)
    }
    e::
    {
        mouseToFraction(0.5, 0.75)
    }
    t::
    {
        mouseToFraction(0.5, 0.25)
    }
    
    Space::
    {
        if (GetKeyState("RButton")) 
        {
            SendInput "{RButton up}"
        }
        else
        {
            SendInput "{RButton down}"
        }
    }
}


#HotIf !GetKeyState("a") && GetKeyState("o") && !GetKeyState("n") && GetKeyState("s")
{
    Space::
    {
        if (GetKeyState("MButton")) 
        {
            SendInput "{MButton up}"
        }
        else
        {
            SendInput "{MButton down}"
        }
    }
}

#HotIf GetKeyState("a") && GetKeyState("o") && !GetKeyState("n") && GetKeyState("s")
{
}

#HotIf !GetKeyState("a") && !GetKeyState("o") && GetKeyState("n") && GetKeyState("s")
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
}

#HotIf GetKeyState("a") && !GetKeyState("o") && GetKeyState("n") && GetKeyState("s")
{
}


#HotIf !GetKeyState("a") && GetKeyState("o") && GetKeyState("n") && GetKeyState("s")
{
}

#HotIf GetKeyState("a") && GetKeyState("o") && GetKeyState("n") && GetKeyState("s")
{
}
