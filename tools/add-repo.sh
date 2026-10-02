#!/usr/bin/env bash
# Clona um projeto para repositorios/<nome>, registra em repositorios/repos.tsv e reindexa.
# Aceita URL remota ou caminho de um repo git local (o clone leva só o código, sem artefatos de build).
# Uso: tools/add-repo.sh <url-ou-caminho-git> [nome] [branch]
set -euo pipefail
cd "$(dirname "$0")/.."
[[ $# -lt 1 ]] && { echo "Uso: $0 <url-ou-caminho-git> [nome] [branch]"; exit 1; }
url=$1
nome=${2:-$(basename "${url%/}" .git)}
branch=${3:-$(git ls-remote --symref "$url" HEAD 2>/dev/null | sed -n 's|^ref: refs/heads/\(.*\)\tHEAD|\1|p')}
[[ -z "$branch" ]] && { echo "Não consegui ler a branch principal de $url; passe como 3º argumento."; exit 1; }

touch repositorios/repos.tsv
if grep -q "^$nome	" repositorios/repos.tsv; then
  echo "$nome já está em repos.tsv"
else
  printf '%s\t%s\t%s\n' "$nome" "$url" "$branch" >> repositorios/repos.tsv
  echo "+ $nome ($branch)"
fi
tools/sync-repos.sh "$nome"
tools/index-repos.sh
