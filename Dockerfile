# dataiq-mcp-host/Dockerfile
FROM acuvity/mcp-server-postgres:latest

# Make the app honor $PORT. If PORT isn’t set, default to 10000.
ENV PORT=10000

# Optional: silence the metrics listener noise
ENV DISABLE_METRICS=true

# Expose the same port Render will hit
EXPOSE 10000

# IMPORTANT: pass the port through to the MCP server so the Minibridge frontend binds to $PORT
CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port ${PORT:-8000} --disable-metrics"]
