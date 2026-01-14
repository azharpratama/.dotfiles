brew tap homebrew/cask-fonts

# Install cask packages

apps=(
  aldente
  alfred
  appcleaner
  discord
  docker
  font-jetbrains-mono-nerd-font
  font-meslo-lg-nerd-font
  ghostty
  google-chrome
  handbrake
  hyperkey
  maccy
  miniconda
  obsidian
  obs
  postman
  qbittorrent
  rectangle
  the-unarchiver
  tor-browser
  transnomino
  visual-studio-code
  zoom
)

brew install "${apps[@]}" --cask
