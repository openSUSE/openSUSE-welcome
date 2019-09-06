import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.12

Button {
    id: root
    hoverEnabled: true
    width: 210
    height: 38

    property alias color: label.color
    property color bgColor: "#ffc107"
    property color hoverColor: "#e0a800"
    property color downColor: "#d39e00"
    property alias weight: label.font.weight

    property color nonPushedColor: hovered ? hoverColor : bgColor

    FontLoader {
        id: labelfont
        source: "qrc:/web/fonts/OpenSans-Regular.woff"
    }
    background: Rectangle {
        color: root.down ? root.downColor : root.nonPushedColor
        radius: 4
        Behavior on color {
            ColorAnimation {
                duration: 150
                easing.type: Easing.InOutQuad
            }
        }
    }
    contentItem: Text {
        id: label
        text: root.text
        font.family: "Open Sans"
        font.pixelSize: 16
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}