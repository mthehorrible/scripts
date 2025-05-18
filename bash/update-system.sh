#!/bin/bash

#Set colors
CYAN='\033[0;36m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

### apt
printf "\n${MAGENTA}APT${NC}\n"
if command -v apt >/dev/null 2>&1 ; then
    printf "${CYAN}apt update${NC}\n"
    sudo apt update
    printf "\n${CYAN}apt upgrade${NC}\n"
    sudo apt upgrade
    printf "\n${CYAN}apt autoremove${NC}\n"
    sudo apt autoremove
    # Ubuntu 14.04 needs sudo apt-get autoremove #apt 1.0.1ubuntu2.24
else
    echo "apt not installed"
fi

### dnf
printf "\n${MAGENTA}DNF${NC}\n"
if command -v dnf >/dev/null 2>&1 ; then
    printf "${CYAN}dnf update${NC}\n"
    sudo dnf update
    printf "\n${CYAN}dnf autoremove${NC}\n"
    sudo dnf autoremove
    printf "\n${CYAN}dnf clean all${NC}\n"
    sudo dnf clean all
else
    echo "dnf not installed"
    printf "\n${MAGENTA}YUM${NC}\n"
    if command -v yum >/dev/null 2>&1 ; then
        printf "${CYAN}yum update${NC}\n"
        sudo yum update
    else
        echo "yum not installed"
    fi
fi

### rpm-ostree
printf "\n${MAGENTA}RPM-OSTREE${NC}\n"
if command -v rpm-ostree >/dev/null 2>&1 ; then
    printf "${CYAN}rpm-ostree upgrade${NC}\n"
    sudo rpm-ostree upgrade
else
    echo "rpm-ostree not installed"
fi

### yay
printf "\n${MAGENTA}YAY${NC}\n"
if command -v yay >/dev/null 2>&1 ; then
    printf "${CYAN}yay -Syu${NC}\n"
    yay -Syu
else
    echo "yay not installed"
fi

### flatpak
printf "\n${MAGENTA}Flatpak${NC}\n"
if command -v flatpak >/dev/null 2>&1 ; then
    printf "${CYAN}flatpak update (system)${NC}\n"
    sudo flatpak update
    printf "${CYAN}flatpak update (user)${NC}\n"
    flatpak update
else
    echo "flatpak not installed"
fi

### snap
printf "\n${MAGENTA}Snap${NC}\n"
if command -v snap >/dev/null 2>&1 ; then
    printf "${CYAN}snap refresh${NC}\n"
    sudo snap refresh
else
    echo "snap not installed"
fi

### done
printf "\n\n"

