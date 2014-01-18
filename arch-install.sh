MNT=/mnt

chrootx() {
    arch-chroot "$MNT" "$@"
}

mirrorlist() {
    country=$1; shift
    tmp=$(mktemp)

    # Retrieve mirrorlist from server
    curl -o "$tmp" "https://www.archlinux.org/mirrorlist/?country=$country"


    if ! cat "$tmp" | head -n 1 | grep -q "^##$"; then
        echo "Unable to find a mirrorlist for country '$country'." >&2
        return 1
    fi

    # Uncomment server lines
    sed -i "s/^#Server/Server/g" "$tmp"

    # Write new mirrorlist
    cat "$tmp" > /etc/pacman.d/mirrorlist
}

bootstrap() {
    pacstrap "$MNT" "$@"
}

fstab() {
    genfstab "$@" "$MNT" >> "$MNT/etc/fstab"
}

locale() {
    locale=$1; shift

    if ! grep -q "^#$locale " "$MNT/etc/locale.gen"; then
        echo "Given locale '$locale' does not exists in '$MNT/etc/locale.gen'." >&2
        return 1
    fi

    # Uncomment locale
    sed -i "/^#$locale /s/^#//g" "$MNT/etc/locale.gen"

    # Generate
    chrootx locale-gen
}

linux() {
    chrootx mkinitcpio -p linux
}

syslinuxi() {
    disk=$1; shift

    # Install package and init
    pacstrap "$MNT" syslinux
    chrootx syslinux-install_update -aim

    # Change default disk to real disk
    sed -i "s/sda3/$disk/g" "$MNT/boot/syslinux/syslinux.cfg"
}

autoconfigure() {
    configure=$1; shift
    echo "# AUTORUN ARCH CONFIGURE" >> "$MNT/root/.profile"
    echo "$configure" >> "$MNT/root/.profile"
}

finish() {
    chrootx passwd
    umount -R "$MNT"
    reboot
}
