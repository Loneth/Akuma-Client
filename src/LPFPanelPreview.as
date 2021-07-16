// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanelPreview

package {
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFPanelPreview extends LPFPanel {

        public function LPFPanelPreview():void{
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
            } else {
                _local4 = fParent.numChildren;
                if (_local4 > 1){
                    y = ((fParent.getChildAt((_local4 - 2)).y + fParent.getChildAt((_local4 - 2)).height) + 10);
                } else {
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
            if (("xBuffer" in _arg1)){
                xBuffer = _arg1.xBuffer;
            };
            var _local3:Object = {};
            _local3 = {};
            _local3.frame = new LPFFrameBackdrop();
            _local3.fData = null;
            _local3.r = {
                x:14,
                y:36,
                w:(w - 26),
                h:204
            };
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameBackdrop();
            _local3.fData = null;
            _local3.r = {
                x:14,
                y:244,
                w:(w - 26),
                h:121
            };
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameItemPreview();
            _local3.fData = null;
            _local3.r = {
                x:18,
                y:40,
                w:(w - 20),
                h:-1
            };
			if (("isEquip" in _arg1)){
                _local3.isEquip = _arg1.isEquip;
            };
            if (("isShow" in _arg1)){
                _local3.isShow = _arg1.isShow;
            };
            _local3.eventTypes = ["listItemASel", "listItemBSel", "refreshItems", "clickPreview"];
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameEnhText();
            _local3.fData = null;
            _local3.r = {
                x:18,
                y:245,
                w:(w - 20),
                h:-1
            };
            _local3.eventTypes = ["listItemASel", "listItemBSel", "refreshItems", "clickPreview"];
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameCostDisplay();
            _local3.fData = null;
            _local3.r = {
                x:int((173 + (96 / 2))),
                y:-66,
                w:-1,
                h:-1,
                xPosRule:"centerOnX"
            };
            _local3.eventTypes = ["listItemASel"];
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameGenericButton();
            _local3.fData = null;
            _local3.r = {
                x:46,
                y:-40,
                w:-1,
                h:-1
            };
            _local3.eventTypes = ["previewButton1Update"];
            addFrame(_local3);
            _local3 = {};
            _local3.frame = new LPFFrameGenericButton();
            _local3.fData = null;
            _local3.r = {
                x:173,
                y:-40,
                w:-1,
                h:-1
            };
            _local3.eventTypes = ["previewButton2Update"];
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

