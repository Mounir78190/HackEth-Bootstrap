#!/usr/bin/env bash
set -euo pipefail

log "Installation des outils cybersécurité principaux"

apt_install \
  nmap \
  hydra \
  gobuster \
  ffuf \
  wireshark \
  metasploit-framework \
  bloodhound \
  neo4j \
  seclists \
  wordlists

if command -v pipx >/dev/null 2>&1 || [[ "${HACKETH_DRY_RUN:-0}" == "1" ]]; then
  log "Installation NetExec via pipx"
  run pipx install git+https://github.com/Pennyw0rth/NetExec
else
  log "pipx indisponible : NetExec non installé."
fi
