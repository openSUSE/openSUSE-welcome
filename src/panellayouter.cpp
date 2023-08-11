#include "panellayouter.h"
#include <memory>
#include <QFile>
#include <QProcess>
#include <QTemporaryFile>

PanelLayouter::PanelLayouter(QObject *parent) : QObject(parent)
{
}

void PanelLayouter::applyLayout(const QString &path)
{
    const QString SHARE_DIR(QStringLiteral(WELCOME_SHARE_DIR));
    const QString APPLY_LAYOUT_SCRIPT = SHARE_DIR + QStringLiteral("/xfce-apply-layout.py");
    // `path` is only an internal application resource, embedded into the
    // executable. We need to actually place it on disk for the helper script
    // to use it.
    //
    // this is not well documented, but createNativeFile returns a heap
    // allocated file object that we need to cleanup.
    std::unique_ptr<QTemporaryFile> file(QTemporaryFile::createNativeFile(path));

    if (!file)
        // should never happen
        return;

    const auto result = QProcess::execute(APPLY_LAYOUT_SCRIPT, {file->fileName()});

    if (result != 0) {
	// TODO: something went wrong, display error message?
    }
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
