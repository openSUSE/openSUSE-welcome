import QtQuick
import QtQuick.Controls

Button {
    id: buttonRoot

    required property color themeColor

    implicitWidth: 200
    implicitHeight: 40
    icon.height: font.pixelSize
    icon.color: palette.text

    background: Rectangle {
        border.color: (buttonRoot.pressed || hh.hovered) ? Qt.darker(themeColor, 1.4) : themeColor
        color: (buttonRoot.pressed || hh.hovered) ? Qt.darker(themeColor, 1.4) : themeColor
        radius: 5
        width: buttonRoot.width
        height: buttonRoot.height

        Behavior on color { ColorAnimation { duration: 100 } }
    }

    HoverHandler {
        id: hh
        cursorShape: Qt.PointingHandCursor
    }
}
