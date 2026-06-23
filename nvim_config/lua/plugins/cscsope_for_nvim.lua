return {
    "dhananjaylatkar/cscope_maps.nvim",
      dependencies = {
          "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
      },
      lazy = false,
      config = function()
          require("cscope_maps")  .setup({
              disable_maps = false,
              skip_input_prompt = true,
              prefix = "<leader>f",

              cscope = {
                  exec = "cscope",
                  picker = "telescope",
                  picker_opts = {
                      window_size = 5,
                      window_pos = "top",
                  },

                  skip_picker_for_single_result = true,

                  project_rooter = {
                      enable = false,
                      change_cwd = false,
                  },
              },
              
              stack_view = {
                  tree_hl=true,
              }
          })
      end
}
