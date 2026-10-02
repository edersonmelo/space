#!/usr/bin/env bash
# Confere as ferramentas que o Space usa.
cd "$(dirname "$0")/.."
check() { command -v "$1" >/dev/null && echo "✓ $1" || echo "✗ $1 — $2"; }
echo "Essenciais"
check git "https://git-scm.com"
check python3 "necessário para o hook de guardrails"
check claude "npm i -g @anthropic-ai/claude-code"
echo "Opcionais (conforme os projetos)"
check gh "brew install gh"
check docker "Docker/OrbStack: devcontainer para projetos que não são Apple"
check xcodebuild "Xcode: projetos iOS/macOS"
check xcodegen "brew install xcodegen: projetos com project.yml"
[[ -x guardrails/hooks/bloquear-comandos.sh ]] && echo "✓ hook de guardrails executável" || echo "✗ rode tools/init.sh"
[[ -f guardrails/caminhos-bloqueados.local ]] || echo "• sem guardrails/caminhos-bloqueados.local (rode tools/init.sh)"
echo
echo "Projetos em repositorios/: $(find repositorios -mindepth 1 -maxdepth 1 -type d | wc -l | xargs)"
