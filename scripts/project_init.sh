#!/bin/bash

print_message() {
  echo "----------------------------------"
  echo "$1"
  echo "----------------------------------"
}

print_message "Installing Checkstyle..."
brew install checkstyle

print_message "Installing pre-commit..."
brew install pre-commit

print_message "Setting up pre-commit hook..."
scripts/setup-hooks.sh