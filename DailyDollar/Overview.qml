import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.3
import QtQuick.Window 2.12

Page {
    width: 720
    height: 1280

    header: Label {
        text: qsTr("Page 2")
        //font.pixelSize: Qt.application.font.pixelSize * 2
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
        Text {
            width: parent.width
            height: parent.height*0.1
            text: Screen.devicePixelRatio
            font.pointSize: 30
        }
    }
}
