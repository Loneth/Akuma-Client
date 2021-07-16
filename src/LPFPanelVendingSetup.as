// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanelBank

package {
    import flash.geom.Point;
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFPanelVendingSetup extends LPFPanel {

        public function LPFPanelVendingSetup():void{
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            var _local2:Object;
            var _local6:int;
            fData = _arg1.fData;
            drawBG(LPFPanelBg5);
            bg.tTitle.text = "Vending";
            bg.tPane1.text = "Stall Items";
            bg.tPane2.text = "Item Preview";
            bg.tPane3.text = "Inventory Items";
            _local2 = _arg1.r;
            x = _local2.x;
            if (_local2.y > -1){
                y = _local2.y;
            }
            else {
                _local6 = fParent.numChildren;
                if (_local6 > 1){
                    y = ((fParent.getChildAt((_local6 - 2)).y + fParent.getChildAt((_local6 - 2)).height) + 10);
                }
                else {
                    y = 10;
                };
            };
            var _local3:Point = new Point(0, 0);
            _local3 = bg.localToGlobal(_local3);
            bg.y = (bg.y - int((_local2.y - _local3.y)));
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
            if (("xBuffer" in _arg1)){
                xBuffer = _arg1.xBuffer;
            };
            if (("isOpen" in _arg1)){
                isOpen = _arg1.isOpen;
            };
            var _local4:Object = {};
			_local4.eventTypes = ["refreshItems", "refreshBank", "refreshSlots"];
            _local4.isBank = true;
            _local4 = {};
            _local4.frame = new LPFFrameBackdrop();
            _local4.fData = null;
            _local4.r = {
                x:(14 + 1),
                y:40,
                w:290,
                h:310
            };
            addFrame(_local4);
            var _local5:int = 46;
            _local4 = {};
            _local4.frame = new LPFFrameListViewTabbed();
            _local4.fData = {list:fData.itemsV};
            _local4.r = {
                x:(20 + 1),
                y:_local5,
                w:265,
                h:270//304
            };
            //_local4.tabStates = MovieClip(fParent).getTabStates(null, ["*"]);
			_local4.tabStates = MovieClip(fParent).getTabStates();
            _local4.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "Egg", "House", "Wall Item", "Floor Item"];
            _local4.filterMap = {
				All:["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "Egg", "House", "Wall Item", "Floor Item"],
                Weapon:["Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand"],
                ar:["Class", "Armor"],
                he:["Helm"],
                ba:["Cape"],
                pe:["Pet", "Egg"],
                am:["Amulet", "Necklace", "Ring"],
                it:["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                enh:["Refinement"]
            };
            _local4.sName = "bank";
            _local4.itemEventType = "vendingSel";
            _local4.tabEventType = "categorySelVending";
            _local4.eventTypes = ["refreshItems", "refreshBank", "categorySelVending"];
            _local4.onDemand = true;
            //_local4.openBlank = true;
            _local4.allowDesel = true;
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameBackdrop();
            _local4.fData = null;
            _local4.r = {
                x:(14 + 581),
                y:40,
                w:290,
                h:310
            };
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameGoldDisplay();
            _local4.fData = fData.objData;
            _local4.r = {
                x:-1,
                y:-70,
                w:-1,
                h:24,
                center:true,
                centerOn:750,
                shiftAmount:50
            };
            _local4.eventTypes = ["refreshCoins"];
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameSlotDisplay();
            _local4.fData = fData.objData;
            _local4.fData.list = fData.itemsI;
            _local4.r = {
                x:(32 + 596),
                y:-40,
                w:-1,
                h:24
            };
            _local4.eventTypes = ["refreshItems", "refreshSlots"];
			addFrame(_local4);
			_local4 = {};
            _local4.frame = new LPFFrameItemPreview();
            _local4.fData = null;
            _local4.r = {
                x:310,
                y:50,//40
                w:284,
                h:-1
            };
            _local4.eventTypes = ["vendingSel", "inventorySel"];
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameGenericButton();
            _local4.fData = {sText:"Add Space"};
            _local4.r = {
                x:(185 + 596),
                y:-38,
                w:-1,
                h:-1
            };
            _local4.buttonNewEventType = ["buyBagSlots"];
            addFrame(_local4);
            _local5 = 46;
            _local4 = {};
            _local4.frame = new LPFFrameListViewTabbed();
            _local4.fData = {list:fData.itemsI};
            _local4.r = {
                x:(20 + 600),
                y:_local5,
                w:265,
                h:270
            };
            _local4.tabStates = MovieClip(fParent).getTabStates();
            _local4.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "House", "Wall Item", "Floor Item"];
            _local4.filterMap = {
				All:["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "House", "Wall Item", "Floor Item"],
                Weapon:["Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand"],
                ar:["Class", "Armor"],
                he:["Helm"],
                ba:["Cape"],
                pe:["Pet"],
                am:["Amulet", "Necklace", "Ring"],
                it:["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                enh:["Refinement"]
            };
            _local4.sName = "inventory";
            _local4.itemEventType = "inventorySel";
            _local4.eventTypes = ["refreshItems", "refreshInventory"];
            _local4.allowDesel = true;
            _local4.refreshTabs = true;
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameSimpleText();
            _local4.fData = {msg:"<p align='center'></p>"};
            _local4.r = {
                x:-1,
                y:42,
                w:200,
                h:-1,
                center:true
            };
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameGenericButton();
            _local4.fData = null;
            _local4.r = {
				x:-1,
                y:-30,//-170
                w:-1,
                h:-1,
                center:true
            };
            _local4.eventTypes = ["previewButton1Update"];
			addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameGenericButton();
            _local4.fData = {sText:"Vend"};
			_local4.buttonNewEventType = "sendVendingFromInvRequest";
			_local4.sMode = "red";
            _local4.r = {
                x:(90 + 10),
                y:-30,
                w:-1,
                h:-1
            };
            _local4.buttonNewEventType = ["toVending"];
			addFrame(_local4);
			_local4 = {};
            _local4.frame = new LPFFrameStoredVendingGoldDisplay();
            _local4.fData = fData.objData.vendings;
            _local4.r = {
                x:-1,
                y:-70,
                w:-1,
                h:24,
                center:true,
                centerOn:150,
                shiftAmount:50
            };
            _local4.eventTypes = ["refreshCoins"];
            addFrame(_local4);
            bg.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            if (!((("showDragonLeft" in _arg1)) && ((_arg1.showDragonLeft == true)))){
                bg.dragonLeft.visible = true;
            };
            if (!((("showDragonRight" in _arg1)) && ((_arg1.showDragonRight == true)))){
                bg.dragonRight.visible = true;
            };
        }


    }
}//package 

