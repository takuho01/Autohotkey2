;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Misuji ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; variable
    global m1_sta := 0
    ;; 0-> all close, 1 -> left open 2 -> right open, 3 -> all open
    global sta_opn_all := 0
    global sta_opn_l := 1
    global sta_opn_r := 2
    global sta_cls_all := 3
    global m1_height
    global m1_width
    ; global m1_x
    ; global m1_y
    global m1cls_l_x
    global m1cls_r_x
    global m1opn_l_x
    global m1opn_r_x
    m1_moni_width := 2576
    m1_moni_height := 1365
    m1_Xedge_size := 30
    m1_Yedge_size := 30

    F1::
        ; global m1_Xedge_size := 30
        ; global m1_Yedge_size := 30
        ; WinGetPos,X,Y,W,H,A
        MsgBox,x = %X% y= %Y% w = %W% h = %H% xedge = %m1_Xedge_size%
        return
    F2::
        m1_sta := sta_opn_all
        WinGetPos,X,Y,W,H,A
        m1_x := m1_Xedge_size
        m1_y := m1_Yedge_size
        m1_width := m1_moni_width - m1_Xedge_size*2
        m1_height := H
        MsgBox, %X%, %Y%, %W%, %H%, %m1_x%, %m1_y%, %m1_Xedge_size%, %m1_Yedge_size%
        ; ResizeWin(m1_x, m1_y, m1_width, m1_height)
        WinMove,A,,30,30
        return

