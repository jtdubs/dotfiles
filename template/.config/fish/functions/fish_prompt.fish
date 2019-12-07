function fish_prompt
    set -q __fish_git_prompt_showupstream
    or set -g __fish_git_prompt_showupstream auto

    set_color 6eb78e
    echo -n $USER
    set_color d09857
    echo -n @(prompt_hostname)
    set_color c0c0c0
    echo -n :
    set_color 658fa2
    echo -n (prompt_pwd)
    set_color 6eb78e
    set git_prompt (__fish_git_prompt)
    test -z $git_prompt
    or echo -n "$git_prompt"
    set_color d07057
    echo -n ' $ '
    set_color normal
end
