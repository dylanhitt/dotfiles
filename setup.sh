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

# ========
# Utils
# ========

command_check() {
  if ! command -v $1 &> /dev/null; then
      error "In order to use this script, ${1} must be installed"
      exit 1
  fi
}

# =================
# Install Functions
# =================

install_nvim() {
  info "Installing nvim"
  mkdir -p $NVIM_DIR
  case "$OS" in
    Linux)
      apt-get install -y neovim
    ;;
    Mac)
      brew install -q neovim
    ;;
  esac
}

insatll_zsh() {
  brew install -q zsh
  chsh -s /opt/homebrew/bin/zsh

  info "Installing Oh My Zsh"
  if [ ! -d "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    info "Oh My Zsh already installed"
  fi
}

install_node() {
  info "Installing nodejs"
  case "$OS" in
    Linux)
      curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
      apt-get install -y nodejs
    ;;
    Mac)
      brew install -q nodejs
    ;;
  esac
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
ARCH=$(uname -m)
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
command_check curl
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
    command_check brew
  ;;
esac

# ====================
# Installation/Setup
# ====================

install_tools() {
  info "Installing all the things"
  case "$OS" in
    Linux)
      install_nvim
      install_node
    ;;
    Mac)
      install_nvim
      insatll_zsh
      install_node
    ;;
  esac
}

# install_tools

# =========
# Symlinks
# =========

info "Symlink dotfiles to ${HOME}"
sleep 3

# BASH
ln -sf ${SOURCE_DIR}/.profile ${HOME}/.profile

# ZSH
[[ ! -e ${HOME}/.zshrc ]] && cp ${SOURCE_DIR}/.zshrc ${HOME}/.zshrc
ln -sf ${SOURCE_DIR}/.zshrc ${HOME}/.zshrc

# NVIM
ln -sf ${SOURCE_DIR}/.config/nvim/init.lua ${NVIM_DIR}/init.lua
ln -sfh ${SOURCE_DIR}/.config/nvim/lua ${NVIM_DIR}/lua

# GIT
ln -sf ${SOURCE_DIR}/.gitconfig ${HOME}/.gitconfig
ln -sf ${SOURCE_DIR}/.gitconfig-github ${HOME}/.gitconfig-github
