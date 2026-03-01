FROM nginx:alpine

# Métadonnées
LABEL maintainer="TP DevOps"
LABEL description="Application DevOps optimisée"

# On copie la configuration et les fichiers
# Astuce : On essaie de limiter le nombre de couches
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY src/ /usr/share/nginx/html/

# Supprimer les fichiers inutiles pour alléger l'image finale
RUN rm -rf /usr/share/nginx/html/*.md

EXPOSE 80

# Health check optimisé (vérifie si le serveur répond bien)
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -q --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]