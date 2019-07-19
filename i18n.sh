#!/usr/bin/env bash
QRC=./i18n.qrc
echo '<!DOCTYPE RCC>' > $QRC
echo '<RCC version="1.0">' >> $QRC
echo '  <qresource prefix="/">' >> $QRC

for a in $(find i18n -type f)
do
	if grep -i "\.po" <<< "$a"; then
		echo a: $a
		b=$(cut -c 5- <<< "$a")
		echo b: $b
		c=$(rev <<< "$b" | cut -c 4- | rev )
		echo c: $c
		lconvert-qt5 $a -o "i18n$c.qm"
	fi
done
# for each files/folder in the folder "theFokderName"
for a in $(find i18n)
do
    grep -v "\.qm" <<< "$a" && continue
    # if this is not a folder
    if [ ! -d "$a" ]; then
        echo '      <file>'$a'</file>' >> $QRC
    fi
done

echo '  </qresource>' >> $QRC
echo '</RCC>' >> $QRC
