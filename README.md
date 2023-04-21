# NvCaed

A Neovim config.

## Plugins

### NVim Tree ([nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua))

A file manager.

| Keybind          | Action                 |
| ---------------- | ---------------------- |
| `<leader>e`      | Open NvimTree          |
| `?`              | Help                   |
| `<2-LeftMouse>`  | Open                   |
| `<2-RightMouse>` | CD                     |
| `<C-]>`          | CD                     |
| `<C-E>`          | Open: In Place         |
| `<C-K>`          | Info                   |
| `<C-R>`          | Rename: Omit Filename  |
| `<C-T>`          | Open: New Tab          |
| `<C-V>`          | Open: Vertical Split   |
| `<C-X>`          | Open: Horizontal Split |
| `<BS>`           | Close Directory        |
| `<CR>`           | Open                   |
| `<Tab>`          | Open Preview           |
| `>`              | Next Sibling           |
| `?`              | Help                   |
| `-`              | Up                     |
| `<`              | Previous Sibling       |
| `.`              | Toggle Dotfiles        |
| `A`              | Expand All             |
| `B`              | Toggle No Buffer       |
| `C`              | CD                     |
| `D`              | Trash                  |
| `E`              | Expand All             |
| `F`              | Clean Filter           |
| `H`              | Collapse All           |
| `I`              | Toggle Git Ignore      |
| `J`              | Last Sibling           |
| `K`              | First Sibling          |
| `L`              | Vsplit Preview         |
| `O`              | Search                 |
| `P`              | Print Node Path        |
| `R`              | Refresh                |
| `U`              | Toggle Hidden          |
| `W`              | Collapse               |
| `Y`              | Copy Relative Path     |
| `a`              | Create                 |
| `bmv`            | Move Bookmarked        |
| `]c`             | Next Git               |
| `c`              | Copy                   |
| `[c`             | Prev Git               |
| `d`              | Delete                 |
| `e`              | Rename: Basename       |
| `]e`             | Next Diagnostic        |
| `[e`             | Prev Diagnostic        |
| `f`              | Filter                 |
| `g?`             | Help                   |
| `gy`             | Copy Absolute Path     |
| `h`              | Close                  |
| `l`              | Edit Or Open           |
| `m`              | Toggle Bookmark        |
| `o`              | Run System             |
| `p`              | Paste                  |
| `q`              | Close                  |
| `r`              | Rename                 |
| `x`              | Cut                    |
| `y`              | Copy Name              |

### Colorizer

Highlights hex code with their color.

### Colorschemes

### Comment ([numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) )

| Keybind             | Action                                 |
| ------------------- | -------------------------------------- |
| `gcc`               | Comment line                           |
| `gbc`               | Comment block                          |
| `gcO`               | Comment line above                     |
| `gco`               | Comment line below                     |
| `gcA`               | Add Comment to End of Line             |
| `gc[count]{motion}` | Comment Motion Using Linewise Comment  |
| `gb[count]{motion}` | Comment Motion Using Blockwise Comment |

### LSP

### Mini-Surround ([echasnovski/mini.surround](https://github.com/echasnovski/mini.surround) )

| Keybind      | Action                       |
| ------------ | ---------------------------- |
| `sa`         | Surround Arround (in visual) |
| `sa{motion}` | Surround Arround             |
| `sd`         | Surround Delete              |
| `sr`         | Surround Replace             |
| `sf`         | Surround Find Right          |
| `sF`         | Surround Find Left           |
| `sh`         | Highlight Surround           |

### NVim cmp [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) )

| Keybind     | Action                                                   |
| ----------- | -------------------------------------------------------- |
| `<C-b>`     | Scroll Docs Up                                           |
| `<C-f>`     | Scroll Docs Down                                         |
| `<C-Space>` | Open Auto Complete                                       |
| `<C-e>`     | Exit Auto Complete                                       |
| `<CR>`      | Accept Currently Selected or First Item                  |
| `<Tab>`     | Select Next Item or Move to Next Snippet Section         |
| `<S-Tab>`   | Select Previous Item or Move to Previous Snippet Section |
| `<C-j>`     | Select Next Item                                         |
| `<C-j>`     | Select Previous Item                                     |

### Telescope ([nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim))

A fuzzy file picker.

| Keybind     | Action                              |
| ----------- | ----------------------------------- |
| `<leader>f` | Telescope find_files                |
| `<leader>t` | Telescope buffers                   |
| `<leader>g` | Telescope live_grep                 |
| `<C-p>`     | Telescope commands theme=dropdown   |
| `<leader>F` | Telescope current_buffer_fuzzy_find |

### Treesitter

### NVim Treesitter Text Subjects ([RRethy/nvim-treesitter-textsubjects](https://github.com/RRethy/nvim-treesitter-textsubjects) )

| Keybind | Action (while in visual mode) |
| ------- | ----------------------------- |
| `,`     | Previous Selection            |
| `.`     | Expand to Outer Smart         |
| `;`     | Expand to Inner Container     |
| `i;`    | Expand to Outer Container     |

### NVim Autopairs ([windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) )

An Autopairs plugin.

| Keybind | Action                                                           |
| ------- | ---------------------------------------------------------------- |
| `<C-e>` | After Adding One Pair to the Start of Something, Add Ending Pair |

### Barbecue
