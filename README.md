# Neovim Configuration (lazy.nvim)

Lightweight Neovim setup built around `lazy.nvim`, focused on sensible defaults, strong navigation, and a small set of productivity plugins.

## What's Included
- **UI / UX**: `kanagawa.nvim` colorscheme, `lualine.nvim` statusline, `noice.nvim` command palette-style UI.
- **Navigation & Files**: `nvim-tree.lua` file explorer; `telescope.nvim` + `telescope-fzf-native` fuzzy finder with git/LSP pickers.
- **Editing**: `nvim-autopairs` auto pairs; `nvim-cmp` + `LuaSnip` completion/snippets; `toggleterm.nvim` integrated terminal.
- **Language**: `nvim-treesitter` syntax/indent; `rust-tools.nvim` Rust LSP extras.
- **Plugin Manager**: `folke/lazy.nvim` bootstraps automatically from `lua/core/lazy.lua`.

## Keymaps (leader = `<space>`)
- **General**: `<leader>d` duplicate line/selection; `<leader>s` save; `<leader>a` select all; `p` in visual pastes without clobbering clipboard.
- **Search/Movement**: `n`/`N` keep cursor centered; visual `J`/`K` move lines; `J` (normal) keeps cursor; `<`/`>` in visual keep selection.
- **Windows**: `<C-h/j/k/l>` move splits; `<C-Arrow>` resize splits.
- **Buffers**: `<S-l>`/`<S-h>` next/prev buffer; `<leader>bd` close buffer; `<leader>q` quit; `<leader>w` write & quit.
- **Diagnostics**: `]d` / `[d` next/prev; `<leader>e` float diagnostics.
- **File Explorer (`nvim-tree`)**: `<leader>1` toggle tree; inside tree: `<leader>n` new file, `<leader>R` rename, `<leader>c/x/v` copy/cut/paste, `<BS>` delete, `<CR>` open, `s` vertical split.
- **Telescope**: `<leader>ff` files, `<leader>e` recent files, `<leader>F` live grep, `<leader>fb` buffers, `<leader>f` in-file search, `<leader>fh` help tags, `<leader>FF` home-wide files, `gdc` defs, `gr` refs, `gi` impls, `gt` type defs, `<leader>ss` workspace symbols, `<leader>xx` diagnostics, `<leader>gs/gc/gb` git status/commits/branches.
- **Terminal**: `<leader>t` toggle terminal (horizontal, height 15); `<Esc>` leaves terminal insert mode.

## Options at a Glance
- Relative/absolute line numbers, cursorline, signcolumn, truecolor.
- Tabs = 4 spaces, shiftwidth 2, smartindent.
- Clipboard = system (`unnamedplus`), smartcase search.
- Diagnostics floating windows with rounded borders and custom signs.
- Neovide-specific tweaks (disabled cursor animations, meta key on left option).

## Installation
Prereqs: git, Neovim ≥ 0.9, build tools (`make` for `telescope-fzf-native`), and optionally Neovide.

1) Backup existing config (optional):
```
mv ~/.config/nvim ~/.config/nvim.backup
```
2) Place this config in `~/.config/nvim` (clone your repo or copy the folder):
```
git clone <your-neovim-config-repo> ~/.config/nvim
```
3) Start Neovim; `lazy.nvim` auto-installs and syncs plugins on first launch:
```
nvim
```
4) (macOS optional) `init.sh` contains a simple script to install Neovim + Neovide via Homebrew; review before running:
```
cd ~/.config/nvim && bash init.sh
```

Treesitter parsers listed in `lua/plugins/treesitter.lua` install automatically; rerun `:TSUpdate` if needed. `telescope-fzf-native` builds during first install; ensure `make` is available.

