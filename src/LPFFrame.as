// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrame

package {
    import flash.display.MovieClip;
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;
    import flash.text.*;

    public class LPFFrame extends MovieClip {

        public var w:int;
        public var h:int;
        public var fParent:LPFPanel;
        public var eventTypes:Array;
        public var sName:String = "";
        protected var fData:Object;
        protected var sMode:String;

        public function LPFFrame():void{
            eventTypes = [];
            super();
        }

        public function subscribeTo(_arg1:LPFPanel):void{
            fParent = _arg1;
        }

        public function getLayout():MovieClip{
            var _local1:* = fParent;
            while (((("fParent" in _local1)) && (!((_local1.fParent == null))))) {
                _local1 = _local1.fParent;
            };
            return ((_local1 as MovieClip));
        }

        public function notify(_arg1:Object):void{
        }

        public function update(_arg1:Object):void{
            getLayout().update(_arg1);
        }

        public function getState():Object{
            var _local1:Object = {};
            _local1.fParent = fParent;
            _local1.element = this;
            _local1.fData = fData;
            return (_local1);
        }

        public function fOpen(_arg1:Object):void{
            fData = _arg1.fData;
            positionBy(_arg1.r);
            getLayout().registerForEvents(this, eventTypes);
        }

        public function fClose():void{
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        public function fRemove():void{
            if (((!((fParent == null))) && (("delFrame" in fParent)))){
                fParent.delFrame(this);
            };
        }

        protected function positionBy(_arg1:Object){
            var _local3:DisplayObject;
            var _local5:int;
            var _local6:Rectangle;
            var _local7:int;
            var _local2:int = int((fParent.w / 2));
            var _local4:int = (this.width / 2);
            if (parent != null){
                _local5 = 0;
                while (_local5 < parent.numChildren) {
                    if (parent.getChildAt(_local5) == this){
                        _local3 = parent.getChildAt(_local5);
                    };
                    _local5++;
                };
                _local6 = _local3.getBounds(parent);
                _local4 = int((_local6.width / 2));
            };
            if (("centerOn" in _arg1)){
                _local2 = _arg1.centerOn;
            };
            if (((("center" in _arg1)) && (_arg1.center))){
                x = int((_local2 - _local4));
            }
            else {
                if (_arg1.x > -1){
                    x = _arg1.x;
                }
                else {
                    x = int(((fParent.w / 2) - (width / 2)));
                };
            };
            if (("shiftAmount" in _arg1)){
                x = (x + int(_arg1.shiftAmount));
            };
            if (_arg1.y > -1){
                y = _arg1.y;
            }
            else {
                if (_arg1.y == -1){
                    _local7 = fParent.numChildren;
                    if (_local7 > 1){
                        y = ((fParent.getChildAt((_local7 - 2)).y + fParent.getChildAt((_local7 - 2)).height) + 10);
                    }
                    else {
                        y = 10;
                    };
                }
                else {
                    y = (fParent.h + _arg1.y);
                };
            };
            w = _arg1.w;
            h = _arg1.h;
        }


    }
}//package 

