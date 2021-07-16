// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameBackdrop

package {
    import flash.display.MovieClip;
    import flash.text.*;

    public class LPFFrameBackdrop extends LPFFrame {

        public var bg:MovieClip;
        private var rootClass:MovieClip;

        public function LPFFrameBackdrop():void{
            x = 0;
            y = 0;
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg1.fData;
            positionBy(_arg1.r);
            if (("eventTypes" in _arg1)){
                eventTypes = _arg1.eventTypes;
            };
            fDraw();
            getLayout().registerForEvents(this, eventTypes);
        }

        override public function fClose():void{
            fData = {};
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        private function fDraw():void{
        }

        override public function notify(_arg1:Object):void{
            fDraw();
        }

        override protected function positionBy(_arg1:Object){
            var _local2:int;
            w = _arg1.w;
            h = _arg1.h;
            bg.width = w;
            bg.height = h;
            if (_arg1.x > -1){
                x = _arg1.x;
            }
            else {
                x = int(((fParent.w / 2) - (width / 2)));
            };
            if (_arg1.y > -1){
                y = _arg1.y;
            }
            else {
                if (_arg1.y == -1){
                    _local2 = fParent.numChildren;
                    if (_local2 > 1){
                        y = ((fParent.getChildAt((_local2 - 2)).y + fParent.getChildAt((_local2 - 2)).height) + 10);
                    }
                    else {
                        y = 10;
                    };
                }
                else {
                    y = (fParent.h + _arg1.y);
                };
            };
        }


    }
}//package 

