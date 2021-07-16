// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFLayoutResourceInventory

package {
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.*;

    public class LPFLayoutResourceInventory extends LPFLayout {

        private var aSel:String = "";
        private var bSel:String = "";
        public var iSel:Object;
        public var eSel:Object;
        public var shopinfo:Object;
        public var itemsInv:Array;
        public var itemsShop:Array;
        public var multiPanel:MovieClip;
        public var splitPanel:MovieClip;
        public var previewPanel:MovieClip;
        public var rootClass:MovieClip;

        public function LPFLayoutResourceInventory():void{
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
            if (("itemsShop" in fData)){
                itemsShop = fData.itemsShop;
            };
            if (("shopinfo" in fData)){
                shopinfo = fData.shopinfo;
            };
            _local2 = _arg1.r;
            var _local3 = "";
            x = _local2.x;
            y = _local2.y;
            w = _local2.w;
            h = _local2.h;
            tempFill();
            _local4 = {};
            _local4.panel = new LPFPanelListShopInvB();
            _local3 = "Inventory";
            _local4.fData = {
                items:itemsInv,
                sName:_local3
            };
            _local4.r = {
                x:322,
                y:3,
                w:316,
                h:495
            };
            _local4.closeType = "hide";
            _local4.hideDir = "right";
            _local4.hidePad = 3;
            _local4.isOpen = false;
            splitPanel = addPanel(_local4);
            splitPanel.visible = false;
            splitPanel.fHide();
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
            previewPanel.visible = false;
            previewPanel.addEventListener(Event.ENTER_FRAME, previewPanelEF, false, 0, true);
            _local4 = {};
            _local4.panel = new LPFPanelListShopInvA();
            _local3 = (((sMode.toLowerCase().indexOf("shop"))>-1) ? rootClass.world.shopinfo.sName : "Inventory");
            _local4.fData = {
                items:(((itemsShop)!=null) ? itemsShop : itemsInv),
                itemsInv:itemsInv,
                objData:fData.objData,
                sName:_local3
            };
            if (shopinfo != null){
                _local4.fData.shopinfo = shopinfo;
            };
            _local4.r = {
                x:641,
                y:3,
                w:316,
                h:495
            };
            _local4.closeType = "close";
            _local4.showDragonRight = true;
            _local4.isOpen = true;
            multiPanel = addPanel(_local4);
            updatePreviewButtons();
            rootClass.dropStackBoost();
        }

        override public function fClose():void{
            var _local1:MovieClip;
            rootClass.dropStackReset();
            previewPanel.removeEventListener(Event.ENTER_FRAME, previewPanelEF);
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
            var p:Object;
            var newList:Array;
            var sellSel:Object;
            var modal:* = undefined;
            var modalO:* = undefined;
            var o:Object = _arg1;
            trace(("LayoutINVENH.handleUpdate > " + o.eventType));
            var cancelBroadcast:Boolean;
            var iSelPrev:Object = iSel;
            var eSelPrev:Object = eSel;
            var forceO:Object;
            var forceP:Object;
            if (((!((iSel == null))) && (!((eSel == null))))){
                previewPanel.bg.tTitle.text = "Create";
            }
            else {
                previewPanel.bg.tTitle.text = "Preview";
            };
            if (o.eventType == "sModeSet"){
                if (sMode != o.sModeBroadcast){
                    sMode = o.sModeBroadcast;
                    iSel = null;
                    eSel = null;
                    o.iSel = iSel;
                    newList = itemsInv;
                    if (sMode == "shopBuy"){
                        newList = itemsShop;
                    };
                    o.fData = {list:newList};
                    splitPanel.fHide();
                    previewPanel.fHide();
                };
            };
            if (o.eventType == "listItemASel"){
                if (!rootClass.isGreedyModalInStack()){
                    eSel = null;
                    iSel = null;
                    aSel = o.fData.sType.toLowerCase();
                    bSel = "";
                    if (aSel == "refinement"){
                        eSel = o.fData;
                    }
                    else {
                        iSel = o.fData;
                    };
                    if (o.fData.sType.toLowerCase() == "refinement"){
                        o.tabStates = getTabStates(o.fData);
                    }
                    else {
                        o.tabStates = getTabStates({sES:"enh"});
                    };
                    o.fData = {
                        iSel:iSel,
                        eSel:eSel,
                        oSel:o.fData
                    };
                    splitPanel.fHide();
                    previewPanel.fShow();
                    if ((((iSelPrev == iSel)) && ((eSelPrev == eSel)))){
                        cancelBroadcast = true;
                    };
                    if (((!((iSel == null))) && ((eSel == null)))){
                        splitPanel.bg.tTitle.text = "Select Refinement to Apply";
                    };
                    if ((((iSel == null)) && (!((eSel == null))))){
                        splitPanel.bg.tTitle.text = "Select Item to Refine";
                    };
                }
                else {
                    cancelBroadcast = true;
                };
            };
            if (o.eventType == "listItemBSel"){
                if (!rootClass.isGreedyModalInStack()){
                    p = rootClass.copyObj(o);
                    p.eventType = "listItemBSolo";
                    if (o.fData.sType.toLowerCase() == "refinement"){
                        p.fData = {
                            iSel:null,
                            eSel:p.fData
                        };
                    }
                    else {
                        p.fData = {
                            iSel:p.fData,
                            eSel:null
                        };
                    };
                    if (bSel == "refinement"){
                        eSel = null;
                    }
                    else {
                        if (bSel != ""){
                            iSel = null;
                        };
                    };
                    bSel = o.fData.sType.toLowerCase();
                    if (bSel == "refinement"){
                        eSel = o.fData;
                    }
                    else {
                        iSel = o.fData;
                    };
                    o.fData = {
                        iSel:iSel,
                        eSel:eSel
                    };
                    if (((!((iSelPrev == iSel))) || (!((eSelPrev == eSel))))){
                        notifyByEventType(p);
                    };
                    previewPanel.fShow();
                }
                else {
                    cancelBroadcast = true;
                };
            };
            if (o.eventType == "refreshItems"){
                if (itemsInv.indexOf(iSel) == -1){
                    iSel = null;
                };
                if (itemsInv.indexOf(eSel) == -1){
                    eSel = null;
                };
                o.fData = {
                    iSel:iSel,
                    eSel:eSel
                };
                if (("sInstruction" in o)){
                    if (o.sInstruction == "closeWindows"){
                        splitPanel.fHide();
                        previewPanel.fHide();
                    };
                    if (o.sInstruction == "previewEquipOnly"){
                        splitPanel.fHide();
                        if (((!((iSel == null))) && (!((iSel.bEquip == 1))))){
                            forceO = {};
                            forceO.eventType = "previewButton1Update";
                            forceO.fData = {};
                            forceO.fData.sText = "Equip";
                            forceO.sMode = "red";
                            forceO.r = {
                                x:-1,
                                y:-40,
                                w:-1,
                                h:-1
                            };
                            forceO.buttonNewEventType = "equipItem";
                            forceP = {};
                            forceP.eventType = "previewButton2Update";
                            forceP.fData = {};
                            forceP.fData.sText = "";
                            forceP.sMode = "grey";
                            forceP.r = {
                                x:173,
                                y:-40,
                                w:-1,
                                h:-1
                            };
                        }
                        else {
                            previewPanel.fHide();
                        };
                    };
                };
                if ((((iSel == null)) && ((eSel == null)))){
                    splitPanel.fHide();
                    previewPanel.fHide();
                };
            };
            if (o.eventType == "refreshShop"){
                rootClass.world.sendReloadShopRequest(shopinfo.ShopID);
                cancelBroadcast = true;
            };
            if (o.eventType == "showItemListB"){
                if (!rootClass.isGreedyModalInStack()){
                    splitPanel.fShow();
                }
                else {
                    cancelBroadcast = true;
                };
            };
            if (o.eventType == "showItemListBNoBtns"){
                if (!rootClass.isGreedyModalInStack()){
                    forceO = {};
                    forceO.eventType = "previewButton1Update";
                    forceO.fData = {};
                    forceO.fData.sText = "";
                    forceP = {};
                    o.eventType = "showItemListB";
                    splitPanel.fShow();
                }
                else {
                    cancelBroadcast = true;
                };
            };
            if ((((o.eventType == "equipItem")) || ((o.eventType == "unequipItem")))){
                if (!rootClass.isGreedyModalInStack()){
                    if (iSel != null){
                        if (((rootClass.toggleItemEquip(iSel)) && ((o.eventType == "equipItem")))){
                            splitPanel.fHide();
                            previewPanel.fHide();
                        };
                    };
                }
                else {
                    cancelBroadcast = true;
                };
            };
            if (o.eventType == "refineItem"){
                if (!rootClass.isGreedyModalInStack()){
                    if (((!((iSel == null))) && (!((eSel == null))))){
                        rootClass.tryRefine(iSel, eSel, (sMode == "shopBuy"));
                    };
                }
                else {
                    cancelBroadcast = true;
                };
            };
            if (o.eventType == "buyItem"){
                if (iSel != null){
                    rootClass.world.sendBuyItemRequest(iSel);
                }
                else {
                    if (eSel != null){
                        rootClass.world.sendBuyItemRequest(eSel);
                    };
                };
            };
            if (o.eventType == "useItem"){
                if (iSel != null){
                    rootClass.world.tryUseItem(iSel);
                };
            };
            if (o.eventType == "sellItem"){
                if (iSel != null){
                    sellSel = iSel;
                }
                else {
                    if (eSel != null){
                        sellSel = eSel;
                    };
                };
                if (sellSel.bEquip == 1){
                    rootClass.MsgBox.notify("Item is currently equipped!");
                }
                else {
                    if ((((((((sellSel.bCoins == 1)) && ((sellSel.iHrs == null)))) && (!((sellSel.ItemID == 8939))))) && (!((sellSel.iCost == 0))))){
                        trace(((((("bCoins: " + sellSel.bCoins) + " sellSel.iHrs: ") + sellSel.iHrs) + " ItemID: ") + sellSel.ItemID));
                        rootClass.MsgBox.notify("Cannot be sold, free storage in your bank!");
                    }
                    else {
                        if (sellSel.sMeta != null){
                            trace(("sMeta: " + sellSel.sMeta));
                            try {
                                if (sellSel.sMeta.indexOf("NoSell") > -1){
                                    rootClass.MsgBox.notify("This item cannot be sold!");
                                }
                                else {
                                    modal = new ModalMC();
                                    modalO = {};
                                    modalO.strBody = (("Are you sure you want to sell '" + sellSel.sName) + "'?");
                                    modalO.params = {iSel:sellSel};
                                    modalO.callback = onSellRequest;
                                    modalO.glow = "white,medium";
                                    modalO.greedy = true;
                                    rootClass.ui.ModalStack.addChild(modal);
                                    modal.init(modalO);
                                };
                            }
                            catch(e) {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Are you sure you want to sell '" + sellSel.sName) + "'?");
                                modalO.params = {iSel:sellSel};
                                modalO.callback = onSellRequest;
                                modalO.glow = "white,medium";
                                modalO.greedy = true;
                                rootClass.ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                        }
                        else {
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (("Are you sure you want to sell '" + sellSel.sName) + "'?");
                            modalO.params = {iSel:sellSel};
                            modalO.callback = onSellRequest;
                            modalO.glow = "white,medium";
                            modalO.greedy = true;
                            rootClass.ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                        };
                    };
                };
            };
            if (o.eventType == "buyBagSlots"){
                cancelBroadcast = true;
                rootClass.world.loadMovieFront(rootClass.bagSpace, "Inline Asset");
                fClose();
            };
            if (o.eventType == "helpAC"){
                cancelBroadcast = true;
                rootClass.world.loadMovieFront("interface/goldAC4.swf", "Inline Asset");
            };
            updatePreviewButtons(forceO, forceP);
            iSelPrev = null;
            eSelPrev = null;
            if (!cancelBroadcast){
                return (o);
            };
            return (null);
        }

        private function updatePreviewButtons(_arg1:Object=null, _arg2:Object=null):void{
            var _local3:Object = {};
            var _local4:Object = {};
            if (((!((_arg1 == null))) && (!((_arg2 == null))))){
                _local3 = _arg1;
                _local4 = _arg2;
            }
            else {
                _local3.eventType = "previewButton1Update";
                _local3.fData = {};
                _local3.fData.sText = "";
                _local3.sMode = "grey";
                _local3.r = {
                    x:46,
                    y:-40,
                    w:-1,
                    h:-1
                };
                _local3.buttonNewEventType = "";
                _local4.eventType = "previewButton2Update";
                _local4.fData = {};
                _local4.fData.sText = "";
                _local4.sMode = "grey";
                _local4.r = {
                    x:173,
                    y:-40,
                    w:-1,
                    h:-1
                };
                _local4.buttonNewEventType = "";
                if (sMode == "inventory"){
                    if ((((iSel == null)) && ((eSel == null)))){
                        _local3.fData.sText = "";
                        _local3.buttonNewEventType = "";
                        _local4.fData.sText = "";
                        _local4.buttonNewEventType = "";
                    }
                    else {
                        if (((!((iSel == null))) && (!((eSel == null))))){
                            _local3.fData.sText = "Refine!";
                            _local3.buttonNewEventType = "refineItem";
                            _local3.sMode = "red";
                            if (iSel.bEquip == 1){
                                _local4.fData.sText = "Unequip";
                                _local4.buttonNewEventType = "unequipItem";
                            }
                            else {
                                _local4.fData.sText = "Equip";
                                _local4.buttonNewEventType = "equipItem";
                                if (_local3.sMode != "red"){
                                    _local4.sMode = "red";
                                };
                            };
                        }
                        else {
                            if (eSel != null){
                                _local3.fData.sText = "";
                                _local3.buttonNewEventType = "";
                                _local4.fData.sText = "Apply Now";
                                _local4.buttonNewEventType = "showItemListB";
                                _local4.sMode = "red";
                            }
                            else {
                                if (iSel != null){
                                    if (["Weapon", "he", "ar", "ba"].indexOf(iSel.sES) > -1){
                                        _local3.fData.sText = "Refine!";
                                        _local3.buttonNewEventType = "showItemListB";
                                        if (!("RefineLvl" in iSel)){
                                            _local3.sMode = "red";
                                        }
                                        else {
                                            _local4.sMode = "red";
                                        };
                                        if (iSel.bEquip == 1){
                                            _local4.fData.sText = "Unequip";
                                            _local4.buttonNewEventType = "unequipItem";
                                        }
                                        else {
                                            _local4.fData.sText = "Equip";
                                            _local4.buttonNewEventType = "equipItem";
                                        };
                                    }
                                    else {
                                        trace(((("iSel.sType: " + iSel.sType) + " iSel.sLink: ") + iSel.sLink));
                                        if ((((((((iSel.sType.toLowerCase() == "pet")) || ((((((((iSel.sType.toLowerCase() == "item")) && (!((String(iSel.sLink).toLowerCase() == ""))))) && (!((String(iSel.sLink).toLowerCase() == " "))))) && (!((String(iSel.sLink).toLowerCase() == "none"))))))) || ((iSel.sES == "co")))) || ((iSel.sES == "am")))){
                                            _local4.sMode = "red";
                                            if (iSel.bEquip == 1){
                                                _local4.fData.sText = "Unequip";
                                                _local4.buttonNewEventType = "unequipItem";
                                            }
                                            else {
                                                _local4.fData.sText = "Equip";
                                                _local4.buttonNewEventType = "equipItem";
                                            };
                                        };
                                        if ((((iSel.sType.toLowerCase() == "serveruse")) || ((iSel.sType.toLowerCase() == "clientuse")))){
                                            _local4.sMode = "red";
                                            _local4.fData.sText = "Use";
                                            _local4.buttonNewEventType = "useItem";
                                        };
										if (iSel.sType.toLowerCase() == "egg"){
											_local4.sMode = "red";
                                            _local4.fData.sText = "Hatch";
                                            _local4.buttonNewEventType = "useItem";
										};
                                    };
                                };
                            };
                        };
                    };
                };
                if (sMode == "shopBuy"){
                    if ((((iSel == null)) && ((eSel == null)))){
                        _local3.fData.sText = "";
                        _local3.buttonNewEventType = "";
                        _local4.fData.sText = "";
                        _local4.buttonNewEventType = "";
                    }
                    else {
                        if (((!((iSel == null))) && (!((eSel == null))))){
                            _local3.fData.sText = "";
                            _local3.buttonNewEventType = "";
                            _local4.fData.sText = "Refine!";
                            _local4.buttonNewEventType = "refineItem";
                            _local4.sMode = "red";
                        }
                        else {
                            if (eSel != null){
                                _local3.fData.sText = "Buy and Hold";
                                _local3.buttonNewEventType = "buyItem";
                                _local4.fData.sText = "Apply Now";
                                _local4.buttonNewEventType = "showItemListBNoBtns";
                                _local4.sMode = "red";
                            }
                            else {
                                if (iSel != null){
                                    if (((((("bLimited" in shopinfo)) && (shopinfo.bLimited))) && ((iSel.iQtyRemain <= 0)))){
                                        _local3.fData.sText = "";
                                        _local3.buttonNewEventType = "";
                                        _local4.fData.sText = "Sold Out!";
                                        _local4.buttonNewEventType = "none";
                                        _local4.sMode = "grey";
                                    }
                                    else {
                                        _local3.fData.sText = "";
                                        _local3.buttonNewEventType = "";
                                        _local4.fData.sText = "Buy";
                                        _local4.buttonNewEventType = "buyItem";
                                        _local4.sMode = "red";
                                    };
                                };
                            };
                        };
                    };
                };
                if (sMode == "shopSell"){
                    if ((((iSel == null)) && ((eSel == null)))){
                        _local3.fData.sText = "";
                        _local3.buttonNewEventType = "";
                        _local4.fData.sText = "";
                        _local4.buttonNewEventType = "";
                    }
                    else {
                        _local3.fData.sText = "";
                        _local3.buttonNewEventType = "";
                        _local4.fData.sText = "Sell";
                        _local4.buttonNewEventType = "sellItem";
                        _local4.sMode = "red";
                    };
                };
            };
            notifyByEventType(_local3);
            notifyByEventType(_local4);
        }

        private function onSellRequest(_arg1:Object):void{
            if (_arg1.accept){
                rootClass.world.sendSellItemRequest(_arg1.iSel);
            };
        }

        public function getTabStates(_arg1:Object=null):Array{
            var _local3:Object;
            var _local2:Array = [{
                sTag:"Show only Resources",
                icon:"iic2",
                state:-1,
                filter:"it",
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

        private function previewPanelEF(_arg1:Event):void{
            var _local2:Number = previewPanel.x;
            var _local3:Number = ((splitPanel.x - previewPanel.w) - previewPanel.xBuffer);
            var _local4:Number = (_local3 - _local2);
            if ((((_local4 > 20)) || (splitPanel.visible))){
                previewPanel.x = ((splitPanel.x - previewPanel.w) - previewPanel.xBuffer);
            };
        }


    }
}//package 

