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

GroupAdd, NeedCtrlN_P, ahk_class Vim
GroupAdd, NeedCtrlN_P, ahk_exe Wiz.exe 
GroupAdd, NeedCtrlN_P, ahk_class Photoshop
GroupAdd, NeedCtrlN_P, ahk_exe totalcmd.exe

GroupAdd, NeedCtrlB, ahk_exe WINWORD.EXE
Capslock::Ctrl

#IfWinNotActive ,ahk_group NeedCtrlN_P
    ^p::Send {Up}
    ^n::Send {Down}
#IfWinNotActive

;关闭对话框，改成Alt+4离主键盘更近
!4::Send, !{F4}
;^w::Send !{F4}
+space::return    ;禁用切换全角与半角，一直使用半角字符
;^space::return    ;禁用切换中英文输入法

#F::run "C:\launcher\Everything.lnk"
#G::run "C:\launcher\gvim.lnk"
#W:: Run C:\Launcher\Wiz.lnk 						;Wiz笔记
#E:: Run C:\
#C:: 
    Run cmd 
    winwait ahk_exe cmd.exe
    send cd \{Enter}cls{Enter}
    return

^h::Send {Backspace}
^j::Send {Enter}

#IfWinNotActive ahk_group NeedCtrlB
    ^b::Send {Enter}
#IfWinNotActive

#IfWinActive ahk_class ConsoleWindowClass
    ^l::Send cls{Enter} ;清除屏幕
;    ^u::Send ^{Home} ;删除当前行光标前内容
    ^u::Send {Backspace 10}
    ^k::Send ^{End} ;删除当前行光标后内容
    ^a::Send {Home} ;转到行首
    ^e::Send {End} ;转到行尾
    ^p::Send {Up} ;上一个命令
;    ^n::Send {Down} ;下一个命令
    ^b::Send {Left} ;转到前一个字符
    ^f::Send {Right} ;转到后一个字符
    ^d::Send {Delete} ;删除后一个字符
    ^v::send %Clipboard% ;粘贴
    !b::Send ^{Left} ;前一个单词
    !f::Send ^{Right} ;后一个单词
    ^w::Send ^{Home}exit{Enter}  ;退出命令行
    ::ad::adb root{Enter}adb remount{Enter}adb shell{Enter}
    ::ps::ps | grep sdt{Enter}kill 
#ifWinActive

#ifWinActive ahk_exe qtcreator.exe
    ^s:: send {ESC}:wa{Enter}
#ifWinActive

#ifWinActive ahk_exe Wiz.exe
    ;Wiz笔记中^n是用来创建新的笔记的，而且其中也很少用于上下键
    ;Hotkey, *^n up,off

    ^+n::
        MouseClick Right
        send {Down}{Enter}
        return

    LAlt & h::Send {Left}
    LAlt & l::Send {Right}
    LAlt & j::Send {Down}
    LAlt & k::Send {Up}

    ^a::Send {Home}
; ^e::Send {End}   ;Ctrl+E用来编辑
    ^d::Send {Delete}
    ^h::Send {Backspace}

    ^r:: 
       ; mousemove 665,191
       ; MouseClickDrag,Left, 655, 191, 685,191
       ; MouseClickDrag,Left, 655, 191, 665,191
        Send +{End}
        clipboard =
        send ^c
        send ^c
        clipwait
        clipboard = %clipboard%.md
        click, 1200, 156
        click, 1200, 156
        click, 1200, 156
        send ^v
    return
#IfWinActive  

#IfWinActive ahk_class Photoshop
    ;photoshop 中^J是创建新的层数
    ;Hotkey, ^j,off
    ;Hotkey, ^j up,off
    ;Hotkey, *^n,off
    ;Hotkey, *^n up,off
#IfWinActive

;在Eclipse下，映射相关按键
#IfWinActive ahk_exe eclipse.exe
;$=::send {ESC}{=}
;$space::
;    send {ESC}
;    send {space}
;    return
    ^f::    ;一键在资源管理器中打开目录
        send !{Enter}
        send !L+{End}
        clipboard=
        send ^c
        clipwait  ; 等待数据进入剪贴板
   ;     msgbox %clipboard%
        send {ESC}
        run %clipboard%
        return 

#ifWinActive

^!r::
    send {ESC}:update{Enter}
    Reload  ; 设定 Ctrl-Alt-R 热键来重启脚本.
return 

^!d:: run "C:/Launcher/RemoveDrive.lnk"
^!e::Edit  ; 设定 Ctrl-Alt-E 热键来编辑脚本
^!v:: run "C:\launcher\Everything.lnk"
^!f:: ActivateAndOpen("Mozilla Firefox","c:/Launcher/Firefox.lnk")
^!w:: ActivateAndOpen("Microsoft Word", "c:/Launcher/Word.lnk")
^!g:: run Lingoes.lnk
^!l:: Run C:\MyNote\软件\hhkb键位\viewLog.bat
^!t:: Activate("Total Commander 9.0a - NOT REGISTERED")
^!y:: Run totalcmd.exe /O C:\MyNote\软件\hhkb键位 
^!p:: 
    Run cmd.exe
    winwait ahk_exe cmd.exe
    send adb shell{Enter}cd /data/local/sdt/mdm/policy{Enter}
return

^F1:: Run Shutdown -h   ;自动进入休眠状态


^!i::
    SetWorkingDir %A_ScriptDir%
    tmpfile=%A_ScriptDir%\ahk_text_edit_in_vim.txt
    ;gvim=C:\Program Files\Vim\vim74\gvim.exe
    gvim=c:\launcher\gvim.lnk
    WinGetTitle, active_title, A
    clipboard = ; 清空剪贴板
    send ^a ; 发送 Ctrl + A 选中全部文字
    send ^c ; 发送 Ctrl + C 复制
    send ^c ; 发送 Ctrl + C 复制, 不知道为什么，在Eclipse里面必须运行两次复制
    clipwait   ;, 3, 1 ; 等待数据进入剪贴板

    ;判断文件类型
    filetype=%active_title%
    IfInString, active_title, .java
        filetype=.java
    else IfInString, active_title, .xml
        filetype=.xml
    else IfInString, active_title, autohot
        filetype=.ahk
    else IfInString, active_title, RStudio
        filetype=.R
    else IfInString, active_title, studio
        filetype=.cpp
    else filetype =

 ;   Msgbox, %fileType%

    ;根据窗口名称改变临时文件后缀名，这样vim修改的时候就可以自动变为相应高亮格式了
    FileDelete, %tmpfile%.*
    tmpfile=%tmpfile%%filetype%

    FileAppend, %clipboard%, %tmpfile%, UTF-8

    runwait, %gvim% "%tmpfile%" +
    fileread , text, %tmpfile%
    clipboard := text ; 还原读取的数据到剪贴板
    winwait %active_title% ; 等待刚才获取文字的窗口激活
    send ^v ; 发送 Ctrl + V 粘贴
return 


SetTitleMatchMode 2    

Activate(t)
{
  IfWinActive,%t%
  {
    WinMinimize
    return 1
  }
  SetTitleMatchMode 2    
  DetectHiddenWindows,on
  IfWinExist,%t%
  {
    WinShow
    WinActivate           
    return 1
  }
  return 0
}

ActivateAndOpen(t,p)
{
  if Activate(t)==0
  {
    Run %p%
    WinActivate
    return
  }
}

