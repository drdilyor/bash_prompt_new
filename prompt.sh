# disable venv's own prompt
VIRTUAL_ENV_DISABLE_PROMPT=true
GIT_PS1_SHOWDIRTYSTATE=1

_col() { echo -n "\[\033[$1m\]"; }
red="$(_col '0;31')"
orange="$(_col '0;93')"
cyanb="$(_col '1;96')"
greenb="$(_col '1;32')"
blue="$(_col '34;2')"
purple="$(_col '0;95')"
gray="$(_col '0;90')"
reset="$(_col 0)"

x_top="$blue┌"
x_center="$blue─"
x_bottom="$blue└"
x_cross="$red✗"
x_tick="$greenb✓"

PS1_time="$x_top(${orange}\A$blue)"
PS1_cwd="$x_center($cyanb\w$reset$blue)"
#PS1_user="$x_center($gray\u$blue)"
#PS1_user_host="$x_center($gray\u$reset@$gray\h$blue)"
PS1_git="\$(__git_ps1 \"$x_center$blue($purple%s$blue)\")"
PS1_venv="\$(if [ -n \"\$VENV_PROMPT\" ]; then echo \"$x_center($reset\$VENV_PROMPT$blue)\"; fi)"
PS1_exit="\$(if [[ \$_ec = 0 ]]; then echo \"$x_tick\"; else echo \"$x_cross\"; fi)"

export PS1="$PS1_time$PS1_cwd${PS1_user_host:-$PS1_user}$PS1_git$PS1_venv\n$x_bottom$x_center$PS1_exit$reset "
unset _col red orange cyanb greenb blue purple gray reset \
  x_top x_center x_bottom x_cross x_tick \
  PS1_time PS1_cwd PS1_user PS1_user_host PS1_git PS1_venv PS1_exit

PROMPT_COMMAND=__prompt_command
__prompt_command() {
  _ec="$?"
}
