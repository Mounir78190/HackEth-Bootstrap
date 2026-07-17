#!/usr/bin/env bash
set -euo pipefail

log "Installation de Visual Studio Code"

if command -v code >/dev/null 2>&1; then
  log "VS Code est déjà installé."
  return 0
fi

run_shell 'wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg'
run install -o root -g root -m 644 /tmp/packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
run_shell 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
run apt-get update
apt_install code
