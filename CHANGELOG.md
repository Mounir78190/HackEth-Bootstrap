# Changelog

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

## [0.1.2] - 2026-07-18

### Corrigé

- Installation Docker séparée de Docker Compose.
- Fallback vers `docker-compose` si `docker-compose-plugin` n'est pas disponible sur Kali.
- Docker Compose rendu non bloquant si aucun paquet compatible n'est disponible.

## [0.1.1] - 2026-07-18

### Corrigé

- Ajout de `rustc` et `cargo` pour les dépendances Python nécessitant Rust.
- Installation NetExec via APT si le paquet est disponible.
- Fallback NetExec via `pipx` rendu non bloquant en cas d'échec.
- Documentation de reprise après échec NetExec.
- Documentation de reprise lorsque `git pull` est bloqué par des modifications locales.

## [0.1.0] - 2026-07-17

### Ajouté

- Création de la structure initiale HackEth-Bootstrap.
- Ajout du script `bootstrap.sh`.
- Ajout du mode `--dry-run`.
- Ajout des modules d'installation Bash.
- Ajout de la configuration d'alias.
- Ajout de la documentation d'installation.
- Ajout des notes de sécurité.
- Ajout de la roadmap.
- Ajout de la checklist de publication GitHub.
