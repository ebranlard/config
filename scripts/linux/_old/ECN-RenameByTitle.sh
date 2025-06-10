#! /bin/bash
for i in *.pdf ; do
	echo ""
	echo "-------------------------------------------------------------";
	echo ${i%.*};
	title=`pdftotext -f 1 -l 1 $i - | awk '!/[0-9.]/'|awk '/. / '|tr '\n' ' '|head -c 64|tr ' ' '_'`
	mv "$i" "${i%.*}_$title.pdf"

done
