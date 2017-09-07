class GdipC
{
	__New()
	{
		if !DllCall("GetModuleHandle", "str", "gdiplus")
			DllCall("LoadLibrary", "str", "gdiplus")
		VarSetCapacity(si, (A_PtrSize = 8) ? 24 : 16, 0), si := Chr(1)
		DllCall("gdiplus\GdiplusStartup", "uptr*", pToken, "uptr", &si, "uint", 0)
		this.pToken := pToken

		this._New := Gdip.__New
		Gdip.__New := Gdip._DummyNew
	}
	
	_DummyNew()
	{
		return false
	}
	
	__Delete()
	{
		this.Dispose()
	}
	
	Dispose()
	{
		DllCall("gdiplus\GdiplusShutdown", "uptr", this.pToken)
		if (hModule := DllCall("GetModuleHandle", "str", "gdiplus"))
			DllCall("FreeLibrary", "uptr", hModule)
			
		Gdip.__New := this._New
	}
		
	#Include Size.ahk
	#Include Point.ahk
	#Include Rect.ahk
}