#!/bin/bash
rm -rf codeql/results/source_db

docker-compose -f codeql/docker-compose-create-db.yml up --remove-orphans --build
docker-compose -f codeql/docker-compose-analyze.yml up --remove-orphans --build
