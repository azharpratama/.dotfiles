brew tap homebrew/cask-fonts

# Install cask packages

apps=(
  aldente
  alfred
  appcleaner
  discord
  font-jetbrains-mono-nerd-font
  font-meslo-lg-nerd-font
  ghostty
  google-chrome
  hyperkey
  maccy
  miniconda
  obsidian
  obs
  rectangle
  the-unarchiver
  visual-studio-code
  zoom
)

brew install "${apps[@]}" --cask
