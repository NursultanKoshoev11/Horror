@echo off
REM ==================================================
REM Быстрая компиляция UE проекта
REM Использование: Compile.bat [Target] [Platform] [Config]
REM Пример: Compile.bat Editor Win64 Development
REM ==================================================

setlocal

set "UE_PATH=F:\Program Files\Epic Games\UE_5.6"

REM Параметры по умолчанию
set "TARGET=%~1"
if "%TARGET%"=="" set "TARGET=Editor"

set "PLATFORM=%~2"
if "%PLATFORM%"=="" set "PLATFORM=Win64"

set "CONFIG=%~3"
if "%CONFIG%"=="" set "CONFIG=Development"

REM Находим проект
for %%f in (..\\*.uproject) do set "PROJECT_FILE=%%f"

if not defined PROJECT_FILE (
    echo Error: No .uproject file found
    pause
    exit /b 1
)

for %%f in (%PROJECT_FILE%) do set "PROJECT_NAME=%%~nf"

echo Compiling %PROJECT_NAME%...
echo Target: %PROJECT_NAME%%TARGET%
echo Platform: %PLATFORM%
echo Configuration: %CONFIG%
echo.

set "UBT=%UE_PATH%\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe"

if not exist "%UBT%" (
    echo Error: UBT not found at %UBT%
    pause
    exit /b 1
)

REM Компиляция
"%UBT%" %PROJECT_NAME%%TARGET% %PLATFORM% %CONFIG% ^
    -Project="%CD%\%PROJECT_FILE%" ^
    -Progress ^
    -WaitMutex ^
    -NoHotReload ^
    -Verbose

echo.
if %errorlevel% equ 0 (
    echo Build succeeded!
) else (
    echo Build failed with error code %errorlevel%
)

pause
endlocal