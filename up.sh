#!/bin/bash
source .env
# Bring up the environment
docker compose up -d

echo "Wait for Splunk availability"

until [ $(docker inspect --format='{{.State.Health.Status}}' so1) = healthy ]
do
  echo -n '.'
  sleep 10
done