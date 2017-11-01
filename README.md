# GdipC [![AutoHotkey2](https://img.shields.io/badge/Language-AutoHotkey-red.svg)](https://autohotkey.com/)
AutoHotkey implementation of several GDI+ Classes (see [GDI+-Documentation](https://msdn.microsoft.com/en-us/library/windows/desktop/ms534487(v=vs.85).aspx))

This library uses *AutoHotkey Version 2*.

This repository only offers the released version of this library - development is taking place under [GdipC-develop](https://github.com/hoppfrosch/GdipC-Develop)

## Usage 

Include `GdipC.ahk`from the `lib` folder into your project using standard AutoHotkey-include methods.

```autohotkey
#include "gdipc.ahk"
pt := new GdipC.Point(10,20)
```

## Description

Folowing GDI+-classes have been implemented:

* [Size](https://msdn.microsoft.com/en-us/library/windows/desktop/ms534504(v=vs.85).aspx)
* [Point](https://msdn.microsoft.com/en-us/library/windows/desktop/ms534487(v=vs.85).aspx)
* [Rect](https://msdn.microsoft.com/en-us/library/windows/desktop/ms534495(v=vs.85).aspx)
