return function ()
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true
    },
    incremental_selection = {
      enable = true
    },
    refactor = {
      --highlights definition and usages under cursor
      highlight_definitions = {
        enable = true
      }, highlight_current_scope = {
        enable = false
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "<leader>tr"
        }
      },
      navigation = {
        enable = true,
        keymaps = {
            goto_definition = "<leader>td",
            list_definitions = "<leader>tD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
        }
     }
    },
    textobjects = {
      enable=true,
      select = {
        enable = true,
        keymaps = {
          --TODO: understand what's this for
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",

          -- -- Or you can define your own textobjects like this
          ["iF"] = {
            python = "(function_definition) @function",
            cpp = "(function_definition) @function",
            c = "(function_definition) @function",
            java = "(method_declaration) @function",
          },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>al"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>ah"] = "@parameter.inner",
        },
      },
      -- code navigation
      move = {
        enable = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
    ensure_installed = "all"
  }
end
