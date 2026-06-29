#!/usr/bin/env bash

#################################################
# PS1 Classic Pi Lite
# Version 0.1.0-alpha
#################################################

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$PROJECT_DIR/lib/colors.sh"
source "$PROJECT_DIR/lib/functions.sh"
source "$PROJECT_DIR/lib/logger.sh"

header

check_root
check_internet

info "Iniciando instalação..."

MODULES=(
    "10-system.sh"
    "20-retropie.sh"
    "30-emulationstation.sh"
    "40-pcsx.sh"
    "50-theme.sh"
    "60-optimize.sh"
    "70-assets.sh"
    "80-update.sh"
    "90-cleanup.sh"
)

for module in "${MODULES[@]}"; do
    info "Executando módulo: $module"
    bash "$PROJECT_DIR/modules/$module"
done

success "Instalação concluída."