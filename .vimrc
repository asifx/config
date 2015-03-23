
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set nobackup		" keep a backup file, NO !! </aSf>
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" END OF EXAMPLE VIMRC.

"<aSf> based on the struture of options
" 1 important
" 2 moving around, searching and patterns
set nowrapscan " :set ws
" 3 tags
" 4 displaying text
" 5 syntax, highlighting and spelling
" 6 multiple windows
" 7 multiple tab pages
" 8 terminal
" 9 using the mouse
"10 GUI ... gvimrc
" .gvimrc ...
"11 printing
"12 messages and info
"13 selecting text
"14 editing text
"15 tabs and indenting
"16 folding
"17 diff mode
"18 Mapping ... from quickref
"Q_lr
" left/right motion for insert mode
"map! <A-h> <Esc>:normal h<Esc>
"
"
"

map  <F5> :nohlsearch <Esc>
map <A-u> :nohlsearch <Esc>

"19 reading and writing files
set autowrite " for job-control

"20 the swap file
set noswf " no swapfile
"21 command line editing
"22 executing external commands
"set sh=c:/nix/git/bin/sh.exe ... ms-win
"# equalprg = python ?!
"23 running make and jumping to errors
"24 system specific
"25 language specific
"26 multi-byte characters
"27 various
" ftplugin in *various* ??
runtime ftplugin/man.vim

" 2 moving around, searching and patterns
set path=.,/usr/lib/python2.7,/usr/include,,
set autochdir " noacd
"# :lcd current dir for the current window
set nowrap
"set nobackup ... go line 27
colorscheme blue

" 6 multiple windows
set laststatus=2

"10 gui ...should move to gvimrc
"set guifont=Lucida_Console\ 11
"folding
set foldcolumn=2

" Mapping
" Visual-mode Copy and normal-mode Paste, [c]lipborad
nmap <A-c> "+gP
vmap <A-c> "+y
" TODO wrapscan ... 'ws', [w]rap
" ignore case ... 'ic', alternate-[n]ext

" Lang specific
"set encoding=utf-8
"set keymap=russian-jcukenwin
"</aSf>

