import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: root

    width: 1024
    height: 768
    visible: true
    title: qsTr("BBL Glasses Connectivity Feature")

    BorderImage {
        id: name
        source: "qrc:/assets/mainGeometricBack.png"
        anchors.fill: parent
        //width: 100; height: 100
        //border.left: 5; border.top: 5
        //border.right: 5; border.bottom: 5
    }

    Rectangle{
        id: statusBar

        width: root.width
        height: 88
        anchors{
            top: root.top
            topMargin: 0
        }
        color: "transparent"

        Button {
            id: radarButton

            flat: false
            text: "Glasses"
            font.pixelSize: 23
            display : AbstractButton.TextBesideIcon
            icon {
                color : "black"
                height : 50
                width : 50
                source : "qrc:/assets/radarIcon_256.png"
            }

            width: 150
            height: 70
            anchors{
                verticalCenter: statusBar.verticalCenter
                horizontalCenter: statusBar.horizontalCenter
                horizontalCenterOffset: -425

            }
            onPressed: {
                radarButton.down = true
                radarGlassPopUpView.visible = true
            }
        }
    }


    Rectangle{
        id: mainViewBar

        width: root.width
        height: 590
        anchors{
            top: statusBar.bottom
            topMargin: 0
        }
        color: "transparent"
    }


    Rectangle{
        id: radarGlassPopUpView

        width: 950
        height: 700
        anchors{
            centerIn: parent
        }
        color: "white"
        border.color: "black"
        border.width: 2
        radius: 5
        visible: radarButton.down

        RadarPopupComponent {
            id: radarViewport

            onComponentCloseSignal: {
                radarGlassPopUpView.visible = false
            }

        }
    }
}
