dotfiles
========

I've recently changed my main text editor(vim) to [NeoVim](https://github.com/neovim/neovim), NeoVim is a bit more "fancy" than vim. It has a few more features which makes it much more fast and useful. One of them that I find really great is the Terminal Emulator(meaning that you can open a terminal inside neovim, do splits and all that). I've also reduced my plugins list because I had a lot of them and use only half.

Having the Terminal inside the editor lead me to stop using Tmux. But since NeoVim lacks of Ruby support, some of the commands(like rake) don't work inside NeoVim, so I started using it again.

Screenshots of my NeoVim + tmux setup:

![simple-neovim](https://github.com/kriox26/dotfiles/blob/imgs/neovim1.png)
![neovim+term](https://github.com/kriox26/dotfiles/blob/imgs/neovim2.png)


I said that I had a lot less plugins, but they are still a lot... Some of them I barely use, but when I do is because I really need them. So I decided to keep all of this, it's not like makes NeoVim slower anyway, Pathogen does a pretty good work with the $RUNTIMEPATH, so NeoVim startup is still fast.
### Neovim/vim-plugins installed

* **[Vim-airline](https://github.com/bling/vim-airline)**:
lean & mean status/tabline.

* **[Ag](https://github.com/ervandew/ag)**:
Vim plugin to search using the silver searcher.

* **[CtrlP](https://github.com/kien/ctrlp.vim)**:
Full path fuzzy file finder for vim.

* **[Vim-commentary](https://github.com/tpope/vim-commentary)**:
Vim plugin for better commenting.

* **[Vim-surround](https://github.com/tpope/vim-surround)**:
Enclose text objects.

* **[Syntastic](https://github.com/scrooloose/syntastic)**:
Syntax checker for vim.

* **[SuperTab](https://github.com/ervandew/supertab)**:
Context and language-specific completion.

* **[Vim-fugitive](https://github.com/tpope/vim-fugitive)**:
Awesome git wrapper for vim.

* **[Vim-exchange](https://github.com/tommcdo/vim-exchange)**:
Easy text exchange operator.

* **[Vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)**:
Multiple selection.

* **[Vim-ruby](https://github.com/vim-ruby/vim-ruby)**:
For better syntax highlight and integration.

* **[Vim-rails](https://github.com/tpope/vim-rails)**:
Ruby on rails power tools.

* **[Vim-bundler](https://github.com/tpope/vim-bundler)**:
Lightweight support for Ruby's bundler.

* **[Vim-rvm](https://github.com/tpope/vim-rvm)**:
Switch Ruby versions from inside Vim.

* **[Vim-rake]()**: Vim rails without the rails part

* **[Vim-startify](https://github.com/mhinz/vim-startify)**:
Fancy start screen for vim

* **[UltiSnips](https://github.com/SirVer/ultisnips)**:
Awesome snippets.

* **[Auto-pairs](https://github.com/jiangmiao/auto-pairs)**:
Vim plugin, insert or delete brackets, parens, quotes in pair.

* **[Vim-repeat](https://github.com/tpope/vim-repeat)**:
Enable repeating supported plugin maps with ".".

* **[Gist-vim](https://github.com/mattn/gist-vim)**:
Vimscript for handling gists inside vim.

* **[Vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)**:
Better whitespace highlighting for Vim.

* **[Vim-textobj-indent](https://github.com/kana/vim-textobj-indent)**:
Text objects for indented blocks of lines.

* **[Vim-textobj-line](https://github.com/kana/vim-textobj-line)**:
Text objects for the current line.

* **[Vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock)**:
A custom text object for selecting ruby blocks.

* **[Vim-textobj-user](https://github.com/kana/vim-textobj-user)**:
Create your own text objects.

* **[Vim-tmux](https://github.com/tmux-plugins/vim-tmux)**:
Vim plugin for tmux.conf.

* **[Webapi-vim](https://github.com/mattn/webapi-vim)**:
Vim interface to Web API.

PD: I recommend to use [pathogen](https://github.com/tpope/vim-pathogen) as a plugin manager :smiley: :ok_hand:
