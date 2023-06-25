import QtQuick 6.2
import QtQuick.Controls 6.2
import Qt.labs.qmlmodels 1.0

GroupBox  {
    id: alarmWin
    objectName: "alarmWin"

    /*
    modality: Qt.WindowModal
    //固定窗口大小
    minimumWidth: 670
    maximumWidth: 670
    minimumHeight: 620
    maximumHeight: 620
    //visible: true
    */
    width: 1110  //Screen.desktopAvailableWidth
    height: 640  //Screen.desktopAvailableHeight

    GroupBox{
        id: alarmGroup
        objectName: "alarmGroup"
        anchors.fill: parent
        anchors.margins: 30
        title: "报警信息"
        font.pixelSize: 20
        anchors.bottomMargin: 80

        TableView{
            anchors.fill: parent
            columnSpacing: 1
            rowSpacing: 1
            //focus: true
            clip: true
            id: alarmTable
            objectName: "alarmTable"

            // 设置列的宽
            property var columnWidths: [300, 700]
            columnWidthProvider: function (column) { return columnWidths[column] }

            model: TableModel {
                TableModelColumn { display: "date" }
                TableModelColumn { display: "alarmText" }

                rows: [
                    {
                        "date": "日期",
                        "alarmText": "报警信息"
                    },
                    {
                        "date": "2023-02-25 16:21:54",
                        "alarmText": "error: xxx"
                    },
                    {
                        "date": "2023-02-25 16:23:54",
                        "alarmText": "error: xxxx"
                    }
                ]

                //rowsInserted:
            }

            selectionModel: ItemSelectionModel {
                model: alarmTable.model

            }

            delegate: Rectangle {
                implicitWidth: 290
                implicitHeight: 30
                //border.width: 1
                color: selected ? "blue" : "lightgray"
                required property bool selected

                Text {
                    text: display
                    anchors.centerIn: parent
                }

            }
        }
    }

    Button{
        y:550
        x:363
        text: "屏蔽安全门"
        icon.source: "file:./ico/pingbi.png"
        width:120
    }

    Button{
        y:550
        x:603
        text: "静音"
        icon.source: "file:./ico/jingyin.png"
        width:120
    }
}