// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFLayoutBank

package {
    import flash.display.MovieClip;
    import flash.text.*;

    public class LPFLayoutBank extends LPFLayout {

        public var iSel:Object;
        public var bSel:Object;
        public var itemsI:Array;
        public var itemsB:Array;
        public var bankPanel:MovieClip;
        public var rootClass:MovieClip;

        public function LPFLayoutBank():void{
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
            if (("itemsI" in fData)){
                itemsI = fData.itemsI;
            };
            if (("itemsB" in fData)){
                itemsB = fData.itemsB;
            };
            _local2 = _arg1.r;
            var _local3 = "";
            x = _local2.x;
            y = _local2.y;
            w = _local2.w;
            h = _local2.h;
            _local4 = {};
            _local4.panel = new LPFPanelBank();
            _local4.fData = {
                itemsI:itemsI,
                itemsB:itemsB,
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
            if (_arg1.eventType == "bankSel"){
                bSel = _arg1.fData;
                if (_local5 == bSel){
                    bSel = null;
                };
                _arg1.fData = {bSel:bSel};
            };
            if (_arg1.eventType == "categorySel"){
                bSel = null;
                if (rootClass.world.bankHasRequested(_arg1.fData.types)){
                    trace("  Drawing Bank locally");
                    _arg1.eventType = "refreshBank";
                }
                else {
                    _arg1.fData.loadPending = true;
                    _arg1.fData.msg = "Loading...";
                    trace("  Sending Bank request");
                    rootClass.world.sendLoadBankRequest(_arg1.fData.types);
                };
            };
            if (_arg1.eventType == "refreshBank"){
            };
            if (_arg1.eventType == "refreshInventory"){
            };
			if (_arg1.eventType == "refreshCoins"){
            };
            if (_arg1.eventType == "refreshItems"){
            };
            if (_arg1.eventType == "sendBankFromInvRequest"){
                trace("  Sending Inv->Bank request");
                rootClass.world.sendBankFromInvRequest(iSel);
                iSel = null;
            };
            if (_arg1.eventType == "sendBankToInvRequest"){
                trace("  Sending Bank->Inv request");
                rootClass.world.sendBankToInvRequest(bSel);
                bSel = null;
            };
            if (_arg1.eventType == "sendBankSwapInvRequest"){
                trace("  Sending Inv<->Bank request");
                rootClass.world.sendBankSwapInvRequest(bSel, iSel);
                iSel = null;
                bSel = null;
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
			if (_arg1.eventType == "withdrawDiamond"){
				iMax = (rootClass.world.myAvatar.objData.bank.intCoins);
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
				iMax = (rootClass.world.myAvatar.objData.bank.intGold);
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
				iMax = (rootClass.world.myAvatar.objData.bank.intSilver);
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
				iMax = (rootClass.world.myAvatar.objData.bank.intCopper);
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
			/** DEPOSIT **/
			if (_arg1.eventType == "depositDiamond"){
				iMax = (rootClass.world.myAvatar.objData.intCoins);
				modal = new ModalMC();
                modalO = {};
                modalO.params = {};
                modalO.strBody = "Please select amount to be deposited?";
                modalO.callback = depositDiamondRequest;
                modalO.qtySel = {
                     min:1,
                     max:iMax
                };
                modalO.glow = "white,medium";
				modalO.greedy = true;
				rootClass.ui.ModalStack.addChild(modal);
				modal.init(modalO);
			}
			if (_arg1.eventType == "depositGold"){
				iMax = (rootClass.world.myAvatar.objData.intGold);
				modal = new ModalMC();
                modalO = {};
                modalO.params = {};
                modalO.strBody = "Please select amount to be deposited?";
                modalO.callback = depositGoldRequest;
                modalO.qtySel = {
                     min:1,
                     max:iMax
                };
                modalO.glow = "white,medium";
				modalO.greedy = true;
				rootClass.ui.ModalStack.addChild(modal);
				modal.init(modalO);
			}
			if (_arg1.eventType == "depositSilver"){
				iMax = (rootClass.world.myAvatar.objData.intSilver);
				modal = new ModalMC();
                modalO = {};
                modalO.params = {};
                modalO.strBody = "Please select amount to be deposited?";
                modalO.callback = depositSilverRequest;
                modalO.qtySel = {
                     min:1,
                     max:iMax
                };
                modalO.glow = "white,medium";
				modalO.greedy = true;
				rootClass.ui.ModalStack.addChild(modal);
				modal.init(modalO);
			}
			if (_arg1.eventType == "depositCopper"){
				iMax = (rootClass.world.myAvatar.objData.intCopper);
				modal = new ModalMC();
                modalO = {};
                modalO.params = {};
                modalO.strBody = "Please select amount to be deposited?";
                modalO.callback = depositCopperRequest;
                modalO.qtySel = {
                     min:1,
                     max:iMax
                };
                modalO.glow = "white,medium";
				modalO.greedy = true;
				rootClass.ui.ModalStack.addChild(modal);
				modal.init(modalO);
			}
			/** CONVERT **/
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
		
		public function withdrawDiamondRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendBankToInventoryDiamond(_local2);
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
                rootClass.world.sendBankToInventoryGold(_local2);
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
                rootClass.world.sendBankToInventorySilver(_local2);
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
                rootClass.world.sendBankToInventoryCopper(_local2);
            };
        }
		/** DEPOSIT **/
		public function depositDiamondRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendInventoryToBankDiamond(_local2);
            };
        }
		
		public function depositGoldRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendInventoryToBankGold(_local2);
            };
        }
		
		public function depositSilverRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendInventoryToBankSilver(_local2);
            };
        }
		
		public function depositCopperRequest(_arg1:Object):void
        {
            var _local2:int;
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                _local2 = 1;
                if (_arg1.iQty != null){
                    _local2 = _arg1.iQty;
                };
                rootClass.world.sendInventoryToBankCopper(_local2);
            };
        }
		
		/** CONVERT **/
		
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
            }
            else {
                _local3.eventType = "previewButton1Update";
                _local3.fData = {};
                _local3.fData.sText = "";
                _local3.sMode = "grey";
                _local3.buttonNewEventType = "";
                if (((!((iSel == null))) && ((bSel == null)))){
                    _local3.fData.sText = "< To Bank";
                    _local3.buttonNewEventType = "sendBankFromInvRequest";
                    _local3.sMode = "red";
                }
                else {
                    if ((((iSel == null)) && (!((bSel == null))))){
                        _local3.fData.sText = "To Inventory >";
                        _local3.buttonNewEventType = "sendBankToInvRequest";
                        _local3.sMode = "red";
                    }
                    else {
                        if (((!((iSel == null))) && (!((bSel == null))))){
                            _local3.fData.sText = "< Swap >";
                            _local3.buttonNewEventType = "sendBankSwapInvRequest";
                            _local3.sMode = "red";
                        }
                        else {
                            _local3.fData.sText = "";
                            _local3.buttonNewEventType = "";
                        };
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

