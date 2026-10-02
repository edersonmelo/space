---
name: onboard-repo
description: Adiciona um projeto ao Space (manifesto, clone, índice e CLAUDE.md). Use quando o usuário pedir para "trazer", "adicionar" ou "colocar" um projeto/repositório no Space.
---

# Onboard de repositório

1. Descubra o grupo (`ios`, `www`, `apis`, `libs`, `legado`…) e a URL git. Se o projeto existe localmente fora do Space, peça ao usuário o remote (`git remote get-url origin`); se não tiver git, pare e explique que precisa de um repositório primeiro.
2. Rode `tools/add-repo.sh <grupo> <url> [nome] [branch]`. Ele registra em `repositorios/repos.tsv`, clona e reindexa.
3. Leia o projeto clonado e identifique stack, comandos de build/teste e onde ficam os segredos (`.env`, chaves). Confira que esses arquivos estão no `.gitignore` do projeto.
4. Se o projeto não tiver `CLAUDE.md` nem `AGENTS.md`, proponha um curto: comandos de build/teste, arquitetura em poucas linhas, regras específicas do projeto. Crie numa branch e não faça commit sem o usuário pedir.
5. Projeto Apple: confira o build com `-derivedDataPath build` e `build/` no `.gitignore` (veja `agentes/docs/guia-apple.md`).
6. Mostre ao usuário a linha do índice (`agentes/contexto/indice.md`) e o que falta configurar.
