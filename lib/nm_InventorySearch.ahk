nm_InventorySearch(item, direction:="down", prescroll:=0, prescrolldir:="", scrolltoend:=1, max:=70){ ;~ item: string of item; direction: down or up; prescroll: number of scrolls before direction switch; prescrolldir: direction to prescroll, set blank for same as direction; scrolltoend: set 0 to omit scrolling to top/bottom after prescrolls; max: number of scrolls in total
	global bitmaps
	static hRoblox:=0, l:=0
	bitmaps["neonberry"] := Gdip_BitmapFromBase64("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")
	bitmaps["item"] := Gdip_BitmapFromBase64("iVBORw0KGgoAAAANSUhEUgAAAAMAAAAUAQMAAAByNRXfAAAAA1BMVEXU3dp/aiCuAAAAC0lEQVR42mMgEgAAACgAAU1752oAAAAASUVORK5CYII=")

	nm_OpenMenu("itemmenu")

	; detect inventory end for current hwnd
	if (hwnd := GetRobloxHWND())
	{
		if (hwnd != hRoblox)
		{
			ActivateRoblox()
			offsetY := GetYOffset(hwnd)
			GetRobloxClientPos(hwnd)
			pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+150 "|306|" windowHeight-offsetY-150)
			; ToolTip("hwnd is not roblox", 10, 10)
			; Sleep 1000
			; ToolTip()
			Loop 40
			{
				if (Gdip_ImageSearch(pBMScreen, bitmaps["item"], &lpos, , , 6, , 2, , 2) = 1)
				{
					Gdip_DisposeImage(pBMScreen)
					l := SubStr(lpos, InStr(lpos, ",")+1)-60 ; image 20px, item 80px => y+20-80 = y-60
					hRoblox := hwnd
					break
				}
				else
				{
					if (A_Index = 40)
					{
						Gdip_DisposeImage(pBMScreen)
						return 0
					}
					else
					{
						Sleep 50
						Gdip_DisposeImage(pBMScreen)
						pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+150 "|306|" windowHeight-offsetY-150)
					}
				}
			}
		}
	}
	else
		return 0 ; no roblox
	offsetY := GetYOffset(hwnd)
	; ToolTip("Found roblox", 10, 10)
	; Sleep 1000
	; ToolTip()

	; search inventory
	Loop max
	{
		ActivateRoblox()
		GetRobloxClientPos(hwnd)
		pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+150 "|306|" l)

		; wait for red vignette effect to disappear (from death or damage)
		Loop 40
		{
			; looks for scrollbar
			if (Gdip_ImageSearch(pBMScreen, bitmaps["item"], , , , 6, , 2) = 1)
				break
			else
			{
				if (A_Index = 40)
				{
					Gdip_DisposeImage(pBMScreen)
					return 0
				}
				else
				{
					Sleep 50
					Gdip_DisposeImage(pBMScreen)
					pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+150 "|306|" l)
				}
			}
		}
		; ToolTip("Found scrollbar", 10, 10)
		; Sleep 300
		; ToolTip()

		if (Gdip_ImageSearch(pBMScreen, bitmaps[item], &pos, , , , , 10, , 5) = 1) {
			; ToolTip("FOUND IMAGE", 10, 10)
			; Sleep 1000
			; ToolTip()
			Gdip_DisposeImage(pBMScreen)
			break ; item found
		}
		Gdip_DisposeImage(pBMScreen)

		; ToolTip("Attempt scrolling", 10, 10)
		; Sleep 300
		; ToolTip()
		switch A_Index
		{
			case (prescroll+1): ; scroll entire inventory on (prescroll+1)th search
			if (scrolltoend = 1)
			{
				; ToolTip("Scrolling to end", 10, 10)
				; Sleep 1000
				; ToolTip()
				Loop 100
				{
					SendEvent "{Click " windowX+30 " " windowY+offsetY+200 " 0}"
					SendInput "{Wheel" ((direction = "down") ? "Up" : "Down") "}"
					Sleep 50
				}
			}
			default: ; scroll once
			; ToolTip("Scrolling once", 10, 10)
			; Sleep 1000
			; ToolTip()
			SendEvent "{Click " windowX+30 " " windowY+offsetY+200 " 0}"
			SendInput "{Wheel" ((A_Index <= prescroll) ? (prescrolldir ? ((prescrolldir = "Down") ? "Down" : "Up") : ((direction = "down") ? "Down" : "Up")) : ((direction = "down") ? "Down" : "Up")) "}"
			Sleep 50
		}
		Sleep 500 ; wait for scroll to finish
	}
	return (pos ? [30, SubStr(pos, InStr(pos, ",")+1)+190] : 0) ; return list of coordinates for dragging
}
