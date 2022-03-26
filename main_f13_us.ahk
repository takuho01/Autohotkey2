
; ChangeKeyを使用してCapsLockをF13にした場合
; Caps2CtrlなどでCapsLockをCtrlにするとhjklを長押ししたときにhjklが入り込むバグを
; 修正するため
; todo
; クリックでインサートモード 
; インサートモードでのタブを通常化 Done

;---spjlekcial move---
; 変数定義は一番最初で実行しないと、謎のエラーが起きる
global mode := 0
global NormalMode := 0
global WinSelMode := 1 
global CommandMode := 0
global InsertMode := 1 
global SelectMode := 2 
global LineSelectMode := 3 
global NormalCopy := 0 
global LineSelectCopy :=1 

; ↓のコードよりも先にF13 & xのコードを書くとよくわからんエラーが出る。
; 解決は難しかったので放置。

;; ---ダミーコード。なぜか最初に書いたコードが動かない。---
$F14:: 
    if(mode==NormalMode){
        Send, F14 
    }
    if(mode==WinSelMode){
        Send, F14 
    }
    Return
;; ---ダミーコード---

$h::
    if(mode==NormalMode){
        Send, h
    }
    if(mode==WinSelMode){
        Send, {Left}
    }
    Return
$j::
    if(mode==NormalMode){
        Send, j
    }
    if(mode==WinSelMode){
        Send, {Down}
    }
    Return
$k::
    if(mode==NormalMode){
        Send, k
    }
    if(mode==WinSelMode){
        Send, {Up}
    }
    Return
$l::
    if(mode==NormalMode){
        Send, l
    }
    if(mode==WinSelMode){
        Send, {Right}
    }
    Return
$Enter::
    if(mode==NormalMode){
        Send, {Enter}
    }
    if(mode==WinSelMode){
        mode := NormalMode
        Send, {Enter}
    }
    Return
$Esc::
    if(mode==NormalMode){
        mode := NormalMode
        Send, {Esc}
    }
    if(mode==WinSelMode){
        mode := NormalMode
        Send, {Esc}
    }
    Return
$Space::
    if(mode==NormalMode){
        mode := NormalMode
        Send, {Space}
    }
    if(mode==WinSelMode){
        mode := NormalMode
        Send, {Space}
    }
    Return

;---2 times F13---
F13::
    if(mode==WinSelMode){
        mode := NormalMode
        Send, {Enter}
    }
    If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 300){
        send !{Tab}
    }
    Return

;---cursol move---
F13 & K::send {Blind}{Up}
F13 & J::send {Blind}{Down}
F13 & H::send {Blind}{Left}
F13 & L::send {Blind}{Right}
F13 & I::send {Blind}{Home}
F13 & O::send {Blind}{End}

F13 & Up::Send    {Blind}{PgUp}
F13 & Down::Send  {Blind}{PgDn}
F13 & Left::Send  {Blind}{Home}
F13 & Right::Send {Blind}{End}

;---other---
F13 & G::send {BS}
F13 & E::send {Esc}
F13 & T::
    Send ^!{Tab}
    mode := WinSelMode
    Return
F12::_ ; for us layout keyboard
F11::\ ; for us layout keyboard
+F11::| ; for us layout keyboard
F13 & Space:: send ^{Space}
;---
F13 & q::send {Blind}^q
F13 & w::send {Blind}^w
; F13 & e::send {Blind}^e
F13 & r::send {Blind}^r
; F13 & t::send {Blind}^t
F13 & y::send {Blind}^y
F13 & u::send {Blind}^u
; F13 & i::send {Blind}^i
; F13 & o::send {Blind}^o
F13 & p::send {Blind}^p
F13 & a::send {Blind}^a
F13 & s::send {Blind}^s
F13 & d::send {Blind}^d
F13 & f::send {Blind}^f
; F13 & g::send {Blind}^g
; F13 & h::send {Blind}^h
; F13 & j::send {Blind}^j
; F13 & k::send {Blind}^k
; F13 & l::send {Blind}^l
F13 & z::send {Blind}^z
F13 & x::send {Blind}^x
F13 & c::send {Blind}^c
F13 & v::send {Blind}^v
F13 & b::send {Blind}^b
; F13 & n::send {Blind}^n
F13 & m::send {Blind}^m
F13 & 1::send {Blind}^1
F13 & 2::send {Blind}^2
F13 & 3::send {Blind}^3
F13 & 4::send {Blind}^4
F13 & 5::send {Blind}^5
F13 & 6::send {Blind}^6
F13 & 7::send {Blind}^7
F13 & 8::send {Blind}^8
F13 & 9::send {Blind}^9
F13 & 0::send {Blind}^0
F13 & -::send {Blind}^-
F13 & /::send {Blind}^/
F13 & `;::send {Blind}^`;
F13 & Tab::send {Blind}^{Tab}
F13 & [::send {Blind}^[
F13 & ]::send {Blind}^]
; F13 & Space::send {Blind}^{Space}
F13 & Enter::send {Blind}^{Enter}


