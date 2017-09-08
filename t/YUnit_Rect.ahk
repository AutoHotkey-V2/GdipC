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
;Yunit.Use(YunitOutputDebug, YunitWindow).Test(MiscTestSuite,ConstructTestSuite, MethodTestSuite)
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
		obj := new GdipC.Rect()
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
			
			this.x := 123
			this.y := 456
			this.width := 100
			this.height := 200
		}
		
		FromNothing() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			obj := new GdipC.Rect()
			Yunit.assert(obj.x == 0)
			Yunit.assert(obj.y == 0)
			Yunit.assert(obj.width == 0)
			Yunit.assert(obj.height == 0)
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		FromXYWH() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			obj := new GdipC.rect(this.x, this.y, this.width, this.height)
			Yunit.assert(obj.x == this.x)
			Yunit.assert(obj.y == this.y)
			Yunit.assert(obj.width == this.width)
			Yunit.assert(obj.height == this.height)
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		FromPointSize() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			pt := new GdipC.Point(this.x, this.y)
			sz := new GdipC.Size(this.width, this.height)
			obj := new GdipC.Rect(pt,sz)
			Yunit.assert(obj.x == this.x)
			Yunit.assert(obj.y == this.y)
			Yunit.assert(obj.width == this.width)
			Yunit.assert(obj.height == this.height)
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
			
			this.x := 123
			this.y := 456
			this.width := 100
			this.height := 200
			
			this.dx := 10
			this.dy := 20
		}
		
		clone() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r2 := r.clone()
			Yunit.assert(r2.x == this.x)
			Yunit.assert(r2.y == this.y)
			Yunit.assert(r2.width == this.width)
			Yunit.assert(r2.height == this.height)
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		contains() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			Yunit.assert(r.contains((this.x+1) ,(this.y+1)) == true)
			Yunit.assert(r.contains((this.x-1) ,(this.y-1)) == false)
			
			pt := new GdipC.Point(this.x+1, this.y+1)
			Yunit.assert(r.contains(pt) == true)
			pt := new GdipC.Point(this.x-1, this.y-1)
			Yunit.assert(r.contains(pt) == false)
			
			r2 := new GdipC.Rect(this.x+1,this.y+1,this.width-2,this.height-2)
			Yunit.assert(r.contains(r2) == true)
			Yunit.assert(r2.contains(r) == false)
			
			
			
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		equals() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r2 := new GdipC.Rect(this.x+1,this.y+1,this.width,this.height)
			Yunit.assert(r.equals(r) == true)
			Yunit.assert(r.equals(r2) == false)
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		getBottom() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			Yunit.assert(r.getBottom(r) == (this.y + this.height))
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		getBounds() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r2 := r.getBounds()
			Yunit.assert(r2.x == this.x)
			Yunit.assert(r2.y == this.y)
			Yunit.assert(r2.width == this.width)
			Yunit.assert(r2.height == this.height)
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		getLeft() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			Yunit.assert(r.getLeft(r) == (this.x))
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		getLocation() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			loc := r.getLocation()
			Yunit.assert(loc.x == this.x)
			Yunit.assert(loc.y == this.y)
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		getRight() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			Yunit.assert(r.getRight(r) == (this.x+this.width))
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		getSize() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			sz := r.getSize()
			Yunit.assert(sz.width == this.width)
			Yunit.assert(sz.height == this.height)
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		getTop() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			Yunit.assert(r.getTop(r) == (this.y))
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		inflate() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			; Inflated Reference-Rect
			rRef := new GdipC.Rect((this.x - this.dx), (this.y - this.dy), (this.width+2*this.dx), (this.height+2*this.dy))
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r.Inflate(this.dx, this.dy)
			Yunit.assert(r.x == rRef.x)
			Yunit.assert(r.y == rRef.y)
			Yunit.assert(r.width == rRef.width)
			Yunit.assert(r.height == rRef.height)
			
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			pt := new GdipC.Point(this.dx, this.dy)
			r.Inflate(pt)
			Yunit.assert(r.x == rRef.x)
			Yunit.assert(r.y == rRef.y)
			Yunit.assert(r.width == rRef.width)
			Yunit.assert(r.height == rRef.height)
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		intersect() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r2 := new GdipC.Rect(this.x+1,this.y+1,this.width,this.height)
			Yunit.assert(r.intersect(r2) == true)
			Yunit.assert(r.x == this.x+1)
			Yunit.assert(r.y == this.y+1)
			Yunit.assert(r.width == this.width-1)
			Yunit.assert(r.height == this.height-1)
			
			; No intersection between r and r2
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r2 := new GdipC.Rect(this.x+this.width+1,this.y+this.height+1,this.width,this.height)
			Yunit.assert(r.intersect(r2) == false)
			Yunit.assert(r.x == 0)
			Yunit.assert(r.y == 0)
			Yunit.assert(r.width == 0)
			Yunit.assert(r.height == 0)
			
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		intersectsWith() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r2 := new GdipC.Rect(this.x+1,this.y+1,this.width,this.height)
			Yunit.assert(r.intersectsWith(r2) == true)
			
			r2 := new GdipC.Rect(this.x+1,this.y+1,this.width-2,this.height-2)
			Yunit.assert(r.intersectsWith(r2) == true)
			
			r2 := new GdipC.Rect(this.x,this.y,this.width,this.height)
			Yunit.assert(r.intersectsWith(r2) == true)
			
			r2 := new GdipC.Rect(this.x+this.width,this.y+this.height,this.width,this.height)
			Yunit.assert(r.intersectsWith(r2) == false)
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		isEmptyArea() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			Yunit.assert(r.isEmptyArea() == false)
			
			r := new GdipC.Rect()
			Yunit.assert(r.isEmptyArea() == true)
			
			r := new GdipC.Rect(this.x,this.y,0,0)
			Yunit.assert(r.isEmptyArea() == true)
			
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		offset() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r.Offset(this.dx, this.dy)
			Yunit.assert(r.x == this.x + this.dx)
			Yunit.assert(r.y == this.y + this.dy)
			Yunit.assert(r.width == this.width)
			Yunit.assert(r.height == this.height)
			
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			pt := new GdipC.Point(this.dx, this.dy)
			r.offset(pt)
			Yunit.assert(r.x == this.x + this.dx)
			Yunit.assert(r.y == this.y + this.dy)
			Yunit.assert(r.width == this.width)
			Yunit.assert(r.height == this.height)
			
			dbgOut("<[" A_ThisFunc "]", debug)
		}
		
		union() {
			Global debug
			dbgOut(">[" A_ThisFunc "]", debug)
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r2 := new GdipC.Rect(this.x+1,this.y+1,this.width,this.height)
			res := r.union(r2)	
			; Expected resulting rect
			rRes := new GdipC.Rect(this.x,this.y,this.width+1,this.height+1)
			Yunit.assert(r.x == rRes.x)
			Yunit.assert(r.y == rRes.y)
			Yunit.assert(r.width == rRes.width)
			Yunit.assert(r.height == rRes.height)
			
			r := new GdipC.Rect(this.x,this.y,this.width,this.height)
			r2 := new GdipC.Rect(this.x+this.width,this.y+this.height,this.width,this.height)
			res := r.union(r2)
			; Expected resulting rect
			rRes := new GdipC.Rect(this.x,this.y, 2 * this.width, 2 * this.height)
			Yunit.assert(r.x == rRes.x)
			Yunit.assert(r.y == rRes.y)
			Yunit.assert(r.width == rRes.width)
			Yunit.assert(r.height == rRes.height)
			
			dbgOut("<[" A_ThisFunc "]", debug)
		}
	
		End() {
			Global debug
			dbgOut("<[" this.__Class "]", debug)
		}
	}