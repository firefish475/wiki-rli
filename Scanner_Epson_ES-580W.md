Scanning with Epson ES-580W
===========================

Disk usage
----------

To create good quality PDF file of small size use option to convert: -compress jpeg -quality 99

Auto-trimming on cli
--------------------

This trims ES-580W scanned images successfully:

convert -density 300 Testpages.pdf -gravity East -chop 7x0 +gravity -trim +repage -bordercolor \#BCBCBC -border 10 -fuzz 8% -trim +repage out.pdf

This does the following:

 * use high resolution for good quality: -density 300

 * infile is Testpage.pdf

 * chop off the right border filled with white pixels by scanner: -gravity East -chop 7x0

 * reset gravity to default: +gravity

 * run the trimming and reset canvas to remove the transparent bottom the scanner leaves: -trim +repage

 * put a border around the image with the mean color of the side borders the scanner leaves: -bordercolor XXX -border 10

 * run trim again, this time with a little fuzz as the scanner scans empty space on the sides: -fuzz 8% -trim +repage

 * save output to file out.pdf




Without chopping the right border the fuzz needs to be higher for trim to work:

convert -density 300 Testpages.pdf -trim +repage -bordercolor \#BCBCBC -border 10 -fuzz 30% -trim +repage out.pdf

### Explanations:

convert -normalize -level 10%,90% -sharpen 0x1 multipage.pdf multipage2.pdf
-deskew 25%
-gravity Center
 -brightness-contrast -20x40 -depth 4 -colors 4 
-fuzz XXX -trim

to trim bottom transparency of scanned documents (ES-580W), only png works as alpha needed:
convert in.png -trim +repage out.png

get pixel color:
magick image.png -format "%[hex:u.p{19,14}]\n" info:

how to get the pixel color distribution to specify the most accurate -fuzz percentage to be more precise?

Testpages.pdf is a scan of two pages of different size in an Espon ES-580W. Both pages have the same width and there is gray space on the side border of the second page. The first page is A4, but the bottom is cropped by Xsane, I suppose.


mean color of an image area:
convert image.gif -crop 6x7+8+9 -resize 1x1\! -format "%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)]" info:-

Or after copping the area:
convert Testpage-cropped.png -resize 1x1 txt:

Turn the scan upright, 40% works for most pictures:

convert -density 300 Testpages-2.pdf -deskew 40% out.pdf
