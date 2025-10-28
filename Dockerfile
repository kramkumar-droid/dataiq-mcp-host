# DataIQ MCP Dockerfile (Render-ready)
FROM acuvity/mcp-server-postgres:latest

# Force the service to bind on 8000 (Render health will check here)
ENV PORT=8000
# Turn off the internal metrics server (prevents port 8080 from opening)
ENV DISABLE_METRICS=true

# Expose only the port we actually use
EXPOSE 8000

# Start the MCP server bound to 8000
CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port 8000"]
