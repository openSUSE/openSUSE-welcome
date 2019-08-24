#!/usr/bin/env bash
mkdir -p ${1}
for a in $(find ${MESON_SOURCE_ROOT}/data/i18n -type f)
do
	if grep -i "\.po" <<< "$a"; then
		filename=$(basename $a)
		y=${filename%.*}
		lconvert-qt5 $a -o "${1}/${y}.qm"
	fi
done
