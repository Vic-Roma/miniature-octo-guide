# Family Manager

A Java-based task management application for family memberDtos with PostgreSQL database backend.

## Project Overview

This application helps manage tasks and assignments for family memberDtos. It uses Java 17 with Maven for dependency management and Docker Compose for running a PostgreSQL database.

**Note:** Database connectivity from the Java application will be added in a future update. This setup currently focuses on infrastructure only.

## Prerequisites

Before you can run this project, make sure you have the following installed:

- **Java Development Kit (JDK) 17 or higher**
  - Check: `java -version`
  - Download from: [Oracle JDK](https://www.oracle.com/java/technologies/downloads/) or [OpenJDK](https://openjdk.org/)

- **Maven 3.6+**
  - Check: `mvn -version`
  - Download from: [Apache Maven](https://maven.apache.org/download.cgi)

- **Docker & Docker Compose**
  - Check: `docker --version` and `docker compose version`
  - Download from: [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Project Structure

```
miniature-octo-guide/
├── docker/
│   └── postgres/
│       └── init.sql              # Database initialization script
├── src/
│   └── main/
│       └── java/
│           └── org/
│               └── rodriguez/
│                   └── corp/
│                       ├── Main.java
│                       ├── Member.java
│                       └── Task.java
├── docker-compose.yml            # Docker Compose configuration
├── pom.xml                       # Maven project configuration
└── README.md                     # This file
```

## Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd miniature-octo-guide
```

### 2. Start the PostgreSQL Database

The database is managed through Docker Compose. To start it:

```bash
docker compose up -d
```

This command will:
- Download the PostgreSQL 17 image (if not already downloaded)
- Create and start a PostgreSQL container named `family_manager_db`
- Automatically execute the `init.sql` script to set up the database schema and initial data
- Expose PostgreSQL on port `5432`

**Database Connection Details:**
- **Host:** `localhost`
- **Port:** `5432`
- **Database:** `app_db`
- **Username:** `app_user`
- **Password:** `app_password`

### 3. Verify Database is Running

Check if the database container is healthy:

```bash
docker compose ps
```

You should see the `family_manager_db` container with a status of "Up" and healthy.

### 4. Build the Java Application

```bash
mvn clean compile
```

This will compile the Java source files.

### 5. Run the Application

```bash
mvn exec:java -Dexec.mainClass="org.rodriguez.corp.Main"
```

Or alternatively, compile and run:

```bash
mvn clean package
java -cp target/FamilyManager-1.0-SNAPSHOT.jar org.rodriguez.corp.Main
```

## Docker Compose Commands

### Start the Database
```bash
docker compose up -d
```
The `-d` flag runs containers in detached mode (in the background).

### Stop the Database
```bash
docker compose stop
```

### Stop and Remove Containers
```bash
docker compose down
```

### Stop and Remove Containers + Volumes (removes all data)
```bash
docker compose down -v
```

### View Database Logs
```bash
docker compose logs postgres
```

### Follow Database Logs in Real-time
```bash
docker compose logs -f postgres
```

### Restart the Database
```bash
docker compose restart
```

## Database Management

### Accessing the Database via psql

You can connect to the PostgreSQL database using the `psql` command-line tool:

```bash
docker compose exec postgres psql -U app_user -d app_db
```

### Reloading the Database Schema

If you need to reset the database to its initial state:

1. Stop and remove the containers and volumes:
   ```bash
   docker compose down -v
   ```

2. Start the containers again (this will re-run init.sql):
   ```bash
   docker compose up -d
   ```

### Modifying the Database Schema

To modify the database schema:
1. Edit the `docker/postgres/init.sql` file
2. Reload the database as described above

## Maven Commands

### Clean Build Artifacts
```bash
mvn clean
```

### Compile Source Code
```bash
mvn compile
```

### Run Tests (when tests are added)
```bash
mvn test
```

### Package Application (creates JAR file)
```bash
mvn package
```

### Install to Local Maven Repository
```bash
mvn install
```

## Troubleshooting

### Port 5432 Already in Use

If you see an error about port 5432 being already in use:

1. Check if PostgreSQL is already running on your machine:
   ```bash
   sudo lsof -i :5432
   ```

2. Either stop the existing PostgreSQL service or change the port in `docker-compose.yml`:
   ```yaml
   ports:
     - "5433:5432"  # Use port 5433 on host instead
   ```

### Database Connection Issues

1. Ensure the database container is running and healthy:
   ```bash
   docker compose ps
   ```

2. Check the database logs for errors:
   ```bash
   docker compose logs postgres
   ```

3. Verify you can connect to the database:
   ```bash
   docker compose exec postgres psql -U app_user -d app_db -c "SELECT version();"
   ```

### Maven Build Errors

1. Clean the project and rebuild:
   ```bash
   mvn clean compile
   ```

2. Update Maven dependencies:
   ```bash
   mvn dependency:purge-local-repository
   ```

3. Ensure you're using Java 17 or higher:
   ```bash
   java -version
   ```

## Additional Resources

- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Maven Getting Started Guide](https://maven.apache.org/guides/getting-started/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

## Contributing

For developers contributing to this project:

1. Create a new branch from `main`
2. Make your changes
3. Test locally with Docker Compose
4. Submit a pull request

## License

[Add your license information here]
