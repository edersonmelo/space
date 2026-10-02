#!/usr/bin/env bash
# Libera saída só para os domínios abaixo; o resto é bloqueado.
set -euo pipefail
PERMITIDOS=(api.anthropic.com github.com api.github.com codeload.github.com registry.npmjs.org pypi.org files.pythonhosted.org crates.io static.crates.io index.crates.io)

iptables -F OUTPUT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
for d in "${PERMITIDOS[@]}"; do
  for ip in $(dig +short A "$d" | grep -E '^[0-9.]+$'); do
    iptables -A OUTPUT -d "$ip" -j ACCEPT
  done
done
iptables -P OUTPUT DROP
echo "Firewall ativo: ${#PERMITIDOS[@]} domínios liberados."
