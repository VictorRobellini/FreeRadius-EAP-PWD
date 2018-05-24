#!/bin/sh
docker stop freeradius-container
docker rm freeradius-container
docker build -t freeradius-server .
docker run -dit -p 1812-1813:1812-1813/udp --name  freeradius-container freeradius-server -X
