@echo off
setlocal enabledelayedexpansion

:: Output file
set "outfile=output.txt"
echo. > %outfile%

for %%f in (*.webp) do (
    set "full=%%f"
    set "filename=%%~nf"

    for /f "tokens=1-8 delims=_" %%a in ("!filename!") do (
        set "id=%%a"
        set "number=%%b"
        set "faction=%%c"
        set "rarity=%%d"
        set "type=%%e"
        set "position=%%f"
        set "weapon=%%g"
        set "name=%%h"

        >> %outfile% echo     ^<div class="photo" data-id="!id!" data-number="!number!" data-name="!name!" data-type="!type!" data-position="!position!" data-faction="!faction!" data-rarity="!rarity!" data-weapon="!weapon!"^>
        >> %outfile% echo         ^<img crossorigin="anonymous" src="https://raw.githubusercontent.com/sirentide/public-host/refs/heads/master/image-id/!full!" alt="!full!"^>
        >> %outfile% echo     ^</div^>
        >> %outfile% echo.
    )
)

echo All done, Jean. Check output.txt!
