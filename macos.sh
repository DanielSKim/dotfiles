#!/usr/bin/env zsh

# TODO: after the clone of .dotfiles, establish symbolic links
# TODO: make the logic more robust, loop through all the symbolic links that need to be created

my_link=/users/dsk/.zshrc
if [ -L ${my_link} ] ; then
   if [ -e ${my_link} ] ; then
      echo "${my_link} is a symbolic link"
   else
      echo "${my_link} is a broken symbolic link"
   fi
elif [ -e ${my_link} ] ; then
   echo "${my_link} is NOT a symbolic link"
else
   echo "${my_link} is missing"
   ln -sv /users/dsk/.dotfiles/.zshrc /users/dsk/
   echo "${my_link} symbolic link added"
fi


my_link=/users/dsk/.zprofile
if [ -L ${my_link} ] ; then
   if [ -e ${my_link} ] ; then
      echo "${my_link} is a symbolic link"
   else
      echo "${my_link} is a broken symbolic link"
   fi
elif [ -e ${my_link} ] ; then
   echo "${my_link} is NOT a symbolic link"
else
   echo "${my_link} is missing"
   ln -sv /users/dsk/.dotfiles/.zprofile /users/dsk/
   echo "${my_link} symbolic link added"
fi


# Remove apps from dock
defaults write com.apple.dock persistent-apps -array
killall "Dock" &> /dev/null

osascript -e 'tell application "System Preferences" to quit'

sudo -v

# Set computer name
sudo scutil --set ComputerName "dsk-mbp-2020-13"
sudo scutil --set HostName "dsk-mbp-2020-13"
sudo scutil --set LocalHostName "dsk-mbp-2020-13"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "dsk-mbp-2020-13"


#Disable the sound effects on boot
sudo nvram SystemAudioValue=" "

#Dark Mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

#Hide Menu Bar
#defaults write NSGlobalDomain "_HIHideMenuBar" -bool true

#Don't show Spotlight in menu bar
defaults remove com.apple.Spotlight "NSStatusItem Visible Item-0"


# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Sleep the display after 15 minutes
#sudo pmset -a displaysleep 15

# Disable machine sleep while charging
#sudo pmset -c sleep 0

# Set machine sleep to 5 minutes on battery
# sudo pmset -b sleep 5

# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk so the system state can still be restored in case of a
#    power failure.
sudo pmset -a hibernatemode 0



###############################################################################
# FINDER
###############################################################################

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library
# Show the /Volumes folder
# sudo chflags nohidden /Volumes

###############################################################################
# DOCK
###############################################################################

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Automatically hide and show the Dock
#defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding Dock delay
# defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
# defaults write com.apple.dock autohide-time-modifier -float 0



###############################################################################
# HOT CORNERS
###############################################################################
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner
defaults write com.apple.dock wvous-bl-corner -int 11
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom left screen corner
defaults write com.apple.dock wvous-br-corner -int 12
defaults write com.apple.dock wvous-br-modifier -int 0


###############################################################################
# SAFARI
###############################################################################

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true


###############################################################################
# APP STORE
###############################################################################

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true


###############################################################################
# MESSAGES
###############################################################################

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false



###############################################################################
# Kill affected applications
###############################################################################

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Messages" \
	"Safari" \
	"SystemUIServer" \
	"Terminal" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
Ss