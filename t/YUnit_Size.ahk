#SingleInstance force

#Include %A_ScriptDir%\Yunit\Yunit.ahk
#Include %A_ScriptDir%\Yunit\Window.ahk
#Include %A_ScriptDir%\Yunit\OutputDebug.ahk

#include %A_ScriptDir%\..\lib\gdipc.ahk
#include %A_ScriptDir%\lib\DbgOut.ahk
#include %A_ScriptDir%\lib\JSON.ahk

#Warn All
#Warn LocalSameAsGlobal, Off

ReferenceVersion := "1.0.0"
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
	FromWidthHeight() {
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
	
	Equals() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		obj1 := new GdipC.Size(100,200)
		obj2 :=  new GdipC.Size(100,200)
		Yunit.assert(obj1.Equals(obj2) == true)
		obj3 :=  new GdipC.Size(100+1,200+1)
		Yunit.assert(obj1.Equals(obj3) == false)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	Subtract() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		dx := 10
		dy := 20
		obj := new GdipC.Size(100,200)
		objRef := new GdipC.Size(100 - dx,200 - dy)
		
		obj2 := obj.subtract(dx,dy)
		Yunit.assert(obj2.equals(objRef) == true)
		
		obj3 := obj.subtract(new GdipC.Size(dx, dy))
		Yunit.assert(obj3.equals(objRef) == true)
		
		obj4 := obj.subtract(dx+1,dy+1)
		Yunit.assert(obj4.equals(objRef) == false)
		
		obj5 := obj.subtract(new GdipC.Size(dx+1, dy+1))
		Yunit.assert(obj5.equals(objRef) == false)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	Add() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		dx := 10
		dy := 20
		obj := new GdipC.Size(100,200)
		objRef := new GdipC.Size(100 + dx,200 + dy)
		
		obj2 := obj.add(dx,dy)
		Yunit.assert(obj2.equals(objRef) == true)
		
		obj3 := obj.add(new GdipC.Size(dx, dy))
		Yunit.assert(obj3.equals(objRef) == true)
		
		obj4 := obj.add(dx+1,dy+1)
		Yunit.assert(obj4.equals(objRef) == false)
		
		obj5 := obj.add(new GdipC.Size(dx+1, dy+1))
		Yunit.assert(obj5.equals(objRef) == false)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	End() {
		Global debug
		dbgOut("<[" this.__Class "]", debug)
	}
}
