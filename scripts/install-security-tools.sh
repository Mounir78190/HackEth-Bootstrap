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

if apt-cache show netexec >/dev/null 2>&1; then
  log "Installation NetExec via APT"
  apt_install netexec
elif command -v pipx >/dev/null 2>&1 || [[ "${HACKETH_DRY_RUN:-0}" == "1" ]]; then
  log "Installation NetExec via pipx"
  if [[ "${HACKETH_DRY_RUN:-0}" == "1" ]]; then
    run pipx install git+https://github.com/Pennyw0rth/NetExec
  elif ! pipx install git+https://github.com/Pennyw0rth/NetExec; then
    log "NetExec n'a pas pu être installé via pipx. Le bootstrap continue."
    log "Vérifier rustc/cargo ou installer NetExec manuellement si nécessaire."
  fi
else
  log "pipx indisponible : NetExec non installé."
fi
