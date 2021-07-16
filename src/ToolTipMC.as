// Decompiled by AS3 Sorcerer 1.40
// http://www.as3sorcerer.com/

//ToolTipMC

package 
{
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.utils.*;

    public class ToolTipMC extends MovieClip 
    {

        public var cnt:MovieClip;
        public var t:Timer;
        var world:MovieClip;
        var mc:MovieClip;
        var isOpen:Boolean;
        var data:Object;
        var tWidth:int;
        var rootClass:MovieClip;

        public function ToolTipMC()
        {
            addFrameScript(0, frame1, 1, frame2, 2, frame3, 3, frame4);
            isOpen = false;
            t = new Timer(10, 1);
            mc = MovieClip(this);
            rootClass = MovieClip(stage.getChildAt(0));
            world = rootClass.world;
            mc.cnt.visible = false;
            mc.cnt.ti.autoSize = "left";
            tWidth = mc.cnt.ti.width;
            mc.mouseEnabled = false;
            mc.mouseChildren = false;
            t.addEventListener(TimerEvent.TIMER, open);
            t.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
        }
        public function openWith(_arg1)
        {
            data = _arg1;
            t.reset();
            t.start();
        }
        public function open(_arg1:TimerEvent)
        {
            isOpen = true;
            mc.cnt.visible = true;
            mc.cnt.ti.width = tWidth;
            mc.cnt.ti.htmlText = data.str;
            mc.cnt.ti.width = (int(mc.cnt.ti.textWidth) + 6);
            mc.cnt.bg.width = (int(mc.cnt.ti.width) + 8);
            mc.cnt.bg.height = (int(mc.cnt.ti.height) + 5);
            mc.x = ((rootClass.mouseX - (mc.width / 2)) - rootClass.ui.x);
            mc.y = ((rootClass.mouseY - mc.height) - 15);
            if ((mc.x + mc.cnt.bg.width) > 1260){
                mc.x = ((1260 - mc.cnt.bg.width) - 10);
            };
            if (mc.x < 1){
                mc.x = 1;
            };
            if (mc.y < 1){
                mc.y = (rootClass.mouseY + 10);
            };
            mc.x = int(mc.x);
            mc.y = int(mc.y);
        }
        private function onMouseOut(_arg1:MouseEvent):void
        {
            if (t.running){
                t.stop();
            };
            close();
        }
        public function hide()
        {
            mc.cnt.visible = false;
            mc.x = 850;
        }
        public function close()
        {
            isOpen = false;
            t.reset();
            mc.cnt.visible = false;
        }
        function frame1()
        {
            hide();
            stop();
        }
        function frame2()
        {
            cnt.visible = false;
        }
        function frame3()
        {
            cnt.visible = true;
            stop();
        }
        function frame4()
        {
            cnt.visible = false;
        }

    }
}//package 

