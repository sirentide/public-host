@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set count=0

for %%f in (*.webp) do (
    set "filename=%%~nxf"
    set "name=%%~nf"
    
    REM Replace spaces with underscores
    set "cleanname=!name: =_!"

    REM Final renamed filename
    set "newname=!count!_!cleanname!.webp"

    echo Renaming: %%f → !newname!
    ren "%%f" "!newname!"
    
    set /a count+=1
)

echo Done renaming.
pause
