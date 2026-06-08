# Bus Attendance Management System

A full-stack web application for managing student bus attendance with authentication, attendance marking, and reporting capabilities.

## Features

- **User Authentication**: Secure login system for drivers and admins
- **Bus Selection**: Choose bus, route, and date for attendance
- **Attendance Marking**: Mark students as Present/Absent with toggle
- **Attendance Reports**: View historical attendance in table format
- **Export**: Download attendance as CSV
- **Docker Support**: Containerized backend deployment
- **CI/CD**: Automated testing and deployment

## Tech Stack

### Frontend
- React.js
- React Router
- Context API for state management
- Modern CSS with clean UI

### Backend
- Node.js
- Express.js
- MongoDB (with local JSON fallback for demo)
- JWT Authentication

### DevOps
- Docker
- GitHub Actions
- Netlify (frontend)
- Railway/Render (backend)

## Project Structure

```
deveps assignment/
├── backend/
│   ├── controllers/
│   ├── routes/
│   ├── models/
│   ├── config/
│   ├── data/
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── context/
│   │   └── styles/
│   ├── public/
│   ├── package.json
│   └── Dockerfile
├── docker-compose.yml
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── .gitignore
└── README.md
```

## Quick Start

### Prerequisites
- Node.js 18+
- npm or yarn
- Docker (optional)
- MongoDB connection string (optional, uses local data if not provided)

### Backend Setup

```bash
cd backend
npm install
npm start
```

The backend runs on http://localhost:5000

### Frontend Setup

```bash
cd frontend
npm install
npm start
```

The frontend runs on http://localhost:3000

### Using Docker

```bash
docker-compose up --build
```

## Demo Credentials

| Email | Password | Role |
|-------|----------|------|
| admin@bus.com | admin123 | Admin |
| driver@bus.com | driver123 | Driver |

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `GET /api/auth/me` - Get current user

### Buses
- `GET /api/buses` - Get all buses

### Students
- `GET /api/students?busId=xxx` - Get students by bus

### Attendance
- `POST /api/attendance` - Save attendance
- `GET /api/attendance?busId=xxx&date=xxx` - Get attendance
- `GET /api/attendance/report` - Get attendance report

## Environment Variables

### Backend (.env)
```
PORT=5000
MONGODB_URI=mongodb://localhost:27017/bus-attendance
JWT_SECRET=your-secret-key
```

### Frontend (.env)
```
REACT_APP_API_URL=http://localhost:5000/api
```

## Deployment

### Frontend (Netlify/Vercel)
1. Connect your GitHub repo
2. Set build command: `npm run build`
3. Set output directory: `build`
4. Add environment variable: `REACT_APP_API_URL`

### Backend (Railway/Render)
1. Connect your GitHub repo
2. Set build command: `npm install`
3. Set start command: `npm start`
4. Add environment variables

## CI/CD Pipeline

GitHub Actions automatically:
1. Runs tests on every push
2. Builds Docker images
3. Deploys to hosting platforms

## Sample Data

The system includes sample data for:
- 3 buses with routes
- 15 students across different buses
- Demo users (admin and driver)

## Screenshots

### Login Page
Clean, minimal login form with email and password validation.

### Dashboard
Select bus number, route, and date to begin attendance.

### Attendance Page
List of students with Present/Absent toggle buttons.

### Report Page
Table view of attendance history with export option.

## License

MIT License
