// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameSimpleList

package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.DisplayObject;
    import flash.text.*;

    public class LPFFrameSimpleList extends LPFFrame {

        public var bg:MovieClip;
        public var iList:MovieClip;
        public var ti:TextField;
        private var rootClass:MovieClip;
        private var r:Object;

        public function LPFFrameSimpleList():void{
            x = 0;
            y = 0;
            fData = null;
        }

        override public function fOpen(_arg1:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            if (("fData" in _arg1)){
                fData = _arg1.fData;
            };
            r = _arg1.r;
            w = int(r.w);
            ti.autoSize = "left";
            if (("eventTypes" in _arg1)){
                eventTypes = _arg1.eventTypes;
            };
            if (((("msg" in fData)) && ((fData.msg.length > 0)))){
                ti.htmlText = fData.msg;
            };
            fDraw();
            positionBy(r);
            getLayout().registerForEvents(this, eventTypes);
        }

        override public function fClose():void{
            fData = null;
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        private function fDraw():void{
            var _local1:LPFElementSimpleItem;
            var _local2:DisplayObject;
            var _local3:DisplayObject;
            var _local4:Array;
            var _local5:Object;
            var _local6:int;
            while (iList.numChildren > 0) {
                iList.removeChildAt(0);
            };
            if (((!((fData == null))) && (!((fData.turnin == null))))){
                _local4 = fData.turnin;
                _local6 = 0;
                while (_local6 < _local4.length) {
                    _local5 = _local4[_local6];
                    _local1 = new LPFElementSimpleItem();
                    _local2 = iList.addChild(_local1);
                    _local1.fOpen({fData:_local5});
                    if (_local6 > 0){
                        _local3 = iList.getChildAt((_local6 - 1));
                        _local2.y = ((_local3.y + _local3.height) + 4);
                    };
                    _local2.x = int(((w / 2) - (_local2.width / 2)));
                    _local6++;
                };
                bg.height = (int((iList.height + (iList.y * 2))) + 1);
                bg.width = int(w);
                ti.width = int((w - 2));
                if (ti.htmlText.length > 0){
                    ti.y = (bg.height + 2);
                    ti.visible = true;
                }
                else {
                    ti.visible = false;
                };
                visible = true;
            }
            else {
                visible = false;
            };
        }

        override public function notify(_arg1:Object):void{
            if (_arg1.eventType == "listItemASel"){
                fData = null;
                if (((!((_arg1.fData == null))) && (!((_arg1.fData.oSel == null))))){
                    fData = _arg1.fData.oSel;
                };
                fDraw();
                positionBy(r);
            };
            if (_arg1.eventType == "refreshItems"){
                fDraw();
                positionBy(r);
            };
        }


    }
}//package 

