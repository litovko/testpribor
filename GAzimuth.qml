import QtQuick 2.0
import "figure.js" as Fig

Item {
    id: el
    property int linewidth: 2
    property int panorama: 135 //панорама -135.0.135 град
    property int widthangle: 60 //угол обзора камеры
    property int value: 0
    property int interval: 10 //интервал в градусах между рисками
    property color linestyle: Qt.rgba(1.0, 1.0, 1.0, 0.5)
    property color fillstyle: Qt.rgba(0.5, 0.5, 0.5, 0.2)
    onValueChanged: { canvas.requestPaint(); }
    Canvas {
        id: canvas
        width: parent.width
        height: parent.height
        onPaint: {
            var ntiks = (panorama*2+widthangle)/interval+1
            var dx=width/(ntiks-1)
            var dd=width/(panorama*2+widthangle)
            var ctx = getContext('2d')
            ctx.save()
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = linestyle
            ctx.lineWidth = el.linewidth
            ctx.fillStyle = fillstyle
//            ctx.translate(width / 2, height / 2)
//            ctx.rotate(el.angle*Math.PI/180)
//            ctx.translate(-width / 2, -height / 2)
            ctx.beginPath()
            for (var xx=0; xx<=width/2; xx+=interval*dd) {
                ctx.moveTo(width/2+xx,0)
                ctx.lineTo(width/2+xx,height/2)
                ctx.moveTo(width/2-xx,0)
                ctx.lineTo(width/2-xx,height/2)
            }
            ctx.moveTo( width/2,0 )
            ctx.lineTo( width/2,height/2)
            var pos=width/2+value*dd
            var dpos=widthangle*dd/2
            //console.log (pos-dpos+" "+dx+ " "+width)
            ctx.stroke()
            ctx.beginPath()
            ctx.moveTo((pos-dpos), 0)
            ctx.lineTo((pos+dpos), 0)
            ctx.lineTo((pos+dpos), height)
            ctx.lineTo((pos-dpos), height)
            ctx.lineTo((pos-dpos), 0)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
            Fig.text_m(ctx,width/2,height,height/2,"0","center", "bottom",linestyle)
            Fig.text_m(ctx,width/2+value*dd,height,height/2,value,"center", "bottom",linestyle)
            //ctx.stroke()
            ctx.restore()
        }


    }
    }
