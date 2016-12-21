#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
RunWait %A_WorkingDir%\Resources\Ahk2Exe.exe /in "%A_WorkingDir%\Main.ahk" /out "%A_WorkingDir%\SLEET64.exe" /icon "%A_WorkingDir%\Resources\Sleet.ico" 
RunWait %A_WorkingDir%\Resources\Ahk2Exe.exe /in "%A_WorkingDir%\Main.ahk" /out "%A_WorkingDir%\SLEET32.exe" /icon "%A_WorkingDir%\Resources\Sleet.ico" /bin "%A_WorkingDir%\Resources\ANSI 32-bit.bin"
ExitApp 