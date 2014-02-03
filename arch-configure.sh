NUSER=arch

cleanconfigure() {
    [ ! -f /root/.profile ] && return

    # Remove configure script
    sed -i "/^# AUTORUN ARCH CONFIGURE$/,+1d" /root/.profile

    # Remove file if empty
    [ $(wc -l < /root/.profile) = 0 ] && rm /root/.profile
}

dhcp() {
    systemctl enable dhcpcd
    dhcpcd

    # Sometimes DHCP needs more time
    sleep 5
}

nuser() {
    useradd "$@" "$NUSER"
    passwd "$NUSER"
}

nuserx() {
    su "$NUSER" -c "\"\$0\" \"\$@\"" -- "$@"
}

aur() {
    package=$1; shift
    dest=$package.tar.gz
    dir=$(pwd)

    cd /tmp

    # Download and extract package
    nuserx curl -o "$dest" "https://aur.archlinux.org/packages/${package:0:2}/$package/$package.tar.gz"
    nuserx tar xf "$dest"

    # Build package (and clean)
    cd "$package"
    nuserx makepkg -c

    # Install generate package
    find . -name "*.tar.xz" -exec pacman -U {} +

    # Restore current directory
    cd "$dir"

    # Cleanup
    rm  -R "/tmp/$package" "/tmp/$dest"
}
