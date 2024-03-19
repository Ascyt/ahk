
; Move mouse
CapsLock & RShift::RButton
CapsLock & Enter::LButton
CapsLock & RControl::MButton
CapsLock & PgUp::WheelUp
CapsLock & PgDn::WheelDown

#HotIf GetKeyState("Shift") && !GetKeyState("Ctrl")
{
	e::
	{
		MouseMove 256, 0, 0, "R"
	}
	a::
	{
		MouseMove -256, 0, 0, "R"
	}
	,::
	{
		MouseMove 0, -256, 0, "R"
	}
	o::
	{
		MouseMove 0, 256, 0, "R"
	}
}
#HotIf !GetKeyState("Shift") && !GetKeyState("Ctrl")
{
	e::
	{
		MouseMove 64, 0, 0, "R"
	}
	a::
	{
		MouseMove -64, 0, 0, "R"
	}
	,::
	{
		MouseMove 0, -64, 0, "R"
	}
	o::
	{
		MouseMove 0, 64, 0, "R"
	}
}
#HotIf !GetKeyState("Shift") && GetKeyState("Ctrl")
{
	e::
	{
		MouseMove 16, 0, 0, "R"
	}
	a::
	{
		MouseMove -16, 0, 0, "R"
	}
	,::
	{
		MouseMove 0, -16, 0, "R"
	}
	o::
	{
		MouseMove 0, 16, 0, "R"
	}
}