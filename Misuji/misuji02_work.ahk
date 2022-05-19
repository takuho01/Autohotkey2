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
global xedge := 50
global yedge := 50
global cendiv := 2
global wp_init_flag := 0
global click
global m1_middle := 1000
global m2_middle := -1500
global m1_l_half :=0
global m1_r_half :=0
global m1_c_opn := 0
global m2_l_half :=0
global m2_r_half :=0
global m2_c_opn := 0

global m1lX := 300
global m1lY := 300
global m1lW := 700
global m1lH := 600
global m1rX := 1300
global m1rY := 500
global m1rW := 700
global m1rH := 600
global m1cX := 900
global m1cY := 500
global m1cW := 700
global m1cH := 600

global m2lX := -1000
global m2lY := 500
global m2lW := 700
global m2lH := 600
global m2rX := -1300
global m2rY := 500
global m2rW := 700
global m2rH := 600
global m2cX := -900
global m2cY := 500
global m2cW := 700
global m2cH := 600

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
;     Keywait, F13, U
;     Keywait, F13, D T0.2
;     if (ErrorLevel=1){
;         MsgBox, a  
;     }else{
;         MsgBox, b
;     }
;     return

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
    F3::
        CoordMode, Mouse, Screen ;; mouse absolute pos setting
        MouseGetPos, Xmou, Ymou, winid
        if (Xmou>0){
            m1_middle := Xmou
        }else {
            m2_middle := Xmou
        }
        return
    
    F4::
        CoordMode, Mouse, Screen ;; mouse absolute pos setting
        MouseGetPos, Xmou, Ymou, winid
        WinActivate, ahk_id %winid%
        WinGetPos,X,Y,W,H,A
        m2_middle := X
        return

    ^LButton::
        Keywait, LButton, U
        Keywait, LButton, D T0.1
        if (ErrorLevel=1){
            get_moni()
            click := 0
            resize_toggle4()            
        }else{
            get_moni()
            click := 2
            resize_toggle4()
        }
        return

    ^RButton::
        get_moni()
        click := 1
        resize_toggle4()
        return
    
    F13 & LButton::
        send {CtrlDown}
        MouseClick LEFT , , , , , D,
        MouseClick LEFT , , , , , U,
        send {CtrlUp}
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

    resize_toggle3(){
        CoordMode, Mouse, Screen ;; mouse absolute pos setting
        MouseGetPos, Xmou, Ymou, winid
        WinActivate, ahk_id %winid%
        WinGetPos,X,Y,W,H,A
        if (Xmou>0){
            if (W>m1_moni_width-xedge-100){
                if (X>xedge/2) {
                    ;; close right
                    resizewin(m1_x_div, Y, m1_moni_width-m1_x_div, H)
                }else{
                    ;; close left
                    resizewin(X, Y, m1_x_div, H)
                }
            }else{
                if (X>xedge){
                    ;; open right
                    resizewin(xedge, Y, m1_moni_width-xedge, H)
                    m1_x_div := X
                }else{
                    ;; open left
                    resizewin(X, Y, m1_moni_width-xedge, H)
                    m1_x_div := W
                }
            }
        }else {
            if (W>m2_moni_width-xedge-100){
                if (X>-m2_moni_width+xedge/2) {
                    ;; close right
                    resizewin(m2_x_div, Y, -m2_x_div, H)
                }else{
                    ;; close left
                    resizewin(X, Y,m2_moni_width+m2_x_div, H)
                }
            }else{
                if (X>-m2_moni_width+xedge){
                    ;; open right
                    resizewin(-m2_moni_width+xedge, Y, m2_moni_width-xedge, H)
                    m2_x_div := X
                }else{
                    ;; open left
                    resizewin(X, Y, m2_moni_width-xedge, H)
                    m2_x_div := X+W
                }
            }
        }
    }

    resize_toggle4(){
        CoordMode, Mouse, Screen ;; mouse absolute pos setting
        MouseGetPos, Xmou, Ymou, winid
        WinActivate, ahk_id %winid%
        WinGetPos,X,Y,W,H,A
        if (Xmou>0){
            if (W>m1_moni_width-xedge*2-100){
                ;;close center
                resizewin(m1cX, m1cY, m1cW, m1cH)
                m1_c_opn := 0
            }else if (H>m1_moni_height-yedge*2-100){
                if (click==2){
                    if (m1_c_opn==0){
                        ;; open center
                        resizewin(xedge, yedge, m1_moni_width - xedge*2 - 20, m1_moni_height-yedge*2)
                        m1_c_opn := 1
                        m1cX := X 
                        m1cY := Y
                        m1cW := W
                        m1cH := H
                    }
                }else if (Xmou<m1_middle) {
                    ;; close left
                    resizewin(m1lX, m1lY, m1lW, m1lH)
                    m1_l_half := 0
                }else{
                    ;; close right
                    resizewin(m1rX, m1rY, m1rW, m1rH)
                    m1_r_half := 0
                }
            }else{
                if (click==0){
                    if (m1_l_half==0){
                        ;; open left
                        resizewin(0, yedge, m1_middle, m1_moni_height-yedge*2)
                        m1_l_half := 1
                        m1lX := X 
                        m1lY := Y
                        m1lW := W
                        m1lH := H
                    }
                }else if(click==1){
                    if (m1_r_half==0){
                        ;; open right
                        resizewin(m1_middle, yedge, m1_moni_width - m1_middle, m1_moni_height-yedge*2)
                        m1_r_half := 1
                        m1rX := X 
                        m1rY := Y
                        m1rW := W
                        m1rH := H
                    }
                }else if(click==2){
                    if (m1_c_opn==0){
                        ;; open center
                        resizewin(xedge, yedge, m1_moni_width - xedge*2 - 20, m1_moni_height-yedge*2)
                        m1_c_opn := 1
                        m1cX := X 
                        m1cY := Y
                        m1cW := W
                        m1cH := H
                    }
                }
            }
        }else {
            if (W>m2_moni_width-xedge*2-100){
                ;;close center
                resizewin(m2cX, m2cY, m2cW, m2cH)
                m2_c_opn := 0
            }else if (H>m2_moni_height-yedge*2-100){
                if (click==2){
                    if (m2_c_opn==0){
                        ;; open center
                        resizewin(-m2_moni_width+xedge, yedge, m2_moni_width - xedge*2 - 20, m2_moni_height-yedge*2)
                        m2cX := X 
                        m2cY := Y
                        m2cW := W
                        m2cH := H
                    }
                }else if (Xmou<m2_middle) {
                    ;; close left
                    resizewin(m2lX, m2lY, m2lW, m2lH)
                    m2_l_half := 0
                }else{
                    ;; close right
                    resizewin(m2rX, m2rY, m2rW, m2rH)
                    m2_r_half := 0
                }
            }else{
                if (click==0){
                    if (m2_l_half==0){
                        ;; open left
                        resizewin(-m2_moni_width, yedge, m2_moni_width+m2_middle, m2_moni_height-yedge*2)
                        ; resizeWin(-1000, 100, 1000, 1000)
                        m2_l_half := 1
                        m2lX := X 
                        m2lY := Y
                        m2lW := W
                        m2lH := H
                    }
                }else if(click==1){
                    if (m2_r_half==0){
                        ;; open right
                        resizewin(m2_middle, yedge, -m2_middle, m2_moni_height-yedge*2)
                        m2_r_half := 1
                        m2rX := X 
                        m2rY := Y
                        m2rW := W
                        m2rH := H
                    }
                }else if(click==2){
                    if (m2_c_opn==0){
                        ;; open center
                        resizewin(-m2_moni_width+xedge, yedge, m2_moni_width - xedge*2 - 20, m2_moni_height-yedge*2)
                        m2cX := X 
                        m2cY := Y
                        m2cW := W
                        m2cH := H
                    }
                }
            }
        }
    }

    get_moni(){
        if (wp_init_flag==0){
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
            wp_init_flag := 1
        }        
    }
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Onenote ;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;; Miro ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive,ahk_exe Miro.exe
    ;; Double Click as create new TEXT
    ; LButton::
    ;     If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 300){
    ;         send t
    ;         MouseClick LEFT , , , , , D,
    ;         MouseClick LEFT , , , , , U,
    ;     }else{
    ;         MouseClick LEFT , , , , , D,
    ;         Keywait LButton, 
    ;         MouseClick LEFT , , , , , U,
    ;     }
    ;     Return
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
    ^Enter::
        send {Down} 
        send +{Space} 
        send ^+=
        return
    F13 & BackSpace::
        send +{Space}
        send ^-
        return
    F13 & Up::Send    {Blind}{End}{Up}
    F13 & Down::Send  {Blind}{End}{Down}
    F13 & Left::Send  {Blind}{End}{Left}
    F13 & Right::Send {Blind}{End}{Right}
    ^Up::Send     ^x{Down}{Up}{Up}^v
    ^Down::Send   ^x{Down}{Up}{Down}^v
    ^Left::Send   ^x{Down}{Up}{Left}^v
    ^Right::Send  ^x{Down}{Up}{Right}^v
#IfWinActive