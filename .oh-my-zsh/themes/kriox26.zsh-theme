# make some aliases for the colors: (could use normal escape sequences too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

PR_PROMPT='➤'

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

#%{$fg_bold[white]%}╰─%{$fg_bold[white]%}$PR_PROMPT %{$fg[red]%}\$ % %{$reset_color%}'
PROMPT='%{$fg_bold[white]%}╭─ %{$fg[yellow]%}%~ %{$fg_bold[red]%}❯%{$fg_bold[yellow]%}❯%{$fg_bold[green]%}❯ %{$fg_bold[red]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
%{$fg_bold[white]%}╰─%{$fg_bold[white]%}$PR_PROMPT %{$fg[red]%}\$ % %{$reset_color%}'
RPROMPT='%{$fg_bold[magenta]%}Ruby:2.2.0 % %{$reset_color%}'

#${ret_status}%{$fg_bold[green]%}%p 

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[red]%})"
