set encoding=utf-8
set shell=zsh
set updatetime=300
if has("syntax")
  syntax on
endif
set nocompatible              " be iMproved
filetype off                  " required!


"" For old compilers, link to newer gcc for YCM
if filereadable('/usr/local/gcc/bin/gcc')
let $LD_LIBRARY_PATH='/usr/local/gcc/lib:/usr/local/gcc/lib64:' . $LD_LIBRARY_PATH
endif

"set termguicolors
" Enable true color 启用终端24位色
"if exists('+termguicolors')
"  set termguicolors
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif
set termguicolors
"set rtp+=~/.vim/plugged/palenight.vim
set rtp+=~/.vim/plugged/gruvbox
set rtp+=~/.vim/plugged/onedark.vim
set rtp+=~/.fzf
call plug#begin('~/.vim/plugged')

Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteme'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'git://github.com/jiangmiao/auto-pairs.git'
Plug 'alvan/vim-closetag'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'prabirshrestha/vim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

filetype plugin indent on     " required!

" set paste mode toggle
set pastetoggle=<F2>
" Misc {{{
set ttyfast                     " faster redraw
set backspace=indent,eol,start
" }}}
set ruler
syntax enable
set smartindent
set tabstop=4
set shiftwidth=4
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline          " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldlevel=99
"set foldenable          " don't fold files by default on open
nnoremap <space> za

" Leader Shortcuts {{{
let mapleader=","
"nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>t :tab tjump <C-r><C-w><CR> 
"1
nnoremap <leader>r <c-t>
"1
nnoremap <leader>w :NERDTree<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>eb :vsp ~/.bashrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
lnoremap <leader>sb :! source ~/.bashrc<CR>
nnoremap <leader>p :set paste<CR>
nnoremap <leader>np :set nopaste<CR>
"1
nnoremap <leader><space> :noh<CR>
map f <Plug>(easymotion-overwin-f2)
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)
map <leader>d <Plug>(easymotion-bd-w)
nmap <leader>d <Plug>(easymotion-overwin-w)
"nnoremap <leader>1 :set number!<CR>
"nnoremap <leader>d :Make! 
"nnoremap <leader>r :call RunTestFile()<CR>
"nnoremap <leader>g :call RunGoFile()<CR>
"vnoremap <leader>y "+y
"vmap v <Plug>(expand_region_expand)
"vmap <C-v> <Plug>(expand_region_shrink)
inoremap jk <esc>
" }}}
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
set laststatus=2
" NERDTree {{{
"let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
let NERDTreeWinSize=20
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" }}}
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
let python_highlight_all = 1
au BufNewFile,BufRead *.py
    \ set tabstop=4  |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
"    \ set textwidth=100  |
    \ set expandtab |
    \ set autoindent    |
    \ set fileformat=unix   |
highlight BadWhitespace ctermbg=red guibg=darkred

" Webicon {{{
"let g:webdevicons_enable = 1
"let g:webdevicons_enable_nerdtree = 1
"let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_airline_tabline = 0
let g:webdevicons_enable_airline_statusline = 0
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
" }}}

" Closetag {{{
let g:closetag_filenames = '*.html,*.xhtml,*.ptml,*.js,*.jsx'
let g:closetag_shortcut = '>'
" }}}
"
" YCM {{{
let g:loaded_youcompleteme = 1
map <F3> :YcmCompleter GoTo<CR>
map <leader>G :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>D :YcmCompleter GoToDeclaration<CR>
map <leader>R :YcmCompleter GoToReferences<CR>
map <leader>H :YcmCompleter GoToInclude<CR>
map <leader>L :YcmCompleter GetDoc<CR>
map <leader>S :YcmCompleter GoToSymbol 
"}}}

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg -tcpp -tc -thtml --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Rg command with preview window
"command! -bang -nargs=* Rg
"\ call fzf#vim#grep(
"\ 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(), 1,
"\ fzf#vim#with_preview(), 0)

nmap <leader>fz :FZF<CR>
nmap <leader>rg :RG<CR>

nnoremap <silent><leader>fa :FZF -q <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent><leader>ra :RG <C-R>=expand("<cword>")<CR><CR>
let g:fzf_layout = { 'down': '~40%' }


"coc-nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" bases
nn <silent> <space>b :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> <space>B :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nn <silent> <space>d :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> <space>D :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> <space>h :call CocLocations('ccls','$ccls/call')<cr>
" callee
"nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" caller
"nn <silent> <leader>c :call CocLocations('ccls','$ccls/call')<cr>
" callee
"nn <silent> <leader>C :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>
"
let g:lsp_cxx_hl_use_text_props = 1

"Terminal
set termwinsize=0x70
nnoremap <leader>t :bo vertical terminal<cr>
tnoremap <silent> <c-h> <c-w>h
tnoremap <silent> <c-j> <c-w>j
tnoremap <silent> <c-k> <c-w>k
tnoremap <silent> <c-l> <c-w>l
tnoremap <silent> <c-b> <c-w>N

"Copy to and from system clipboard
noremap <silent> <leader>y "+y
noremap <silent> <leader>p "+p

"color
"colorscheme dracula
set background=dark
"colorscheme palenight
"let g:gruvbox_italic=1
"colorscheme gruvbox
colorscheme onedark
"colorscheme one

" Italics for my favorite color scheme
"let g:palenight_terminal_italics=1
let g:onedark_allow_italics = 1
