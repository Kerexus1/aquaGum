#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 0

global ISSPAMMING := false

SetTimer, InitializeTooltip, -100

$F1::
    if (!ISSPAMMING) {
        ISSPAMMING := true
        SetTimer, SpamE, 1
        UpdateTooltip()
    }
return

$F3::
    if (ISSPAMMING) {
        ISSPAMMING := false
        SetTimer, SpamE, Off
        UpdateTooltip()
    }
return

SpamE:
    if (ISSPAMMING)
        Send {e}
return

InitializeTooltip:
    UpdateTooltip()
return

UpdateTooltip() {
    STATUS := ISSPAMMING ? "Spamming E :)" : "Press F1 to Start"
    ToolTip, , , , 1
    ToolTip, %STATUS%, 53, 883, 1
    if (!ISSPAMMING) {
        ToolTip, Made by Aqua, 53, 903, 2
    } else {
        ToolTip, , , , 2
    }
}

$Esc::
    ToolTip, , , , 1
    ToolTip, , , , 2
    ExitApp
return