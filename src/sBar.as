// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//sBar

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class sBar extends MovieClip {

        private var scr;
        private var hRun:Number;
        private var dRun:Number;
        private var mbY:int;
        private var mhY:int;
        private var display:MovieClip;
        private var rootClass:MovieClip;
        private var bMask:MovieClip;
        private var scrTgt:MovieClip;
        private var mbD:int;

        public function sBar(_arg1:MovieClip, _arg2:MovieClip, _arg3:MovieClip, _arg4:MovieClip){
            this.scr = _arg1;
            this.display = _arg2;
            this.bMask = _arg3;
            this.scr.h.y = 0;
            this.scr.visible = false;
            this.scr.hit.alpha = 0;
            this.scr.mDown = false;
            if (this.display.height > this.scr.b.height){
                this.scr.h.height = int(((this.scr.b.height / this.display.height) * this.scr.b.height));
                this.hRun = (this.scr.b.height - this.scr.h.height);
                this.dRun = ((this.display.height - this.scr.b.height) + 10);
                this.display.oy = (this.display.y = this.bMask.y);
                this.scr.visible = true;
                this.scr.hit.addEventListener(MouseEvent.MOUSE_DOWN, this.scrDown, false, 0, true);
                this.scr.h.addEventListener(Event.ENTER_FRAME, this.hEF, false, 0, true);
                this.display.addEventListener(Event.ENTER_FRAME, this.dEF, false, 0, true);
            };
        }

        public function scrDown(_arg1:MouseEvent){
            this.mbY = int(mouseY);
            this.mhY = int(MovieClip(_arg1.currentTarget.parent).h.y);
            this.scrTgt = MovieClip(_arg1.currentTarget.parent);
            this.scrTgt.mDown = true;
            this.rootClass.addEventListener(MouseEvent.MOUSE_UP, this.scrUp, false, 0, true);
        }

        public function scrUp(_arg1:MouseEvent){
            this.scrTgt.mDown = false;
            this.rootClass.removeEventListener(MouseEvent.MOUSE_UP, this.scrUp);
        }

        public function hEF(_arg1:Event){
            var _local2:*;
            if (MovieClip(_arg1.currentTarget.parent).mDown){
                _local2 = MovieClip(_arg1.currentTarget.parent);
                this.mbD = (int(mouseY) - this.mbY);
                _local2.h.y = (this.mhY + this.mbD);
                if ((_local2.h.y + _local2.h.height) > _local2.b.height){
                    _local2.h.y = int((_local2.b.height - _local2.h.height));
                };
                if (_local2.h.y < 0){
                    _local2.h.y = 0;
                };
            };
        }

        public function dEF(_arg1:Event){
            var _local2:* = MovieClip(_arg1.currentTarget.parent).scr;
            var _local3:* = MovieClip(_arg1.currentTarget);
            var _local4:* = (-(_local2.h.y) / this.hRun);
            var _local5:* = (int((_local4 * this.dRun)) + _local3.oy);
            if (Math.abs((_local5 - _local3.y)) > 0.2){
                _local3.y = (_local3.y + ((_local5 - _local3.y) / 4));
            }
            else {
                _local3.y = _local5;
            };
        }

        public function Destroy():void{
            this.scr.hit.removeEventListener(MouseEvent.MOUSE_DOWN, this.scrDown);
            this.scr.h.removeEventListener(Event.ENTER_FRAME, this.hEF);
            this.display.removeEventListener(Event.ENTER_FRAME, this.dEF);
        }


    }
}//package 

