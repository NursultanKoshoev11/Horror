@echo off

echo ================================================
echo  Пакетирование Unreal Engine проекта
echo ================================================
echo.

REM Настройки сборки (можно менять)
set "PLATFORM=Win64"
set "CONFIG=Shipping"
set "PLATFORM_DESC=Windows 64-bit"

REM Путь к Unreal Engine
set "UE_PATH=F:\Program Files\Epic Games\UE_5.6"
set "UAT=%UE_PATH%\Engine\Build\BatchFiles\RunUAT.bat"

REM Находим проект
for %%f in (..\\*.uproject) do set "PROJECT=%%f"

if not defined PROJECT (
    echo Ошибка: не найден .uproject файл!
    pause
    exit /b 1
)

for %%f in (%PROJECT%) do set "PROJECT_NAME=%%~nf"
echo Проект: %PROJECT_NAME%
echo.

echo Создание пакета проекта...
echo.
echo Параметры:
echo - Платформа: %PLATFORM_DESC%
echo - Конфигурация: %CONFIG%
echo - Архивация: ZIP архив
echo - Содержимое: Полная сборка
echo.

REM Создаем временную папку
set "TEMP_BUILD=%PROJECT_NAME%_Build_Temp"
set "FINAL_OUTPUT=%PROJECT_NAME%_Package_%PLATFORM%_%CONFIG%"

echo Шаг 1: Сборка проекта...
call "%UAT%" BuildCookRun ^
    -project="%CD%\%PROJECT%" ^
    -noP4 ^
    -platform=%PLATFORM% ^
    -clientconfig=%CONFIG% ^
    -serverconfig=%CONFIG% ^
    -cook ^
    -allmaps ^
    -stage ^
    -pak ^
    -archive ^
    -archivedirectory="%TEMP_BUILD%" ^
    -build

if %errorlevel% neq 0 (
    echo Ошибка на этапе сборки!
    pause
    exit /b 1
)

echo.
echo Шаг 2: Создание установщика...
echo.

REM Создаем readme файл
echo Название: %PROJECT_NAME%> "%FINAL_OUTPUT%\README.txt"
echo Платформа: %PLATFORM_DESC%>> "%FINAL_OUTPUT%\README.txt"
echo Конфигурация: %CONFIG%>> "%FINAL_OUTPUT%\README.txt"
echo Дата сборки: %date% %time%>> "%FINAL_OUTPUT%\README.txt"
echo.>> "%FINAL_OUTPUT%\README.txt"
echo Для запуска игры откройте папку Game и запустите %PROJECT_NAME%.exe>> "%FINAL_OUTPUT%\README.txt"

echo.
echo Шаг 3: Создание ZIP архива...
echo.

REM Используем 7-Zip если установлен, иначе встроенный
if exist "%ProgramFiles%\7-Zip\7z.exe" (
    "%ProgramFiles%\7-Zip\7z.exe" a -tzip "%FINAL_OUTPUT%.zip" "%FINAL_OUTPUT%\*"
) else (
    powershell Compress-Archive -Path "%FINAL_OUTPUT%\*" -DestinationPath "%FINAL_OUTPUT%.zip" -Force
)

echo.
echo ================================================
echo  ПАКЕТИРОВАНИЕ ЗАВЕРШЕНО!
echo ================================================
echo.
echo Созданы файлы:
echo   1. Папка: %FINAL_OUTPUT%\
echo   2. Архив: %FINAL_OUTPUT%.zip
echo.
echo Содержимое пакета:
echo   - Исполняемый файл игры
echo   - Все необходимые ресурсы
echo   - Файл README.txt
echo.

echo.

pause
