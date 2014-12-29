Name:           korora-welcome
Version:        21.2
Release:        1%{?dist}.1
Summary:        Korora welcome utility

License:        GPLv2+
URL:            http://kororaproject.org
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch
BuildRequires:  desktop-file-utils
Requires:       python3-dnf
Requires:       python3-lens >= 0.7.5

%description
The Korora Welcome utility provides a simple interface for accessing all
the relevant information for a new user of Korora.

%prep
%setup -q

%build

%install
mkdir -p %{buildroot}%{_datadir}/%{name}
mkdir -p %{buildroot}%{_datadir}/icons/hicolor
mkdir -p %{buildroot}%{_datadir}/applications
mkdir -p %{buildroot}%{_bindir}
mkdir -p %{buildroot}/etc/skel/.config/autostart

cp -a data/* %{buildroot}%{_datadir}/%{name}
cp -a icons/* %{buildroot}%{_datadir}/icons/hicolor/
install -p -m 644 korora-welcome.desktop %{buildroot}%{_datadir}/applications/korora-welcome.desktop
install -p -m 644 korora-welcome.desktop %{buildroot}/etc/skel/.config/autostart/korora-welcome.desktop
install -p -m 755 korora-welcome %{buildroot}%{_bindir}/korora-welcome

# validate desktop file
desktop-file-validate %{buildroot}%{_datadir}/applications/korora-welcome.desktop

%post
/bin/touch --no-create %{_datadir}/icons/hicolor &>/dev/null || :

%postun
if [ $1 -eq 0 ] ; then
    /bin/touch --no-create %{_datadir}/icons/hicolor &>/dev/null
    /usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :
fi

%posttrans
/usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :

%files
%{_bindir}/korora-welcome
%{_datadir}/%{name}
%{_datadir}/icons/hicolor/*/*/*
%{_datadir}/applications/korora-welcome.desktop
/etc/skel/.config/autostart/korora-welcome.desktop

%changelog
* Mon Dec 29 2014 Ian Firns <firnsy@kororaproject.org> - 21.2-1
- Fixed missing install button on live system

* Mon Dec 22 2014 Ian Firns <firnsy@kororaproject.org> - 21.1-1
- Force opt-in for starting next session

* Mon Dec 15 2014 Chris Smart <csmart@kororaproject.org> - 21-1
- Finalise for k21, fix path issue

* Sat Nov 15 2014 Ian Firns <firnsy@kororaproject.org> - 20.99.2-1
- Update desktop to use korora-welcome icon from our icon theme.

* Sun Nov  9 2014 Ian Firns <firnsy@kororaproject.org> - 20.99.1-2
- Ensure that we capture the python3 bindings in the requires.

* Wed Sep 24 2014 Ian Firns <firnsy@kororaproject.org> - 20.99.1-1
- Initial conversion to lens app.

* Sat Jul 26 2014 Ian Firns <firnsy@kororaproject.org> - 20.99-1
- Upgraded boostrap, angular and aligned with kp.org css.
- Fixed support for DNF usage.

* Fri Jan 3 2014 Ian Firns <firnsy@kororaproject.org> - 20.1-1
- Fixed premature resize on KDE desktops.

* Sat Dec 28 2013 Chris Smart <csmart@kororaproject.org> - 20.0-2
- Updated content to reflect changes in 20 release, including new desktops.

* Fri Nov 1 2013 Ian Firns <firnsy@kororaproject.org> - 20.0-1
- Updated theme to align with new canvas and web themes
- Added validation of command URIs and general comments

* Sun Sep 8 2013 Chris Smart <csmart@kororaproject.org> - 19.6-4
- Update and add links to resources in involved.html

* Sun Sep 8 2013 Chris Smart <csmart@kororaproject.org> - 19.6-3
- Add links to resources in readme.html

* Sat Sep 7 2013 Chris Smart <csmart@kororaproject.org> - 19.6-2
- Add support for other desktops, including MATE and Cinnamon

* Sat Jun 29 2013 Ian Firns <firnsy@kororaproject.org> - 19.6-1
- Fixed KDE desktop detection and button display.

* Sat Jun 29 2013 Ian Firns <firnsy@kororaproject.org> - 19.5-1
- Fixed desktop detection.

* Wed Jun 26 2013 Ian Firns <firnsy@kororaproject.org> - 19.4-1
- Updated feature list.

* Tue Jun 25 2013 Ian Firns <firnsy@kororaproject.org> - 19.3-1
- Updated home button size. Added launchers for desktop specific help and
  installation on live sessions.

* Wed May 29 2013 Ian Firns <firnsy@kororaproject.org> - 19.2-1
- Moved autostart to skeleton profile.

* Sun May 26 2013 Ian Firns <firnsy@kororaproject.org> - 19.1-1
- Lighter header and social icons added.

* Sun May 12 2013 Ian Firns <firnsy@kororaproject.org> - 19.0-2
- Updated for Korora 19 release.

* Fri Mar 15 2013 Ian Firns <firnsy@kororaproject.org> - 18.0-1
- Initial version.

