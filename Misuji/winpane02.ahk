;; 2022/05/21 Taku Honda

;---spjlekcial move---
; 変数定義は一番最初で実行しないと、謎のエラーが起きる
global winpane_on := 1

;;; winpane ;;;
global Xrate
global Yrate
global Wrate
global Hrate
global Xmou_rate
global Ymou_rate
global moni_sel
global middle_rate
global wp_init_flag := 0
global xedge := 0.01
global yedge := 0.01

global m1_moni_left
global m1_moni_top
global m1_moni_width
global m1_moni_height
global m1_middle_rate := 0.5
global m1_c_buf_x := 0.4
global m1_c_buf_y := 0.4
global m1_c_buf_w := 0.3
global m1_c_buf_h := 0.4
global m1_l_buf_x := 0.2
global m1_l_buf_y := 0.4
global m1_l_buf_w := 0.3
global m1_l_buf_h := 0.4
global m1_r_buf_x := 0.6
global m1_r_buf_y := 0.4
global m1_r_buf_w := 0.3
global m1_r_buf_h := 0.4

global m2_moni_left
global m2_moni_top
global m2_moni_width
global m2_moni_height
global m2_middle_rate := 0.5
global m2_c_buf_x := 0.4
global m2_c_buf_y := 0.4
global m2_c_buf_w := 0.3
global m2_c_buf_h := 0.4
global m2_l_buf_x := 0.2
global m2_l_buf_y := 0.4
global m2_l_buf_w := 0.3
global m2_l_buf_h := 0.4
global m2_r_buf_x := 0.6
global m2_r_buf_y := 0.4
global m2_r_buf_w := 0.3
global m2_r_buf_h := 0.4

global m3_moni_left
global m3_moni_top
global m3_moni_width
global m3_moni_height
global m3_middle_rate := 0.5
global m3_c_buf_x := 0.4
global m3_c_buf_y := 0.4
global m3_c_buf_w := 0.3
global m3_c_buf_h := 0.4
global m3_l_buf_x := 0.2
global m3_l_buf_y := 0.4
global m3_l_buf_w := 0.3
global m3_l_buf_h := 0.4
global m3_r_buf_x := 0.6
global m3_r_buf_y := 0.4
global m3_r_buf_w := 0.3
global m3_r_buf_h := 0.4

;;; keep memo ;;;
global km_mode := 0
global km_pid := 28176
global km_x := 600
global km_y := 300
global km_w := 1200
global km_h := 800
global km2_mode := 0

