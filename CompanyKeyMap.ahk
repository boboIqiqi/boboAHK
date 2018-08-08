#SingleInstance, force

;可以获取更好的性能，并且与未来的autohotkey有更好的兼容性
#NoEnv 

;启用提醒，以帮助检测一些常见的错误
#Warn

;新脚本推荐，因为它的出众的速度和可靠性
;SendMode Input  

;确定有一个一致启动目录
SetWorkingDir %A_ScriptDir%  


;^F2::
;    run "C:\software\RomZhuShou\MoGuRomZhuShou_m.exe"
;    winwait ahk_exe MoGuRomZhuShou_m.exe
;    click 478, 531
;    sleep,500
;    click 583, 652
;    sleep,500
;    send C:\Users\Bob\Desktop\4G调试\ExpectedValue\system.img{Enter}
;    sleep,500
;    click 1029, 651
;    return 


;^!a:: run totalcmd.exe /O C:\eDisk\13-4G\4Gv2\SecSuit\proj\Linux\auditserver
;^!h:: Run totalcmd.exe /O C:\eDisk\13-4G\4Gv2\SecSuit\proj\commands
;^!s:: Run C:\eDisk\13-4G\4Gv2\SecSuit

;^!h:: Run C:\eDisk\13-4G\4Gv2\SecSuit\proj\build-ProjectManager-Desktop_Qt_5_2_1_MinGW_32bit-Debug\commands\可信签名

Numpad1::
    ;Run, "c:\eDisk\13-4G\4Gv2\SecSuit\proj\FileExplorerTabActivity\CommitHere.bat"
    ;Run, "C:\eDisk\13-4G\4Gv2\SecSuit\proj\Linux\auditserver\CommitHere.bat"
    ;Run "c:\eDisk\13-4G\4Gv2\SecSuit\ko\sdt_software_control\CommitHere.bat"
    Run "E:\hjb\csp\cmn\CommitHere.bat"
return

Numpad2::
    Run, "e:\hjb\sdfapi\commitHere.bat"
return

Numpad3::
    Run, "c:\eDisk\13-4G\4Gv2\SecSuit\proj\TrustSign\CommitHere.bat"
return

Numpad5::
    send adb shell setprop debug.rootbackdoor 1{Enter}
return

Numpad9:: run c:\MyNote\c常用表格\减肥体重表.xlsx
