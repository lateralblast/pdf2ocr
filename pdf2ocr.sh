#!/bin/sh

# Name:         pdf2ocr
# Version:      0.0.2
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

if [ "$1" == "-h" ] || [ "$1" == "-?" ] || [ "$1" == "" ] || [ "$1" == "--help" ]; then
	name=`cat $0 |grep '^#' |grep Name |awk '{print $3}'`
	version=`cat $0 |grep '^#' |grep Version |awk '{print $3}'`
	packager=`cat $0 |grep '^#' |grep Packager |awk '{print $3" "$4" "$5}'`
	echo ""
	echo "$name v. $version"
	echo "$packager"
	echo ""
  echo "Usage:"
  echo ""
  echo "$name filename.pdf"
  echo ""
  echo " -h: Display usage information"
  echo " -v: Display version information"
  echo ""
  exit
fi
if [ "$1" == "-V" ] || [ "$1" == "-v" ] || [ "$1" == "--version" ]; then
	echo ""
	version=`cat $0 |grep '^#' |grep Version |awk '{print $3}'`
	echo "$version"
	exit
fi
file_header=`basename "$1" .pdf`
echo "OCRing $1 to $file_header.txt"
out_file=$file_header-%02d.tiff
gs -q -dNOPAUSE -dBATCH -dSAFER -r300x300 -sDEVICE=tiffg3 "-sOutputFile=$out_file" -c save pop -f "$1"
cat /dev/null > $file_header.txt
no_page=`ls $file_header*.tiff | wc -l |sed 's/ //g'`
page_no=1
for tiff_file in $file_header*.tiff; do
  text_file=`basename $tiff_file .tiff`
  echo "OCRing page $page_no of $no_page"
  tesseract $tiff_file $text_file > /dev/null 2>&1
  page_no=`expr $page_no + 1`
  cat $text_file.txt >> $file_header.txt
  rm $tiff_file $text_file.txt
done
