#!/bin/bash

docker compose -f grafana/compose.yml up --build -d

docker compose -f oss/compose.yml -p oss1 up --build -d
docker compose -f oss/compose.yml -p oss2 up --build -d
