#include "panellayouter.h"
#include <QFile>
#include <QProcess>

PanelLayouter::PanelLayouter(QObject *parent) : QObject(parent)
{
    m_script = R"(
import sys
sys.path.append('/usr/share/xfce4-panel-profiles/xfce4-panel-profiles/')
import gi

from panelconfig import PanelConfig
from gi.repository import Gio

session_bus = Gio.BusType.SESSION
cancellable = None
connection = Gio.bus_get_sync(session_bus, cancellable)

proxy_property = 0
interface_properties_array = None
destination = 'org.xfce.Xfconf'
path = '/org/xfce/Xfconf'
interface = destination

xfconf = Gio.DBusProxy.new_sync(
    connection,
    proxy_property,
    interface_properties_array,
    destination,
    path,
    interface,
    cancellable)

PanelConfig.from_file("/tmp/layout").to_xfconf(xfconf)
)";
}

void PanelLayouter::applyLayout(const QString &path)
{
    if (QFile::exists("/tmp/layout"))
        QFile::remove("/tmp/layout");

    QFile layout(path);
    layout.copy("/tmp/layout");

    QProcess::startDetached("/usr/bin/python3", {"-c", m_script});
}

void PanelLayouter::setTheme(const QString &theme)
{
    QProcess::startDetached("xfconf-query", { "-c", "xsettings", "-p", "/Net/ThemeName", "-s", theme });
}

void PanelLayouter::setIconTheme(const QString &theme)
{
    QProcess::startDetached("xfconf-query", { "-c", "xsettings", "-p", "/Net/IconThemeName", "-s", theme });
}


void PanelLayouter::setFont(const QString &theme)
{
    QProcess::startDetached("xfconf-query", { "-c", "xsettings", "-p", "/Gtk/FontName", "-s", theme });
}

void PanelLayouter::runCommand(const QString &cmd)
{
    QProcess::startDetached(cmd);
}

void PanelLayouter::setLook(const QString &look)
{
    if (look == "gbGkLight") {
        this->setTheme("Greybird-Geeko-Light");
        this->setFont("Noto Sans 11");
        this->setIconTheme("elementary-xfce");
    } else if (look == "gbGkDark") {
        this->setTheme("Greybird-Geeko-Dark");
        this->setFont("Noto Sans 11");
        this->setIconTheme("elementary-xfce-dark");
    } else if (look == "aLight") {
        this->setTheme("Adwaita");
        this->setFont("Cantarell 11");
        this->setIconTheme("Adwaita");
    } else if (look == "aDark") {
        this->setTheme("Adwaita-dark");
        this->setFont("Cantarell 11");
        this->setIconTheme("Adwaita");
    }
}