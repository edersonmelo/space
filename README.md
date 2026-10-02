# Space

Um ambiente controlado para agentes de IA (Claude Code, Codex, Gemini) trabalharem nos seus repositórios de código.
Este repositório guarda **a estrutura, as regras e os guardrails**. O código dos projetos fica em `repositorios/`, fora do git do Space.

```
Ferramentas            tools/                  scripts de suporte (adicionar, sincronizar, indexar, diagnosticar)
Space                  .  (este repo)          estrutura dos agentes
└─ Guardrails          guardrails/ .claude/settings.json .devcontainer/
   ├─ Repositórios     repositorios/           clones dos seus projetos (fora do git)
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
```bash
git clone https://github.com/edersonmelo/space.git && cd space
tools/doctor.sh                                   # confere o que está instalado
tools/add-repo.sh www https://github.com/voce/projeto.git   # traz um projeto
claude                                                  # abre o agente na raiz
```
`add-repo.sh` registra o projeto em `repositorios/repos.tsv`, clona em `repositorios/<grupo>/<nome>` e atualiza `agentes/contexto/indice.md`.
Em outra máquina, com o `repos.tsv` já preenchido, `tools/sync-repos.sh` clona tudo de novo.

## O que é seu e não vai para o git
| Arquivo | Para quê |
|---|---|
| `repositorios/repos.tsv` | lista dos seus projetos (modelo em `repos.example.tsv`) |
| `repositorios/<grupo>/<nome>/` | código dos projetos |
| `guardrails/caminhos-bloqueados.local` | caminhos desta máquina que o agente não pode tocar |
| `agentes/docs/local/` | notas sobre os seus projetos |
| `.claude/settings.local.json` | permissões pessoais do Claude Code |

## Guardrails
Veja `guardrails/README.md`. Projetos Apple: `agentes/docs/guia-apple.md`.

## Licença
MIT. Veja `LICENSE`.
