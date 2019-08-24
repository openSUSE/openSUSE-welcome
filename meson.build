project('opensuse-welcome', 'cpp')
qt5 = import('qt5')
qt5_dep = dependency('qt5', modules: ['Core', 'Quick', 'WebEngine', 'WebChannel'])
inc = include_directories('src/include')
qresource_files = ['data/qrc/qml.qrc', 'data/qrc/webresources.qrc']
processed_files = qt5.preprocess(moc_headers: ['src/include/enabler.h', 'src/include/launcher.h', 'src/include/sysinfo.h'],
                                 include_directories: inc,
                                 qresources: qresource_files)
subdir('src')

install_data('data/org.opensuse.opensuse_welcome.desktop', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'applications'))
install_data('data/org.opensuse.opensuse_welcome.desktop', install_dir: join_paths(get_option('sysconfdir'), 'xdg/autostart'))
install_data('data/org.opensuse.opensuse_welcome.appdata.xml', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'metainfo'))
install_data('data/org.opensuse.opensuse_welcome.svg', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'icons/hicolor/scalable/apps'))
install_data('data/org.opensuse.opensuse_welcome-symbolic.svg', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'icons/hicolor/symbolic/apps'))

meson.add_install_script('data/cleanup.sh')
meson.add_install_script('data/i18n.sh', join_paths(get_option('prefix'), get_option('datadir'), 'openSUSE-Welcome', 'i18n'))
