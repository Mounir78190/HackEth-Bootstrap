#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=0

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    -h|--help)
      echo "Usage: ./bootstrap.sh [--dry-run]"
      exit 0
      ;;
    *)
      echo "Argument inconnu : $arg" >&2
      exit 1
      ;;
  esac
done

export HACKETH_ROOT="$ROOT_DIR"
export HACKETH_DRY_RUN="$DRY_RUN"

# shellcheck source=scripts/common.sh
source "$ROOT_DIR/scripts/common.sh"

log "Démarrage du bootstrap HackEth"

if [[ "$DRY_RUN" == "1" ]]; then
  log "Mode dry-run activé : aucune commande système ne sera exécutée."
fi

require_kali_or_warn
require_root_or_dry_run

run_module "install-base.sh"
run_module "install-security-tools.sh"
run_module "install-docker.sh"
run_module "install-vscode.sh"
run_module "install-wordlists.sh"
run_module "configure-shell.sh"

log "Bootstrap HackEth terminé."
