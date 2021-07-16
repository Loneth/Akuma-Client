// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//GuildShop

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class GuildShop extends MovieClip {

        public var tabInv:MovieClip;
        public var btnPreview:SimpleButton;
        public var strGold:TextField;
        public var strCost:TextField;
        public var mcCoin:MovieClip;
        public var strInfo:TextField;
        public var mcUpgrade:MovieClip;
        public var txtTitle:TextField;
        public var txtAction:TextField;
        public var bg1:MovieClip;
        public var tabShop:MovieClip;
        public var bg2:MovieClip;
        public var btnAction:SimpleButton;
        public var strCoins:TextField;
        private var rootClass;
        private var Parent;
        private var bitShop:Boolean = true;
        private var shopinfo:Object;
        private var mcShopList:GuildItemList;
        private var mcItemList:GuildItemList;
        private var mc;
        private var gInv:Array;
        private var needInit:Boolean = true;

        public function GuildShop(_arg1:MovieClip, _arg2:MovieClip, _arg3:Object, _arg4:Array){
            trace("line 20");
            this.x = 588;
            this.rootClass = _arg1;
            this.Parent = _arg2;
            this.shopinfo = _arg3;
            this.gInv = _arg4;
            this.mcShopList = new GuildItemList(this.rootClass);
            this.mcItemList = new GuildItemList(this.rootClass);
            this.mc = this.addChild((this.mcShopList as MovieClip));
            this.mc.x = 27;
            this.mc.y = 82;
            this.mcShopList.InventorySlot = this.shopinfo.items.length;
            this.mcShopList.init(this.shopinfo.items);
            trace("line 24");
            this.bg1.btnClose.addEventListener(MouseEvent.CLICK, this.onCloseClick, false, 0, true);
            this.btnPreview.addEventListener(MouseEvent.CLICK, this.onPreviewClick, false, 0, true);
            this.btnAction.addEventListener(MouseEvent.CLICK, this.onActionClick, false, 0, true);
            this.tabShop.addEventListener(MouseEvent.CLICK, this.onClickShop, false, 0, true);
            this.tabInv.addEventListener(MouseEvent.CLICK, this.onClickInv, false, 0, true);
            trace("line 30");
            this.txtAction.mouseEnabled = false;
            this.updateGoldCoin();
            this.onClickShop(null);
            trace("line 34");
            this.rootClass.ui.addChild(this);
        }

        public function Destroy():void{
            this.rootClass.ui.removeChild(this);
        }

        public function updateGoldCoin():void{
            this.strGold.text = this.rootClass.world.myAvatar.objData.intGold;
            this.strCoins.text = this.rootClass.world.myAvatar.objData.intCoins;
        }

        public function refreshDetail():void{
            if (this.selectedItem == null){
                this.strInfo.htmlText = "Please select an item to view details.";
                this.txtAction.visible = false;
                this.btnAction.visible = false;
                this.btnPreview.visible = false;
                this.strCost.text = "";
                this.mcCoin.visible = (this.mcUpgrade.visible = false);
            }
            else {
                this.showItemDetail();
            };
        }

        public function reset(_arg1:Array):void{
            this.mcItemList.InventorySlot = _arg1.length;
            this.mcItemList.init(_arg1);
            this.updateGoldCoin();
        }

        public function buyRequest(_arg1):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["buyItem", _arg1.item.ItemID, this.shopinfo.ShopID, _arg1.item.ShopItemID], "str", this.rootClass.world.curRoom);
            };
        }

        public function sellRequest(_arg1):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["sellItem", _arg1.item.ItemID, this.shopinfo.ShopID], "str", this.rootClass.world.curRoom);
            };
        }

        public function showItemDetail():void{
            var _local1:Object;
            var _local2:* = "#CC9900";
            if (this.bitShop){
                _local1 = this.mcShopList.selectedItem;
                this.strInfo.htmlText = this.rootClass.getItemInfoString(_local1);
                if ((((((_local1.bCoins == 0)) && ((_local1.iCost > this.rootClass.world.myAvatar.objData.intGold)))) || ((((_local1.bCoins == 1)) && ((_local1.iCost > this.rootClass.world.myAvatar.objData.intCoins)))))){
                    _local2 = "#CC0000";
                };
                if (_local1.bCoins == 0){
                    this.strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Number(_local1.iCost)) + " Gold</b></font>");
                }
                else {
                    this.strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Number(_local1.iCost)) + " RCs</b></font>");
                };
                this.txtAction.text = "Buy";
                this.btnPreview.visible = true;
            }
            else {
                _local1 = this.mcItemList.selectedItem;
                this.strInfo.htmlText = this.rootClass.getItemInfoString(_local1);
                if (_local1.bCoins == 0){
                    if (this.rootClass.world.myAvatar.objData.intGold > 2000000){
                        this.strCost.htmlText = (("<font size='14' color='" + _local2) + "'><b>0 Gold</b></font>");
                    }
                    else {
                        this.strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Math.ceil((_local1.iCost / 4))) + " Gold</b></font>");
                    };
                }
                else {
                    if (_local1.iHrs < 24){
                        this.strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Math.ceil(((_local1.iCost * 9) / 10))) + " RCs</b></font>");
                    }
                    else {
                        this.strCost.htmlText = (((("<font size='14' color='" + _local2) + "'><b>") + Math.ceil((_local1.iCost / 4))) + " RCs</b></font>");
                    };
                };
                this.txtAction.text = "Sell";
                this.btnPreview.visible = false;
            };
            this.txtAction.visible = true;
            this.btnAction.visible = true;
            this.mcCoin.visible = (_local1.bCoins == 1);
            this.mcUpgrade.visible = (_local1.bUpg == 1);
        }

        private function onCloseClick(_arg1:Event){
            this.Parent.closeShop();
        }

        private function onClickShop(_arg1:Event){
            trace("onClickShop");
            this.tabShop.select();
            this.tabInv.unselect();
            trace("line 145");
            try {
                this.removeChild(this.mcItemList);
                this.mc = this.addChild(this.mcShopList);
                this.mc.x = 27;
                this.mc.y = 82;
            }
            catch(e) {
            };
            this.txtTitle.text = "Shop";
            this.bitShop = true;
            this.refreshDetail();
        }

        private function onClickInv(_arg1:Event){
            trace("line 154");
            this.tabShop.unselect();
            trace("line 156");
            this.tabInv.select();
            trace("line 158");
            this.removeChild(this.mcShopList);
            this.mc = this.addChild(this.mcItemList);
            this.mc.x = 27;
            this.mc.y = 82;
            if (this.needInit){
                this.mcItemList.InventorySlot = this.gInv.length;
                this.mcItemList.init(this.gInv);
                this.needInit = false;
            };
            trace("line 161");
            this.txtTitle.text = "Inventory";
            this.bitShop = false;
            this.refreshDetail();
            trace("line 165");
        }

        public function onActionClick(_arg1:Event){
            if (this.bitShop){
                this.onBuyClick();
            }
            else {
                this.onSellClick();
            };
        }

        public function onBuyClick():void{
            var _local2:*;
            var _local3:*;
            var _local1:* = this.mcShopList.selectedItem;
            if ((((((this.shopinfo.bStaff == 1)) || ((this.mcShopList.selectedItem.bStaff == 1)))) && ((this.rootClass.world.myAvatar.objData.intAccessLevel < 40)))){
                this.rootClass.MsgBox.notify("Test Item.. cannot be purchased yet!");
            }
            else {
                if (((!((this.shopinfo.sField == ""))) && (!((this.rootClass.world.getAchievement(this.shopinfo.sField, this.shopinfo.iIndex) == 1))))){
                    this.rootClass.MsgBox.notify("Item requires special requirement!");
                }
                else {
                    if ((((this.mcShopList.selectedItem.bUpg == 1)) && (!(this.rootClass.world.myAvatar.isUpgraded())))){
                        this.rootClass.showUpgradeWindow();
                    }
                    else {
                        if ((((this.mcShopList.selectedItem.FactionID > 1)) && ((this.rootClass.world.myAvatar.getRep(this.mcShopList.selectedItem.FactionID) < this.mcShopList.selectedItem.iReqRep)))){
                            this.rootClass.MsgBox.notify("Item Locked: Reputation Requirement not met.");
                        }
                        else {
                            if ((((this.mcShopList.selectedItem.iClass > 0)) && ((this.rootClass.world.myAvatar.getCPByID(this.mcShopList.selectedItem.iClass) < this.mcShopList.selectedItem.iReqCP)))){
                                this.rootClass.MsgBox.notify("Item Locked: Class Requirement not met.");
                            }
                            else {
                                if (this.Parent.isItemInInventory(int(_local1.ItemID))){
                                    this.rootClass.MsgBox.notify("You alreayd own this building.");
                                }
                                else {
                                    if ((((((this.mcShopList.selectedItem.bCoins == 0)) && ((this.mcShopList.selectedItem.iCost > this.rootClass.world.myAvatar.objData.intGold)))) || ((((this.mcShopList.selectedItem.bCoins == 1)) && ((this.mcShopList.selectedItem.iCost > this.rootClass.world.myAvatar.objData.intCoins)))))){
                                        this.rootClass.MsgBox.notify("Insufficient Funds!");
                                    }
                                    else {
                                        _local2 = new ModalMC();
                                        _local3 = {};
                                        _local3.strBody = (('Are you sure you want to buy "' + this.mcShopList.selectedItem.sName) + '"?');
                                        _local3.params = {};
                                        _local3.params.item = this.mcShopList.selectedItem;
                                        _local3.callback = this.buyRequest;
                                        this.rootClass.ui.ModalStack.addChild(_local2);
                                        _local2.init(_local3);
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function onSellClick():void{
            var _local1:*;
            var _local2:*;
            if (this.mcItemList.selectedItem.bEquip == 1){
                this.rootClass.MsgBox.notify("Item is currently equipped!");
            }
            else {
                if (this.mcItemList.selectedItem.bTemp == 0){
                    _local1 = new ModalMC();
                    _local2 = {};
                    _local2.strBody = (('Are you sure you want to sell "' + this.mcItemList.selectedItem.sName) + '"?');
                    _local2.params = {};
                    _local2.params.item = this.mcItemList.selectedItem;
                    _local2.callback = this.sellRequest;
                    this.rootClass.ui.ModalStack.addChild(_local1);
                    _local1.init(_local2);
                };
            };
        }

        public function onPreviewClick(_arg1:Event){
            var _local3:*;
            var _local2:* = this.mcShopList.selectedItem;
            if ((((((_local2.sType == "Floor Item")) || ((_local2.sType == "Wall Item")))) || ((_local2.sType == "House")))){
                _local3 = this.rootClass.attachOnModalStack("ItemPreview");
                _local3.loadItem(_local2);
            };
        }

        public function get selectedItem():Object{
            if (this.bitShop){
                return (this.mcShopList.selectedItem);
            };
            return (this.mcItemList.selectedItem);
        }


    }
}//package 

