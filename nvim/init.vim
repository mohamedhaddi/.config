" === vim-polyglot === "
"let g:polyglot_disabled = ['autoindent']

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
"set softtabstop=0 expandtab smarttab
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'
let g:coc_global_extensions = [
			\ 'coc-clangd',
			\ 'coc-css',
			\ 'coc-emmet',
			\ 'coc-eslint',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-markdownlint',
			\ 'coc-pairs',
			\ 'coc-prettier',
			\ 'coc-tsserver',
			\ 'coc-highlight',
			\ 'coc-python',
			\ 'coc-pyright'
			\ ]

" === Installing plugins === "
call plug#begin('~/.config/nvim/plugged')

" Plug 'roxma/nvim-completion-manager'
" NCM2, formerly known as nvim-completion-manager, is a slim, fast and hackable completion framework for neovim.
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-system-copy'
if has('nvim')
	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/denite.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'davidhalter/jedi-vim',
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}
Plug 'turbio/bracey.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'yuttie/comfortable-motion.vim'
Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'Chiel92/vim-autoformat'
" Plug 'rhysd/vim-clang-format'
Plug 'cacharle/c_formatter_42.vim'
Plug 'vim-syntastic/syntastic'
Plug 'alexandregv/norminette-vim'
Plug 'unblevable/quick-scope'

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

" === WSL yank support === "
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
	augroup WSLYank
		autocmd!
		" autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, \"\<CR>")).' | '.s:clip)
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system('cat |' . s:clip, @0) | endif
	augroup END
end

" === Setup Prettier command === "
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

map <leader>w :w<CR>
nnoremap <c-z> <nop>
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

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" remapping split windows vertical resize
nnoremap <C-S-l> :vertical resize +1<CR>
nnoremap <C-S-h> :vertical resize -1<CR>
nnoremap <C-S-k> :resize +1<CR>
nnoremap <C-S-j> :resize -1<CR>

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
inoremap <expr> <A-S-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <A-S-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion
"(remove backslashes) inoremap <expr> <cr> pumvisible() ? \"\<C-y>" : \"\<C-g>u\<CR>"

" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()

" go to definition, reference, implementation
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" insert line on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" make <cr> select the first completion item and confirm the completion when no item has been selected
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" make coc.nvim format your code on <cr>
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" === Denite shorcuts === "
"   <leader>;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap <leader>; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   .             - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	imap <silent><buffer> <leader>
				\ <Plug>(denite_filter_quit)
	inoremap <silent><buffer><expr> <Esc>
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Esc>
				\ denite#do_map('quit')
	inoremap <silent><buffer><expr> <CR>
				\ denite#do_map('do_action')
	inoremap <silent><buffer><expr> <C-t>
				\ denite#do_map('do_action', 'tabopen')
	inoremap <silent><buffer><expr> <C-v>
				\ denite#do_map('do_action', 'vsplit')
	inoremap <silent><buffer><expr> <C-h>
				\ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>
				\ denite#do_map('do_action')
	nnoremap <silent><buffer><expr> q
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Esc>
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> d
				\ denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p
				\ denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> i
				\ denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <C-o>
				\ denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <C-t>
				\ denite#do_map('do_action', 'tabopen')
	nnoremap <silent><buffer><expr> <C-v>
				\ denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> <C-h>
				\ denite#do_map('do_action', 'split')
endfunction

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" === Denite setup ==="
" Wrap in try/catch to avoid errors on initial install before plugin is available
try
	" Use ripgrep for searching current directory for files
	" By default, ripgrep will respect rules in .gitignore
	"   --files: Print each file that would be searched (but don't search)
	"   --glob:  Include or exclues files for searching that match the given glob
	"            (aka ignore .git files)
	"
	call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

	" Use ripgrep in place of "grep"
	call denite#custom#var('grep', 'command', ['rg'])

	" Custom options for ripgrep
	"   --vimgrep:  Show results with every match on it's own line
	"   --hidden:   Search hidden directories and files
	"   --heading:  Show the file name above clusters of matches from each file
	"   --S:        Search case insensitively if the pattern is all lowercase
	call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

	" Recommended defaults for ripgrep via Denite docs
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])

	" Remove date from buffer list
	call denite#custom#var('buffer', 'date_format', '')

	" Custom options for Denite
	"   auto_resize             - Auto resize the Denite window height automatically.
	"   prompt                  - Customize denite prompt
	"   direction               - Specify Denite window direction as directly below current pane
	"   winminheight            - Specify min height for Denite window
	"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
	"   prompt_highlight        - Specify color of prompt
	"   highlight_matched_char  - Matched characters highlight
	"   highlight_matched_range - matched range highlight
	let s:denite_options = {'default' : {
				\ 'split': 'floating',
				\ 'start_filter': 1,
				\ 'auto_resize': 1,
				\ 'source_names': 'short',
				\ 'prompt': 'λ ',
				\ 'highlight_matched_char': 'QuickFixLine',
				\ 'highlight_matched_range': 'Visual',
				\ 'highlight_window_background': 'Visual',
				\ 'highlight_filter_background': 'DiffAdd',
				\ 'winrow': 1,
				\ 'vertical_preview': 1
				\ }}

	" Loop through denite options and enable them
	function! s:profile(opts) abort
		for l:fname in keys(a:opts)
			for l:dopt in keys(a:opts[l:fname])
				call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
			endfor
		endfor
	endfunction

	call s:profile(s:denite_options)
catch
	echo 'Denite not installed. It should work after running :PlugInstall'
endtry

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
let g:vim_be_good_delete_me_offset = 0

" === vim-autoformat === "
" format on save
" au BufWrite * :Autoformat

" === norminette-vim === "
" Enable norminette-vim (and clang)
let g:syntastic_c_checkers = ['norminette', 'clang']
let g:syntastic_aggregate_errors = 1

" Set the path to norminette (do no set if using norminette of 42 mac)
let g:syntastic_c_norminette_exec = '~/.norminette/norminette.rb'

" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']

" Pass custom arguments to norminette
let g:syntastic_c_norminette_args = '-R CheckForbiddenSourceHeader'

" Check errors when opening a file (disable to speed up startup time)
let g:syntastic_check_on_open = 1

" Enable error list
" let g:syntastic_always_populate_loc_list = 1

" Automatically open error list
" let g:syntastic_auto_loc_list = 1

" Skip check when closing
let g:syntastic_check_on_wq = 0


" === quick-scope === "
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=154 cterm=underline
