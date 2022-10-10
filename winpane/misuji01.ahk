;; 2022/05/16
;; misuji script ver1.0

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

;;; misuji ;;;
global m1_sta_l := 0
global m1_sta_r := 0
global m1_sta_c := 0
global m1_sta_max := 0
global m1_sta_l_cls := 0
global m1_sta_l_opn := 1
global m1_sta_r_cls := 0
global m1_sta_r_opn := 1
global m1_sta_c_cls := 0
global m1_sta_c_opn := 1
global m1_ext_l
global m1_ext_r
global m1_moni_width
global m1_moni_height
global m1_Xedge_size := 100
global m1_Yedge_size := 100
global m1_x_l_def
global m1_y_l_def
global m1_x_r_def
global m1_y_r_def
global m1_x_div


global m2_sta_l := 0
global m2_sta_r := 0
global m2_sta_max := 0
global m2_sta_l_cls := 0
global m2_sta_c := 0
global m2_sta_l_opn := 1
global m2_sta_r_cls := 0
global m2_sta_r_opn := 1
global m2_sta_c_cls := 0
global m2_sta_c_opn := 1
global m2_ext_l
global m2_ext_r
global m2_moni_width
global m2_moni_height
global m2_Xedge_size := 100
global m2_Yedge_size := 100
global m2_x_l_def
global m2_y_l_def
global m2_x_r_def
global m2_y_r_def
global m2_x_div


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; reset key ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; F13 & q::send {Blind}^q
    ; F13 & w::send {Blind}^w
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
    ; F13 & 1::send {Blind}^1
    ; F13 & 2::send {Blind}^2
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basic key setting ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;---2 times F13---
; F13::
;     if(mode==WinSelMode){
;         mode := NormalMode
;         Send, {Enter}
;     }
;     If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 300){
;         send !{Tab}
;     }
;     Return

;---cursol move---
; F13 & K::send {Blind}{Up}
; F13 & J::send {Blind}{Down}
; F13 & H::send {Blind}{Left}
; F13 & L::send {Blind}{Right}
; F13 & I::send {Blind}{Home}
; F13 & O::send {Blind}{End}
F13 & K::send {Blind}{Down}
F13 & J::send {Blind}{Left}
F13 & L::send {Blind}{Right}
F13 & I::send {Blind}{Up}

F13 & Up::Send    {Blind}{PgUp}
F13 & Down::Send  {Blind}{PgDn}
F13 & Left::Send  {Blind}{Home}
F13 & Right::Send {Blind}{End}

