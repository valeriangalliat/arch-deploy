declare NUSER=arch

nuser() {
    useradd "$@" "$NUSER" &&
    passwd "$NUSER"
}

aur() {
    local package=$1; shift
    local dest=/tmp/$package.tar.gz

    # Download and extract package
    curl -o "$dest" "https://aur.archlinux.org/packages/${package:0:2}/$package/$package.tar.gz" &&
    tar xf "$dest" &&
    rm "$dest" &&

    # Build package (and clean) as new user
    su "$NUSER" "cd \"/tmp/$package\" && makepkg -c" &&

    # Install generate package
    find "/tmp/$package" -name "*.tar.xz" -exec pacman -U {} +
}

# Remove configure script from `.profile`
sed -i "/^# AUTORUN ARCH CONFIGURE$/,+1d" .profile

# Remove `.profile` if empty
[ wc -l < ~/.profile == 0 ] && rm .profile

# Execute configure script
. arch-configurerc
