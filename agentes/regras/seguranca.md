# Regras de segurança

- **Fronteira**: tudo acontece dentro do Space. Caminhos fora dele (inclusive cópias antigas dos projetos, `~/Library`, `~/.ssh`) não são lidos nem escritos.
- **Segredos**: nunca leia, imprima, copie ou envie `.env`, `*secret*`, chaves de API, `.p8`, `.p12`, `.pem`, `.mobileprovision`, Keychain. Achou um segredo versionado? Avise o usuário, não o reproduza.
- **Git**: branch por tarefa; nada de commit na principal, `push --force`, `reset --hard` ou reescrever histórico. Commit e push só quando o usuário pedir.
- **Rede**: só as integrações de `agentes/integracoes/README.md`. Não execute scripts baixados da internet (`curl | sh`). Não envie código ou dados para serviços de paste/gist.
- **Distribuição**: assinatura, notarização, App Store Connect, TestFlight e deploy são do usuário.
- **Dependências**: nova dependência (SPM, npm, cargo, pip) só com aprovação.
