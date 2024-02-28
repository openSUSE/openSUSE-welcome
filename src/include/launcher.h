#pragma once

#include <QObject>

class Launcher : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString currentDE READ currentDE CONSTANT FINAL)

public:
    explicit Launcher(QObject *parent = nullptr);
    ~Launcher();

    Q_INVOKABLE void launch(const QString &program);
    QString currentDE();
};
