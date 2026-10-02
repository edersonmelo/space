# Instruções para agentes de IA

Vale para qualquer agente (Claude Code, Codex, Gemini). Você está na raiz do Space, um ambiente controlado.

## Onde está cada coisa
- `repositorios/<projeto>/`: código dos projetos (um ou vários). Cada projeto é independente, normalmente um repo git próprio, com seu próprio `CLAUDE.md`/`AGENTS.md`; **leia o do projeto antes de mexer nele**, ele prevalece sobre este arquivo no que for específico do projeto.
- Projeto que não está em `repositorios/` não existe para você.
- `agentes/contexto/indice.md`: índice gerado (stack, branch, último commit, comandos). Comece por ele para localizar algo.
- `agentes/regras/`: regras obrigatórias. `agentes/workflows/`: como executar cada tipo de tarefa. `agentes/docs/`: referência.

## Regras inegociáveis
1. Trabalhe só dentro do Space. Não leia nem escreva fora dele (nada de pastas antigas dos projetos, `~/.ssh`, etc.).
2. Uma tarefa = um projeto. Não altere dois projetos na mesma tarefa sem o usuário pedir. Projeto sem git: sugira `git init` antes de mudar algo.
3. Nunca faça commit direto na branch principal, `push --force`, nem push sem o usuário pedir.
4. Segredos (`.env`, `*secret*`, chaves, certificados, `.p8`, `.p12`, provisioning profiles) não são lidos, copiados nem colados em lugar nenhum.
5. Rede e serviços externos só pelas integrações listadas em `agentes/integracoes/README.md`.
6. Detalhes: `agentes/regras/seguranca.md` e `agentes/regras/padroes.md`.

## Como escolher o fluxo
- Feature nova → `agentes/workflows/feature.md`
- Bug → `agentes/workflows/bugfix.md`
- Release de app Apple → `agentes/workflows/release-ios.md`
- Projeto novo no Space → `agentes/workflows/onboard-repo.md`
