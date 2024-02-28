welcome_sources = ['enabler.cpp', 'launcher.cpp', 'main.cpp', 'sysinfo.cpp', 'panellayouter.cpp']

welcome = executable('opensuse-welcome', 
                     welcome_sources, 
                     processed_files, 
                     include_directories : inc,
                     dependencies: qt6_dep,
                     cpp_args: '-DWELCOME_SHARE_DIR="@0@"'.format(share_dir),
                     install: true)
