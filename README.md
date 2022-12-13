# NvCaed

# snoyhjrt

3

## Roadmap

A checklist of progress. Question marks indicate an opportunity to consider
alternatives or usefulness before implementation.

### Plugins

- [x] Packer - package manager
- [x] Telescope - file picker
  - [x] zf - fuzzy finder
- [x] nvim tree - file explorer
- [x] Treesitter
  - [x] Auto pairs
  - [x] Comments
  - [x] rainbow
- [x] firenvim - run in chrome
- [x] vim illuminate - highlight word under cursor using lsp, Treesitter, and
      regex
- [x] Alpha nvim - dashboard
- [x] cmp - completion engine
- [x] Vimwiki - notes
- [x] null ls - formatters
- [ ] impatient
- [ ] filetype
- [ ] mkdir nvim?
- [x] Code runner
- [x] Indent blankline - ingentation guides
- [x] Lualine - status bar

### General Todos

- [ ] Setup LSP config with more servers
  - [ ] javascript / typescript
  - [ ] yaml
- [ ] Clean up vesitgial codes fragments
- [ ] Benchmark startup time before and after lazy loading, then after
      impatient and filetype
- [ ] Lazy load where possible after installing everything
  - [ ] cmp after event = InsertEnter
    - [ ] have to figure out depencies and order for lazy loading them
- [ ] consider other snippet engine
- [ ] super tab function not working with snippets in cmp
- [ ] black formatter only works if no warnings, is it possible to overide this? maybe not, look more into the inconsistencies of formatting
- [ ] understand how to change directories with nvim tree
