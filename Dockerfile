FROM node:20-bookworm-slim

# Create app directory
WORKDIR /usr/src/app

# Install dependencies deterministically using the lockfile.
# Copy package files first to leverage Docker layer caching.
COPY package.json package-lock.json ./

# Install production dependencies only
RUN npm ci --only=production --no-audit --no-fund

# Copy application source
COPY --chown=node:node . .

# Use a non-root user provided by the Node image
USER node

# Ensure environment is production by default
ENV NODE_ENV=production
ENV PORT=3000

# Expose the application's port and run the server bound to 0.0.0.0 (server.js already respects PORT)
EXPOSE 3000

CMD ["node", "server.js"]
