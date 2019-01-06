import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: root
    width: 720
    height: 1280

    header: Label {
        text: qsTr("$25.40")
        font.pointSize: 30
        padding: parent.width/30
    }

    Column {
        width: parent.width*0.95
        height: parent.height*0.95
        anchors.centerIn: parent

        Rectangle {
            id: chartrect
            width: parent.width
            height: parent.height*0.3
            color: 'blue'
        }
    }

}