;;; excel vim ;;;
global ev_mode := 0
global normal_mode := 0
global insert_mode := 1
global visual_mode := 2
global visual_line_mode := 3
global space_mode := 4
global visual_line_cp := 0
global space_cnt := 0
global Enter_cnt := 0

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
    F13 & Space::send {Blind}^{Space}
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
    ; F13 & K::send {Blind}{Down}
    ; F13 & J::send {Blind}{Left}
    ; F13 & L::send {Blind}{Right}
    ; F13 & I::send {Blind}{Up}

    F13 & Up::Send    {Blind}{PgUp}
    F13 & Down::Send  {Blind}{PgDn}
    F13 & Left::Send  {Blind}{Home}
    F13 & Right::Send {Blind}{End}

    ;---other---


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; winpane ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ^RButton::
            CoordMode, Mouse, Screen ;; mouse absolute pos setting
            MouseGetPos, Xmou, Ymou, winid
            WinActivate, ahk_id %winid%
            Keywait, RButton, U T0.1
            if (ErrorLevel=1){
                ;; hold
                ; resizewin(Xmou-250, Ymou-250, 1000, 800)
                ; mid_resize := 0
            }else{
                ; resizewin(Xmou-250, Ymou-250, 500, 400)
                get_moni2()
                rate_setting()
                resizewin2(moni_sel, Xmou_rate-0.15, Ymou_rate-0.2, 0.3, 0.4)
                ; mid_resize := 1
            }
            return

        ^LButton::
            CoordMode, Mouse, Screen ;; mouse absolute pos setting
            MouseGetPos, Xmou, Ymou, winid
            WinActivate, ahk_id %winid%
            WinGetClass, win_class, A
            if (win_class=="WorkerW" || win_class=="Shell_TrayWnd"){
            }else {
                Keywait, LButton, U T0.1
                if (ErrorLevel=1){
                    ;; hold click
                    get_moni2()
                    rate_setting()
                    resize_long_click()
                }else{
                    ;; click
                    get_moni2()
                    rate_setting()
                    resize_short_click()
                }
            }
            return

        ;; alternative ctrl click
        F13 & LButton::
            send {CtrlDown}
            MouseClick LEFT , , , , , D,
            MouseClick LEFT , , , , , U,
            send {CtrlUp}
            return

        resizewin2(moni, Xrate, Yrate, Wrate, Hrate){
            if (moni==1){
                rszX := m1_moni_left + m1_moni_width * Xrate
                rszY := m1_moni_top + m1_moni_height * Yrate
                rszW := m1_moni_width * Wrate
                rszH := m1_moni_height * Hrate
            }else if (moni==2){
                rszX := m2_moni_left + m2_moni_width * Xrate
                rszY := m2_moni_top + m2_moni_height * Yrate
                rszW := m2_moni_width * Wrate
                rszH := m2_moni_height * Hrate
            }else if(moni==3){
                rszX := m3_moni_left + m3_moni_width * Xrate
                rszY := m3_moni_top + m3_moni_height * Yrate
                rszW := m3_moni_width * Wrate
                rszH := m3_moni_height * Hrate
            }
            WinMove, A, , rszX, rszY, rszW, rszH
        }

        rate_setting(){
            CoordMode, Mouse, Screen ;; mouse absolute pos setting
            MouseGetPos, Xmou, Ymou, winid
            WinActivate, ahk_id %winid%
            WinGetPos,X,Y,W,H,A
            
            if (Xmou>m1_moni_left && Xmou<m1_moni_left+m1_moni_width){
                moni_sel := 1
            }else if (Xmou>m2_moni_left && Xmou<m2_moni_left+m2_moni_width){
                moni_sel := 2
            }else if (Xmou>m3_moni_left && Xmou<m3_moni_left+m3_moni_width){
                moni_sel := 3 
            }

            if (moni_sel==1){
                Xrate := (X - m1_moni_left) / m1_moni_width
                Yrate := (Y - m1_moni_top) / m1_moni_height
                Wrate := W / m1_moni_width
                Hrate := H / m1_moni_height
                Xmou_rate := (Xmou - m1_moni_left)/m1_moni_width
                Ymou_rate := (Ymou - m1_moni_top)/m1_moni_height
                middle_rate := m1_middle_rate
            }else if (moni_sel==2){
                Xrate := (X - m2_moni_left) / m2_moni_width
                Yrate := (Y - m2_moni_top) / m2_moni_height
                Wrate := W / m2_moni_width
                Hrate := H / m2_moni_height
                Xmou_rate := (Xmou - m2_moni_left)/m2_moni_width
                Ymou_rate := (Ymou - m2_moni_top)/m2_moni_height
                middle_rate := m2_middle_rate
            }else if(moni_sel==3){
                Xrate := (X - m3_moni_left) / m3_moni_width
                Yrate := (Y - m3_moni_top) / m3_moni_height
                Wrate := W / m3_moni_width
                Hrate := H / m3_moni_height
                Xmou_rate := (Xmou - m3_moni_left)/m3_moni_width
                Ymou_rate := (Ymou - m3_moni_top)/m3_moni_height
                middle_rate := m3_middle_rate
            }

        }

        resize_short_click(){
            if (Wrate>=0.8){
                ;; close center 
                resize_center_buf(moni_sel)
            }else if (Hrate>0.8){
                ;; close side
                if (Xmou_rate<middle_rate){
                    ;; close left
                    reset_middle(moni_sel, 0)
                    resize_left_buf(moni_sel)
                }else {
                    ;; close right
                    reset_middle(moni_sel, 1)
                    resize_right_buf(moni_sel)
                }   
            }else {
                ;; open side
                if (Xmou_rate<middle_rate){
                    ;; open left side
                    resizewin2(moni_sel, 0, yedge, middle_rate, 1-yedge*4)
                    get_left_buf(moni_sel, Xrate, Yrate, Wrate, Hrate)
                }else{
                    ;; opne right side
                    resizewin2(moni_sel, middle_rate, yedge, 1-middle_rate, 1-yedge*4)
                    get_right_buf(moni_sel, Xrate, Yrate, Wrate, Hrate)
                }
            }
        }

        resize_long_click(){
            if (Wrate<0.8) {
                get_center_buf(moni_sel, Xrate, Yrate, Wrate, Hrate)
            }
            resizewin2(moni_sel, xedge, yedge, 1-xedge*2, 1-yedge*4)
        }

        reset_middle(moni, side){
            if (moni==1){
                if (side==0){
                    m1_middle_rate := Wrate
                }else {
                    m1_middle_rate := Xrate
                }
            }else if (moni==2){
                if (side==0){
                    m2_middle_rate := Wrate
                }else {
                    m2_middle_rate := Xrate
                }
            }else if (moni==3)
                if (side==0){
                    m3_middle_rate := Wrate
                }else {
                    m3_middle_rate := Xrate
                }
        }

        resize_center_buf(moni){
            if (moni==1) {
                resizewin2(moni, m1_c_buf_x, m1_c_buf_y, m1_c_buf_w, m1_c_buf_h)
            }else if (moni==2){
                resizewin2(moni, m2_c_buf_x, m2_c_buf_y, m2_c_buf_w, m2_c_buf_h)
            }else if (moni==3){
                resizewin2(moni, m3_c_buf_x, m3_c_buf_y, m3_c_buf_w, m3_c_buf_h)
            }
        }

        resize_left_buf(moni){
            if (moni==1) {
                resizewin2(moni, m1_l_buf_x, m1_l_buf_y, m1_l_buf_w, m1_l_buf_h)
            }else if (moni==2){
                resizewin2(moni, m2_l_buf_x, m2_l_buf_y, m2_l_buf_w, m2_l_buf_h)
            }else if (moni==3){
                resizewin2(moni, m3_l_buf_x, m3_l_buf_y, m3_l_buf_w, m3_l_buf_h)
            }
        }

        resize_right_buf(moni){
            if (moni==1) {
                resizewin2(moni, m1_r_buf_x, m1_r_buf_y, m1_r_buf_w, m1_r_buf_h)
            }else if (moni==2){
                resizewin2(moni, m2_r_buf_x, m2_r_buf_y, m2_r_buf_w, m2_r_buf_h)
            }else if (moni==3){
                resizewin2(moni, m3_r_buf_x, m3_r_buf_y, m3_r_buf_w, m3_r_buf_h)
            }
        }

        get_center_buf(moni, xbuf, ybuf, wbuf, hbuf) {
            if (moni==1) {
                m1_c_buf_x := xbuf
                m1_c_buf_y := ybuf
                m1_c_buf_w := wbuf
                m1_c_buf_h := hbuf
            }else if (moni==2){
                m2_c_buf_x := xbuf
                m2_c_buf_y := ybuf
                m2_c_buf_w := wbuf
                m2_c_buf_h := hbuf
            }else if (moni==3){
                m3_c_buf_x := xbuf
                m3_c_buf_y := ybuf
                m3_c_buf_w := wbuf
                m3_c_buf_h := hbuf
            }
        }

        get_left_buf(moni, xbuf, ybuf, wbuf, hbuf) {
            if (moni==1) {
                m1_l_buf_x := xbuf
                m1_l_buf_y := ybuf
                m1_l_buf_w := wbuf
                m1_l_buf_h := hbuf
            }else if (moni==2){
                m2_l_buf_x := xbuf
                m2_l_buf_y := ybuf
                m2_l_buf_w := wbuf
                m2_l_buf_h := hbuf
            }else if (moni==3){
                m3_l_buf_x := xbuf
                m3_l_buf_y := ybuf
                m3_l_buf_w := wbuf
                m3_l_buf_h := hbuf
            }
        }

        get_right_buf(moni, xbuf, ybuf, wbuf, hbuf) {
            if (moni==1) {
                m1_r_buf_x := xbuf
                m1_r_buf_y := ybuf
                m1_r_buf_w := wbuf
                m1_r_buf_h := hbuf
            }else if (moni==2){
                m2_r_buf_x := xbuf
                m2_r_buf_y := ybuf
                m2_r_buf_w := wbuf
                m2_r_buf_h := hbuf
            }else if (moni==3){
                m3_r_buf_x := xbuf
                m3_r_buf_y := ybuf
                m3_r_buf_w := wbuf
                m3_r_buf_h := hbuf
            }
        }

        get_moni2(){
            if (wp_init_flag==0){
                SysGet, moni, Monitor, 1
                m1_moni_width := moniRight - moniLeft
                m1_moni_height := moniBottom - moniTop
                m1_moni_left := moniLeft
                m1_moni_top := moniTop
                SysGet, moni, Monitor, 2
                m2_moni_width := moniRight - moniLeft
                m2_moni_height := moniBottom - moniTop
                m2_moni_left := moniLeft
                m2_moni_top := moniTop
                SysGet, moni, Monitor, 3
                m3_moni_width := moniRight - moniLeft
                m3_moni_height := moniBottom - moniTop
                m3_moni_left := moniLeft
                m3_moni_top := moniTop
                wp_init_flag := 1
            } 
        }

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; keep memo ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    F13 & t::
        ; MsgBox, hoge
        if (km_mode==0){
            ; WinRestore, ahk_pid %km_pid%, , , 
            ; WinActivate, ahk_pid %km_pid%
            ; WinMove, ahk_pid %km_pid%, ,600, 300, 1200, 800
            WinRestore, keepmemo
            WinActivate, keepmemo
            WinGetPos,X,Y,W,H,A  
            km_x :=X
            km_y :=Y
            km_w :=W
            km_h :=H
            ; WinMove, keepmemo, ,600, 300, 1200, 800
            km_mode := 1
        }else {
            WinActivate, keepmemo
            WinGetPos,X,Y,W,H,A  
            km_x :=X
            km_y :=Y
            km_w :=W
            km_h :=H
            ; WinMinimize,  ahk_pid %km_pid%, , ,
            WinMinimize,  keepmemo
            km_mode := 0
        }
        return

    F13 & o::
        if (km2_mode==0){
            WinRestore, ahk_exe Obsidian.exe
            WinActivate, ahk_exe Obsidian.exe
            WinGetPos,X,Y,W,H,A  
            km_x :=X
            km_y :=Y
            km_w :=W
            km_h :=H
            if (km_mode==1){
                km_mode := 0 
            }
            km2_mode := 1
        }else {
            WinActivate, ahk_exe Obsidian.exe
            WinGetPos,X,Y,W,H,A  
            WinMinimize, ahk_exe Obsidian.exe
            km_x :=X
            km_y :=Y
            km_w :=W
            km_h :=H
            if (km_mode==1){
                km_mode := 0 
            }
            km2_mode := 0
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
        F13 & Enter::
            send {PgUp}
            send {Home}{Enter}
            send {PgUp}
            return
    #IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Excel ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    #IfWinActive,ahk_exe EXCEL.exe
        F13 & Enter::
            send {F2}
            if (km_mode==1){
                change_insert_mode()
            }
            return
        +Enter::
            send !{Enter}
            return
        ^Enter::
            send {Down}
            send +{Space}
            send ^+=
            send {Up}{Down}
            return
        F13 & BackSpace::
            send +{Space}
            send ^-
            send {Up}{Down}
            return
        F13 & Up::Send    {Blind}{End}{Up}
        F13 & Down::Send  {Blind}{End}{Down}
        F13 & Left::Send  {Blind}{End}{Left}
        F13 & Right::Send {Blind}{End}{Right}
        ; ^Up::Send     ^x{Down}{Up}{Up}^v
        ; ^Down::Send   ^x{Down}{Up}{Down}^v
        ; ^Left::Send   ^x{Down}{Up}{Left}^v
        ; ^Right::Send  ^x{Down}{Up}{Right}^v
        F13 & c::
            if (km_mode==1){
                if (ev_mode==0){
                    send {Esc}{Up}{Down}
                    visual_line_cp := 0
                    change_normal_mode()
                }else{
                    change_normal_mode()
                }
            }else {
                send ^c
            }
            return
    #IfWinActive

    #IF (ev_mode==normal_mode && km_mode==1)
        LButton::
            CoordMode, Mouse, Screen ;; mouse absolute pos setting
            MouseGetPos, Xmou, Ymou, winid
            ; MsgBox, hoge
            if ((Xmou<km_x || Xmou>km_x+km_w) || (Ymou<km_y || Ymou>km_y+km_h)){
                ; MsgBox, %km_mode%
                km_mode := 0
            }else {
                km_mode := 1
            }
            MouseClick LEFT , , , , , D,
            Keywait LButton, 
            MouseClick LEFT , , , , , U,
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
        d::send +{space}^-
        y::
            keywait, y, U
            keywait, y, D T0.05
            if (ErrorLevel=1){
                ; single
                send ^c
                visual_line_cp := 0
            }else {
                ; double
                send +{Space}
                send ^c
                visual_line_cp := 1
            }            
            return
        p::
            if (visual_line_cp==0){
                send ^v
                send ^c
            }else {
                send {Down}
                send +{Space}
                send ^+=
                send ^c
            }            
            return
        u::send ^z
        F13 & r::send ^y
        i:: change_insert_mode()
        v:: change_visual_mode()
        +v:: 
            send +{Space}
            change_visual_line_mode()
            return
        space::change_space_mode()
    #IF

    #IF (ev_mode==insert_mode && km_mode==1)
        F13 & q::
            MsgBox, 1
            ev_mode := 0
            return
        F13 & c::change_normal_mode()
    #IF

    #IF (ev_mode==visual_mode && km_mode==1)
        F13 & c::change_normal_mode()
        h::send +{Left}
        j::send +{Down}
        k::send +{Up}
        l::send +{Right}
        x::send {Delete}
        p::
            send ^v
            send ^c
            return
        d::
            send ^-
            send u{Enter}
            change_normal_mode()
            return
        y::
            send ^c
            change_normal_mode()
            return
        space::
            space_cnt := 3
            change_space_mode()
            return
    #IF

    #IF (ev_mode==visual_line_mode && km_mode==1)
        F13 & c::change_normal_mode()
        h::send +{Left}
        j::send +{Down}
        k::send +{Up}
        l::send +{Right}
        x::send {Delete}
        d::
            send ^-
            send {Up}{Down}
            change_normal_mode()
            return
        y::
            send ^c
            visual_line_cp := 1
            change_normal_mode()
            return
    #IF

    #IF (ev_mode==space_mode && km_mode==1)
        F13 & c::change_normal_mode()
        space::
            space_cnt := space_cnt + 1
            return
        Enter::
            if (space_cnt==0){
                send {Down}
                send +{Space}
                send ^+=
                send {Up}{Down}
                space_cnt := 0
                change_normal_mode()                
            }else if (space_cnt==1){
                if (Enter_cnt==0){
                    send +{Left}
                }
                send ^+=
                send D
                send {Enter}
                Enter_cnt := 1
            }else if (space_cnt==3){
                send ^+=
                send D
                send {Enter}
                space_cnt := 0
                change_visual_mode()
            }
            return
        h::
            if (space_cnt==0){
                send {Blind}{End}{Left}
                space_cnt := 0
                change_normal_mode()
            }else if (space_cnt==1){
                send ^{PgUp}
            }
            return
        j::
            if (space_cnt==0){
                send {Blind}{End}{Down}
                space_cnt := 0
                change_normal_mode()
            }
            return
        k::
            if (space_cnt==0){
                send {Blind}{End}{Up}
                space_cnt := 0
                change_normal_mode()
            }
            return
        l::
            if (space_cnt==0){
                send {Blind}{End}{Right}
                space_cnt := 0
                change_normal_mode()
            }else if (space_cnt==1){
                send ^{PgDn}
            }
            return
    #IF

    change_normal_mode(){
        if (ev_mode==1){
            send {Enter}{Up}
        }
        send {Down}{Up}
        space_cnt := 0
        Enter_cnt := 0
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
