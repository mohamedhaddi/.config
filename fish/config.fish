cd
fish_vi_key_bindings

#		    #
# === variables === #
#		    #
set -x PATH $PATH:$HOME/.cargo/bin

#		  #
# === aliases === #
#		  #
alias v="~/nvim-osx64/bin/nvim"
funcsave v 

alias vbg="v -c \"VimBeGood\""
funcsave vbg

alias iv="v ~/.config/nvim/init.vim"
funcsave iv

alias cf="v ~/.config/fish/config.fish"
funcsave cf

alias cleanup="rm -rf ~/Library/**.42_cache_bak_** && rm -rf ~/**.42_cache_bak_** && rm -rf ~/Library/**.42_cache_bak* && rm -rf ~/**.42_cache_bak* && rm -r ~/Library/Caches/*; rm ~/.zcompdump* && brew update && brew upgrade && brew cleanup; brew doctor"
funcsave cleanup

