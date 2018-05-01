import QtQuick 2.0

Item {
    id: dig
    property int digits: 0
    property real value: 0
    property real maxvalue: 1000
    property alias digname: t1.text
    property alias interval: t.interval
    property alias linewidth: canvas.linewidth
    property int graphtype: 2
    function line(c, x1,y1,x2,y2, color,lw) 

    {
        c.save();
        c.strokeStyle = color
        c.lineWidth = lw
        c.beginPath()
        c.lineCap="butt"
        c.moveTo(x1,y1);
        c.lineTo(x2,y2);
        c.stroke();
        c.restore();
    }

    MouseArea{
        anchors.fill:parent
        onClicked: {
            graphtype=graphtype===1?2:1
            canvas.xv=canvas.x0=0
        }
    }

    Timer {
        id: t
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            canvas.x0=canvas.xv
            canvas.xv=canvas.xv<canvas.width?canvas.xv+1:0
            canvas.requestPaint()
        }

    }

    Rectangle {
        color: "transparent"
        border.color: "transparent"
        border.width: 1
        anchors.fill: parent
        Column {
            anchors.fill : parent
            Text {
                id: t1
                font.pointSize: dig.height/4
                color: "yellow"
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Text {
                text: (value).toFixed(digits)
                font.pointSize: dig.height/3
                color: "yellow"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
    Canvas {
        z:-1
        id: canvas
        anchors.fill: parent
        property int linewidth: 2
        property int xv: 0
        property int x0: 0
        property int yv: 0
        property int yp: 0
        property string color: "blue"
        function getY(v) {
            return height-2-(height-2)/maxvalue*v
        }
        function draw_1(){
            var ctx = getContext("2d")
            yp=yv
            yv = getY(value)
            var y0= getY(0)
            ctx.save()
            ctx.globalAlpha = 0.4
            line(ctx,xv,yv,xv,0,"black",linewidth)
            line(ctx,x0,yp,xv,yv,"white",linewidth)
            line(ctx,xv,y0,xv,yv,color,linewidth)
            ctx.restore()
            if (xv===0 && color==="blue") color="gray"
            else if (xv===0 && color==="darkgray") color="blue"
        }
        function draw_2(){
            var ctx = getContext("2d")
            yp=yv
            yv = getY(value)
            xv=width
            var y0= getY(0)
            ctx.save()
            ctx.globalAlpha = 1
            var imageData = ctx.getImageData(linewidth, 0, width, height);
            ctx.drawImage(imageData, 0, 0);
            //ctx.clearRect(0,0,width,height)
            line(ctx,xv,0,xv,height,"black",linewidth)
            line(ctx,xv,y0,xv,yv,"darkgray",linewidth)
            ctx.restore()

        }
        onPaint: {
            if (graphtype===1) draw_1()
            else draw_2()
        }
    }
}
