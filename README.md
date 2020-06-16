# alpine-mongo-express
Lightweight mongo-express docker image on alpine

# docker-compose example with MongoDB
```
version: "3.7"

services:
  mongodb:
    container_name: mongodb
    image: skazuki/alpine-mongodb
    restart: always
  mongo-express:
    container_name: mongo-express
    image: skazuki/alpine-mongo-express
    restart: always
    environment:
      - ME_CONFIG_MONGODB_SERVER=mongodb
      - VCAP_APP_HOST=0.0.0.0
      - VCAP_APP_PORT=8081
    ports:
      - 8081:8081
    links:
      - mongodb:mongodb
```

## NodeJS
version: 12.18.0

## NPM
version: 6.14.5

## Yarn
version: 1.22.4

## mongo-express
version: 0.54.0
