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

#include "launcher.h"

#include <QProcess>

Launcher::Launcher(QObject *parent)
    : QObject(parent)
{}
void Launcher::launch(const QString &program)
{
    QProcess::startDetached(program, {});
}
QString Launcher::currentDE()
{
    QByteArray bytes = qgetenv("XDG_CURRENT_DESKTOP");
    QString output = QString::fromLocal8Bit(bytes);
    if (bytes == "KDE")
    {
        return "Plasma";
    }
    return output;
}
Launcher::~Launcher() {}
