#ifndef ENABLER_H
#define ENABLER_H

#include <QObject>
#include <QFile>
#include <QDir>
#include <QFileInfo>
#include <QtDebug>

class Enabler : public QObject
{
    Q_OBJECT
public:
    explicit Enabler(QObject *parent = nullptr);
    Q_INVOKABLE void enableAutostart();
    Q_INVOKABLE void disableAutostart();
    Q_INVOKABLE bool autostartEnabled();
    Q_INVOKABLE void toggle();
    Q_INVOKABLE bool isLive();
private:
    bool fileExists(QString path);

signals:

public slots:
};

#endif // ENABLER_H
