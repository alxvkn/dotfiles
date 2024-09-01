## stow --dotfiles
Since this commit (the one that introduced this readme), all packages will use **"dot-"** notation
that is compatible with stow's `--dotfiles` option. From stow's man page:

```
--dotfiles
    Enable special handling for  "dotfiles"  (files
    or  folders whose name begins with a period) in
    the  package  directory.  If  this  option   is
    enabled, Stow will add a preprocessing step for
    each  file  or  folder  whose  name begins with
    "dot-", and replace the "dot-"  prefix  in  the
    name  by a period (.). This is useful when Stow
    is used to manage collections of  dotfiles,  to
    avoid having a package directory full of hidden
    files.

    For   example,   suppose   we  have  a  package
    containing  two  files,   stow/dot-bashrc   and
    stow/dot-emacs.d/init.el.   With  this  option,
    Stow  will  create  symlinks  from  .bashrc  to
    stow/dot-bashrc  and  from  .emacs.d/init.el to
    stow/dot-emacs.d/init.el.  Any   other   files,
    whose  name does not begin with "dot-", will be
    processed as usual.
```

To move to this format, i used one command to cover all packages with `.config` dir inside:
```sh
find . -mindepth 2 -maxdepth 2 -name '.*' | while read name; do
    mv "$name" "$(echo $name | sed 's,/\.,/dot-,')"
done
```

By setting both `-mindepth` and `-maxdepth` to 2, we ensure that only the files
that lie in the root of each package will be affected. Leaving as it is,
for example, the [.gitignore](nvim/.config/nvim/.gitignore) file that lies under .config/nvim/

The final step would be to re-stow everything, now using the `--dotfiles` option:
```sh
stow --dotfiles --restow */
```
