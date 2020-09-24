call "c:/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/VC/Auxiliary/Build/vcvarsall.bat" x64
SET B2=%~dp0%..\bb-installed\bin\b2.exe

cd exe

echo "exe, x64, MD, no ASAN => OK"
SET OPTIONS=toolset=msvc address-model=64 runtime-link=shared debug-symbols=on debug-store=database
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "exe, x64, MT, no ASAN => OK"
SET OPTIONS=toolset=msvc address-model=64 runtime-link=static debug-symbols=on debug-store=database
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "exe, x64, MD, ASAN => Error"
SET OPTIONS=toolset=msvc address-model=64 runtime-link=shared debug-symbols=on debug-store=database address-sanitizer=on
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% EQU 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "exe, x64, MT, ASAN => Error"
SET OPTIONS=toolset=msvc address-model=64 runtime-link=static debug-symbols=on debug-store=database address-sanitizer=on
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% EQU 0 EXIT /B 1
%B2% %OPTIONS% clean

cd ..\dll

echo "dll, x64, MD, no ASAN => OK"
SET OPTIONS=toolset=msvc address-model=64 link=shared runtime-link=shared debug-symbols=on debug-store=database
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "dll, x64, MT, no ASAN => OK"
SET OPTIONS=toolset=msvc address-model=64 link=shared runtime-link=static debug-symbols=on debug-store=database
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "dll, x64, MD, ASAN => Error"
SET OPTIONS=toolset=msvc address-model=64 link=shared runtime-link=shared debug-symbols=on debug-store=database address-sanitizer=on
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% EQU 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "dll, x64, MT, ASAN => Error"
SET OPTIONS=toolset=msvc address-model=64 link=shared runtime-link=static debug-symbols=on debug-store=database address-sanitizer=on
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% EQU 0 EXIT /B 1
%B2% %OPTIONS% clean

cd ..\exe
call "c:/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/VC/Auxiliary/Build/vcvarsall.bat" x86

echo "exe, x86, MD, no ASAN => OK"
SET OPTIONS=toolset=msvc address-model=32 runtime-link=shared debug-symbols=on debug-store=database
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "exe, x86, MT, no ASAN => OK"
SET OPTIONS=toolset=msvc address-model=32 runtime-link=static debug-symbols=on debug-store=database
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "exe, x86, MD, ASAN => Error"
SET OPTIONS=toolset=msvc address-model=32 runtime-link=shared debug-symbols=on debug-store=database address-sanitizer=on
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% EQU 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "exe, x86, MT, ASAN => Error"
SET OPTIONS=toolset=msvc address-model=32 runtime-link=static debug-symbols=on debug-store=database address-sanitizer=on
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% EQU 0 EXIT /B 1
%B2% %OPTIONS% clean

cd ..\dll

echo "dll, x86, MD, no ASAN => OK"
SET OPTIONS=toolset=msvc address-model=32 link=shared runtime-link=shared debug-symbols=on debug-store=database
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "dll, x86, MT, no ASAN => OK"
SET OPTIONS=toolset=msvc address-model=32 link=shared runtime-link=static debug-symbols=on debug-store=database
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "dll, x86, MD, ASAN => Error"
SET OPTIONS=toolset=msvc address-model=32 link=shared runtime-link=shared debug-symbols=on debug-store=database address-sanitizer=on
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% EQU 0 EXIT /B 1
%B2% %OPTIONS% clean

echo "dll, x86, MT, ASAN => Error"
SET OPTIONS=toolset=msvc address-model=32 link=shared runtime-link=static debug-symbols=on debug-store=database address-sanitizer=on
%B2% %OPTIONS% release
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
bin\test.exe
IF %ERRORLEVEL% EQU 0 EXIT /B 1
%B2% %OPTIONS% clean

echo Test finished successfully!
