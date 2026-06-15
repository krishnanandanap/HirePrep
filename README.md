# PrepIQ — MCQ Interview Practice System
## MVP (Spring Boot + React)

---

## 📁 Project Structure

```
interview-mvp/
├── backend/           ← Spring Boot (Java 17)
│   ├── pom.xml
│   └── src/main/
│       ├── java/com/interview/
│       │   ├── controller/    (AuthController, QuestionController, TestController, ResultController)
│       │   ├── entity/        (User, Question, Result)
│       │   ├── repository/    (UserRepository, QuestionRepository, ResultRepository)
│       │   ├── security/      (JwtUtil, JwtFilter)
│       │   ├── dto/           (Request/Response DTOs)
│       │   └── config/        (SecurityConfig)
│       └── resources/
│           ├── application.properties
│           └── data.sql       (20 seed questions)
└── frontend/          ← React + Vite
    ├── package.json
    ├── vite.config.js
    └── src/
        ├── pages/    (Login, Register, Dashboard, TestPage, ResultPage)
        ├── utils/    (api.js, AuthContext.jsx)
        ├── App.jsx
        └── index.css
```

---

## ⚙️ Setup & Run

### ✅ Prerequisites
- Java 17+
- Node.js 18+
- Maven 3.8+

---

### 🔧 Backend

```bash
cd backend

# Run with H2 (in-memory, works out of the box)
mvn spring-boot:run
```

Backend starts at: **http://localhost:8080**

**H2 Console** (to inspect database): http://localhost:8080/h2-console
- JDBC URL: `jdbc:h2:mem:interviewdb`
- Username: `sa`
- Password: (leave blank)

#### ➡️ Switch to MySQL (optional)
1. Create DB: `CREATE DATABASE interviewdb;`
2. Open `src/main/resources/application.properties`
3. Comment out H2 block, uncomment MySQL block
4. Update username/password
5. Change `spring.jpa.hibernate.ddl-auto=create` (first run), then `update`

---

### 🔧 Frontend

```bash
cd frontend
npm install
npm run dev
```

Frontend starts at: **http://localhost:3000**

The Vite proxy forwards `/api` requests to `http://localhost:8080` automatically.

---

## 🔌 API Endpoints

| Method | URL | Auth | Description |
|--------|-----|------|-------------|
| POST | `/api/auth/register` | ❌ | Register new user |
| POST | `/api/auth/login` | ❌ | Login → returns JWT |
| GET | `/api/questions` | ✅ JWT | Get 10 random questions |
| POST | `/api/submit` | ✅ JWT | Submit answers, get result |
| GET | `/api/results/{userId}` | ✅ JWT | Get all results for user |

---

## 🧠 Scoring Logic

- 10 questions per test
- Each correct answer = **10 points**
- Maximum score = **100**
- Unanswered = 0 points

---

## 🎓 Viva Explanation

> "We developed a web-based mock interview system that allows users to practice MCQ-based interview tests with JWT authentication, timed assessments (10 minutes), and result evaluation. The backend is built with Spring Boot using a layered architecture (Controller → Service → Repository), secured with stateless JWT tokens. The frontend is built with React using React Router for navigation and Axios for API communication."

---

## 🚀 Deployment (Optional)

- **Frontend** → Render / Vercel / Netlify (run `npm run build`, deploy `dist/`)
- **Backend** → Render (as a Java web service), set env vars for MySQL
- **Database** → PlanetScale / Railway / Aiven (free MySQL tiers)
