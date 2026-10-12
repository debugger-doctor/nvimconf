return {
  -- Configuração do clangd para NixOS no nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          mason = false, -- Impede o Mason de baixar/gerenciar o clangd, usando o binário nativo do NixOS
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders=true",
            "--fallback-style=llvm",
            -- No NixOS, o clangd precisa do --query-driver para consultar os wrappers do compilador no /nix/store
            "--query-driver=/nix/store/*/bin/clang*,/nix/store/*/bin/gcc*,/nix/store/*/bin/g*,/run/current-system/sw/bin/*",
          },
        },
      },
    },
  },

  -- Configuração de formatação com clang-format (usando o binário do NixOS)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
    },
  },
}
