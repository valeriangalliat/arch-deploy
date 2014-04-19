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

Examples
--------

Watch the `examples` directory for the scripts I use to deploy my Arch Linux
typical environment.

Installation then down to:

```sh
pacman -Sy git
git clone "git://github.com/valeriangalliat/arch-deploy.git"
examples/install
```

But you will more likely want to costumize the example scripts with your own
configuration and softwares. I left a couple of software I use commented
in the install script, regarding of the context (graphical interface or not,
work or home).
