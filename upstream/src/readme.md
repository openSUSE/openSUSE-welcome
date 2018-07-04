---
layout: sub
title: Read Me
---
## Installing Extras
There are certain proprietary drivers (such as nvidia) and packages (such as Google Chrome) that Korora cannot include by default. If you have an nvidia device and wish to use the proprietary drivers then enter following command at a terminal:

    $ sudo dnf install akmod-nvidia

To install Google Chrome, just use the system's package manager. We can't distribute it, but we have included the repository to make it easy for you to install.

Looking for Skype? We cannot ship this either and unfortunately we also can't make it easier like Google Chrome as there is no repository. However, just head over to {% include link url="https://skype.com" text="Skype's website" %} to download the 32 bit RPM package for Fedora and double-click it to install. The package manager will take care of the dependencies for you, even if you're running a 64 bit system.
