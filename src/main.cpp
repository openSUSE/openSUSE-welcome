/*
    openSUSE Welcome - A welcome utility
    Copyright (C) 2019  Carson Black

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
 
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine/QtWebEngine>
#include <QTranslator>
#include <QLocale>
#include <QDir>
#include <QQuickStyle>
#include "sysinfo.h"
#include "launcher.h"
#include "enabler.h"

void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
//  return;

    QByteArray localMsg = msg.toLocal8Bit();
    const char *file = context.file ? context.file : "";
    const char *function = context.function ? context.function : "";
    switch (type) {
    case QtDebugMsg:
        fprintf(stderr, "Debug: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    case QtInfoMsg:
        fprintf(stderr, "Info: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    case QtWarningMsg:
        fprintf(stderr, "Warning: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    case QtCriticalMsg:
        fprintf(stderr, "Critical: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    case QtFatalMsg:
        fprintf(stderr, "Fatal: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    }
}

int main(int argc, char *argv[])
{
    qInstallMessageHandler(myMessageOutput);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    app.setDesktopFileName("org.opensuse.opensuse_welcome.desktop");
    app.setOrganizationName("openSUSE");
    app.setOrganizationDomain("opensuse.org");
    app.setApplicationName("org.opensuse.opensuse_welcome");

    qmlRegisterType<SysInfo>("me.appadeia.SysInfo", 1, 0, "SysInfo");
    qmlRegisterType<Launcher>("me.appadeia.Launcher", 1, 0, "Launcher");
    qmlRegisterType<Enabler>("me.appadeia.Enabler", 1, 0, "Enabler");

    qDebug() << QLocale::system().name();
    QTranslator qtTranslator;
    qtTranslator.load("qt_" + QLocale::system().name(),
                      QLibraryInfo::location(QLibraryInfo::TranslationsPath));
    app.installTranslator(&qtTranslator);

    QTranslator welcomeTranslator;
    welcomeTranslator.load("qml_" + QLocale::system().name(), "/usr/share/openSUSE-Welcome/i18n");
    app.installTranslator(&welcomeTranslator);

    QDir autostartFolder(QDir::homePath() + "/.config/autostart/");
    if (!autostartFolder.exists()) {
        autostartFolder.mkdir(QDir::homePath() + "/.config/autostart/");
    }

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QtWebEngine::initialize();
    return app.exec();
}
