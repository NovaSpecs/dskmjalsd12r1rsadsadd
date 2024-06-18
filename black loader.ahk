#SingleInstance force

Gui, Color, White

Gui, Font, s15 cgray, Minecraft
Gui, Add, Text, x60 y40 w180 h20 center cgray, nova \ colorbot
Gui, Add, Edit, x60 y70 w180 h30 vLicenseKey center cpurple Limit0
Gui, Add, Button, x90 y110 w120 h20 gValidateButton center cgray, Login
Gui, Add, Text, x60 y140 w180 h20 center cgray, V 1.10
Gui, Show, w300 h180, Loader
WinSet, Transparent, 19, A




return

ValidateButton:
    Gui, Submit, NoHide
    if (LicenseKey != "") {
        if (ValidateLicenseKey(LicenseKey)) {
            ; Load and execute the script from the Pastebin URL
            URL := "https://pastebin.com/raw/mSq2qf39"
            URLDownloadToFile, %URL%, Nova.ahk
            FileRead, scriptContent, Nova.ahk
            Run, %A_ScriptDir%\Nova.ahk 
sleep, 100
            FileDelete, Nova.ahk

ExitApp
        } else {
            MsgBox, 16,wrong key. 
ExitApp
        }
    }
return


ValidateLicenseKey(LicenseKey) {
    URL := "https://pastebin.com/raw/kgEK1nyB"
    URLDownloadToFile, %URL%, temp.txt
    FileRead, content, temp.txt
    FileDelete, temp.txt
    Loop, Parse, content, `n, `r
    {
        if (A_LoopField = LicenseKey)
            return true
    }
    return false
}

GuiClose:
ExitApp