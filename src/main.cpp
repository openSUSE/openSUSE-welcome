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

#include <QDir>
#include <QGuiApplication>
#include <QLibraryInfo>
#include <QLocale>
#include <QQmlApplicationEngine>
#include <QTranslator>

#include "enabler.h"
#include "launcher.h"
#include "panellayouter.h"
#include "sysinfo.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setDesktopFileName("org.opensuse.opensuse_welcome");
    app.setOrganizationName("openSUSE");
    app.setOrganizationDomain("opensuse.org");
    app.setApplicationName("org.opensuse.opensuse_welcome");

    qmlRegisterType<SysInfo>("org.openSUSE.Welcome", 1, 0, "SysInfo");
    qmlRegisterType<Launcher>("org.openSUSE.Welcome", 1, 0, "Launcher");
    qmlRegisterType<Enabler>("org.openSUSE.Welcome", 1, 0, "Enabler");
    qmlRegisterType<PanelLayouter>("org.openSUSE.Welcome", 1, 0, "XfceLayouter");

    QTranslator qtTranslator;
    if (qtTranslator.load(
            QLocale(), QStringLiteral("qtbase"), QStringLiteral("_"), QLibraryInfo::path(QLibraryInfo::TranslationsPath)))
    {
        app.installTranslator(&qtTranslator);
    }
    else
        qDebug() << "Failed to load qtbase translations: " << QLibraryInfo::path(QLibraryInfo::TranslationsPath);
    QTranslator qmlTranslator;
    if (qmlTranslator.load(QLocale(),
                           QStringLiteral("qtdeclarative"),
                           QStringLiteral("_"),
                           QLibraryInfo::path(QLibraryInfo::TranslationsPath)))
    {
        app.installTranslator(&qmlTranslator);
    }
    else
        qDebug() << "Failed to load qtdeclarative translations";

    QTranslator welcomeTranslator;
    if (welcomeTranslator.load("qml_" + QLocale::system().name(), "/usr/share/openSUSE-Welcome/i18n"))
        app.installTranslator(&welcomeTranslator);
    else
        qWarning() << "Failed to load openSUSE Welcome translations";

    QDir autostartFolder(QDir::homePath() + "/.config/autostart/");
    if (!autostartFolder.exists())
    {
        autostartFolder.mkdir(QDir::homePath() + "/.config/autostart/");
    }

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
