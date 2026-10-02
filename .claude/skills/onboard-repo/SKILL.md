---
name: onboard-repo
description: Prepara um projeto para trabalhar no Space (trazer para repositorios/, indexar, conferir segredos e criar CLAUDE.md). Use quando o usuário pedir para "trazer", "adicionar", "colocar" ou "preparar" um projeto/repositório no Space, ou quando aparecer uma pasta nova em repositorios/.
---

# Onboard de projeto

1. **Trazer**, se ainda não estiver em `repositorios/`:
   - Tem URL git ou é um repo git local → `tools/add-repo.sh <url-ou-caminho> [nome] [branch]` (clona só o código e registra em `repositorios/repos.tsv`).
   - Não tem git → peça ao usuário para copiar a pasta para `repositorios/<nome>` e sugira `git init` dentro dela.
2. Rode `tools/index-repos.sh` e leia a linha do projeto em `agentes/contexto/indice.md`.
3. Leia o projeto e identifique stack, comandos de build/teste/lint e onde ficam segredos (`.env`, chaves, certificados). Confira que estão no `.gitignore` do projeto; se algum segredo estiver versionado, avise o usuário sem mostrar o conteúdo.
4. Se a pasta original do projeto continuar na máquina, sugira incluí-la em `guardrails/caminhos-bloqueados.local`.
5. Se o projeto não tiver `CLAUDE.md` nem `AGENTS.md`, proponha um curto: comandos de build/teste, arquitetura em poucas linhas, regras específicas. Crie numa branch e não faça commit sem o usuário pedir.
6. Projeto Apple: veja `agentes/docs/guia-apple.md` (build com `-derivedDataPath build`, `build/` no `.gitignore`).
7. Mostre ao usuário a linha do índice, o que foi feito e o que falta.
