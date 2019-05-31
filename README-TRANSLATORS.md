# Readme Translators
Read this file if you are translating this program.

## How to Translate
The QML runtime automatically loads translation files from `i18n/qml_<lang>.qm`. 
As a translator, you will be providing a `.ts` file that the developers will process and integrate into the project. 

To start a translation, copy the file `base.ts` to `qml_<lang>.ts` in the `i18n` directory. (For example, `qml_en.ts`) Open the new file with Qt5 Linguist and start translating.

## Comments
Qt5 Linguist will open up the source file of a translation alongside the translation file. This source file often has comments that can provide context to your translations.
