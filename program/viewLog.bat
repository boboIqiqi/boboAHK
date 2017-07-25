adb logcat -c
time /t > c:\1.txt
::adb logcat "AUDITSERVER":* *:S >> c:\1.txt
adb logcat >> c:\1.txt
pause
::gvim c:\1.txt

