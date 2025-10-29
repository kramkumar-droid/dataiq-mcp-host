# DataIQ MCP for Render
FROM acuvity/mcp-server-postgres:latest

# Install socat for TCP forwarding
USER root
RUN apk add --no-cache socat

# Environment variables
ENV PORT=10000
ENV DISABLE_METRICS=true
EXPOSE 10000

# Start MCP and forward port 10000 → 8000
CMD ["sh", "-c", "socat TCP-LISTEN:${PORT},fork,reuseaddr TCP:127.0.0.1:8000 & exec /app/.venv/bin/postgres-mcp --port 8000 --disable-metrics --log-level debug"]
