-- Mapping data with "desc" stored directly by vim.keymap.set().
-- Move Lines
-- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv-gv", { desc = "Move down" })
-- vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv-gv", { desc = "Move up" })
-- You probably also want to set a keymap to toggle aerial
-- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = {
            "<cmd>tabnew<cr>",
            desc = "New tab",
          },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = {
            name = "Buffers",
          },
          -- quick save
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
          ["<leader>a"] = { "<cmd>AerialToggle!<CR>", desc = "AerialToggle" },
          -- Move Lines
          ["<A-j>"] = { "<cmd>m .+1<cr>==", desc = "Move down" },
          ["<A-k>"] = { "<cmd>m .-2<cr>==", desc = "Move up" },
        },
        i = {
          ["<C-s>"] = { "<esc>:wa!<cr>", desc = "Save File" },
          -- Move Lines
          ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", desc = "Move down" },
          ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", desc = "Move up" },
        },
        v = {
          ["<A-j>"] = { ":m '>+1<cr>gv-gv", desc = "Move down" },
          ["<A-k>"] = { ":m '<-2<cr>gv-gv", desc = "Move up" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
