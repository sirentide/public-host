@echo off
setlocal enabledelayedexpansion

:: Initialize output files
echo ID extract > id_extract.txt
echo( >> id_extract.txt
echo name Extract > name_extract.txt
echo( >> name_extract.txt

for %%F in (*.webp) do (
    set "filename=%%~nF"
    set "full=%%F"

    :: Extract ID (1st token) and name (9th token)
    for /f "tokens=1,9 delims=_" %%A in ("!filename!") do (
        set "id=%%A"
        set "name=%%B"
    )

    >>id_extract.txt echo     '!id!': '!full!', 
    >>name_extract.txt echo     '!name!': '!full!', 
)

echo Done!
pause
