ZSH_COMMAND_D_TOOLDIR=${ZSH_COMMAND_D_TOOLDIR-${0:A:h}}
ZSH_COMMAND_D_BASE_DIR="${XDG_DATA_HOME-$HOME/.local/share}/zsh/d"
ZSH_COMMAND_D_FILE="${ZSH_COMMAND_D_BASE_DIR}/.__d"

mkdir -p "$ZSH_COMMAND_D_BASE_DIR"

function d() {
    out=$(${ZSH_COMMAND_D_TOOLDIR}/rust/d/target/release/d ${ZSH_COMMAND_D_FILE} ${ZSH_COMMAND_D_TOOLDIR})
    if [[ -n $out ]]; then
        if [[ -n "$WIDGET" ]]; then
            BUFFER="$LBUFFER $out $RBUFFER"
            CURSOR="${#BUFFER}"
        else
            cd "$out"
        fi
    fi
}
zle -N d

function chpwd() {
    date '+%Y-%m-%dT%H:%M:%S%z' | paste - <(builtin pwd) >> "${ZSH_COMMAND_D_FILE}"
}

