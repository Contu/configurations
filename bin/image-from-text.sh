#!/bin/bash

echo -e $1 | convert \
		 -fuzz 55% -transparent white \
		 -fill red -strokewidth 1  -stroke blue  -undercolor lightblue \
		 -font /usr/share/fonts/TTF/LiberationSans-BoldItalic.ttf \
		 -pointsize 40 \
		 -gravity center \
		 label:@-  ~/Pictures/screenshot/label_image.gif
