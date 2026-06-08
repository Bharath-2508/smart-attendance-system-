@echo off
echo ============================================
echo   Bus Attendance System - Setup Script
echo ============================================
echo.

echo [1/4] Installing backend dependencies...
cd backend
call npm install
if %errorlevel% neq 0 (
    echo Failed to install backend dependencies
    pause
    exit /b 1
)

echo.
echo [2/4] Installing frontend dependencies...
cd ..\frontend
call npm install
if %errorlevel% neq 0 (
    echo Failed to install frontend dependencies
    pause
    exit /b 1
)

echo.
echo [3/4] Creating .env files...
cd ..\backend
if not exist .env (
    echo PORT=5000 > .env
    echo JWT_SECRET=bus-attendance-secret-key-2024 >> .env
    echo.
    echo Backend .env file created
)

cd ..\frontend
if not exist .env (
    echo REACT_APP_API_URL=http://localhost:5000/api > .env
    echo.
    echo Frontend .env file created
)

echo.
echo [4/4] Setup complete!
echo.
echo ============================================
echo   To run the application:
echo ============================================
echo.
echo Terminal 1 - Start Backend:
echo   cd backend
echo   npm start
echo.
echo Terminal 2 - Start Frontend:
echo   cd frontend
echo   npm start
echo.
echo Or use Docker:
echo   docker-compose up --build
echo.
echo ============================================
echo   Demo Credentials:
echo ============================================
echo   Admin:  admin@bus.com / admin123
echo   Driver: driver@bus.com / driver123
echo ============================================
echo.
pause
