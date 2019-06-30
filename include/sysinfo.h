/*
#ifndef SYSINFO_H
#define SYSINFO_H

#include <QObject>
#include <QProcess>

class SysInfo : public QObject
{
    Q_OBJECT
public:
    explicit SysInfo(QObject *parent = 0);
    ~SysInfo();
    Q_INVOKABLE QString getOS();
    Q_INVOKABLE QString getArch();
protected:
    Q_PROPERTY(QProcess *m_process)

public slots:
};

#endif // SYSINFO_H
*/
#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>

class SysInfo : public QObject
{
    Q_OBJECT

public:
    explicit SysInfo(QObject *parent = nullptr);

    Q_INVOKABLE QString getOS();
    Q_INVOKABLE QString getArch();

signals:
    void userNameChanged();

};

#endif // BACKEND_H
