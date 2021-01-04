import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id :rootRadarItem

    anchors.fill: parent
    clip: true

    signal componentCloseSignal

    Text {
        id: popUpTitle
        text: qsTr("BBL Glasses In field connectivity ")
        font.pixelSize: 30
        anchors{
            top: parent.top
            topMargin: 40
            horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: radarBBLGlassesView

        width: 400
        height: 450
        anchors {
            top: rootRadarItem.top
            topMargin: 100
            left: rootRadarItem.left
            leftMargin: 20

        }
        border.color: "#012822"
        radius: 5

        BorderImage {
            id: radarImage

            source: "qrc:/assets/radar_256.png"
            width: radarBBLGlassesView.width - 30
            height: radarBBLGlassesView.height - 50
            anchors{
                horizontalCenter: radarBBLGlassesView.horizontalCenter
                verticalCenter:  radarBBLGlassesView.verticalCenter
            }
            border {
                left: 5
                top: 5
                right: 5
                bottom: 5
            }
        }

        Slider {
            id: radarRangeSelector

            from: 0
            value: 0
            to: 100
            stepSize: 25
            snapMode : Slider.SnapAlways
            width: parent.width
            anchors {
                top: radarImage.bottom
                topMargin: 40
            }

            Row {
                id: sliderPoints

                width: parent.width
                anchors{
                    top: parent.bottom
                    left: parent.left
                    leftMargin: 15
                }
                spacing: 75
                Text {text: "0"}
                Text {text: "25"}
                Text {text: "50"}
                Text {text: "75"}
                Text {text: "100"}
            }
        }
    }

    Rectangle {
        id: radarBBLGlassesListGridViewContainer

        width: 490
        height: 450
        anchors {
            top: rootRadarItem.top
            topMargin: 100
            left: radarBBLGlassesView.right
            leftMargin: 20
        }

        color: "transparent"

        Row {
            id: menuTypeButtons

            width: parent.width
            height: listViewButton.height
            spacing: 10

            Button {
                id: listViewButton

                flat: false
                text: "List View"
                font.pixelSize: 25

                display : AbstractButton.TextBesideIcon
                icon {
                    color : "black"
                    height : 50
                    width : 50
                    source : "qrc:/assets/listView.png"
                }

                width: (parent.width - parent.spacing) / 2
                height: 70
                onPressed: {
                    selectedViewLoader.sourceComponent = listViewComponent
                }
            }

            Button {
                id: gridViewButton

                flat: false
                text: "Grid View"
                font.pixelSize: 25

                display : AbstractButton.TextBesideIcon
                icon {
                    color : "black"
                    height : 50
                    width : 50
                    source : "qrc:/assets/gridView.png"
                }

                width: (parent.width - parent.spacing) / 2
                height: 70
                onPressed: {
                    selectedViewLoader.sourceComponent = gridViewComponent
                }
            }

        }

        Rectangle {
            id: loaderContainer

            anchors {
                top: menuTypeButtons.bottom
                topMargin: 10
                left: parent.left
                leftMargin: 10
                right: parent.right
                rightMargin: 10
                bottom: parent.bottom
            }
            border.color: "black"
            border.width: 1
            radius: 2

            Loader {
                id : selectedViewLoader
                anchors.fill: parent
                sourceComponent: listViewComponent
                clip: true
            }

            Component {
                id :listViewComponent

                ScrollView {

                    anchors{
                        fill: parent
                    }
                    clip: true

                    ListView {
                        id: listView

                        width: parent.width
                        model: 15
                        anchors{
                            top: parent.top
                            topMargin: 5
                            left: parent.left
                            leftMargin: 10
                        }
                        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                        delegate: Column {
                            Image { source: "qrc:/assets/glasses_64.png";
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text { text: "BBL Glass # " + (index + 1);
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                        clip: true

                        ColorAnimation {
                            from: "white"
                            to: "black"
                            duration: 200
                        }
                    }
                }
            }

            Component {
                id: gridViewComponent

                GridView {
                    id: gridView

                    width: parent.width
                    height: parent.height
                    anchors{
                        top: parent.top
                        topMargin: 5
                        left: parent.left
                        leftMargin: 30
                    }
                    clip: true
                    highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                    model: 15
                    delegate: Column {

                        BorderImage {
                            source: "qrc:/assets/glasses_64.png"
                            //anchors.fill: parent
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Text {
                            text: "BBL Glass # " + (index + 1);
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }

            }
        }
    }

    Button {
        id: closeButton

        flat: false
        text: "Close"
        anchors{
            bottom: parent.bottom
            bottomMargin: 25
            right: parent.right
            rightMargin: 25
        }
        font.pixelSize: 25
        width: 150
        onPressed: {
            componentCloseSignal()
        }
    }
}
