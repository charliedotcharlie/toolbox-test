#!/bin/bash

while true
do
  start_time=$(date +%s.%N)  # tiempo de inicio de la petición

  # realizar la petición GET a httpbin.org y guardar el resultado en una variable
  response=$(curl -s https://httpbin.org/get)

  # extraer el valor del campo "origin" del resultado de la petición
  origin=$(echo $response | jq -r '.origin')

  elapsed_time=$(echo "scale=3; $(date +%s.%N) - $start_time" | bc)  # tiempo total de respuesta

  # imprimir el tiempo total de respuesta y el valor del campo "origin"
  echo "Tiempo de respuesta: $elapsed_time segundos | Origen: $origin"

  sleep 1  # esperar 5 segundos antes de hacer otra petición
done