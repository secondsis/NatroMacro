; Just cleaning up old code because StrawberryxSnake was ass
; NESTED LOOPS CAUSE IM SO LAZY :SKULL:
send "{" RotUp " 8}"
loop reps {
    send "{" TCLRKey " down}"
    Walk(22.5)
    send "{" TCLRKey " up}{" TCFBKey " down}"
    Walk(10)
    send "{" TCFBKey " up}"
    ; nest
    loop 6 {
        send "{" AFCFBKey " down}"
        Walk(6.5)
        send "{" AFCFBKey " up}{" AFCLRKey " down}"
        Walk(1.6)
        send "{" AFCLRKey " up}{" TCFBKey " down}"
        Walk(6.5)
        send "{" TCFBKey " up}{" AFCLRKey " down}"
        Walk(1.6)
        send "{" AFCLRKey " up}"
    }
}