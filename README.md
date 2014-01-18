Arch Deploy
===========

Automate installation and configuration of an Arch Linux system.

Description
-----------

Both `arch-install.sh` and `arch-configure.sh` files are meant to be included
by your own shell script. They provide helper functions for the installation
and configuration of the system.

All the available functions and their arguments are documented into the `doc`
directory.

I recommend setting the `-e` `sh` option.

Example
-------

Watch the `examples` directory for the scripts I use to deploy my Arch Linux
typical environment.

Installation then down to:

```sh
pacman -Sy git
git clone "git://github.com/valeriangalliat/arch-deploy.git"
examples/install
```
