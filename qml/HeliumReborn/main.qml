import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    InfoBanner {
        id: bookmarkAdded
        text: "Bookmark added"
        iconSource:"qrc:/qmls/pics/bookmark-icon-30x30.png"
    }



    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true

        ToolIcon {
            iconSource: "qrc:/qmls/pics/back-30x30.png"
            onClicked: { mainPage.back(); }
        }

        ToolIcon {
            iconSource: "qrc:/qmls/pics/home-30x30.png"
            onClicked: { if (appcore) appcore.loadHomeUrl(); }

        }

        ToolIcon {
            iconSource: "qrc:/qmls/pics/forward-30x30.png"
            onClicked: { mainPage.forward(); }

        }

        ToolIcon {
            iconSource: "qrc:/qmls/pics/new-bookmark-30x30.png"
            onClicked: { bookmarkAdded.show(); if (appcore) appcore.bookmarkCurrentUrl(); }
        }

        ToolIcon {
            iconSource: "qrc:/qmls/pics/bookmarks-30x30.png"
            onClicked: { if (appcore) appcore.showLogbookView(); }

        }


      /*  ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }*/
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("Settings") }
            MenuItem { text: qsTr("Clear cookies") }
        }
    }
}
