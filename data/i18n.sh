#!/usr/bin/env bash
mkdir -p ${DESTDIR}${1}
for a in $(find ${MESON_SOURCE_ROOT}/data/i18n -type f)
do
	if grep -i "\.po" <<< "$a"; then
		filename=$(basename $a)
		y=${filename%.*}
		lconvert6 $a -o "${DESTDIR}${1}/${y}.qm"
	fi
done
