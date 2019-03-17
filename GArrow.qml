import QtQuick 2.0
import "figure.js" as Fig

Item {
    id: el
    property int linewidth: 5
    property color linestyle: Qt.rgba(1.0, 1.0, 1.0, 0.5)
    property color fillstyle: Qt.rgba(1.0, 0.0, 0.0, 0.5)
    property real g_ld: 12/28
    property real g_la: 20/35
    property int angle: 0
    onAngleChanged: canvas.requestPaint()
    onFillstyleChanged: canvas.requestPaint();
    Canvas {
        id: canvas
        width: parent.width
        height: parent.height
        onPaint: {
            var ctx = getContext('2d')
            ctx.save()
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = linestyle
            ctx.lineWidth = el.linewidth
            ctx.fillStyle = fillstyle
            ctx.translate(width / 2, height / 2)
            ctx.rotate(el.angle*Math.PI/180)
            ctx.translate(-width / 2, -height / 2)
            ctx.beginPath()
            var x0=width/2
            var x1=width/2-width/2*g_ld
            var x2=width/2+width/2*g_ld
            var y1=height-height*g_la
            var lw=linewidth/2
            ctx.moveTo(x1,lw)
            ctx.lineTo(x1,y1+lw)
            ctx.lineTo(lw,y1+lw)
            ctx.lineTo(x0,height-lw)
            ctx.lineTo(width-lw, y1+lw)
            ctx.lineTo(x2,y1+lw)
            ctx.lineTo(x2,lw)
            ctx.lineTo(x1,lw)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
            ctx.restore()
        }
    }
    state: "NOP"
    states: [
        State {
            name: "ON"
            PropertyChanges {
                target: el
                fillstyle: Qt.rgba(1,0,0,1)
            }
        },
        State {
            name: "OFF"
            PropertyChanges {
                target: el
                fillstyle: Qt.rgba(0,1,0,1)
            }
        },
        State {
            name: "NOP"
            PropertyChanges {
                target: el
                fillstyle: Qt.rgba(0,0,0,0)
            }
        }
    ]
    transitions: Transition {
        ColorAnimation {
            property: "fillstyle"
            easing.type: Easing.bezierCurve
            duration: 200
        }
    }
}
