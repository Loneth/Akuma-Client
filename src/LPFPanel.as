// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanel

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFPanel extends MovieClip {

        public var frames:Array;
        public var w:int;
        public var h:int;
        public var xo:int;
        public var yo:int;
        public var xBuffer:int;
        public var yBuffer:int;
        public var frameID:int = 0;
        public var fParent:LPFLayout;
        public var bg:MovieClip;
        public var isOpen:Boolean = false;
        protected var fData:Object;
        protected var sMode:String;
        protected var closeType:String;
        protected var hideDir:String = "";
        protected var hidePad:int = 0;

        public function LPFPanel():void{
        }

        public function notify(_arg1:Object):void{
            var _local2:int;
            while (_local2 < frames.length) {
                frames[_local2].mc.notify(_arg1);
                _local2++;
            };
        }

        public function addFrame(_arg1:Object):void{
            var _local2:LPFFrame = (addChild(_arg1.frame) as LPFFrame);
            _local2.subscribeTo(this);
            frames.push({
                mc:_local2,
                id:frameID++
            });
            _local2.fOpen(_arg1);
        }

        public function delFrame(_arg1:LPFFrame):void{
            var _local2:int;
            while (_local2 < frames.length) {
                if (frames[_local2].mc == _arg1){
                    frames[_local2].fClose();
                    frames.splice(_local2, 1);
                };
                _local2++;
            };
        }

        public function subscribeTo(_arg1:LPFLayout):void{
            fParent = _arg1;
        }

        public function fOpen(_arg1:Object):void{
            var _local2:Object;
            var _local3:int;
            fData = _arg1.fData;
            _local2 = _arg1.r;
            x = _local2.x;
            if (_local2.y > -1){
                y = _local2.y;
            }
            else {
                _local3 = fParent.numChildren;
                if (_local3 > 1){
                    y = ((fParent.getChildAt((_local3 - 2)).y + fParent.getChildAt((_local3 - 2)).height) + 10);
                }
                else {
                    y = 10;
                };
            };
            w = _local2.w;
            h = _local2.h;
            xo = x;
            yo = y;
        }

        public function fClose():void{
            if (((!((bg == null))) && (!((bg.btnClose == null))))){
                bg.btnClose.removeEventListener(MouseEvent.CLICK, onCloseClick);
            };
            while (frames.length > 0) {
                frames[0].mc.fClose();
                frames.shift();
            };
            MovieClip(fParent).delPanel(this);
        }

        public function fHide():void{
            isOpen = false;
            visible = false;
            switch (hideDir.toLowerCase()){
                case "left":
                    x = ((xo - w) - hidePad);
                    return;
                case "right":
                    x = ((xo + w) + hidePad);
                    return;
                case "top":
                    y = ((yo - h) - hidePad);
                    return;
                case "bottom":
                    y = ((yo + h) + hidePad);
                    return;
                case "":
            };
        }

        public function fShow(_arg1:int=-1):void{
            isOpen = true;
            visible = true;
            if (_arg1 > -1){
                x = _arg1;
            }
            else {
                x = xo;
            };
        }

        protected function drawBG(_arg1=null):void{
            if (_arg1 == null){
                bg = (addChildAt(new LPFPanelBg(), 0) as MovieClip);
                bg.frame.width = w;
                bg.frame.height = h;
                bg.bg.width = (w - (6 * 2));
                bg.bg.height = (h - (5 * 2));
                bg.btnClose.x = (w - 31);
                bg.dragonRight.x = (bg.frame.width + 21);
                bg.tTitle.x = int(((w / 2) - (bg.tTitle.width / 2)));
            }
            else {
                bg = (addChildAt(new (_arg1)(), 0) as MovieClip);
            };
            if (("sName" in fData)){
                bg.tTitle.text = fData.sName;
            };
        }

        protected function onCloseClick(_arg1:MouseEvent=null):void{
            switch (closeType){
                case "hide":
                    fHide();
                    return;
                case "close":
                default:
                    bg.btnClose.removeEventListener(MouseEvent.CLICK, onCloseClick);
                    fParent.fClose();
            };
        }


    }
}//package 

