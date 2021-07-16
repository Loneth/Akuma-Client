// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFLayoutBank

package {
    import flash.display.MovieClip;
    import flash.text.*;

    public class LPFLayoutTrade extends LPFLayout {

        public var iSel:Object;
        public var bSel:Object;
        public var itemsI:Array;
        public var itemsB:Array;
        public var itemsC:Array;
        public var bankPanel:MovieClip;
        public var rootClass:MovieClip;
		public var notify:Boolean;
        public var previewPanel:MovieClip;
		
        public function LPFLayoutTrade():void{
            x = 0;
            y = 0;
            panels = [];
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{		
			notify = true;
            var _local2:Object;
            var _local4:Object;
            var _local5:MovieClip;
            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg1.fData;
            sMode = _arg1.sMode;
            if (("itemsI" in fData)){
                itemsI = fData.itemsI;
            };
            if (("itemsB" in fData)){
                itemsB = fData.itemsB;
            };
            if (("itemsC" in fData)){
                itemsC = fData.itemsC;
            };
            _local2 = _arg1.r;
            var _local3 = "";
            x = _local2.x;
            y = _local2.y;
            w = _local2.w;
            h = _local2.h;
            _local4 = {};
            _local4.panel = new LPFPanelTrade();
            _local4.fData = {
                itemsI:itemsI,
                itemsB:itemsB,
                itemsC:itemsC,
                avatar:rootClass.world.myAvatar,
                objData:fData.objData
            };
            _local4.r = {
                x:30,
                y:80,
                w:900,
                h:400
            };/*
            _local4.isOpen = true;
            bankPanel = addPanel(_local4);
			
            _local4 = {};
            _local4.panel = new LPFPanelPreview();
            _local3 = "Preview";
            _local4.fData = {sName:_local3};
            _local4.r = {
                x:322,
                y:78,
                w:316,
                h:420
            };
            _local4.closeType = "hide";
            _local4.xBuffer = 3;
            _local4.showDragonLeft = true;
            _local4.isEquip = true;
            _local4.isOpen = false;
            previewPanel = addPanel(_local4);
            previewPanel.visible = false;*/
            _local4.isOpen = true;
            bankPanel = addPanel(_local4);			
            rootClass.dropStackBoost();
        }

        override public function fClose():void{
            var _local1:MovieClip;
            rootClass.dropStackReset();
            while (panels.length > 0) {
                panels[0].mc.fClose();
                panels.shift();
            };
            if (parent != null){
                _local1 = MovieClip(parent);
                _local1.removeChild(this);
                _local1.onClose();
            };			
			
			if (notify) {
			    rootClass.sfc.sendXtMessage("zm", "tradeCancel", [fData.tradeId], "str", rootClass.world.curRoom);
			}
        }

        override protected function handleUpdate(_arg1:Object):Object{
            var _local3:Object;
            trace(("LayoutINVENH.handleUpdate > " + _arg1.eventType));
            var _local2:Boolean;
            var _local4:Object = iSel;
            var _local5:Object = bSel;
            var _local6:Object;
            if (_arg1.eventType == "inventorySel"){

                iSel = _arg1.fData;
                if (_local4 == iSel){
                    iSel = null;
                };
                _arg1.fData = {iSel:iSel};
            };
            if (_arg1.eventType == "offerSel"){
                bSel = _arg1.fData;
                if (_local5 == bSel){
                    bSel = null;
                };
                _arg1.fData = {bSel:bSel};
            };
			if (_arg1.eventType == "otherSel"){
				cSel = _arg1.fData;
                if (_local5 == cSel){
                    cSel = null;
                };
                _arg1.fData = {cSel:cSel};
            };
            if (_arg1.eventType == "categorySelMyOffer"){
                bSel = null;
                if (rootClass.world.tradeHasRequested(_arg1.fData.types)){
                    trace("  Drawing Trade locally");
                    _arg1.eventType = "refreshBank";
                }
                else {
                    _arg1.fData.loadPending = true;
                    _arg1.fData.msg = "Loading...";
                    trace("  Sending Trade request");
                    rootClass.world.sendLoadOfferRequest(_arg1.fData.types);
                }; 
            };
            if (_arg1.eventType == "refreshBank"){
            };
            if (_arg1.eventType == "refreshInventory"){
            };
            if (_arg1.eventType == "clickPreview"){
				rootClass.chatF.pushMsg("moderator", ">>> 1", "SERVER", "", 0);
                if (!rootClass.isGreedyModalInStack()){
                    eSel = null;
                    iSel = null;
                    aSel = _arg1.fData.sType.toLowerCase();
                    bSel = "";
                    if (aSel == "refinement"){
                        eSel = _arg1.fData;
                    }
                    else {
                        iSel = _arg1.fData;
                    };
                    if (_arg1.fData.sType.toLowerCase() == "refinement"){
                        _arg1.tabStates = getTabStates(_arg1.fData);
                    }
                    else {
                        _arg1.tabStates = getTabStates({sES:"enh"});
                    };
                    _arg1.fData = {
                        iSel:iSel,
                        eSel:eSel,
                        oSel:_arg1.fData
                    };
                    //splitPanel.fHide();
                    previewPanel.fShow(_arg1);
					trace("SHOW");
                }
            };
            if (_arg1.eventType == "lockOffer"){
			    rootClass.sfc.sendXtMessage("zm", "tradeLock", [fData.tradeId, rootClass.ctrlTrade.txtMyGold.text, rootClass.ctrlTrade.txtMySilver.text, rootClass.ctrlTrade.txtMyCopper.text, rootClass.ctrlTrade.txtMyCoins.text], "str", rootClass.world.curRoom);
            };
            if (_arg1.eventType == "unlockOffer"){
			    rootClass.sfc.sendXtMessage("zm", "tradeUnlock", [fData.tradeId], "str", rootClass.world.curRoom);
            };
            if (_arg1.eventType == "completeTrade"){
			    rootClass.sfc.sendXtMessage("zm", "tradeDeal", [fData.tradeId], "str", rootClass.world.curRoom);
            };
            if (_arg1.eventType == "refreshItems"){
            };
            if (_arg1.eventType == "sendTradeFromInvRequest"){
                trace("  Sending Inv->Trade request");
				trace("  Quantity: " + iSel.iQty);
				
				var uuuu:*;
                var aaaa:*;
                var eeee:*;
				eeee = (((iSel.iQty)!=null) ? iSel.iQty : 1);		
				
				if (eeee > 1 && iSel.sES != "ar") {
				    uuuu = new ModalMC();
                    aaaa = {};
                    aaaa.params = {};
                    aaaa.strBody = ("Please specify item quantity you want to trade.");
                    aaaa.callback = qtyRequest;
                    if (eeee > 1){
                        aaaa.qtySel = {
                            min:1,
                            max:eeee
                        };
                    };
                    aaaa.glow = "white,medium";
                    aaaa.greedy = true;
                    rootClass.ui.ModalStack.addChild(uuuu);
                    uuuu.init(aaaa);
				} else {				
				    iSel.TradeID = fData.tradeId;
				    iSel.Quantity = eeee;
                    rootClass.world.sendTradeFromInvRequest(iSel);				
                    iSel = null;
				}
            };
            if (_arg1.eventType == "sendTradeToInvRequest"){
                trace("  Sending Trade->Inv request");
				bSel.TradeID = fData.tradeId;
                rootClass.world.sendTradeToInvRequest(bSel);
                bSel = null;
            };
            if (_arg1.eventType == "sendTradeSwapInvRequest"){
                trace("  Sending Inv<->Trade request");
				bSel.TradeID = fData.tradeId;
                rootClass.world.sendTradeSwapInvRequest(bSel, iSel);
                iSel = null;
                bSel = null;
            };

            updatePreviewButtons(_local6);
            _local4 = null;
            _local5 = null;
            if (!_local2){
                return (_arg1);
            };
            return (null);
        }
	
        public function qtyRequest(_arg1:Object):void{
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
				iSel.TradeID = fData.tradeId;
				iSel.Quantity = 1;
                if (_arg1.iQty != null){
				    iSel.Quantity = _arg1.iQty;
                }		
				rootClass.world.sendTradeFromInvRequest(iSel);			
				iSel = null;
            };
        }

        private function updatePreviewButtons(_arg1:Object=null, _arg2:Object=null):void{
            var _local3:Object = {};
            if (((!((_arg1 == null))) && (!((_arg2 == null))))){
                _local3 = _arg2;
            }
            else {
                _local3.eventType = "previewButton1Update";
                _local3.fData = {};
                _local3.fData.sText = "";
                _local3.sMode = "grey";
                _local3.buttonNewEventType = "";
                if (((!((iSel == null))) && ((bSel == null)))){
                    _local3.fData.sText = "Add to Offer >";
                    _local3.buttonNewEventType = "sendTradeFromInvRequest";
                    _local3.sMode = "red";
                }
                else {
                    if ((((iSel == null)) && (!((bSel == null))))){
                        _local3.fData.sText = "< To Inventory";
                        _local3.buttonNewEventType = "sendTradeToInvRequest";
                        _local3.sMode = "red";
                    }
                    else {
                        _local3.fData.sText = "";
                        _local3.buttonNewEventType = "";
                    };
                };
            };
            notifyByEventType(_local3);
        }

        public function getTabStates(_arg1:Object=null, _arg2:Array=null):Array{
            var _local4:String;
            var _local5:int;
            var _local6:Object;
            var _local3:Array = [{
                sTag:"Show All",
                icon:"iipack",
                state:-1,
                filter:"*",
                mc:{}
            }, {
                sTag:"Show only weapons",
                icon:"iwsword",
                state:-1,
                filter:"Weapon",
                mc:{}
            }, {
                sTag:"Show only armor",
                icon:"iiclass",
                state:-1,
                filter:"ar",
                mc:{}
            }, {
                sTag:"Show only helms",
                icon:"iihelm",
                state:-1,
                filter:"he",
                mc:{}
            }, {
                sTag:"Show only capes",
                icon:"iicape",
                state:-1,
                filter:"ba",
                mc:{}
            }, {
                sTag:"Show only pets",
                icon:"iipet",
                state:-1,
                filter:"pe",
                mc:{}
            }, {
                sTag:"Show only amulets",
                icon:"iin1",
                state:-1,
                filter:"am",
                mc:{}
            }, {
                sTag:"Show only items",
                icon:"iibag",
                state:-1,
                filter:"it",
                mc:{}
            }, {
                sTag:"Show only refinements",
                icon:"iidesign",
                state:-1,
                filter:"enh",
                mc:{}
            }];
            if (_arg2 != null){
                for each (_local4 in _arg2) {
                    _local5 = 0;
                    while (_local5 < _local3.length) {
                        if (_local3[_local5].filter == _local4){
                            var _temp1 = _local5;
                            _local5 = (_local5 - 1);
                            _local3.splice(_temp1, 1);
                        };
                        _local5++;
                    };
                };
            };
            if (_arg1 != null){
                for each (_local6 in _local3) {
                    if (_local6.filter == _arg1.sES){
                        return ([_local6]);
                    };
                };
                return ([_local3[0]]);
            };
            return (_local3);
        }


    }
}//package 

