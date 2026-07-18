# Test en machine virtuelle

Ce document décrit le plan de test de HackEth-Bootstrap dans une VM Kali Linux.

Le test VM permet de valider que le bootstrap fonctionne sur une installation Kali propre, sans dépendre de la machine physique HackEth ni de la Golden Image Clonezilla.

## Objectifs

- Valider HackEth-Bootstrap sur Kali en machine virtuelle.
- Vérifier le mode `--dry-run` sur une installation propre.
- Vérifier l'installation réelle avec `sudo ./bootstrap.sh`.
- Identifier les différences entre Kali physique et Kali VM.
- Préparer une base reproductible pour les tests futurs.

## Hyperviseur

Hyperviseur prévu : VMware Workstation.

Chemin observé sous Windows :

```text
C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe
```

## Configuration VM recommandée

- Système invité : Kali Linux.
- CPU : 2 vCPU minimum.
- RAM : 4 Go minimum, 8 Go recommandé.
- Disque : 40 Go minimum, 80 Go recommandé.
- Réseau : NAT pour un premier test simple.
- Firmware : BIOS ou UEFI selon ISO utilisée.
- Snapshot : créer un snapshot avant exécution réelle du bootstrap.

## ISO recommandée

- Kali Linux Installer ISO.
- Kali Linux Live ISO si le test ne nécessite pas d'installation persistante.

## Procédure de test

### 1. Préparer la VM

- Créer une nouvelle VM Kali.
- Installer Kali ou démarrer en live selon le scénario.
- Vérifier l'accès Internet.
- Mettre à jour les paquets si nécessaire.
- Créer un snapshot avant bootstrap.

### 2. Cloner le dépôt

```bash
git clone https://github.com/Mounir78190/HackEth-Bootstrap
cd HackEth-Bootstrap
chmod +x bootstrap.sh scripts/*.sh
```

### 3. Tester le mode dry-run

```bash
./bootstrap.sh --dry-run
```

Résultat attendu :

- tous les modules se chargent ;
- aucune commande système n'est exécutée ;
- les commandes prévues sont affichées ;
- le script se termine sans erreur.

### 4. Exécuter l'installation réelle

```bash
sudo ./bootstrap.sh
```

Résultat attendu :

- paquets de base installés ;
- outils cybersécurité installés ;
- NetExec installé via APT si disponible ;
- Docker Engine installé ;
- Docker Compose non bloquant si indisponible ;
- VS Code installé ou ignoré si déjà présent ;
- wordlists préparées sans question interactive ;
- configuration shell copiée.

### 5. Vérifier les outils

```bash
nmap --version
hydra -h
gobuster help
ffuf -V
netexec --version
docker --version
python3 --version
git --version
zsh --version
```

## Critères de validation

Le test VM sera considéré comme validé si :

- le mode `--dry-run` se termine correctement ;
- l'installation réelle se termine correctement ;
- les outils principaux sont disponibles ;
- Docker répond correctement ;
- aucune étape interactive ne bloque le script ;
- les différences avec le poste physique sont documentées.

## Statut actuel

Statut : validé sur Kali VM.

Validation déjà réalisée :

- Kali physique : dry-run validé.
- Kali physique : installation réelle validée.
- Kali VM : dry-run validé.
- Kali VM : installation réelle validée.
- Kali VM : vérification post-installation validée.

Note :

- Docker est actif et fonctionnel.
- L'appartenance au groupe `docker` peut nécessiter une reconnexion ou un redémarrage de session pour être visible dans `groups`.

## Résultat VM observé

Outils validés :

- Nmap `7.99`.
- Hydra `9.7`.
- Gobuster `3.8.2`.
- ffuf `2.1.0-dev`.
- NetExec `1.5.1`.
- Docker `28.5.2+dfsg4`.
- Python `3.13.9`.
- Git `2.53.0`.
- ZSH `5.9`.

Docker :

- service `docker.service` activé ;
- service `docker.service` actif et en cours d'exécution.
