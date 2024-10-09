call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'jalvesaq/Nvim-R'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'preservim/nerdtree'
call plug#end()
set guifont=Ubuntu\ Mono\ 11
set nu
colorscheme toast
set background=dark
highlight LineNr guibg=#babaca
highlight LineNr guifg=#6e6e6e
set laststatus=2
"autocmd VimEnter * NERDTree
au VimEnter * wincmd l
let R_auto_start = 2
let R_insert_mode_cmds = 1

" Customization

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).

" Mode settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Status line color (if not using powerline/vim-airline):
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=magenta
  elseif a:mode == 'r'
    hi statusline guibg=blue
  else
    hi statusline guibg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=green

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
