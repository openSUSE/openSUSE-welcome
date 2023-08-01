#ifndef PANELLAYOUTER_H
#define PANELLAYOUTER_H

#include <QObject>

class PanelLayouter : public QObject
{
    Q_OBJECT
public:
    explicit PanelLayouter(QObject *parent = nullptr);
    Q_INVOKABLE void applyLayout(const QString &path);
    Q_INVOKABLE void setTheme(const QString &theme);
    Q_INVOKABLE void setIconTheme(const QString &theme);
    Q_INVOKABLE void setFont(const QString &theme);
    Q_INVOKABLE void runCommand(const QString &cmd);
    Q_INVOKABLE void setLook(const QString &look);
};

#endif // PANELLAYOUTER_H
