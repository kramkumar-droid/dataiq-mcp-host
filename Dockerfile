FROM acuvity/mcp-server-postgres:latest

# The base image configures minibridge to listen on port 8000
# We just need to make sure it stays on 8000
ENV PORT=8000

EXPOSE 8000

HEALTHCHECK --interval=20s --timeout=5s --start-period=15s \
  CMD wget -qO- http://localhost:8000/ || exit 1

CMD ["sh", "-c", "exec /app/.venv/bin/postgres-mcp --port 8000 --log-level debug"]
