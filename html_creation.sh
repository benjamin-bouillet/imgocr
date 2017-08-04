# Fonction de creation du html gallerie

myNewGalerie ()

{
	# Checking if galerie is already present
	if [ `ls | grep galerie.html | wc -l` = '1' ]
	then
		rm galerie.html
	fi

	# Listing all .png files in the thumbnails folder
	listpng=`ls images/thumbnails/ | grep .png`

	# Creating the html header
	cat htmlhead >> galerie.html

	# Populating the html with all thumbnails
	for img in $listpng
	do
		echo "<a href=\"$img\"><img src=\"images/thumbnails/$img\" alt=\"\" /></>" >> galerie.html
	done
	
	# Including the footer in the html
	cat htmlfoot >> galerie.html
}

myNewGalerie
