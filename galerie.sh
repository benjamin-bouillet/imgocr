#!/bin/bash

# checking if thumbnail folder is present
# ls_linecount=`ls -lha | grep thumbnails | grep -E ^d | wc -l`

# creating the thumbnail folder if not present
# if [ $ls_linecount = "0" ]
if [  `ls -lha | grep thumbnails | grep -E ^d | wc -l` = "1" ]
then
	rm thumbnails/*.png 2> /dev/null
else
	mkdir thumbnails/
fi

# renaming files
for i in *.png
do
	cp "$i" "thumbnails/$i"
	convert -thumbnail 200x "thumbnails/$i" "thumbnails/$i" 2>> galerie.log
done

# creating html file if not present
if [ `ls -lha | grep galerie.html | wc -l` = "1" ]
then
	rm galerie.html
	touch galerie.html
else
	touch galerie.html
fi


