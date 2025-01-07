,::WheelUp
r::WheelDown
a::return
s::return
o::return
n::return

MouseToFraction(xFract, yFract)
{
    WinGetPos , , &height, &width, "A"

    x := height * xFract
    y := width * yFract
    MouseMove x, y, 0   
}


DisableModifiersIfNecessary() 
{
    if (GetKeyState("Shift")) 
    {
        SendInput "{Shift up}"
    }
    if (GetKeyState("Ctrl")) 
    {
        SendInput "{Ctrl up}"
    }
    if (GetKeyState("Alt")) 
    {
        SendInput "{Alt up}"
    }
    if (GetKeyState("LWin")) 
    {
        SendInput "{LWin up}"
    }
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

    Space::
    {
        if (GetKeyState("LButton")) 
        {
            SendInput "{LButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{LButton}"
        }
    }
    +Space::
    {
        if (GetKeyState("LButton")) 
        {
            SendInput "{LButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Shift down}{LButton}{Shift up}"
        }
    }
    ^Space::
    {
        if (GetKeyState("LButton")) 
        {
            SendInput "{LButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Ctrl down}{LButton}{Ctrl up}"
        }
    }
    !Space::
    {
        if (GetKeyState("LButton")) 
        {
            SendInput "{LButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Alt down}{LButton}{Alt up}"
        }
    }
    #Space::
    {
        if (GetKeyState("LButton")) 
        {
            SendInput "{LButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Win down}{LButton}{Win up}"
        }
    }
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

    Space::
    {
        if (GetKeyState("RButton")) 
        {
            SendInput "{RButton up}"
        }
        else
        {
            SendInput "{RButton}"
        }
    }
    +Space::
    {
        if (GetKeyState("RButton")) 
        {
            SendInput "{RButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Shift down}{RButton}{Shift up}"
        }
    }
    ^Space::
    {
        if (GetKeyState("RButton")) 
        {
            SendInput "{RButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Ctrl down}{RButton}{Ctrl up}"
        }
    }
    !Space::
    {
        if (GetKeyState("RButton")) 
        {
            SendInput "{RButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Alt down}{RButton}{Alt up}"
        }
    }
    #Space::
    {
        if (GetKeyState("RButton")) 
        {
            SendInput "{RButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Win down}{RButton}{Win up}"
        }
    }
}

#HotIf !GetKeyState("a") && GetKeyState("o") && !GetKeyState("n") && !GetKeyState("s")
{
    Space::
    {
        if (GetKeyState("MButton")) 
        {
            SendInput "{MButton up}"
        }
        else
        {
            SendInput "{MButton}"
        }
    }
    +Space::
    {
        if (GetKeyState("MButton")) 
        {
            SendInput "{MButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Shift down}{MButton}{Shift up}"
        }
    }
    ^Space::
    {
        if (GetKeyState("MButton")) 
        {
            SendInput "{MButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Ctrl down}{MButton}{Ctrl up}"
        }
    }
    !Space::
    {
        if (GetKeyState("MButton")) 
        {
            SendInput "{MButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Alt down}{MButton}{Alt up}"
        }
    }
    #Space::
    {
        if (GetKeyState("MButton")) 
        {
            SendInput "{MButton up}"
            DisableModifiersIfNecessary()
        }
        else
        {
            SendInput "{Win down}{MButton}{Win up}"
        }
    }
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
    u::XButton1
    h::XButton2
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
            DisableModifiersIfNecessary()
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
        MouseToFraction(1, 0.5)
    }
    h::
    {
        MouseToFraction(0, 0.5)
    }
    e::
    {
        MouseToFraction(0.5, 1)
    }
    t::
    {
        MouseToFraction(0.5, 0)
    }
    
    Space::
    {
        if (GetKeyState("RButton")) 
        {
            SendInput "{RButton up}"
            DisableModifiersIfNecessary()
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
            DisableModifiersIfNecessary()
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
