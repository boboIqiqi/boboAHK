#SingleInstance, force

;可以获取更好的性能，并且与未来的autohotkey有更好的兼容性
#NoEnv 

;启用提醒，以帮助检测一些常见的错误
#Warn

;新脚本推荐，因为它的出众的速度和可靠性
;SendMode Input  

;确定有一个一致启动目录
SetWorkingDir %A_ScriptDir%  

; # Win; ! Alt ; ^ Control ; + Shift
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.
; < 使用成对按键中左边的那个. 例如 <!a 相当于 !a, 只是使用左边的 Alt 键才可以触发.
; > 使用成对按键中右边的那个.
; * 通配符: 即使附加的修饰键被按住也能激发热键. 这常与 重映射 按键或按钮组合使用.
; ~ 激发热键时，不会屏蔽（被操作系统隐藏）热键中按键原有的功能
; $ 通常只在脚本使用 Send 命令发送包含了热键自身的按键时才需要使用此符号, 此时可以避免触发它自己. $ 前缀强制使用 键盘钩子 来实现此热键, 作为一个副作用这样避免了 Send 命令触发它自己. 
; $ 前缀相当于在此热键定义之前的某个位置指定了 #UseHook。
; UP 可以跟在热键名后面使得在释放按键时触发热键, 而不是按下时. 下面的例子把 LWin 重映射 为 LControl: *LWin::Send {LControl Down} *LWin Up::Send {LControl Up}

;GrouGroup, ahk_exe notepad++.exe ; NotePad
;GrouGroup, ahk_exe TortoiseProc.exe
;#Inc_ScriptDir%\vim.ahk
;#Inc_ScriptDir%\vim_ime.ahk


GroupAdd, NeedCtrlH, ahk_exe AcroRd32.exe
GroupAdd, NeedCtrlH, ahk_class AcrobatSDIWindow

#ifWinNotActive, ahk_group, NeedCtrlH
    ^h::Send {Backspace}
#IfWinNotActive

^j::Send {Enter}
