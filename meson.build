project('opensuse-welcome', 'cpp')
qt5 = import('qt5')
qt5_dep = dependency('qt5', modules: ['Core', 'Quick', 'WebEngine', 'WebChannel'])
inc = include_directories('include')
qresource_files = ['qml.qrc', 'webresources.qrc']
processed_files = qt5.preprocess(moc_headers: ['include/enabler.h', 'include/launcher.h', 'include/sysinfo.h'],
                                 include_directories: inc,
                                 qresources: qresource_files)

i18n_script = find_program('i18n.sh',
                           required: true)
                           
r = run_command(i18n_script)

subdir('src')

install_subdir('i18n', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'openSUSE-Welcome'))
install_data('org.opensuse.opensuse_welcome.desktop', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'applications'))
install_data('org.opensuse.opensuse_welcome.desktop', install_dir: join_paths(get_option('sysconfdir'), 'xdg/autostart'))
install_data('org.opensuse.opensuse_welcome.appdata.xml', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'metainfo'))
install_data('org.opensuse.opensuse_welcome.svg', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'icons/hicolor/scalable/apps'))
install_data('org.opensuse.opensuse_welcome-symbolic.svg', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'icons/hicolor/symbolic/apps'))

meson.add_install_script('cleanup.sh')