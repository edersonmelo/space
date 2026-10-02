#!/usr/bin/env bash
# Clona os projetos de repositorios/repos.tsv que ainda não existem e faz fetch dos que já existem.
# Projetos copiados à mão para repositorios/ não precisam estar no repos.tsv.
# Uso: tools/sync-repos.sh [nome]
set -euo pipefail
cd "$(dirname "$0")/.."
filtro="${1:-}"

if [[ ! -f repositorios/repos.tsv ]]; then
  echo "Sem repositorios/repos.tsv. Use tools/add-repo.sh ou copie repositorios/repos.example.tsv."; exit 1
fi

grep -vE '^(#|[[:space:]]*$)' repositorios/repos.tsv | while IFS=$'\t' read -r nome url branch; do
  if [[ -n "$filtro" && "$nome" != "$filtro" ]]; then continue; fi
  destino="repositorios/$nome"
  if [[ -d "$destino/.git" ]]; then
    echo "↻ $destino"
    git -C "$destino" fetch --quiet --prune
  elif [[ -e "$destino" ]]; then
    echo "! $destino já existe e não é um repo git; pulei"
  else
    echo "↓ $destino"
    git clone --quiet --branch "$branch" "$url" "$destino"
  fi
done
