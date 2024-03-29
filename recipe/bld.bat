set MACHINE="AMD64"

echo puts [info tclversion] | tclsh > tmpfile.tcl
set /p TCL_VERSION=<tmpfile.tcl
del tmpfile.tcl
set TCL_VER=%TCL_VERSION:.=%
echo TCL_VERSION is %TCL_VERSION%
echo TCL_VER is %TCL_VER%

:: In makefile.vc, the variable VERSION is not set, see https://sourceforge.net/p/tktable/bugs/294/
set VERSION=%PKG_VERSION%

pushd win
nmake -f makefile.vc libpath32="" CC=%CC% LD=link.exe TCL_VER=%TCL_VER% TCL_VERSION=%TCL_VERSION% DEST_DIR=%LIBRARY_PREFIX% MACHINE=%MACHINE% install
if %ERRORLEVEL% GTR 0 exit 1
popd
