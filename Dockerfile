FROM acuvity/mcp-server-postgres:latest

# MCP listens on port 8000 by default
EXPOSE 8000

# Run postgres-mcp directly on the same port
CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port 8000 --disable-metrics --log-level debug"]