;;; Excel ;;;
#IfWinActive,ahk_exe EXCEL.exe

LButton::
    if (emode = CommandMode) {
        MouseClick LEFT , , , , , D,
        Keywait LButton, 
        MouseClick LEFT , , , , , U,
        SpaceCnt := 0 
        emode := InsertMode
    }else if (emode = InsertMode){
        MouseClick LEFT , , , , , D,
        Keywait LButton, 
        MouseClick LEFT , , , , , U,
        SpaceCnt := 0 
    }else if (emode = SelectMode){
        MouseClick LEFT , , , , , D,
        Keywait LButton, 
        MouseClick LEFT , , , , , U,
        SpaceCnt := 0 
        emode := InsertMode
    }else if (emode = LineSelectMode){
        MouseClick LEFT , , , , , D,
        Keywait LButton, 
        MouseClick LEFT , , , , , U,
        SpaceCnt := 0 
        emode := InsertMode
    }else{
    }
    return

F13 & c::
    if (emode = InsertMode) {
        send {Enter}
        send {Up}
        SpaceCnt := 0 
        emode := CommandMode
    }else if (emode = SelectMode){
        send {Up}
        send {Down}
        send {Esc}
        SpaceCnt := 0 
        emode := CommandMode
    }else if (emode = LineSelectMode){
        send {Up}
        send {Down}
        send {Esc}
        SpaceCnt := 0 
        emode := CommandMode
    }else{
        send {Esc}
        SpaceCnt := 0 
        emode := CommandMode
    }
return

F13 & enter::
    if (emode = CommandMode) {
        emode := InsertMode 
        send {F2}
    }else{
        send {F2}
    }
return

+enter:: 
    if (emode = CommandMode) {
        Send !{Enter} 
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
                send ^+= 
            send +i
            send ^{Enter} 
        }else {
            send ^x{Down}{Up}{Up}{Up}{Up}{Up}{Up}^v
        }
    }else{
        Send !{Enter} 
    }
return

enter::
    if (emode = CommandMode) {
        if (SpaceCnt = 1){
            send {Down} 
            send +{Space} 
            send ^+=
            SpaceCnt := 0 
        }else {
            send {Enter}
        }
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
            send ^+= 
            send +d
            send ^{Enter} 
        }else {
            send ^x{Down}{Up}{Down}{Down}{Down}{Down}{Down}^v
        }
    }else if (emode = LineSelectMode){
        send ^x{Down}{Up}{Down}^v
    }else{
        send {Enter} 
    }
return

Space::
    if (emode = CommandMode) {
        SpaceCnt := SpaceCnt + 1
    }else if (emode = SelectMode){
        SpaceCnt := SpaceCnt + 1
    }else if (emode = LineSelectMode){
        SpaceCnt := SpaceCnt + 1
    }else {
        send {Space}
    }
return

Tab::
    if (emode = CommandMode) {
        send ^x{Right}^v
    }else if (emode = InsertMode){
        send {Tab} 
    }else if (emode = SelectMode){
        send ^x{Down}{Up}{Right}{Right}{Right}{Right}{Right}^v
    }else{
        send {Tab}
    }
return

+Tab::
    if (emode = CommandMode) {
        send ^x{Left}^v
    }else if (emode = InsertMode){
        send +{Tab}{Right}{Left} 
    }else if (emode = SelectMode){
        send ^x{Down}{Up}{Left}{Left}{Left}{Left}{Left}^v
    }else{
        send +{Tab}
    }
