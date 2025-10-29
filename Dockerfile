# dataiq-mcp-host/Dockerfile
FROM acuvity/mcp-server-postgres:latest

# Render expects your app to listen on $PORT (default 10000)
ENV PORT=10000

# Install socat (for TCP forwarding)
RUN apk add --no-cache socat

# Expose the port Render will check
EXPOSE 10000

# Start socat to forward $PORT -> internal MCP (8000)
ENTRYPOINT ["/bin/sh", "-lc", "socat TCP-LISTEN:${PORT},fork,reuseaddr TCP:127.0.0.1:8000 & exec /entrypoint.sh"]
