" Vundle Start
set nocompatible
filetype off
" add vundle to runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
"
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
Plugin 'closetag.vim'
"
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Vundle End

" /etc/vimrc (configuration file for vim only)
" author: Klaus Franken     <kfr@suse.de>
" author: Werner Fink       <werner@suse.de> 
" author: Florian La Roche  <florian@suse.de> 
" version: 00/01/20
" commented lines start with `"'

" enable syntax highlighting
syntax on
" Solarized theme, dark or light
set background=dark
colorscheme solarized
" cyan comments suck.  Use light grey instead.
hi Comment ctermfg=LightGrey guifg=LightGrey


" Are these redundent?
filetype on
filetype plugin on

au BufNewFile,BufRead *.ctp set filetype=php

" .jshintrc syntax highlighting set to javascript
au BufNewFile,BufRead *.jshintrc set syn=javascript

" Set LESS color code
au BufNewFile,BufRead *.less set syn=css
" au BufNewFile,BufRead *.less set filetype=less

" automatically indent lines (default)
" set noautoindent
set autoindent

" show line numbers in left margin
set nu

" select case-insenitiv search (not default)
set ignorecase

" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" changes special characters in search patterns (default)
" set magic

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

" get easier to use and more user friendly vim defaults
" CAUTION: This option breaks some vi compatibility. 
"          Switch it off if you prefer real vi compatibility
" set nocompatible

" expand tabs to spaces.  makes sense if we want people with other editors
" to see the file looking the same.
set expandtab

" Show special chars
"set list
"set nolist

" stop beeping already!
set noerrorbells

" we like bash
set shell=bash

" we almost always use a dark background
"set background=dark

" Various options for a tab stop of 2 spaces
set cinoptions=>2
set shiftwidth=2
set tabstop=2
set softtabstop=2

" allow backspacing over everything in insert mode
set backspace=2

" Try to get the correct main terminal type
if &term =~ "xterm"
    let myterm = "xterm"
else
    let myterm =  &term
endif
let myterm = substitute(myterm, "cons[0-9][0-9].*$",  "linux", "")
let myterm = substitute(myterm, "vt1[0-9][0-9].*$",   "vt100", "")
let myterm = substitute(myterm, "vt2[0-9][0-9].*$",   "vt220", "")
let myterm = substitute(myterm, "\\([^-]*\\)[_-].*$", "\\1",   "")

" We write too many shebangs:
ab hbp #!/usr/bin/perl<CR>use warnings;<CR>use strict;<CR>
" Use when debugging
ab udd use Data::Dumper 'Dumper';<CR>print Dumper [];<LEFT><LEFT>

set hlsearch

" Increase buffer for clipboard
set viminfo='100,h

" Keep Cursor in middle
set scrolloff=999

" .vimrc ends here

