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

#include <QCoreApplication>
#include "launcher.h"

Launcher::Launcher(QObject *parent) :
    QObject(parent),
    m_process(new QProcess(this))
{
    m_plasmaWelcomeInstalled = programExists("plasma-welcome");
    connect(QCoreApplication::instance(), &QCoreApplication::aboutToQuit, QCoreApplication::instance(), [installed = m_plasmaWelcomeInstalled] {
        if (installed) {
            QProcess::startDetached("plasma-welcome", {});
        }
    });
}
void Launcher::launch(const QString &program)
{
    m_process->startDetached(program);
}
QString Launcher::currentDE()
{
    QByteArray bytes = qgetenv("XDG_CURRENT_DESKTOP");
    QString output = QString::fromLocal8Bit(bytes);
    if (bytes == "KDE") {
        return "Plasma";
    }
    return output;
}
bool Launcher::programExists(const QString &name)
{
    QProcess findProcess;
    findProcess.start("which", {name});

    if (!findProcess.waitForFinished())
        return false;

    return findProcess.exitCode() == 0;
}
Launcher::~Launcher() {
}
