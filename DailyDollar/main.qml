import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 720
    height: 1280
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Entry {
        }

        Overview {
        }

        Recurring {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Entry")
        }
        TabButton {
            text: qsTr("Overview")
        }
        TabButton {
            text: qsTr("Recurring")
        }
    }
}
