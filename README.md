# Brigia
Open Source EMR with AI features

## Running the project 
```bash
  docker compose up --build
```

## Environment Variables needed:
The current project uses Supabase for the database and authentication.
You can set the environment variables directly in OS or create a `.env` file in the root directory of the project with the following content:
```bash
ENV=dev
FRONTEND_PORT=8080
BACKEND_PORT=8008
BACKEND_URL=http://localhost:8008

SUPABASE_URL=https://your_project_id.supabase.co
SUPABASE_PUBLISHABLE_KEY=key-from-supabase

SUPABASE_PROJECT_ID=your_project_id
SUPABASE_JWT_SECRET=jwt-secret
SUPABASE_JWT_ALGO=HS256
```

## Roadmap

### Backend
- [X] Create a backend application using **FastAPI**
  ![Status: Done](https://img.shields.io/badge/status-done-green)
- [X] Use auth in HTTP-only Cookie instead of saving auth token in local session
  ![Status: Done](https://img.shields.io/badge/status-done-green)
- [ ] Finish Professionals endpoints
- [ ] Use SQLAlchemy for database access in backend instead of direct calling Supabase

### Frontend
- [X] Point Patient frontend calls to backend instead of directly to Supabase
  ![Status: Done](https://img.shields.io/badge/status-done-green)
- [X] Point Medical Plans frontend calls to backend instead of directly to Supabase
  ![Status: Done](https://img.shields.io/badge/status-done-green)
- [ ] Completely remove Supabase from frontend
- [ ] Finish Professionals page
- [ ] Migrate to **Next.js** for SSR and routing improvements  
  ![Next.js](https://img.shields.io/badge/Next.js-000000?style=flat-square&logo=nextdotjs&logoColor=white)
- [ ] Add i18n support for multiple languages
  ![i18n](https://img.shields.io/badge/i18n-000000?style=flat-square&logo=i18next&logoColor=white)
