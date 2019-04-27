#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "cjoystick.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_DisableShaderDiskCache);

    QGuiApplication app(argc, argv);
    qmlRegisterType<cJoystick>("Gyco", 1, 0, "RigJoystick");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
