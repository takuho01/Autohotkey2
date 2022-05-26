;; 2022/05/21 Taku Honda

;---spjlekcial move---
; 変数定義は一番最初で実行しないと、謎のエラーが起きる
global winpane_on := 1

;;; winpane ;;;
global xedge := 20
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
global m1_Xedge_size := 20
global m1_Yedge_size := 20
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
global m2_Xedge_size := 20
global m2_Yedge_size := 20
global m2_x_l_def
global m2_y_l_def
global m2_x_r_def
global m2_y_r_def
global m2_x_div

;;; keep memo ;;;
global km_mode := 0
global km_pid := 28176

;;; excel vim ;;;
global ev_mode := 0
global normal_mode := 0
global insert_mode := 1
global visual_mode := 2
global space_mode := 4

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
;;; winpane ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If, winpane_on
    LButton::
        LButton_count := 0
                    resize_toggle4()
                }
            }else{
                if (Xmou<m2_middle){
                    get_moni()
                    click := 0
                    resize_toggle4()
                    click := 1
                    resize_toggle4()
                }
            }
        }
        return

    ^RButton::
        RButton_count := 0
        Xmou_hold := 0
        Ymou_hold := 0
        CoordMode, Mouse, Screen ;; mouse absolute pos setting
        MouseGetPos, Xmou, Ymou, winid
        WinActivate, ahk_id %winid%
        WinGetPos,X,Y,W,H,A
        Xmou_pre := Xmou
        Ymou_pre := Ymou
        xt := X+0*(W/3)
        x1 := X+1*(W/3)
        x2 := X+2*(W/3)
        xb := X+3*(W/3)
        yt := Y+0*(H/3)
        y1 := Y+1*(H/3)
        y2 := Y+2*(H/3)        
        yb := Y+3*(H/3)
        rsz_lt := 0
        rsz_lm := 1
        rsz_lb := 2
        rsz_mt := 3
        rsz_mm := 4
        rsz_mb := 5
        rsz_rt := 6
        rsz_rm := 7
        rsz_rb := 8
        
        if ((Xmou>xt && Xmou<x1)&&(Ymou>yt && Ymou<y1 )){
            resize_type := rsz_lt
            X_fix := X+W
            Y_fix := Y+H
            Xmou_edge := X - Xmou
            Ymou_edge := Y - Ymou
        }else if ((Xmou>xt && Xmou<x1)&&(Ymou>y1 && Ymou<y2 )){
            resize_type := rsz_lm
            X_fix := X+W
            ; Y_fix := Y+H
            Xmou_edge := X - Xmou
            ; Ymou_edge := Y - Ymou
        }else if ((Xmou>xt && Xmou<x1)&&(Ymou>y2 && Ymou<yb )){
            resize_type := rsz_lb
            X_fix := X+W
            Y_fix := Y
            Xmou_edge := X - Xmou
            Ymou_edge := Y+H - Ymou
        }else if ((Xmou>x1 && Xmou<x2)&&(Ymou>yt && Ymou<y1 )){
            resize_type := rsz_mt
            ; X_fix := X+W
            Y_fix := Y+H
            ; Xmou_edge := X - Xmou
            Ymou_edge := Y - Ymou
        }else if ((Xmou>x1 && Xmou<x2)&&(Ymou>y1 && Ymou<y2 )){
            resize_type := rsz_mm
            Xmou_edge := X - Xmou
            Ymou_edge := Y - Ymou
        }else if ((Xmou>x1 && Xmou<x2)&&(Ymou>y2 && Ymou<yb )){
            resize_type := rsz_mb
            ; X_fix := X
            Y_fix := Y
            ; Xmou_edge := X+W-Xmou
            Ymou_edge := Y+H-Ymou
        }else if ((Xmou>x2 && Xmou<xb)&&(Ymou>yt && Ymou<y1 )){
            resize_type := rsz_rt
            X_fix := X
            Y_fix := Y+H            
            Xmou_edge := X+W - Xmou
            Ymou_edge := Y - Ymou            
        }else if ((Xmou>x2 && Xmou<xb)&&(Ymou>y1 && Ymou<y2 )){
            resize_type := rsz_rm
            ; X_fix := X
            ; Y_fix := Y+H            
            Xmou_edge := X+W - Xmou
            ; Ymou_edge := Y - Ymou            
        }else if ((Xmou>x2 && Xmou<xb)&&(Ymou>y2 && Ymou<yb )){
            resize_type := rsz_rb
            X_fix := X
            Y_fix := Y
            Xmou_edge := X+W-Xmou
            Ymou_edge := Y+H-Ymou
        }
        
        Keywait, RButton, U T0.1
        if (ErrorLevel=1){
            Loop{
                ; Sleep, 1
                RButton_count := RButton_count + 1
                CoordMode, Mouse, Screen ;; mouse absolute pos setting
                MouseGetPos, Xmou, Ymou, winid
                Xmou_diff := Xmou - Xmou_pre
                Ymou_diff := Ymou - Ymou_pre
                Xmou_hold := Xmou_hold + Xmou_diff
                Ymou_hold := Ymou_hold + Ymou_diff
                Xmou_pre := Xmou
                Ymou_pre := Ymou
                WinGetPos,X,Y,W,H,A
                if (resize_type==rsz_lt){
                    resizewin(Xmou+Xmou_edge, Ymou+Ymou_edge, X_fix-(Xmou+Xmou_edge), Y_fix-(Ymou+Ymou_edge))
                }else if (resize_type==rsz_lm){
                    resizewin(Xmou+Xmou_edge, Y, X_fix-(Xmou+Xmou_edge), H)
                }else if (resize_type==rsz_lb){
                    resizewin(Xmou+Xmou_edge, Y_fix, X_fix-(Xmou+Xmou_edge), Ymou+Ymou_edge-Y_fix)    
                }else if (resize_type==rsz_rt){
                    resizewin(X_fix, Ymou+Ymou_edge, Xmou+Xmou_edge-X_fix, Y_fix-(Ymou+Ymou_edge))
                }else if (resize_type==rsz_rm){
                    resizewin(X, Y, Xmou+Xmou_edge-X, H)
                }else if (resize_type==rsz_rb){
                    resizewin(X, Y, Xmou-X+Xmou_edge, Ymou-Y+Ymou_edge)
                }else if (resize_type==rsz_mt){
                    resizewin(X, Ymou+Ymou_edge, W, Y_fix-(Ymou+Ymou_edge))
                }else if (resize_type==rsz_mb){
                    resizewin(X, Y, W, Ymou-Y+Ymou_edge)
                }else if (resize_type==rsz_mm){
                    resizewin(Xmou + Xmou_edge, Ymou + Ymou_edge, W, H)
                }
                GetKeyState, state, RButton, P
                If state = U			; The key has been released, so break out of the loop.
                    Break
            }
        }else{
            resizewin(Xmou-200, Ymou-200, 500, 400)

        }
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

    wp_off(){
        if (winpane_on==1){
            send ^+2  
            winpane_on := 0
        }
    }

    wp_on(){
        if (winpane_on==0){
            send ^+2  
            winpane_on := 1
        }
    }

    ;; resize func
    resizewin(Xpos, Ypos, Width, Height){
        WinMove, A, , Xpos, Ypos, Width, Height
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
                    ; if (m1_c_opn==0){
                        ;; open center
                        resizewin(xedge, yedge-20, m1_moni_width - xedge*2 - 20, m1_moni_height-yedge*2)
                        wp_off()
                        m1_c_opn := 1
                        m1cX := X 
                        m1cY := Y
                        m1cW := W
                        m1cH := H
                    ; }
                }else if (Xmou<m1_middle) {
                    ;; close left
                    resizewin(m1lX, m1lY, m1lW, m1lH)
                    m1_middle := X+W
                    m1_l_half := 0
                }else{
                    ;; close right
                    resizewin(m1rX, m1rY, m1rW, m1rH)
                    m1_middle := X
                    m1_r_half := 0
                }
            }else{
                if (click==0){
                    ; if (m1_l_half==0){
                        ;; open left
                        resizewin(0, yedge, m1_middle, m1_moni_height-yedge*2)
                        m1_l_half := 1
                        m1lX := X 
                        m1lY := Y
                        m1lW := W
                        m1lH := H
                    ; }
                }else if(click==1){
                    ; if (m1_r_half==0){
                        ;; open right
                        resizewin(m1_middle, yedge, m1_moni_width - m1_middle, m1_moni_height-yedge*2)
                        m1_r_half := 1
                        m1rX := X 
                        m1rY := Y
                        m1rW := W
                        m1rH := H
                    ; }
                }else if(click==2){
                    ; if (m1_c_opn==0){
                        ;; open center
                        resizewin(xedge, yedge-20, m1_moni_width - xedge*2, m1_moni_height-yedge*2)
                        wp_off()
                        m1_c_opn := 1
                        m1cX := X 
                        m1cY := Y
                        m1cW := W
                        m1cH := H
                    ; }
                }
            }
        }else {
            if (W>m2_moni_width-xedge*2-100){
                ;;close center
                resizewin(m2cX, m2cY, m2cW, m2cH)
                m2_c_opn := 0
            }else if (H>m2_moni_height-yedge*2-100){
                if (click==2){
                    ; if (m2_c_opn==0){
                        ;; open center
                        resizewin(-m2_moni_width+xedge, yedge-20, m2_moni_width - xedge*2 - 20, m2_moni_height-yedge*2)
                        wp_off()
                        m2cX := X 
                        m2cY := Y
                        m2cW := W
                        m2cH := H
                    ; }
                }else if (Xmou<m2_middle) {
                    ;; close left
                    resizewin(m2lX, m2lY, m2lW, m2lH)
                    m2_middle := X+W
                    m2_l_half := 0
                }else{
                    ;; close right
                    resizewin(m2rX, m2rY, m2rW, m2rH)
                    m2_middle := X
                    m2_r_half := 0
                }
            }else{
                if (click==0){
                    ; if (m2_l_half==0){
                        ;; open left
                        resizewin(-m2_moni_width, yedge, m2_moni_width+m2_middle, m2_moni_height-yedge*2)
                        ; resizeWin(-1000, 100, 1000, 1000)
                        m2_l_half := 1
                        m2lX := X 
                        m2lY := Y
                        m2lW := W
                        m2lH := H
                    ; }
                }else if(click==1){
                    ; if (m2_r_half==0){
                        ;; open right
                        resizewin(m2_middle, yedge, -m2_middle, m2_moni_height-yedge*2)
                        m2_r_half := 1
                        m2rX := X 
                        m2rY := Y
                        m2rW := W
                        m2rH := H
                    ; }
                }else if(click==2){
                    ; if (m2_c_opn==0){
                        ;; open center
                        resizewin(-m2_moni_width+xedge, yedge-20, m2_moni_width - xedge*2, m2_moni_height-yedge*2)
                        wp_off()
                        m2cX := X 
                        m2cY := Y
                        m2cW := W
                        m2cH := H
                    ; }
                }
            }
        }
    }

    resize_toggle5(){
        ; CoordMode, Mouse, Screen ;; mouse absolute pos setting
        ; MouseGetPos, Xmou, Ymou, winid
        ; WinActivate, ahk_id %winid%
        ; WinGetPos,X,Y,W,H,A
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
                    m1_middle := X+W
                    m1_l_half := 0
                }else{
                    ;; close right
                    resizewin(m1rX, m1rY, m1rW, m1rH)
                    m1_middle := X
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
                        resizewin(xedge, yedge, m1_moni_width - xedge*2, m1_moni_height-yedge*2)
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
                    m2_middle := X+W
                    m2_l_half := 0
                }else{
                    ;; close right
                    resizewin(m2rX, m2rY, m2rW, m2rH)
                    m2_middle := X
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
                        resizewin(-m2_moni_width+xedge, yedge, m2_moni_width - xedge*2, m2_moni_height-yedge*2)
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
;;; keep memo ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    F13 & t::
        ; MsgBox, hoge
        if (km_mode==0){
            WinRestore, ahk_pid %km_pid%, , , 
            WinActivate, ahk_pid %km_pid%
            WinMove, ahk_pid %km_pid%, ,600, 300, 1200, 800
            km_mode := 1
        }else {
            WinMinimize,  ahk_pid %km_pid%, , ,
            km_mode := 0
        }
        return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Miro ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive,ahk_exe Miro.exe
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
;;; Onenote ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive,ahk_exe ONENOTE.EXE
    ;; Double Click as create new TEXT
    ; LButton::
    ;     If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 300){
    ;         send {CtrlDown}
    ;         MouseClick LEFT , , , , , D,
    ;         MouseClick LEFT , , , , , U,
    ;         send {CtrlUp}            
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
    ; F13 & Enter::
    ;     send {F2}
    ;     return
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

#IF (ev_mode==0 && km_mode==1)
    F13 & q::
        MsgBox, 0
        ev_mode := 1
        return
    F13 & c::
        return
    F13 & Enter::
        send {F2}
        change_insert_mode() 
        return    
    h::send {Left}
    j::send {Down}
    k::send {Up}
    l::send {Right}
    x::send {Delete}
    i:: change_insert_mode()

    a:: return
    b:: return
    c:: return
    d:: return
    e:: return
    f:: return
    g:: return
    ; i:: return
    ; j:: return
    ; k:: return
    ; l:: return
    m:: return
    n:: return
    o:: return
    p:: return
    q:: return
    r:: return
    s:: return
    t:: return
    u:: return
    v:: return
    w:: return
    ; x:: return
    y:: return
    z:: return
#IF

#IF (ev_mode==1 && km_mode==1)
    F13 & q::
        MsgBox, 1
        ev_mode := 0
        return
    F13 & c::change_normal_mode()
#IF



change_normal_mode(){
    if (ev_mode==1){
        send {Enter}{Up}
    }
    ev_mode := 0
}
change_insert_mode(){
    ev_mode := 1
}
change_visual_mode(){
    ev_mode := 2
}
change_visual_line_mode(){
    ev_mode := 3
}
change_space_mode(){
    ev_mode := 4
}