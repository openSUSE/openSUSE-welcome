Name:           korora-welcome
Version:        18.0
Release:        1%{?dist}
Summary:        Korora welcome utility

License:        GPLv2+
URL:            https://launchpad.net/jockey
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch
Requires:       python-simplejson python-gi

%description
The Korora welcome utiltiy provides a simple interface for accessing all
the relevant information to a new user of Korora.

%prep
%setup -q

%build

%install
mkdir -p %{buildroot}%{_datadir}/%{name}

cp -a data/* %{buildroot}%{_datadir}/%{name}
#install -d %{buildroot}%{_datadir}/selinux/${selinuxvariant}
install -p -m 644 korora-welcome %{_bindir}/korora-welcome


# validate desktop files
desktop-file-validate %{buildroot}%{_datadir}/applications/jockey-gtk.desktop
desktop-file-validate %{buildroot}%{_datadir}/applications/jockey-kde.desktop

%post

%postun

%files -f %{name}.lang
%{_bindir}/korora-welcome
%{_datadir}/share/%{name}/data

%changelog
* Sun Jan 03 2013 Ian Firns <firnsy@kororaproject.org> - 0.9.7-5
- Initial version

