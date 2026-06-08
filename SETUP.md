# Setup Instructions for Bus Attendance Management System

## Prerequisites

- Node.js 18 or higher
- npm (comes with Node.js)
- Docker and Docker Compose (optional)
- Git

## Quick Setup (Windows)

1. Run the setup script:
```bash
setup.bat
```

2. Start the backend:
```bash
cd backend
npm start
```

3. Start the frontend (in a new terminal):
```bash
cd frontend
npm start
```

4. Open browser: http://localhost:3000

## Quick Setup (macOS/Linux)

1. Run the setup script:
```bash
chmod +x setup.sh
./setup.sh
```

2. Start the backend:
```bash
cd backend
npm start
```

3. Start the frontend (in a new terminal):
```bash
cd frontend
npm start
```

4. Open browser: http://localhost:3000

## Using Docker

### Option 1: Docker Compose (Recommended)

```bash
docker-compose up --build
```

This will start both frontend and backend containers.

- Frontend: http://localhost:3000
- Backend API: http://localhost:5000

### Option 2: Build Images Manually

Backend:
```bash
cd backend
docker build -t bus-attendance-api .
docker run -p 5000:5000 bus-attendance-api
```

Frontend:
```bash
cd frontend
docker build -t bus-attendance-frontend .
docker run -p 3000:80 bus-attendance-frontend
```

## Demo Credentials

| Role  | Email           | Password   |
|-------|-----------------|------------|
| Admin | admin@bus.com   | admin123   |
| Driver| driver@bus.com  | driver123  |

## Project Structure

```
deveps assignment/
├── backend/
│   ├── controllers/     # API controllers
│   ├── routes/          # API routes
│   ├── data/            # Sample data (JSON)
│   ├── config/          # Configuration
│   ├── server.js        # Express server
│   ├── package.json
│   └── Dockerfile
│
├── frontend/
│   ├── src/
│   │   ├── components/  # React components
│   │   ├── pages/       # Page components
│   │   ├── context/     # Context providers
│   │   └── styles/      # CSS styles
│   ├── public/          # Static files
│   ├── package.json
│   ├── Dockerfile
│   └── nginx.conf
│
├── docker-compose.yml   # Docker orchestration
├── .github/workflows/   # CI/CD pipeline
├── README.md
├── setup.bat
└── setup.sh
```

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `GET /api/auth/me` - Get current user (requires token)

### Buses
- `GET /api/buses` - Get all buses

### Students
- `GET /api/students?busId=xxx` - Get students by bus

### Attendance
- `POST /api/attendance` - Save attendance
- `GET /api/attendance?busId=xxx&date=xxx` - Get attendance
- `GET /api/attendance/report?busId=xxx&startDate=xxx&endDate=xxx` - Get report

## Environment Variables

### Backend (.env)
```
PORT=5000
MONGODB_URI=mongodb://localhost:27017/bus-attendance
JWT_SECRET=your-secret-key
NODE_ENV=development
```

### Frontend (.env)
```
REACT_APP_API_URL=http://localhost:5000/api
```

## Deployment

### Deploy Backend to Railway

1. Connect your GitHub repo to Railway
2. Railway will auto-detect Node.js
3. Set environment variables in Railway dashboard
4. Deploy

### Deploy Frontend to Netlify

1. Connect your GitHub repo to Netlify
2. Build settings:
   - Build command: `npm run build`
   - Publish directory: `build`
3. Add environment variable: `REACT_APP_API_URL`
4. Deploy

## CI/CD

The GitHub Actions workflow automatically:
- Runs tests on every push
- Builds Docker images
- Deploys to Railway/Netlify on main branch

## Features

1. **Login Page** - Email/password validation with JWT authentication
2. **Dashboard** - Overview stats, bus fleet list, quick actions
3. **Attendance Page** - Mark students as Present/Absent
4. **Report Page** - View attendance history, export to CSV

## Troubleshooting

### Port already in use
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Linux/Mac
lsof -i :5000
kill -9 <PID>
```

### MongoDB connection issues
The system uses in-memory data storage by default. For production, set `MONGODB_URI` environment variable.

## License

MIT
