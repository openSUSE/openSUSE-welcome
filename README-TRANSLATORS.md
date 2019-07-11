# Readme Translators
Read this file if you are translating this program.

## How to Translate
There is a base.po file in i18n/ that should be copied and used as the base of the other translation files. They should be named `qml_<lang>.po`.
Use whatever program you like to translate with the `.po` files.

## How to test your translations

It's needed to install some packages like __meson__ and __ninja__, so first run zypper in as root user or YaST to install this packages.
To test, build the program following these steps from the build root:

 ./i18n.sh

This will rebuild the i18n.qrc file which bundles translations

 meson --buildtype=plain --prefix=/usr --libdir=/usr/lib64 --libexecdir=/usr/lib --bindir=/usr/bin --sbindir=/usr/sbin --includedir=/usr/include --datadir=/usr/share --mandir=/usr/share/man --infodir=/usr/share/info --localedir=/usr/share/locale --sysconfdir=/etc --localstatedir=/var --sharedstatedir=/var/lib --wrap-mode=nodownload --auto-features=enabled . build

 cd build

 ninja

This will compile the program.

 sudo ninja install

This will install the program to your system. From here, just find the new software called _welcome_ or _openSUSE-welcome_ and launch and see if it works.

Additionally, you may want to translate the desktop files by adding these lines to them. Change __xx__ by your language translatio. For example __es__ for
Spanish and substituting the text _translation_ for the actual translation, of course.

Name[xx]=translation

GenericName[xx]=translation

Comment[xx]=translation
