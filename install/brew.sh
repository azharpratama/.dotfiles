# Install Homebrew

/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

# Install packages

apps=(
  bat
  fd
  ffmpeg 
  ffmpegthumbnailer 
  fnm
  fzf
  gcc
  git
  go
  gradle
  haskell-stack
  imagemagick
  jdtls
  jq
  lazygit
  neofetch
  neovim
  openjdk
  poppler
  postgresql@16
  ripgrep
  rustup
  sevenzip
  starship
  stow
  thefuck
  tmux
  tree
  wget
  yazi
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting
)

brew install "${apps[@]}"
