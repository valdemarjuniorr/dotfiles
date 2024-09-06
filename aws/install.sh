#!/bin/sh
# check if operation system is macOS or linux
if ! which aws >/dev/null 2>&1; then
  # Check if the OS is macOS
  if [ "$(uname -s)" = "Darwin" ]; then
    brew install awscli
  else # Otherwise, the OS is Linux
    sudo apt-get install awscli
  fi
fi
