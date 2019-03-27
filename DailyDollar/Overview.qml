import QtQuick 2.12
import QtQuick.Controls 2.5
//import QtCharts 2.3
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
        ListView {
            id: transactionList
            width: parent.width
            height: parent.height*0.6
            model: tempModel
            delegate: TransactionListDelegate {
                width: parent.width
                height: parent.width*0.1
                isTransaction: transaction == "true"
                date: date.toString()
                net: net.toString()
                description: description.toString()
                amount: amount
                amountText: amountText.toString()
            }
        }
        ListModel {
            id: tempModel
            ListElement {
                transaction: "false"
                date: "2018-02-16"
                net: "$2500.00"
                description: ""
                amount: 0.0
                amountText: ""
            }
            ListElement {
                transaction: "true"
                date: ""
                net: ""
                description: "groceries"
                amount: -25.00
                amountText: "-$25.00"
            }
            ListElement {
                transaction: "false"
                date: "2018-02-17"
                net: "$2525.00"
                description: ""
                amount: 0.0
                amountText: ""
            }
            ListElement {
                transaction: "false"
                date: "2018-02-18"
                net: "$2575.00"
                description: ""
                amount: 0.0
                amountText: ""
            }
            ListElement {
                transaction: "true"
                date: ""
                net: ""
                description: "tax refund"
                amount: 300.00
                amountText: "+$300.00"
            }
        }
    }
}
