// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanelListShopInvB

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFPanelListShopInvB extends LPFPanel {

        public function LPFPanelListShopInvB():void{
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            var _local4:int;
            fData = _arg1.fData;
            var _local2:Object = _arg1.r;
            x = _local2.x;
            if (_local2.y > -1){
                y = _local2.y;
            }
            else {
                _local4 = fParent.numChildren;
                if (_local4 > 1){
                    y = ((fParent.getChildAt((_local4 - 2)).y + fParent.getChildAt((_local4 - 2)).height) + 10);
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
                h:271
            };
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameBackdrop();
            _local3.fData = null;
            _local3.r = {
                x:14,
                y:320,
                w:(w - 26),
                h:121
            };
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameListViewTabbed();
            _local3.fData = {list:fData.items};
            _local3.r = {
                x:20,
                y:50,
                w:265,
                h:258
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
            _local3.sName = "itemListB";
            _local3.itemEventType = "listItemBSel";
            _local3.eventTypes = ["listItemASel", "refreshItems"];
            _local3.filter = "sES";
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameEnhText();
            _local3.fData = null;
            _local3.r = {
                x:18,
                y:321,
                w:(w - 20),
                h:-1
            };
            _local3.eventTypes = ["listItemBSolo", "showItemListB", "refreshItems"];
            addFrame(_local3);
			_local3 = {};
            _local3.frame = new LPFFrameItemPotential();
			_local3.fData = null;
            _local3.r = {
                x:300,
                y:470,
                w:350,
                h:-1
            };
			_local3.eventTypes = ["listItemBSolo", "showItemListB", "refreshItems"];
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

        override public function fHide():void{
            var _local1:MovieClip;
            isOpen = false;
            visible = false;
            switch (hideDir.toLowerCase()){
                case "left":
                    x = ((xo - w) - hidePad);
                    break;
                case "right":
                    x = ((xo + w) + hidePad);
                    break;
                case "top":
                    y = ((yo - h) - hidePad);
                    break;
                case "bottom":
                    y = ((yo + h) + hidePad);
                    break;
                case "":
            };
            var _local2:int;
            _local2 = 0;
            while (_local2 < numChildren) {
                try {
                    _local1 = MovieClip(getChildAt(_local2));
                    _local1.notify({eventType:"clearState"});
                }
                catch(e:Error) {
                };
                _local2++;
            };
        }


    }
}//package 

