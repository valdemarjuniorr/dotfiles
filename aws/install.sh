#!/bin/sh
# check if operation system is macOS or linux
if ! which aws >/dev/null 2>&1; then
  # Check if the OS is macOS
  if [ "$(uname -s)" = "Darwin" ]; then
    brew install awscli2
  else # Otherwise, the Fedora Linux
    sudo dnf install awscli2 -y
  fi
fi
