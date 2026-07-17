# Sécurité

HackEth-Bootstrap installe des outils offensifs. L'utilisation doit rester limitée aux environnements autorisés.

## Règles

- Ne pas utiliser ces outils contre des systèmes tiers sans autorisation.
- Tester d'abord avec `--dry-run`.
- Relire les scripts avant exécution.
- Ne pas stocker de secrets dans ce dépôt.
- Ne pas ajouter de clés SSH, VPN ou tokens.

## Modifications système

Le bootstrap peut :

- installer des paquets APT ;
- ajouter Docker ;
- ajouter l'utilisateur courant au groupe Docker ;
- copier des fichiers d'alias dans le dossier utilisateur ;
- ajouter le dépôt Microsoft pour Visual Studio Code.

## Limites volontaires

- Le script ne change pas automatiquement le shell par défaut.
- Le script ne configure pas de clés SSH.
- Le script ne modifie pas les règles réseau.
- Le script ne stocke aucun secret.
