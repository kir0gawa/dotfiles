"-------------------------------------------------------------------------------
" kir0gawa's .vimrc
" Feel free to copycat
" What you need :)
"-------------------------------------------------------------------------------

" Plugin loading with pathogen
"-------------------------------------------------------------------------------
execute pathogen#infect()
" add the helps for the plugins in ~/.vim/bundle
execute pathogen#helptags()

" Filetype
"-------------------------------------------------------------------------------
set nocompatible           "disable vi compatibility for better filetype
filetype plugin on         "Allows vim to detect filetype
filetype plugin indent on  "Allow specific plugins based on filetype


" Colorscheme and appearance
"-------------------------------------------------------------------------------
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
syntax enable             "syntax highlighting on based on filetype
set cursorline        "show current line
set background=dark   "dark version of
colorscheme base16-solarized "modified solarized
set fdm=syntax        "folding method based on syntax
set showmatch         "show matching bracket
set number            "show line numbers
let g:xml_syntax_folding=1 "allow folding for xmls

" indentation /tabs
"-------------------------------------------------------------------------------
set expandtab     "spaces instead of tabs
set shiftwidth=4  "number of spaces for each step of indent
set softtabstop=4 "number of spaces that a tab counts for
set autoindent    "Copy indent from current line when starting a new line
set backspace=indent,eol,start "backspace over autoindent, linebreaks and insert

"set 4 tabs when editing python
autocmd FileType python set sw=4 sts=4 ts=4 tabstop=4 noexpandtab


" status bar configuration
"-------------------------------------------------------------------------------
set ruler "show line and column number
set laststatus=2 "always show last status
set statusline=%<%f%h%w%m%r%=%y\ %l,%c\ %P "see :help statusline
set showcmd "show entered command


" Search options
"-------------------------------------------------------------------------------
set hlsearch "highlight searched items
set smartcase "ignore case only when putting on a lowercase
set incsearch "start search when typing

" Show hidden tabs or trailing spaces
set listchars=tab:▸\ ,nbsp:_,trail:⍨
set list

" See :help fo-table
set formatoptions+=r "multi comment when in insert mode
set formatoptions+=q "allows formatting of comments
set formatoptions+=c "allows automatic formatting of comments


" Go back to laster cursor position for each opened file
"-------------------------------------------------------------------------------
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


" Shows column limit based on coding styles (80 chars)
"-------------------------------------------------------------------------------
let g:show_column_limit='off'
function! ToggleShowColumnLimit()
  if g:show_column_limit == 'off'
    set colorcolumn=80,100
    let g:show_column_limit='on'
  else
    set colorcolumn=0
    let g:show_column_limit='off'
  endif
endfunction

" Toggle background color easily
"-------------------------------------------------------------------------------
function! ToggleBackgroundColor()
  if &background == 'dark'
      set background=light
  else
      set background=dark
  endif
endfunction

" Toggle mouse on/off
"-------------------------------------------------------------------------------
function! ToggleMouse()
  if &mouse == 'a'
      set mouse=
      echo 'mouse disabled'
  else
      set mouse=a
      echo 'mouse enabled'
  endif
endfunction

" Remove trailing whitespaces (thanks vimcasts.org)
function! <SID>StripTrailingWhitespaces()
    " Preparation : save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Open the Url passed as argument (thanks tpope)
function! OpenURL(url)
    exe "silent !x-www-browser \"".a:url."\""
    redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

" Autocomplete for some symbols
"-------------------------------------------------------------------------------
"comma always followed by a space
inoremap  ,  ,<Space>
""left brace/bracket always followed by right one
inoremap { {}<Left>

" Keybindings
"-------------------------------------------------------------------------------
"stop search higlight when hitting return key
nnoremap <CR><CR> :nohlsearch<CR>

let mapleader=","

" Insert a blank line below selected line
nnoremap <leader><CR> o<Esc>

" Controlp keybindings
nnoremap <silent> <Leader>o :CtrlP<CR>

" YouCompleteMe keybindings
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Taghighlight keybing
nnoremap <leader>tt :UpdateTypesFile<CR>

" Toggle spellchecking (from vimcasts.org)
nmap <leader>s :set spell!<CR>
set spelllang=en_gb " Set region to British English

" UltiSnip keybindings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" show columns for max length rules
nnoremap <leader>v :call ToggleShowColumnLimit()<CR>

" toggle background color for less eye hurting
nnoremap <leader>b :call ToggleBackgroundColor()<CR>

" toggle mouse in terminal
nnoremap <leader>m :call ToggleMouse()<CR>

" jump back and forth between files
nnoremap <leader><leader> <C-^>

" remove trailing whitespaces
nnoremap <leader>w :call <SID>StripTrailingWhitespaces()<CR>

" show element for syntax highlighting for finer tuning
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F3> :echo "hi<" . synIDattr(synID(line("."), col("."), 1), "name") . '> trans<'
            \ . synIDattr(synID(line("."), col("."), 0), "name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name") . ">"<CR>

" better window resizing : maps Alt-[h,j,k,l] to resizing a window split
nnoremap <C-h> <C-w><
nnoremap <C-k> <C-W>-
nnoremap <C-j> <C-W>+
nnoremap <C-l> <C-w>>

" search current word under cursor (found on tpopes vimrc)
nnoremap gs :OpenURL https://www.duckduckgo.com/search?q=<cword><CR>
" if we are doing cpp, use different search
autocmd FileType cpp nnoremap gs :OpenURL http://www.cplusplus.com/search.do?q=<cword><CR>

" YouCompleteMe settings
"-------------------------------------------------------------------------------
let g:ycm_enable_diagnostic_signs = 0 "disable ugly error bar
" close annoying preview window after completion
let g:ycm_autoclose_preview_window_after_completion = 1

" Store temporary files in a central spot
"------------------------------------------------------------------------------
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
