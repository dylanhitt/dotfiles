#!/usr/bin/env bash

SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

pushd $SCRIPTS_DIR

SOURCE_DIR=$PWD
NVIM_DIR="${HOME}/.config/nvim"

mkdir -p $NVIM_DIR

# NVIM
ln -sf ${SOURCE_DIR}/.config/nvim/init.vim ${NVIM_DIR}/init.vim
ln -sf ${SOURCE_DIR}/.config/nvim/coc-settings.json ${NVIM_DIR}/coc-settings.json

# BASH
ln -sf ${SOURCE_DIR}/.profile ${HOME}/.profile

# GIT
ln -sf ${SOURCE_DIR}/.gitconfig ${HOME}/.gitconfig
ln -sf ${SOURCE_DIR}/.gitconfig-github ${HOME}/.gitconfig-github
