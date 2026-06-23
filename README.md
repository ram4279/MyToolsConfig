# MyToolsConfig
A repo that contains all the config files of mine

A proper nvim requires 
- A nerd font. Already added in the repo (Jetbrains mono)
- neovim to be installed from https://neovim.io/doc/install/ or linux package manager
- nvchad for managing the neovim https://nvchad.com/docs/quickstart/install
- nvim and its plugin settings are stored in ~/.config/nvim. You to copy the nvim_config from the repo and copy it to ~/.config/nvim. (You have to rename as well)
- The necessary plugins can be installed using the default nvchad package manager(lazy) if internet is available and github is accessible by your org
or else you have to copy nvim_share folder to ~/.config/ and rename it to nvim.

- I work in c or cpp based project
  - For code browsing we can either use cscope (static analyser)
  or
  - Clangd is the lsp server that works well. This can be installed via linux package manager or mason


Other tools I use are 
- tmux
- rg (ripgrep)
- fzf
- beyond compare
- tpm
