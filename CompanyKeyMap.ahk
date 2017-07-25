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


^!a:: run totalcmd.exe /O C:\eDisk\13-4G\4Gv2\SecSuit\proj\Linux\auditserver
^!h:: Run totalcmd.exe /O C:\eDisk\13-4G\4Gv2\SecSuit\proj\commands

;^!h:: Run C:\eDisk\13-4G\4Gv2\SecSuit\proj\build-ProjectManager-Desktop_Qt_5_2_1_MinGW_32bit-Debug\commands\可信签名

Numpad1::
    Run, "C:\eDisk\13-4G\4Gv2\SecSuit\proj\Linux\auditserver\CommitHere.bat"
return

Numpad2::
    Run, "C:\eDisk\13-4G\4Gv2\SecSuit\proj\TrustApps\commit here.bat"
return

Numpad3::
    Run, "C:\eDisk\13-4G\4Gv2\SecSuit\proj\TrustSign\commit here.bat"
return
