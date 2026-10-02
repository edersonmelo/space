#!/usr/bin/env bash
# PreToolUse (Bash): bloqueia comandos perigosos antes de rodarem.
# Saída 2 = bloqueia e devolve o motivo ao agente.
set -euo pipefail

cmd=$(python3 -c 'import json,sys; print(json.load(sys.stdin).get("tool_input",{}).get("command",""))')

block() { echo "Bloqueado pelos guardrails do Space: $1" >&2; exit 2; }

case "$cmd" in
  *"rm -rf /"*|*"rm -rf ~"*|*'rm -rf $HOME'*) block "rm -rf fora do Space" ;;
  *"curl "*"| sh"*|*"curl "*"| bash"*|*"wget "*"| sh"*) block "executar script baixado da internet" ;;
  *"push --force"*|*"push -f "*|*"push -f") block "push forçado" ;;
  *"security find-"*|*"security dump-keychain"*) block "acesso ao Keychain" ;;
esac

# Caminhos proibidos desta máquina (um por linha, # comenta). Arquivo local, fora do git.
lista="$(dirname "$0")/../caminhos-bloqueados.local"
if [[ -f "$lista" ]]; then
  while IFS= read -r caminho; do
    [[ -z "$caminho" || "$caminho" == \#* ]] && continue
    [[ "$cmd" == *"$caminho"* ]] && block "caminho fora do Space ($caminho)"
  done < "$lista"
fi
exit 0
