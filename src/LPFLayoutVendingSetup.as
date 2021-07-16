// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFLayoutBank

package {
    import flash.display.MovieClip;
    import flash.text.*;

    public class LPFLayoutVendingSetup extends LPFLayout {

        public var iSel:Object;
        public var bSel:Object;
        public var itemsI:Array;
        public var itemsV:Array;
        public var vendingPanel:MovieClip;
        public var rootClass:MovieClip;
		public var Copper:int;
		public var Silver:int;
		public var Gold:int;
		public var Coins:int;

        public function LPFLayoutVendingSetup():void{
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
			rootClass.vendingLayout = this;
            fData = _arg1.fData;
            sMode = _arg1.sMode;
            if (("itemsI" in fData)){
                itemsI = fData.itemsI;
            };
            if (("itemsV" in fData)){
                itemsV = fData.itemsV;
            };
            _local2 = _arg1.r;
            var _local3 = "";
            x = _local2.x;
            y = _local2.y;
            w = _local2.w;
            h = _local2.h;
            _local4 = {};
            _local4.panel = new LPFPanelVendingSetup();
            _local4.fData = {
                itemsI:itemsI,
                itemsV:itemsV,
                avatar:rootClass.world.myAvatar,
                objData:fData.objData
            };
            _local4.r = {
                x:30,
                y:80,
                w:900,
                h:400
            };
            _local4.isOpen = true;
            vendingPanel = addPanel(_local4);
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
			
            if (_arg1.eventType == "vendingSel"){
                bSel = _arg1.fData;
                if (_local5 == bSel){
                    bSel = null;
                };
                _arg1.fData = {bSel:bSel};
            };
			if (_arg1.eventType == "withdrawDiamond"){
				iMax = (rootClass.world.myAvatar.objData.vendings.intCoins);
				modal = new ModalMC();
                modalO = {};
                modalO.params = {};
                modalO.strBody = "Please select amount to be withdrawn?";
                modalO.callback = withdrawDiamondRequest;
                modalO.qtySel = {
                     min:1,
                     max:iMax
                };
                modalO.glow = "white,medium";
				modalO.greedy = true;
				rootClass.ui.ModalStack.addChild(modal);
				modal.init(modalO);
			}
			if (_arg1.eventType == "withdrawGold"){
				iMax = (rootClass.world.myAvatar.objData.vendings.intGold);
				modal = new ModalMC();
                modalO = {};
                modalO.params = {};
                modalO.strBody = "Please select amount to be withdrawn?";
                modalO.callback = withdrawGoldRequest;
                modalO.qtySel = {
                     min:1,
                     max:iMax
                };
                modalO.glow = "white,medium";
				modalO.greedy = true;
				rootClass.ui.ModalStack.addChild(modal);
				modal.init(modalO);
			}
			if (_arg1.eventType == "withdrawSilver"){
				iMax = (rootClass.world.myAvatar.objData.vendings.intSilver);
				modal = new ModalMC();
                modalO = {};
                modalO.params = {};
                modalO.strBody = "Please select amount to be withdrawn?";
                modalO.callback = withdrawSilverRequest;
                modalO.qtySel = {
                     min:1,
                     max:iMax
                };
                modalO.glow = "white,medium";
				modalO.greedy = true;
				rootClass.ui.ModalStack.addChild(modal);
				modal.init(modalO);
			}
			if (_arg1.eventType == "withdrawCopper"){
				iMax = (rootClass.world.myAvatar.objData.vendings.intCopper);
				modal = new ModalMC();
                modalO = {};
                modalO.params = {};
                modalO.strBody = "Please select amount to be withdrawn?";
                modalO.callback = withdrawCopperRequest;
                modalO.qtySel = {
                     min:1,
                     max:iMax
                };
                modalO.glow = "white,medium";
				modalO.greedy = true;
				rootClass.ui.ModalStack.addChild(modal);
				modal.init(modalO);
			}
            if (_arg1.eventType == "categorySelVending"){
                bSel = null;
                if (rootClass.world.vendingHasRequested(_arg1.fData.types)){
                    trace("  Drawing Vending locally");
                    _arg1.eventType = "refreshBank";
					rootClass.world.sendLoadVendingRequest(_arg1.fData.types);
                }
                else {
                    _arg1.fData.loadPending = true;
                    _arg1.fData.msg = "Loading...";
                    trace("  Sending Vending request");
                    rootClass.world.sendLoadVendingRequest(_arg1.fData.types);
                };
            };
            if (_arg1.eventType == "refreshBank"){
            };
            if (_arg1.eventType == "refreshInventory"){
            };
            if (_arg1.eventType == "refreshItems"){
            };
            if (_arg1.eventType == "sendVendingFromInvRequest"){
                trace("  Sending Inv->Vending request");
				/** GET VARIABLES **/
				Copper = rootClass.VendingPanelMC.txtSellCopper.text;
				Silver = rootClass.VendingPanelMC.txtSellSilver.text;
				Gold = rootClass.VendingPanelMC.txtSellGold.text;
				Coins = rootClass.VendingPanelMC.txtSellCoins.text;
				if(Copper == 0){
					rootClass.VendingPanelMC.txtSellCopper.text = 0;
				} else {
					rootClass.VendingPanelMC.txtSellCopper.text = Copper;
				}
				
				if(Silver == 0){
					rootClass.VendingPanelMC.txtSellSilver.text = 0;
				} else {
					rootClass.VendingPanelMC.txtSellSilver.text = Silver;
				}
				
				if(Gold == 0){
					rootClass.VendingPanelMC.txtSellGold.text = 0;
				} else {
					rootClass.VendingPanelMC.txtSellGold.text = Gold;
				}
				
				if(Coins == 0){
					rootClass.VendingPanelMC.txtSellCoins.text = 0;
				} else {
					rootClass.VendingPanelMC.txtSellCoins.text = Coins;
				}
				
				
				/** GET QUANTITY **/
				var Quantity;
				var Modal;
				var ModalVariables;
				Quantity = (((iSel.iQty)!=null) ? iSel.iQty : 1);
				
				if (Quantity > 1 && iSel.sES != "ar") {
					Modal = new ModalMC();
					ModalVariables = {};
					ModalVariables.params = {};
					ModalVariables.strBody = ("Please specify item quantity you want to sell.");
					ModalVariables.callback = qtyRequest;
					if (Quantity > 1){
						ModalVariables.qtySel = {
							min:1,
							max:Quantity
						};
					};
					ModalVariables.glow = "white,medium";
					ModalVariables.greedy = true;
					rootClass.ui.ModalStack.addChild(Modal);
					Modal.init(ModalVariables);
				} else {				
					iSel.Quantity = Quantity;
					rootClass.VendingPanelMC.txtSellCopper.text = "";
					rootClass.VendingPanelMC.txtSellSilver.text = "";
					rootClass.VendingPanelMC.txtSellGold.text = "";
					rootClass.VendingPanelMC.txtSellCoins.text = "";
					rootClass.world.sendVendingFromInvRequest(iSel, Copper, Silver, Gold, Coins);
					iSel = null;
				}
				
            };

            if (_arg1.eventType == "sendVendingToInvRequest"){
                trace("  Sending Vending->Inv request");				
                rootClass.world.sendVendingToInvRequest(bSel);
				
                bSel = null;
            };
            if (_arg1.eventType == "sendVendingSwapInvRequest"){
                trace("  Sending Inv<->Vending request");
                rootClass.world.sendVendingSwapInvRequest(bSel, iSel);
                iSel = null;
                bSel = null;
            };
            if (_arg1.eventType == "buyBagSlots"){
                _local2 = true;
                rootClass.world.loadMovieFront(rootClass.bagSpace, "Inline Asset");
                fClose();
            };
			if (_arg1.eventType == "toVending"){
				_local2 = true;
				rootClass.world.vendingToggle();
                //rootClass.world.setupVending();
                fClose();
			}
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
            updatePreviewButtons(_local6);
            _local4 = null;
            _local5 = null;
            if (!_local2){
                return (_arg1);
            };
            return (null);
        }
		
		/** **/
			function qtyRequest(_arg1:Object):void{
				if (_arg1.accept){
					trace(("iqty: " + _arg1.iQty));
					iSel.Quantity = 1;
					if (_arg1.iQty != null){
						iSel.Quantity = _arg1.iQty;
					}		
					rootClass.world.sendVendingFromInvRequest(iSel, Copper, Silver, Gold, Coins);			
					iSel = null;
					
					rootClass.VendingPanelMC.txtSellCopper.text = "";
					rootClass.VendingPanelMC.txtSellSilver.text = "";
					rootClass.VendingPanelMC.txtSellGold.text = "";
					rootClass.VendingPanelMC.txtSellCoins.text = "";
				} else {
					rootClass.VendingPanelMC.txtSellCopper.text = "";
					rootClass.VendingPanelMC.txtSellSilver.text = "";
					rootClass.VendingPanelMC.txtSellGold.text = "";
					rootClass.VendingPanelMC.txtSellCoins.text = "";			
				}
			}
			/** **/
		
		public function withdrawDiamondRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendVendingToInventoryDiamond(_local2);
            };
        }
		
		public function withdrawGoldRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendVendingToInventoryGold(_local2);
            };
        }
		
		public function withdrawSilverRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendVendingToInventorySilver(_local2);
            };
        }
		
		public function withdrawCopperRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendVendingToInventoryCopper(_local2);
            };
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
                if (((!((iSel == null))) && ((bSel == null)))){
                    _local3.fData.sText = "< To Stall";
                    _local3.buttonNewEventType = "sendVendingFromInvRequest";
                    _local3.sMode = "red";
                } else {
                    if ((((iSel == null)) && (!((bSel == null))))){
                        _local3.fData.sText = "To Inventory >";
                        _local3.buttonNewEventType = "sendVendingToInvRequest";
                        _local3.sMode = "red";
                    /*} else {
                        if (((!((iSel == null))) && (!((bSel == null))))){
                            _local3.fData.sText = "< Swap >";
                            _local3.buttonNewEventType = "sendVendingSwapInvRequest";
                            _local3.sMode = "red";
                        } else {
                            _local3.fData.sText = "";
                            _local3.buttonNewEventType = "";
                        };*/
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

