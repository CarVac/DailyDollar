import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: root
    width: 720
    height: 1280

    Rectangle {
        anchors.centerIn: parent
        width: Math.min(parent.height,parent.width)/2
        height: Math.min(parent.height,parent.width)/2
        color: 'green'
    }
}
