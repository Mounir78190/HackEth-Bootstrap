# Installation

Ce document décrit l'installation de HackEth-Bootstrap sur Kali Linux.

## Prérequis

- Kali Linux à jour.
- Connexion Internet fonctionnelle.
- Droits `sudo`.
- Espace disque suffisant.

## Test sans modification

Avant d'exécuter l'installation réelle, lancer :

```bash
./bootstrap.sh --dry-run
```

## Installation réelle

```bash
sudo ./bootstrap.sh
```

## Après installation

- Redémarrer la session si Docker a été installé.
- Vérifier les outils principaux.
- Vérifier les alias.
- Vérifier l'accès au VLAN `HACKETH` si le poste est dans le HomeLab.

## Vérifications utiles

```bash
nmap --version
docker --version
python3 --version
git --version
zsh --version
```
