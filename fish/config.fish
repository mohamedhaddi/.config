cd
fish_vi_key_bindings

#		    #
# === variables === #
#		    #
set -x PATH $PATH:$HOME/.cargo/bin
set -U WT "/mnt/c/Users/haddi/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json"
set -U WTP "/mnt/c/Users/haddi/AppData/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe/LocalState/settings.json"

#		  #
# === aliases === #
#		  #
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

#		    #
# === functions === #
#		    #
function wh
	cd "/mnt/c/Users/haddi/$argv"
end
funcsave wh

