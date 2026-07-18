# HackEth-Bootstrap

[![Kali Linux](https://img.shields.io/badge/Kali-Linux-blue)](https://www.kali.org/)
[![Bash](https://img.shields.io/badge/Bash-Automation-green)](#)
[![HackEth](https://img.shields.io/badge/HackEth-Bootstrap-blue)](https://github.com/Mounir78190/HackEth)
[![Statut](https://img.shields.io/badge/statut-en%20construction-yellow)](#)
[![Version](https://img.shields.io/badge/version-0.1.3-blue)](VERSION)
[![Licence](https://img.shields.io/badge/licence-MIT-green)](LICENSE)

HackEth-Bootstrap automatise la préparation d'un poste Kali Linux destiné au projet HackEth.

L'objectif est de pouvoir reconstruire un environnement HackEth cohérent, documenté et réutilisable, que ce soit sur une machine physique ou en machine virtuelle.

## Objectifs

- Installer les outils principaux du poste HackEth.
- Préparer une configuration de base reproductible.
- Séparer les étapes en modules simples à relire.
- Garder une approche prudente avec un mode `--dry-run`.
- Servir de complément à la Golden Image Clonezilla.

## Positionnement

```text
HomeLab
|
`-- HackEth
    |
    |-- HackEth-Golden-Image
    |   `-- Restauration rapide depuis image validée
    |
    `-- HackEth-Bootstrap
        `-- Reconstruction automatisée depuis Kali propre
```

## Outils prévus

- Nmap
- Burp Suite
- Gobuster
- FFUF
- Hydra
- NetExec
- BloodHound
- Docker
- Visual Studio Code
- Python
- Git
- ZSH
- Wordlists
- Scripts et alias personnalisés

## Utilisation

Depuis une Kali Linux fraîche :

```bash
git clone https://github.com/Mounir78190/HackEth-Bootstrap
cd HackEth-Bootstrap
chmod +x bootstrap.sh scripts/*.sh
./bootstrap.sh --dry-run
sudo ./bootstrap.sh
```

Si le dossier existe déjà :

```bash
cd HackEth-Bootstrap
git pull
chmod +x bootstrap.sh scripts/*.sh
./bootstrap.sh --dry-run
```

## Structure

```text
HackEth-Bootstrap/
|-- bootstrap.sh
|-- VERSION
|-- CHANGELOG.md
|-- LICENSE
|-- .gitignore
|
|-- scripts/
|   |-- common.sh
|   |-- install-base.sh
|   |-- install-security-tools.sh
|   |-- install-docker.sh
|   |-- install-vscode.sh
|   |-- configure-shell.sh
|   `-- install-wordlists.sh
|
|-- configs/
|   |-- aliases.sh
|   `-- zshrc.example
|
`-- docs/
    |-- installation.md
    |-- tools.md
    |-- security.md
    |-- roadmap.md
    `-- publishing.md
```

## Documentation

- [Installation](docs/installation.md)
- [Outils](docs/tools.md)
- [Sécurité](docs/security.md)
- [Roadmap](docs/roadmap.md)
- [Publication GitHub](docs/publishing.md)

## Version

Version actuelle : `0.1.3`

- [Changelog](CHANGELOG.md)
- [Licence](LICENSE)

## Avertissement

Ce projet installe des outils cybersécurité. Ils doivent uniquement être utilisés dans un environnement autorisé, comme le HomeLab, ou sur des systèmes explicitement autorisés.
