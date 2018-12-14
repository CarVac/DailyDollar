import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: root
    width: 720
    height: 1280

    Column {
        width: parent.width * 0.7
        height: parent.height * 0.7
        anchors.centerIn: parent
        Text {
            width: parent.width
            height: parent.width/7
            text: qsTr("Transaction Amount")
            font.pointSize: 30
        }

        Rectangle {
            id: amount
            width: parent.width
            height: parent.width/5
            color: 'white'
            border.color: 'black'
            border.width: parent.width/200
            radius: height/10
            Text {
                anchors.fill: parent
                text: inputAmount.text=="" ? qsTr("Enter amount here") : ""
                color: 'black'
                font.pointSize: 30
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            TextInput {
                id: inputAmount
                anchors.fill: parent
                font.pointSize: 30
                color: 'black'
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
            }
        }
    }
}
