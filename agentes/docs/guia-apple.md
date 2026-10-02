# Projetos Apple (iOS / macOS) no Space

## Trazer um projeto existente

| Opção | Veredito | Por quê |
|---|---|---|
| **Clone novo** (`tools/add-repo.sh <url-ou-caminho>`) | ✅ use esta | Vem só o código, sem `build/`, `.build`, `target/` e DerivedData. A pasta antiga vira backup. |
| Mover a pasta inteira | ⚠️ | Funciona, mas leva artefatos de build e pode quebrar caminhos absolutos gravados pelo Xcode ou por scripts. |
| Symlink para a pasta antiga | ❌ | Fura a fronteira: o agente passa a escrever fora do Space e o container não segue o link. |

Antes de clonar, salve o que está pendente na pasta antiga (rode no seu terminal):
```bash
git status --porcelain            # alterações não commitadas
git rev-list --count @{u}..HEAD   # commits não enviados
git stash list; git worktree list # stashes e worktrees não vêm no clone
```
Depois do clone, coloque a pasta antiga em `guardrails/caminhos-bloqueados.local` para o agente não mexer nela por engano.

## Como o agente trabalha num projeto Apple

- Xcode e Simulador só rodam no macOS: **não use o devcontainer**. A proteção vem de `.claude/settings.json`, do hook em `guardrails/hooks/` e, se quiser mais, do sandbox nativo (`/sandbox`) com `xcodebuild` e `xcrun simctl` liberados.
- Build sempre com `-derivedDataPath build` (artefatos dentro do projeto, fora do `~/Library`).
- Projetos XcodeGen (`project.yml`): edite o `project.yml` e rode `xcodegen generate`; o `.xcodeproj` é gerado.
- Assinatura, archive, upload e TestFlight ficam com você. O agente prepara (`agentes/workflows/release-ios.md`).
- Projetos com subagentes próprios em `.claude/agents/` precisam do `claude` aberto dentro deles. Nesse modo o `CLAUDE.md` do Space ainda é lido, mas o `.claude/settings.json` e o hook **não**, porque o projeto é outro repo git. Para manter os guardrails, copie as regras `deny` e o hook para o `.claude/settings.json` do projeto ou para `~/.claude/settings.json`.
- Projeto sem git: crie o repositório antes (`git init` + `gh repo create --private`).
