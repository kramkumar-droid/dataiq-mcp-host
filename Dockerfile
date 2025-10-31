FROM acuvity/mcp-server-postgres:latest

# Render automatically injects $PORT (default ~10000)
EXPOSE 8000

# Simple internal healthcheck to keep Render happy
HEALTHCHECK --interval=20s --timeout=5s --start-period=5s CMD wget -qO- http://localhost:${PORT:-8000}/mcp || exit 1

# Run MCP directly and keep metrics ON (so /metrics responds 200)
CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port ${PORT:-8000} --log-level debug"]
