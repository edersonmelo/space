#!/usr/bin/env bash
# Adiciona um projeto ao Space: registra em repositorios/repos.tsv, clona e reindexa.
# Uso: tools/add-repo.sh <grupo> <url-git> [nome] [branch]
set -euo pipefail
cd "$(dirname "$0")/.."
[[ $# -lt 2 ]] && { echo "Uso: $0 <grupo> <url-git> [nome] [branch]"; exit 1; }
grupo=$1 url=$2
nome=${3:-$(basename "$url" .git)}
branch=${4:-$(git ls-remote --symref "$url" HEAD | sed -n 's|^ref: refs/heads/\(.*\)\tHEAD|\1|p')}
[[ -z "$branch" ]] && { echo "Não consegui ler a branch principal de $url; passe como 4º argumento."; exit 1; }

touch repositorios/repos.tsv
if grep -q "^$grupo	$nome	" repositorios/repos.tsv; then
  echo "$grupo/$nome já está em repos.tsv"
else
  printf '%s\t%s\t%s\t%s\n' "$grupo" "$nome" "$url" "$branch" >> repositorios/repos.tsv
  echo "+ $grupo/$nome ($branch)"
fi
tools/sync-repos.sh "$grupo"
tools/index-repos.sh
