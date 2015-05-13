![alt tag](https://raw.githubusercontent.com/lateralblast/pdf2ocr/master/pdf2ocr.jpg)

PDF2OCR
=======

Shell script to OCR PDFs. Has support for multipage documents.

License
-------

This software is licensed as CC-BA (Creative Commons By Attrbution)

http://creativecommons.org/licenses/by/4.0/legalcode

Usage
-----

```
$ pdf2ocr file.pdf
OCRing file.pdf to file.txt
OCRing page 1 of 12
OCRing page 2 of 12
OCRing page 3 of 12
OCRing page 4 of 12
OCRing page 5 of 12
OCRing page 6 of 12
OCRing page 7 of 12
OCRing page 8 of 12
OCRing page 9 of 12
OCRing page 10 of 12
OCRing page 11 of 12
OCRing page 12 of 12
```

Requirements
------------

This script requires ghostscript and tesseract.

Installing these on OS X can be done with brew:

```
$ brew install ghostscript
$ brew install tesseract
```
