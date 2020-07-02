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

#function git_branch
#    set -g git_branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)
#
#    if [ $status -ne 0 ]
#        set -ge git_branch
#        set -g git_dirty_count 0
#    else
#        set -g git_dirty_count (git status --porcelain  | wc -l | sed "s/ //g")
#    end
#end
#funcsave git_branch

#function fish_prompt
#   set_color $fish_color_cwd
#   printf ' ╔═◯ %s' (prompt_pwd)
#   set_color normal
#   # Line 2
#   set_color $fish_color_cwd
#   echo
#   if test $VIRTUAL_ENV
#       printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
#   end
#   printf ' ╚═▷ '
#   set_color normal
#end
function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -l normal (set_color normal)

    set -l special (set_color 90A4AE)
    set -l me (set_color 1976D2)
    set -l host (set_color 80CBC4)
    set -l pwd (set_color 26A69A)
    set -l branch (set_color 00BCD4)

  # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l prefix
    set -l suffix '$'
    if contains -- $USER root toor
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

  # Remove branch pwd from home directory
    if test $PWD = $HOME || [ ! -d "$PWD/.git/" ]
      set -g gitbranch ''
    else
      set -g gitbranch (fish_vcs_prompt)
    end

  # If we're running via SSH, change the host color.
    set -l color_host $fish_color_host
    if set -q SSH_TTY
        set color_host $fish_color_host_remote
    end

  # Write pipestatus
    set -l prompt_status (__fish_print_pipestatus " [" "]" "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)

  echo -n -s $special "[" $me "$USER" $special "@" $host (prompt_hostname) $normal ' ' $pwd (prompt_pwd) $branch $gitbranch $normal $prompt_status $special "]" $normal $suffix " "
end
funcsave fish_prompt 
