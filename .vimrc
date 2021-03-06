execute pathogen#infect()

let mapleader = ","

" enable xml tag matching
runtime macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z="

" map upper-case Rename to lower-case Rename
cnoreabbrev rename Rename

" syntax highlighting preferences
syntax on
set background=dark
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_termcolors=16
colorscheme solarized

" Show trailing whitepace and spaces before a tab:                                                                                  
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen                                                                       
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ 

" shows hidden characters when requested
set listchars=tab:>-,trail:+,eol:$
nmap <silent> <leader>s :set nolist!<CR>

filetype on
filetype plugin on
filetype indent on
" for the css indentation plugin
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""
" HTML Settings
"""""""""""""""""""""""""""""""""""""""
" fixing the html indentation to be how I like it
let g:html_indent_inctags = "html,body,head,tbody"
"files to use html tag closing in
let g:closetag_filenames = "*.html,*.xhtml,*.js,*.jsx"

" omnicomplete code completion
set ofu=syntaxcomplete#Complete

" support for SyntaxComplete OMNI keywords
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \    if &omnifunc == "" |
        \        setlocal omnifunc=syntaxcomplete#Complete |
        \    endif
endif

"""""""""""""""""""""""""""""""""
" Search settings
"""""""""""""""""""""""""""""""""
set ignorecase " / search only case sensitive if capital in search
set smartcase " and * search still case sensitive
set hlsearch " highlights search terms
set incsearch " ... Dynamically as they are typed
map <leader>uh :let @/ = ""<CR>

" allows for enter and shift-enter when in command mode
map <CR> i<CR><Esc>

" switch ' and ` for use with marks. ' goes to exact mark position
nnoremap ' `
nnoremap ` '

set history=500 " Vim remembers more past commands
set hidden " allows better buffer management
set number " show line numbers
set autoindent " auto-indent
set wildmenu " shows all tab-completion options
set wildmode=list:longest " acts like terminal, completing as much as possible
set title " adds a custom title to the Vim window
set scrolloff=3 " increases buffer when scrolling off screen
set backspace=indent,eol,start " intuitive backspacing, whatever that means
runtime macros/matchit.vim " applies % switching to much more

" change window splitting behavior
set splitbelow
set splitright

" set up space indenting
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" Support for vim powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" always use unix file format. Specifically, line endings
set ff=unix

"delimit mate preferences
"imap <expr> <CR> delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : "<CR>"

" support for saving Vim global session by typing SQ
"nmap SQ <ESC>:mksession! ~/.vim/Session.vim<CR>:wqa<CR>
"function! RestoreSession()
    "if argc() == 0 "Vim called without arguments
        "execute 'source ~/.vim/Session.vim'
    "end
"endfunction
"autocmd VimEnter * call RestoreSession()

"""""""""""""""""""""""""""""""""""""""""
" Javascript settings
"""""""""""""""""""""""""""""""""""""""""
" jsx highlighting in javascript files
let g:jsx_ext_required=0
" allows jquery syntax highlighting in JavaScript
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" enable html and css highlighting in javascript files
let g:javascript_enable_domhtmlcss=1

"""""""""""""""""""""""""""""""""""""""""
" FileType specific settings
"""""""""""""""""""""""""""""""""""""""""
augroup json_autocmd 
	autocmd! 
	autocmd FileType json set autoindent 
	autocmd FileType json :setlocal formatoptions=tcq2l 
	autocmd FileType json set textwidth=80 
augroup END

augroup javascript_autocmd
    autocmd!
    autocmd FileType javascript set autoindent
    autocmd FileType javascript set textwidth=80
    " mapping for easy ; line endings
    autocmd FileType javascript inoremap <buffer> ;; <ESC>A;<CR>
augroup END

augroup java_autocmd
    autocmd!
    autocmd FileType java set autoindent
    autocmd FileType java set textwidth=80
    " mapping for easy ; line endings
    autocmd FileType java inoremap <buffer> ;; <ESC>A;<CR>
augroup END

augroup markdown_autocmd
    autocmd FileType markdown set textwidth=80
augroup END

augroup scheme_autocmd
    autocmd!
    autocmd FileType scheme set autoindent
augroup END

augroup css_autocmd
    autocmd FileType css inoremap <buffer> ;; <ESC>A;<CR>
augroup END

augroup cpp_autocmd
    autocmd!
    autocmd FileType cpp set autoindent
    autocmd FileType cpp set textwidth=80
    " mapping for easy ; line endings
    autocmd FileType cpp inoremap <buffer> ;; <ESC>A;<CR>
augroup END

augroup clojure_autocmd
    autocmd!
    autocmd FileType clojure set autoindent
    autocmd FileType clojure set textwidth=80
    " mapping for easy ; line endings
    autocmd FileType clojure inoremap <buffer> ;; <ESC>A;<CR>
augroup END

augroup tex_autocmd
    autocmd!
    autocmd FileType tex set autoindent
    autocmd FileType tex set textwidth=80
    autocmd FileType plaintex set autoindent
    autocmd FileType plaintex set textwidth=80
augroup END

augroup matlab_autocmd
    autocmd!
    autocmd FileType matlab set autoindent
augroup END

augroup arduino_group
    autocmd!
    autocmd FileType arduino set textwidth=80
augroup END

augroup verilog_autocmd
    autocmd!
    autocmd FileType verilog set autoindent
    autocmd FileType verilog set textwidth=80
augroup END
