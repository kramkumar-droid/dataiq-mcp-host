# dataiq-mcp-host/Dockerfile
FROM acuvity/mcp-server-postgres:latest

# Respect Render’s PORT environment variable (default to 10000 if not set)
ENV PORT=${PORT:-10000}

# Optional: disable metrics to reduce log noise
ENV DISABLE_METRICS=true

# Expose the port Render will check
EXPOSE ${PORT}

# Start the MCP server bound to the same port
CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port ${PORT} --disable-metrics"]
