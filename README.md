# Requirements

1. `pacman -S neovim python-neovim`
2. Optionally install language servers for the following languages:
   1. C/C++: `clang` (for `clangd`)
   1. Python: `pyright`
   1. Docker: `dockerfile-language-server`
   1. YAML: `yaml-language-server`
   1. JSON: `vscode-json-languageserver`
   1. Bash: `bash-language-server`
   1. CMake: `cmake-language-server`
   1. Vue: `volar-server-bin`
   1. TypeScript: `typescript-language-server`

# Installation

To install, simply clone this repository as `~/.config/nvim` and run `nvim`.
The first time `nvim` starts, it will automatically pull the required plugins.

# Clean install

Installation might fail if there are still artifacts from a previous installation.
To start a clean install, `rm -rf ~/.local/share/nvim` and run `nvim` again.
