# Vim Config

This repository contains my (constantly evolving) vim configuration.


# Setup

## Prerequisites

On your system:
- Python:
    - Version: >= 3.6.
- Vim:
    - Version: >= 8.1.
    - Version that supports python-3.6.<br>
      Suggested: [vim-gtk](https://packages.debian.org/stretch/vim-gtk)<br>
      Install & set as default using `update-alternatives`):
      ```
      $ sudo apt install vim-gtk
      $ sudo update-alternatives --set vim <PATH_TO_VIM_GTK_EXECUTABLE>
      ```
- Vim plugin manager:
    - Vim-Plug: https://github.com/junegunn/vim-plug.

## YouCompleteMe

I use the "YouCompleteMe" plugin for autocompletion suggestions. This plugin needs to be installed and built separately.

For installation and setup: https://github.com/ycm-core/YouCompleteMe

> :information_source:<br>
> If you build with semantic support for C-family languages using `clangd`, you should also provide a link to the `compile_commands.json` file in your project source tree.<br>
> One suggestion is to use a symbolic link to the file in your build folder.<br>
> For more information, see: https://clangd.llvm.org/design/compile-commands.

## Autoformat

The Autoformat plugin will only work if there is a formatter installed on the system.

> :information_source:<br>
> For `clang-format`:<br>
> - In case it does not exist yet: create a symlink in `/usr/bin/` called `clang-format` that points to the formatter (e.g. `clang-format -> clang-format-14`)
> - Add a `.clang-format` file to your project root directory describing the formatting rules you wish to use (more info: https://clang.llvm.org/docs/ClangFormatStyleOptions.html)

## Setup

- Clone this repository somewhere on your system.
- Create a symlink called `~/.vimrc` that points to the `vimrc` file in this repository (if you already have a `~/.vimrc`, it is probably a good idea to back it up before doing this).
- Open vim and run `:PlugInstall`, then wait until all plugins have installed.
- Restart vim.
- Start using vim!
