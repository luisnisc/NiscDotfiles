return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          projects = {
            dev = { "~/Projects" },
            projects = { "~/.config" }, -- Registro estático de la raíz .config
            patterns = { ".project", ".git", "package.json", "Makefile" },
            hidden = true,
          },
        },
      },
    },
  },
}
