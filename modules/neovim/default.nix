{ config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      nvim-treesitter.withAllGrammars
      nvim-autopairs
      telescope-nvim
      lualine-nvim
      tokyonight-nvim
      oil-nvim
      smear-cursor-nvim
      nvim-cmp
      cmp-nvim-lsp
      luasnip
      cmp_luasnip
    ];

    initLua = ''
        vim.opt.number = true
        vim.opt.relativenumber = true

        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.expandtab = true

        vim.cmd[[colorscheme tokyonight]]

        require('lualine').setup {
          options = { theme = 'tokyonight' }
        }

        require("tokyonight").setup({
          transparent = true,
          terminal_colors = true,
          styles = {
            sidebars = "transparent",
            floats = "transparent",
          },
        })

        require("nvim-autopairs").setup {}

        require("oil").setup ({})

        require("smear_cursor").setup({
          stiffness = 0.8,
          trailing_stiffness = 0.5,
          distance_stop_animating = 0.5,

          legacy_computing_symbols_support = true,
          distance_stop_animating_vertical_bar = 0.1,
        })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.api.nvim_create_autocmd("FileType", {
      pattern = "qml",
      callback = function(args)
        local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "qmlls" })
        if #clients > 0 then
          return
        end

        vim.lsp.start({
          name = "qmlls",
          cmd = { "qmlls" },
          capabilities = capabilities,
          root_dir = vim.fs.dirname(vim.fs.find({ "flake.nix", ".git", "." }, { upward = true })[1]),
        })
      end,
      })

      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      })
      })
      local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '-', "<CMD>Oil<CR>", {})
        vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
    '';
  };  
}
