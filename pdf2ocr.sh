#!/bin/sh

# Name:         pdf2ocr
# Version:      0.0.1
# Release:      1
# License:      CC-BA (Creative Commons By Attrbution)
#               http://creativecommons.org/licenses/by/4.0/legalcode
# Group:        System
# Source:       N/A
# URL:          http://lateralblast.com.au/
# Distribution: UNIX
# Vendor:       Lateral Blast
# Packager:     Richard Spindler <richard@lateralblast.com.au>
# Description:  Shell script to OCR PDFs

file_header=`basename "$1" .pdf`
echo "OCRing $1 to $file_header.txt"
out_file=$file_header-%02d.tiff
gs -q -dNOPAUSE -dBATCH -dSAFER -r300x300 -sDEVICE=tiffg3 "-sOutputFile=$out_file" -c save pop -f "$1"
cat /dev/null > $file_header.txt
for tiff_file in $file_header*.tiff; do
  text_file=`basename $tiff_file .tiff`
  tesseract $tiff_file $text_file > /dev/null 2>&1
  cat $text_file.txt >> $file_header.txt
  rm $tiff_file $text_file.txt
done
