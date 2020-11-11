# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

case $- in
	*i*) ;;
	*) return;;
esac

for file in ~/.{aliases,functions,path,dockerfunc,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file

## oh-my-zsh
if [ ! -d $ZSH/custom/plugins/zsh-syntax-highlighting ] && [ -d $ZSH ]
then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
fi

if [ -d $ZSH ]
then
  plugins=(git vi-mode kubectl zsh-syntax-highlighting golang tmux z)
  source $ZSH/oh-my-zsh.sh
  if [ -r /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme ]
  then
    source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
  fi
fi


## completions
# jx command completion
if [ command -v jx ]
then
  source <(jx completion zsh)
fi
compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
