FileSelectFile Editor, 2,, Select your editor, Programs (*.exe)
if ErrorLevel
    MsgBox, ErrorLevel
    ExitApp
RegWrite REG_SZ, HKCR, AutoHotkeyScript\Shell\Edit\Command,, "%Editor%" "`%1"