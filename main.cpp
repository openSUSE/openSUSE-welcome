#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine/QtWebEngine>
#include "sysinfo.h"
#include "launcher.h"
#include "enabler.h"

void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
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
    // qInstallMessageHandler(myMessageOutput);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    app.setOrganizationName("openSUSE");
    app.setOrganizationDomain("opensuse.org");
    app.setApplicationName("Welcome");

    qmlRegisterType<SysInfo>("me.appadeia.SysInfo", 1, 0, "SysInfo");
    qmlRegisterType<Launcher>("me.appadeia.Launcher", 1, 0, "Launcher");
    qmlRegisterType<Enabler>("me.appadeia.Enabler", 1, 0, "Enabler");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    app.setWindowIcon(QIcon::fromTheme(QString("openSUSE-distributor-logo")));
    QtWebEngine::initialize();
    return app.exec();
}