return

i::
    if (emode = CommandMode) {
        emode := InsertMode 
    }else{
        send i 
    }
return

v::
    if (emode = CommandMode) {
        emode := SelectMode 
        VisualCnt := 0
    }else if (emode = SelectMode){
        VisualCnt := VisualCnt + 1
        send +{Right}+{Right}
        send +{Down}+{Down}
    }else{
        send v 
    }
return

+v::
    if (emode = CommandMode) {
        send +{Space}
        emode := LineSelectMode 
    }else{
        send V 
    }
return

y::
    if (emode = CommandMode) {
        Keywait, y 
        Keywait, y, D, T0.1
        if (ErrorLevel = 1){
            send ^c 
            cmode := NormalCopy
        }else {
            send +{Space} 
            send ^c 
            cmode := LineSelectCopy 
        }
    }else if (emode = SelectMode){
        send ^c 
        emode := CommandMode
        cmode := NormalCopy
    }else if (emode = LineSelectMode){
        send ^c 
        emode := CommandMode
        cmode := LineSelectCopy 
    }else{
        send y 
    }
return

p::
    if (emode = CommandMode) {
        if (cmode = LineSelectCopy) {
            send {Down}+{Space}
            send ^+=
            send ^c
        }else {
            send ^v 
            send ^c 
        }
    }else if (emode = SelectMode){
        send ^v 
    }else if (emode = LineSelectMode){
        send ^+=
    }else{
        send p 
    }
return

u::
    if (emode = CommandMode) {
        send ^z 
    }else{
        send u 
    }
return

d::
    if (emode = CommandMode) {
        send +{Space} 
        send ^- 
    }else if (emode = SelectMode){
        send ^- 
        send +u
        send ^{Enter} 
    }else if (emode = LineSelectMode){
        send ^- 
        send {Up}
        send {Down}
        send {Esc}
        emode := CommandMode
    }else{
        send d 
    }
return

+d::
    if (emode = CommandMode) {
    }else if (emode = SelectMode){
        send ^- 
        send +l
        send ^{Enter}
        emode := CommandMode
    }else if (emode = LineSelectMode){
    }else{
        send +d 
    }
return

x::
    if (emode = CommandMode) {
        send {Delete} 
    }else if (emode = SelectMode){
        send ^x
        emode := CommandMode
    }else if (emode = LineSelectMode){
        send ^x
        emode := CommandMode
    }else{
        send x
    }
return

F13 & r::
    if (emode = CommandMode) {
        send ^y
    }
return

h::
    if (emode = CommandMode) {
        if (SpaceCnt = 1){
            send {End}
            send {Left}
            SpaceCnt := 0 
        }else if (SpaceCnt = 2){
            send ^{PgUp}
        }else{
            send {Left}
        }
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Left}
            SpaceCnt := 0 
        }else{
            send +{Left}
        }
    }else if (emode = LineSelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Left}
            SpaceCnt := 0 
        }else{
            send +{Left}
        }
    }else{
        send  h
        emode := InsertMode
    }
return

j::
    if (emode = CommandMode) {
        if (SpaceCnt = 1){
            send {End}
            send {Down}
            SpaceCnt := 0 
        }else if (SpaceCnt = 2){
            send +{Space}
            send !8
            send {Esc}
            SpaceCnt := 0 
        }else{
            send {Down}
        }
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Down}
            SpaceCnt := 0 
        }else if (SpaceCnt = 2){
            send +{Space}
            send !8
            send {Esc}
            SpaceCnt := 0 
        }else{
            send +{Down}
        }
    }else if (emode = LineSelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Down}
            SpaceCnt := 0 
        }else{
            send +{Down}
        }
    }else{
        send j
        emode := InsertMode
    }
return

k::
    if (emode = CommandMode) {
        if (SpaceCnt = 1){
            send {End}
            send {Up}
            SpaceCnt := 0 
        }else{
            send {Up}
        }
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Up}
            SpaceCnt := 0 
        }else{
            send +{Up}
        }
    }else if (emode = LineSelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Up}
            SpaceCnt := 0 
        }else{
            send +{Up}
        }
    }else{
        send k 
        emode := InsertMode
    }
