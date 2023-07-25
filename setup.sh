#!/usr/bin/env bash

# =========
# Logging
# =========

error() {
    printf '%b\n' " - [$(date +'%m/%d/%y %H:%M:%S')] <Error>: $1"
}

info() {
    printf '%b\n' " - [$(date +'%m/%d/%y %H:%M:%S')] <Info>: $1"
}

# =========
# Variables
# =========

SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
pushd $SCRIPTS_DIR > /dev/null

SOURCE_DIR=$PWD
NVIM_DIR="${HOME}/.config/nvim"

# ==================
# Detect Environment
# ==================

OS=""
case $(uname) in
   Linux*)
    OS="Linux"
  ;;
  Darwin*)
    OS="Mac"
  ;;
  *)
    error "Unknown OS_TYPE: ${OS_TYPE}"
    exit 1
  ;;
esac

# ====================
# Detect Prerequisites
# ====================

info "Detecting if system has prereqs"
case "$OS" in
  Linux)
    [ "$(id -u)" -ne 0 ] && {
      error "In order to use this script, run with root or use sudo."
      exit 1
    }
  ;;
  Mac)
    [ "$(id -u)" -eq 0 ] && {
      error "In order to use this script, it must run without root nor sudo"
      exit 1
    }
    if ! command -v brew &> /dev/null; then
      error "In order to use this script, brew must be installed"
      exit 1
    fi
  ;;
esac


mkdir -p $NVIM_DIR

# NVIM
info "Installing nvim"
case "$OS" in
  Linux)
    apt-get install -y neovim
  ;;
  Mac)
    brew install -q neovim
  ;;
esac

info "Installing vim-plug"
curl -fsLo ~/.local/share/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install ohmy zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -sf ${SOURCE_DIR}/.config/nvim/init.vim ${NVIM_DIR}/init.vim
ln -sf ${SOURCE_DIR}/.config/nvim/coc.vim ${NVIM_DIR}/coc.vim
ln -sf ${SOURCE_DIR}/.config/nvim/coc-settings.json ${NVIM_DIR}/coc-settings.json

# BASH
ln -sf ${SOURCE_DIR}/.profile ${HOME}/.profile

[ "$OS" == "Mac" ] && {
  info "operasting system is a mac, we prefer zsh on mac (:"
  sleep 1
  cp ${SOURCE_DIR}/.zshrc ${HOME}/.zshrc
  ln -sf ${SOURCE_DIR}/.zshrc ${HOME}/.zshrc
}

# GIT
ln -sf ${SOURCE_DIR}/.gitconfig ${HOME}/.gitconfig
ln -sf ${SOURCE_DIR}/.gitconfig-github ${HOME}/.gitconfig-github
