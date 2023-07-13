import QtQuick 2.0

Item {
    id: modelLast
    width: 100
    height: 20

    Rectangle {
        id: rightRectangleLast
        width: width / 2
        height: height
        border.width: 1
        anchors.fill: parent
        border.color: "DeepSkyBlue"
        color: "white"
        radius: 10
    }

    Rectangle {
        id: leftRectangleLAst
        width: width / 2
        height: height
        border.width: 1
        border.color: "DeepSkyBlue"
        color: "white"
        anchors.fill: parent
        anchors.rightMargin: rightRectangleLast.radius
        Rectangle{
            id: deleteBorderLast
            y: parent.y + parent.border.width
            x: parent.x + parent.width - parent.border.width
            width: parent.border.width
            height: parent.height - 2 * parent.border.width
            color: "white"
        }
    }
}
