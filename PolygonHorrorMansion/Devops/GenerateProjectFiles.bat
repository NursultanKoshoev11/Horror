@echo off
REM ==================================================
REM Генерация файлов Visual Studio через UnrealBuildTool
REM ==================================================

set "UE_PATH=F:\Program Files\Epic Games\UE_5.6"
set "UBT_PATH=%UE_PATH%\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe"

REM Поиск .uproject файла в текущей папке
for %%f in (..\\*.uproject) do set "PROJECT_FILE=%%f"

REM Проверка найден ли проект
if not defined PROJECT_FILE (
    echo Ошибка: не найден .uproject файл в текущей папке
    pause
    exit /b 1
)

echo Найден проект: %PROJECT_FILE%
echo.

REM Проверяем существование UnrealBuildTool
if not exist "%UBT_PATH%" (
    echo Ошибка: UnrealBuildTool не найден по пути:
    echo "%UBT_PATH%"
    echo Проверьте правильность пути к Unreal Engine.
    pause
    exit /b 1
)

echo Запуск генерации файлов проекта...
echo.

REM Генерация файлов проекта
"%UBT_PATH%" -projectfiles -project="%CD%\%PROJECT_FILE%" -game -progress

if %errorlevel% neq 0 (
    echo.
    echo Ошибка при генерации файлов!
    echo Код ошибки: %errorlevel%
    echo.
    echo Попробуйте другие параметры:
    echo   Для Visual Studio 2022: -projectfiles -project="project.uproject" -game -2022
    echo   Полная генерация: -projectfiles -project="project.uproject" -game -engine
) else (
    echo.
    echo Генерация завершена успешно!
    echo Создан файл: %PROJECT_FILE:.uproject=.sln%
    echo.
    
    REM Проверяем создался ли .sln файл
    if exist "%PROJECT_FILE:.uproject=.sln%" (
        echo Файл решения готов к использованию.
    )
)

pause