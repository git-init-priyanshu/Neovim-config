# Neovim-NvChad-config

## Installation
### Pre-requisites
- [Neovim 0.10](https://github.com/neovim/neovim/releases/tag/v0.10.0)
- [Nerd Font](https://www.nerdfonts.com/) as your terminal font.
- Make sure the Nerd Font you set **doesn't end with Mono** to prevent small icons.  
  - **Example:** Use `JetBrainsMono Nerd Font` and not `JetBrainsMono Nerd Font Mono`.  

- [Ripgrep](https://github.com/BurntSushi/ripgrep) is required for grep searching with Telescope *(OPTIONAL)*.

- GCC, Windows users must have [mingw](https://www.mingw-w64.org/downloads/) installed and set on the system path.

- Delete old Neovim folders (Check commands below):
```
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

### Install
```
git clone https://github.com/git-init-priyanshu/Neovim-NvChad-config ~/.config/nvim && nvim
```
### Post install
- Run `:MasonInstallAll` command after `lazy.nvim` finishes downloading plugins.
- Delete the `.git` folder from nvim folder.
- Learn customization of ui & base46 from `:h nvui`.
