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

#pragma once

#include <QObject>

class SysInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString os READ getOS CONSTANT FINAL)
    Q_PROPERTY(QString arch READ getArch CONSTANT FINAL)

public:
    explicit SysInfo(QObject *parent = nullptr);

    QString getOS();
    QString getArch();
};
