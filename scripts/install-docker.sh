#!/usr/bin/env bash
set -euo pipefail

log "Installation Docker depuis les dépôts Kali/Debian"

apt_install docker.io

if apt_has_candidate docker-compose-plugin; then
  apt_install docker-compose-plugin
elif apt_has_candidate docker-compose; then
  log "docker-compose-plugin indisponible : installation de docker-compose"
  apt_install docker-compose
else
  log "Aucun paquet Docker Compose disponible. Le bootstrap continue avec Docker Engine seul."
fi

run systemctl enable docker
run systemctl start docker

if [[ -n "${SUDO_USER:-}" ]]; then
  log "Ajout de ${SUDO_USER} au groupe docker"
  run usermod -aG docker "${SUDO_USER}"
fi
