# Valdemar' dotfiles

[![Powered by Antibody][ab]][ap]

> Config files for ZSH, Java, Go, Editors, Terminator and more.

![screenshot][scrn]

[ap]: https://github.com/getantibody/antibody
[ab]: https://img.shields.io/badge/powered%20by-antibody-blue.svg?style=flat-square
[scrn]: /docs/screenshot.png

## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `zsh`: to actually run the dotfiles
- `crontab`: to schedule dotfiles constant updates
- `sudo`: some configs may need that

### Install

Then, run these steps:

```console
$ git clone https://github.com/valdemarjuniorr/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap
$ zsh # or just close and open your terminal again.
```

> All changed files will be backed up with a `.backup` suffix.

### Recommended Software

For macOS, I recommend:

- iTerm: a better terminal emulator;

For Linux:

- Terminator: a better terminal emulator;

For both Linux and macOS:

- [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy):
better git difs (you'll need to run `dot_update` to apply it);
- [`fzf`](https://github.com/junegunn/fzf):
fuzzy finder, used in `,t` on vim, for example;
- [`lsd`](https://github.com/lsd-rs/lsd): for better `ls`;
- [`mmake`](https://github.com/tj/mmake): a modern `make`.
  you better at GitHub;
- [`kubectx`](https://github.com/ahmetb/kubectx) for better kubernetes context
  and namespace switch;

### macOS defaults

You use it by running:

```console
$DOTFILES/macos/set-defaults.sh
```

And logging out and in again.

## Further help:

- [Personalize your configs](/docs/PERSONALIZATION.md)
- [Understand how it works](/docs/PHILOSOPHY.md)
- [License](/LICENSE.md)

## Contributing

Feel free to contribute. Pull requests will be automatically
checked/linted with [Shellcheck](https://github.com/koalaman/shellcheck)
and [shfmt](https://github.com/mvdan/sh).

## Troubleshooting
- In case [`lsd`](https://github.com/lsd-rs/lsd) font aren't working on MacOS, check this [link](https://github.com/lsd-rs/lsd/issues/199#issuecomment-494218334)

