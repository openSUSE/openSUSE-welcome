/*
    openSUSE Welcome - A welcome utility
    Copyright (C) 2019  Carson Black

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import QtQuick
import QtQuick.Window
import org.openSUSE.Welcome
import QtQml.XmlListModel
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 508

    Component.onCompleted: {
        setX(Screen.width / 2 - width / 2);
        setY(Screen.height / 2 - height / 2);
    }

    Enabler { id: enabler }

    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    title: qsTr("Welcome")

    SysInfo { id: systemInfo }

    Launcher { id: launcher }

    XmlListModel {
        id: rssModel
        source: "https://news.opensuse.org/feed"
        query: "/rss/channel/item"

        XmlListModelRole { name: "title"; elementName: "title/string()"}
        XmlListModelRole { name: "url"; elementName: "link/string()"}
    }

    property string rssNewsTitle: ""
    property url rssPageUrl: ""
    property bool rssReady: false

    Repeater {
        model: rssModel
        delegate: Item {
            required property int index
            required property string url
            required property string title

            Component.onCompleted: {
                if (index === 0) {
                    root.rssNewsTitle = title;
                    root.rssPageUrl = url;
                    root.rssReady = true;
                }
            }
        }
    }

    XfceLayouter { id: layouter }

    QtObject {
        id: homeTr

        // Install openSUSE button
        property string install:                qsTr("Install openSUSE")

        // Launchers to DE-provided help programs
        property string gnomehelp:              qsTr("GNOME Help")
        property string plasmahelp:             qsTr("Plasma Help") // Note: you probably already know this, but Plasma is a name and shouldn't be translated.
        property string xfcehelp:               qsTr("Xfce Help")
        property string matehelp:               qsTr("MATE Help")
        property string enlightenmenthelp:      qsTr("Enlightenment Help") // Same as above - Enlightenment is a name
        property string aboutbudgie:            qsTr("About Budgie") // budgie doesn't have docs nor a help app, so we're linking to an informative article about it instead.
        property string aboutlumina:            qsTr("About Lumina") // same as above
        property string lxdehelp:               qsTr("LXDE Help")
        property string lxqthelp:               qsTr("LXQt Help")
        property string aboutcinnamon:          qsTr("About Cinnamon")
        property string deepinhelp:             qsTr("Deepin Help")

        // Footer
        property string customize:              qsTr("Customise")
        property string close:                  qsTr("Close")
    }
    QtObject {
        id: xfceTr

        property string customize:         qsTr("Customise")
        property string panelLayout:       qsTr("Desktop Layouts")
        property string clickToApply:      qsTr("openSUSE Xfce offers a variety of customisation options, including the ability to choose a desktop layout that fits your workflow. You can choose one of these as a starting point and customise it further later.")

        property string cupertino:         qsTr("Cupertino")
        property string elRaton:           qsTr("El Ratón")
        property string unitatis:          qsTr("Unitatis")
        property string redmond:           qsTr("Redmond")

        property string theme:             qsTr("Themes")
        property string clickToApplyTheme: qsTr("Click the images to apply application themes.")

        property string gbGkLight:         qsTr("Greybird Geeko Light")
        property string gbGkDark:          qsTr("Greybird Geeko Dark")
        property string aLight:            qsTr("Adwaita Light")
        property string aDark:             qsTr("Adwaita Dark")
    }
    QtObject {
        id: socialTr

        // The breadcrumbs [Home > Social]
        property string socialMedia:    qsTr("Social Media")
        property string home:           qsTr("Home")

        // Page Header
        property string reachUs: qsTr("Social Media: How to reach us!")

        // Page Subtitle
        property string smSubtitle: qsTr("Most commonly used social medias are already listed in the footer, but here are some more you might find useful, alphabetically:")

        // Service Names (most probably won't be translated)
        property string smDiscord:  qsTr("Discord")
        property string smFacebook: qsTr("Facebook")
        property string smForums:   qsTr("Forums")
        property string smIRC:      qsTr("IRC")
        property string smTelegram: qsTr("Telegram")

        // Group Names
        property string smFacebookGroup:    qsTr("Facebook Group")
        property string smOpenSuseForums:   qsTr("openSUSE Forums")

        // IRC Channel Names
        property string smIRCTechSupport:   qsTr("Tech Support")
        property string smIRCProject:       qsTr("Project")
        property string smIRCFactory:       qsTr("Factory")
        property string smIRCChat:          qsTr("Chat")

        // Telegram Room Names
        property string smTelegramOpenSuseGroup:    qsTr("openSUSE Group")
        property string smTelegramOpenSuseNews:     qsTr("openSUSE News")

    }
    QtObject {
        id: contributeTr

        // The breadcrumbs [Home > Contribute]
        property string contribute:     qsTr("Contribute")
        property string home:           qsTr("Home")

        // Page Header
        property string participate:    qsTr("Contribute. Participate in openSUSE")

        // First Paragraph
        property string conBlurb:       qsTr("Whether you’re an experienced Linux developer or an end user just getting started with Linux, there are many ways for you to participate in the openSUSE project. Join a forum to get help or help others with openSUSE, find and report bugs, take over an issue from the release process, review the documentation, send your wish list for new packages and features, create and submit patches, or find other creative ways to contribute.")

        // Second Paragraph Part One
        property string con2p1:         qsTr("Whatever you do, take a few minutes to discuss openSUSE with other users and become an")
        // Second Paragraph Link One [link to Members] [in middle of sentence, no punctuation]
        property string con2l1:         qsTr("active member")
        // Second Paragraph Part Two
        property string con2p2:         qsTr("of the openSUSE community. For most activities a login is needed to enjoy all the fun. You might wish to create a user page and share some useful information or interests about you with others.")

        // Be part of the openSUSE Community header
        property string partOf:         qsTr("Be part of the openSUSE Community")
        // Third Paragraph Part One
        property string con3p1:         qsTr("See where other")
        // Third Paragraph Link One
        property string con3l1:         qsTr("openSUSE community")
        // Third Paragraph Part Two
        property string con3p2:         qsTr("members are located world-wide, get to know some People of openSUSE, find local openSUSE user groups, celebrate releases, learn about the governance structure and more. Follow")
        // Third Paragraph Link Two
        property string con3l2:         qsTr("openSUSE news")
        // Third Paragraph Part Three
        property string con3p3:         qsTr("on our news site and see what our developers are up to on")
        // Third Paragraph Link Three
        property string con3l3:         qsTr("Planet openSUSE")

        // Help us release the next openSUSE header
        property string helpUs:         qsTr("Help us to release the next version of openSUSE")
        // Fourth Paragraph Part One
        property string con4p1:         qsTr("For every release there is a")
        // Fourth Paragraph Link One
        property string con4l1:         qsTr("set of tasks")
        // Fourth Paragraph Part Two
        property string con4p2:         qsTr("available. Some are complicated, some are easy to achieve, even for beginners. Look through the issues and tell someone from openSUSE if you found an adequate task.")

        // Discuss and help header
        property string discussAndHelp: qsTr("Discuss openSUSE and help other users")
        // Fifth Paragraph Part One
        property string con5p1:         qsTr("There are several active communities where you can discuss what is going on in openSUSE and help out other openSUSE users. We have mailing lists, IRC channels and forums. Please have a look at the")
        // Fifth Paragraph Link One
        property string con5l1:         qsTr("communication channels")
        // Fifth Paragraph Part Two
        property string con5p2:         qsTr("for an overview.")

        // Suggest New Features or Software header
        property string suggest:        qsTr("Suggest New Features or Software")
        // 6th Paragraph Part One
        property string con6p1:         qsTr("Visit")
        // 6th Paragraph Link One [Bugzilla]
        property string con6l1:         qsTr("Bugzilla")
        // 6th Paragraph Part Two
        property string con6p2:         qsTr("our Feature- and Requirements Management System. Here you can get a sorted overview of things happening in upcoming products, follow and participate on the discussion by adding comments or work on features for the next product generation (version) and help to make openSUSE an even better Linux distribution.")

        // Spread the Word header
        property string spreadWord:     qsTr("Spread the word")
        // 7th Paragraph Part One
        property string con7p1:         qsTr("Be sure to spread the word on openSUSE and help others to benefit from it too! openSUSE offers a great Linux distribution and many other technologies like our")
        // 7th Paragraph Link One
        property string con7l1:         qsTr("build service")
        // 7th Paragraph Part Two
        property string con7p2:         qsTr("which can help home users as well as sys admins and developers to get work done and have fun. Blog about openSUSE, tell your friends and family and help them install it!")

        // Footer
        property string close:          qsTr("Close")
    }
    QtObject {
        id: readmeTr

        // The breadcrumbs [Home > Read Me]
        property string readme:         qsTr("Read Me")
        property string home:           qsTr("Home")

        // Extra Software header
        property string extras:         qsTr("Extra Software")
        // Cannot include by default
        property string cannotInclude:  qsTr("There are certain proprietary drivers (such as Nvidia) and packages (such as Google Chrome) that openSUSE cannot include by default.")
        // Read this on Nvidia
        property string readThisNvidia: qsTr("If you have an Nvidia device and wish to use the proprietary drivers, read this")
        // Wiki Article [ link at end of previous sentence ]
        property string wikiArticle:    qsTr("wiki article")

        // Google Chrome paragraph
        property string chrome:         qsTr("To install Google Chrome, just download it directly from Google. Google provides a repository that will be added to your system when you install Google Chrome. This will allow it to be updated alongside your system.")
        property string chromeLink:     qsTr("Google offers Google Chrome's RPM on its website.")

        // Packman paragraph part one
        property string packman:        qsTr("Some codecs for playing media cannot be included in openSUSE due to licensing issues. However, there are repositories available that you can read about")
        // Link at packman paragraph
        property string packmanhere:    qsTr("here")

        // Community repos header
        property string community:      qsTr("Community Repositories")

        // [On] software.opensuse.org, ...
        property string on:             qsTr("On")

        // On software.opensuse.org, [...]
        property string mayRun:         qsTr(", you may run across community-provided repositories. While we do not manually vet community repositories, they have built their software against the latest version of openSUSE and should work.")

        // Close button
        property string close:          qsTr("Close")
    }

    // Since QML doesn't provide an easy way to use a colorized icon, we'll just abuse Button to provide an icon with text
    component TextWithIcon : Button {
        id: textWithIconRoot

        background: Item {}
        icon.color: palette.disabled.text
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: systemInfoHeader

            color: "#e9ecef"
            Layout.fillWidth: true
            Layout.preferredHeight: 45

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 20
                // disabling the layout will give everything the nice disabled color
                enabled: false

                TextWithIcon {
                    text: systemInfo.os
                    icon.source: "qrc:/icons/desktop.svg"
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "|"
                    font.pointSize: 11
                }

                TextWithIcon {
                    text: systemInfo.arch
                    icon.source: "qrc:/icons/industry.svg"
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "|"
                    font.pointSize: 11
                }

                TextWithIcon {
                    text: launcher.currentDE
                    icon.source: "qrc:/icons/picture-o.svg"
                }

                Item { Layout.fillWidth: true }
            }
        }

        ColumnLayout {
            id: mainContentLayout

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 55
            Layout.rightMargin: 55
            Layout.topMargin: 20
            Layout.bottomMargin: 20
            spacing: 10

            Label {
                text: qsTr("Ahoy, this is openSUSE")
                font.weight: Font.Bold
                font.pointSize: 26
            }

            RowLayout {
                Layout.fillHeight: true
                implicitWidth: root.width - 110
                spacing: 30

                ColumnLayout {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    spacing: 10

                    Label {
                        text: qsTr("Basics")
                        font.weight: Font.Bold
                        font.pointSize: 18
                    }

                    ThemedButton {
                        text: qsTr("Read me")
                        icon.source: "qrc:/icons/book.svg"
                        themeColor: "#ffc107"
                    }

                    ThemedButton {
                        text: qsTr("Documentation")
                        icon.source: "qrc:/icons/external-link.svg"
                        themeColor: "#21a4df"
                        onClicked: Qt.openUrlExternally("https://doc.opensuse.org")
                    }

                    ThemedButton {
                        text: qsTr("Get Software")
                        icon.source: "qrc:/icons/shopping-cart.svg"
                        themeColor: "#868e96"
                        onClicked: Qt.openUrlExternally("https://software.opensuse.org/explore")
                    }
                }

                Image {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    source: "qrc:/web/images/sinking.svg"
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                }

                ColumnLayout {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    spacing: 10

                    Label {
                        text: qsTr("Support")
                        font.weight: Font.Bold
                        font.pointSize: 18
                    }

                    ThemedButton {
                        text: qsTr("Contribute")
                        icon.source: "qrc:/icons/hand-o-up.svg"
                        themeColor: "#35b9ab"
                    }

                    ThemedButton {
                        text: qsTr("Build openSUSE")
                        icon.source: "qrc:/icons/github-alt.svg"
                        themeColor: "#73ba25"
                    }
                }
            }

            Label {
                text: qsTr("If this is your first time using openSUSE, we would like you to feel right at home in your new voyage. Take your time to familiarize yourself with all the buttons and let us know how you like the experience on our [social media](opensusewelcome://socialmedia).")
                textFormat: Label.MarkdownText
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                font.pointSize: 13
            }
        }

        Rectangle {
            id: rssFeedDisplay

            color: "#d3edf9"
            border {
                width: 1
                color: "#badeed"
            }

            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Label {
                text: {
                    if (!root.rssReady)
                        return qsTr("Loading news...");

                    return "<a href=\"" + root.rssPageUrl + "\">" + root.rssNewsTitle + "</a>";
                }
                onLinkActivated: Qt.openUrlExternally(root.rssPageUrl)
                ToolTip.text: root.rssPageUrl
                ToolTip.visible: hh.hovered && root.rssReady
                anchors.centerIn: parent
                color: "#07a9b5"
                font.pointSize: 13

                HoverHandler {
                    id: hh
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }

        Rectangle {
            id: pageFooter

            color: "#173f4f"
            Layout.fillWidth: true
            Layout.preferredHeight: 65

            RowLayout {
                spacing: 20
                anchors.fill: parent
                anchors.leftMargin: 30
                anchors.rightMargin: 30

                // TODO: convert these into nice buttons
                Image {
                    source: "qrc:/icons/reddit.svg"
                    Layout.preferredWidth: 15
                    Layout.preferredHeight: 15
                    Layout.alignment: Qt.AlignHCenter
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                }

                Image {
                    source: "qrc:/icons/facebook.svg"
                    Layout.preferredWidth: 15
                    Layout.preferredHeight: 15
                    Layout.alignment: Qt.AlignHCenter
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                }

                Image {
                    source: "qrc:/icons/twitter.svg"
                    Layout.preferredWidth: 15
                    Layout.preferredHeight: 15
                    Layout.alignment: Qt.AlignHCenter
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                }

                Image {
                    source: "qrc:/icons/mastodon.svg"
                    Layout.preferredWidth: 15
                    Layout.preferredHeight: 15
                    Layout.alignment: Qt.AlignHCenter
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                }

                Item { Layout.fillWidth: true }

                CheckBox {
                    text: qsTr("Show on next startup")
                    onCheckedChanged: enabler.autostart = checked
                    Component.onCompleted: checked = enabler.autostart
                    Layout.alignment: Qt.AlignHCenter
                }

                ThemedButton {
                    themeColor: "#dc3545"
                    Layout.preferredWidth: 65
                    Layout.preferredHeight: 30
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Close")
                    icon {
                        source: "qrc:/icons/times.svg"
                        color: "white"
                    }
                    onClicked: root.close()
                }
            }
        }
    }
}
