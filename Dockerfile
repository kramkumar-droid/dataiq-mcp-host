# dataiq-mcp-host/Dockerfile
FROM acuvity/mcp-server-postgres:latest

# Render expects your app to listen on $PORT (default 10000)
ENV PORT=10000

# Temporarily switch to root to install socat
USER root

# Install socat (for TCP forwarding)
RUN apk add --no-cache socat

# Drop back to the original non-root user (important for security)
USER app

# Expose the public port Render expects
EXPOSE 10000

# Forward Render’s $PORT → internal MCP (8000)
ENTRYPOINT ["/bin/sh", "-lc", "socat TCP-LISTEN:${PORT},fork,reuseaddr TCP:127.0.0.1:8000 & exec /entrypoint.sh"]
