# ⚡ NvChad Custom Config
Esta é uma configuração personalizada e turbinada baseada no NvChad v2.5. O ambiente foi projetado para oferecer alta produtividade em desenvolvimento de software (foco em Python, Data Science e Web), com ferramentas avançadas de banco de dados, controle de versão e inteligência artificial rodando localmente.

## 🚀 Principais Recursos
* **Core & UI**: Construído sobre o ecossistema do NvChad utilizando o tema `zenburn`. A interface conta com barra flutuante de comandos e notificações aprimoradas pelo `noice.nvim`. Inclui também visualização clara de escopos e delimitadores com `indent-blankline` e `rainbow-delimiters`.

* **Python (Backend & Data)**: Suporte robusto com o servidor de linguagem `pyright`, formatação via `ruff` e debugging avançado integrado com o `nvim-dap-python`.

* **Inteligência Artificial (Ollama)**: Integração nativa para rodar LLMs locais (configurado para usar o modelo `qwen2.5-coder:1.5b`). O workflow inclui o `ChatOllama.nvim` para prompts interativos e o `pm-agent.nvim` para revisão e assistência autônoma.

* **Desenvolvimento Web**: Ambiente pronto para HTML, CSS, JavaScript, TypeScript, React e templates Django, com formatação via `prettier` e `djlint`. Conta com debug JS/Node via `nvim-dap-vscode-js` e servidor de preview ao vivo com o `live-preview.nvim`.

* **Git & GitHub Premium**: Gerenciamento profundo de versionamento com interface do `Neogit`. Resolução de conflitos e histórico de arquivos com `Diffview`, além de controle de Issues e Pull Requests diretamente do editor pelo `octo.nvim`.

* **Gestão de Banco de Dados**: Execução e visualização de consultas SQL de forma interativa através do `vim-dadbod-ui`.

## ⌨️ Principais Keybindings (Atalhos)
A tecla líder (`<leader>`) está configurada como `Espaço`.

## 🌳 Git & GitHub
* `<leader>gs` : Abrir painel de Status do Neogit

* `<leader>gc` : Iniciar Commit no Neogit

* `<leader>gd` : Abrir Diffview

* `<leader>gh` : Ver Histórico do Arquivo Atual (Diffview)

* `<leader>op` / `<leader>oi` : Listar Pull Requests / Issues do Octo

## 🐛 Debug (DAP Python)
* `<leader>db` : Ativar/Desativar Breakpoint

* `<leader>dPt` : Iniciar Debug de um Método Python

* `<leader>dPc` : Iniciar Debug de uma Classe Python

## 🔧 Utilitários & Navegação
* `;` : Entrar em modo de Comando (substitui o `:`)

* `<leader>lp` : Iniciar Servidor de Live Preview para Web

* `J` / `K` (Modo Visual): Mover a linha ou bloco de texto selecionado para baixo/cima

> Nota: As setas de direção estão desativadas no modo normal para encorajar a navegação pelas teclas `hjkl`.

## 🛠️ Dependências do Sistema
Para que todos os plugins funcionem corretamente, certifique-se de possuir instalado no sistema:

1. **Ollama**: Rodando localmente na porta padrão (`http://localhost:11434`) com o modelo `qwen2.5-coder:1.5b` baixado.

2. **Debugpy (Python)**: O DAP do Python busca um interpretador em `~/.local/share/nvim/mason/packages/debugpy/venv/bin/python` (pode ser instalado via `:Mason`).

3. **Dependências do Github (Octo)**: Possuir a GitHub CLI (`gh`) instalada e autenticada.

## 📄 Licença
Este projeto segue os termos de dedicação ao domínio público (The Unlicense), permitindo cópia, modificação e uso comercial e não comercial de forma totalmente livre, conforme o arquivo de [LICENSE](https://www.google.com/search?q=LICENSE).

> Este repositório foi construído para servir como diretório de configurações para usuários do NvChad. Basta clonar, remover os diretórios `.git` e integrá-lo ao seu ambiente.
