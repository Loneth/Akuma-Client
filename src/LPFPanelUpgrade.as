// Decompiled by AS3 Sorcerer 3.00
// http://www.as3sorcerer.com/

//LPFPanelUpgrade

package 
{
    import flash.geom.Point;
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.geom.*;

    public class LPFPanelUpgrade extends LPFPanel 
    {

        public function LPFPanelUpgrade():void
        {
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Point;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:int;
            var _local_7:MovieClip;
            _local_7 = MovieClip(stage.getChildAt(0));
            fData = _arg_1.fData;
            drawBG(LPFPanelBg3);
            bg.tTitle.text = "装备强化";
            bg.tPane1.htmlText = "选择装备";
            bg.tPane2.htmlText = "强化操作";
            _local_2 = _arg_1.r;
            x = _local_2.x;
            if (_local_2.y > -1)
            {
                y = _local_2.y;
            }
            else
            {
                _local_6 = fParent.numChildren;
                if (_local_6 > 1)
                {
                    y = ((fParent.getChildAt((_local_6 - 2)).y + fParent.getChildAt((_local_6 - 2)).height) + 10);
                }
                else
                {
                    y = 10;
                };
            };
            _local_3 = new Point(0, 0);
            _local_3 = bg.localToGlobal(_local_3);
            bg.y = (bg.y - int((_local_2.y - _local_3.y)));
            w = _local_2.w;
            h = _local_2.h;
            xo = x;
            yo = y;
            if (("closeType" in _arg_1))
            {
                closeType = _arg_1.closeType;
            };
            if (("hideDir" in _arg_1))
            {
                hideDir = _arg_1.hideDir;
            };
            if (("hidePad" in _arg_1))
            {
                hidePad = _arg_1.hidePad;
            };
            if (("xBuffer" in _arg_1))
            {
                xBuffer = _arg_1.xBuffer;
            };
            if (("isOpen" in _arg_1))
            {
                isOpen = _arg_1.isOpen;
            };
            _local_4 = {};
            _local_4 = {};
            _local_4.frame = new LPFFrameBackdrop();
            _local_4.fData = null;
            _local_4.r = {
                "x":(14 + 1),
                "y":40,
                "w":290,
                "h":310
            };
            addFrame(_local_4);
            _local_5 = 46;
            _local_4 = {};
            _local_4.frame = new LPFFrameListViewTabbed();
            _local_4.fData = {"list":fData.itemsI};
            _local_4.r = {
                "x":(20 + 1),
                "y":_local_5,
                "w":265,
                "h":304
            };
            _local_4.tabStates = MovieClip(fParent).getTabStates();
            _local_4.tabStates = MovieClip(fParent).getTabStates(null, ["enh", "it", "am", "pe", "*"]);
            _local_4.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Refinement", "Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Amulet", "Belt", "Pet", "Egg", "House", "Wall Item", "Floor Item"];
            _local_4.filterMap = {
                Weapon:["Sword", "Axe", "Dagger", "Gun", "Bow", "Mace", "Polearm", "Staff", "Wand"],
                ar:["Class", "Armor"],
                he:["Helm"],
                ba:["Cape"],
                pe:["Pet", "Egg"],
                am:["Amulet", "Necklace", "Ring"],
                it:["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                enh:["Refinement"]
            };
            _local_4.sName = "inventory";
            _local_4.itemEventType = "listItemASel";
            _local_4.eventTypes = ["refreshItems", "refreshUpgrade"];
            _local_4.allowDesel = true;
            _local_4.refreshTabs = true;
            _local_4.bNoSynthesis = true;
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameGoldDisplay();
            _local_4.fData = fData.objData;
            _local_4.r = {
                "x":370,
                "y":-40,
                "w":-1,
                "h":24
            };
            _local_4.eventTypes = ["refreshCoins"];
            addFrame(_local_4);
            _local_4.frame = new LPFFrameBackdrop();
            _local_4.fData = null;
            _local_4.r = {
                "x":326,
                "y":45,
                "w":290,
                "h":120
            };
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameSimpleText();
            _local_4.fData = {"msg":"<font color='#666666' size='16'>强化装备</font>"};
            _local_4.r = {
                "x":336,
                "y":50,
                "w":290,
                "h":-1
            };
			/*
            _local_4.eventTypes = ["listItemASel", "refreshItems"];
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameItemPreviewMini();
            _local_4.fData = null;
            _local_4.r = {
                "x":353,
                "y":55,
                "w":280,
                "h":-1
            };
			*/
            _local_4.eventTypes = ["listItemASel", "refreshItems"];
            addFrame(_local_4);
            _local_4.frame = new LPFFrameBackdrop();
            _local_4.fData = null;
            _local_4.r = {
                "x":326,
                "y":175,
                "w":290,
                "h":68
            };
			/*
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameProbabilityText();
            _local_4.fData = {"pro":"<p align='center'><font color='#FFFF00' size='16'>← 请选择强化装备</font></p>"};
            _local_4.eventTypes = ["listItemASel", "synthesisSel", "refreshItems"];
            _local_4.r = {
                "x":326,
                "y":180,
                "w":290,
                "h":-1
            };
			*/
			/*
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameCostDisplay();
            _local_4.fData = null;
            _local_4.r = {
                "x":430,
                "y":-165,
                "w":-1,
                "h":-1
            };
			*/
            _local_4.eventTypes = ["listItemASel", "listItemBSel", "refreshItems", "refreshUpgrade"];
            _local_4.iBCost = 800;
            _local_4.strType = "Upgrade";
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameGenericButton();
            _local_4.fData = null;
            _local_4.r = {
                "x":370,
                "y":-110,
                "w":-1,
                "h":-1
            };
            _local_4.eventTypes = ["previewButton1Update"];
            addFrame(_local_4);
            if (_local_7.world.myAvatar.objData.iUpg > 0)
            {
                _local_4 = {};
                _local_4.frame = new LPFFrameCostDisplay();
                _local_4.fData = null;
                _local_4.r = {
                    "x":496,
                    "y":-140,
                    "w":-1,
                    "h":-1
                };
                _local_4.eventTypes = ["listItemASel", "listItemBSel", "refreshItems", "refreshUpgrade"];
                _local_4.bCoins = true;
                _local_4.iBCost = 10;
                _local_4.strType = "Upgrade";
                addFrame(_local_4);
            };
            _local_4 = {};
            _local_4.frame = new LPFFrameGenericButton();
            _local_4.fData = null;
            _local_4.r = {
                "x":490,
                "y":-110,
                "w":-1,
                "h":-1
            };
            _local_4.eventTypes = ["previewButton2Update"];
            addFrame(_local_4);
            bg.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            if (!((("showDragonLeft" in _arg_1)) && ((_arg_1.showDragonLeft == true))))
            {
                bg.dragonLeft.visible = false;
            };
            if (!((("showDragonRight" in _arg_1)) && ((_arg_1.showDragonRight == true))))
            {
                bg.dragonRight.visible = false;
            };
        }


    }
}//package 

