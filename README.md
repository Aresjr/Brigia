# Brigia
Sistema clínico

## Rodando o projeto
```bash
  docker compose up --build
```

http://localhost:8009/swagger-ui/index.html

## Variáveis de ambiente:
```bash
ENV=dev
FRONTEND_PORT=8081
BACKEND_PORT=8009
BACKEND_URL=http://localhost:8009

JWT_SECRET=

DB_HOST=localhost
DB_PORT=
DB_NAME=
DB_USER=
DB_PASSWORD=
```
