FROM postgres:17

# Optional environment variables (can be overridden at runtime)
ENV POSTGRES_DB=app_db
ENV POSTGRES_USER=app_user
ENV POSTGRES_PASSWORD=app_password

# Expose PostgreSQL default port
EXPOSE 5432

# Data directory (already defined in the base image, kept for clarity)
VOLUME ["/var/lib/postgresql/data"]

# Default command (inherited from the base image)
CMD ["postgres"]

