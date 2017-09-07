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

Yunit.Use(YunitOutputDebug, YunitWindow).Test(MiscTestSuite,ConstructTestSuite, MethodTestSuite)
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
		obj := new GdipC.Point(100, 200)
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
		obj := new GdipC.Point(100,110)
		Yunit.assert(obj.X == 100)
		Yunit.assert(obj.Y == 110)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	FromSize() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		objSize := new GdipC.Size(100,110)
		obj := new GdipC.Point(objSize)
		Yunit.assert(obj.X == 100)
		Yunit.assert(obj.Y == 110)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	FromPoint() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		objPoint := new GdipC.Point(100,110)
		obj := new GdipC.Point(objPoint)
		Yunit.assert(obj.X == 100)
		Yunit.assert(obj.Y == 110)
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
	
	Equals() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		obj1 := new GdipC.Size(100,200)
		obj2 := new GdipC.Size(100,200)
		obj3 := new GdipC.Size(101,201)
		cmp12 := obj1.equals(obj2)
		Yunit.assert(cmp12 == true)			
		cmp13 := obj1.equals(obj3)
		Yunit.assert(cmp13 == false)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	Subtract() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		dx := 10
		dy := 20
		obj := new GdipC.Point(100,200)
		objRef := new GdipC.Point(100 - dx,200 -dy)
		
		obj2 := obj.subtract(dx,dy)
		Yunit.assert(obj2.equals(objRef) == true)
		
		obj3 := obj.subtract(new GdipC.Point(dx, dy))
		Yunit.assert(obj3.equals(objRef) == true)
		
		obj4 := obj.subtract(new GdipC.Size(dx, dy))
		Yunit.assert(obj4.equals(objRef) == true)
		
		obj5 := obj.subtract(dx+1,dy+1)
		Yunit.assert(obj5.equals(objRef) == false)
		
		obj6 := obj.subtract(new GdipC.Point(dx+1, dy+1))
		Yunit.assert(obj6.equals(objRef) == false)
		
		obj7 := obj.subtract(new GdipC.Size(dx+1, dy+1))
		Yunit.assert(obj7.equals(objRef) == false)
		
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	Add() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		dx := 10
		dy := 20
		obj := new GdipC.Point(100,200)
		objRef := new GdipC.Point(100 + dx,200 + dy)
		
		obj2 := obj.add(dx,dy)
		Yunit.assert(obj2.equals(objRef) == true)
		
		obj3 := obj.add(new GdipC.Point(dx, dy))
		Yunit.assert(obj3.equals(objRef) == true)
		
		obj4 := obj.add(new GdipC.Size(dx, dy))
		Yunit.assert(obj4.equals(objRef) == true)
		
		obj5 := obj.add(dx+1,dy+1)
		Yunit.assert(obj5.equals(objRef) == false)
		
		obj6 := obj.add(new GdipC.Point(dx+1, dy+1))
		Yunit.assert(obj6.equals(objRef) == false)
		
		obj7 := obj.add(new GdipC.Size(dx+1, dy+1))
		Yunit.assert(obj7.equals(objRef) == false)
		
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	End() {
		Global debug
		dbgOut("<[" this.__Class "]", debug)
	}
}