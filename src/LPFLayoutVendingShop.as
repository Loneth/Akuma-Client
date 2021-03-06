// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFLayoutMergeShop

package {
    import flash.display.MovieClip;
    import flash.text.*;

    public class LPFLayoutVendingShop extends LPFLayout {

        private var aSel:String = "";
        private var bSel:String = "";
        public var iSel:Object;
        public var eSel:Object;
        public var itemsInv:Array;
        public var itemsVending:Array;
        public var mergePanel:MovieClip;
        public var rootClass:MovieClip;

        public function LPFLayoutVendingShop():void{
            x = 0;
            y = 0;
            panels = [];
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            var _local2:Object;
            var _local4:Object;
            var _local5:MovieClip;
            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg1.fData;
            sMode = _arg1.sMode;
            if (("itemsInv" in fData)){
                itemsInv = fData.itemsInv;
            };
            if (("itemsVending" in fData)){
                itemsVending = fData.itemsVending;
            };
            _local2 = _arg1.r;
            var _local3 = "";
            x = _local2.x;
            y = _local2.y;
            w = _local2.w;
            h = _local2.h;
            _local4 = {};
            _local4.panel = new LPFPanelVendingShop();
            _local3 = "Vending Shop";
            _local4.fData = {
                items:itemsVending,
                itemsInv:itemsInv,
                sName:_local3,
                objData:fData.objData
            };
            _local4.r = {
                x:30,
                y:80,
                w:900,
                h:400
            };
            _local4.isOpen = true;
            mergePanel = addPanel(_local4);
            updatePreviewButtons();
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
        }

        override protected function handleUpdate(_arg1:Object):Object{
            var _local3:Object;
            var _local6:Array;
            var _local7:Object;
            var _local8:*;
            var _local9:*;
            trace(("LayoutINVENH.handleUpdate > " + _arg1.eventType));
            var _local2:Boolean;
            var _local4:Object = iSel;
            var _local5:Object;
            if (_arg1.eventType == "sModeSet"){
                if (sMode != _arg1.sModeBroadcast){
                    sMode = _arg1.sModeBroadcast;
                    iSel = null;
                    eSel = null;
                    _arg1.iSel = iSel;
                    _local6 = itemsInv;
                    if (sMode == "shopBuy"){
                        _local6 = itemsVending;
                    };
                    _arg1.fData = {list:_local6};
                };
            };
			if (_arg1.eventType == "vendingSel"){
                iSel = null;
				aSel = _arg1.fData.sType;
                iSel = _arg1.fData;
                _arg1.fData = {
                    iSel:iSel,
                    oSel:_arg1.fData
                };
                if (_local4 == iSel){
                    _local2 = true;
                };
            };
			 if (_arg1.eventType == "categorySelVending"){
                bSel = null;
                if (rootClass.world.vendingShopHasRequested(_arg1.fData.types)){
                    trace("  Drawing Vending locally");
					rootClass.world.sendLoadVendingShopRequest(_arg1.fData.types);
					_arg1.eventType = "refreshBank";
                }
                else {
					//this.rootClass.world.myAvatar.vendingReset();
                    _arg1.fData.loadPending = true;
                    _arg1.fData.msg = "Loading...";
                    trace("  Sending Vending request");
                    rootClass.world.sendLoadVendingShopRequest(_arg1.fData.types);
					_arg1.eventType = "refreshBank";
                };
            };
            if (_arg1.eventType == "refreshBank"){
            };
            if (_arg1.eventType == "refreshInventory"){
            };
            if (_arg1.eventType == "refreshItems"){
            };
            if (_arg1.eventType == "buyItem"){
				rootClass.world.sendBuyVendingItemRequest(iSel);
            };
            if (_arg1.eventType == "sellItem"){
                if (iSel != null){
                    _local7 = iSel;
                };
                _local8 = new ModalMC();
                _local9 = {};
                _local9.strBody = (("Are you sure you want to sell '" + _local7.sName) + "'?");
                _local9.params = {iSel:_local7};
                _local9.callback = onSellRequest;
                _local9.glow = "white,medium";
                rootClass.ui.ModalStack.addChild(_local8);
                _local8.init(_local9);
            };
            if (_arg1.eventType == "buyBagSlots"){
                _local2 = true;
                rootClass.world.loadMovieFront(rootClass.bagSpace, "Inline Asset");
                fClose();
            };
            if (_arg1.eventType == "helpAC"){
                _local2 = true;
                rootClass.world.loadMovieFront("interface/goldAC4.swf", "Inline Asset");
            };
			if (_arg1.eventType == "convertSilver"){
                iMax = (rootClass.world.myAvatar.objData.intCopper / 50000);
                if (iMax < 1){ 
                    modal = new ModalMC();
                    modalO = {};
                    modalO.strBody = "You do not have enough copper to convert to silver. <br><br> (You need 50,000 copper for 1 silver.)";
                    modalO.params = {};
                    modalO.glow = "red,medium";
                    modalO.btns = "mono";
                    rootClass.ui.ModalStack.addChild(modal);
                    modal.init(modalO);
                } else {
                    if (iMax == 1){
                        modal = new ModalMC();
                        modalO = {};
                        modalO.params = {};
                        modalO.strBody = "1 Silver = 50,000 Copper. <br><br> You only have enough copper to convert to one silver. Do you wish to continue?";
                        modalO.callback = silverRequest;
                        modalO.qtySel = {
                            min:1,
                            max:iMax
                        };
                        modalO.glow = "white,medium";
                        modalO.greedy = true;
                        rootClass.ui.ModalStack.addChild(modal);
                        modal.init(modalO);
                    } else {
                        modal = new ModalMC();
                        modalO = {};
                        modalO.params = {};
                        modalO.strBody = "1 Silver = 50,000 Copper. <br><br> Please select the amount of silver you want.";
                        modalO.callback = silverRequest;
                        modalO.qtySel = {
                            min:1,
                            max:iMax
                        };
                        modalO.glow = "white,medium";
                        modalO.greedy = true;
                        rootClass.ui.ModalStack.addChild(modal);
                        modal.init(modalO);
                    };
                };
            };
			if (_arg1.eventType == "convertGold"){
                iMax = (rootClass.world.myAvatar.objData.intSilver / 500000);
                if (iMax < 1){ 
                    modal = new ModalMC();
                    modalO = {};
                    modalO.strBody = "You do not have enough silver to convert to gold. <br><br> (You need 500,000 silver for 1 gold.)";
                    modalO.params = {};
                    modalO.glow = "red,medium";
                    modalO.btns = "mono";
                    rootClass.ui.ModalStack.addChild(modal);
                    modal.init(modalO);
                } else {
                    if (iMax == 1){
                        modal = new ModalMC();
                        modalO = {};
                        modalO.params = {};
                        modalO.strBody = "1 Gold = 500,000 Silver. <br><br> You only have enough silver to convert to one gold. Do you wish to continue?";
                        modalO.callback = goldRequest;
                        modalO.qtySel = {
                            min:1,
                            max:iMax
                        };
                        modalO.glow = "white,medium";
                        modalO.greedy = true;
                        rootClass.ui.ModalStack.addChild(modal);
                        modal.init(modalO);
                    } else {
                        modal = new ModalMC();
                        modalO = {};
                        modalO.params = {};
                        modalO.strBody = "1 Gold = 500,000 Copper. <br><br> Please select the amount of gold you want.";
                        modalO.callback = goldRequest;
                        modalO.qtySel = {
                            min:1,
                            max:iMax
                        };
                        modalO.glow = "white,medium";
                        modalO.greedy = true;
                        rootClass.ui.ModalStack.addChild(modal);
                        modal.init(modalO);
                    };
                };
            };
            updatePreviewButtons(_local5);
            _local4 = null;
            if (!_local2){
                return (_arg1);
            };
            return (null);
        }
		
		private  function firstLetterUpperCase(strData:String):String 
		{
			var strArray:Array = strData.split(' ');
			var newArray:Array = [];
			for (var str:String in strArray) 
			{
			   newArray.push(strArray[str].charAt(0).toUpperCase() + strArray[str].slice(1));
			}
			return newArray.join(' ');
		}

		
		public function silverRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendConvertToSilverRequest(_local2);
            };
        }
		
		public function goldRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendConvertToGoldRequest(_local2);
            };
        }

        private function updatePreviewButtons(_arg1:Object=null, _arg2:Object=null):void{
            var _local3:Object = {};
            if (((!((_arg1 == null))) && (!((_arg2 == null))))){
                _local3 = _arg2;
            } else {
                _local3.eventType = "previewButton1Update";
                _local3.fData = {};
                _local3.fData.sText = "";
                _local3.sMode = "grey";
                _local3.buttonNewEventType = "";
                if (sMode == "shopBuy"){
                    if (iSel != null){
                        if (iSel.iQtyRemain <= 0){
                            _local3.fData.sText = "Sold Out!";
                            _local3.buttonNewEventType = "none";
                            _local3.sMode = "grey";
                        } else {
                            _local3.fData.sText = "Buy";
                            _local3.buttonNewEventType = "buyItem";
                            _local3.sMode = "red";
                        };
                    };
                } else {
                    _local3.fData.sText = "";
                    _local3.buttonNewEventType = "";
                };
            
                if (sMode == "shopSell"){
                    if (iSel != null){
                        _local3.fData.sText = "Sell";
                        _local3.buttonNewEventType = "sellItem";
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

        private function onSellRequest(_arg1:Object):void{
            if (_arg1.accept){
                rootClass.world.sendSellItemRequest(_arg1.iSel);
            };
        }

        public function getTabStates(_arg1:Object=null):Array{
            var _local3:Object;
            var _local2:Array = [{
                sTag:"Show All",
                icon:"iipack",
                state:-1,
                filter:"All",
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
            if (_arg1 != null){
                for each (_local3 in _local2) {
                    if (_local3.filter == _arg1.sES){
                        return ([_local3]);
                    };
                };
                return ([_local2[0]]);
            };
            return (_local2);
        }


    }
}//package 


