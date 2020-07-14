#!/bin/sh

lircd --nodaemon &

sleep 1
exec "$@"
