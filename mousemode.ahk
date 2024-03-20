Space::LButton
+Space::RButton
^Space::MButton
n::WheelUp
o::WheelDown

p::
{
    MouseMove 256, 0, 0, "R"
}
g::
{
    MouseMove -256, 0, 0, "R"
}
.::
{
    MouseMove 0, -256, 0, "R"
}
c::
{
    MouseMove 0, 256, 0, "R"
}

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
    MouseMove 0, -64, 0, "R"
}
t::
{
    MouseMove 0, 64, 0, "R"
}

j::
{
    MouseMove 16, 0, 0, "R"
}
m::
{
    MouseMove -16, 0, 0, "R"
}
q::
{
    MouseMove 0, -16, 0, "R"
}
w::
{
    MouseMove 0, 16, 0, "R"
}

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

a::mouseToFraction(0, 0.5)
s::mouseToFraction(1, 0.5)

i::mouseToFraction(1/3.0, 0.5)
d::mouseToFraction(2/3.0, 0.5)

k::mouseToFraction(1/3.0, 1)
b::mouseToFraction(2/3.0, 1)

y::mouseToFraction(1/3.0, 0)
f::mouseToFraction(2/3.0, 0)
