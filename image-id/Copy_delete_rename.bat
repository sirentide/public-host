@echo off
setlocal enabledelayedexpansion

for %%f in (*.webp) do (
    set "name=%%~nf"
    set "newname=!name: copy=!"
    if not "!name!"=="!newname!" (
        ren "%%f" "!newname!.webp"
    )
)
