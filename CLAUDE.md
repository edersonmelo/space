@AGENTS.md
@agentes/regras/seguranca.md
@agentes/regras/padroes.md

## Específico do Claude Code
- Abra o `claude` **na raiz do Space**, não dentro de um projeto: é aqui que valem as permissões (`.claude/settings.json`), o hook de guardrails, os subagentes e as skills.
- Subagentes em `.claude/agents/`: `orquestrador` (planeja e delega), `especificador`, `desenvolvedor`, `ios-especialista`, `revisor`. Para tarefas que tocam mais de uma etapa, comece pelo `orquestrador`.
- Skills em `.claude/skills/`. `onboard-repo` prepara um projeto novo em `repositorios/`.
- O `CLAUDE.md` de cada projeto é carregado quando você trabalha nos arquivos dele. Subagentes e skills definidos dentro de um projeto (`repositorios/<projeto>/.claude/`) não carregam a partir da raiz; se forem úteis, leia o arquivo do agente e siga as instruções dele.
