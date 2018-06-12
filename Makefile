install: 

	mkdir -p /usr/share/openSUSE-welcome
	mkdir -p /usr/share/icons/hicolor
	mkdir -p /usr/share/applications
	mkdir -p /usr/bin
	mkdir -p /etc/skel/.config/autostart

	cp -a upstream/data/* /usr/share/openSUSE-welcome
	cp -a upstream/icons/* /usr/share/icons/hicolor/
	install -p -m 644 upstream/welcome.desktop /usr/share/applications/welcome.desktop
	install -p -m 644 upstream/welcome.desktop /etc/skel/.config/autostart/welcome.desktop
	install -p -m 755 upstream/welcome /usr/bin/welcome
