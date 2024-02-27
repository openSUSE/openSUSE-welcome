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
#include <QWebEngineUrlSchemeHandler>
#include <QWebEngineUrlRequestJob>
#include <QQuickWebEngineProfile>
#include <QWebEngineUrlScheme>
#include <QLibraryInfo>
#include <QMimeDatabase>
#include <QTranslator>
#include <QLocale>
#include <QDir>
#include "sysinfo.h"
#include "launcher.h"
#include "enabler.h"
#include "panellayouter.h"

/// a workaround since QMimeDatabase detects .html as "application/x-extension-html" (chromium doesn't like this)
/// instead of "text/html" as it used to.
///
/// cf QTBUG-106688.
class WorkaroundSchemeHandler : public QWebEngineUrlSchemeHandler
{
public:
    WorkaroundSchemeHandler(QObject *parent = nullptr) : QWebEngineUrlSchemeHandler(parent)
    {
    }
    void requestStarted(QWebEngineUrlRequestJob *job) override
    {
        QByteArray requestMethod = job->requestMethod();
        if (requestMethod != "GET") {
            job->fail(QWebEngineUrlRequestJob::RequestDenied);
            return;
        }

        QUrl requestUrl = job->requestUrl();
        QString requestPath = requestUrl.path();
        std::unique_ptr<QFile> file(new QFile(':' + requestPath, job));
        if (!file->exists() || file->size() == 0) {
            job->fail(QWebEngineUrlRequestJob::UrlNotFound);
            return;
        }
        QFileInfo fileInfo(*file);
        QMimeDatabase mimeDatabase;
        QMimeType mimeType = mimeDatabase.mimeTypeForFile(fileInfo);
        if (mimeType.name() == "application/x-extension-html") {
            mimeType = mimeDatabase.mimeTypeForName("text/html");
        }
        job->reply(mimeType.name().toUtf8(), file.release());
    }
};

int main(int argc, char *argv[])
{
    QWebEngineUrlScheme qrcScheme(QByteArrayLiteral("qrc"));
    qrcScheme.setFlags(QWebEngineUrlScheme::SecureScheme
                    | QWebEngineUrlScheme::LocalAccessAllowed
                    | QWebEngineUrlScheme::CorsEnabled
                    | QWebEngineUrlScheme::ViewSourceAllowed);
    QWebEngineUrlScheme::registerScheme(qrcScheme);
    QWebEngineUrlScheme aqrcScheme(QByteArrayLiteral("aqrc"));
    aqrcScheme.setFlags(QWebEngineUrlScheme::SecureScheme
                    | QWebEngineUrlScheme::LocalAccessAllowed
                    | QWebEngineUrlScheme::CorsEnabled
                    | QWebEngineUrlScheme::ViewSourceAllowed);
    QWebEngineUrlScheme::registerScheme(aqrcScheme);

    QtWebEngineQuick::initialize();
    QGuiApplication app(argc, argv);

    WorkaroundSchemeHandler *handler = new WorkaroundSchemeHandler(&app);
    QQuickWebEngineProfile::defaultProfile()->installUrlSchemeHandler("aqrc", handler);

    app.setDesktopFileName("org.opensuse.opensuse_welcome");
    app.setOrganizationName("openSUSE");
    app.setOrganizationDomain("opensuse.org");
    app.setApplicationName("org.opensuse.opensuse_welcome");

    qmlRegisterType<SysInfo>("org.openSUSE.Welcome", 1, 0, "SysInfo");
    qmlRegisterType<Launcher>("org.openSUSE.Welcome", 1, 0, "Launcher");
    qmlRegisterType<Enabler>("org.openSUSE.Welcome", 1, 0, "Enabler");
    qmlRegisterType<PanelLayouter>("org.openSUSE.Welcome", 1, 0, "XfceLayouter");

    QTranslator qtTranslator;
    [[maybe_unused]] auto mainTranslatorLoaded = qtTranslator.load("qt_" + QLocale::system().name(),
                     QLibraryInfo::path(QLibraryInfo::TranslationsPath));
    app.installTranslator(&qtTranslator);

    QTranslator welcomeTranslator;
    [[maybe_unused]] auto welcomeTranslatorLoaded = welcomeTranslator.load("qml_" + QLocale::system().name(),
                     "/usr/share/openSUSE-Welcome/i18n");
    app.installTranslator(&welcomeTranslator);

    QDir autostartFolder(QDir::homePath() + "/.config/autostart/");
    if (!autostartFolder.exists()) {
        autostartFolder.mkdir(QDir::homePath() + "/.config/autostart/");
    }

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
