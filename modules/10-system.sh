#!/usr/bin/env bash

header

info "Módulo 1 - Preparação do Sistema"

check_root
check_internet
check_disk_space
check_overlay

info "Atualizando repositórios..."
sudo apt update

info "Atualizando pacotes..."
sudo apt -y upgrade

info "Instalando dependências..."

sudo apt install -y \
git \
dialog \
curl \
wget \
unzip \
build-essential \
cmake \
pkg-config \
python3 \
python3-pip \
alsa-utils \
joystick \
evtest

success "Sistema preparado."