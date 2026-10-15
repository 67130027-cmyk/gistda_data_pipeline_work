#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."

# wait for Docker daemon
until docker info >/dev/null 2>&1; do sleep 1; done

docker compose down

# start postgres first so the network exists before applying the fix
docker compose up -d postgres

# fix: let containers on the same network talk without passing through the firewall
sudo sysctl -w net.bridge.bridge-nf-call-iptables=0 || true
sudo iptables-legacy -P FORWARD ACCEPT 2>/dev/null || true

docker compose up -d
