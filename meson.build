project('opensuse-welcome', 'cpp')
qt5 = import('qt5')
qt5_dep = dependency('qt5', modules: ['Core', 'Quick', 'WebEngine', 'WebChannel'])
inc = include_directories('include')
qresource_files = ['qml.qrc', 'webresources.qrc', 'i18n.qrc'] # incoming hell of hella files (maybe?)
processed_files = qt5.preprocess(moc_headers: ['include/enabler.h', 'include/launcher.h', 'include/sysinfo.h'],
                                 include_directories: inc,
                                 qresources: qresource_files)

lconvert_prog = find_program('lconvert-qt5')
i18n_gen = generator(lconvert_prog,
                     output: '@BASENAME@.qm',
                     arguments: ['@INPUT@', '-o', '@OUTPUT@'])

trans = ['i18n/base.po', 'i18n/qml_de.po', 'i18n/qml_en.po']
i18n_files = []

foreach tran : trans
    i18n_files += i18n_gen.process(tran)
endforeach

subdir('src')

install_data('org.opensuse.opensuse_welcome.desktop', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'applications'))
install_data('org.opensuse.opensuse_welcome.desktop', install_dir: join_paths(get_option('sysconfdir'), 'xdg/autostart'))
install_data('org.opensuse.opensuse_welcome.appdata.xml', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'metainfo'))
install_data('org.opensuse.opensuse_welcome.svg', install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'icons/hicolor/scalable/apps'))
