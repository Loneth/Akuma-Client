// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameSimpleText

package {
    import flash.text.TextField;
    import flash.display.MovieClip;
    import flash.text.*;

    public class LPFFrameSimpleText extends LPFFrame {

        public var ti:TextField;
        private var rootClass:MovieClip;

        public function LPFFrameSimpleText():void{
            x = 0;
            y = 0;
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg1.fData;
            if (("eventTypes" in _arg1)){
                eventTypes = _arg1.eventTypes;
            };
            positionBy(_arg1.r);
            fDraw();
            positionBy(_arg1.r);
            getLayout().registerForEvents(this, eventTypes);
        }

        override public function fClose():void{
            fData = {};
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        private function fDraw(_arg1:Boolean=true):void{
            if (_arg1){
                ti.width = w;
                ti.autoSize = "left";
                ti.wordWrap = true;
                ti.htmlText = fData.msg;
            }
            else {
                visible = false;
            };
        }

        override public function notify(_arg1:Object):void{
            if (((("fData" in _arg1)) && (("msg" in _arg1.fData)))){
                fData = _arg1.fData;
            };
            if (("r" in _arg1)){
                positionBy(_arg1.r);
            };
            if (_arg1.eventType == "listItemASel"){
                fDraw(!((_arg1.fData.iSel == null)));
            };
        }


    }
}//package 

