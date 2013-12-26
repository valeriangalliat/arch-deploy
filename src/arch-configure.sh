declare NUSER=arch

nuser() {
    useradd "$@" "$NUSER" &&
    passwd "$NUSER"
}

nuserx() {
    su "$NUSER" -c "\"\$0\" \"\$@\"" -- "$@"
}

aur() {
    local package=$1; shift
    local dest=$package.tar.gz
    local dir=$(pwd)

    cd /tmp &&

    # Download and extract package
    nuserx curl -o "$dest" "https://aur.archlinux.org/packages/${package:0:2}/$package/$package.tar.gz" &&
    nuserx tar xf "$dest" &&

    # Build package (and clean)
    cd "$package" &&
    nuserx makepkg -c &&

    # Install generate package
    find . -name "*.tar.xz" -exec pacman -U {} + &&

    # Restore current directory
    cd "$dir"

    # Cleanup
    rm  -R "/tmp/$package" "/tmp/$dest"
}

# Remove configure script from `.profile`
sed -i "/^# AUTORUN ARCH CONFIGURE$/,+1d" .profile &&

# Remove `.profile` if empty
[ wc -l < ~/.profile == 0 ] && rm .profile &&

# Execute configure script
. ./configure
