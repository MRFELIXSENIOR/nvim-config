set nocompatible
filetype plugin off
call plug#begin()

Plug 'drewtempelmeyer/palenight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug '907th/vim-auto-save'
Plug 'hdiniz/vim-gradle'
Plug 'preservim/nerdtree'

call plug#end()
filetype plugin indent on
colors palenight

syn on
set enc=utf-8
set shortmess+=c
set signcolumn=number
set clipboard=unnamedplus
set nu
set is
set si
set hls
set ts=4 sts=4
set sw=4
set mouse=a
set smarttab
set autoindent
set noswapfile
set expandtab
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

nmap <space>x <Cmd>NERDTreeToggle<CR>
nmap <space>` <Cmd>e $MYVIMRC<CR>
nmap <C-z> undo<CR>
nmap <C-t> <Cmd>bnext<CR>
nmap <C-d> <Cmd>bwipeout<CR>

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:auto_save                       = 1
let g:auto_save_events                = ["CursorHold"]

let g:NERDTreeIgnore                  = ['^node_modules$']
let g:NERDTreeGitStatusWithFlags      = 1
let g:NERDTreeWinSize                 = 25

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts=1

let g:coc_global_extension = [
			\'coc-css',
			\'coc-clangd',
            \'coc-html',
			\'coc-json',
            \'coc-tsserver',
            \'coc-prettier',
            \'coc-lua',
            \'coc-eslint',
            \'coc-jedi',
            \'coc-go',
            \'coc-java',
            \'coc-snippets',
            \'coc-discord-rpc',
            \'coc-pairs',
            \]

set hidden
set nowritebackup
set nobackup
set cmdheight=2
set updatetime=300

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
