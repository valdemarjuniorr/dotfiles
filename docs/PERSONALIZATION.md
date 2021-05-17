# Personalization

> How to add custom configuration without messing the local repository

## For the shell itself

You can add anything you want (secret stuff, for example), to the `~/.localrc`
file.

## For git

You can just change the default `~/.gitconfig` file, since it includes the
dotfiles managed one.

## For psql

You can edit the `~/.psqlrc.local` file.

## For ssh

You can edit the `~/.ssh/config.local` file.

## Terminator

If you don't like these terminator settings, run:

```console
$ echo 'KEEP_TERMINATOR=1' >> ~/.localrc
$ rm -rf ~/.config/terminator
```

Then configure it as you wish.

## Sublime Text

If you don't like these st3 settings, run:

```console
$ echo 'KEEP_SUBLIME=1' >> ~/.localrc
$ rm -rf "$HOME/Library/Application Support/Sublime Text 3" "$HOME/.config/sublime-text-3"
```

Then configure it as you wish.
