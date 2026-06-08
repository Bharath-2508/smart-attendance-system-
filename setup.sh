#!/bin/bash

echo "============================================"
echo "  Bus Attendance System - Setup Script"
echo "============================================"
echo ""

echo "[1/4] Installing backend dependencies..."
cd backend || exit
npm install
if [ $? -ne 0 ]; then
    echo "Failed to install backend dependencies"
    exit 1
fi

echo ""
echo "[2/4] Installing frontend dependencies..."
cd ../frontend || exit
npm install
if [ $? -ne 0 ]; then
    echo "Failed to install frontend dependencies"
    exit 1
fi

echo ""
echo "[3/4] Creating .env files..."
cd ../backend || exit
if [ ! -f .env ]; then
    cat > .env << 'EOF'
PORT=5000
JWT_SECRET=bus-attendance-secret-key-2024
EOF
    echo "Backend .env file created"
fi

cd ../frontend || exit
if [ ! -f .env ]; then
    cat > .env << 'EOF'
REACT_APP_API_URL=http://localhost:5000/api
EOF
    echo "Frontend .env file created"
fi

echo ""
echo "[4/4] Setup complete!"
echo ""
echo "============================================"
echo "  To run the application:"
echo "============================================"
echo ""
echo "Terminal 1 - Start Backend:"
echo "  cd backend"
echo "  npm start"
echo ""
echo "Terminal 2 - Start Frontend:"
echo "  cd frontend"
echo "  npm start"
echo ""
echo "Or use Docker:"
echo "  docker-compose up --build"
echo ""
echo "============================================"
echo "  Demo Credentials:"
echo "============================================"
echo "  Admin:  admin@bus.com / admin123"
echo "  Driver: driver@bus.com / driver123"
echo "============================================"
