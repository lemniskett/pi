#!/usr/bin/env bash

images="nginx php-fpm"
registry="192.168.254.3:5000"

for i in $images; do
    docker build -t $registry/$i:latest $i
    docker push $registry/$i:latest
done
