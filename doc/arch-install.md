Arch Install
============

Variables
---------

- `$MNT`: The mountpoint where to install the system. Defaults to `/mnt`.

Functions
---------

- `chrootx`: Executes a command in chroot.

  1. Arguments for `arch-chroot`.

- `mirrorlist`: Retrieves a mirrorlist in `/etc/pacman.d/mirrorlist` for given
  country code.

  1. Country code (`US`, `GB`, `FR`, etc).

- `bootstrap`: Bootstraps the system in mountpoint.

  1. Packages to install with `pacstrap`.

- `fstab`: Generates the fstab in mountpoint.

  1. Arguments for `genfstab`.

- `locale`: Generates given locale in mountpoint.

  1. Locale (`en_US`, `en_US.UTF-8`, etc).

- `linux`: Creates initial RAM disk for Linux.

- `syslinuxi`: Installs Syslinux in mointpoint.

  1. Disk to boot (`sda1`, `sda2`, etc).

- `autoconfigure`: Adds the configure script in `/root/.profile` to autorun it
  at next login.

- `finish`: Prompts for root password, unmount mountpoint recursively and
  reboots.
