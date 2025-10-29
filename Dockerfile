# dataiq-mcp-host/Dockerfile
FROM acuvity/mcp-server-postgres:latest

# Render expects a public listener
ENV PORT=10000

# Switch to root temporarily for install
USER root
RUN apk add --no-cache socat
USER app

# Expose Render's expected port
EXPOSE 10000

# Start socat to forward external $PORT → internal MCP port :8000
# and then run the MCP server itself (non-blocking)
CMD ["sh", "-c", "socat TCP-LISTEN:${PORT},fork,reuseaddr TCP:127.0.0.1:8000 & exec /app/.venv/bin/postgres-mcp --port 8000 --disable-metrics"]
