return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { "^.git/" }, -- Asegúrate de no ignorar .config
    },
    pickers = {
      find_files = {
        hidden = true, -- Incluye archivos y carpetas ocultas
        no_ignore = true,
      },
    },
  },
}
