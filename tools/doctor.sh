#!/usr/bin/env bash
# Confere as ferramentas que o Space usa.
cd "$(dirname "$0")/.."
check() { command -v "$1" >/dev/null && echo "✓ $1" || echo "✗ $1 — $2"; }
check git ""
check claude "npm i -g @anthropic-ai/claude-code"
check gh "brew install gh (opcional)"
check xcodebuild "instale o Xcode (projetos Apple)"
check xcodegen "brew install xcodegen"
check docker "Docker/OrbStack (devcontainer para projetos não-Apple)"
check python3 "necessário para o hook de guardrails"
[[ -x guardrails/hooks/bloquear-comandos.sh ]] && echo "✓ hook de guardrails executável" || echo "✗ chmod +x guardrails/hooks/bloquear-comandos.sh"
echo; echo "Repositórios no manifesto: $(grep -vcE "^(#|\s*$)" repositorios/repos.tsv 2>/dev/null || echo 0)"
echo "Clonados: $(ls -d repositorios/*/*/.git 2>/dev/null | wc -l | xargs)"
