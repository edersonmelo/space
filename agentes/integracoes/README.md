# Ferramentas e integrações

Única via de acesso externo do agente. Tudo que não está aqui não é usado.

| Integração | Onde se configura | Uso permitido |
|---|---|---|
| GitHub (`git`, `gh`) | credenciais do sistema | fetch, clone, abrir PR quando pedido |
| Xcode / Simulador | local | build, teste, rodar no simulador |
| MCPs | `.mcp.json` na raiz | nenhum ativo ainda |

Para adicionar um MCP: inclua em `.mcp.json`, registre nesta tabela o que ele pode fazer e por quê. Tokens e chaves vão em variáveis de ambiente (`"env": {"TOKEN": "${TOKEN}"}`), nunca escritos no arquivo.
