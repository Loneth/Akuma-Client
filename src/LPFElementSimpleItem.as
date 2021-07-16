// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFElementSimpleItem

package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFElementSimpleItem extends MovieClip {

        public var tQty:TextField;
        public var tName:TextField;
        private var rootClass:MovieClip;
        protected var eventType:String = "";
        protected var sMode:String;
        public var fData:Object;
        public var fParent:LPFFrame;

        public function LPFElementSimpleItem():void{
            fData = {};
            super();
        }

        protected function update():void{
        }

        public function fOpen(_arg1:Object):void{
            fData = _arg1.fData;
            if (("eventType" in _arg1)){
                eventType = _arg1.eventType;
            };
            rootClass = MovieClip(stage.getChildAt(0));
            fDraw();
        }

        public function fClose():void{
            fData = null;
            parent.removeChild(this);
        }

        protected function fDraw():void{
            var _local8:String;
            tName.htmlText = fData.sName;
            var _local1 = "#FFFFFF";
            var _local2 = "#FFD900";
            var _local3 = "#999999";
            var _local4 = "#666666";
            var _local5:Object = rootClass.world.invTree[fData.ItemID];
            var _local6:int;
            var _local7:Boolean;
            if (_local5 != null){
                _local6 = _local5.iQty;
            };
            if (_local6 >= fData.iQty){
                _local7 = true;
            };
            if (_local7){
                _local8 = (((("<font color='" + _local1) + "'>") + _local6) + "</font>");
                _local8 = (_local8 + (("<font color='" + _local2) + "'>/</font>"));
                _local8 = (_local8 + (((("<font color='" + _local1) + "'>") + fData.iQty) + "</font>"));
            }
            else {
                _local8 = (((("<font color='" + _local4) + "'>") + _local6) + "</font>");
                _local8 = (_local8 + (("<font color='" + _local3) + "'>/</font>"));
                _local8 = (_local8 + (((("<font color='" + _local4) + "'>") + fData.iQty) + "</font>"));
            };
            tQty.htmlText = _local8;
        }

        public function subscribeTo(_arg1:LPFFrame):void{
            fParent = _arg1;
        }

        public function select():void{
        }

        public function deselect():void{
        }

        protected function onClick(_arg1:MouseEvent):void{
        }

        protected function onMouseOver(_arg1:MouseEvent):void{
        }

        protected function onMouseOut(_arg1:MouseEvent):void{
        }


    }
}//package 

