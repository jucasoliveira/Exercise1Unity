#!/bin/bash
# Cleans Unity project by removing files/folders that should not be versioned

echo "=== Cleaning Unity Project ==="

# Folders to remove
folders=(
    "Library"
    "Temp"
    "obj"
    "Build"
    "Builds"
    "Logs"
    "UserSettings"
    "MemoryCaptures"
    "Recordings"
    "ExportedObj"
    ".vs"
    ".gradle"
    ".consulo"
)

for folder in "${folders[@]}"; do
    if [ -d "$folder" ]; then
        echo "Removing folder: $folder/"
        rm -rf "$folder"
    fi
done

# File extensions to remove
extensions=(
    "csproj"
    "unityproj"
    "sln"
    "suo"
    "tmp"
    "user"
    "userprefs"
    "pidb"
    "booproj"
    "svd"
    "pdb"
    "mdb"
    "opendb"
    "VC.db"
    "apk"
    "aab"
    "unitypackage"
    "app"
)

for ext in "${extensions[@]}"; do
    found=$(find . -name "*.${ext}" -type f 2>/dev/null)
    if [ -n "$found" ]; then
        echo "$found" | while read -r f; do echo "Removing file: $f"; done
        find . -name "*.${ext}" -type f -delete
    fi
done

# Specific file patterns
patterns=(
    "._*"
    ".DS_Store"
    "sysinfo.txt"
    "crashlytics-build.properties"
    "*.pidb.meta"
    "*.pdb.meta"
    "*.mdb.meta"
)

for pattern in "${patterns[@]}"; do
    found=$(find . -name "$pattern" -type f 2>/dev/null)
    if [ -n "$found" ]; then
        echo "$found" | while read -r f; do echo "Removing file: $f"; done
        find . -name "$pattern" -type f -delete
    fi
done

echo "=== Done ==="
