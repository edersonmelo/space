#!/usr/bin/env bash
# Clona os projetos de repositorios/repos.tsv que ainda não existem e faz fetch dos que já existem.
# Uso: tools/sync-repos.sh [grupo]
set -euo pipefail
cd "$(dirname "$0")/.."
filtro="${1:-}"

if [[ ! -f repositorios/repos.tsv ]]; then
  echo "Sem repositorios/repos.tsv. Use tools/add-repo.sh ou copie repositorios/repos.example.tsv."; exit 1
fi

grep -v '^#' repositorios/repos.tsv | grep -v '^[[:space:]]*$' | while IFS=$'\t' read -r grupo nome url branch; do
  [[ -n "$filtro" && "$grupo" != "$filtro" ]] && continue
  destino="repositorios/$grupo/$nome"
  if [[ -d "$destino/.git" ]]; then
    echo "↻ $destino"
    git -C "$destino" fetch --quiet --prune
  else
    echo "↓ $destino"
    mkdir -p "repositorios/$grupo"
    git clone --quiet --branch "$branch" "$url" "$destino"
  fi
done
