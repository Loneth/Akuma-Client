// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanelBank

package {
    import flash.geom.Point;
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFPanelAuction extends LPFPanel {
		public var rootClass:* = MovieClip(Game.root);
		
        public function LPFPanelAuction():void{
			//addFrameScript(0, frame1, 2, frame3);
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            var _local2:Object;
            var _local6:int;
            fData = _arg1.fData;
            drawBG(LPFPanelBg6);
            bg.tTitle.text = "Auction";
            bg.tPane1.text = "Market List";
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
                w:1,//290,
                h:1//320
            };
            _local4.buttonNewEventType = ["buyBagSlots"];
            addFrame(_local4);
            _local5 = 73;//46;

			
            _local4 = {};
            _local4.frame = new LPFFrameAuctionListViewTabbed();
            _local4.fData = {list:fData.itemsI};
            _local4.r = {
                x:(0 + 295),
                y:_local5,
                w:630,
                h:257
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
            _local4.sName = "auctionBuy";
            _local4.itemEventType = "auctionSel";
            _local4.tabEventType = "categorySelAuction";
            _local4.eventTypes = ["refreshItems", "refreshBank", "categorySelAuction"];
            _local4.onDemand = true;
            _local4.openBlank = true;
            _local4.allowDesel = false;
            addFrame(_local4);
			rootClass.auctionItem1 = _local4.frame;
            _local4 = {};
            _local4.frame = new LPFFrameAuctionInventoryListViewTabbed();
            _local4.fData = {list:fData.itemsB};
            _local4.r = {
                x:(0 + 295),//x:(20 + 315),
                y:_local5,
                w:630,
                h:257
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
            _local4.sName = "auctionSell";
            _local4.itemEventType = "inventorySel";
            _local4.eventTypes = ["refreshItems", "refreshInventory"];
            _local4.openBlank = false;
            _local4.allowDesel = false;
            addFrame(_local4);
			rootClass.auctionItem2 = _local4.frame;

            _local4 = {};
            _local4.frame = new LPFFrameAuctionListViewTabbed();
            _local4.fData = {list:fData.itemsC};
            _local4.r = {
                x:(0 + 295),
                y:_local5,
                w:630,
                h:257
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
            _local4.sName = "auctionRetrieve";
            _local4.itemEventType = "retrieveSel";
            _local4.tabEventType = "categorySelRetrieve";
            _local4.eventTypes = ["refreshItems", "refreshBank", "categorySelRetrieve"];
            _local4.onDemand = false;
            _local4.openBlank = false;
            _local4.allowDesel = false;
            addFrame(_local4);
			rootClass.auctionItem3 = _local4.frame;
			
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
                x:(0 + 95),//14
                y:-33,
                w:200,
                h:-1//,
                //center:true
            };
            _local4.eventTypes = ["previewButton1Update"];
            addFrame(_local4);
			
            _local4 = {};
            _local4.frame = new LPFFrameAuctionItemPreview();
            _local4.fData = null;
            _local4.r = {
                x:0,
                y:110,
                w:284,
                h:-1
            };
            _local4.eventTypes = ["inventorySel", "retrieveSel", "auctionSel"];
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
