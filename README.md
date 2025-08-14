# 🚀 Pyenv Installer Script (Ubuntu/WSL)

Este é um script simples e **automático** para instalar e configurar o [pyenv](https://github.com/pyenv/pyenv) no **Ubuntu** ou **WSL2**, já incluindo **todas as dependências necessárias** para compilar qualquer versão do Python.

---

## 📌 Funcionalidades
- 📦 Instala todas as dependências necessárias para compilar Python pelo pyenv.
- ⬇️ Baixa e instala o pyenv via `curl`.
- 📝 Adiciona automaticamente a configuração no `~/.bashrc` e no `~/.zshrc` (se existir).
- 🔄 Deixa o `python` e `python3` apontando para a mesma versão gerenciada pelo pyenv.
- 💬 Modo **verboso**, mostrando cada etapa da instalação.

---

## 🔧 Instalação e uso
Clone o repositório e execute o script:

```bash
git clone https://github.com/seu-usuario/pyenv-installer.git
cd pyenv-installer
chmod +x install_pyenv.sh
./install_pyenv.sh
```

Depois de instalar, feche e reabra o terminal, ou rode:
```bash
exec $SHELL
```

---

## 💡 Exemplo de uso
Instalar a versão mais recente do Python:
```bash
pyenv install 3.13.6
pyenv global 3.13.6
python --version
python3 --version
```

---

## 🛠 Requisitos
- Distribuição **Ubuntu** ou **WSL2** com `apt`
- Acesso sudo para instalar pacotes

---

## 📜 Licença
Este projeto está sob a licença MIT — sinta-se livre para usar e modificar.
