// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameCheapBuySell

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFFrameCheapBuySell extends LPFFrame {

        public var btnBuy:MovieClip;
        public var btnSell:MovieClip;
        private var rootClass:MovieClip;
        protected var eventType:String = "";

        public function LPFFrameCheapBuySell():void{
            btnBuy.addEventListener(MouseEvent.CLICK, onBtnBuyClick, false, 0, true);
            btnBuy.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
            btnBuy.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
            btnSell.addEventListener(MouseEvent.CLICK, onBtnSellClick, false, 0, true);
            btnSell.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
            btnSell.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
            btnBuy.buttonMode = true;
            btnSell.buttonMode = true;
            btnBuy.sel = (btnBuy.bg2.visible = (btnBuy.bg3.visible = false));
            btnSell.sel = (btnSell.bg2.visible = (btnSell.bg3.visible = false));
        }

        override public function fOpen(_arg1:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            positionBy(_arg1.r);
            if (("eventType" in _arg1)){
                eventType = _arg1.eventType;
            };
            if (("openOn" in _arg1)){
                if (_arg1.openOn == "shopBuy"){
                    select(btnBuy);
                };
                if (_arg1.openOn == "shopSell"){
                    select(btnSell);
                };
            };
        }

        override public function fClose():void{
            btnBuy.removeEventListener(MouseEvent.CLICK, onBtnBuyClick);
            btnBuy.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnBuy.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnSell.removeEventListener(MouseEvent.CLICK, onBtnSellClick);
            btnSell.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnSell.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        protected function fDraw():void{
        }

        override public function notify(_arg1:Object):void{
        }

        private function onBtnSellClick(_arg1:MouseEvent):void{
            if (!btnSell.sel){
                rootClass.mixer.playSound("Click");
                unselect(btnBuy);
                select(btnSell);
                update({
                    eventType:eventType,
                    sModeBroadcast:"shopSell"
                });
            };
        }

        private function onBtnBuyClick(_arg1:MouseEvent):void{
            if (!btnBuy.sel){
                rootClass.mixer.playSound("Click");
                unselect(btnSell);
                select(btnBuy);
                update({
                    eventType:eventType,
                    sModeBroadcast:"shopBuy"
                });
            };
        }

        private function onMouseOver(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            if (!_local2.sel){
                _local2.bg2.visible = true;
            };
        }

        private function onMouseOut(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            if (!_local2.sel){
                _local2.bg2.visible = false;
            };
        }

        private function select(_arg1:MovieClip):void{
            _arg1.sel = true;
            _arg1.bg2.visible = false;
            _arg1.bg3.visible = true;
            setChildIndex(_arg1, 1);
        }

        private function unselect(_arg1:MovieClip):void{
            _arg1.sel = false;
            _arg1.bg2.visible = false;
            _arg1.bg3.visible = false;
            setChildIndex(_arg1, 0);
        }


    }
}//package 

