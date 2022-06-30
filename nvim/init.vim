filetype plugin on
set guicursor=
set laststatus=2
set noshowmode
set number
set relativenumber
set encoding=UTF-8
set nohlsearch
set autoread
set termbidi
syntax on
let mapleader = " "
autocmd CursorHold,CursorHoldI * update
set updatetime=2000
set tabstop=4
set shiftwidth=4
set nofixendofline
"set softtabstop=0 expandtab smarttab
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.9/bin/python3'
let g:coc_global_extensions = [
            \ 'coc-clangd',
            \ 'coc-css', 
            \ 'coc-emmet', 
            \ 'coc-eslint', 
            \ 'coc-html', 
            \ 'coc-json',
            \ 'coc-markdownlint',
            \ 'coc-pairs',
            \ 'coc-tsserver',
            \ 'coc-highlight',
            \ 'coc-pyright',
            \ 'coc-svelte'
            \ ]

" === Installing plugins === "
call plug#begin('~/.config/nvim/plugged')

Plug 'SirVer/ultisnips',
Plug 'honza/vim-snippets',
Plug 'sheerun/vim-polyglot',
Plug 'itchyny/lightline.vim',
Plug 'christoomey/vim-system-copy',
Plug 'davidhalter/jedi-vim',
" Plug 'neoclide/coc.nvim',
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }},
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'turbio/bracey.vim',
Plug 'scrooloose/nerdtree',
Plug 'ryanoasis/vim-devicons',
Plug 'yuttie/comfortable-motion.vim',
Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'},
Plug 'cacharle/c_formatter_42.vim',
Plug 'unblevable/quick-scope',
Plug 'airblade/vim-rooter'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'github/copilot.vim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'leafOfTree/vim-svelte-plugin'

" Plug 'ThePrimeagen/vim-be-good',
" Plug 'Chiel92/vim-autoformat',
" Plug 'rhysd/vim-clang-format',
" Plug 'vim-syntastic/syntastic',
" Plug 'alexandregv/norminette-vim',
" Plug 'zxqfl/tabnine-vim'

call plug#end()

" === setting up color scheme === "
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif
colorscheme onedark
highlight Normal guibg=none
highlight NonText guibg=none

" === setting up neovim's integrated terminal === "
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
    split term://bash
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" === Setup Prettier command === "
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" source init.vim
nnoremap <leader>siv :source $HOME/.config/nvim/init.vim<CR>

" save file
map <leader>w :w<CR>

" highlight current line
set cursorline
hi CursorLine   cterm=underline ctermbg=NONE ctermfg=NONE gui=underline guibg=NONE guifg=NONE
"hi CursorColumn cterm=NONE ctermbg=white ctermfg=white guibg=white guifg=white

" block arrow keys 
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>
nnoremap <PageUp> :echo "No page up for you!"<CR>
vnoremap <PageUp> :<C-u>echo "No page up for you!"<CR>
inoremap <PageUp> <C-o>:echo "No page up for you!"<CR>
nnoremap <PageDown> :echo "No page down for you!"<CR>
vnoremap <PageDown> :<C-u>echo "No page down for you!"<CR>
inoremap <PageDown> <C-o>:echo "No page down for you!"<CR>

" Copilot cycling
imap ‘ <M-]>
imap “ <M-[>

" use alt+hjkl to move between split/vsplit panels
tnoremap ˙ <C-\><C-n><C-w>h
tnoremap ∆ <C-\><C-n><C-w>j
tnoremap ˚ <C-\><C-n><C-w>k
tnoremap ¬ <C-\><C-n><C-w>l
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

" remapping split windows vertical resize
nnoremap <C-L> :vertical resize +1<CR>
nnoremap <C-H> :vertical resize -1<CR>
nnoremap <C-K> :resize +1<CR>
nnoremap <C-J> :resize -1<CR>

" reload file to apply new changes
nnoremap <F5> :e!<CR>

" === comfortable-motion.vim === "
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
"let g:comfortable_motion_friction = 0.0
"let g:comfortable_motion_air_drag = 4.0
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
"nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
"nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
"nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<CR>
"nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <C-S-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-S-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion
"(remove backslashes) inoremap <expr> <cr> pumvisible() ? \"\<C-y>" : \"\<C-g>u\<CR>"

" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()

" go to definition, reference, implementation
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" insert line on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" make <cr> select the first completion item and confirm the completion when no item has been selected
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" make coc.nvim format your code on <cr>
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" === LeaderF === "
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_UseMemoryCache = 0

" === vim-polyglot === "
"let g:polyglot_disabled = ['autoindent']

" === NERDTree setup === "
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle file explorer with ctrl+x
nnoremap <silent> <C-x> :NERDTreeToggle<CR>

" === Bracey setup === "
" let g:bracey_server_path="http://localhost"
let g:bracey_server_port=8880
" let g:bracey_browser_command='xdg-open'
" let g:bracey_server_allow_remote_connections=1

" === VimBeGood === "
"let g:vim_be_good_delete_me_offset = 0

" === vim-autoformat === "
" format on save
" au BufWrite * :Autoformat

" === norminette-vim === "
" Enable norminette-vim (and clang)
let g:syntastic_c_checkers = ['norminette', 'clang']
let g:syntastic_aggregate_errors = 1

" Set the path to norminette (do no set if using norminette of 42 mac)
" let g:syntastic_c_norminette_exec = '~/.norminette/norminette.rb'

" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']

" Pass custom arguments to norminette
let g:syntastic_c_norminette_args = '-R CheckForbiddenSourceHeader'

" Check errors when opening a file (disable to speed up startup time)
let g:syntastic_check_on_open = 0

" Enable error list
let g:syntastic_always_populate_loc_list = 0

" Automatically open error list
let g:syntastic_auto_loc_list = 0

" Skip check when closing
let g:syntastic_check_on_wq = 0

" === quick-scope === "
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=154 cterm=underline

" === c_formatter_42 === "
" format on save
let g:c_formatter_42_format_on_save = 0

