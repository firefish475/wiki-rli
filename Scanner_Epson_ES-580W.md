Scanning with Epson ES-580W
===========================

Auto-trimming on cli
--------------------

This trims ES-580W scanned images successfully so far, but with a little high -fuzz, so not so precise:

convert Testpages.pdf -trim +repage -bordercolor \#B8B8B8B8B8B8FFFF -border 10 -fuzz 30% -trim +repage out.pdf

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
