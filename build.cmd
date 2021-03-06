cd MultiCube
mkdir bin
mkdir bin\publish
dotnet publish -c Release -r win-x64 -o bin/publish/win-x64
..\warp-packer --arch windows-x64 --input_dir bin/publish/win-x64 --exec MultiCube.exe --output bin/publish/MultiCube-win-x64.exe
dotnet publish -c Release -r osx-x64 -o bin/publish/osx-x64
..\warp-packer --arch macos-x64 --input_dir bin/publish/osx-x64 --exec MultiCube --output bin/publish/MultiCube-osx-64
dotnet publish -c Release -r linux-x64 -o bin/publish/linux-x64
..\warp-packer --arch linux-x64 --input_dir bin/publish/linux-x64 --exec MultiCube --output bin/publish/MultiCube-linux-x64
cd bin/publish && for /f "delims=" %%d in ('dir /ad /b') do @rd /q /s "%%d"