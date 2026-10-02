# Space

Um modelo de ambiente controlado para agentes de IA (Claude Code, Codex, Gemini) trabalharem nos seus projetos.
Baixe um Space, coloque um ou vários projetos em `repositorios/` e abra o agente na raiz: regras, guardrails, subagentes, skills e workflows passam a valer para todos eles.

```
Ferramentas            tools/                  scripts de suporte (iniciar, adicionar, sincronizar, indexar, diagnosticar)
Space                  .  (este repo)          estrutura dos agentes
└─ Guardrails          guardrails/ .claude/settings.json .devcontainer/
   ├─ Repositórios     repositorios/           seus projetos, um por pasta (fora do git)
   └─ Agentes de IA    CLAUDE.md AGENTS.md GEMINI.md
      ├─ Regras e segurança        agentes/regras/
      ├─ Decisão e orquestração    .claude/agents/
      ├─ Skills                    .claude/skills/
      ├─ Contexto indexado         agentes/contexto/   (gerado)
      ├─ Ferramentas e integrações .mcp.json + agentes/integracoes/
      ├─ Workflows                 agentes/workflows/
      └─ Documentações             agentes/docs/
```

## Começar

1. **Baixe o modelo.** No GitHub, *Use this template* cria um repo seu a partir dele. Ou:
   ```bash
   gh repo create meu-space --template edersonmelo/space --private --clone && cd meu-space
   ```
2. **Prepare:** `tools/init.sh`
3. **Traga os projetos** para `repositorios/`, de qualquer jeito:
   ```bash
   tools/add-repo.sh https://github.com/voce/app.git   # clona de um remoto
   tools/add-repo.sh ~/Projetos/api                    # clona de uma pasta local com git (sem artefatos de build)
   cp -R ~/Projetos/site repositorios/site             # ou só copie a pasta
   ```
4. **Abra o agente na raiz do Space:** `claude`. Na primeira vez, aceite a pergunta de confiança da pasta: sem isso as permissões `allow` do `.claude/settings.json` são ignoradas (as proibições e o hook valem de qualquer jeito). Peça *"use a skill onboard-repo no projeto X"* para cada projeto novo.

## O que vem pronto

| | |
|---|---|
| Subagentes | `orquestrador`, `especificador`, `desenvolvedor` (qualquer stack), `ios-especialista` (Apple), `revisor` |
| Skill | `onboard-repo`: prepara um projeto novo (índice, segredos, `CLAUDE.md`) |
| Workflows | feature, bugfix, release de app Apple, onboard |
| Guardrails | permissões do Claude Code, hook que bloqueia comandos perigosos, devcontainer com firewall |
| Índice | `tools/index-repos.sh` detecta stack, branch e instruções de cada projeto |

## O que é seu e não vai para o git
| Arquivo | Para quê |
|---|---|
| `repositorios/<projeto>/` | código dos projetos |
| `repositorios/repos.tsv` | projetos clonados pelo `add-repo.sh` (modelo em `repos.example.tsv`) |
| `guardrails/caminhos-bloqueados.local` | pastas desta máquina que o agente não pode tocar |
| `agentes/docs/local/` | notas sobre os seus projetos |
| `.claude/settings.local.json` | permissões pessoais do Claude Code |

## Guardrails
Veja `guardrails/README.md`. Projetos Apple: `agentes/docs/guia-apple.md`.

## Licença
MIT. Veja `LICENSE`.
