# openSUSE Welcome
Welcoming welcome window that will welcomely welcome you on your openSUSE journey, you are welcome.  
This is supposed to be a window that shows up during first boot into openSUSE, so people can get familiar with openSUSE before they use it.

A new button has been added that enables you to donate the Geeko Foundation, the primary funding for openSUSE.


<a href="https://l10n.opensuse.org/engage/opensuse-welcome/?utm_source=widget">
<img src="https://l10n.opensuse.org/widgets/opensuse-welcome/-/master/svg-badge.svg" alt="Translation status" />
</a>

<a href="https://l10n.opensuse.org/engage/opensuse-welcome/?utm_source=widget">
<img src="https://l10n.opensuse.org/widgets/opensuse-welcome/-/master/multi-blue.svg" alt="Translation status" />
</a>

## Build instructions

```
$ sudo zypper in libQt5Core-devel libqt5-qtdeclarative-devel libqt5-qtwebchannel-devel libqt5-qtwebengine-devel libqt5-linguist hicolor-icon-theme meson
$ git clone git@github.com:openSUSE/openSUSE-welcome.git
$ cd openSUSE-welcome
$ meson setup builddir
$ cd builddir
$ ninja
$ src/openSUSE-welcome # execute newly built app
```

### OBS build

This will show you how to make a test build of rpms from your git repo
```
$ zypper in osc # or openSUSE-release-tools
$ osc bco X11:Utilities/opensuse-welcome
$ cd home*X11*Utilities/openSUSE-welcome
$ vim _service # Change _service file to point to your github repo
$ osc service runall # will fetch new sources and make a changelog entry
$ osc addremove #  make sure that the old source archive is gone prior running this
$ osc commit # check changelog by osc vc
```

## About

openSUSE Welcome is a utility that welcomes users to openSUSE. It includes links to various resources, 
including a link to the donation page at https://geekos.org.

![Screenshot of openSUSE Welcome.](https://github.com/openSUSE/openSUSE-welcome/blob/master/Welcome.png)
