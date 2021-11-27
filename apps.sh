#!/usr/bin/env zsh

################
#XCode CLI Tools
################
echo "XCode CLI Tools: Install starting..."
xcode-select --install

#########
#Homebrew
#########
if test ! $(which brew); then
  echo "Hombrew: Install starting..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#update brew in case brew is already installed
echo "Homebrew: Update..."
# brew update
/opt/homebrew/bin/brew update

echo "Homebrew: Installing packages..."

/opt/homebrew/bin/brew install git
/opt/homebrew/bin/brew install svn


/opt/homebrew/bin/brew tap homebrew/cask
/opt/homebrew/bin/brew tap homebrew/cask-drivers
/opt/homebrew/bin/brew tap homebrew/cask-fonts
/opt/homebrew/bin/brew tap isen-ng/dotnet-sdk-versions
/opt/homebrew/bin/brew tap jandedobbeleer/oh-my-posh

# https://github.com/Homebrew/homebrew-cask-fonts/tree/master/Casks
/opt/homebrew/bin/brew install font-open-sans
/opt/homebrew/bin/brew install font-cascadia-code-pl
/opt/homebrew/bin/brew install font-cascadia-mono-pl
/opt/homebrew/bin/brew install font-caskaydia-cove-nerd-font



#arch -x86_64 brew install mas
/opt/homebrew/bin/brew install mas
/opt/homebrew/bin/brew install mackup
/opt/homebrew/bin/brew install node
/opt/homebrew/bin/brew install trash

/opt/homebrew/bin/brew install dotnet-sdk
/opt/homebrew/bin/brew install powershell
/opt/homebrew/bin/brew install azure-cli

/opt/homebrew/bin/brew install oh-my-posh

/opt/homebrew/bin/brew install 1password
/opt/homebrew/bin/brew install 1password-cli
/opt/homebrew/bin/brew install alfred
/opt/homebrew/bin/brew install azure-data-studio
/opt/homebrew/bin/brew install beyond-compare
/opt/homebrew/bin/brew install drawio
/opt/homebrew/bin/brew install dropbox
/opt/homebrew/bin/brew install figma
/opt/homebrew/bin/brew install iterm2
/opt/homebrew/bin/brew install logitech-options
/opt/homebrew/bin/brew install microsoft-edge
/opt/homebrew/bin/brew install microsoft-remote-desktop
/opt/homebrew/bin/brew install microsoft-teams
/opt/homebrew/bin/brew install miro
/opt/homebrew/bin/brew install notion
/opt/homebrew/bin/brew install obsidian
/opt/homebrew/bin/brew install raindropio
/opt/homebrew/bin/brew install setapp
/opt/homebrew/bin/brew install snagit
/opt/homebrew/bin/brew install visual-studio-code
/opt/homebrew/bin/brew install zoom

/opt/homebrew/bin/brew install --cask raycast

                        # 1Password for Safari
mas install 824171161   #Affinity Designer
mas install 824183456   #Affinity Photo
mas install 1024640650  #CotEditor
mas install 975937182   #Fantastical
# mas install 600925318   #Parallels Client
mas install 405399194   #Kindle
mas install 462058435   #Microsoft Excel
mas install 462054704   #Microsoft Word 
mas install 462062816   #Microsoft PowerPoint 
mas install 784801555   #Microsoft OneNote
mas install 985367838   #Microsoft Outlook
mas install 1559269364  #Notion Web Clipper
mas install 823766827   #OneDrive
mas install 1549370672  #Save to Raindrop.io
mas install 1477385213  #Save to Pocket
mas install 1522267256  #Shareful
mas install 585829637   #Todoist
mas install 419330170   #Moom


# NVM
# TODO: need a check that works
if test ! $(which nvm); then
  echo "NVM: Install starting..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
fi


FILE="/Applications/GarageBand.app"
if [[ -e $FILE ]]; then
  trash $FILE
fi


FILE="/Applications/iMovie.app"
if [[ -e $FILE ]]; then
  trash $FILE
fi


FILE="/Applications/Keynote.app"
if [[ -e $FILE ]]; then
  trash $FILE
fi


FILE="/Applications/Numbers.app"
if [[ -e $FILE ]]; then
  trash $FILE
fi


FILE="/Applications/Pages.app"
if [[ -e $FILE ]]; then
  trash $FILE
fi
