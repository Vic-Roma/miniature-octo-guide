# Family Manager

A Java application for managing family members and their assigned tasks.

## Database Setup

This project uses PostgreSQL running in Docker. The database automatically initializes with family members and tasks.

### Start Database

```bash
docker compose up -d
```

### Stop Database

```bash
docker compose down
```

### Connect to Database

```bash
docker exec -it family-manager-db psql -U app_user -d app_db
```

### View Data

```sql
-- List family members
SELECT * FROM empleados;

-- List all tasks with assigned members
SELECT t.id_task, t.description, e.name as asignee 
FROM task t 
LEFT JOIN empleados e ON t.asignee = e.id;
```

### Reset Database

To delete all data and reinitialize from scratch:

```bash
docker compose down -v
docker compose up -d
```

## Database Connection Info

- **Host:** localhost
- **Port:** 5432
- **Database:** app_db
- **User:** app_user
- **Password:** app_password

## Project Structure

```
miniature-octo-guide/
├── docker-compose.yml    # Database configuration
├── pom.xml              # Maven configuration
└── src/
    ├── db/
    │   └── init.sql     # Database initialization script
    └── main/java/...    # Java source code
```
