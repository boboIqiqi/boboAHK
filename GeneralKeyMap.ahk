#SingleInstance, force

;可以获取更好的性能，并且与未来的autohotkey有更好的兼容性
#NoEnv 

;启用提醒，以帮助检测一些常见的错误
;#Warn

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
; $ 前缀相当于在此热键定义之前的某个位置指定了 #UseHook。 ; UP 可以跟在热键名后面使得在释放按键时触发热键, 而不是按下时. 下面的例子把 LWin 重映射 为 LControl: *LWin::Send {LControl Down} *LWin Up::Send {LControl Up}

GroupAdd, NeedCtrlN_P, ahk_class Vim
GroupAdd, NeedCtrlN_P, ahk_exe totalcmd.exe
GroupAdd, NeedCtrlN_P, ahk_exe Wiz.exe 
GroupAdd, NeedCtrlN_P, ahk_class Photoshop
GroupAdd, NeedCtrlN_P, ahk_exe vncviewer.exe
GroupAdd, NeedCtrlN_P, ahk_exe vnc2.exe
GroupAdd, NeedCtrlN_P, ahk_exe MobaXterm.exe
GroupAdd, NeedCtrlN_P, ahk_exe putty.exe
GroupAdd, NeedAlt4, ahk_exe vncviewer.exe
GroupAdd, NeedAlt4, ahk_exe vnc2.exe
 

;GroupAdd, NeedCtrlN_P, ahk_exe totalcmd.exe
;GroupAdd, NeedCtrlD, ahk_class TTOTAL_CMD
GroupAdd, NeedCtrlD, ahk_exe firefox.exe
GroupAdd, NeedCtrlD, ahk_exe vncviewer.exe
GroupAdd, NeedCtrlD, ahk_exe vnc2.exe
GroupAdd, NeedCtrlD, ahk_exe eclipse.exe
GroupAdd, NeedCtrlD, ahk_class Vim
GroupAdd, NeedCtrlD, ahk_exe MobaXterm.exe
GroupAdd, NeedCtrlD, ahk_exe putty.exe
GroupAdd, NeedCtrlD, ahk_exe VISIO.EXE
;GroupAdd, NeedCtrlD, ahk_exe WINWORD.EXE

;GroupAdd, NeedCtrlB, ahk_exe powerpnt.exe
GroupAdd, NeedCtrlB, ahk_exe WINWORD.EXE
GroupAdd, NeedCtrlB, ahk_exe TOTALCMD.EXE
GroupAdd, NeedCtrlB, ahk_exe AcroRd32.exe

GroupAdd, NeedCtrlH, ahk_exe AcroRd32.exe
GroupAdd, NeedCtrlH, ahk_class AcrobatSDIWindow

GroupAdd, CtrlWClose, ahk_exe 7zFM.exe

GroupAdd, NeedCtrlE, ahk_exe Wiz.exe
GroupAdd, NeedCtrlE, ahk_class Vim
GroupAdd, NeedCtrlE, ahk_exe MobaXterm.exe
GroupAdd, NeedCtrlE, ahk_exe putty.exe
GroupAdd, NeedCtrlA, ahk_exe MobaXterm.exe
GroupAdd, NeedCtrlA, ahk_exe putty.exe
GroupAdd, NeedCtrlE, ahk_exe vncviewer.exe
GroupAdd, NeedCtrlE, ahk_exe vnc2.exe
GroupAdd, NeedCtrlA, ahk_exe vnc2.exe
GroupAdd, NeedCtrlA, ahk_exe vncviewer.exe
GroupAdd, NeedCtrlA, ahk_exe EXCEL.EXE
GroupAdd, NeedCtrlA, ahk_class Vim
GroupAdd, NeedCtrlA, ahk_class TFormTextEditor
GroupAdd, NeedCtrlA, ahk_exe iexplore.exe
GroupAdd, NeedCtrlA, ahk_exe YoudaoDict.exe
GroupAdd, NeedCtrlA, ahk_exe wdtp.exe

GroupAdd, NeedSymbol, ahk_exe MobaXterm.exe
GroupAdd, NeedSymbol, ahk_exe putty.exe
GroupAdd, NeedSymbol, ahk_exe vncviewer.exe

GroupAdd, NeedAltHJKL, ahk_exe MobaXterm.exe
GroupAdd, NeedAltHJKL, ahk_exe putty.exe

