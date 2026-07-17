#!/usr/bin/env bash
set -euo pipefail

log "Installation Docker depuis les dépôts Kali/Debian"

apt_install docker.io docker-compose-plugin

run systemctl enable docker
run systemctl start docker

if [[ -n "${SUDO_USER:-}" ]]; then
  log "Ajout de ${SUDO_USER} au groupe docker"
  run usermod -aG docker "${SUDO_USER}"
fi
