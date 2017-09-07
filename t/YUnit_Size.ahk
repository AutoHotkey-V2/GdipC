#SingleInstance force

#Include %A_ScriptDir%\Yunit\Yunit.ahk
#Include %A_ScriptDir%\Yunit\Window.ahk
#Include %A_ScriptDir%\Yunit\OutputDebug.ahk

#include %A_ScriptDir%\..\lib\gdipc.ahk
#include %A_ScriptDir%\..\lib\DbgOut.ahk
#include %A_ScriptDir%\..\lib\JSON.ahk

#Warn All
#Warn LocalSameAsGlobal, Off

ReferenceVersion := "0.1.0"
debug := 1

OutputDebug "DBGVIEWCLEAR"

Yunit.Use(YunitOutputDebug, YunitWindow).Test(MiscTestSuite, ConstructTestSuite, MethodTestSuite)
Return

class MiscTestSuite
{
	Begin() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
	}
	
	Version() {
		Global ReferenceVersion
		Global debug
		dbgOut("=[" A_ThisFunc "]", debug)
		obj := new GdipC.Size(100,200)
		Yunit.assert(obj._version == ReferenceVersion)
	}
	
	End() {
		Global debug
		dbgOut("<[" A_ThisFunc "]", debug)
	}
}

class ConstructTestSuite
{
	Begin() {
		Global debug
		dbgOut(">[" this.__Class "]", debug)
	}
	
	FromCoordinates() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		obj := new GdipC.Size(100,110)
		Yunit.assert(obj.width == 100)
		Yunit.assert(obj.height == 110)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	FromSize() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		obj1 := new GdipC.Size(100,110)
		obj2 := new GdipC.Size(obj1)
		Yunit.assert(obj2.width == 100)
		Yunit.assert(obj2.height == 110)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	End() {
		Global debug
		dbgOut("<[" this.__Class "]", debug)
	}
}

class MethodTestSuite
{
	Begin() {
		Global debug
		dbgOut(">[" this.__Class "]", debug)
	}
	
	Empty() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		obj := new GdipC.Size()
		Yunit.assert(obj.Empty() == true)
		obj := new GdipC.Size(0,0)
		Yunit.assert(obj.Empty() == true)
		obj := new GdipC.Size(100,200)
		Yunit.assert(obj.Empty() == false)
		obj.width := 0
		obj.Height := 0
		Yunit.assert(obj.Empty() == true)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	End() {
		Global debug
		dbgOut("<[" this.__Class "]", debug)
	}
}
