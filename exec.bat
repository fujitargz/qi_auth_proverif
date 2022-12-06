@echo off

cd /d %~dp0

rmdir /S /Q .\results

xcopy /S /E /Q .\sources .\results\ 1>nul

for /R .\results %%i in (*.pv) do (
    proverif -graph %%~dpi %%i > %%iresult.txt
    ren %%iresult.txt %%~ni.txt
    cd %%~dpi
    for %%j in (trace*.pdf) do (
        ren %%j %%~ni_%%j
    )
    cd %%~dp0
    del %%i %%~dpi*.dot
) >nul 2>&1