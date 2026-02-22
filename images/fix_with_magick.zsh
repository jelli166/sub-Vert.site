#!/bin/bash

# Navigate to images directory if not already there
# cd ./images

for file in *.{png,jpg,jpeg}; do
    # Check if files exist to avoid errors in empty dirs
    [ -e "$file" ] || continue

    # Get the filename without the extension
    filename="${file%.*}"

    echo "Optimizing $file..."

    # Convert to webp with 85% quality
    # We use -resize 1600x\> to downscale only if the image is wider than 1600px
    magick "$file" -resize "1600x>" -quality 85 "${filename}.webp"
done

echo "Done! Check your ./images folder for the new .webp versions."

