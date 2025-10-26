#!/bin/bash

# Configuration
REPO_URL="https://github.com/bendo64/eso.git"
BASE_DIR="eso"   # Base folder
REPO_DIR="eso"
LAUNCHER_SCRIPT="run.sh"

# Create base folder
mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || exit 1

# Clone or pull the repo
if [ -d "$REPO_DIR/.git" ]; then
    echo "Repo already exists. Pulling latest changes..."
    cd "$REPO_DIR" || exit 1
    git pull
else
    echo "Cloning repo..."
    git clone "$REPO_URL"
    cd "$REPO_DIR" || exit 1
fi

# Make the game executable
chmod +x "linux_releases/Endostellar_O.x86_64"

# Go back to base dir
cd ..

# Create the launcher script
cat > "$LAUNCHER_SCRIPT" <<EOL
#!/bin/bash
cd "\$(dirname "\$0")/$REPO_DIR/linux_releases"
./Endostellar_O.x86_64
EOL

# Make the launcher script executable
chmod +x "$LAUNCHER_SCRIPT"

# Copy the update script from repo to base dir
if [ -f "$REPO_DIR/linux_scripts/update.sh" ]; then
    cp "$REPO_DIR/linux_scripts/update.sh" "./update.sh"
    chmod +x "./update.sh"
else
    echo "Warning: update.sh not found in repo."
fi

cd ~

echo "Setup complete!"
echo "Run the game with:   ./eso/run.sh"
echo "Update the game with: ./eso/update.sh"

