#!/bin/bash
for image in $(cat images.txt); do
	docker pull $image
	archive=${image////%}
	archive=${archive/:/@}
	if [ ! -f ./images/$archive.tar.gz ]; then
	echo Start saving image to ./images/$archive.tar.gz
	docker save $image > ./images/$archive.tar.gz
        echo Done.
        fi
done
