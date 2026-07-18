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

Si le dépôt existe déjà localement :

```bash
cd ~/HackEth-Bootstrap
git pull
chmod +x bootstrap.sh scripts/*.sh
./bootstrap.sh --dry-run
```

## Installation réelle

```bash
sudo ./bootstrap.sh
```

Si une exécution précédente s'est arrêtée pendant l'installation de NetExec, mettre à jour le dépôt puis relancer :

```bash
cd ~/HackEth-Bootstrap
git pull
chmod +x bootstrap.sh scripts/*.sh
sudo ./bootstrap.sh
```

Si `git pull` refuse la mise à jour à cause de modifications locales :

```bash
cd ~/HackEth-Bootstrap
git status --short
git stash push -m "sauvegarde locale avant mise à jour bootstrap" -- scripts/install-base.sh scripts/install-security-tools.sh
git pull
chmod +x bootstrap.sh scripts/*.sh
sudo ./bootstrap.sh
```

Cette méthode conserve les modifications locales dans un stash Git au lieu de les supprimer.

## Après installation

- Redémarrer la session si Docker a été installé.
- Vérifier les outils principaux.
- Vérifier les alias.
- Vérifier l'accès au VLAN `HACKETH` si le poste est dans le HomeLab.

## Vérifications utiles

```bash
nmap --version
hydra -h
gobuster help
ffuf -V
docker --version
python3 --version
git --version
zsh --version
```

## Validation réalisée

Le mode `--dry-run` a été validé sur le poste Kali physique HackEth.

Résultat observé :

- modules chargés correctement ;
- commandes APT affichées sans exécution ;
- installation Docker simulée ;
- installation VS Code simulée ;
- préparation des wordlists simulée ;
- configuration shell simulée pour l'utilisateur `mounir`.

## Note NetExec

NetExec peut être installé via APT si le paquet est disponible dans Kali.

Si le paquet APT n'est pas disponible, le script tente une installation via `pipx`. Certaines dépendances Python peuvent nécessiter Rust, notamment `aardwolf`. Pour cette raison, `rustc` et `cargo` font partie des paquets de base installés par le bootstrap.

Un échec d'installation de NetExec via `pipx` ne bloque plus l'ensemble du bootstrap.

## Note Docker Compose

Selon l'état des dépôts Kali, `docker-compose-plugin` peut être indisponible.

Le script installe d'abord `docker.io`, puis tente :

- `docker-compose-plugin` si disponible ;
- `docker-compose` en fallback ;
- sinon le bootstrap continue avec Docker Engine seul.
