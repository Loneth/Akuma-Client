// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.mcQFrame_513

package Game_fla{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.media.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.ui.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.xml.*;

    public dynamic class mcQFrame_513 extends MovieClip {

        public var tl3:MovieClip;
        public var bl1:MovieClip;
        public var btnClose:SimpleButton;
        public var bg:MovieClip;
        public var tr1:MovieClip;
        public var fx:MovieClip;
        public var tr2:MovieClip;
        public var tl1:MovieClip;
        public var tr3:MovieClip;
        public var br1:MovieClip;
        public var tl2:MovieClip;

        public function mcQFrame_513(){
            addFrameScript(0, frame1);
        }

        public function buildBounds():void{
            this.boundsOK = true;
            var _local1:Array = (this.tl = [{
                mc:tl1,
                dx:0,
                dy:0
            }, {
                mc:tl2,
                dx:0,
                dy:0
            }, {
                mc:tl3,
                dx:0,
                dy:0
            }]);
            var _local2:Array = (this.tr = [{
                mc:tl1,
                dx:0,
                dy:0
            }, {
                mc:tr2,
                dx:0,
                dy:0
            }, {
                mc:tr3,
                dx:0,
                dy:0
            }, {
                mc:btnClose,
                dx:0,
                dy:0
            }]);
            var _local3:Array = (this.bl = [{
                mc:bl1,
                dx:0,
                dy:0
            }]);
            var _local4:Array = (this.br = [{
                mc:br1,
                dx:0,
                dy:0
            }]);
            var _local5:int;
            var _local6:Object = {};
            var _local7:Point = new Point();
            var _local8:Point = new Point();
            var _local9:Rectangle = (this.bgA = bg.getBounds(this));
            _local5 = 0;
            while (_local5 < _local1.length) {
                _local6 = _local1[_local5];
                _local7 = _local9.topLeft;
                _local6.dx = (_local7.x - _local6.mc.x);
                _local6.dy = (_local7.y - _local6.mc.y);
                _local5++;
            };
            _local5 = 0;
            while (_local5 < _local2.length) {
                _local6 = _local2[_local5];
                _local7 = _local9.topLeft;
                _local7.x = (_local7.x + _local9.width);
                _local6.dx = (_local7.x - _local6.mc.x);
                _local6.dy = (_local7.y - _local6.mc.y);
                _local5++;
            };
            _local5 = 0;
            while (_local5 < _local3.length) {
                _local6 = _local3[_local5];
                _local7 = _local9.topLeft;
                _local7.y = (_local7.y + _local9.height);
                _local6.dx = (_local7.x - _local6.mc.x);
                _local6.dy = (_local7.y - _local6.mc.y);
                _local5++;
            };
            _local5 = 0;
            while (_local5 < _local4.length) {
                _local6 = _local4[_local5];
                _local7 = _local9.bottomRight;
                _local6.dx = (_local7.x - _local6.mc.x);
                _local6.dy = (_local7.y - _local6.mc.y);
                _local5++;
            };
        }

        public function resizeTo(_arg1:int, _arg2:int, _arg3:int=0):void{
            if (!("boundsOK" in this)){
                buildBounds();
            };
            var _local4:Array = this.tl;
            var _local5:Array = this.tr;
            var _local6:Array = this.bl;
            var _local7:Array = this.br;
            var _local8:int;
            var _local9:Object = {};
            var _local10:Point = new Point();
            var _local11:Point = new Point();
            var _local12:Rectangle = this.bgA;
            bg.width = _arg1;
            bg.height = _arg2;
            bg.x = (_local12.topLeft.x + Math.round((bg.width / 2)));
            bg.y = (_local12.topLeft.y + Math.round((bg.height / 2)));
            var _local13:Rectangle = bg.getBounds(this);
            _local8 = 0;
            while (_local8 < _local4.length) {
                _local9 = _local4[_local8];
                _local11 = _local13.topLeft;
                _local9.mc.x = (_local11.x - _local9.dx);
                _local9.mc.y = (_local11.y - _local9.dy);
                _local8++;
            };
            _local8 = 0;
            while (_local8 < _local5.length) {
                _local9 = _local5[_local8];
                _local11 = _local13.topLeft;
                _local11.x = (_local11.x + _local13.width);
                _local9.mc.x = (_local11.x - _local9.dx);
                _local9.mc.y = (_local11.y - _local9.dy);
                _local8++;
            };
            _local8 = 0;
            while (_local8 < _local6.length) {
                _local9 = _local6[_local8];
                _local11 = _local13.topLeft;
                _local11.y = (_local11.y + _local13.height);
                _local9.mc.x = (_local11.x - _local9.dx);
                _local9.mc.y = (_local11.y - _local9.dy);
                _local8++;
            };
            _local8 = 0;
            while (_local8 < _local7.length) {
                _local9 = _local7[_local8];
                _local11 = _local13.bottomRight;
                _local9.mc.x = (_local11.x - _local9.dx);
                _local9.mc.y = (_local11.y - _local9.dy);
                _local8++;
            };
            fx.y = 110;
        }

        function frame1(){
			trace("QUEST FRAME 513");
        }


    }
}//package Game_fla

