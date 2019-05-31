import QtQuick 2.9
import QtQuick.Window 2.2
import QtWebEngine 1.1
import QtWebChannel 1.0
import me.appadeia.SysInfo 1.0
import me.appadeia.Launcher 1.0
import me.appadeia.Enabler 1.0

Window {
    id: root
    visible: true
    width: 800
    height: 508

    Component.onCompleted: {
        setX((Screen.width / 2 - width / 2));
        setY(Screen.height / 2 - height / 2);
        bridgeObject.arch = systemInfo.getArch();
        bridgeObject.os = systemInfo.getOS();
        bridgeObject.de = launcher.currentDE();
        bridgeObject.enabled = enabler.autostartEnabled();
        bridgeObject.live = enabler.isLive();
        console.log(bridgeObject.live);
    }

    Enabler {
        WebChannel.id: "enabler"
        id: enabler
    }

    // enabler.disableAutostart, enabler.enableAutostart

    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    title: qsTr("Welcome")

    SysInfo {
        id: systemInfo
    }

    Launcher {
        WebChannel.id: "launcher"
        id: launcher
    }

    QtObject {
        id: bridgeObject
        property string arch: ""
        property string os: ""
        property string de: ""
        property bool enabled: true
        property bool live: false
        property bool ready: false
        property bool pastFirstPage: false

        WebChannel.id: "bridge"

        function changeTitle(title) {
            root.title = title;
        }
        function close() {
            root.close();
        }
        function openURL(url) {
            Qt.openUrlExternally(url)
        }

    }
    QtObject {
        WebChannel.id: "homeTr"
        id: homeTr

        // Header of the home screen
        property string ahoy:                   qsTr("Ahoy, this is openSUSE")

        // Sub headers that denote their categories
        property string basicsHeader:           qsTr("Basics")
        property string supportHeader:          qsTr("Support")

        // Buttons of the basics column
        property string readme:                 qsTr("Read me")
        property string documentation:          qsTr("Documentation")
        property string getsoftware:            qsTr("Get Software")

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

        // openSUSE Contribution stuff
        property string contribute:             qsTr("Contribute") // contribute (to openSUSE)
        property string build:                  qsTr("Build openSUSE") // help build openSUSE

        // Social media blurb.
        property string smParagraph:            qsTr("If this is your first time using openSUSE, we would like you to feel right at home in your new voyage. Take your time to familiarize yourself with all the buttons and let us know how you like the experience on our")
        property string smLink:                 qsTr("social media") // this phrase is part of the previous paragraph and is not a new sentence.

        // Footer
        property string autostart:              qsTr("Show on next startup")
        property string close:                  qsTr("Close")
    }
    QtObject {
        WebChannel.id: "socialTr"
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

        // Footer
        property string close: qsTr("Close")
    }
    QtObject {
        WebChannel.id: "contributeTr"
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
        WebChannel.id: "readmeTr"
        id: readmeTr

        // The breadcrumbs [Home > Read Me]
        property string readme:         qsTr("Read Me")
        property string home:           qsTr("Home")

        // Extra Software header
        property string extras:         qsTr("Extra Software")
        // Cannot include by default
        property string cannotInclude:  qsTr("There are certain proprietary drivers (such as Nvidia) and packages (such as Google Chrome) that openSUSE cannot include by default.")
        // Read this on NVidia
        property string readThisNvidia: qsTr("If you have an NVidia device and wish to use the proprietary drivers, read this")
        // Wiki Article [ link at end of previous sentence ]
        property string wikiArticle:    qsTr("wiki article")

        // Google Chrome paragraph
        property string chrome:         qsTr("To install Google Chrome, just download it directly from Google. Google provides a repository that will be added to your system when you install Google Chrome. This will allow it to be updated alongside your system.")

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
    WebEngineView {
        anchors.fill: parent
        url: "web/home.html"
        webChannel: bridge
        property var request;
    }

    Rectangle {
        id: splash
        height: parent.height
        width: parent.width
        anchors.top: parent.top
        color: "#73ba25";
        opacity: bridgeObject.ready ? 0 : 1
        y: 0

        Image {
            width: 340
            height: 220
            anchors.centerIn: parent
            source: "qrc:///web/images/logo.svg"
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 300
                easing: Easing.InOutQuad
            }
        }
    }

    Rectangle {
        id: pageTransition
        height: parent.height
        width: parent.width
        x: 0
        y: -508
        color: "#73ba25"

        SequentialAnimation {
            id: pageIn
            WebChannel.id: "pageIn"

            NumberAnimation {
                target: pageTransition
                property: "y"
                duration: 100
                from: -508
                to: 0
                easing.type: Easing.InOutQuad
            }
        }
        SequentialAnimation {
            id: pageOut
            WebChannel.id: "pageOut"

            NumberAnimation {
                target: pageTransition
                property: "y"
                duration: 150
                from: 0
                to: 508
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: pageTransition
                property: "y"
                duration: 0
                from: 508
                to: -508
                easing.type: Easing.InOutQuad
            }
        }
    }

    WebChannel {
        id: bridge
        registeredObjects: [bridgeObject, launcher, enabler, homeTr, socialTr, readmeTr, contributeTr, pageIn, pageOut]
    }
}
