_box_get_command_list ()
{
    if [ -f bin/box ]; then
        bin/box --no-ansi | sed "1,/Available commands/d" | awk '/^  ?[^ ]+ / { print $1 }' && return 0
    fi
}

_box_get_image_list ()
{
    if [ -f box.yml ]; then
        cat box.yml |grep -E "^[ ]{4}[a-zA-Z]+_.*:" | cut -d ":" -f1 | awk '/^    [a-zA-Z_]+/ { print $1 }' && return 0
    fi
}

_box_command ()
{
    compadd `_box_get_command_list`
}

_box_image ()
{
    compadd `_box_get_image_list`
}

# compdef _box_command "box"
# compdef _box_command 'bb'

alias box='bin/box'
alias bb='bin/box'
