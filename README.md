# VIM CONFIG

## CSCOPE
See following links:
 - Official tutorial: http://cscope.sourceforge.net/cscope_vim_tutorial.html
 - CSCOPE database building tool: https://github.com/Michael-Purser/cscope-build

## YouCompleteMe
 - Need vim build that supports python-3.6 (suggested: `vim-gtk`, install using `apt` & set as default using `update-alternatives`)
 - For plugin installation and setup, see README: https://github.com/ycm-core/YouCompleteMe
 - If YCM is built with semantic support for C-family languages through clangd, you should also provide a link to the `compile_commands.json` file in your project source tree.

## Autoformat
 - Also needs a vim build that supports python (see YouCompleteMe instructions above).
 - Needs a formatter installed on the system.
 - For `clang-format`:
    - In case not already there, create a symlink in `/usr/bin/` called `clang-format` that points to the formatter (e.g. `clang-format -> clang-format-14`)
    - Add `.clang-format` file to root of your project.
