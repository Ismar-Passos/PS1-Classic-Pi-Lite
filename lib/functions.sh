#!/usr/bin/env bash

check_root() {
    if [[ "$EUID" -ne 0 ]]; then
        error "Execute como root."
        exit 1
    fi
}

check_internet() {

    ping -c1 github.com >/dev/null 2>&1

    if [[ $? -ne 0 ]]; then
        error "Sem conexão com a Internet."
        exit 1
    fi

    success "Internet OK"

}

check_disk_space() {

    FREE=$(df --output=avail / | tail -1)

    MIN=$((3 * 1024 * 1024))

    if [ "$FREE" -lt "$MIN" ]; then
        error "Espaço insuficiente."
        exit 1
    fi
}

check_overlay() {

    if mount | grep -q overlay; then
        warning "OverlayFS detectado."

        warning "Desative o modo Read Only antes de continuar."

        exit 1
    fi
}