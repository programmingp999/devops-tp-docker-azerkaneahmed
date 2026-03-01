# TP DevSecOps avec Docker

![Build and Scan](https://github.com/programmingp999/devops-tp-docker-azerkaneahmed/actions/workflows/docker-deploy.yml/badge.svg)
![CodeQL](https://github.com/programmingp999/devops-tp-docker-azerkaneahmed/actions/workflows/codeql-analysis.yml/badge.svg)

## Pipeline DevSecOps

Ce projet implémente un pipeline CI/CD sécurisé pour Docker avec :

- Analyse statique du code (CodeQL)
- Lint du Dockerfile (Hadolint)
- Scan de l'image Docker (Trivy)
- Scan des dépendances (Dependabot)
- Secret Scanning
- Security Gates (blocage sur vulnérabilités critiques)
- SBOM (Software Bill of Materials)

## Architecture de Sécurité