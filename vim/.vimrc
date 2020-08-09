set encoding=utf-8 "Ставит кодировку UTF-8 
set nocompatible "Отключает обратную совместимость с Vi и прочими
syntax enable "Включает подсветку синтаксиса
set number relativenumber "Включает номера строк
set expandtab "Меняет Tab на пробелы
set tabstop=2 "Ширина Tab'a = 2 пробелам
set softtabstop=2
set shiftwidth=2
set hlsearch "подсветка при поиске
set smartindent "умный автоотступ
set mouse=a "Позволяет мышь


set colorcolumn=100 "добавляет справа серый столбик на 100 симвле

set wrap linebreak nolist " Данная вариация работает как wrap, но переносит строчки не посимвольно, а по словам
set ttimeoutlen=1 "Понижаем задержку ввода escape последовательностей


set autoread " перечитывать изменённые файлы автоматически
"" Автоматически перечитывать конфигурацию VIM после сохранения
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
"set noswapfile


"НАСТРОЙКИ ПОИСКА ТЕКСТА В ОТКРЫТЫХ ФАЙЛАХ
set ignorecase " ics - поиск без учёта регистра символов
set nohlsearch " (не)подсветка результатов поиска (после того, как поиск закончен и закрыт)
set incsearch " поиск фрагмента по мере его набора


" поиск выделенного текста (начинать искать фрагмент при его выделении)
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
vnoremap <silent># <ESC>:call VisualSearch()<CR>?<C-R>/<CR>


"Статусная строка
set laststatus=2 
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


"Отображенеи пробелов
set list
set lcs+=space:·


"autocomplition
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType tt2html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
set completeopt=menu


"Переключение между окнами
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if(match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction


set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz "для того, чтоб командный режим понимал русскую раскладку


colorscheme wombat


call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mhartington/oceanic-next'
Plug 'vim-scripts/Wombat'
Plug 'joshdick/onedark.vim'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'valloric/MatchTagAlways'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
"ysiw - to add
"ds - to remove
"cs - to change




call plug#end()


"mappimgs---------------------------
map <C-n> :NERDTreeToggle<CR>
nmap j gj
nmap < DOWN> gj
nmap k gk
nmap < UP> gk
