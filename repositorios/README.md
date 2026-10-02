# Repositórios

Clones dos projetos, organizados por grupo: `repositorios/<grupo>/<nome>`.
Nada daqui vai para o git do Space, nem a lista `repos.tsv` (modelo em `repos.example.tsv`).

- Adicionar: `tools/add-repo.sh <grupo> <url> [nome] [branch]` (ou a skill `onboard-repo`).
- Em outra máquina, com o `repos.tsv` copiado: `tools/sync-repos.sh`.
- Remover: apague a linha do `repos.tsv` e a pasta.
- Grupos sugeridos: `ios`, `www`, `apis`, `libs`, `legado`.
