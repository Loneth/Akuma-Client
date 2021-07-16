// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFElementListItem

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFElementListItem extends MovieClip {

        protected var eventType:String = "";
        protected var sMode:String;
        public var fData:Object;
        public var fParent:LPFFrame;
        public var state:int = 0;

        public function LPFElementListItem():void{
            fData = {};
            super();
        }

        protected function update():void{
            var _local1:Object = {
                fData:fData,
                eventType:eventType,
                fCaller:fParent.sName
            };
            fParent.update(_local1);
        }

        public function fOpen(_arg1:Object):void{
            fData = _arg1.fData;
            if (("eventType" in _arg1)){
                eventType = _arg1.eventType;
            };
        }

        public function fClose():void{
            fData = null;
            removeEventListener(MouseEvent.CLICK, onClick);
            parent.removeChild(this);
        }

        protected function fDraw():void{
        }

        public function subscribeTo(_arg1:LPFFrame):void{
            fParent = _arg1;
        }

        public function select():void{
        }

        public function deselect():void{
        }

        protected function onClick(_arg1:MouseEvent):void{
            update();
        }

        protected function onMouseOver(_arg1:MouseEvent):void{
        }

        protected function onMouseOut(_arg1:MouseEvent):void{
        }


    }
}//package 

