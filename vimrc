filetype plugin on
syntax on
set encoding=utf-8
let &t_ut=''

set number				
set relativenumber	
set linebreak			
set showbreak=>>>>		
set textwidth=69		
set showmatch			
set errorbells			
set visualbell			
set mouse=a

set hlsearch			
set ignorecase
set smartcase			
set incsearch

set wildmenu
set wildmode=longest:full,full
set wildoptions=pum

set autoindent			
set noexpandtab
set shiftwidth=4		
set tabstop=4
set softtabstop=4		
set splitright			
set splitbelow

set ruler			

set backupdir=/tmp
set directory=~/.vim/tmp,.

set undolevels=1000		
set backspace=indent,eol,start

" Folding configuration
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Visual cursor column for file types configuration
autocmd FileType yml	set cursorcolumn
autocmd FileType yaml	set cursorcolumn
autocmd FileType python	set cursorcolumn

"" Configuração de atalhos de teclado
" Configuração da tecla de '<leader>'
let mapleader="."
" let g:C_MapLeader = '\'

" Teclas principais de atalho

" Redesenhar a parte gráfica do Vim
" Dica: Redraw Graphics
noremap <unique><silent>	<Leader>rg		:!less<CR><CR>

" Alterna a verificação ortográfica da língua inglesa
" Dica: Spell Check English
noremap <unique><silent>	<Leader>sce		:set spelllang=en_gb spell!<CR>

" Reseta o destaque  de sintaxe
" Dica: Syntax Sync Clear
noremap <unique><silent>	<Leader>ssc		:syntax sync clear<CR>

" Limpeza da marcação deixada pela pesquisa de palavras
" Dica: Clear Search
noremap <unique><silent>    <Leader>cs		:nohlsearch<CR>

" Alternar entre mostrar a numeração de linha ou não mostrar
" Dica: Toggle Number Show
noremap <unique><silent>    <Leader>tns		:set nu!<CR>

" Alternar entre mostrar a numeração relativa de linha
" Dica: Toggle Relative Number
noremap <unique><silent>	<Leader>trn		:set relativenumber!<CR>

" Alternar entre mostrar o marcador de coluna
" Dica: Toggle Cursor Ruler
noremap <unique><silent>	<Leader>tcr		:set cursorcolumn!<CR>

" Abrir uma nova aba
" Dica: New TaB
noremap <unique><silent>    <Leader>ntb		:tabnew<CR>

" Fechar aba atual
" Dica: Close TaB
noremap <unique><silent>	<Leader>ctb		:tabclose<CR>

" Abrir uma divisão à direita
" Dica: New Vertical Split
noremap <unique><silent>    <Leader>nvs		:vsp<CR>

" Abrir uma divisão abaixo
" Dica: New Horizontal Split
noremap <unique><silent>    <Leader>nhs		:sp<CR>

" Desabilitar autoindentação dos formatos de arquivo
" Dica: Disable Auto Format
nnoremap <unique><silent>	<Leader>daf		:setl noai nocin nosi inde=<CR>

" Configuração da área de clipboard
" Copiar para área de clipboard
noremap <unique>	<Leader>y		"+y
" Colar da área de clipboard
noremap <unique>	<Leader>p		"+p
