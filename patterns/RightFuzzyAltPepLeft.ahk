#Requires AutoHotkey v2.0
Loop {
    HyperSleep(3000)
    send "{" SC_LShift " down}"
    HyperSleep(200)
    send "{" SC_LShift " up}"
    Loop 10 {
        HyperSleep(3000)
        ; go left and down
        nm_Walk(2, LeftKey)
        ; go up
        nm_Walk(2, FwdKey)
        nm_Walk(4, RightKey)
        nm_Walk(4, BackKey)
        nm_Walk(2, LeftKey)
        nm_Walk(2, FwdKey)
    }

    nm_Walk(20, BackKey)
    nm_Walk(15, FwdKey)

    send "{" RotRight " 1}"
    HyperSleep(100)
    nm_Walk(6, FwdKey)
    send "{" RotLeft " 3}"

    Loop 10 {
        HyperSleep(3000)
        ; go left and down
        nm_Walk(2, LeftKey)
        ; go up
        nm_Walk(2, FwdKey)
        nm_Walk(4, RightKey)
        nm_Walk(4, BackKey)
        nm_Walk(2, LeftKey)
        nm_Walk(2, FwdKey)
    }

    send "{" RotLeft " 1}"
    HyperSleep(100)
    nm_Walk(30, FwdKey, LeftKey)
    send "{" RotRight " 3}"
    nm_Walk(5, FwdKey)
    nm_Walk(20, BackKey)
    nm_Walk(15, FwdKey)
}
