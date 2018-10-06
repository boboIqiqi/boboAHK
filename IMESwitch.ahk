;【功能】便于盲操，切换输入法状态
;【使用方法】
;想切成中文：双击shift
;想切成英文：双击shift后、再单击shift
;想切成英文：双击Ctrl
;作者：sunwind 
;日期：2018年8月26日
;语言： AutoHotkey Unicode 32-bit
;测试环境：win10 + 搜狗输入法
;更新反馈地址：https://blog.csdn.net/liuyukuan/article/details/81939497
#SingleInstance, force
 
~LShift::
if  pressesCount>0
{
	pressesCount+=1 
	return
}
pressesCount=1
SetTimer,WaitKeys,300
return
WaitKeys:
SetTimer,WaitKeys,off
if pressesCount=2
{
    Send ^`,
    IME_SET(1)  
}
pressesCount=0
return
 
~LCtrl::
Keywait, LCtrl, , t0.5
if errorlevel = 1
	return
else
	Keywait, LCtrl, d, t0.3
if errorlevel = 0
{
  Send ^`,
  IME_SET(0)  
}
return
 
 
 
 
IME_SET(setSts, WinTitle="")
;-----------------------------------------------------------
; IMEの状態をセット
;    対象： AHK v1.0.34以降
;   SetSts  : 1:ON 0:OFF
;   WinTitle: 対象Window (省略時:アクティブウィンドウ)
;   戻り値  1:ON 0:OFF
;-----------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
 
    ;Message : WM_IME_CONTROL  wParam:IMC_SETOPENSTATUS
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x006,setSts,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}
