git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git -C ~/.oh-my-zsh/custom/plugins clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
git -C ~/.oh-my-zsh/custom/plugins clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
git -C ~/.oh-my-zsh/custom/themes clone --depth=1 https://github.com/romkatv/powerlevel10k.git

cat >~/.zshrc <<\END
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=~/.oh-my-zsh
DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

ZSH_THEME="afowler"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.p10k.zsh
END

cat >~/.p10k.zsh <<\END
# put the content of your own .p10k.zsh here
END
