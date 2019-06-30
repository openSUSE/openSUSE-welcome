#include "enabler.h"

Enabler::Enabler(QObject *parent) : QObject(parent)
{

}
void Enabler::enableAutostart()
{
    qDebug() << "enable autostart called";
    if (fileExists(QDir::homePath() + "/.config/autostart/welcome.desktop")) {
        QFile file(QDir::homePath() + "/.config/autostart/welcome.desktop");

        file.remove();

        qDebug() << "there was a file, so we removed it";
        return;
    }
    qDebug() << "there wasn't a file, so we didn't remove it";
}

void Enabler::disableAutostart()
{
    qDebug() << "disable autostart called";
    QFile::copy(":/desktop-file/welcome.desktop", QDir::homePath() + "/.config/autostart/welcome.desktop");
    qDebug() << QDir::homePath() + "/.config/autostart/welcome.desktop";
}
bool Enabler::fileExists(QString path)
{
    QFileInfo check_file(path);

    if (check_file.exists() && check_file.isFile()) {
        qDebug() << "file exists";
        return true;
    } else {
        qDebug() << "file does not exist";
        return false;
    }
}
bool Enabler::autostartEnabled()
{
    qDebug() << "checking if autostart is enabled";
    if (fileExists(QDir::homePath() + "/.config/autostart/welcome.desktop")) {
        qDebug() << "there is a file to disable, so it's disabled";
        return false;
    } else {
        qDebug() << "there isn't a file to disable, so it's enabled";
        return true;
    }
}
void Enabler::toggle() {
    qDebug() << "checking if autostart is enabled";
    if (fileExists(QDir::homePath() + "/.config/autostart/welcome.desktop")) {
        qDebug() << "there is a file to disable, so it's disabled";
        enableAutostart();
    } else {
        qDebug() << "there isn't a file to disable, so it's enabled";
        disableAutostart();
    }
}
bool Enabler::isLive() {
    qDebug() << "Checking if we are live";
    if (fileExists("/usr/bin/liveinst")) {
        qDebug() << "We are live";
        return true;
    } else {
        qDebug() << "We aren't live";
        return false;
    }
}
