// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//CastBarMC

package {
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.*;

    public class CastBarMC extends MovieClip {

        public var cnt:MovieClip;
        public var o:Object = null;
        public var isOpen:Boolean = false;
        public var callback:Object = null;
        public var state:int = -1;
        public var dur:int = 1000;
        private var world:MovieClip;
        private var rootClass:MovieClip;
        private var mc:MovieClip;
        private var run:int;
        private var ts:Number;
        private var date:Date;

        public function CastBarMC():void{
            addFrameScript(0, frame1, 4, frame5, 5, frame6, 9, frame10);
        }

        public function init():void{
            mc = MovieClip(this);
            rootClass = MovieClip(stage.getChildAt(0));
        }

        public function fOpenWith(_arg1):void{
            var _local2:*;
            var _local3:*;
            o = _arg1;
            isOpen = true;
            switch (o.typ){
                case "sia":
                    state = o.args.ID;
                case "generic":
                    mc.cnt.t1.text = o.txt;
                    _local2 = mc.cnt.fill;
                    _local3 = mc.cnt.fillMask;
                    _local3.x = int((_local2.x - _local3.width));
                    run = int((_local2.x - _local3.x));
                    date = new Date();
                    ts = Number(date.getTime());
                    dur = int((1000 * o.dur));
                    _local3.removeEventListener(Event.ENTER_FRAME, slide);
                    _local3.addEventListener(Event.ENTER_FRAME, slide);
                    mc.cnt.tip.removeEventListener(Event.ENTER_FRAME, tipFollow);
                    mc.cnt.tip.addEventListener(Event.ENTER_FRAME, tipFollow);
                    mc.gotoAndPlay("in");
                    return;
            };
        }

        public function fClose():void{
            var _local1:*;
            if (isOpen){
                o = null;
                state = -1;
                isOpen = false;
                _local1 = mc.cnt.fillMask;
                _local1.removeEventListener(Event.ENTER_FRAME, slide);
                mc.cnt.tip.removeEventListener(Event.ENTER_FRAME, tipFollow);
                mc.gotoAndPlay("out");
                rootClass.world.myAvatar.pMC.endAction();
            };
        }

        private function slide(_arg1:Event):void{
            var _local2:* = MovieClip(_arg1.currentTarget);
            date = new Date();
            var _local3:* = (date.getTime() - ts);
            var _local4:* = (_local3 / dur);
            if (_local4 >= 1){
                mc.gotoAndPlay("out");
                _local2.removeEventListener(Event.ENTER_FRAME, slide);
                mc.cnt.tip.removeEventListener(Event.ENTER_FRAME, tipFollow);
                fCallback();
                fClose();
            }
            else {
                _local2.x = ((mc.cnt.fill.x - mc.cnt.fillMask.width) + (run * _local4));
            };
        }

        private function tipFollow(_arg1:Event):void{
            var _local2:* = mc.cnt.tip;
            var _local3:* = mc.cnt.fillMask;
            _local2.x = ((_local3.x + _local3.width) - _local2.width);
        }

        private function fCallback():void{
            if (o.msg != null){
                rootClass.chatF.pushMsg("event", o.msg, "SERVER", "", 0);
            };
            if (o.callback != null){
                if (o.args != null){
                    o.callback(o.args);
                }
                else {
                    o.callback();
                };
            };
            if (o.xtObj != null){
                rootClass.sfc.sendXtMessage("zm", o.xtObj.cmd, o.xtObj.args, "str", rootClass.world.curRoom);
            };
        }

        function frame1(){
            cnt.visible = false;
            init();
            stop();
        }

        function frame5(){
            cnt.visible = true;
            cnt.tip.visible = true;
        }

        function frame6(){
            stop();
        }

        function frame10(){
            cnt.tip.visible = false;
        }


    }
}//package 

