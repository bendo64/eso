#!/bin/bash

# Configuration
REPO_URL="https://github.com/bendo64/eso.git"
BASE_DIR="eso"
REPO_DIR="$BASE_DIR/repo"
EXECUTABLE="linux_releases/Endostellar_O.x86_64"

# Create base directory if it doesn't exist
mkdir -p "$BASE_DIR"

cd "$BASE_DIR" || { echo "Failed to enter $BASE_DIR"; exit 1; }

# Clone or pull the repo
if [ -d "$REPO_DIR/.git" ]; then
    echo "Repository already exists. Pulling latest changes..."
    cd "$REPO_DIR" || exit 1
    git pull --rebase
else
    echo "Cloning repository..."
    git clone "$REPO_URL" repo || { echo "Clone failed!"; exit 1; }
    cd "$REPO_DIR" || exit 1
fi

# Make the game executable (path with spaces needs quotes)
if [ -f "$EXECUTABLE" ]; then
    chmod +x "$EXECUTABLE"
    echo "Made executable: $EXECUTABLE"
else
    echo "Warning: Executable not found at $EXECUTABLE"
fi

cd ~ || exit 0

echo "Update complete!"

