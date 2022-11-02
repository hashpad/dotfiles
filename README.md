# My Dotfiles
If you're in terested in the way my desktop looks and/or in my workflow, and you want to have the same experience you can follow the instructions bellow to have the same setup as me, only by running a couple of commands.

## What's inside
* Neovim config file with a lot of useful keybindings and plug-ins
* Picom config file with custom opacity/blur ...
* Ranger config file with the ability to show preview in the terminal (works without any problems with kitty)
## Neovim config file with a lot of keybindings and useful Plug-ins:
* Useful keybindings (Normal/Visual mode)
  - Enter/ctrl + m, to toggle nerdtree.
  - shift + h and shift + l to jump between left and right buffers.
  - ö,ä to resize the active buffer.
  - ++ to comment selected lines.
  - space to visual select current line.
  - gd to go to the definition of an object.
  - gi to go to the implementation of an object.
  - gr to go to the references of an object.
  - gb to go back to previous file.
  - ctrl + k to show documentation of an object.
  - F5 to open undo tree.
  - \* or ctrl + s to highlight all occurrences of the word under the cursor and jump between them.
  - space + f to jump to corresponding parenthesis.
  - ctrl + f to search for file recursively in the directory of the opened file.
  - shift + k or capital K will jump upwards (remap of ctrl+u).
  - shift + J or capital J will jump downwards (remap of ctrl+u).
  - ctrl + a to select all.
  - shit + y to copy visually selected text to the system clipboard.
  - shit + d to delete the line under the cursor "without" copying it to any clipboard.
  - ctrl + n + type the file name, will save the currently opened file and open a new one in the same directory with the given name.
  - ctrl + h and ctrl + l, to just between words (same as w and b).
  - ctrl + y copy the rest of the line to the system clipboard.
  - shift + ü or capital Ü to compile opened latex document.
  - shift + s or capital S to run compiled latex document.
* Useful keybindings (Insert mode)
  - jk/Jk/jK/JK/JAK to enter normal mode while being in insert mode
  - tab to show suggestion intellisense, for installed servers.
* Useful plug-ins (Using [vim-plug](https://github.com/junegunn/vim-plug) as a plugin manager)
  - 907th/vim-auto-save -> automatically saves changes to disk without having to use :w.
  - tikhomirov/vim-glsl -> Vim syntax highlighting for OpenGL Shading Language.
  - neoclide/coc.nvim -> Make your Vim/Neovim as smart as VSCode.
  - mbbill/undotree -> The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches. 
  - unkiwii/vim-nerdtree-sync -> A plugin that show the current file on NERDtree
  - scrooloose/nerdtree -> The NERDTree is a file system explorer for the Vim editor. 
  - tiagofumo/vim-nerdtree-syntax-highlight -> This adds syntax for nerdtree on most common file extensions.
  - zhaohuaxishi/auto-header ->  autoHEADER is a vim helper plugin for easier inserting comment header block contains varies of infomation.
  - ryanoasis/vim-devicons -> add icons to the pligins.
  - junegunn/fzf -> use fzf inside of vim/nvim.
  - 'honza/vim-snippets -> with this plugin you can add code snippets and trigger them with a shorter string.
  - scrooloose/nerdcommenter -> Comment functions so powerful—no comment necessary.
  - itchyny/lightline.vim -> status line for vim (looks better than airline).
  - tomasiser/vim-code-dark -> colorscheme.
  - urso/haskell_syntax.vim -> Syntax Highlighting and Indentation for Haskell and Cabal.
## SXHKD keybindings
  - firefox: meta + b.
  - appfinder: meta + space.
  - htop: ctrl + shift + esc.
  - ranger: ctrl + alt + e.
  - cmus + clyrics: meta + m.
  - cmus toggle play: meta + c.
  - cmus next: meta + n.
  - cmus previous: meta + p.
  - cmus shuffle: meta + s.
  - cmus replay: meta + v.
  - screenshot with selected region, screenshot will be saved in the home directory: shift + Print.
  - take a screenshot and save it in the anki directory, and copy a html img tag to it to the system clipboard: Print.
  - open terminal(kitty): control + alt + t.
  - open passmenu script: meta + k.
  - run slock to lock the screen: super + F12.
  - ctrl + alt + shift + q: run kill -9 -1.
## EXTRAS
  - Polkit configuration.
  - logind: hibernate when powerkey is pressed, ignore when lid is closed.
## How to install
  - clone the repo
```
git clone https://github.com/hashpad/dotfiles.git
```
  - cd into the cloned repo
```
cd dotfiles
```
  - run this command to make the installer executable
```
chmod u+x install.sh
```
  - run the installer, and pass your logged in username and the graphics card you have (amdgpu or nvidia)
    - in this example the username is anon and the graphics we have is amdgpu
  ```
  ./install.sh anon amdgpu
  ```
