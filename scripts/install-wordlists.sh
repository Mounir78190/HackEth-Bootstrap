#!/usr/bin/env bash
set -euo pipefail

log "Préparation des wordlists"

if [[ -f /usr/share/wordlists/rockyou.txt.gz ]]; then
  run gzip -dk /usr/share/wordlists/rockyou.txt.gz
fi

if [[ -d /usr/share/seclists ]]; then
  log "SecLists est disponible dans /usr/share/seclists"
fi
