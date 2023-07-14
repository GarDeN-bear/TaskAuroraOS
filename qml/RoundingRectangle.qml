import QtQuick 2.0

Item {
    id: item
    width: 100
    height: 20
    property int radius: 10
    property bool roundingSide: true
    property int borderWidth: 1
    property color color: "white"
    property color borderColor: "DeepSkyBlue"
    Rectangle {
        id: rectangleFirst
        width: width / 2
        height: height
        border.width: item.borderWidth
        anchors.fill: parent
        border.color: item.borderColor
        color: item.color
        radius: item.radius
    }
    Rectangle {
        id: rectangleSecond
        width: width / 2
        height: height
        border.width: item.borderWidth
        border.color: item.borderColor
        color: item.color
        anchors.fill: parent
        anchors.leftMargin: (item.roundingSide === true) ? rectangleFirst.radius : 0
        anchors.rightMargin: (item.roundingSide === true) ? 0 : rectangleFirst.radius
        Rectangle{
            id: deleteBorderSecond
            y: parent.y + parent.border.width
            x: (item.roundingSide === true) ? x : parent.x + parent.width - parent.border.width
            width: parent.border.width
            height: parent.height - 2 * parent.border.width
            color: item.color
        }
    }
}
