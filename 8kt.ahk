#Requires AutoHotkey v2.0
#SingleInstance
A_MaxHotkeysPerInterval := 300

a::return
o::return
e::return
u::return
s::return

#HotIf !GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a") && !GetKeyState("s")
{
    h::Space
    t::'
    n::-
}
#HotIf !GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a") && GetKeyState("s")
{
    h::Backspace
    t::+'
    n::+-
}

#HotIf GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a")  && !GetKeyState("s")
{
    h::SendText "t"
    t::SendText "a"
    n::SendText "h"
}
#HotIf GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a") && GetKeyState("s")
{
    h::SendText "T"
    t::SendText "A"
    n::SendText "H"
}

#HotIf !GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "e"
    t::SendText "s"
    n::SendText "r"
}
#HotIf !GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a") && GetKeyState("s")
{
    h::SendText "E"
    t::SendText "S"
    n::SendText "R"
}

#HotIf GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "i"
    t::SendText "n"
    n::SendText "g"
}
#HotIf GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a") && GetKeyState("s")
{
    h::SendText "I"
    t::SendText "N"
    n::SendText "G"
}

#HotIf !GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && !GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "u"
    t::SendText "o"
    n::SendText "y"
}
#HotIf !GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && !GetKeyState("a") && GetKeyState("s")
{
    h::SendText "U"
    t::SendText "O"
    n::SendText "Y"
}

#HotIf GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && !GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "m"
    t::SendText "f"
    n::SendText "b"
}
#HotIf GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && !GetKeyState("a") && GetKeyState("s")
{
    h::SendText "M"
    t::SendText "F"
    n::SendText "B"
}

#HotIf !GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && !GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "d"
    t::SendText "l"
    n::SendText "p"
}
#HotIf !GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && !GetKeyState("a") && GetKeyState("s")
{
    h::SendText "D"
    t::SendText "L"
    n::SendText "P"
}

#HotIf GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && !GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "c"
    t::SendText "k"
    n::SendText "x"
}
#HotIf GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && !GetKeyState("a") && GetKeyState("s")
{
    h::SendText "C"
    t::SendText "K"
    n::SendText "X"
}

#HotIf !GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "w"
    t::SendText "v"
    n::SendText "j"
}
#HotIf !GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && GetKeyState("a") && GetKeyState("s")
{
    h::SendText "W"
    t::SendText "V"
    n::SendText "J"
}

#HotIf GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "q"
    t::SendText "z"
    n::SendText "/"
}
#HotIf GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && GetKeyState("a") && GetKeyState("s")
{
    h::SendText "Q"
    t::SendText "Z"
    n::SendText "?"
}

#HotIf !GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "."
    t::SendText ","
    n::SendText ";"
}
#HotIf !GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && GetKeyState("a") && GetKeyState("s")
{
    h::SendText "<"
    t::SendText ">"
    n::SendText ":"
}

#HotIf GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "1"
    t::SendText "2"
    n::SendText "3"
}
#HotIf GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && GetKeyState("a") && GetKeyState("s")
{
    h::SendText "!"
    t::SendText "@"
    n::SendText "#"
}
 
#HotIf !GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "4"
    t::SendText "5"
    n::SendText "6"
}
#HotIf !GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && GetKeyState("a") && GetKeyState("s")
{
    h::SendText "$"
    t::SendText "%"
    n::SendText "^"
}

#HotIf GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "7"
    t::SendText "8"
    n::SendText "9"
}
#HotIf GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && GetKeyState("a") && GetKeyState("s")
{
    h::SendText "{"
    t::SendText "}"
    n::SendText "&"
}

#HotIf !GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "("
    t::SendText ")"
    n::SendText "0"
}
#HotIf !GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && GetKeyState("a") && GetKeyState("s")
{
    h::SendText "["
    t::SendText "]"
    n::SendText "*"
}

#HotIf GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && GetKeyState("a") && !GetKeyState("s")
{
    h::SendText "="
    t::SendText "\"
    n::`
}
#HotIf GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && GetKeyState("a") && GetKeyState("s")
{
    h::SendText "+"
    t::SendText "|"
    n::SendText "~"
}