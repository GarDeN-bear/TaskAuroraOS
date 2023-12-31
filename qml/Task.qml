/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Моё приложение для ОС Аврора project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    id: win
    objectName: "applicationWindow"
    initialPage: Qt.resolvedUrl("pages/MainPage.qml")
    cover: Qt.resolvedUrl("cover/DefaultCoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
    visible: true
    property var model: ["ОПЦИЯ1", "ОПЦИЯ2", "ОПЦИЯ3", "ОПЦИЯ4"]
    property int currentIndex: 1
    property int cornerRadius: 10
    Row {
        id: row
        anchors.centerIn: parent
        spacing: -1
        Repeater {
            id:repeater
            model: win.model.length
            Item {
                anchors.centerIn: parent
            }
            RoundingRectangle {
                id: rectangleRepeater
                width: rectangleAnimation.width; height: rectangleAnimation.height
                color: "white"
                borderColor: "DeepSkyBlue"
                borderWidth: 1
                radius: (index === 0 || index === win.model.length - 1) ? win.cornerRadius : 0
                roundingSide: (index === 0) ? true :  false
                Text{
                    id: txt
                    anchors.centerIn: parent
                    color: "DeepSkyBlue"
                    text: win.model[index]
                    font.pixelSize: 14
                }
                states:[
                    State {
                        name: "click"
                        when: index === currentIndex
                        PropertyChanges {
                            target: rectangleRepeater; color: "DeepSkyBlue"
                        }
                        PropertyChanges {
                            target: txt; color: "white"
                        }
                    }
                ]
                property int durationTime: 1000
                transitions: [
                    Transition {
                        from: "*"
                        to: "*"
                        PropertyAnimation {target: rectangleRepeater; properties: "color"; duration: durationTime}
                        PropertyAnimation {target: txt; properties: "color"; duration: durationTime}
                    }
                ]
                MouseArea{
                    id: mouseAreaRectangle
                    anchors.fill: parent
                    onClicked: {
                        rectangleRepeater.state = "click";
                        win.currentIndex = index;
                    }
                }

            }
        }
    }
}


