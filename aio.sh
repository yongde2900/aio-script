#!/bin/bash

# Text Color Variables
GREEN='\033[32m'  # Green
YELLOW='\033[33m' # YELLOW
CLEAR='\033[0m'   # Clear color and formatting
echo "Start install"
echo -e "${GREEN}===>${CLEAR}Install Google Chrome"
echo -e "${GREEN}===>${CLEAR}Install Google Chrome"
echo -e "${GREEN}===>${CLEAR}Install Google Chrome"
echo -e "${GREEN}===>${CLEAR}Install Google Chrome"
echo -e "${GREEN}===>${CLEAR}Install Google Chrome"
echo -e "${GREEN}===>${CLEAR}Install Google Chrome"

# Setup script for setting up a new macos machine
install_dev_tools() {

    # Command Line Tools for Xcode
    echo "Install command line developer tools"
    xcode-select --install
    xcode-select -p &>/dev/null
    if [ $? -ne 0 ]; then
        echo "Xcode CLI tools not found. Installing them..."
        touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
        PROD=$(softwareupdate -l |
            grep "\*.*Command Line" |
            head -n 1 | awk -F"*" '{print $2}' |
            sed -e 's/^ *//' |
            tr -d '\n')
        softwareupdate -i "$PROD" -v
    else
        echo "Xcode CLI tools OK"
    fi

    ## Homebrew
    echo -e "${YELLOW}Install Homebrew${CLEAR}"
    CI=1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update

    ## Visual Studio Code
    echo -e "${YELLOW}Install Visual Studio Code${CLEAR}"
    brew install visual-studio-code

    ## mas-cli
    ## A simple command line interface for the Mac App Store. Designed for scripting and automation.
    echo -e "${YELLOW}Install mas-cli${CLEAR}"
    brew install mas

    

    ## Docker, Vagrant
    echo -e "${YELLOW}Install Docker & Vagrant${CLEAR}"
    brew install docker vagrant

    ## SourceTree
    echo -e "${YELLOW}Install SourceTree${CLEAR}"
    brew install --cask sourcetree

    ## iTerm2
    echo -e "${YELLOW}Install iTerm2${CLEAR}"
    brew install iterm2

    


    ## android-studio
    echo -e "${YELLOW}Install android-studio${CLEAR}"
    brew install --cask android-studio

    ## android-platform-tools (for adb usings)
    echo -e "${YELLOW}Install android-platform-tools${CLEAR}"
    brew install homebrew/cask/android-platform-tools

}

install_dev_software() {
    ## Python 3.x
    echo -e "${YELLOW}Install python-3.x${CLEAR}"
    brew install python

    ## watchman
    echo -e "${YELLOW}Install watchman ${CLEAR}"
    brew install watchman

    ## MongoDB
    echo -e "${YELLOW}Install MongoDB ${CLEAR}"
    brew tap mongodb/brew
    brew install mongodb-community@5.0

    ## nginx
    echo -e "${YELLOW}Install nginx${CLEAR}"
    brew install nginx

    ## git
    echo -e "${YELLOW}Install GIT${CLEAR}"
    brew install git
    git config --global user.email "com414141@gmail.com"
    git config --global user.name "yongde2900"
}

install_basic_tools() {
    ## Google Chrome
    echo -e "${YELLOW}Install Google Chrome${CLEAR}"
    brew install google-chrome

    ## Microsoft Edge
    echo -e "${YELLOW}Install Microsoft Edge${CLEAR}"

    ## Google Drive
    echo -e "${YELLOW}Install Google Drive${CLEAR}"
    brew install google-drive



    ## Zoom, Slack
    echo -e "${YELLOW}Install Zoom Slack${CLEAR}"
    brew install zoom slack

    ## Line
    echo -e "${YELLOW}Install Line${CLEAR}"
    mas install 539883307

    ## Notion
    echo -e "${YELLOW}Install Notion${CLEAR}"
    brew install notion
}
setup_zsh() {
    echo -e "${YELLOW}Install oh-my-zsh${CLEAR}"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    echo -e "${YELLOW}Set Z-Shell to default shell${CLEAR}"
    sudo chsh -s $(which zsh) $(whoami)

    echo -e "${YELLOW}Setup oh-my-zsh${CLEAR}"

    echo -e "${YELLOW}Install theme powerlevel10k${CLEAR}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    sed -i '' 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/' ~/.zshrc

    echo -e "${YELLOW}Install plugin zsh-completions${CLEAR}"
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
    sed -i '' 's/source $ZSH\/oh-my-zsh.sh/fpath\+=\${ZSH_CUSTOM\:-\${ZSH\:-~\/.oh-my-zsh}\/custom}\/plugins\/zsh-completions\/src\nZSH_DISABLE_COMPFIX=\"true\"\nsource $ZSH\/oh-my-zsh.sh/' ~/.zshrc
    
    echo -e "${YELLOW}Install plugin zsh-syntax-highlighting${CLEAR}"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    sed -i '' 's/plugins=(git/plugins=(git zsh-syntax-highlighting/' ~/.zshrc

    echo -e "${YELLOW}Install default plugins for python and docker${CLEAR}"
    sed -i '' 's/plugins=(git/plugins=(git python pip docker docker-compose/' ~/.zshrc
}


installnode() {
    echo -e "${YELLOW}Install nvm${CLEAR}"
    export NVM_DIR="$HOME/.nvm" && (
        git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"

    echo -e "${YELLOW}Install latest lts version${CLEAR}"
    nvm install --lts

    echo -e "${YELLOW}Enable corepack for yarn and pnpm${CLEAR}"
    corepack enable

    echo -e "${YELLOW}Add nvm config to zshrc${CLEAR}"
    echo "export NVM_DIR=\"\$([ -z \"\${XDG_CONFIG_HOME-}\" ] && printf %s \"\${HOME}/.nvm\" || printf %s \"\${XDG_CONFIG_HOME}/nvm\")\"" >> ~/.zshrc
    echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\" # This loads nvm" >> ~/.zshrc
    echo "" >> ~/.zshrc

    echo -e "${YELLOW}Install default node npm nvm yarn plugin for oh-my-zsh${CLEAR}"
    sed -i '' 's/plugins=(git/plugins=(git node npm nvm yarn/' ~/.zshrc
}

php_laravel_packages() {

    ## php
    echo -e "${YELLOW}Install php${CLEAR}"
    brew install php

    ## install php@7.2
    echo -e "${YELLOW}Install php@8.1${CLEAR}"
    brew tap shivammathur/php
    brew install shivammathur/php/php@8.1

    ## link to php@7.2
    echo -e "${YELLOW}Link to php@8.1${CLEAR}"
    brew unlink php
    brew link php@8.1

    ## mysql
    echo -e "${YELLOW}Install mysql${CLEAR}"
    brew install mysql

    ## start mysql
    echo -e "${YELLOW}Starting mysql${CLEAR}"
    brew services start mysql

    ## composer
    echo -e "${YELLOW}Install composer${CLEAR}"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    ## move to global use
    sudo mv composer.phar /usr/local/bin/composer

    ## Laravel
    echo -e "${YELLOW}Install Laravel${CLEAR}"
    composer global require "laravel/installer"

    echo -e "${YELLOW}Install default composer and laraval plugin for oh-my-zsh${CLEAR}"
    sed -i '' 's/plugins=(git/plugins=(git composer laravel laravel5/' ~/.zshrc
}
install_all() {
install_basic_tools
install_dev_software
install_dev_tools
setup_zsh
installnode
php_laravel_packages
}