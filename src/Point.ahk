class Point
{
	; See: https://msdn.microsoft.com/en-us/library/windows/desktop/ms534487(v=vs.85).aspx
	_version := "1.0.0"
	X := 0
	Y := 0
	
	__New(params*) {
		c := params.MaxIndex()
		if (c == 0) {
			this.X := 0
			this.Y := 0
		}
		else  if (c == 1) {
			if (params[1].__Class == "GdipC.Point") {
				this.X := params[1].X
				this.Y := params[1].Y
			}
			else if (params[1].__Class == "GdipC.Size") {
				this.X := params[1].Width
				this.Y := params[1].Height
			}
			else { 
				throw "Incorrect parameter class for " A_ThisFunc
			}
		}
		else  if (c == 2) {
			this.X := params[1]
			this.Y := params[2]
		}
		else {
			throw "Incorrect number of parameters for "  A_ThisFunc
		}
	}
	
	equals(sz) {
		if (sz.__Class == "GdipC.Point") {
			return ((this.X == sz.X) && (this.X == sz.X))
		}
		else { 
			throw "Incorrect parameter class for " A_ThisFunc
		}
	}
	
	; The original implementation overloads several operators
	; As this is not possible with AHK, a separate function is offered
	
	subtract(params*) {
		; Alternative to overloaded minus-operator ("-")
		c := params.MaxIndex()
		if (c == 2) {
			return new GdipC.Point((this.X - params[1]),(this.Y - params[2]))
		}
		if (c == 1) {
			if (params[1].__Class == "GdipC.Point") {
				return new GdipC.Point((this.X - params[1].X),(this.Y - params[1].X))
			}
			else if (params[1].__Class == "GdipC.Size") {
				return new GdipC.Point((this.X - params[1].Width),(this.Y - params[1].Height))
			}
			else { 
				throw "Incorrect parameter class for " A_ThisFunc
			}
		}
		else {
			throw "Incorrect number of parameters for "  A_ThisFunc
		}
	}
	add(params*) {
		; Alternative to overloaded minus-operator ("-")
		c := params.MaxIndex()
		if (c == 2) {
			return new GdipC.Point((this.X + params[1]),(this.Y + params[2]))
		}
		if (c == 1) {
			if (params[1].__Class == "GdipC.Point") {
				return new GdipC.Point((this.X + params[1].X),(this.Y + params[1].X))
			}
			else if (params[1].__Class == "GdipC.Size") {
				return new GdipC.Point((this.X + params[1].Width),(this.Y + params[1].Height))
			}
			else { 
				throw "Incorrect parameter class for " A_ThisFunc
			}
		}
		else {
			throw "Incorrect number of parameters for "  A_ThisFunc
		}
	}
}