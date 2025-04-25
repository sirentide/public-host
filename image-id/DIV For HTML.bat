@echo off
setlocal enabledelayedexpansion

set "outfile=output.txt"
echo. > %outfile%

for %%f in (*.webp) do (
    call :process "%%f"
)
goto :eof

:process
set "full=%~1"
set "filename=%~n1"

for /f "tokens=1-8* delims=_" %%a in ("%filename%") do (
    set "id=%%a"
    set "number=%%b"
    set "element=%%c"
    set "faction=%%d"
    set "rarity=%%e"
    set "type=%%f"
    set "position=%%g"
    set "weapon=%%h"
    set "name=%%i"

    >> %outfile% echo ^<div class="photo" data-id="!id!" data-number="!number!" data-name="!name!" data-element="!element!" data-type="!type!" data-position="!position!" data-faction="!faction!" data-rarity="!rarity!" data-weapon="!weapon!"^>
    >> %outfile% echo     ^<img crossorigin="anonymous" src="https://raw.githubusercontent.com/sirentide/public-host/refs/heads/master/image-id/!full!" alt="!full!"^>
    >> %outfile% echo ^</div^>
    >> %outfile% echo.
)
goto :eof
