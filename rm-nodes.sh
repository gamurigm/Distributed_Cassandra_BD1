#!/bin/zsh
# Uso: ./remove_cassandra_nodes.sh 3

N=${1:-1}
for i in $(seq 1 $N); do
  docker stop cassandra-$i 2>/dev/null
  docker rm cassandra-$i 2>/dev/null
  docker volume rm cassandra${i}_data 2>/dev/null
done