;path 230212 zaappiix

; This is for alts with claimed hives only.
nm_gotoramp()
Send "{space down}{" RightKey " down}"
Sleep 100
Send "{space up}"
Walk(2)
Send "{" FwdKey " down}"
Walk(1.8)
Send "{" FwdKey " up}"
Walk(30)
send "{" RightKey " up}{space down}"
HyperSleep(300)
send "{space up}"
nm_Walk(4, RightKey)
nm_Walk(5, FwdKey)
nm_Walk(3, RightKey)
send "{space down}"
HyperSleep(300)
send "{space up}"
nm_Walk(6, FwdKey)
nm_Walk(2, LeftKey, FwdKey)
nm_Walk(8, FwdKey)
Send "{" FwdKey " down}{" RightKey " down}"
Walk(11)
send "{space down}{" RightKey " up}"
HyperSleep(200)
send "{space up}"
HyperSleep(1100)
send "{space down}"
HyperSleep(200)
send "{space up}"
Walk(18)
send "{space down}"
HyperSleep(200)
send "{space up}"
Walk(20)
Send "{" RightKey " down}"
Walk(9)
send "{space down}"
HyperSleep(300)
send "{space up}"
Walk(1)
Send "{" FwdKey " up}"
Walk(33)
send "{space down}"
HyperSleep(300)
send "{space up}"
Walk(4)
send "{" RightKey " up}{" FwdKey " up}{" RotRight " 2}"
nm_Walk(9, FwdKey)
nm_Walk(1.5, RightKey)
; In the middle of pepper field
; From here, multiple of these will take over and use a different pattern for each alt
; Divided into LEFT & RIGHT HALVES

; Go into corner
nm_Walk(30, RightKey, FwdKey)
HyperSleep(200)
; Go back to center
nm_Walk(20, LeftKey, BackKey)

; Turn a little back to corner
nm_Walk(10, RightKey, FwdKey)

send "{" SC_LShift " down}"
HyperSleep(200)
send "{" SC_LShift " up}"

send "{" RotLeft " 3}"

nm_Walk(20, BackKey)

nm_Walk(15, FwdKey)
Loop 5 {
    HyperSleep(4000)
    ; go left and down
    nm_Walk(4, LeftKey, BackKey)
    ; go up
    nm_Walk(4, FwdKey)
    nm_Walk(8, RightKey)
    nm_Walk(8, BackKey)
    nm_Walk(4, LeftKey)
    nm_Walk(4, FwdKey)
}
