Name:           korora-welcome
Version:        18.0
Release:        1%{?dist}
Summary:        Korora welcome utility

License:        GPLv2+
URL:            http://kororaproject.org
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch
Requires:       python-simplejson python-gi

%description
The Korora Welcome utility provides a simple interface for accessing all
the relevant information for a new user of Korora.

%prep
%setup -q

%build

%install
mkdir -p %{buildroot}%{_datadir}/%{name}
mkdir -p %{buildroot}%{_bindir}

cp -a data/* %{buildroot}%{_datadir}/%{name}
install -p -m 644 korora-welcome %{buildroot}%{_bindir}/korora-welcome

%post

%postun

%files
%{_bindir}/korora-welcome
%{_datadir}/%{name}

%changelog
* Sun Jan 03 2013 Ian Firns <firnsy@kororaproject.org> - 0.18.0-1
- Initial version.

