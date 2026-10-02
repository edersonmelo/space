#!/usr/bin/env bash
# Gera agentes/contexto/indice.md: um mapa rápido dos projetos para os agentes.
set -euo pipefail
cd "$(dirname "$0")/.."
saida=agentes/contexto/indice.md

tem() { compgen -G "$1" >/dev/null; }

stack() {
  local d=$1 s=()
  if tem "$d/*.xcodeproj" || tem "$d/*/*.xcodeproj" || tem "$d/*.xcworkspace"; then s+=(Xcode); fi
  if [[ -f $d/project.yml ]]; then s+=(XcodeGen); fi
  if [[ -f $d/Package.swift ]] || tem "$d/*/Package.swift"; then s+=(SwiftPM); fi
  if [[ -f $d/Cargo.toml ]]; then s+=(Rust); fi
  if [[ -f $d/package.json || -d $d/electron ]]; then s+=(Node); fi
  if [[ -d $d/android || -f $d/build.gradle || -f $d/build.gradle.kts ]]; then s+=(Android/Gradle); fi
  if [[ -f $d/pyproject.toml || -f $d/requirements.txt ]]; then s+=(Python); fi
  if [[ -f $d/go.mod ]]; then s+=(Go); fi
  if [[ -f $d/pom.xml ]]; then s+=(Java/Maven); fi
  if [[ -f $d/composer.json ]]; then s+=(PHP); fi
  if [[ -f $d/Gemfile ]]; then s+=(Ruby); fi
  if tem "$d/*.csproj" || tem "$d/*.sln"; then s+=(.NET); fi
  if [[ -f $d/pubspec.yaml ]]; then s+=(Flutter); fi
  echo "${s[*]:-?}"
}

instrucoes() {
  local d=$1 out="" agentes
  for f in CLAUDE.md AGENTS.md README.md; do
    if [[ -f $d/$f ]]; then out+="${out:+ }$f"; fi
  done
  if [[ -d $d/.claude/agents ]]; then
    agentes=$(ls "$d/.claude/agents" | sed -n 's/\.md$//p' | paste -sd, -)
    if [[ -n $agentes ]]; then out+="${out:+ }· agentes: $agentes"; fi
  fi
  echo "${out:--}"
}

{
  echo "# Índice dos repositórios"
  echo
  echo "_Gerado por \`tools/index-repos.sh\` em $(date '+%Y-%m-%d %H:%M'). Não edite à mão._"
  echo
  echo "| Projeto | Stack | Branch | Último commit | Instruções do projeto |"
  echo "|---|---|---|---|---|"
  for d in repositorios/*/; do
    d=${d%/}
    if [[ ! -d $d ]]; then continue; fi
    if [[ -d $d/.git ]]; then
      br=$(git -C "$d" branch --show-current)
      ult=$(git -C "$d" log -1 --format="%cs %s" 2>/dev/null | cut -c1-60 || true)
    else
      br="(sem git)"; ult="-"
    fi
    echo "| \`$d\` | $(stack "$d") | $br | $ult | $(instrucoes "$d") |"
  done
} > "$saida"
echo "Gerado $saida"
