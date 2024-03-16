#Requires AutoHotkey v2.0
#SingleInstance
A_MaxHotkeysPerInterval := 300

a::return
o::return
e::return
u::return
s::return

h::Space
t::'
n::-

s & h::Backspace
s & t::+'
s & n::+-

#HotIf GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a")
{
    h::SendText "t"
    t::SendText "a"
    n::SendText "h"

    s & h::SendText "T"
    s & t::SendText "A"
    s & n::SendText "H"
}

#HotIf !GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a")
{
    h::SendText "e"
    t::SendText "s"
    n::SendText "r"

    s & h::SendText "E"
    s & t::SendText "S"
    s & n::SendText "R"
}

#HotIf GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && !GetKeyState("a")
{
    h::SendText "i"
    t::SendText "n"
    n::SendText "g"

    s & h::SendText "I"
    s & t::SendText "N"
    s & n::SendText "G"
}

#HotIf !GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && !GetKeyState("a")
{
    h::SendText "u"
    t::SendText "o"
    n::SendText "y"

    s & h::SendText "U"
    s & t::SendText "O"
    s & n::SendText "Y"
}

#HotIf GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && !GetKeyState("a")
{
    h::SendText "d"
    t::SendText "l"
    n::SendText "p"

    s & h::SendText "D"
    s & t::SendText "L"
    s & n::SendText "P"
}

#HotIf !GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && !GetKeyState("a")
{
    h::SendText "m"
    t::SendText "f"
    n::SendText "b"

    s & h::SendText "M"
    s & t::SendText "F"
    s & n::SendText "B"
}

#HotIf GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && !GetKeyState("a")
{
    h::SendText "c"
    t::SendText "k"
    n::SendText "x"

    s & h::SendText "C"
    s & t::SendText "K"
    s & n::SendText "X"
}

#HotIf !GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && GetKeyState("a")
{
    h::SendText "w"
    t::SendText "v"
    n::SendText "j"

    s & h::SendText "W"
    s & t::SendText "V"
    s & n::SendText "J"
}

#HotIf GetKeyState("u") && !GetKeyState("e") && !GetKeyState("o") && GetKeyState("a")
{
    h::SendText "q"
    t::SendText "z"
    n::SendText "/"

    s & h::SendText "Q"
    s & t::SendText "Z"
    s & n::SendText "?"
}

#HotIf !GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && GetKeyState("a")
{
    h::SendText "."
    t::SendText ","
    n::SendText ";"

    s & h::SendText "<"
    s & t::SendText ">"
    s & n::SendText ":"
}

#HotIf GetKeyState("u") && GetKeyState("e") && !GetKeyState("o") && GetKeyState("a")
{
    h::SendText "1"
    t::SendText "2"
    n::SendText "3"

    s & h::SendText "!"
    s & t::SendText "@"
    s & n::SendText "#"
}
 
#HotIf !GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && GetKeyState("a")
{
    h::SendText "4"
    t::SendText "5"
    n::SendText "6"

    s & h::SendText "$"
    s & t::SendText "%"
    s & n::SendText "^"
}

#HotIf GetKeyState("u") && !GetKeyState("e") && GetKeyState("o") && GetKeyState("a")
{
    h::SendText "7"
    t::SendText "8"
    n::SendText "9"

    s & h::SendText "{"
    s & t::SendText "}"
    s & n::SendText "&"
}

#HotIf !GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && GetKeyState("a")
{
    h::SendText "("
    t::SendText ")"
    n::SendText "0"

    s & h::SendText "["
    s & t::SendText "]"
    s & n::SendText "*"
}

#HotIf GetKeyState("u") && GetKeyState("e") && GetKeyState("o") && GetKeyState("a")
{
    h::SendText "="
    t::SendText "\"
    n::`

    s & h::SendText "+"
    s & t::SendText "|"
    s & n::SendText "~"
}