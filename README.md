<!-- markdownlint-disable-file -->
<!-- markdownlint-disable-file -->
# NvCaed

A Neovim config.

## Table of Contents

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [NvCaed](#nvcaed)
  - [Table of Contents](#table-of-contents)
  - [Why NvCaed](#why-nvcaed)
  - [Showcase](#showcase)
  - [Plugins](#plugins)
    - [Making things faster](#making-things-faster)
    - [Plugin Manager](#plugin-manager)
    - [Colorschemes](#colorschemes)
    - [Dashboard](#dashboard)
    - [Notes](#notes)
    - [File and Buffer Navigation](#file-and-buffer-navigation)
    - [Code Actions and Highlighting](#code-actions-and-highlighting)
    - [Help](#help)
    - [Version Control](#version-control)
  - [Road Map](#road-map)
    - [High Priority](#high-priority)
    - [Low Priority](#low-priority)
  - [Potential Changes](#potential-changes)
  - [Bugs](#bugs)

<!-- /code_chunk_output -->

## Why NvCaed

Fast and configurable. This is my refined attempt at making my end game neovim config.

## Showcase

TODO

## Plugins

### Making things faster

- [impatient.nvim](https://github.com/lewis6991/impatient.nvim)
- [filetype.nvim](https://github.com/nathom/filetype.nvim)

### Plugin Manager

- [packer.nvim](https://github.com/wbthomason/packer.nvim)

### Colorschemes

- [vim-moonfly-colors](https://github.com/bluz71/vim-moonfly-colors)
- [zenburn.nvim](https://github.com/phha/zenburn.nvim)
- [gruvbox-baby](https://github.com/luisiacc/gruvbox-baby)
- [onedark.nvim](https://github.com/navarasu/onedark.nvim)
- [tender.vim](https://github.com/jacoborus/tender.vim)

### Dashboard

- [alpha-nvim](https://github.com/goolord/alpha-nvim)

### Notes

- [vimwiki](https://github.com/vimwiki/vimwiki)
- [telescope-bookmarks.nvim](https://github.com/dhruvmanila/telescope-bookmarks.nvim)

### File and Buffer Navigation

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [cybu.nvim](https://github.com/ghillb/cybu.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim)
- [vim-bbye](https://github.com/moll/vim-bbye)
- [jghauser/mkdir.nvim](https://github.com/jghauser/mkdir.nvim)

### Code Actions and Highlighting

- [coc.nvim](https://github.com/neoclide/coc.nvim)
  - [vim-snippets](https://github.com/honza/vim-snippets)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
  - [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
  - [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-cursorline](https://github.com/yamatsum/nvim-cursorline)
- [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [vim-surround](https://github.com/tpope/vim-surround)

### Help

- [which-key.nvim](https://github.com/folke/which-key.nvim)

### Version Control

- [lazygit.nvim](https://github.comkdheepak/lazygit.nvim/)

## Road Map

Focused on minor improvements right now. Switching off of coc will be a later goal.

### High Priority

- [ ] Add Toggle term and configure it to powershell
- [ ] Configure coc keybinds with telescope where appropriate
- [ ] text objects and line objects(copy line without end of line char)
- [ ] Neo Clip

### Low Priority

- [ ] Switch to native LSP
  - [ ] nvim-cmp vs coq?
- [ ] Find lua alternatives to coc extensions

## Potential Changes

- indent scope to select around code blocks more easily
- switch vim surround with minisurround - uses lua
- maybe mini.bufremove
- maybe <https://github.com/chentoast/marks.nvim>
- toggle term
- <https://github.com/rktjmp/paperplanes.nvim>
- <https://github.com/rcarriga/nvim-notify>
- <https://github.com/stevearc/dressing.nvim>
- <https://github.com/axieax/urlview.nvim>
- <https://github.com/lewis6991/spellsitter.nvim> is this nec?
- <https://github.com/SmiteshP/nvim-gps>
- <https://github.com/jbyuki/instant.nvim>
- <https://github.com/kevinhwang91/nvim-hlslens>
- <https://github.com/folke/zen-mode.nvim>
  or <https://github.com/Pocco81/TrueZen.nvim>
- <https://github.com/anuvyklack/pretty-fold.nvim>
- <https://github.com/xeluxee/competitest.nvim>
- or <https://github.com/rcarriga/vim-ultest>
- <https://github.com/sindrets/winshift.nvim>
- and or <https://github.com/beauwilliams/focus.nvim#readme>
- <https://github.com/gelguy/wilder.nvim>
- <https://github.com/nvim-treesitter/nvim-treesitter-textobjects>
- <https://github.com/AckslD/nvim-neoclip.lua>

## Bugs

- Vimwiki
  - ctrl + space bind does not work on windows terminal,
    probably a null character difference
  - enter to autocomplete on vimwiki does not work,
    probably cause binded to enter into page
    <https://github.com/vimwiki/vimwiki/issues/283>

