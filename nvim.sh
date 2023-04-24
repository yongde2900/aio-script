#!/bin/bash
neovim_config ()
{
    echo -e "${YELLOW}set neovim config"
    if [[ -d "~/.config" ]]; then
      return 
    else
      mkdir ~/.config
    fi
    brew install neovim
   cp -r nvim ~/.config/

}
tmux_config(){
  echo -e "${YELLOW}set tmux config"
  cp ./.tmux.conf ~/
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}
neovim_config
tmux_config



