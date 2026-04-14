FROM mongodb/mongodb-community-server:8.0-ubi8-slim

COPY ./docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/

USER mongod