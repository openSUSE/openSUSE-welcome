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
    Q_INVOKABLE void launch(const QString &program);
    Q_INVOKABLE QString currentDE();
    Q_PROPERTY(bool plasmaWelcomeInstalled MEMBER m_plasmaWelcomeInstalled CONSTANT)
    bool programExists(const QString& name);
protected:
    QProcess *m_process;
    bool m_plasmaWelcomeInstalled;
};
#endif
