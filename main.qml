import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtMultimedia 5.0


Window {
    visible: true
    width: 1024
    height: 780
    title: qsTr("Hello World")
    color: "black"
    //flags: Qt.FramelessWindowHint | Qt.WA_TranslucentBackground
    //flags:  Qt.WA_TranslucentBackground
    Coordinate {
        id: c
        width: 200
        height: 200
        anchors.top:parent.top
        anchors.left: parent.left

    }
    Timer {
        interval: 500
        repeat: true
        running: true
        onTriggered: {c.xvalue++; c.yvalue=c.xvalue }
    }

    Pribor3 {
        width: 150; height: 150
        anchors.centerIn: parent
        value1:  (roll1.value).toFixed(0)
        value2:  (roll2.value).toFixed(0)
        value3:  (roll3.value).toFixed(0)
        maximumValue: 500
        warningThreshold: maximumValue*0.9
        stepSize: 100
        centerТext: "V"
        bottomText: "Напряжение"
        minorTickmarks:5
        thirdvisible:  true
    }
    Pribor {
        width: 150; height: 150
        anchors.right:  parent.right
        anchors.verticalCenter: parent.verticalCenter
        value:  (roll1.value).toFixed(0)

        maximumValue: 500
        warningThreshold: maximumValue*0.9
        stepSize: 100
        centerТext: "V"
        bottomText: "Напряжение"
        minorTickmarks:5
    }
    Slider {
        id: roll1
        x: 28
        y: 233
        maximumValue: 500
        minimumValue: 0
    }
    Slider {
        id: roll2
        x: 28
        y: 283
        maximumValue: 500
        minimumValue: 0
    }
    Slider {
        id: roll3
        x: 250
        y: 10
        width: 600
        maximumValue: 500
        minimumValue: 0
    }


    MyBubble2 {
                id: bubble
                //anchors.centerIn: parent
                height:300
                width:300
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.top: panel.bottom
                anchors.topMargin: 20
                roll: Math.round(roll1.value)
                pitch: -Math.round(roll2.value-100)
            }
    Digital {
        value: roll3.value
        maxvalue: 500
        //interval: 100
        width: 140
        height: 70
        digname: "Альтиметр"
        anchors.bottom: parent.bottom
        anchors.margins: 100
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Dinagraph {
        x: 200
        y: 100
        z:-1
        width: 400
        height: 400
        interval: 100
        value: roll3.value
        maxvalue: 500
        linewidth: 4
        fill:true
        graphtype: 2
        graphtimer: false
        fillopaque:0.6
        linecolor:"white"


    }
    Camera {
              id: camera
          }

          VideoOutput {
              anchors.fill: parent
              source: camera
              z:-2
          }

}
