#include "Cognex.h"

Cognex::Cognex(QObject *parent)
{
}

void Cognex::dealing(std::vector<unsigned char> buffer)
{
    std::string str(buffer.begin(), buffer.end());
    QString result = QString::fromStdString(str);
    if (!result.isEmpty())
    {
        qDebug("scanCode 1:", result);
        QStringList parts = result.split(',');
        qDebug() << "scanCode" << parts.first(); // 返回第一个逗号前的内容
    }
    else
    {
        LogWarn("cognex return null.");
    }
    return;
}

// void Cognex::pingBehavior()
// {
//     scanCode();
// }

void Cognex::scanCode()
{
    sendData("+");
}

// bool Cognex::connectToServer(const QString &serverAddress, quint16 port)
// {
//     socket->connectToHost(serverAddress, port);
//     return socket->waitForConnected();
// }

Cognex::~Cognex() noexcept
{
    sendData("-");
}