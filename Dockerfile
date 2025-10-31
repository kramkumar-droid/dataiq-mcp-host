FROM acuvity/mcp-server-postgres:latest

# Render injects PORT automatically
EXPOSE 8000

# Simple healthcheck endpoint
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://localhost:${PORT:-8000}/mcp || exit 1

# Run MCP normally (enable metrics so /metrics returns 200)
CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port ${PORT:-8000} --log-level debug"]
