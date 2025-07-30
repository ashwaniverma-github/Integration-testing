docker-compose up -d
echo 'waiting for database to be ready..'
./scripts/wait-for-it.sh "postgresql://user:password@localhost:5432/mydb" --
echo 'database is ready'
npx prisma migrate dev --name init 
npm run test 
docker-compose logs db
docker-compose down