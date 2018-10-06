
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AHK版本：		1.1.28.2
; 作者：		心如止水 <QQ群：348016704>
; 脚本功能：	去除PDF的换行
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/*
## 功能：在PDF阅读器中：按下Ctrl+C，会去除PDF的空行,之后再将文本复制到剪切板；原复制功能由Win+Ctrl+C替代

## 关于误触的提示
按下ALT，福昕会弹出菜单
此时如果再按下C（复制需要按下C）会弹出搜索栏（右上角）
为了防止误触的发生，不要用ALT做热键，或者设置充足的延迟
*/

;单词 FORCE 会跳过对话框并自动替换旧实例, 效果类似于 Reload 命令.
#SingleInstance force	
;语境约束，设置只在"福昕阅读器"内起效，如果您用的是其他阅读器，请修改
#IfWinActive ahk_exe FoxitReader.exe

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
    out:= RegExReplace(tmp, "(\S.*?)\R(.*?\S)", "$1$2")	 
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