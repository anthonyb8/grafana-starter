#!/bin/bash

# Copy the key to a writable location and fix ownership
cp /certs/server.key /tmp/server.key
chown $(id -u):$(id -g) /tmp/server.key
# chmod 644 /tmp/server.key

# exec '$@'
