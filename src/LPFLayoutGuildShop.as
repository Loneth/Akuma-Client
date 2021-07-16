// Decompiled by AS3 Sorcerer 2.99
// http://www.as3sorcerer.com/

//LPFLayoutGuildShop

package {
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.text.*;

    public class LPFLayoutGuildShop extends LPFLayout {

        private var aSel:String = "";
        private var bSel:String = "";
        public var iSel:Object;
        public var eSel:Object;
        public var itemsInv:Array;
        public var itemsShop:Array;
        public var mergePanel:MovieClip;
        public var rootClass:MovieClip;

        public function LPFLayoutGuildShop():void{
            x = 0;
            y = 0;
            panels = [];
            fData = {};
        }
        override public function fOpen(_arg_1:Object):void{
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:MovieClip;
            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg_1.fData;
            sMode = _arg_1.sMode;
            if (("itemsInv" in fData)){
                itemsInv = fData.itemsInv;
            };
            if (("itemsShop" in fData)){
                itemsShop = fData.itemsShop;
            };
            _local_2 = _arg_1.r;
            var _local_5:* = "";
            x = _local_2.x;
            y = _local_2.y;
            w = _local_2.w;
            h = _local_2.h;
            _local_3 = {};
            _local_3.panel = new LPFPanelGuildShop();
            _local_5 = rootClass.world.shopinfo.sName;
            _local_3.fData = {
                "items":itemsShop,
                "itemsInv":itemsInv,
                "sName":_local_5,
                "objData":fData.objData
            };
            _local_3.r = {
                "x":30,
                "y":80,
                "w":900,
                "h":400
            };
            _local_3.isOpen = true;
            mergePanel = addPanel(_local_3);
            updatePreviewButtons();
            rootClass.dropStackBoost();
        }
        override public function fClose():void{
            var _local_1:MovieClip;
            rootClass.dropStackReset();
            while (panels.length > 0) {
                panels[0].mc.fClose();
                panels.shift();
            };
            if (parent != null){
                _local_1 = MovieClip(parent);
                _local_1.removeChild(this);
                _local_1.onClose();
            };
        }
        override protected function handleUpdate(_arg_1:Object):Object{
            var _local_2:Object;
            var _local_3:Array;
            var _local_4:Object;
            var _local_5:*;
            var _local_6:*;
            var _local_7:Boolean;
            var _local_9:Object;
            trace(("LayoutINVENH.handleUpdate > " + _arg_1.eventType));
            var _local_8:Object = iSel;
            if (_arg_1.eventType == "sModeSet"){
                if (sMode != _arg_1.sModeBroadcast){
                    sMode = _arg_1.sModeBroadcast;
                    iSel = null;
                    eSel = null;
                    _arg_1.iSel = iSel;
                    _local_3 = itemsInv;
                    if (sMode == "shopBuy"){
                        _local_3 = itemsShop;
                    };
                    _arg_1.fData = {"list":_local_3};
                };
            };
            if (_arg_1.eventType == "listItemASel"){
                iSel = null;
                aSel = _arg_1.fData.sType.toLowerCase();
                iSel = _arg_1.fData;
                _arg_1.fData = {
                    "iSel":iSel,
                    "oSel":_arg_1.fData
                };
                if (_local_8 == iSel){
                    _local_7 = true;
                };
            };
            if (_arg_1.eventType == "refreshItems"){
            };
            if (_arg_1.eventType == "buyItem"){
                if (iSel != null){
                    rootClass.world.sendBuyItemRequest(iSel);
                } else {
                    if (eSel != null){
                        rootClass.world.sendBuyItemRequest(eSel);
                    };
                };
            };
            if (_arg_1.eventType == "sellItem"){
                if (iSel != null){
                    _local_4 = iSel;
                };
                _local_5 = new ModalMC();
                _local_6 = {};
                _local_6.strBody = (("Are you sure you want to sell '" + _local_4.sName) + "'?");
                _local_6.params = {"iSel":_local_4};
                _local_6.callback = onSellRequest;
                _local_6.glow = "white,medium";
                rootClass.ui.ModalStack.addChild(_local_5);
                _local_5.init(_local_6);
            };
            if (_arg_1.eventType == "buyBagSlots"){
                _local_7 = true;
                rootClass.world.loadMovieFront(rootClass.bagSpace, "Inline Asset");
                fClose();
            };
            if (_arg_1.eventType == "helpAC"){
                _local_7 = true;
                rootClass.world.loadMovieFront("interface/goldAC4.swf", "Inline Asset");
            };
            updatePreviewButtons(_local_9);
            _local_8 = null;
            if (!_local_7){
                return (_arg_1);
            };
            return (null);
        }
        private function updatePreviewButtons(_arg_1:Object=null, _arg_2:Object=null):void{
            var _local_3:Object = {};
            if (((!((_arg_1 == null))) && (!((_arg_2 == null))))){
                _local_3 = _arg_2;
            } else {
                _local_3.eventType = "previewButton1Update";
                _local_3.fData = {};
                _local_3.fData.sText = "";
                _local_3.sMode = "grey";
                _local_3.buttonNewEventType = "";
                if (sMode == "shopBuy"){
                    if (iSel != null){
                        _local_3.fData.sText = "Buy";
                        _local_3.buttonNewEventType = "buyItem";
                        _local_3.sMode = "red";
                    } else {
                        _local_3.fData.sText = "";
                        _local_3.buttonNewEventType = "";
                    };
                };
                if (sMode == "shopSell"){
                    if (iSel != null){
                        _local_3.fData.sText = "Sell";
                        _local_3.buttonNewEventType = "sellItem";
                        _local_3.sMode = "red";
                    } else {
                        _local_3.fData.sText = "";
                        _local_3.buttonNewEventType = "";
                    };
                };
            };
            notifyByEventType(_local_3);
        }
        private function onSellRequest(_arg_1:Object):void{
            if (_arg_1.accept){
                rootClass.world.sendSellItemRequest(_arg_1.iSel);
            };
        }
        public function getTabStates(_arg_1:Object=null):Array{
            var _local_2:Object;
            var _local_3:Array = [{
                "sTag":"Show All",
                "icon":"iiroll",
                "state":-1,
                "filter":"*",
                "mc":{}
            }];
            if (_arg_1 != null){
                for each (_local_2 in _local_3) {
                    if (_local_2.filter == _arg_1.sES){
                        return ([_local_2]);
                    };
                };
                return ([_local_3[0]]);
            };
            return (_local_3);
        }

    }
}//package 

