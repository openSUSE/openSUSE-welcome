#pragma once

#include <QObject>

class Enabler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool live READ isLive CONSTANT)
    Q_PROPERTY(bool autostart READ autostartEnabled WRITE setAutostart NOTIFY autostartChanged)

public:
    explicit Enabler(QObject *parent = nullptr);
    void setAutostart(bool autostart);
    bool autostartEnabled();
    void toggle();
    bool isLive();

signals:
    void autostartChanged();

private:
    bool fileExists(QString path);
    void enableAutostart();
    void disableAutostart();
};
