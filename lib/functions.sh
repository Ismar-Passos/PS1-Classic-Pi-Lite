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