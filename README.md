# VIM CONFIG

## Prerequisites

### General

- Vim version: >= 8.1.
- Python 3.6 on your system.
- Vim version that supports python-3.6
  - Suggested: [vim-gtk](https://packages.debian.org/stretch/vim-gtk) (install & set as default using `update-alternatives`).
- Vim plugin manager [vim-plug](https://github.com/junegunn/vim-plug) is installed.

### YouCompleteMe

- Installation and setup: https://github.com/ycm-core/YouCompleteMe
- If built with semantic support for C-family languages using clangd, you should also provide a link to the `compile_commands.json` file in your project source tree.

### Autoformat

- Needs a formatter installed on the system.
- For `clang-format`:
   - In case not already there, create a symlink in `/usr/bin/` called `clang-format` that points to the formatter (e.g. `clang-format -> clang-format-14`)
   - Add `.clang-format` file to your project root directory.

## Setup

- Create a symlink from your `.vimrc` to the `vimrc` file you cloned from this repository.
- Open vim and run `:PlugInstall`, then wait until all plugins have installed.
- Restart vim.
