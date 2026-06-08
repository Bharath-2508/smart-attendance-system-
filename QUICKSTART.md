# Bus Attendance Management System

## Quick Start

### Option 1: Local Development

```bash
# 1. Install dependencies
cd backend && npm install
cd ../frontend && npm install

# 2. Start backend (terminal 1)
cd backend && npm start

# 3. Start frontend (terminal 2)
cd frontend && npm start

# 4. Open http://localhost:3000
```

### Option 2: Docker

```bash
docker-compose up --build
```

## Demo Login
- **Admin**: admin@bus.com / admin123
- **Driver**: driver@bus.com / driver123

## Features
- Login with email/password
- Select bus and date
- Mark attendance (Present/Absent)
- View attendance reports
- Export to CSV
- Docker containerization
- CI/CD with GitHub Actions

## Tech Stack
- **Frontend**: React, React Router, CSS
- **Backend**: Node.js, Express, JWT
- **Data**: JSON (MongoDB-ready)
- **DevOps**: Docker, GitHub Actions

## Project Structure
```
├── backend/           # Express API
├── frontend/         # React app
├── docker-compose.yml
├── .github/workflows/ # CI/CD
└── README.md
```
