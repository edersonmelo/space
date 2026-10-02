# Container para projetos que não são Apple (web, APIs, Rust, Python, legado).
FROM node:22-bookworm
RUN apt-get update && apt-get install -y --no-install-recommends \
      git sudo python3 iptables ipset dnsutils ripgrep jq \
    && rm -rf /var/lib/apt/lists/*
RUN npm install -g @anthropic-ai/claude-code
COPY init-firewall.sh /usr/local/bin/init-firewall.sh
RUN chmod +x /usr/local/bin/init-firewall.sh \
    && echo "node ALL=(root) NOPASSWD: /usr/local/bin/init-firewall.sh" > /etc/sudoers.d/firewall
USER node
