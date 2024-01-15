@REM set MACHINE="AMD64"
@REM :: A different SDK is needed when build with VS 2017 and 2015
@REM :: http://wiki.tcl.tk/54819
@REM if "%VS_MAJOR%"=="14" (
@REM   echo "Switching SDK versions"
@REM   call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" x64 10.0.15063.0
@REM )

echo puts [info tclversion] | tclsh > tmpfile.tcl
set /p TCL_VERSION=<tmpfile.tcl
del tmpfile.tcl
set TCL_VER=%TCL_VERSION:.=%
echo %TCL_VERSION%
echo %TCL_VER%

pushd win
nmake -f makefile.vc libpath32="" CC=%CC% LD=link.exe TCL_VER=%TCL_VER% TCL_VERSION=%TCL_VERSION% DEST_DIR=%LIBRARY_PREFIX% MACHINE=%MACHINE% install
if %ERRORLEVEL% GTR 0 exit 1
popd
