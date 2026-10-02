@AGENTS.md
@agentes/regras/seguranca.md
@agentes/regras/padroes.md

## Específico do Claude Code
- Subagentes em `.claude/agents/`: `orquestrador` (planeja e delega), `especificador`, `ios-especialista`, `revisor`. Para tarefas que tocam mais de uma etapa, comece pelo `orquestrador`.
- Skills em `.claude/skills/`. `onboard-repo` adiciona um projeto novo ao Space.
- Subagentes definidos dentro de um projeto (`repositorios/*/*/.claude/agents/`) só carregam quando o Claude é aberto dentro daquele projeto (`cd repositorios/<grupo>/<projeto> && claude`).
