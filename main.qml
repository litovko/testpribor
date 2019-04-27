import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import "file:///D:/work/testpribor/logic_control.js" as Logic
import Gyco 1.0

Window {
    visible: true
    width: 1600
    height: 800
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

//    GAzimuth{
//        id: e
//        width: parent.width-20
//        height: 40
//        anchors.centerIn: parent
//        value: roll3.value-180
////        Behavior on value {
////                NumberAnimation { easing.type: Easing.OutQuad; duration: 50 }
////        }
//    }

    MouseArea {
        anchors.fill: parent
        onPressed: { Logic.func(); gr3.cool=!gr3.cool}
    }

    Rectangle{
        x:750
        y:50
        width: 450
        height:450
        color:"transparent"
        border.color: "yellow"

//        NPA_hand {
//            id: hand
////            width: 600
////            height: 600
//            anchors.fill: parent

//            a1: 0
//            a2: -55+roll1.value
//            a3: 110
//            a4: -55
//            a5: 20
//            l1: 50
//        }
        NPA_group {
            id: gr3
//            width: 600
//            height: 600
            anchors.fill: parent

            cx1: 0
            cx2: roll1.value
            cx3: roll2.value
            cx4: roll4.value
            ca: roll3.value

        }
    }
    Rectangle{
        x:250
        y:50
        width: 450
        height:450
        color:"transparent"
        border.color: "yellow"
        NPA_move {
            anchors.fill: parent
            visible: true
            ax1: j.x2axis //влево вправо подрулька
            ax2: j.y1axis-j.x2axis//((j.x2axis>0)?j.x2axis/2:-j.x2axis/2)   //левый задний движок
            onAx2Changed: {
//                console.log("y1:"+j.y1axis)
//                console.log("aaa:"+((j.x2axis>0)?+j.x2axis/2:-j.x2axis/2))
                //console.log("y1:"+j.y1axis+"aaa:"+(j.x2axis>0)?+j.x2axis/2:-j.x2axis/2 )
            }

            ax3: j.y1axis+j.x2axis//((j.x2axis>0)?-j.x2axis/2:+j.x2axis/2)   //правый задний движок
            ax4: 0
        }

    }


    Timer {
        interval: 2000
        repeat: true
        running: false
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
        to: 127
        from: -127
    }
    Slider {
        id: roll2
        x: 28
        y: 283
        to: 127
        from: -127
    }
    Slider {
        id: roll3
        x: 250
        y: 10
        width: 600
        to: 135
        from: -135
    }
    Slider {
        id: roll4
        x: 28
        y: 330
        to: 127
        from: -127
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
//    Digital {
//        value: roll3.value
//        maxvalue: 500
//        //interval: 100
//        width: 140
//        height: 70
//        digname: "Альтиметр"
//        anchors.bottom: parent.bottom
//        anchors.margins: 100
//        anchors.horizontalCenter: parent.horizontalCenter
//    }
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
    RigJoystick {
        id: j
        current: 0
        onKey_3Changed: if (key_3) fcommand("LAYOUT")
        onKey_2Changed: if (key_2) fcommand("PLAY")
        onKey_1Changed: if (key_1) fcommand("JKEY1")
        onKey_0Changed: if (key_0&&j.ispresent) fcommand("JKEY0")
        devider: 1+key_5
        //onY1axisChanged: console.log("x:"+j.x1axis)
    }
    Rectangle {
        id: cr
        width: 290
        height: width
        x:1250
        y:200
        color: "transparent"
        border.color: "yellow"
        border.width: 3
        radius: height/4
        Rectangle {
            color: "blue"
            width: 10
            height: 10
            radius: 5
            x:cr.width/2+j.x2axis
            y:cr.width/2-j.y1axis
        }

//        Slider {
//            id: ax
//            anchors.fill:  parent
//            to: 1000
//            from: -1000
//            value: j.x1axis
//        }
//        Slider {
//            id: ay
//            rotation: 90
//            anchors.fill:  parent
//            to: 1000
//            from: -1000
//            value: j.y1axis
//        }
    }
}
