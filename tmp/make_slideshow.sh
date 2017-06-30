#!/bin/bash
# use this to convert photos to a format that is good for the slideshow on the website.
# Examples
# ./make_slideshow.sh
# will reduce everything ending in *jpg in current folder to 1024 pixels along the long edge and creates a thumbnail of them that is 5% of size
# e.g., will go from a directory that looks like:
# IMG_0221.jpg
# to:
# IMG_0221.jpg
# IMG_0221_1024.jpg
# IMG_0221_1024-thumb.jpg
#
# ./make_thumbnail.sh 25
# thumbnails will be 25% instead of 5%

# make a tmp directory
mkdir tmp

ext=jpg

for file in *${ext}; do
    file=$(basename $file .${ext})
    convert ${file}.${ext} -resize 1024 -quality 100 ${file}_1024.${ext}
done

mv *_1024* tmp
cd tmp
/Users/jzinn/website/joelczinn.github.io/tmp/make_thumbnail.sh $1
cd -
mv tmp/* ./
rmdir tmp

echo "make_slideshow.sh DONE"
