FROM acuvity/mcp-server-postgres:latest

# Don’t need socat at all
EXPOSE 10000

# Run postgres-mcp directly on Render's injected port
CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port ${PORT} --disable-metrics --log-level debug"]
