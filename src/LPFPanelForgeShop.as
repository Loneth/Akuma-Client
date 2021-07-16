// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanelMergeShop

package {
    import flash.geom.Point;
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFPanelForgeShop extends LPFPanel {

        public function LPFPanelForgeShop():void{
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            var _local6:int;
            fData = _arg1.fData;
            drawBG(LPFPanelBg3);
			bg.tTitle.text = "Forge Shop";
            bg.tPane1.text = "Requirements";
            bg.tPane2.text = "Forge List";
            //bg.tPane3.text = "";
            var _local2:Object = _arg1.r;
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
                x:15,
                y:36,
                w:1,
                h:1
            };
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameBackdrop();
            _local4.fData = null;
            _local4.r = {
                x:15,
                y:244,
                w:1,
                h:1
            };			
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameForgeItemPreview();
            _local4.fData = null;
            _local4.r = {
                x:130,
                y:200,
                w:284,
                h:-1
            };
            _local4.eventTypes = ["listItemASel"];
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameEnhText();
            _local4.fData = null;
            _local4.r = {
                //x:19,
				x:9999,
                y:245,
                w:-1,
                h:-1
            };
            _local4.eventTypes = ["listItemASel"];
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameBackdrop();
            _local4.fData = null;
            _local4.r = {
                x:463,
                y:44,
                w:290,
                h:310
            };
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameGoldDisplay();
            _local4.fData = fData.objData;
            _local4.r = {
                x:494,
                y:335,//320,325
                w:-1,
                h:24,
                centerOn:740,
                shiftAmount:0
            };
            _local4.eventTypes = ["refreshCoins"];
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameSlotDisplay();
            _local4.fData = fData.objData;
            _local4.fData.list = fData.itemsInv;
            _local4.r = {
                x:9999,
                y:-40,
                w:-1,
                h:24
            };
            /*
			_local4.eventTypes = ["refreshItems", "refreshSlots"];
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameGenericButton();
            _local4.fData = {sText:"Add Space"};
            _local4.r = {
                x:(185 + 581),
                y:-38,
                w:-1,
                h:-1
            };
			*/
            _local4.buttonNewEventType = ["buyBagSlots"];
            addFrame(_local4);
            var _local5:int = 50;
            _local4 = {};
            _local4.frame = new LPFFrameListViewTabbed();
            _local4.fData = {list:fData.items};
            _local4.r = {
                x:463,
                y:_local5,
                w:265,
                h:270
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
            _local4.sName = "itemListA";
            _local4.itemEventType = "listItemASel";
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameSimpleText();
            _local4.fData = {msg:"<p align='center'> </p>"};
            _local4.r = {
                x:-1,
                y:71,
                w:200,
                h:-1,
                center:true
            };
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameSimpleList();
            _local4.fData = {msg:"<p align='center'>*Items must be in your backpack to appear.</p>"};
            _local4.r = {
                x:178,
                y:44,
                w:240,
                h:-1
            };
            _local4.eventTypes = ["refreshItems", "listItemASel"];
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameCostDisplay();
            _local4.fData = null;
            _local4.r = {
                x:610,//450
                y:-40,//-70
                w:-1,
                h:-1
                //xPosRule:"centerOnX"
            };
            _local4.eventTypes = ["listItemASel"];
            addFrame(_local4);
            _local4 = {};
            _local4.frame = new LPFFrameGenericButton();
            _local4.fData = null;
            _local4.r = {
                x:510,//530
                y:-40,
                w:230,
                h:-1 
                //center:true
            };
            _local4.eventTypes = ["previewButton1Update"];
            addFrame(_local4);
            bg.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            if (!((("showDragonLeft" in _arg1)) && ((_arg1.showDragonLeft == true)))){
                bg.dragonLeft.visible = false;
            };
            if (!((("showDragonRight" in _arg1)) && ((_arg1.showDragonRight == true)))){
                bg.dragonRight.visible = false;
            };
        }


    }
}