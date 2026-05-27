return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "htmldjango",
        "yaml",
        "markdown",
        "markdown_inline",
      },
    },
  },

  {
    "nvim-neotest/nvim-nio",
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap",
    ft = "python",
    keys = {
      { "<leader>db", ":DapToggleBreakpoint<CR>", desc = "Toggle Break Point", ft = "python" },
    },
  },

  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
    keys = {
      {
        "<leader>dPt",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Method",
        ft = "python",
      },
      {
        "<leader>dPc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Class",
        ft = "python",
      },
    },
  },

  {
    "ymtec90/ChatOllama.nvim",
    event = "VeryLazy",
    config = function()
      require("chatollama").setup {
        -- Ollama specific parameters
        predefined_chat_gpt_prompts = "file://" .. vim.fn.expand "~/.config/chatollama_prompts.csv",
        openai_params = {
          -- NOTE: model can be a function returning the model name
          -- Example:
          -- model = function()
          --     if some_condition() then
          --         return "llama3"
          --     else
          --         return "qwen2.5-coder:7b"
          --     end
          -- end,
          model = "qwen2.5-coder:1.5b",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4095,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "ymtec90/pm-agent.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "PMAgent",
      "PMReview",
      "PMAdd",
      "PMBasket",
      "PMProject",
      "PMAction",
    },
    config = function()
      require("pm_agent").setup {
        -- URL local do seu Ollama
        ollama_url = "http://localhost:11434/api/chat",
        -- Defina seu modelo preferido
        model = "qwen2.5-coder:1.5b",
      }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascriptreact",
      "typescriptreact",
      "htmldjango",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-vscode-js").setup {
        debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      }
    end,
  },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- Carrega apenas quando você abrir um arquivo .lua
    opts = {
      library = {
        -- Carrega os tipos do runtime do Neovim e da biblioteca 'luv'
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "brianhuster/live-preview.nvim",
    cmd = "LivePreview", -- Carrega o plugin apenas quando o comando for chamado
    opts = {
      -- A porta padrão do servidor local. Pode alterar se conflitar com o Django.
      port = 8080,
      browser = "default", -- Usa o navegador padrão do sistema
    },
    keys = {
      { "<leader>lp", ":LivePreview<CR>", desc = "Iniciar Live Preview" },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- NvChad já possui um bom sistema de notificações nativo, mas o Noice
      -- permite integração avançada se quiser adicionar o nvim-notify no futuro.
    },
    opts = {
      lsp = {
        -- Sobrescreve o renderizador de markdown do LSP nativo para usar o Noice
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- Predefinições visuais que combinam bem com o NvChad
      presets = {
        bottom_search = true, -- Usa a linha de comando inferior clássica para buscas
        command_palette = true, -- Posiciona o cmdline no centro (estilo paleta de comandos)
        long_message_to_split = true, -- Envia mensagens longas para um split
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
  },

  {
    "hrsh7th/cmp-cmdline",
    event = "CmdlineEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      local cmp = require "cmp"

      -- Configuração para busca com '/' e '?'
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Configuração para comandos com ':'
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" }, -- Ignora autocompletar para comandos de shell
            },
          },
        }),
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      -- Ativa o destaque do escopo (bloco atual) onde o cursor se encontra
      opts.scope = {
        enabled = true,
        show_start = true,
        show_end = false,
      }
      -- Retornamos as opções modificadas para o NvChad
      return opts
    end,
  },

  {
    "hiphish/rainbow-delimiters.nvim",
    event = "User FilePost", -- Carrega o plugin de forma preguiçosa (lazy) após abrir um ficheiro
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"

      -- A configuração deste plugin faz-se através de uma variável global nativa
      vim.g.rainbow_delimiters = {
        strategy = {
          -- Usa a estratégia global padrão
          [""] = rainbow_delimiters.strategy["global"],
          -- Estratégia local para ficheiros grandes (melhora a performance)
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
          -- Configuração específica para melhor suporte em React/TypeScript
          javascript = "rainbow-delimiters-react",
          javascriptreact = "rainbow-delimiters-react",
          typescript = "rainbow-delimiters-react",
          typescriptreact = "rainbow-delimiters-react",
        },
        -- Cores padrão do NvChad/base46 adaptadas para o arco-íris
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    config = function()
      require("diffview").setup {
        view = {
          merge_tool = {
            layout = "diff3_mixed",
          },
        },
      }
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    config = function()
      require("neogit").setup {
        -- Integrações ativas com os outros plugins do seu ambiente
        integrations = {
          diffview = true,
          telescope = true,
        },
        kind = "tab",
        commit_editor = {
          kind = "split",
        },
      }
    end,
  },

  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "Octo" },
    config = function()
      require("octo").setup {
        enable_builtin = true,
        default_remote = { "upstream", "origin" },
        suppress_missing_scope = {
          projects_v2 = true,
        },
      }
    end,
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    keys = {
      { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "IA Ações" },
      { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "IA Chat" },
      { "<leader>cg", "<cmd>CodeCompanion /commit_padrao<cr>", mode = "n", desc = "IA Gerar Commit" },
    },
    config = function()
      require("codecompanion").setup {
        strategies = {
          chat = { adapter = "ollama" },
          inline = { adapter = "ollama" },
          agent = { adapter = "ollama" },
        },
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "ollama",
              env = {
                url = "http://localhost:11434",
              },
              headers = {
                ["Content-Type"] = "application/json",
              },
              parameters = {
                sync = true,
              },
              schema = {
                model = {
                  default = "qwen2.5-coder:1.5b",
                },
                num_ctx = {
                  default = 8192,
                },
              },
            })
          end,
        },

        system_prompt = function()
          return [[Você é um engenheiro de software e cientista de dados auxiliando uma equipe técnica, com foco em desenvolvimento, análise de dados e sistemas de suprimento de bens e serviços.
            Suas respostas devem ser diretas, altamente técnicas e estritamente em português do Brasil.
            Sempre priorize eficiência computacional, boas práticas em Python/Bash e legibilidade no código.]]
        end,

        -- AQUI ESTÁ A CORREÇÃO PRINCIPAL: A chave correta é prompt_library
        prompt_library = {
          ["commit_padrao"] = {
            interaction = "chat",
            description = "Gera uma mensagem de commit seguindo o padrão rígido da equipe",
            opts = {
              alias = "commit_padrao",
              is_slash_cmd = true,
              auto_submit = true,
            },
            prompts = {
              {
                role = "system",
                content = [[Você é um gerador de mensagens de commit de código.
                  Você deve analisar o git diff fornecido e gerar uma mensagem de commit ESTRITAMENTE neste formato:

                  <TIPO>(<ESCOPO>): <Descrição curta no imperativo em português>

                  Tipos permitidos pela equipe:
                  - feat (nova funcionalidade, modelo ou integração)
                  - fix (correção de bug em script ou pipeline)
                  - docs (atualização de documentação)
                  - refactor (otimização de código estrutural)
                  - chore (atualizações de pacotes, configurações no Neovim/Linux)

                  Exemplo de saída esperada:
                  feat(analytics): adiciona cálculo de probabilidade histórica no painel principal

                  Regra de Ouro: Retorne APENAS a mensagem de commit final. Não adicione saudações, não explique o diff e não use blocos de código markdown. Apenas o texto plano.]],
              },
              {
                role = "user",
                content = function()
                  -- Usa o comando nativo do sistema para pegar o diff exato do que está em "stage"
                  return "Gere a mensagem de commit para o seguinte diff:\n\n" .. vim.fn.system "git diff --staged"
                end,
              },
            },
          },
        },
      }
    end,
  },

  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
    keys = {
      { "<leader>co", "<cmd>CompilerOpen<cr>", desc = "Abrir Compilador" },
      { "<leader>cr", "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>", desc = "Refazer Compilação" },
      { "<leader>ct", "<cmd>CompilerToggleResults<cr>", desc = "Resultados da Compilação" },
    },
  },

  {
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
}
