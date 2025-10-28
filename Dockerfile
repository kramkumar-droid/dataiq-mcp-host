# DataIQ MCP Dockerfile (Render stable)
FROM acuvity/mcp-server-postgres:latest

# Set environment variables before entrypoint
ENV DATABASE_URI=""
ENV READ_ONLY=true
ENV PORT=8000
ENV DISABLE_METRICS=true

# Expose only port 8000
EXPOSE 8000

# Explicitly disable metrics server and bind to port 8000
CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port 8000 --disable-metrics"]
