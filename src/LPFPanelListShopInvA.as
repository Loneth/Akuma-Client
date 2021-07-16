// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanelListShopInvA

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFPanelListShopInvA extends LPFPanel {

        public function LPFPanelListShopInvA():void{
            x = 300;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            var _local7:int;
            fData = _arg1.fData;
            var _local2:Object = _arg1.r;
            x = _local2.x;
            if (_local2.y > -1){
                y = _local2.y;
            }
            else {
                _local7 = fParent.numChildren;
                if (_local7 > 1){
                    y = ((fParent.getChildAt((_local7 - 2)).y + fParent.getChildAt((_local7 - 2)).height) + 10);
                }
                else {
                    y = 10;
                };
            };
            w = _local2.w;
            h = _local2.h;
            xo = x;
            yo = y;
            if (("closeType" in _arg1)){
                closeType = _arg1.closeType;
            };
            if (("hideDir" in _arg1)){
                hideDir = _arg1.hideDir;
            };
            if (("hidePad" in _arg1)){
                hidePad = _arg1.hidePad;
            };
            var _local3:Object = {};
            _local3 = {};
            _local3.frame = new LPFFrameBackdrop();
            _local3.fData = null;
            _local3.r = {
                x:14,
                y:44,
                w:(w - 26),
                h:396
            };
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameGoldDisplay();
            _local3.fData = fData.objData;
            _local3.r = {
                x:-1,
                y:-79,
                w:-1,
                h:24,
                center:true,
                shiftAmount:45 //45
            };
            _local3.eventTypes = ["refreshCoins"];
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameSlotDisplay();
            _local3.fData = fData.objData;
            _local3.fData.list = fData.itemsInv;
            _local3.r = {
                x:32,
                y:-40,
                w:-1,
                h:24
            };
            _local3.eventTypes = ["refreshItems", "refreshSlots"];
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameGenericButton();
            _local3.fData = {sText:"Add Space"};
            _local3.r = {
                x:185,
                y:-38,
                w:-1,
                h:-1
            };
            _local3.buttonNewEventType = ["buyBagSlots"];
            addFrame(_local3);
            var _local4 = 353;
            var _local5:int = 50;
            if (fParent.sMode.indexOf("shop") > -1){
                _local4 = (_local4 - 38);
                _local3 = {};
                _local3.frame = new LPFFrameCheapBuySell();
                _local3.fData = null;
                _local3.eventType = "sModeSet";
                _local3.openOn = "shopBuy";
                _local3.r = {
                    x:20,
                    y:(_local5 + _local4),
                    w:-1,
                    h:-1
                };
                addFrame(_local3);
            };
            _local3 = {};
            _local3.frame = new LPFFrameListViewTabbed();
            var _local6:Object = {
                list:fData.items,
                bLimited:false
            };
            if (("shopinfo" in fData)){
                if (("bLimited" in fData.shopinfo)){
                    _local6.bLimited = fData.shopinfo.bLimited;
                };
            };
            _local3.fData = _local6;
            _local3.r = {
                x:20,
                y:_local5,
                w:265,
                h:_local4
            };
            _local3.tabStates = MovieClip(fParent).getTabStates();
            _local3.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "Egg", "House", "Wall Item", "Floor Item"];
            _local3.filterMap = {
                Weapon:["Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand"],
                ar:["Class", "Armor"],
                he:["Helm"],
                ba:["Cape"],
                pe:["Pet", "Egg"],
                am:["Amulet", "Necklace", "Ring"],
                it:["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                enh:["Refinement"]
            };
            _local3.sName = "itemListA";
            _local3.itemEventType = "listItemASel";
            _local3.eventTypes = ["refreshItems", "sModeSet"];
            addFrame(_local3);
            drawBG();
            bg.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            if (!((("showDragonLeft" in _arg1)) && ((_arg1.showDragonLeft == true)))){
                bg.dragonLeft.visible = false;
            };
            if (!((("showDragonRight" in _arg1)) && ((_arg1.showDragonRight == true)))){
                bg.dragonRight.visible = false;
            };
        }


    }
}//package 

