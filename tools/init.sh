#!/usr/bin/env bash
# Prepara um Space recém-baixado: arquivos locais, permissões dos scripts, diagnóstico e índice.
set -euo pipefail
cd "$(dirname "$0")/.."

chmod +x tools/*.sh guardrails/hooks/*.sh .devcontainer/*.sh
mkdir -p repositorios agentes/docs/local

if [[ ! -f guardrails/caminhos-bloqueados.local ]]; then
  cp guardrails/caminhos-bloqueados.example guardrails/caminhos-bloqueados.local
  echo "+ guardrails/caminhos-bloqueados.local (edite com as pastas que o agente não pode tocar)"
fi

tools/doctor.sh
echo
tools/index-repos.sh
echo
echo "Pronto. Coloque seus projetos em repositorios/ (copiando a pasta ou com tools/add-repo.sh <url>) e rode: claude"
