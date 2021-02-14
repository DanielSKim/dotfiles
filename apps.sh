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
brew update
/opt/homebrew/bin/brew update

echo "Homebrew: Installing packages..."
#/opt/homebrew/bin/brew install cask
/opt/homebrew/bin/brew install git
arch -x86_64 brew install mas
/opt/homebrew/bin/brew install mackup
/opt/homebrew/bin/brew install node
/opt/homebrew/bin/brew install trash

/opt/homebrew/bin/brew install alfred
/opt/homebrew/bin/brew install beyond-compare
/opt/homebrew/bin/brew install drawio
/opt/homebrew/bin/brew install fantastical
/opt/homebrew/bin/brew install figma
/opt/homebrew/bin/brew install iterm2
/opt/homebrew/bin/brew install microsoft-edge
/opt/homebrew/bin/brew install microsoft-teams
/opt/homebrew/bin/brew install miro
/opt/homebrew/bin/brew install notion
/opt/homebrew/bin/brew install setapp
/opt/homebrew/bin/brew install snagit
/opt/homebrew/bin/brew install visual-studio-code
/opt/homebrew/bin/brew install zoom


mas install 975937182   #Fantastical
mas install 600925318   #Parallels Client
mas install 1549370672  #Save to Raindrop.io
mas install 1477385213  #Save to Pocket
mas install 405399194   #Kindle
mas install 585829637   #Todoist
mas install 462058435   #Microsoft Excel
mas install 462054704   #Microsoft Word 
mas install 462062816   #Microsoft PowerPoint 
mas install 784801555   #Microsoft OneNote
mas install 985367838   #Microsoft Outlook
mas install 823766827   #OneDrive


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
