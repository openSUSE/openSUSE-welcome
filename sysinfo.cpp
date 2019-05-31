/*
#include "sysinfo.h"

SysInfo::SysInfo(QObject *parent) : QObject(parent), m_process(new QProcess(this))
{
    return;
}

QString SysInfo::getOS()
{
    return QSysInfo::prettyProductName();
}
QString SysInfo::getArch()
{
    return QSysInfo::currentCpuArchitecture();
}

SysInfo::~SysInfo()
{

}
*/
#include "sysinfo.h"

SysInfo::SysInfo(QObject *parent) :
    QObject(parent)
{
}

QString SysInfo::getOS()
{
    return QSysInfo::prettyProductName();
}

QString SysInfo::getArch()
{
    return QSysInfo::currentCpuArchitecture();
}
