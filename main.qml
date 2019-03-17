import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls 2.4


Window {
    visible: true
    width: 1024
    height: 780
    title: qsTr("Hello World")
    color: "black"
    //flags: Qt.FramelessWindowHint | Qt.WA_TranslucentBackground
    //flags:  Qt.WA_TranslucentBackground



//    Coordinate {
//        id: c
//        width: 200
//        height: 200
//        anchors.centerIn: parent
//        xvalue: 128
//        visible: true
//    }

    GAzimuth{
        id: e
        width: parent.width-20
        height: 40
        anchors.centerIn: parent
        value: roll3.value-180
//        Behavior on value {
//                NumberAnimation { easing.type: Easing.OutQuad; duration: 50 }
//        }
    }
    GArrow{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 50
        height: 50

    }

    Timer {
        interval: 2000
        repeat: true
        running: true
        property bool dir: true
        property int i:0
        Component.onCompleted: c.yvalue=0
        onTriggered: {
           // e.value=e.value+30
//            if (a.state==="NOP") a.state="OFF"
//            else if (a.state==="ON") a.state="NOP"
//                else a.state="ON"

//            console.log(a.state)
            switch (i) {
            case 0:
                c.yvalue=1
                c.y_axes=-1
                break;
            case 1:
                c.yvalue=0
                break;
            case 2:
                c.yvalue=128
                break;
            case 3:
                c.yvalue=0
                c.y_axes=-1
                break;
            case 4:
                c.yvalue=2
                break;
            case 5:
                c.yvalue=0
                break;
            case 6:
                c.yvalue=4
                break;
            case 7:
                c.yvalue=0
                break;
            case 8:
                c.yvalue=8
                break;
            case 9:
                c.yvalue=0
                break;
            case 10:
                c.yvalue=16
                break;
            case 11:
                c.yvalue=0
                c.y_axes=-1
                break;
            case 12:
                c.yvalue=32
                break;
            case 13:
                c.yvalue=0
                break;
            case 14:
                c.yvalue=64
                break;
            case 15:
                c.yvalue=0
                break;
            case 16:
                c.yvalue=0
                break;
            case 17:
                c.yvalue=0
                c.y_axes=1
                break;
            case 18:
                c.yvalue=64
                break;
            case 19:
                c.yvalue=0
                break;
            case 20:
                c.yvalue=32
                c.y_axes=1
                break;
            case 21:
                c.yvalue=0
                break;
            case 22:
                c.yvalue=16
                break;
            case 23:
                c.yvalue=0
                break;
            case 24:
                c.yvalue=8
                break;
            case 25:
                c.yvalue=0
                break;
            case 26:
                c.yvalue=4
                break;
            case 27:
                c.yvalue=0
                break;
            case 28:
                c.yvalue=2
                break;
            case 29:
                c.yvalue=0
                break;
            case 30:
                c.yvalue=128
                break;
            case 31:
                c.yvalue=0
                break;
            case 32:
                c.yvalue=1
                break;
            case 33:
                c.yvalue=0
                break;
            case 34:
                c.yvalue=0
                break;

            }

            if (i===33) i=0
            else i+=1
            //console.log("---i:"+i)


        }
    }

//    Pribor3 {
//        width: 150; height: 150
//        anchors.centerIn: parent
//        value1:  (roll1.value).toFixed(0)
//        value2:  (roll2.value).toFixed(0)
//        value3:  (roll3.value).toFixed(0)
//        maximumValue: 500
//        warningThreshold: maximumValue*0.9
//        stepSize: 100
//        centerТext: "V"
//        bottomText: "Напряжение"
//        minorTickmarks:5
//        thirdvisible:  true
//    }
//    Pribor {
//        width: 150; height: 150
//        anchors.right:  parent.right
//        anchors.verticalCenter: parent.verticalCenter
//        value:  (roll1.value).toFixed(0)

//        maximumValue: 500
//        warningThreshold: maximumValue*0.9
//        stepSize: 100
//        centerТext: "V"
//        bottomText: "Напряжение"
//        minorTickmarks:5
//    }
    Slider {
        id: roll1
        x: 28
        y: 233
        to: 5
        from: 0
    }
    Slider {
        id: roll2
        x: 28
        y: 283
        to: 180
        from: 0
    }
    Slider {
        id: roll3
        x: 250
        y: 10
        width: 600
        to: 360
        from: 0
    }


//    MyBubble2 {
//                id: bubble
//                //anchors.centerIn: parent
//                height:300
//                width:300
//                anchors.horizontalCenter: parent.horizontalCenter
//                //anchors.top: panel.bottom
//                anchors.topMargin: 20
//                roll: Math.round(roll1.value)
//                pitch: -Math.round(roll2.value-100)
//            }
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
//    Dinagraph {
//        x: 200
//        y: 100
//        z:-1
//        width: 400
//        height: 400
//        interval: 100
//        value: roll3.value
//        maxvalue: 500
//        linewidth: 4
//        fill:true
//        graphtype: 2
//        graphtimer: false
//        fillopaque:0.6
//        linecolor:"white"


//    }
//    CenterTick {
//        anchors.centerIn: parent
//        x_on: roll1.value
//        y_on: roll2.value
//        width: 30
//        height: 30
//    }

//    Camera {
//              id: camera
//          }

//          VideoOutput {
//              anchors.fill: parent
//              source: camera
//              z:-2
//          }

}
