#!/usr/bin/env bash
set -euo pipefail

log() {
  printf '[HackEth] %s\n' "$*"
}

run() {
  if [[ "${HACKETH_DRY_RUN:-0}" == "1" ]]; then
    printf '[dry-run] %s\n' "$*"
  else
    "$@"
  fi
}

run_shell() {
  if [[ "${HACKETH_DRY_RUN:-0}" == "1" ]]; then
    printf '[dry-run] %s\n' "$*"
  else
    bash -lc "$*"
  fi
}

require_root_or_dry_run() {
  if [[ "${HACKETH_DRY_RUN:-0}" == "1" ]]; then
    return 0
  fi

  if [[ "${EUID}" -ne 0 ]]; then
    echo "Ce script doit être lancé avec sudo, ou en mode --dry-run." >&2
    exit 1
  fi
}

require_kali_or_warn() {
  if [[ -r /etc/os-release ]]; then
    # shellcheck disable=SC1091
    source /etc/os-release
    if [[ "${ID:-}" != "kali" ]]; then
      log "Attention : système détecté '${ID:-inconnu}', Kali Linux attendu."
    fi
  else
    log "Impossible de vérifier le système : /etc/os-release introuvable."
  fi
}

run_module() {
  local module="$1"
  local path="${HACKETH_ROOT}/scripts/${module}"

  if [[ ! -f "$path" ]]; then
    echo "Module introuvable : $path" >&2
    exit 1
  fi

  log "Module : $module"
  # shellcheck source=/dev/null
  source "$path"
}

apt_install() {
  run apt-get install -y "$@"
}
