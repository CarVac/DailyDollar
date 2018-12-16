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

            TextInput {
                id: inputAmount
                anchors.fill: parent
                font.pointSize: 30
                color: 'black'
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
            }
            Item { // spacer
                width: parent.width
                height: parent.height/10
            }
        }

        Item {
            width: parent.width
            height: parent.height/10
        }

        Text {
            width: parent.width
            height: parent.width/7
            text: qsTr("Description")
            font.pointSize: 30
        }

        Rectangle {
            id: description
            width: parent.width
            height: parent.width/5
            color: 'white'
            border.color: 'black'
            border.width: parent.width/200
            radius: height/10

            TextInput {
                id: inputDescription
                anchors.fill: parent
                font.pointSize: 30
                color: 'black'
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
            }
        }

        Item {
            width: parent.width
            height: parent.height/10
        }

        Button {
            width: parent.width
            height: parent.width/5
            text: qsTr("Submit")
            font.pointSize: 30

            onPressed: {
                inputAmount.text = ""
                inputDescription.text = ""
            }
        }
    }
}
