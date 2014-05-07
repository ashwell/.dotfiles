" /etc/vimrc (configuration file for vim only)
" author: Klaus Franken     <kfr@suse.de>
" author: Werner Fink       <werner@suse.de> 
" author: Florian La Roche  <florian@suse.de> 
" version: 00/01/20
" commented lines start with `"'

" enable syntax highlighting
syntax on
filetype on
au BufNewFile,BufRead *.ctp set filetype=php

" Set less color code
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
set nocompatible

" expand tabs to spaces.  makes sense if we want people with other editors
" to see the file looking the same.
set expandtab

" stop beeping already!
set noerrorbells

" show matching brackets
set showmatch

" we like bash
set shell=bash

" cyan comments suck.  Use light grey instead.
hi Comment ctermfg=LightGrey guifg=LightGrey

" we almost always use a dark background
"set background=dark

" Various options for a tab stop of 4 spaces
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

" Added by Ryan Bogle
" set nowrap
"call pathogen#infect()
"call pathogen#runtime_append_all_bundles()

" .vimrc ends here