;---other---
F13 & Space:: send ^{Space}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Misuji ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; initialize
    F1::
        WinGetPos,X_def,,,,A
        WinMaximize, A
        WinGetPos,X,Y,W,H,A
        if (X_def>0){
            m1_moni_width := W
            m1_moni_height := H
            WinRestore, A
            WinGetPos,X,Y,W,H,A
            m1_x_l_def := X
            m1_y_l_def := Y
            m1_x_r_def := X + W
            m1_y_r_def := Y
            m1_ext_l := X - m1_Xedge_size
            m1_ext_r := m1_moni_width - (X + W) - m1_Xedge_size
            m1_sta_l := m1_sta_l_cls
            m1_sta_r := m1_sta_r_cls
            m1_sta_c := m1_sta_c_cls
        }else if (X_def<0){
            m2_moni_width := W
            m2_moni_height := H
            WinRestore, A
            WinGetPos,X,Y,W,H,A
            m2_x_l_def := X
            m2_y_l_def := Y
            m2_x_r_def := X + W
            m2_y_r_def := Y
            m2_ext_l := m2_moni_width + m2_x_l_def - m2_Xedge_size
            m2_ext_r := -1 * m2_x_r_def - m2_Xedge_size
            m2_sta_l := m2_sta_l_cls
            m2_sta_r := m2_sta_r_cls
            m2_sta_c := m2_sta_c_cls
        }
        return
    
    MButton::
        resize_toggle()
        return

    ;; test
    F3::
        SysGet, moni, Monitor, 1
        if (moniRight>10){
            m1_moni_width := moniRight
            m1_moni_height := moniBottom
        }
        if (moniLeft<-10){
            m2_moni_width := moniLeft
            m2_moni_height := moniBottom
        }
        SysGet, moni, Monitor, 2
        if (moniRight>10){
            m1_moni_width := moniRight
            m1_moni_height := moniBottom
        }
        if (moniLeft<-10){
            m2_moni_width := -1*moniLeft
            m2_moni_height := moniBottom
        }
        CoordMode, Mouse, Screen ;; mouse absolute pos setting
        MouseMove, m1_moni_width/2, m1_moni_height/2, 0
        MouseGetPos, X, Y, winid
        WinActivate, ahk_id %winid%
        WinGetPos,X,Y,W,H,A
        m1_x_div := X
        MouseMove, -m2_moni_width/2, m2_moni_height/2, 0
        MouseGetPos, X, Y, winid
        WinActivate, ahk_id %winid%
        WinGetPos,X,Y,W,H,A
        m2_x_div := X
        MsgBox, %m1_x_div% %m2_x_div%
        return

    ;; toggle window
    F13 & LButton::
        ; MsgBox, %m1_sta_max% %m2_sta_max%
        CoordMode, Mouse, Screen ;; mouse absolute pos setting
        MouseGetPos, X, Y
        if ((X>0&&m1_sta_max==0)||(X<0&&m2_sta_max==0)){
            if (X>0 && X<m1_ext_l){
                MouseMove, m1_moni_width/2, Y, 0
                MouseGetPos, Xc, Yc, winid
                WinActivate, ahk_id %winid%
                resize_toggle_l()
                MouseMove, X, Y, 0
            }else if (X>m1_x_r_def && X<m1_moni_width){
                MouseMove, m1_moni_width/2, Y, 0
                MouseGetPos, Xc, Yc, winid
                WinActivate, ahk_id %winid%
                resize_toggle_r()
                MouseMove, X, Y, 0            
            }else if (X>-m2_moni_width && X<m2_x_l_def){
                MouseMove, -m2_moni_width/2, Y, 0
                MouseGetPos, Xc, Yc, winid
                WinActivate, ahk_id %winid%
                resize_toggle_l()
                MouseMove, X, Y, 0
            }else if (X>m2_x_r_def && X<0){
                MouseMove, -m2_moni_width/2, Y, 0
                MouseGetPos, Xc, Yc, winid
                WinActivate, ahk_id %winid%
                resize_toggle_r()
                MouseMove, X, Y, 0            
            }
        }
        return
    
    ;; toggle window maxmin
    F13 & RButton::
        resize_toggle_minmax()
        return
    
    ;; alternative ctrl click
    ^+LButton::
        send {CtrlDown}
        MouseClick LEFT , , , , , D,
        MouseClick LEFT , , , , , U,
        send {CtrlUp}
        return

    ;; print
    print1(){
        WinGetPos,X,Y,W,H,A
        MsgBox, %X% %Y% %W% %H%
        MsgBox, %m1_x_l_def% %m1_y_l_def% %m1_x_r_def% %m1_y_r_def%
        MsgBox, %m1_ext_l% %m1_ext_r%
        MsgBox, %m2_x_l_def% %m2_y_l_def% %m2_x_r_def% %m2_y_r_def%
        MsgBox, %m2_ext_l% %m2_ext_r%
    }

    ;; resize func
    resizewin(Xpos, Ypos, Width, Height){
        WinMove, A, , Xpos, Ypos, Width, Height
    }

    resize_toggle_l(){
        WinGetPos,X,Y,W,H,A
        if (X>0){
            if (m1_sta_l==m1_sta_l_cls){
                resizewin(X-m1_ext_l, Y, W+m1_ext_l, H)
                m1_sta_l := m1_sta_l_opn
            }else if (m1_sta_l==m1_sta_l_opn){
                resizewin(X+m1_ext_l, Y, W-m1_ext_l, H)
                m1_sta_l := m1_sta_l_cls
            }
            if (m1_sta_l==m1_sta_l_cls&&m1_sta_r==m1_sta_r_cls){
                m1_sta_c := m1_sta_c_cls
            }else if (m1_sta_l==m1_sta_l_opn&&m1_sta_r==m1_sta_r_opn){
                m1_sta_c := m1_sta_c_opn
            }
        }else{
            if (m2_sta_l==m2_sta_l_cls){
                resizewin(X-m2_ext_l, Y, W+m2_ext_l, H)
                m2_sta_l := m2_sta_l_opn
            }else if (m2_sta_l==m2_sta_l_opn){
                resizewin(X+m2_ext_l, Y, W-m2_ext_l, H)
                m2_sta_l := m2_sta_l_cls
            }
            if (m2_sta_l==m2_sta_l_cls&&m2_sta_r==m2_sta_r_cls){
                m2_sta_c := m2_sta_c_cls
            }else if (m2_sta_l==m2_sta_l_opn&&m2_sta_r==m2_sta_r_opn){
                m2_sta_c := m2_sta_c_opn
            }
        }
    }

    resize_toggle_r(){
        WinGetPos,X,Y,W,H,A
        if (X>0){
            if (m1_sta_r==m1_sta_r_cls){
                resizewin(X, Y, W+m1_ext_r, H)
                m1_sta_r := m1_sta_r_opn
            }else if (m1_sta_r==m1_sta_r_opn){
                resizewin(X, Y, W-m1_ext_r, H)
                m1_sta_r := m1_sta_r_cls
            }
            if (m1_sta_l==m1_sta_l_cls&&m1_sta_r==m1_sta_r_cls){
                m1_sta_c := m1_sta_c_cls
            }else if (m1_sta_l==m1_sta_l_opn&&m1_sta_r==m1_sta_r_opn){
                m1_sta_c := m1_sta_c_opn
            }
        }else{
            if (m2_sta_r==m2_sta_r_cls){
                resizewin(X, Y, W+m2_ext_r, H)
                m2_sta_r := m2_sta_r_opn
            }else if (m2_sta_r==m2_sta_r_opn){
                resizewin(X, Y, W-m2_ext_r, H)
                m2_sta_r := m2_sta_r_cls
            }
            if (m2_sta_l==m2_sta_l_cls&&m2_sta_r==m2_sta_r_cls){
                m2_sta_c := m2_sta_c_cls
            }else if (m2_sta_l==m2_sta_l_opn&&m2_sta_r==m2_sta_r_opn){
                m2_sta_c := m2_sta_c_opn
            }
        }
    }

    resize_toggle_c(){
        WinGetPos,X,Y,W,H,A
        if (X>0){
            if (m1_sta_c==m1_sta_c_cls){
                resizewin(m1_Xedge_size, Y, m1_moni_width-m1_Xedge_size*2, H)
                m1_sta_c := m1_sta_c_opn
                m1_sta_l := m1_sta_l_opn
                m1_sta_r := m1_sta_r_opn
            }else if (m1_sta_c==m1_sta_c_opn){
                resizewin(m1_x_l_def, Y, m1_x_r_def - m1_x_l_def, H)
                m1_sta_c := m1_sta_c_cls
                m1_sta_l := m1_sta_l_cls
                m1_sta_r := m1_sta_r_cls
            }
        }else{
            if (m2_sta_c==m2_sta_c_cls){
                resizewin(-m2_moni_width + m2_Xedge_size, Y, m2_moni_width-m2_Xedge_size*2, H)
                m2_sta_c := m2_sta_c_opn
                m2_sta_l := m2_sta_l_opn
                m2_sta_r := m2_sta_r_opn
            }else if (m2_sta_c==m2_sta_c_opn){
                resizewin(m2_x_l_def, Y, m2_x_r_def - m2_x_l_def, H)
                m2_sta_c := m2_sta_c_cls
                m2_sta_l := m2_sta_l_cls
                m2_sta_r := m2_sta_r_cls
            }
        }
    }

    resize_toggle_minmax(){
        CoordMode, Mouse, Screen ;; mouse absolute pos setting
        MouseGetPos,X,Y,winid
        WinActivate, ahk_id %winid%
        WinGet, max, MinMax, A
        if (max==0){
            WinMaximize, A
            if (X>0){
                m1_sta_max := 1
            }else{
                m2_sta_max := 1                
            }
        }else{
            WinRestore, A
            if (X>0){
                m1_sta_max := 0
            }else{
                m2_sta_max := 0
            }
        }
    }

    resize_toggle(){
        CoordMode, Mouse, Screen ;; mouse absolute pos setting
        MouseGetPos, Xmou, Ymou, winid
        WinActivate, ahk_id %winid%
        WinGetPos,X,Y,W,H,A
        ; MsgBox, %X% %Y% %H%
        if (Xmou>0){
            if (m1_sta_l==m1_sta_l_opn){
                resizewin(X,Y,m1_x_div,H)
                m1_sta_l := m1_sta_l_cls
            }else if (m1_sta_r==m1_sta_r_opn){
                resizewin(m1_x_div, Y, m1_moni_width-m1_x_div, H)
                m1_sta_r := m1_sta_r_cls
            }else{
                if (Xmou>-100 && Xmou<m1_x_div){
                    resizeWin(X,Y,m1_moni_width-X-m1_Xedge_size,H)
                    m1_sta_l := m1_sta_l_opn
                }else if (Xmou>m1_x_div){
                    resizewin(m1_Xedge_size, Y, m1_moni_width-m1_Xedge_size, H)
                    m1_sta_r := m1_sta_r_opn
                }
            }
        }else{
            if (m2_sta_l==m2_sta_l_opn){
                resizewin(X,Y,m2_x_div,H)
                m2_sta_l := m2_sta_l_cls
            }else if (m2_sta_r==m2_sta_r_opn){
                resizewin(m2_x_div, Y, m2_moni_width+m2_x_div, H)
                m2_sta_r := m2_sta_r_cls
            }else{
                ;;ここまで書いた
                if (Xmou>m2_moni_width && Xmou<m2_x_div){
                    resizeWin(X,Y,m2_moni_width-X-m2_Xedge_size,H)
                    m2_sta_l := m2_sta_l_opn
                }else if (Xmou>m2_x_div){
                    resizewin(m2_Xedge_size, Y, m2_moni_width-m2_Xedge_size, H)
                    m2_sta_r := m2_sta_r_opn
                }
            }
        }
    }

    resize_toggle_r2(){
        WinGetPos,X,Y,W,H,A
        if (X>0){
            if (m1_sta_r==m1_sta_r_cls){
                resizewin(X, Y, W+m1_ext_r, H)
                m1_sta_r := m1_sta_r_opn
            }else if (m1_sta_r==m1_sta_r_opn){
                resizewin(X, Y, W-m1_ext_r, H)
                m1_sta_r := m1_sta_r_cls
            }
            if (m1_sta_l==m1_sta_l_cls&&m1_sta_r==m1_sta_r_cls){
                m1_sta_c := m1_sta_c_cls
            }else if (m1_sta_l==m1_sta_l_opn&&m1_sta_r==m1_sta_r_opn){
                m1_sta_c := m1_sta_c_opn
            }
        }else{
            if (m2_sta_r==m2_sta_r_cls){
                resizewin(X, Y, W+m2_ext_r, H)
                m2_sta_r := m2_sta_r_opn
            }else if (m2_sta_r==m2_sta_r_opn){
                resizewin(X, Y, W-m2_ext_r, H)
                m2_sta_r := m2_sta_r_cls
            }
            if (m2_sta_l==m2_sta_l_cls&&m2_sta_r==m2_sta_r_cls){
                m2_sta_c := m2_sta_c_cls
            }else if (m2_sta_l==m2_sta_l_opn&&m2_sta_r==m2_sta_r_opn){
                m2_sta_c := m2_sta_c_opn
            }
        }
    }
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Onenote ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global onenote_mode := 0
#IfWinActive,ahk_exe ONENOTE.EXE
    RButton::
        send !1
        return
    +RButton::
        MouseClick Right , , , , , D,
        MouseClick Right , , , , , U,
        return
    WheelUp::
        send ^{WheelUp}
        return
    WheelDown::
        send ^{WheelDown}
        return
    F13 & WheelUp::
        send {WheelUp}
        return
    F13 & WheelDown::
        send {WheelDown}
        return
#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Miro ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#IfWinActive,ahk_exe Miro.exe
    F13 & t::
        send t
        MouseClick LEFT , , , , , D,
        MouseClick LEFT , , , , , U,
        return
    MButton::
        send t
        MouseClick LEFT , , , , , D,
        MouseClick LEFT , , , , , U,
        return
    ;; Double Click as create new TEXT
    LButton::
        If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 300){
            send t
            MouseClick LEFT , , , , , D,
            MouseClick LEFT , , , , , U,
        }else{
            MouseClick LEFT , , , , , D,
            Keywait LButton, 
            MouseClick LEFT , , , , , U,
        }
        Return
#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Excel ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive,ahk_exe EXCEL.exe
    F13 & Enter::
        send {F2}
        return
    +Enter::
        send !{Enter}
        return
#IfWinActive