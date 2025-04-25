@echo off
setlocal enabledelayedexpansion

:: Initialize output files

for %%F in (*.webp) do (
    set "filename=%%~nF"
    set "full=%%F"

    :: Extract ID (1st token) and name (last token)
    for /f "tokens=1,8 delims=_" %%A in ("!filename!") do (
        set "id=%%A"
        set "name=%%B"
    )

    >>id_extract.txt echo     '!id!': '!full!', 
    >>name_extract.txt echo     '!name!': '!full!', 
)

echo Done!
pause
