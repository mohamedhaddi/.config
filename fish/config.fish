cd
fish_vi_key_bindings

#				#
# === variables === #
#				#
set -gx PATH $HOME/.cargo/bin $HOME/.config/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin $HOME/c_formatter_42 $PATH
set -U WT "/mnt/c/Users/haddi/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json"
set -U WTP "/mnt/c/Users/haddi/AppData/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe/LocalState/settings.json"

#			#
# === aliases === #
#			#
alias v="nvim"
funcsave v

alias vbg="v -c \"VimBeGood\""
funcsave vbg

alias iv="v ~/.config/nvim/init.vim"
funcsave iv

alias cf="v ~/.config/fish/config.fish"
funcsave cf

alias ctf="cd /mnt/c/Users/haddi/Downloads/CTF"
funcsave ctf

alias c="clang -Wall -Wextra -Werror"
funcsave c

alias norminette="~/.norminette/norminette.rb"

#				#
# === functions === #
#				#
function wh
	cd "/mnt/c/Users/haddi/$argv"
end
funcsave wh

