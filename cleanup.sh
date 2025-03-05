#!/usr/bin/env sh

# List of paths to keep
KEEP=".git .gitignore .gitmodules build.sh cleanup.sh deploy.sh forest"

# Create a pattern string for grep
KEEP_PATTERN=""
for path in $KEEP; do
  # Escape dots for regex
  escaped_path=$(echo "$path" | sed 's/\./\\./g')
  if [ -z "$KEEP_PATTERN" ]; then
    KEEP_PATTERN="$escaped_path"
  else
    KEEP_PATTERN="$KEEP_PATTERN|$escaped_path"
  fi
done

# Find all files and directories, exclude the ones to keep, and delete them
find . -mindepth 1 -maxdepth 1 | grep -vE "($KEEP_PATTERN)$" | xargs rm -rf

echo "Cleanup complete. Only the specified paths remain."
