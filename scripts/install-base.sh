#!/usr/bin/env bash
set -euo pipefail

log "Mise à jour APT et installation des paquets de base"

run apt-get update
apt_install \
  ca-certificates \
  curl \
  wget \
  git \
  gnupg \
  lsb-release \
  apt-transport-https \
  unzip \
  tar \
  build-essential \
  python3 \
  python3-pip \
  python3-venv \
  pipx \
  rustc \
  cargo \
  zsh \
  vim \
  tmux \
  jq \
  net-tools \
  dnsutils
