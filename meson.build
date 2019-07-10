project('opensuse-welcome', 'cpp')
qt5 = import('qt5')
qt5_dep = dependency('qt5', modules: ['Core', 'Quick', 'WebEngine', 'WebChannel'])
inc = include_directories('include')
qresource_files = ['qrc/qml.qrc', 'qrc/webresources.qrc', 'qrc/i18n.qrc']
processed_files = qt5.preprocess(moc_headers: ['include/enabler.h', 'include/launcher.h', 'include/sysinfo.h'],
                                 include_directories: inc,
                                 qresources: qresource_files)

subdir('src')
subdir('data')
