class Size
{
	; See: https://msdn.microsoft.com/en-us/library/windows/desktop/ms534504(v=vs.85).aspx
	_version := "1.0.0"
	Width := 0
	Height := 0
	
	__New(params*)	{
		c := params.MaxIndex()
		if (c == "") {
			this.Width := 0
			this.Height := 0
		}
		else  if (c == 1) {
			if (params[1].__Class == "GdipC.Size") {
				this.Width := params[1].Width
				this.Height := params[1].Height
			}
			else { 
				throw "Incorrect parameter type for " A_ThisFunc
			}
		}
		else  if (c == 2) {
			this.Width := params[1]
			this.Height := params[2]
		}
		else {
			throw "Incorrect number of parameters for "  A_ThisFunc
		}
	}
	empty() {
		return ((this.Width ==0) && (this.Height == 0))
	}
	equals(params*) {
		c := params.MaxIndex()
		if (c == 1) {
			if (params[1].__Class == "GdipC.Size") {
				return ((this.Width == params[1].Width) && (this.Height == params[1].Height))
			}
			else { 
				throw "Incorrect parameter type for " A_ThisFunc
			}
		}
		else {
			throw "Incorrect number of parameters for "  A_ThisFunc
		}
	}
	; The original implementation overloads several operators
	; As this is not possible with AHK, a separate function is offered
	subtract(params*) {
		; Alternative to overloaded minus-operator ("-")
		c := params.MaxIndex()
		if (c == 2) {
			return new GdipC.Size((this.Width - params[1]),(this.Height - params[2]))
		}
		if (c == 1) {
			if (params[1].__Class == "GdipC.Size") {
				return new GdipC.Point((this.Width - params[1].Width),(this.Height - params[1].Height))
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
		; Alternative to overloaded plus-operator ("+")
		c := params.MaxIndex()
		if (c == 2) {
			return new GdipC.Size((this.Width + params[1]),(this.Height + params[2]))
		}
		if (c == 1) {
			if (params[1].__Class == "GdipC.Size") {
				return new GdipC.Point((this.Width + params[1].Width),(this.Height + params[1].Height))
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