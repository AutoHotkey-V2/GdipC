class Rect
{
	; See https://msdn.microsoft.com/en-us/library/windows/desktop/ms534495(v=vs.85).aspx
	_version := "1.0.0"
	
	__New(params*) {
		c := params.MaxIndex()
		if (c == "") {
			this.x := 0
			this.y := 0
			this.Width := 0
			this.Height := 0
		}
		else if (c == 4)
		{
			this.x := params[1]
			this.y := params[2]
			this.width := params[3]
			this.height := params[4]
		}
		else if (c == 2)
		{
			if ((params[1].__Class == "GdipC.Point") && (params[2].__Class == "GdipC.Size")) {
				this.x := params[1].x
				this.y := params[1].y
				this.width := params[2].width
				this.height := params[2].height
			}
			Else
				throw "Wrong parameter types for "  A_ThisFunc
		}
		else
			throw "Incorrect number of parameters for "  A_ThisFunc
		
	}
	clone() {
		r := new GdipC.Rect(this.x, this.y, this.width, this.height)
		return r
	}
	contains(params*) {
		c := params.MaxIndex()
		if (c == 1) {
			if (params[1].__Class == "GdipC.Point") {
				return this.contains(params[1].x, params[1].y)
			}
			if (params[1].__Class == "GdipC.Rect") {
				x := params[1].x
				y := params[1].y
				width := params[1].width
				height := params[1].height
				if ((x >= this.x) && ((x + width) <= (this.x + this.width)) && (y >= this.y) && ((y + height) <= (this.y + this.height))) {
					return true
				}
			}
			else
				throw "Incorrect parameter type for " A_ThisFunc
		} else if (c == 2) {
			x := params[1]
			y := params[2]
			if ((x >= this.x) && (x <= (this.x + this.width)) && (y >= this.y) && (y <= (this.y + this.width))) {
				return true
			}
		}
		else
			throw "Incorrect number of parameters for "  A_ThisFunc
		return false
	}
	equals(params*) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "GdipC.Rect") {
				if ((params[1].x == this.x) && (params[1].y == this.y) && (params[1].width == this.width) && (params[1].height == this.height)) {
					return true
				}
			}
			else
				throw "Incorrect parameter type for " A_ThisFunc
		}
		else
			throw "Incorrect number of parameters for "  A_ThisFunc
		return false
	}
	getBottom() {
		return (this.y + this.height)
	}
	getBounds() {
		return this.clone()
	}
	getLeft() {
		return (this.x)
	}
	getLocation() {
		pt := new GdipC.Point(this.x, this.y)
		return pt
	}
	getRight() {
		return (this.x + this.width)
	}
	getSize() {
		sz := new GdipC.Size(this.width, this.height)
		return sz
	}
	getTop() {
		return (this.y)
	}
	inflate(params*) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "GdipC.Point") {
				this.inflate(params[1].x, params[1].y)
			}
			else
				throw "Wrong parameter types for "  A_ThisFunc
		}
		else if (c = 2) {
			this.x := this.x - params[1]
			this.y := this.y - params[2]
			this.width := this.width + 2*params[1]
			this.height := this.height + 2*params[2]
		}
		else
			throw "Incorrect number of parameters for "  A_ThisFunc
		return false
	}
	intersect(params *) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "GdipC.Rect") {
				right := (this.getRight() < params[1].getRight())?this.getRight():params[1].getRight()
				left := (this.getLeft() > params[1].getLeft())?this.getLeft():params[1].getLeft()
				bottom := (this.getBottom() < params[1].getBottom())?this.getBottom():params[1].getBottom()
				top := (this.getTop() > params[1].getTop())?this.getTop():params[1].getTop()
				ret := new GdipC.Rect(left, top, right-left, bottom-top)
				bIntersects := !ret.isEmptyArea()
				if (!bIntersects) {
					; if they don't intersect the result is an null-sized rectangle
					ret := new GdipC.Rect()
				}
				this.x := ret.x
				this.y := ret.y
				this.width := ret.width
				this.height := ret.height
				Outputdebug "this-after:" this.x "-" this.y "-" this.width "-" this.height
				return (bIntersects)
			}
			else
				throw "Wrong parameter types for "  A_ThisFunc
		}
		else
			throw "Incorrect number of parameters for "  A_ThisFunc
		return false
	}
	intersectsWith(params *) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "GdipC.Rect") {
				return  ((this.GetLeft() < params[1].GetRight()) && (this.GetTop() < params[1].GetBottom()) && (this.GetRight() > params[1].GetLeft()) && (this.GetBottom() > params[1].GetTop()))
			}
			else
				throw "Wrong parameter types for "  A_ThisFunc
		}
		return false
	}
	isEmptyArea() {
		return (this.width <= 0) || (this.height <= 0)
	}
	offset(params*) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "GdipC.Point") {
				this.offset(params[1].x, params[1].y)
			}
			else
				throw "Wrong parameter types for "  A_ThisFunc
		}
		else if (c = 2) {
			this.x := this.x + params[1]
			this.y := this.y + params[2]
		}
		else
			throw "Incorrect number of parameters for "  A_ThisFunc
		return
	}
	union(params *) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "GdipC.Rect") {
				right := (this.getRight() > params[1].getRight())?this.getRight():params[1].getRight()
				left := (this.getLeft() < params[1].getLeft())?this.getLeft():params[1].getLeft()
				bottom := (this.getBottom() > params[1].getBottom())?this.getBottom():params[1].getBottom()
				top := (this.getTop() < params[1].getTop())?this.getTop():params[1].getTop()
				this.x := left
				this.y := top
				this.width := right-left
				this.height := bottom-top
				return (!this.isEmptyArea())
			}
			else
				throw "Wrong parameter types for "  A_ThisFunc
		}
		else
			throw "Incorrect number of parameters for "  A_ThisFunc
	}
}