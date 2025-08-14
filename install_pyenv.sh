#!/usr/bin/env bash

set -e  # Se der erro, parar o script

echo "=============================="
echo "📦 Atualizando lista de pacotes..."
echo "=============================="
sudo apt update -y

echo "=============================="
echo "⬆️ Atualizando pacotes existentes..."
echo "=============================="
sudo apt upgrade -y

echo "=============================="
echo "🔧 Instalando dependências necessárias para o Pyenv e Python..."
echo "=============================="
sudo apt install -y \
  build-essential curl libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
  libncurses5-dev libncursesw5-dev xz-utils tk-dev \
  libffi-dev liblzma-dev python3-openssl git ca-certificates

echo "=============================="
echo "⬇️ Baixando e instalando Pyenv..."
echo "=============================="
curl https://pyenv.run | bash

# Configuração do Pyenv
PYENV_CONFIG='
# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Inicialização do PATH para login shells
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Inicialização completa para shells interativos
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
'

echo "=============================="
echo "📝 Adicionando configuração do Pyenv ao ~/.bashrc..."
echo "=============================="
if ! grep -q 'export PYENV_ROOT="$HOME/.pyenv"' "$HOME/.bashrc"; then
  echo "$PYENV_CONFIG" >> "$HOME/.bashrc"
  echo "✅ Configuração adicionada ao ~/.bashrc"
else
  echo "⚠️  Configuração já existe no ~/.bashrc, pulando..."
fi

if [ -f "$HOME/.zshrc" ]; then
  echo "=============================="
  echo "📝 Adicionando configuração do Pyenv ao ~/.zshrc..."
  echo "=============================="
  if ! grep -q 'export PYENV_ROOT="$HOME/.pyenv"' "$HOME/.zshrc"; then
    echo "$PYENV_CONFIG" >> "$HOME/.zshrc"
    echo "✅ Configuração adicionada ao ~/.zshrc"
  else
    echo "⚠️  Configuração já existe no ~/.zshrc, pulando..."
  fi
fi

echo "=============================="
echo "✅ Instalação e configuração concluídas!"
echo "=============================="
echo "💡 Feche e reabra o terminal, ou execute:"
echo "    exec \$SHELL"
echo "para ativar o Pyenv."
