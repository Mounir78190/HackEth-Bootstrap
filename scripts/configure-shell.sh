#!/usr/bin/env bash
set -euo pipefail

TARGET_USER="${SUDO_USER:-${USER:-$(id -un 2>/dev/null || echo user)}}"

if command -v getent >/dev/null 2>&1; then
  TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6)"
else
  TARGET_HOME="${HOME}"
fi

log "Configuration shell pour ${TARGET_USER}"

if [[ -d "$TARGET_HOME" ]]; then
  run cp "${HACKETH_ROOT}/configs/aliases.sh" "$TARGET_HOME/.hacketh_aliases"
  run cp "${HACKETH_ROOT}/configs/zshrc.example" "$TARGET_HOME/.zshrc.hacketh.example"
  run chown "$TARGET_USER:$TARGET_USER" "$TARGET_HOME/.hacketh_aliases" "$TARGET_HOME/.zshrc.hacketh.example"
fi

if command -v zsh >/dev/null 2>&1 && [[ "${HACKETH_DRY_RUN:-0}" != "1" ]]; then
  log "ZSH disponible. Changement de shell non automatique pour éviter toute modification non désirée."
fi
