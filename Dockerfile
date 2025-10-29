# dataiq-mcp-host/Dockerfile
FROM acuvity/mcp-server-postgres:latest

# Render expects your app to listen on $PORT (we'll set it to 10000 in Render)
ENV PORT=10000

# Install a tiny TCP proxy
RUN apt-get update && apt-get install -y --no-install-recommends socat && rm -rf /var/lib/apt/lists/*

# Expose the public port Render will scan
EXPOSE 10000

# Start a listener on $PORT that forwards to the MCP frontend on :8000,
# then launch the base image entrypoint which starts postgres-mcp (on 8000)
ENTRYPOINT ["/bin/sh","-lc","socat TCP-LISTEN:${PORT},fork,reuseaddr TCP:127.0.0.1:8000 & exec /entrypoint.sh"]
