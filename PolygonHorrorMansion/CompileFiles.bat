@echo off

set NAME=PolygonHorrorMansion

set PROJECT_DIR=%~dp0
set PROJECT_NAME=\%NAME%.uproject
set PROJECT_FILE="%PROJECT_DIR%%PROJECT_NAME%"
set EDITOR_NAME=%NAME%Editor

if not exist "%PROJECT_FILE%" (
    echo ERROR: Project file not found at %PROJECT_FILE%
    pause
    exit /B 1
)

"%UNREAL_ENGINE%\Build\BatchFiles\Build.bat" %EDITOR_NAME% Win64 Development -Project="%PROJECT_FILE%" -WaitMutex -FromMsBuild -architecture=x64

exit /B %ERRORLEVEL%