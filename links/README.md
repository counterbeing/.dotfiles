# Links
Any file in this directory ending in `.link` will have a symbolic link created to it in the home dir, the `.link` extension removed,  and a `.` prepended to the name.

Don't worry, this won't delete anything, but it will move dotfiles you already have with the same name, and append `_backup_date` to the name.

Once you start editing these files, you'll actually be editing them here in the repo, which is why, if you're not me, you might want to fork this project, so that you can use it to sync the changes between machines.
