# GdipC [![AutoHotkey2](https://img.shields.io/badge/Language-AutoHotkey2-red.svg)](https://autohotkey.com/)
AutoHotkey implementation of several GDI+ Classes (see [GDI+-Documentation](https://msdn.microsoft.com/en-us/library/windows/desktop/ms534487(v=vs.85).aspx))

This library uses *AutoHotkey Version 2*.

## Usage 

Include precompiled `GdipC.ahk`from the `lib` folder into your project using standard AutoHotkey-include methods.

```autohotkey
#include <gdipc.ahk>
pt := new GdipC.Point(10,20)
```

For usage examples have a look at the UnitTest-files in `t` folder

## Development

If you wish to develop with GdipC:
1. Ensure you have [Node](https://nodejs.org) installed.
2. Change to your directory
```bash
cd c:\your\directory
```
3. Install npm dependencies
```bash
npm install
```
4. and then run webpack to build to `lib` folder
```bash
npm run webpack
```
This will run webpack with the `-w` option (as specified in `package.json`), which will watch all included `.ahk` files for any change based upon the use of `#Include`, and automatically rebuild to the `lib` folder

The GdipC library uses [webpack ahk-loader](https://github.com/tariqporter/ahk-loader) to watch and build files
5. Provide git-submodule `YUnit` 
```bash
git submodule init
git submodule update
```
6. On sourcecode-modification write your own unittests within `t` folder and run the existing unittests to be sure everything is ok ...