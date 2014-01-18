Arch Configure
==============

Variables
---------

- `$NUSER`: The new user to create (that will be used for AUR install for
  example).

Functions
---------

- `cleanconfigure`: Cleans the autorun script in `/root/.profile`. If the file
  is empty after removing the autorun script, it will be removed.

- `nuser`: Creates the new user.

  1. Arguments for `useradd`.

- `nuserx`: Executes a command as new user.

  1. Arguments for `su` (will be escaped properly).

- `aur`: Installs given package from AUR (requires new user to be created).

  1. Package name.
