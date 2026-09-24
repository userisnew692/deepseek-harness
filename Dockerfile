FROM node:22-slim
RUN corepack enable && corepack prepare pnpm@11.7.0 --activate
WORKDIR /app
COPY . .
RUN pnpm install --frozen-lockfile
RUN pnpm run build
EXPOSE 3080
ENV HOST=0.0.0.0
CMD ["sh", "-c", "pnpm run dsh web --host 0.0.0.0 --port ${PORT:-3080} --no-open"]
