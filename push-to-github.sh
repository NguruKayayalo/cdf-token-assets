#!/bin/bash

# 🔧 CONFIGURATION (modifie ces variables si nécessaire)
GITHUB_USER="NguruKayayalo"
REPO_NAME="cdf-token-assets"
REPO_DESC="Liste officielle des actifs du token CDF avec logo et métadonnées."
GITHUB_TOKEN="TON_TOKEN_ICI"  # Remplace par ton token PAT
ZIP_FILE="cdf-token-assets-git.zip"

# 📁 Extraction du zip
unzip -o "$ZIP_FILE"
cd cdf-token-assets || exit 1

# 🔃 Initialisation Git (si nécessaire)
git init
git remote remove origin 2>/dev/null
git remote add origin "https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${REPO_NAME}.git"

# 📤 Commit et push
git add .
git commit -m "Initial commit - CDF Token Assets"
git branch -M main

# 🆕 Créer le dépôt sur GitHub via API
curl -u "${GITHUB_USER}:${GITHUB_TOKEN}" https://api.github.com/user/repos -d "{\"name\":\"${REPO_NAME}\", \"description\":\"${REPO_DESC}\", \"private\":false}"

# 🔼 Push
git push -u origin main
