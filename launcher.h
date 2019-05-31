#ifndef LAUNCHER_H
#define LAUNCHER_H
#include <QObject>
#include <QProcess>
class Launcher : public QObject
{
    Q_OBJECT
public:
    explicit Launcher(QObject *parent = nullptr);
    ~Launcher();
    Q_INVOKABLE QString launch(const QString &program);
    Q_INVOKABLE QString currentDE();
protected:
    QProcess *m_process;
};
#endif
