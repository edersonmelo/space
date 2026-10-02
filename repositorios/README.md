# Repositórios

Os projetos em que os agentes trabalham, um por pasta: `repositorios/<projeto>`. Pode ser um só ou vários.
Nada daqui vai para o git do Space.

Três jeitos de trazer um projeto:
- **Clonar**: `tools/add-repo.sh <url> [nome] [branch]`. Registra em `repos.tsv` (modelo em `repos.example.tsv`).
- **Clonar de uma pasta local com git**: `tools/add-repo.sh ~/caminho/do/projeto`. Vem só o código, sem artefatos de build.
- **Copiar a pasta** para cá. Sem git funciona, mas os agentes vão sugerir `git init` antes de mudar algo.

Depois: `tools/index-repos.sh` (ou peça ao agente para usar a skill `onboard-repo`).
Em outra máquina, com o `repos.tsv` copiado: `tools/sync-repos.sh`.
