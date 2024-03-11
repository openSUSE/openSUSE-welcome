project('opensuse-welcome', 'cpp')
qt6 = import('qt6')
qt6_dep = dependency('qt6', modules: ['Core', 'Quick'])
inc = include_directories('src/include')
qresource_files = ['data/qrc/qml.qrc', 'data/qrc/fonts.qrc', 'data/qrc/images.qrc', 'data/qrc/layouts.qrc']
processed_files = qt6.preprocess(moc_headers: ['src/include/enabler.h', 'src/include/launcher.h', 'src/include/sysinfo.h', 'src/include/panellayouter.h'],
                                 include_directories: inc,
                                 qresources: qresource_files)

share_dir = join_paths(get_option('prefix'), get_option('datadir'), 'openSUSE-Welcome')

subdir('src')

install_data('data/org.opensuse.opensuse_welcome.desktop', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'applications'))
install_data('data/org.opensuse.opensuse_welcome.desktop', install_dir: join_paths(get_option('sysconfdir'), 'xdg/autostart'))
install_data('data/org.opensuse.opensuse_welcome.appdata.xml', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'metainfo'))
install_data('data/org.opensuse.opensuse_welcome.svg', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'icons/hicolor/scalable/apps'))
install_data('data/org.opensuse.opensuse_welcome-symbolic.svg', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'icons/hicolor/symbolic/apps'))
install_data('data/xfce-apply-layout.py', install_dir: share_dir)

meson.add_install_script('data/cleanup.sh')
meson.add_install_script('data/i18n.sh', join_paths(share_dir, 'i18n'))
