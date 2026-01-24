nm_OpenMenu(tab:="", refresh:=0){
	global bitmaps
	static x := Map("itemmenu",30, "questlog",85, "beemenu",140, "badgelist",195, "settingsmenu",250, "shopmenu",305), open:=""
	bitmaps["itemmenu"] := Gdip_BitmapFromBase64("iVBORw0KGgoAAAANSUhEUgAAACcAAAAuAQAAAACD1z1QAAAAAnRSTlMAAHaTzTgAAAB4SURBVHjanc2hDcJQGAbAex9NQCCQyA6CqGMswiaM0lGACSoQDWn6I5A4zNnDiY32aCPbuoujA1rNUIsggqZRrgmGdJAd+qwN2YdDdEiPXUCgy3lGQJ6I8VK1ZoT4cQBjVa2tUAH/uTHwvZbcMWfClBduVK2i9/YB0wgl4MlLHxIAAAAASUVORK5CYII=")

	if (hwnd := GetRobloxHWND())
		ActivateRoblox()
	else
		return 0
	offsetY := GetYOffset(hwnd)

	if ((tab = "") || (refresh = 1)) ; close
	{
		; ToolTip("Closing tab", 10, 10)
		; Sleep 1000
		; ToolTip()
		if open ; close the open tab
		{
			Loop 10
			{
				GetRobloxClientPos(hwnd)
				pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+72 "|350|80")
				if (Gdip_ImageSearch(pBMScreen, bitmaps[open], , , , , , 2) != 1) {
					Gdip_DisposeImage(pBMScreen)
					open := ""
					break
				}
				Gdip_DisposeImage(pBMScreen)
				SendEvent "{Click " windowX+x[open] " " windowY+offsetY+120 " 0}"
				Click
				SendEvent "{Click " windowX+350 " " windowY+offsetY+100 " 0}"
				sleep 500
			}
		}
		else ; close any open tab
		{
			; ToolTip("Closing any open tab", 10, 10)
			; Sleep 1000
			; ToolTip()
			for k,v in x
			{
				Loop 10
				{
					GetRobloxClientPos(hwnd)
					pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+72 "|350|80")
					if (Gdip_ImageSearch(pBMScreen, bitmaps[k], , , , , , 2) != 1) {
						Gdip_DisposeImage(pBMScreen)
						break
					}
					Gdip_DisposeImage(pBMScreen)
					SendEvent "{Click " windowX+v " " windowY+offsetY+120 " 0}"
					Click
					SendEvent "{Click " windowX+350 " " windowY+offsetY+100 " 0}"
					sleep 500
				}
			}
			open := ""
		}
	}
	else
	{
		if ((tab != open) && open) ; close the open tab
		{
			; ToolTip("Closing the current open tab", 10, 10)
			; Sleep 1000
			; ToolTip()
			Loop 10
			{
				GetRobloxClientPos(hwnd)
				pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+72 "|350|80")
				if (Gdip_ImageSearch(pBMScreen, bitmaps[open], , , , , , 2) != 1) {
					Gdip_DisposeImage(pBMScreen)
					open := ""
					break
				}
				Gdip_DisposeImage(pBMScreen)
				SendEvent "{Click " windowX+x[open] " " windowY+offsetY+120 " 0}"
				Click
				SendEvent "{Click " windowX+350 " " windowY+offsetY+100 " 0}"
				sleep 500
			}
		}
		; open the desired tab
		Loop 10
		{
			; ToolTip("Attempt open desired tab", 10, 10)
			; Sleep 1000
			; ToolTip()
			GetRobloxClientPos(hwnd)
			pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+72 "|350|80")
			; bitmaps["itemmenu"] := Gdip_BitmapFromBase64("iVBORw0KGgoAAAANSUhEUgAAACcAAAAuAQAAAACD1z1QAAAAAnRSTlMAAHaTzTgAAAB4SURBVHjanc2hDcJQGAbAex9NQCCQyA6CqGMswiaM0lGACSoQDWn6I5A4zNnDiY32aCPbuoujA1rNUIsggqZRrgmGdJAd+qwN2YdDdEiPXUCgy3lGQJ6I8VK1ZoT4cQBjVa2tUAH/uTHwvZbcMWfClBduVK2i9/YB0wgl4MlLHxIAAAAASUVORK5CYII=")

			if (Gdip_ImageSearch(pBMScreen, bitmaps[tab], , , , , , 2) = 1) {
				Gdip_DisposeImage(pBMScreen)
				open := tab
				; ToolTip("FOUND DESIRED TAB: " tab, 10, 10)
				; Sleep 1000
				; ToolTip()
				break
			}
			Gdip_DisposeImage(pBMScreen)
			SendEvent "{Click " windowX+x[tab] " " windowY+offsetY+120 " 0}"
			Click
			SendEvent "{Click " windowX+350 " " windowY+offsetY+100 " 0}"
			sleep 500
		}
	}
}
