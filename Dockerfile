# Utiliser une version spécifique (pas latest)
FROM nginx:1.25.3-alpine

# Métadonnées
LABEL maintainer="TP DevOps"
LABEL org.opencontainers.image.source="https://github.com/programmingp999/devops-tp-docker-azerkaneahmed"

# Créer un utilisateur non-root pour la sécurité
RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

# Installation des certificats nécessaires
RUN apk add --no-cache ca-certificates && rm -rf /var/cache/apk/*

# Copier les fichiers avec les bonnes permissions pour l'utilisateur appuser
COPY --chown=appuser:appgroup nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --chown=appuser:appgroup src/ /usr/share/nginx/html/

# Préparer les dossiers système pour Nginx (Nginx doit pouvoir écrire son PID)
RUN touch /var/run/nginx.pid && \
    chown -R appuser:appgroup /var/run/nginx.pid && \
    chown -R appuser:appgroup /var/cache/nginx

# Passer à l'utilisateur non-root
USER appuser

# Exposer le port (on utilise 8080 car un utilisateur non-root ne peut pas utiliser le port 80)
EXPOSE 8080

# Health check pour vérifier que le service répond sur le port 8080
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

CMD ["nginx", "-g", "daemon off;"]