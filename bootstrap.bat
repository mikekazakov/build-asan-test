call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" x64
cd ../bb-src
call bootstrap.bat
b2 --prefix=../bb-installed install