return

l::
    if (emode = CommandMode) {
        if (SpaceCnt = 1){
            send {End}
            send {Right}
            SpaceCnt := 0 
        }else if (SpaceCnt = 2){
            send ^{PgDn}
        }else{
            send {Right}
        }
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Right}
            SpaceCnt := 0 
        }else{
            send +{Right}
        }
    }else if (emode = LineSelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Right}
            SpaceCnt := 0 
        }else{
            send +{Right}
        }
    }else{
        send l 
        emode := InsertMode
    }
return

F13 & h::
    if (emode = CommandMode) {
        send ^x{Down}{Up}{Left}^v
    }else if (emode = SelectMode){
        send ^x{Down}{Up}{Left}^v
    }else if (emode = LineSelectMode){
    }else{
        send {Left}
    }
return

F13 & j::
    if (emode = CommandMode) {
        send ^x{Down}{Up}{Down}^v
    }else if (emode = SelectMode){
        send ^x{Down}{Up}{Down}^v
    }else if (emode = LineSelectMode){
    }else{
        send {Down}
    }
return

F13 & k::
    if (emode = CommandMode) {
        send ^x{Down}{Up}{Up}^v
    }else if (emode = SelectMode){
        send ^x{Down}{Up}{Up}^v
    }else if (emode = LineSelectMode){
    }else{
        send {Up}
    }
return

F13 & l::
    if (emode = CommandMode) {
        send ^x{Down}{Up}{Right}^v
    }else if (emode = SelectMode){
        send ^x{Down}{Up}{Right}^v
    }else if (emode = LineSelectMode){
    }else{
        send {Right}
    }
return

+h::
    if (emode = CommandMode) {
        if (SpaceCnt = 1){
            send {End}
            send {Left}
            SpaceCnt := 0 
        }else{
            send {Left}{Left}{Left}{Left}{Left}
        }
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Left}
            SpaceCnt := 0 
        }else{
            send +{Left}
        }
    }else if (emode = LineSelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Left}
            SpaceCnt := 0 
        }else{
            send +{Left}+{Left}+{Left}+{Left}+{Left}
        }
    }else{
        send  +h
        emode := InsertMode
    }
return

+j::
    if (emode = CommandMode) {
        if (SpaceCnt = 1){
            send {End}
            send {Down}
            SpaceCnt := 0 
        }else{
            send {Down}{Down}{Down}{Down}{Down}
        }
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Down}
            SpaceCnt := 0 
        }else{
            send +{Down}
        }
    }else if (emode = LineSelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Down}
            SpaceCnt := 0 
        }else{
            send +{Down}+{Down}+{Down}+{Down}+{Down}
        }
    }else{
        send +j
        emode := InsertMode
    }
return

+k::
    if (emode = CommandMode) {
        if (SpaceCnt = 1){
            send {End}
            send {Up}
            SpaceCnt := 0 
        }else{
            send {Up}{Up}{Up}{Up}{Up}
        }
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Up}
            SpaceCnt := 0 
        }else{
            send +{Up}
        }
    }else if (emode = LineSelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Up}
            SpaceCnt := 0 
        }else{
            send +{Up}+{Up}+{Up}+{Up}+{Up}
        }
    }else{
        send +k 
        emode := InsertMode
    }
return

+l::
    if (emode = CommandMode) {
        if (SpaceCnt = 1){
            send {End}
            send {Right}
            SpaceCnt := 0 
        }else{
            send {Right}{Right}{Right}{Right}{Right}
        }
    }else if (emode = SelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Right}
            SpaceCnt := 0 
        }else{
            send +{Right}
        }
    }else if (emode = LineSelectMode){
        if (SpaceCnt = 1){
            send {End}
            send +{Right}
            SpaceCnt := 0 
        }else{
            send +{Right}+{Right}+{Right}+{Right}+{Right}
        }
    }else{
        send +l 
        emode := InsertMode
    }
return


Return
#IfWinActive

;２連続入力に対応
; ~q up::
;   Input, iout, I T0.1 V L1, {Q}
;   if(ErrorLevel == "EndKey:I"){
;       MsgBox, [ Options, Title, Text, Timeout]
;   }
; Return
