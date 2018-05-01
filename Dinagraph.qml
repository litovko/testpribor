import QtQuick 2.0

Item {
    property int    linewidth: 1
    property alias  linecolor: canvas.linecolor
    property alias  fillcolor: canvas.fillcolor
    property alias  fillopaque: canvas.fillopaque
    property real   maxvalue: 100
    property real   value: 10
    property bool   graphtimer: false
    property bool   fill: false
    property alias  interval: t.interval
    property int  graphtype: 2
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

    Timer {
        id: t
        repeat: graphtimer

        onTriggered: {
            canvas.step()
        }
    }

    Component.onCompleted:  {
        canvas.y0=canvas.yv=canvas.getY(value)
        if (graphtimer)  { t.running=true; t.start();}
        else t.running=false
    }
    onValueChanged: {
        if(!graphtimer) canvas.step()
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        property int xv: 0
        property int x0: 0
        property int yv: 0
        property int y0: 0
        property string fillcolor: "darkgray"
        property string linecolor: "yellow"
        property real fillopaque: 1
        function getY(v) {
            return height-(height)*v/maxvalue
        }
        function step(){
            x0=xv
            xv=xv+linewidth
            if (xv>width) x0=xv=0
            y0=yv
            yv = getY(value)
            requestPaint()
        }

        function draw_1(){
            var ctx = getContext("2d")
            ctx.save()
            if (xv===0) xv=linewidth
            ctx.clearRect(xv-linewidth/2, 0, linewidth, height)
            ctx.globalAlpha = fillopaque
            //line(ctx,xv,height,xv,0,"black",linewidth) //background
            line(ctx,x0,y0,xv,yv,linecolor,linewidth)
            if (fill)
            {
                ctx.globalAlpha = 0.4
                line(ctx,xv,getY(0),xv,yv,fillcolor,linewidth)
            }
            ctx.globalAlpha = fillopaque
            line(ctx,xv+linewidth,height,xv+linewidth,0,"gray",linewidth)

            ctx.restore()

        }
        function draw_2(){
            var ctx = getContext("2d")

            xv=width
            ctx.save()
            ctx.globalAlpha = 0.99
            var imageData = ctx.getImageData(linewidth, 0, width, height);
            ctx.clearRect(0, 0, width, height)
            ctx.drawImage(imageData, 0, 0);
            ctx.globalAlpha = fillopaque
            line(ctx,xv-linewidth/2,getY(0),xv-linewidth/2,yv,fillcolor,linewidth)
            line(ctx,xv-linewidth-linewidth/2,y0,xv-linewidth/2,yv,linecolor,linewidth) // graph line
            //ctx.clearRect(0, 0, 20, 20)
            ctx.restore()
        }
        onPaint: {
            if (graphtype===1) draw_1()
            else draw_2()
        }
    }
}