GroupAdd, DocReader, ahk_class SUMATRA_PDF_FRAME
GroupAdd, DocReader, ahk_exe CAJVieweru.exe
;Capslock::Ctrl

GroupAdd, VNCGroup, ahk_exe vncviewer.exe
GroupAdd, VNCGroup, ahk_exe vnc2.exe
$F2::Send {F2}{Right}{Left}


#ifWinactive ahk_exe WINWORD.EXE
    ^f:: Send $^D
#ifWinactive


#IfWinActive ahk_group VNCGroup
    ^2:: Send 19880423{ENTER}
    ;;^3:: send gnome-terminal{ENTER}
    ^3:: 
        send ssh -XY tds042{ENTER}
        sleep 300
        send 19880423{ENTER}
        return 
#IfWinActive

#IfWinNotActive ahk_group NeedCtrlA
^a::Send {Home}
#IfWinNotActive

#IfWinNotActive ahk_exe vmplayer.exe
#IfWinNotActive
^!q:: send {F1}


#IfWinNotActive ahk_group NeedCtrlE
    ^e::Send {End}
#IfWinNotActive

;^[::Send {ESC}

;#IfWinNotActive ,ahk_group NeedCtrlE
;    ^e::Send {End}
;#IfWinNotActive

#IfWinNotActive ahk_group NeedCtrlD
    ^d::Send {Delete}
#IfWinNotActive

#IfWinNotActive ahk_group NeedAltHJKL
    !h::Send {Left}
    !l::Send {Right}
    !j::Send {Down}
    !k::Send {Up}
#IfWinNotActive 

#ifWinActive ahk_exe explorer.exe
    ^1:: send {F2}
    ^2:: send {F2}
#ifWinActive 

#ifWinActive ahk_exe TypeEasy.exe
    ^1:: 
        send {ESC}
        click 730, 608
        return

    
    ~ESC:: 
        send {ESC}
        sleep 600
        click 730, 608
        return
#ifWinActive 


;^2:: send, {F2}
;;; 其实用得最多的还是F2键，重命名文件
;RAlt & 1::Send, {F1}
;RAlt & 2::Send, {F2}
;RAlt & 3::Send, {F3}
;RAlt & 4::Send, {F4}
;RAlt & 5::Send, {F5}
;RAlt & 6::Send, {F6}
;RAlt & 7::Send, {F7}
;RAlt & 8::Send, {F8}
;RAlt & 9::Send, {F9}
;RAlt & 0::Send, {F10}
;RAlt & -::Send, {F11}
;RAlt & =::Send, {F12}

;;;;; TC快捷键
#ifWinActive ahk_exe TOTALCMD64.EXE
    ^1::Send, {F1}
    ^2::Send, {F2}
    ^3::Send, {F3}
    ^4::Send, {F4}
    ^5::Send, {F5}
    ^6::Send, {F6}
    ^7::Send, {F7}
    ^8::Send, {F8}
    ^9::Send, {F9}
#ifWinActive

;;;;; 虚拟桌面
^Enter:: send #^{Right}
^Backspace:: send #^{Left}
;d:: send #m

;;;;;; 中英文标点
#ifWinNotActive ahk_group NeedSymbol
    !.:: send {text}.
    !/:: send {text}/
    !9:: send {text}(
    !0:: send {text})
    !;:: send {text}:
#IfWinNotActive


#ifWinActive, ahk_exe gvim.exe
    `::Send, {Text}``
    !Enter::
        Send, {Text}````
        send {Left}^{Space}
        return

    !,:: Send % "{ASC 0" . Asc(",") . "}" ; output ,<
    !+,:: Send % "{ASC 0" . Asc("<") . "}"
     
    ;!.:: Send % "{ASC 0" . Asc(".") . "}"  ; output .>
    !.:: send {text}.
    !+.::Send % "{ASC 0" . Asc(">") . "}"
#IfWinActive 

#IfWinNotActive ,ahk_group NeedCtrlN_P
    ^p::Send {Up}
    ^n::Send {Down}
#IfWinNotActive

;关闭对话框，改成Alt+4离主键盘更近

#IfWinNotActive ,ahk_group NeedAlt4
    !4::Send, !{F4}
#IfWinNotActive 

;^w::Send !{F4}
+space::return    ;禁用切换全角与半角，一直使用半角字符
;^space::return    ;禁用切换中英文输入法

#F::run "C:\launcher\Everything.lnk"
#V::run "C:\Program Files (x86)\Vim\vim81\gvim.exe" -p --remote-tab-silent tmp.md
;#G::
;    Run cmd 
;    winwait ahk_exe cmd.exe
;    send cd \{Enter}
;    return

#W:: Run C:\Launcher\Wiz.lnk 						;Wiz笔记
#E:: Run C:\Launcher\TotalCmd.lnk
;#E:: run D:\MyNote\working
#C:: 
    Run cmd 
    winwait ahk_exe cmd.exe
    send cd \{Enter}
    return

#ifWinNotActive, ahk_group, NeedCtrlH
    ^h::Send {Backspace}
#IfWinNotActive

^j::Send {Enter}

#ifWinActive ahk_class mintty
    ^v:: send +{Ins}
#ifWinActive

#ifWinActive ahk_group CtrlWClose
    ^W::Send !{F4}
#ifWinActive

;#IfWinNotActive ahk_group NeedCtrlB
;    ^b::Send {Enter}
;#IfWinNotActive

#IfWinActive ahk_class ConsoleWindowClass
    ^1::Send  /sdcard/Debug_Log_A1/
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
;   ^d::Send {Delete} ;删除后一个字符
    ^v::send %Clipboard% ;粘贴
    !b::Send ^{Left} ;前一个单词
    !f::Send ^{Right} ;后一个单词
    ^d::Send ^{Home}exit{Enter}  ;退出命令行
    ::ad::adb root{Enter}adb remount{Enter}adb shell{Enter}
    ::ps::ps | grep sdt{Enter}kill 
#ifWinActive

#ifWinActive ahk_exe qtcreator.exe
    ^s:: send {ESC}:wa{Enter}
#ifWinActive

;;;;;; ppt
#ifWinActive ahk_exe POWERPNT.EXE
    ^E:: Click 495, 284
        return 
    ^1:: send +{F5}
#ifWinActive

#ifWinActive ahk_exe Wiz.exe
    ;Wiz笔记中^n是用来创建新的笔记的，而且其中也很少用于上下键
    ;Hotkey, *^n up,off

    ;:w{Enter}::send i^s
    ;:::w::send i^s

    ^e:: send ^e
    ^x:: send {f11}
    ^2::
        Click 1640, 124
       ; Send g{Enter}
        Send e
        return

    ^+n::
        MouseClick Right
        send {Down}{Enter}
        return

    LAlt & h::Send {Left}
    LAlt & l::Send {Right}
    LAlt & j::Send {Down}
    LAlt & k::Send {Up}

    ^g::Send {Right}    ;右键常用来展开项目列表
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
   ;     run c:/Launcher/totalCmd.lnk /O %clipboard%
        return 
    ^d:: send {Pgdn}
    ^1:: send !+xj
    ^2:: send !+dj
    ^4:: send {f5}
    ^3:: send {f6}
#ifWinActive

;;;;;;;;;;;; 全局快捷键
;^1::
;    ActivateAndOpen("vnc_huangjb - TigerVNC","")
;    ;Run "D:\Program Files\RealVNC\VNC Viewer\vncviewer.exe"
;    WinActivate
;    Send 19880423{ENTER}
;    return 

^!r::
    ;;send {ESC}:update{Enter}
    Reload  ; 设定 Ctrl-Alt-R 热键来重启脚本.
return 

^!d:: run "C:/Launcher/RemoveDrive.lnk"
^!e:: Edit  ; 设定 Ctrl-Alt-E 热键来编辑脚本
^!v:: run "C:\launcher\Everything.lnk"
^!f:: ActivateAndOpen("Mozilla Firefox","c:/Launcher/Firefox.lnk")
^!o:: ActivateAndOpen("Google Chrome","c:/Launcher/chrome.lnk")
^!g:: Run C:\Launcher\Wiz.lnk 					;

;;^!w:: ActivateAndOpen("Microsoft Word", "c:/Launcher/Word.lnk")
^!c:: run "C:\Launcher\YouDao.lnk"
^!l:: send #{Right}
^!h:: send #{Left}
^!k:: run "C:\Program Files (x86)\Microsoft Office\root\Office16\onenote.exe"

;;^!t:: Run C:\launcher\RunZ.ahk.lnk
^!x:: Run C:\launcher\MobaXterm.lnk
^!u:: ActivateAndOpen("192.168.32.32 - PuTTY", "C:\launcher\putty.lnk")
^!m:: run "C:\Program Files (x86)\Vim\vim81\gvim.exe" -p --remote-tab-silent tmp.md
^!n:: Run C:\launcher\vnc.lnk
^!s:: 
    Run C:\launcher\VMP.lnk
    sleep 500
    send {Down}!l
    Run C:\launcher\MobaXterm.lnk
    return

^!w:: 
    Run C:\Program Files (x86)\Tencent\WeChat\WeChat.exe
    ;sleep 300
    Send {Enter}
    return 
^!a:: Run D:\software\turnoffdisplay\关闭屏幕.exe
^!y:: Run totalcmd.exe /O C:\MyNote\软件\hhkb键位 
^!p:: 
    Run cmd.exe
    winwait ahk_exe cmd.exe
    send adb shell{Enter}cd /data/local/sdt/mdm/policy{Enter}
return
^!z:: MouseClickDrag, left, 1553, 878, 624, -20


;^+q:: Run c:\Launcher\SnapShot.exe
;^+w:: Run c:\Launcher\SnapShot.exe
^+q:: send {F1}
^+w:: Run c:\Launcher\QQSnapShot.lnk

;^F1:: Run Shutdown -h   ;自动进入休眠状态


^!i::
    SetWorkingDir %A_ScriptDir%
    tmpfile=%A_ScriptDir%\%A_Now%ahk_text_edit_in_vim.md
    ;tmpfile=%A_ScriptDir%\ahk_text_edit_in_vim.txt
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
    else IfInString, active_title, .c
        filetype=.c
    else IfInString, active_title, .h
        filetype=.h
    else IfInString, active_title, autohot
        filetype=.ahk
    else IfInString, active_title, RStudio
        filetype=.R
    else IfInString, active_title, studio
        filetype=.cpp
    else filetype =.md

 ;   Msgbox, %fileType%

    ;根据窗口名称改变临时文件后缀名，这样vim修改的时候就可以自动变为相应高亮格式了
    FileDelete, %tmpfile%.*
    tmpfile=%tmpfile%%filetype%

    FileAppend, %clipboard%, %tmpfile%, UTF-8
    send ^{space}
    ;runwait, %gvim% -p --remote-tab-silent "%tmpfile%" +
    runwait, %gvim% "%tmpfile%"
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

#IfWinActive ahk_exe firefox.exe
    ^d:: ;send i
        MouseClick Right
;        msgbox,4100,标题,内容
        ;sleep 1000
        send i
        return 
    ^/:: send ^f
#IfWinNotActive

;ahk_exe SumatraPDF.exe
;#IfWinActive ahk_class SUMATRA_PDF_FRAME
;    ;;j:: send {PgDn}
;    ;;k:: return
;    f:: send {ESC}{PgDn}
;    g:: send ^{Home}
;    +g:: send ^{End}
;    b:: send {PgUp}
;#IfWinActive

#IfWinActive ahk_group DocReader
    j:: send {Down}{Down}{Down}{Down}
    k:: send {up}{up}{up}{up}
    h:: send {Left}{Left}
    l:: send {Right}{Right}

    d::
    f:: send {ESC}{PgDn}

    g:: send ^{Home}
    +g:: send ^{End}

    u::
    b:: send {PgUp}
#IfWinActive 

;;;;; 删除复制的回车
#IfWinActive ahk_class SUMATRA_PDF_FRAME
    ^2::send {F12}
    ;原复制功能由Win+Ctrl+C替代
    #^c::^c

    ^c::
    ;防误触暂停
    Sleep 15
    ;使用ALT做热键，请设置延迟
       tmp := supercopy()
       if (tmp=658958955595158099999){
       MsgBox ,16, 复制出错,未能复制到内容，替换无法进行
       return
       }	
        ;替换换行符
        out:= RegExReplace(tmp, "(\S.*?)\R(.*?\S)", "$1 $2")	 
        ;复制替换后会弹出提示通知，如果不需要就注释掉
        TrayTip,PDF文本替换复制,替换后的内容为:`n%out%,,1
        Clipboard:=out
    return
    supercopy(){
    ;~ tcopy(){
        old := ClipboardAll
    Clipboard :=""
    Send ^c
    ClipWait,1
    ;防误触暂停
    Sleep 55
    if(ErrorLevel = 1){
        TrayTip,超级复制,复制失败,,1
        return 658958955595158099999
    }
    ;防误触暂停
    Sleep 15
    show := Clipboard
    TrayTip,超级复制,复制出的内容为:`n%show%,,1
    Clipboard := old
    Sleep 15
    return %show%
}
#IfWinActive


#IfWinActive ahk_class AcrobatSDIWindow
    h:: 
    if (inAcrobatSearchMode)
      Send h
    else Send !{Left}
    return

    j::
    if (inAcrobatSearchMode)
      Send j 
    else Send {Down}
    return

    k::
    if (inAcrobatSearchMode)
      Send k 
    else Send {Up}
    return

    l::
    if (inAcrobatSearchMode)
      Send l 
    else Send !{Right}
    return

    n::
    if (inAcrobatSearchMode)
      Send n
    else Send {F3}{Esc}
    return

    x::
    if (inAcrobatSearchMode)
      Send x
    else Send ^w
    return

    f::
    if (inAcrobatSearchMode)
      Send f
    else Send {Esc}{PgDn}
    return

    b::
    if (inAcrobatSearchMode)
      Send b
    else Send {Esc}{PgUp}
    return

    d::
    if (inAcrobatSearchMode)
      Send d
    else Send {Esc}{PgDn}
    return

    u::
    if (inAcrobatSearchMode)
      Send u
    else Send {Esc}{PgUp}
    return


    +n::
    if (inAcrobatSearchMode)
      Send N
    else Send +{F3}{Esc}
    return

    +g::
    if (inAcrobatSearchMode)
      Send G
    else Send {End} 
    return

    ; see http://stackoverflow.com/questions/1794258/detect-a-double-key-press-in-autohotkey

    g::
    if (inAcrobatSearchMode)
      Send g
    else {
      if (A_PriorHotkey <> "g" or A_TimeSincePriorHotkey > 400) {
          ; Too much time between presses, so this isn't a double-press.
          KeyWait, g
          return
      }
      Send {Home}
    }
    return

    /::
    if (inAcrobatSearchMode)
      Send /
    else {
      inAcrobatSearchMode := true
      Send ^f
    }
    return

    Esc::
    inAcrobatSearchMode := false
    Send {Esc}
    return

    ^[::
    inAcrobatSearchMode := false
    Send {Esc}
    return

    Enter::
    if (inAcrobatSearchMode) {
      inAcrobatSearchMode := false
    }
    Send {Enter}
    return

    ;go back into normal mode after scrolling with any control command

    ^e::
    inAcrobatSearchMode := false
    Send {Esc}{Down}
    return

    ^y::
    inAcrobatSearchMode := false
    Send {Esc}{Up}
    return

    ^f::
    inAcrobatSearchMode := false
    Send {Esc}{PgDn}
    return

    ^b::
    inAcrobatSearchMode := false
    Send {Esc}{PgUp}
    return

#IfWinActive


;;;;;远程电脑的一些设置
Numpad1::Edit 
Numpad0::
    send {ESC}:update{Enter}
    Reload  
return 


;;;;;;;;;;;;;;;;;右键菜单进行omnipeek的设置
#ifWinactive ahk_class OmniPeek
    ^!d::send ^y^y
    RButton::
    RButtonCount++
    if RButtonCount=1
        SetTimer,CheckR,-1000
    if RButtonCount=1
    KeyWait,RButton,U,T0.8
    if ErrorLevel
        RButtonCount1:=1
    else 
    {
        KeyWait,RButton,D,T0.1
        if ErrorLevel
            RButtonCount1:=2
        else
        {
            RButtonCount++
            RButtonCount1:=3
        }
    }
    if RButtonCount1=1
            Menu, tray, Show
    else if RButtonCount1=2
            Send {RButton}l
    else if RButtonCount1=3
            Send ^v
    if  (RButtonCount1=1 || RButtonCount1=3)
        gosub,RCount
    Return

    RCount:
    RButtonCount:=0
    RButtonCount1:=0
    return

    CheckR:
    if (RButtonCount=1 && RButtonCount1=2)
        gosub,RCount
    return
#ifWinactive

