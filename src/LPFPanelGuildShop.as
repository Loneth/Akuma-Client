// Decompiled by AS3 Sorcerer 2.99
// http://www.as3sorcerer.com/

//LPFPanelGuildShop

package {
    import flash.geom.Point;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.geom.*;

    public class LPFPanelGuildShop extends LPFPanel {

        public function LPFPanelGuildShop():void{
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }
        override public function fOpen(_arg_1:Object):void{
            var _local_2:int;
            var _local_3:Object;
            fData = _arg_1.fData;
            drawBG(LPFPanelBg7);
            bg.tTitle.text = "Guild Shop";
            bg.tPane1.text = "Requirements";
            bg.tPane2.text = "Item List";
            _local_3 = _arg_1.r;
            x = _local_3.x;
            if (_local_3.y > -1){
                y = _local_3.y;
            } else {
                _local_2 = fParent.numChildren;
                if (_local_2 > 1){
                    y = ((fParent.getChildAt((_local_2 - 2)).y + fParent.getChildAt((_local_2 - 2)).height) + 10);
                } else {
                    y = 10;
                };
            };
            var _local_4:Point = new Point(0, 0);
            _local_4 = bg.localToGlobal(_local_4);
            bg.y = (bg.y - int((_local_3.y - _local_4.y)));
            w = _local_3.w;
            h = _local_3.h;
            xo = x;
            yo = y;
            if (("closeType" in _arg_1)){
                closeType = _arg_1.closeType;
            };
            if (("hideDir" in _arg_1)){
                hideDir = _arg_1.hideDir;
            };
            if (("hidePad" in _arg_1)){
                hidePad = _arg_1.hidePad;
            };
            if (("xBuffer" in _arg_1)){
                xBuffer = _arg_1.xBuffer;
            };
            if (("isOpen" in _arg_1)){
                isOpen = _arg_1.isOpen;
            };
            var _local_5:Object = {};
            _local_5 = {};
            _local_5.frame = new LPFFrameBackdrop();
            _local_5.fData = null;
            _local_5.r = {
                "x":15,
                "y":36,
                "w":1,
                "h":1
            };
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameBackdrop();
            _local_5.fData = null;
            _local_5.r = {
                "x":143,
                "y":44,
                "w":290,
                "h":230
            };
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameItemPreview();
            _local_5.fData = null;
            _local_5.r = {
                "x":143,
                "y":55,
                "w":290,
                "h":68
            };
            _local_5.eventTypes = ["listItemASel"];
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameEnhText();
            _local_5.fData = null;
            _local_5.r = {
                "x":9999,
                "y":245,
                "w":-1,
                "h":-1
            };
            _local_5.eventTypes = ["listItemASel"];
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameBackdrop();
            _local_5.fData = null;
            _local_5.r = {
                "x":463,
                "y":44,
                "w":290,
                "h":310//310
            };
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameGoldDisplay();
            _local_5.fData = fData.objData;
            _local_5.r = {
                "x":494,
                "y":335,
                "w":-1,
                "h":24,
                "centerOn":740,
                "shiftAmount":0
            };
            _local_5.eventTypes = ["refreshCoins"];
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameSlotDisplay();
            _local_5.fData = fData.objData;
            _local_5.fData.list = fData.itemsInv;
            _local_5.r = {
                "x":9999,
                "y":-40,
                "w":-1,
                "h":24
            };
            _local_5.buttonNewEventType = ["buyBagSlots"];
            addFrame(_local_5);
            var _local_6:int = 50;
            _local_5 = {};
            _local_5.frame = new LPFFrameListViewTabbed();
            _local_5.fData = {"list":fData.items};
            _local_5.r = {
                "x":463,
                "y":_local_6,
                "w":265,
                "h":270
            };
            _local_5.tabStates = MovieClip(fParent).getTabStates();
            _local_5.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "Egg", "House", "Wall Item", "Floor Item"];
            _local_5.filterMap = {
                Weapon:["Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand"],
                ar:["Class", "Armor"],
                he:["Helm"],
                ba:["Cape"],
                pe:["Pet", "Egg"],
                am:["Amulet", "Necklace", "Ring"],
                it:["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                enh:["Refinement"]
            };
            _local_5.sName = "itemListA";
            _local_5.itemEventType = "listItemASel";
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameSimpleText();
            _local_5.fData = {"msg":"<p align='center'> </p>"};
            _local_5.r = {
                "x":100,
                "y":71,
                "w":200,
                "h":-1,
                "center":true
            };
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameSimpleList();
            _local_5.fData = {"msg":"<p align='center'>*Items must be in your backpack to appear.</p>"};
            _local_5.r = {
                "x":178,
                "y":330,//44
                "w":240,
                "h":-1
            };
            _local_5.eventTypes = ["refreshItems", "listItemASel"];
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameCostDisplay();
            _local_5.fData = null;
            _local_5.r = {
                "x":610,
                "y":-40,
                "w":-1,
                "h":-1
            };
            _local_5.eventTypes = ["listItemASel"];
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameGenericButton();
            _local_5.fData = null;
            _local_5.r = {
                "x":510,
                "y":-40,
                "w":230,
                "h":-1
            };
            _local_5.eventTypes = ["previewButton1Update"];
            addFrame(_local_5);
            bg.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            if (!((("showDragonLeft" in _arg_1)) && ((_arg_1.showDragonLeft == true)))){
                bg.dragonLeft.visible = true;
            };
            if (!((("showDragonRight" in _arg_1)) && ((_arg_1.showDragonRight == true)))){
                bg.dragonRight.visible = true;
            };
        }

    }
}//package 

