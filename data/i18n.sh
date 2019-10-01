#!/usr/bin/env bash
mkdir -p ${MESON_BUILD_ROOT}${1}
for a in $(find ${MESON_SOURCE_ROOT}/data/i18n -type f)
do
	if grep -i "\.po" <<< "$a"; then
		filename=$(basename $a)
		y=${filename%.*}
		lconvert-qt5 $a -o "${MESON_BUILD_ROOT}${1}/${y}.qm"
	fi
done
