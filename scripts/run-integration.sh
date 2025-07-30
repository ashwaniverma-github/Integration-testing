#!/usr/bin/env bash
set -euo pipefail

# 1) Start your stack using the Compose v2 plugin
docker compose up -d

# 2) Wait for Postgres on localhost:5432 (not a URL)
echo 'Waiting for database to be ready…'
bash ./scripts/wait-for-it.sh localhost:5432 --timeout=30 --strict -- echo 'Database is up!'

# 3) Run your Prisma migrations
echo 'Running Prisma migrations…'
npx prisma migrate dev --name init

# 4) Run your tests
echo 'Running tests…'
npm run test

# 5) Dump database logs (optional)
echo 'Showing DB logs…'
docker compose logs db

# 6) Tear everything down
echo 'Shutting down services…'
docker compose down
