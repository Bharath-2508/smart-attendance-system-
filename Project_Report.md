# DevOps Assignment Project Report: Bus Attendance System

## 1. Project Overview
The **Bus Attendance System** is a full-stack web application designed to help administrative staff manage and monitor student attendance across a fleet of school or university buses. The system features a responsive front-end interface built with React, paired with a robust back-end REST API built on Node.js and Express.

The application is fully containerized using Docker and is orchestrated via Docker Compose, effectively abstracting environment differences and mapping deployment structures. 

## 2. Technology Stack & Architecture
### Frontend:
*   **Framework:** React.js (JavaScript)
*   **Routing:** React Router v6
*   **Styling:** Custom CSS modules/assets
*   **Web Server / Proxy:** Nginx (Alpine-based, via multi-stage Docker build) 

### Backend:
*   **Runtime Environment:** Node.js
*   **Framework:** Express.js (Includes security middlewares like `helmet` & `cors`)
*   **Database Integration:** MongoDB (via Mongoose)
*   **Security:** JWT-based authentication
*   **Rate Limiting:** `express-rate-limit`

### DevOps & Infrastructure:
*   **Containerization:** Docker & Docker Compose
*   **Continuous Integration / Continuous Deployment:** GitHub Actions
*   **Production Hosting:** Netlify (Frontend) and Render (Backend API)

## 3. Docker Containerization Strategy
The project relies thoroughly on Docker to containerize both domains securely.

### 3.1 Network and Composition
The `docker-compose.yml` orchestrates the services:
*   **Custom Network:** `bus-network` bridges both containers allowing the Nginx instance to safely route `/api` HTTP requests directly to `http://backend:5000` via internal DNS.
*   **Port Mapping:** Maps local port `3000` to the frontend's Nginx port `80`, and port `5000` directly to the Node API.
*   **Restart Policy:** `unless-stopped` guarantees high availability in failure cases.

### 3.2 Frontend Container (Multi-Stage Build)
An optimized multi-stage `Dockerfile` is utilized for the React application:
1.  **Build Stage (Node.js):** Pulls `node:18-alpine`, locally installs NPM packages from `package.json`, and outputs minimized, production-ready static files via `npm run build`.
2.  **Server Stage (Nginx):** Shifts to a minimal `nginx:alpine` image. It pulls the HTML/JS build payloads, inserts a custom `nginx.conf`, configures reverse proxy logic for the backend REST calls, and serves it extremely fast onto Port 80.

### 3.3 Backend Container
The Backend node server uses a standard performance-conscious logic flow in its `Dockerfile`:
*   Pulls `node:18-alpine` as a base environment.
*   Only runs `npm install --production` to ensure that standard dev/utility dependencies aren't bloated onto the image.
*   Exposes Port 5000 and runs `npm start`.
*   Connects synchronously to MongoDB, defaulting gracefully to an offline fallback file tree if connection fails, ensuring a stable presentation logic.

Both containers feature specialized `.dockerignore` files to prevent the pollution of source images from `node_modules` and hidden development files.

## 4. Continuous Integration & Deployment (CI/CD)
The project ships with an enterprise-ready GitHub Actions YAML pipeline (`.github/workflows/ci-cd.yml`).
The orchestrated pipeline follows strong release methodologies logic split across 8 sequential jobs:

1.  **lint:** Validates static code style across both packages using `npm ci`.
2.  **test-backend:** Spins up the Node.js API environment and curls live test assertions securely against the running Auth middleware. 
3.  **test-frontend:** Proclaims a test build instance for React.
4.  **docker-build:** Safely leverages Docker cache mechanisms (`cache-from/cache-to`) to build image manifests (`bus-attendance-api` and `bus-attendance-frontend`).
5.  **test-docker:** Spins up `docker-compose up -d` against the locally built images in standard Ubuntu runner environments, checks container sanity (`docker-compose ps`), and curls `/api/health`.
6.  **deploy-render (Production):** If triggered on the `main` branch, automates the `render-deploy-action` webhook to securely deploy the Dockerized back-end to **Render**.
7.  **deploy-netlify (Production):** Concurrently deploys the React production payload to **Netlify** using Netlify secret environment variables.
8.  **notify:** Resolves with an asynchronous discord Webhook message summarizing the deployment status visually.

## 5. Local Execution Instructions
Ensure you have Docker and Docker Compose installed.

**1. Clone and Enter the Directory:** 
\`\`\`bash
git clone <repository_url>
cd <repository_directory>
\`\`\`
**2. Build & Deploy using Docker Compose:**
\`\`\`bash
docker-compose up --build -d
\`\`\`
*   Navigate to your browser and open `http://localhost:3000` to interact with the Frontend UI.
*   The Backend API answers to routes originating strictly from `http://localhost:5000/api`.
