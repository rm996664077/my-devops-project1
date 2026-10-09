# 1. Utiliser une image de base Python officielle et légère
FROM python:3.13-slim

# 2. Définir le dossier de travail à l'intérieur du container
WORKDIR /app

# 3. Copier d'abord le fichier de dépendances pour optimiser le cache Docker
COPY requirements.txt .

# 4. Installer les dépendances sans garder les fichiers temporaires
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copier le reste du code de notre application dans le container
COPY . .

# 6. Exposer le port 5000 pour indiquer quel port est utilisé
EXPOSE 5000

# 7. Commande exécutée automatiquement au démarrage du container
CMD ["python", "app/app.py"]