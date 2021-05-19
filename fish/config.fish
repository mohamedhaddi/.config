cd
fish_vi_key_bindings

#		    #
# === variables === #
#		    #
set -gx PATH /opt/homebrew/bin $HOME/.cargo/bin $HOME/.config/coc/extensions/coc-clangd-data/install/12.0.0/clangd_12.0.0/bin $PATH

#		  #
# === aliases === #
#		  #
alias v="~/nvim-osx64/bin/nvim"
funcsave v 

alias sv="sudo ~/nvim-osx64/bin/nvim"
funcsave sv 

alias vbg="v -c \"VimBeGood\""
funcsave vbg

alias iv="v ~/.config/nvim/init.vim"
funcsave iv

alias cf="v ~/.config/fish/config.fish"
funcsave cf

alias c="clang -Wall -Wextra -Werror"

function rm_caches
	rm -rf ~/Library/**.42_cache_bak_**; rm -rf ~/**.42_cache_bak_**; rm -rf ~/Library/**.42_cache_bak*; rm -rf ~/**.42_cache_bak*; rm -r ~/Library/Caches/*; rm ~/.zcompdump*; rm -rf ~/.*42_cache_bak*; rm -rf ~/Library/.*42_cache_bak*
end
funcsave rm_caches

function brew_cleanup
	brew update && brew upgrade && brew cleanup && brew doctor
end
funcsave brew_cleanup

function cleanup
	rm_caches
	brew_cleanup
end
funcsave cleanup

# Setting PATH for Python 3.9
# The original version is saved in /Users/haddi/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin" "$PATH"
