@echo off
echo ========================================
echo DCT_PLS Executable file construction script
echo ========================================
echo.

echo Check the MATLAB environment...
matlab -batch "if ~license('test', 'Compiler'), error('MATLAB Compiler Toolbox not available'); end"

if %ERRORLEVEL% neq 0 (
    echo Error：MATLAB Compiler Toolbox 不可用
    echo Please ensure that MATLAB Compiler Toolbox is installed
    pause
    exit /b 1
)

echo MATLAB Compiler Toolbox is usable
echo.

echo Starting building executable file...
matlab -batch "deploy_DCT_PLS"

if %ERRORLEVEL% equ 0 (
    echo.
    echo ========================================
    echo Built successfully!
    echo ========================================
    echo Executable file location：L:\SMOS_SC\exe\DCT_PLS_SM.exe
    echo.
) else (
    echo.
    echo ========================================
    echo Construction failed!
    echo ========================================
    echo Please check the error message and try again
    echo.
)

pause
