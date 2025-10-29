# dataiq-mcp-host/Dockerfile
FROM acuvity/mcp-server-postgres:latest

# Respect Render’s PORT environment variable (default to 8000)
ENV PORT=${PORT:-8000}

# Disable metrics entirely to avoid port 8080 conflicts
ENV DISABLE_METRICS=true

# Expose only the configured port
EXPOSE ${PORT}

# Bind both the MCP backend and frontend to the same port
CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port ${PORT} --frontend-port ${PORT} --disable-metrics"]
