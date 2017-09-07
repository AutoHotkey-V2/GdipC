class Size
{
	_version := "0.1.0"
	_debug := 0 ; _DBG_	
	width := 0
	height := 0
	
	__New(params*)	{
		;if (A_AhkVersion <> "2.0-a081-d1c5ddf") {
		;	throw "Requires AutoHotkey 2.0 (from 2.0.a080) for "  this.__Class
		;}
			
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
	equals(sz) {
		if (sz.__Class == "GdipC.Size") {
			return ((this.Width == sz.Width) && (this.Height == sz.Height))
		}
		return false
	}
}