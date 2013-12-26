Arch Deploy
===========

Automate installation and configuration of an Arch Linux system.

Description
-----------

Both `arch-install` and `arch-configure` commands take no arguments. They
are meant to be executed in root's home directory.

The `arch-install` command is expecting an `install` script in the same
directory to be sourced for installation instructions (executed by `sh`),
and `arch-configure` expects also a `configure` script.

When the files are sources, they can access helper functions to ease the
installation and configuration process.

All the available functions and their arguments are documented into the `doc`
directory.

Examples
--------

For an example you can watch my `install` and `configure` scripts
on [this repository](https://github.com/valeriangalliat/arch).

Installation then down to:

```sh
pacman -Sy git
git clone "https://github.com/valeriangalliat/sh-arch-deploy.git"
git clone "https://github.com/valeriangalliat/arch.git"
mv arch/install arch/configure .
sh-arch-deploy/bin/arch-install
```
