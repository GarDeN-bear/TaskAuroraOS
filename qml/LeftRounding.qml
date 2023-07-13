import QtQuick 2.0

Item {
    id: modelFirst
    width: 100
    height: 20

    Rectangle {
        id: leftRectangleFirst
        width: width / 2
        height: height
        border.width: 1
        anchors.fill: parent
        border.color: "DeepSkyBlue"
        color: "white"
        radius: 10
    }

    Rectangle {
        id: rightRectangleFirst
        width: width / 2
        height: height
        border.width: 1
        border.color: "DeepSkyBlue"
        color: "white"
        anchors.fill: parent
        anchors.leftMargin: leftRectangleFirst.radius
        Rectangle{
            id: deleteBorderFirst
            y: parent.y + parent.border.width
            width: parent.border.width
            height: parent.height - 2 * parent.border.width
            color: "white"
        }
    }
}
