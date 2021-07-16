// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//HouseShop

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class HouseShop extends MovieClip {

        public var tabInv:MovieClip;
        public var btnPreview:SimpleButton;
        public var strGold:TextField;
        public var strCost:TextField;
        public var mcItemList:ItemList;
        public var mcCoin:MovieClip;
        public var strInfo:TextField;
        public var mcUpgrade:MovieClip;
        public var txtTitle:TextField;
        public var txtAction:TextField;
        public var bg1:MovieClip;
        public var tabShop:MovieClip;
        public var bg2:MovieClip;
        public var btnAction:SimpleButton;
        public var mcShopList:ItemList;
        public var strCoins:TextField;
        var rootClass;
        var bitShop:Boolean = true;

        public function HouseShop(){
            rootClass = MovieClip(parent.parent.parent);
            super();
            bg1.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            btnPreview.addEventListener(MouseEvent.CLICK, onPreviewClick, false, 0, true);
            btnAction.addEventListener(MouseEvent.CLICK, onActionClick, false, 0, true);
            tabShop.addEventListener(MouseEvent.CLICK, onClickShop, false, 0, true);
            tabInv.addEventListener(MouseEvent.CLICK, onClickInv, false, 0, true);
            mcShopList.inventorySlot = rootClass.world.shopinfo.items.length;
            mcShopList.init(rootClass.world.shopinfo.items);
            mcItemList.inventorySlot = rootClass.world.myAvatar.houseitems.length;
            mcItemList.init(rootClass.world.myAvatar.houseitems);
            txtAction.mouseEnabled = false;
            updateGoldCoin();
            onClickShop(null);
        }

        function onCloseClick(_arg1:Event){
            MovieClip(parent).onClose();
        }

        public function refreshDetail():void{
            if (selectedItem == null){
                strInfo.htmlText = "Please select an item to view details.";
                txtAction.visible = false;
                btnAction.visible = false;
                btnPreview.visible = false;
                strCost.text = "";
                mcCoin.visible = (mcUpgrade.visible = false);
            }
            else {
                showItemDetail();
            };
        }

        public function get selectedItem():Object{
            if (bitShop){
                return (mcShopList.selectedItem);
            };
            return (mcItemList.selectedItem);
        }

        public function showItemDetail():void{
            var _local1:Object;
            var _local2:* = "#CC9900";
            if (bitShop){
                _local1 = mcShopList.selectedItem;
                strInfo.htmlText = rootClass.getItemInfoString(_local1);
                if ((((((_local1.bCoins == 0)) && ((_local1.iCost > rootClass.world.myAvatar.objData.intGold)))) || ((((_local1.bCoins == 1)) && ((_local1.iCost > rootClass.world.myAvatar.objData.intCoins)))))){
                    _local2 = "#CC0000";
                };
                if (_local1.bCoins == 0){
                    strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Number(_local1.iCost)) + " Gold</b></font>");
                }
                else {
                    strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Number(_local1.iCost)) + " RCs</b></font>");
                };
                txtAction.text = "Buy";
                btnPreview.visible = true;
            }
            else {
                _local1 = mcItemList.selectedItem;
                strInfo.htmlText = rootClass.getItemInfoString(_local1);
                if (_local1.bCoins == 0){
                    if (rootClass.world.myAvatar.objData.intGold > 2000000){
                        strCost.htmlText = (("<font size='14' color='" + _local2) + "'><b>0 Gold</b></font>");
                    }
                    else {
                        strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Math.ceil((_local1.iCost / 4))) + " Gold</b></font>");
                    };
                }
                else {
                    if (_local1.iHrs < 24){
                        strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Math.ceil(((_local1.iCost * 9) / 10))) + " RCs</b></font>");
                    }
                    else {
                        strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Math.ceil((_local1.iCost / 4))) + " RCs</b></font>");
                    };
                };
                txtAction.text = "Sell";
                btnPreview.visible = false;
            };
            txtAction.visible = true;
            btnAction.visible = true;
            mcCoin.visible = (_local1.bCoins == 1);
            mcUpgrade.visible = (_local1.bUpg == 1);
        }

        public function updateGoldCoin():void{
            strGold.text = rootClass.world.myAvatar.objData.intGold;
            strCoins.text = rootClass.world.myAvatar.objData.intCoins;
        }

        function onClickShop(_arg1:Event){
            tabShop.select();
            tabInv.unselect();
            mcShopList.visible = true;
            mcItemList.visible = false;
            txtTitle.text = "Shop";
            bitShop = true;
            refreshDetail();
        }

        function onClickInv(_arg1:Event){
            tabShop.unselect();
            tabInv.select();
            mcShopList.visible = false;
            mcItemList.visible = true;
            txtTitle.text = "Inventory";
            bitShop = false;
            refreshDetail();
        }

        public function onActionClick(_arg1:Event){
            if (bitShop){
                onBuyClick();
            }
            else {
                onSellClick();
            };
        }

        public function onBuyClick():void{
            var _local1:*;
            var _local2:*;
            var _local3:*;
            if ((((((rootClass.world.shopinfo.bStaff == 1)) || ((mcShopList.selectedItem.bStaff == 1)))) && ((rootClass.world.myAvatar.objData.intAccessLevel < 40)))){
                rootClass.MsgBox.notify("Test Item.. cannot be purchased yet!");
            }
            else {
                if (((!((rootClass.world.shopinfo.sField == ""))) && (!((rootClass.world.getAchievement(rootClass.world.shopinfo.sField, rootClass.world.shopinfo.iIndex) == 1))))){
                    rootClass.MsgBox.notify("Item requires special requirement!");
                }
                else {
                    if ((((mcShopList.selectedItem.bUpg == 1)) && (!(rootClass.world.myAvatar.isUpgraded())))){
                        rootClass.showUpgradeWindow();
                    }
                    else {
                        if ((((mcShopList.selectedItem.FactionID > 1)) && ((rootClass.world.myAvatar.getRep(mcShopList.selectedItem.FactionID) < mcShopList.selectedItem.iReqRep)))){
                            rootClass.MsgBox.notify("Item Locked: Reputation Requirement not met.");
                        }
                        else {
                            if ((((mcShopList.selectedItem.iClass > 0)) && ((rootClass.world.myAvatar.getCPByID(mcShopList.selectedItem.iClass) < mcShopList.selectedItem.iReqCP)))){
                                rootClass.MsgBox.notify("Item Locked: Class Requirement not met.");
                            }
                            else {
                                if (((((rootClass.world.myAvatar.isItemInInventory(mcShopList.selectedItem.ItemID)) || (rootClass.world.myAvatar.isItemInBank(mcShopList.selectedItem.ItemID)))) && (rootClass.world.myAvatar.isItemStackMaxed(mcShopList.selectedItem.ItemID)))){
                                    _local1 = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
                                    rootClass.MsgBox.notify((("You cannot have more than " + _local1[mcShopList.selectedItem.iStk]) + " of that item!"));
                                }
                                else {
                                    if ((((((mcShopList.selectedItem.bCoins == 0)) && ((mcShopList.selectedItem.iCost > rootClass.world.myAvatar.objData.intGold)))) || ((((mcShopList.selectedItem.bCoins == 1)) && ((mcShopList.selectedItem.iCost > rootClass.world.myAvatar.objData.intCoins)))))){
                                        rootClass.MsgBox.notify("Insufficient Funds!");
                                    }
                                    else {
                                        if (rootClass.world.myAvatar.houseitems.length >= rootClass.world.myAvatar.objData.iHouseSlots){
                                            rootClass.MsgBox.notify("House Inventory Full!");
                                        }
                                        else {
                                            _local2 = new ModalMC();
                                            _local3 = {};
                                            _local3.strBody = (('Are you sure you want to buy "' + mcShopList.selectedItem.sName) + '"?');
                                            _local3.params = {};
                                            _local3.params.item = mcShopList.selectedItem;
                                            _local3.callback = buyRequest;
                                            rootClass.ui.ModalStack.addChild(_local2);
                                            _local2.init(_local3);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function buyRequest(_arg1):void{
            if (_arg1.accept){
                rootClass.world.sendBuyItemRequest(_arg1.item);
            };
        }

        public function onSellClick():void{
            var _local1:*;
            var _local2:*;
            if (mcItemList.selectedItem.bEquip == 1){
                rootClass.MsgBox.notify("Item is currently equipped!");
            }
            else {
                if (mcItemList.selectedItem.bTemp == 0){
                    _local1 = new ModalMC();
                    _local2 = {};
                    _local2.strBody = (('Are you sure you want to sell "' + mcItemList.selectedItem.sName) + '"?');
                    _local2.params = {};
                    _local2.params.item = mcItemList.selectedItem;
                    _local2.callback = sellRequest;
                    rootClass.ui.ModalStack.addChild(_local1);
                    _local1.init(_local2);
                };
            };
        }

        public function sellRequest(_arg1):void{
            if (_arg1.accept){
                rootClass.world.sendSellItemRequest(_arg1.item);
            };
        }

        public function onPreviewClick(_arg1:Event){
            var _local3:*;
            var _local2:* = mcShopList.selectedItem;
            if ((((((_local2.sType == "Floor Item")) || ((_local2.sType == "Wall Item")))) || ((_local2.sType == "House")))){
                _local3 = rootClass.attachOnModalStack("ItemPreview");
                _local3.loadItem(_local2);
            };
        }

        public function reset():void{
            mcItemList.inventorySlot = rootClass.world.myAvatar.houseitems.length;
            mcItemList.init(rootClass.world.myAvatar.houseitems);
            updateGoldCoin();
        }


    }
}//package 

