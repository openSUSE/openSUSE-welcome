import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.12

Rectangle {
    color: "white"
    FontLoader {
        id: header
        source: "qrc:/web/fonts/OpenSans-ConfBold.woff"
    }
    FontLoader {
        id: labelfont
        source: "qrc:/web/fonts/OpenSans-Regular.woff"
    }
    ColumnLayout {
        anchors.fill: parent
        Rectangle {
            color: "#e9ecef"
            Layout.fillWidth: true
            height: 45
        }
        SwipeView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            ColumnLayout {
                spacing: 16
                Column {
                    Layout.leftMargin: 55
                    Layout.rightMargin: 55
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 16
                    Label {
                        Layout.leftMargin: 55
                        color: "black"
                        text: "Ahoy, this is openSUSE"
                        font.family: "Open Sans Condensed"
                        font.pixelSize: 40
                    }
                    Row {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                        Layout.leftMargin: 55
                        Layout.rightMargin: 55
                        Layout.fillWidth: true
                        Column {
                            width: 240
                            spacing: 8
                            Label {
                                font.pixelSize: 24
                                text: "Information"
                                font.family: "Open Sans Condensed"
                            }
                            BrandedButton {
                                text: "Read Me"
                                weight: Font.Bold
                                color: "black"
                            }
                            BrandedButton {
                                text: "Documentation"
                                color: "white"
                                bgColor: "#21a4df"
                                hoverColor: "#1b8cbe"
                                downColor: "#1a84b3"
                            }
                            BrandedButton {
                                text: "Get Software"
                                bgColor: "#868e96"
                                hoverColor: "#727b84"
                                downColor: "#6c757d"
                            }
                        }
                        Column {
                            width: 240
                            Image {
                                width: 157
                                height: 157
                                source: "qrc:/web/images/sinking.svg"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                        Column {
                            width: 240
                            spacing: 8
                            Label {
                                font.pixelSize: 24
                                text: "Yaoi > Yuri"
                                font.family: "Open Sans Condensed"
                            }
                            BrandedButton {
                                text: "Desktop Help"
                                bgColor: "#35b9ab"
                                hoverColor: "#2c9b90"
                                downColor: "#2a9186"
                            }
                            BrandedButton {
                                text: "Contribute"
                                bgColor: "#35b9ab"
                                hoverColor: "#2c9b90"
                                downColor: "#2a9186"
                            }
                            BrandedButton {
                                text: "Build openSUSE"
                                bgColor: "#73ba25"
                                hoverColor: "#5f9a1f"
                                downColor: "#598f1d"
                            }
                        }
                    }
                    Label {
                        font.family: "Open Sans"
                        font.pixelSize: 16
                        color: "black"
                        width: 690
                        height: 72
                        wrapMode: Text.WordWrap
                        text: "If this is your first time using openSUSE, we would like you to feel right at home in your new voyage. Take your time to familiarize yourself with all the buttons and let us know how you like the experience on our soziale Medien."
                    }
                }
            }
        }
        Rectangle {
            color: "#173f4f"
            height: 63
            Layout.fillWidth: true
            RowLayout {
                anchors.fill: parent
                Item { Layout.fillWidth: true }
                CheckBox {}
                Label {
                    font.family: "Open Sans"
                    font.pixelSize: 16
                    text: "Show on next startup"
                    color: "white"
                    Layout.rightMargin: 8
                }
                BrandedButton {
                    text: "Close"
                    Layout.rightMargin: 16
                    bgColor: "#dc3545"
                    hoverColor: "#c82233"
                    downColor: "#bd2130"
                }
            }
        }
    }
}