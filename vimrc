" vim: foldmethod=marker :
set nocompatible

" {{{ OS detection
if has('win32')
    let s:uname = 'win32'
else
    let s:uname = system("echo -n \"$(uname)\"")
endif
" }}}

" {{{ vim-plug
call plug#begin('~/.vim/vim-plugins')
Plug '2072/PHP-Indenting-for-VIm'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'groenewege/vim-less'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'mcfiredrill/vim-liquidsoap'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'
" ultisnips enables argument hinting in ncm2
Plug 'ncm2/ncm2-ultisnips'
Plug 'pangloss/vim-javascript'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'phpactor/phpactor',  {'do': 'composer install', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'StanAngeloff/php.vim'
Plug 'BurningLutz/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wincent/loupe'
Plug 'w0rp/ale'
call plug#end()
" }}}

" {{{ Reload vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost ~/.vim/vimrc source ~/.vim/vimrc
augroup END
" }}}

" {{{ Window and editor setup
let mapleader=','
" Display line numbers and rulers.
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
syntax on
" https://github.com/neovim/neovim/issues/5938
set mouse=a

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

" Splits open at the bottom and right
set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" }}}

" {{{ Colors
" Default color scheme
color badwolf
hi Folded guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
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

" Highlight JSON & es6 like Javascript
au BufNewFile,BufRead {*.json,*.es6} set ft=javascript

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=90 expandtab colorcolumn=79
" jinja the same as python for tabs
au FileType jinja setl softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType rst setl textwidth=80 expandtab colorcolumn=81

" Make ruby,scss,sass use 2 spaces for indentation.
au FileType {yaml,sass,scss,ruby,eruby} setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" php settings
au filetype php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120 foldmethod=syntax omnifunc=phpactor#Complete
let g:php_folding=1

" golang settings
au filetype go setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 noexpandtab colorcolumn=80

" Javascript settings
au FileType javascript setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=120

" markdown settings
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au FileType markdown setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=90 expandtab colorcolumn=79

" xml settings
au FileType xml setl softtabstop=8 shiftwidth=8 tabstop=8 textwidth=90 expandtab colorcolumn=79

" ansible
au BufRead,BufNewFile playbook.*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
" }}}

" {{{ FZF
" <leader><leader> didn't work when the config was in the vim-plug section...
" https://github.com/junegunn/dotfiles/blob/master/vimrc#L1721-L1761
if s:uname == "Linux"
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
endif
" }}}

" {{{ ncm2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}

" {{{ ncm2-ultisnips
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger            = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger       = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger      = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" }}}

" {{{ vim-airline
let g:airline_powerline_fonts = 1
" }}}

" {{{ vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'php', 'javascript']
let g:markdown_syntax_conceal = 1
" }}}

" {{{ phpactor
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>
" }}}

" {{{ ansible-vim
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_keywords_highlight = 1
" }}}

 " {{{ Custom Mappings
 nnoremap za zA
 nnoremap zA za
 " }}}

" {{{ custom commands
" open a terminal at the bottom of the window
command! Layout1 sp | wincmd w | wincmd J | te
" }}}

