# 20210502 124_build_psql

build a postgreSQL container #124

```sh
docker-compose up -d

docker exec -it appdb psql -U postgres -d postgres

SELECT VERSION();

docker-compose stop

docker-compose logs -f
```
