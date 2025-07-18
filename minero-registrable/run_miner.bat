@echo off
REM 1) Ir al directorio del script (raíz del proyecto)
cd /d "%~dp0"

REM 2) Activar virtualenv si existe, si no, créalo
if exist "venv\Scripts\activate.bat" (
    call "venv\Scripts\activate.bat"
) else (
    echo No se encontró 'venv'. Creando virtualenv...
    python -m venv venv
    call "venv\Scripts\activate.bat"
)

REM 3) Instalar dependencias
if exist "requirements.txt" (
    python -m pip install --upgrade pip
    python -m pip install -r requirements.txt
) else (
    echo ⚠️  requirements.txt no encontrado, saltando pip install
)

REM 4) Definir variables de entorno (ajústalas)
set "POOL_BASE_URL=http://35.239.200.118:8081/api/pools"
set "RABBITMQ_HOST=35.239.206.202"

REM 5) Ejecutar el miner
python -m minero-registrable

pause