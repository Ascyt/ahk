#Requires AutoHotkey v2.0
#SingleInstance
A_MaxHotkeysPerInterval := 300

lastTooltip := ""
lastMouseX := 0
lastMouseY := 0
CustomTooltip(content)
{
    global lastTooltip, lastMouseX, lastMouseY

    mouseX := 0
    mouseY := 0
    MouseGetPos (&mouseX, &mouseY)

    if (content != lastTooltip || lastMouseX != mouseX || lastMouseY != mouseY)
    {
        ToolTip(content)

        lastTooltip := content
        lastMouseX := mouseX
        lastMouseY := mouseY
    }
}

while true
{
    mappingKeys := " '-"
    mappingKeysS := "←`"_"

    mod1 := GetKeyState("u")
    mod2 := GetKeyState("e")
    mod3 := GetKeyState("o")
    mod4 := GetKeyState("a")
    keySPressed := GetKeyState("s")

    mappingMod := (mod4 ? "#" : "_") (mod3 ? "#" : "_") (mod2 ? "#" : "_") (mod1 ? "#" : "_")

    if mod1 && !mod2 && !mod3 && !mod4
    {
        mappingKeys := "tah"
        mappingKeysS := "TAH"
    }
    else if !mod1 && mod2 && !mod3 && !mod4
    {
        mappingKeys := "esr"
        mappingKeysS := "ESR"
    }
    else if mod1 && mod2 && !mod3 && !mod4
    {
        mappingKeys := "ing"
        mappingKeysS := "ING"
    }
    else if !mod1 && !mod2 && mod3 && !mod4
    {
        mappingKeys := "uoy"
        mappingKeysS := "UOY"
    }
    else if mod1 && !mod2 && mod3 && !mod4
    {
        mappingKeys := "mfb"
        mappingKeysS := "MFB"
    }
    else if !mod1 && mod2 && mod3 && !mod4
    {
        mappingKeys := "dlp"
        mappingKeysS := "DLP"
    }
    else if mod1 && mod2 && mod3 && !mod4
    {
        mappingKeys := "ckx"
        mappingKeysS := "CKX"
    }
    else if !mod1 && !mod2 && !mod3 && mod4
    {
        mappingKeys := "wvj"
        mappingKeysS := "WVJ"
    }
    else if mod1 && !mod2 && !mod3 && mod4
    {
        mappingKeys := "qz/"
        mappingKeysS := "QZ?"
    }
    else if !mod1 && mod2 && !mod3 && mod4
    {
        mappingKeys := ".,;"
        mappingKeysS := "<>:"
    }
    else if mod1 && mod2 && !mod3 && mod4
    {
        mappingKeys := "123"
        mappingKeysS := "!@#"
    }
    else if !mod1 && !mod2 && mod3 && mod4
    {
        mappingKeys := "456"
        mappingKeysS := "$%^"
    }
    else if mod1 && !mod2 && mod3 && mod4
    {
        mappingKeys := "789"
        mappingKeysS := "{}&"
    }
    else if !mod1 && mod2 && mod3 && mod4
    {
        mappingKeys := "()0"
        mappingKeysS := "[]*"
    }
    else if mod1 && mod2 && mod3 && mod4
    {
        mappingKeys := "=\``"
        mappingKeysS := "+|~"
    }

    CustomTooltip(mappingMod (keySPressed ? " #" : " _") "`n" (keySPressed ? mappingKeysS : mappingKeys))
}