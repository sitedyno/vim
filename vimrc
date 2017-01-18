" vim: foldmethod=marker :
set nocompatible

" Infection begin~
execute pathogen#infect()
execute pathogen#helptags()

" {{{ Reload vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost ~/.vim/vimrc source ~/.vim/vimrc
augroup END
" }}}

" {{{ Window and editor setup
let mapleader=','
" Display line numbers and rulers.
set number
syntax on

" Set encoding
" NeoVim will throw an error when auto reloading vimrc/init
" as encoding shouldn't change after startup
" Apparently this setting is controversial:
" https://groups.google.com/forum/#!msg/vim_dev/up1KslPRGzk/9xwHeIb6WWgJ
silent! set encoding=utf-8

" Use 256 colors
set t_Co=256

" Whitespace
let tabstop=4
set shiftwidth=4
set softtabstop=4
set list listchars=tab:▸\ ,eol:¬,trail:·
set noeol
set autoindent

" Enable formatting of comments and one letter words.
" see :help fo-table
set formatoptions=qrcl

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Window settings
set wrap
set lbr
set textwidth=0
set cursorline

" Don't redraw when macros are executing.
set lazyredraw

" Use modeline overrides
set modeline
set modelines=10

" Status bar
set laststatus=2

" Use the system clipboard
set clipboard=unnamed

" Tab completion for filenames and other command line features.
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.pyc,node_modules/*
" }}}

" {{{ Colors
" Default color scheme
color badwolf
" }}}

" {{{ Swap files and undos
" Git <3
set noswapfile
set nobackup
set nowritebackup

" Persistent undos
if !&diff
    set undodir=~/.vim/backup
    set undofile
endif
" }}}

" {{{ Search
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear search highlighting.
map <Leader><Space> :nohl<CR>
" }}}

" {{{ Spell check
"set spell spelllang=en_us
"hi SpellBad cterm=underline
"hi clear SpellCap
"hi clear SpellLocal
"hi clear SpellRare
" }}}

" {{{ Filetypes
" Load the plugin and indent settings for the detected filetype
filetype plugin indent on

" make uses real tabs
au FileType make setl noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" Map .twig files as jinja templates
au BufRead,BufNewFile *.twig,*.tpl  set ft=htmljinja

" Map *.coffee to coffee type
au BufRead,BufNewFile *.coffee  set ft=coffee

" Highlight JSON & es6 like Javascript
au BufNewFile,BufRead {*.json,*.es6} set ft=javascript

" hbs and mustache files.
au BufRead,BufNewFile {*.mustache,*.hbs}  set ft=mustache

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=90 expandtab colorcolumn=79
au FileType rst setl textwidth=80 expandtab colorcolumn=81

" Make ruby,scss,sass use 2 spaces for indentation.
au FileType {yaml,sass,scss,ruby,eruby} setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" php settings
au filetype php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120

" golang settings
au filetype go setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 noexpandtab colorcolumn=80

" Javascript settings
au FileType javascript setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=120

" Hbs settings
au FileType mustache setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=120

" Coffeescript uses 2 spaces too.
au FileType coffee setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" markdown settings
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au FileType markdown setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=90 expandtab colorcolumn=79
" }}}

" {{{ syntastic
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_php_checkers=['php']
" }}}

" {{{ vim-airline
let g:airline_powerline_fonts = 1
" }}}

" {{{ markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'php', 'javascript']
let g:markdown_syntax_conceal = 1
" }}}

" {{{ vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=0
" }}}

" {{{ CtrlP
let g:loaded_ctrlp = 1 " 1 = disabled
" }}}

" {{{ FZF
" https://github.com/junegunn/dotfiles/blob/master/vimrc#L1721-L1761
if has('nvim')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
"nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
"nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
"xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
"nnoremap <silent> <Leader>`        :Marks<CR>

"inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
"imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" }}}

" {{{ custom commands
" open a terminal at the bottom of the window
command! Layout1 sp | wincmd w | wincmd J | te
" }}}

