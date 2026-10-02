# Guardrails

Três camadas, da mais leve para a mais forte:

| Camada | Onde | O que faz |
|---|---|---|
| Permissões | `.claude/settings.json` | allow / ask / deny por ferramenta. Segredos e push forçado ficam em `deny`; commit, push e sync pedem confirmação. |
| Hook | `guardrails/hooks/bloquear-comandos.sh` | Roda antes de todo comando Bash e bloqueia padrões perigosos (rm -rf fora, curl\|sh, push -f, Keychain) e os caminhos listados em `guardrails/caminhos-bloqueados.local`. |
| Isolamento | `.devcontainer/` (Linux) ou sandbox do Claude Code (macOS) | Limita sistema de arquivos e rede. |

## Qual isolamento usar
- **Web, APIs, Rust, Python, legado**: abra o Space no devcontainer (`.devcontainer/`). O agente só enxerga `/space` e a rede é restrita pelo firewall do container.
- **iOS / macOS**: Xcode e Simulador só rodam no macOS, então container não serve. Use o sandbox nativo do Claude Code (`/sandbox` dentro da sessão) e deixe `xcodebuild` e `xcrun simctl` fora do sandbox, porque eles precisam do serviço do Simulador. Em todos os builds, passe `-derivedDataPath build` para os artefatos ficarem dentro do projeto.

## Testar o hook
```bash
echo '{"tool_input":{"command":"git push -f origin main"}}' | guardrails/hooks/bloquear-comandos.sh; echo "saída=$?"
```
