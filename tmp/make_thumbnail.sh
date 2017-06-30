#!/bin/bash
# Examples
# ./make_thumbnail.sh
# will reduce everything ending in *jpg in current folder to 5% of size and trim transparent edges
# ./make_thumbnail.sh 25
# will reduce everything ending in *jpg in current folder to 25% of size and trim transparent edges

ext=jpg
if [[ -z $1 ]]; then
    perc=5
else
    perc=$1
fi

for file in *${ext}; do
    file=$(basename $file .${ext})
    # below worked for the thumb_IMG_2514_1024.jpg pic.
    # convert ${file}.${ext} -resize 25% ${file}-thumb.${ext}
    convert ${file}.${ext} -resize ${perc}% ${file}-thumb.${ext}
    convert ${file}-thumb.${ext} -flatten -fuzz 1% -trim +repage ${file}-thumb-trim.${ext}
done
