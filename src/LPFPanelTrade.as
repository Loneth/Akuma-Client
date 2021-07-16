// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanelBank

package {
    import flash.geom.Point;
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFPanelTrade extends LPFPanel {
	    
		//public var splitPanel:MovieClip;
        //public var previewPanel:MovieClip;
		public var rootClass:* = MovieClip(Game.root);
		
        public function LPFPanelTrade():void{
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            var _local2:Object;
            var _local6:int;
            fData = _arg1.fData;
            drawBG(LPFPanelBg4);
            bg.tTitle.text = "Trade";
            bg.tPane1.text = "Your Inventory";
            bg.tPane2.text = "Your Offers";
            bg.tPane3.text = "Their Offers";
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
            _local4 = {};
            _local4.frame = new LPFFrameBackdrop();
            _local4.fData = null;
            _local4.r = {
                x:(14 + 350),
                y:40,
                w:1,
                h:1
            };
			//Bank
            addFrame(_local4);
            var _local5:int = 53;
            _local4 = {};
            _local4.frame = new LPFFrameListViewTabbed();
            _local4.fData = {list:fData.itemsB};
            _local4.r = {
				x:(20 + 340),
                y:_local5,
                w:265,
                h:206
            };
			_local4.tabStates = MovieClip(fParent).getTabStates();
            _local4.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "Egg", "House", "Wall Item", "Floor Item"];
            _local4.filterMap = {
                Weapon:["Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand"],
                ar:["Class", "Armor"],
                he:["Helm"],
                ba:["Cape"],
                pe:["Pet", "Egg"],
                am:["Amulet", "Necklace", "Ring"],
                it:["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                enh:["Refinement"]
            };
            _local4.sName = "offer";
            _local4.itemEventType = "offerSel";
            _local4.tabEventType = "categorySelMyOffer";
            _local4.eventTypes = ["refreshItems", "refreshBank", "categorySelMyOffer"];
            _local4.onDemand = true;
            _local4.openBlank = false;
            _local4.allowDesel = true;
			rootClass.tradeItem1 = _local4.frame;
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameSlotDisplay();
            _local4.fData = {};
            _local4.fData.avatar = fData.avatar;
			_local4.visible = false;
            _local4.r = {
                x:96,
                y:-40,
                w:-1,
                h:24
            };
			_local4 = {};
            _local4.frame = new LPFFrameBackdrop();
            _local4.fData = null;
            _local4.r = {
                x:(14 + 581),
                y:230,
                w:1,
                h:1
            };
            addFrame(_local4);
            var _local52 = 53;
            _local4 = {};
            _local4.frame = new LPFFrameListViewTabbed();
            _local4.fData = {list:fData.itemsC};
            _local4.r = {
                x:(20 + 670),
                y:_local52,
                w:265,
                h:210
            };
            _local4.tabStates = MovieClip(fParent).getTabStates();
            _local4.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "Egg", "House", "Wall Item", "Floor Item"];
            _local4.filterMap = {
                Weapon:["Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand"],
                ar:["Class", "Armor"],
                he:["Helm"],
                ba:["Cape"],
                pe:["Pet", "Egg"],
                am:["Amulet", "Necklace", "Ring"],
                it:["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                enh:["Refinement"]
            };
            _local4.sName = "their";
            _local4.itemEventType = "";
            _local4.tabEventType = "refreshItems";
            _local4.eventTypes = ["refreshItems", "refreshBank"];
            _local4.onDemand = true;
            _local4.openBlank = false;
            _local4.allowDesel = true;
			rootClass.tradeItem2 = _local4.frame;
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameSlotDisplay();
            _local4.fData = {};
            _local4.fData.avatar = fData.avatar;
			_local4.visible = false;
            _local4.r = {
                x:1000,
                y:-5000,
                w:-1,
                h:24
            };
            _local4.eventTypes = ["refreshItems", "refreshBank", "refreshSlots"];
            _local4.isBank = true;
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameBackdrop();
            _local4.fData = null;
            _local4.r = {
                x:(14 + 1),
                y:48,
                w:1,
                h:1
            };
            _local4.buttonNewEventType = ["buyBagSlots"];
            addFrame(_local4);
            _local5 = 58;//46;
            _local4 = {};
            _local4.frame = new LPFFrameListViewTabbed();
            _local4.fData = {list:fData.itemsI};
            _local4.r = {
                x:(20 + 1),
                y:_local5,
                w:265,
                h:304
            };
            _local4.tabStates = MovieClip(fParent).getTabStates();
            _local4.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "Egg", "House", "Wall Item", "Floor Item"];
            _local4.filterMap = {
                Weapon:["Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand"],
                ar:["Class", "Armor"],
                he:["Helm"],
                ba:["Cape"],
                pe:["Pet", "Egg"],
                am:["Amulet", "Necklace", "Ring"],
                it:["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                enh:["Refinement"]
            };
            _local4.sName = "inventory";
            _local4.itemEventType = "inventorySel";
            _local4.eventTypes = ["refreshItems", "refreshInventory"];
            _local4.openBlank = false;
            _local4.allowDesel = true;
			rootClass.tradeItem3 = _local4.frame;
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameSimpleText();
            _local4.fData = {msg:""};
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
                x:(14 + 95),
                y:-25,
                w:200,
                h:-1//,
            };
            _local4.eventTypes = ["previewButton1Update"];
            addFrame(_local4);
			_local4 = {};
            _local4.frame = new LPFFrameTradeItemPreview();
            _local4.fData = null;
            _local4.r = {
                x:130,
                y:200,
                w:284,
                h:-1
            };
            _local4.eventTypes = ["offerSel", "otherSel", "inventorySel"];
			addFrame(_local4);
			//mcPreview = _local4.frame;
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

