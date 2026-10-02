# Release de app Apple
O agente prepara; o usuário publica.
1. Conferir branch principal limpa e testes passando.
2. Atualizar versão/build (`project.yml` ou target), `CHANGELOG.md` e notas da versão.
3. Revisar `PrivacyInfo.xcprivacy` e docs de privacidade se algo de rede/SDK mudou.
4. Rodar os hooks de release do projeto, se existirem (`.claude/hooks/release-*.sh`).
5. Entregar ao usuário um checklist: archive no Xcode, upload, TestFlight, submissão.
