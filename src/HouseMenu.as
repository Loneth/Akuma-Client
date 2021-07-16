// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//HouseMenu

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.filters.GlowFilter;
    import flash.text.*;

    public class HouseMenu extends MovieClip {

        public var preview:MovieClip;
        public var fxmask:MovieClip;
        public var btnClose:SimpleButton;
        public var tTitle:MovieClip;
        public var bg:MovieClip;
        public var iListA:MovieClip;
        public var iListB:MovieClip;
        public var hit:MovieClip;
        public var world:MovieClip;
        public var rootClass:MovieClip;
        public var CHARS:MovieClip;
        public var fData:Object = null;
        var mDown:Boolean = false;
        var hRun:int = 0;
        var dRun:int = 0;
        var mbY:int = 0;
        var mhY:int = 0;
        var mbD:int = 0;
        var ox:int = 0;
        var oy:int = 0;
        var mox:int = 0;
        var moy:int = 0;
        var scrTgt:MovieClip;

        public function HouseMenu():void{
            var _local1:MovieClip = (this as MovieClip);
            _local1.tTitle.mouseEnabled = false;
            _local1.preview.tPreview.mouseEnabled = false;
            _local1.hit.alpha = 0;
            _local1.hit.buttonMode = true;
        }

        public function fOpen(_arg1:String):void{
            var _local2:MovieClip;
            rootClass = (stage.getChildAt(0) as MovieClip);
            world = (rootClass.world as MovieClip);
            CHARS = (rootClass.world.CHARS as MovieClip);
            _local2 = MovieClip(this.parent).mcHouseItemHandle;
            _local2.visible = false;
            _local2.x = 1000;
            _local2.addEventListener(Event.ENTER_FRAME, onHandleEnterFrame, false, 0, true);
            _local2.bCancel.addEventListener(MouseEvent.CLICK, onHandleCancelClick, false, 0, true);
            _local2.bDelete.addEventListener(MouseEvent.CLICK, onHandleDeleteClick, false, 0, true);
            _local2.frame.addEventListener(MouseEvent.MOUSE_DOWN, onHandleMoveClick, false, 0, true);
            _local2.bCancel.buttonMode = true;
            _local2.bDelete.buttonMode = true;
            var _local3:MovieClip = MovieClip(rootClass.ui.mcPopup);
            _local3.mcHouseOptions.cnt.bDesign.addEventListener(MouseEvent.CLICK, world.onHouseOptionsDesignClick, false, 0, true);
            _local3.mcHouseOptions.cnt.bSave.addEventListener(MouseEvent.CLICK, world.onHouseOptionsSaveClick, false, 0, true);
            _local3.mcHouseOptions.cnt.bHide.addEventListener(MouseEvent.CLICK, world.onHouseOptionsHideClick, false, 0, true);
            _local3.mcHouseOptions.cnt.bFloor.addEventListener(MouseEvent.CLICK, world.onHouseOptionsFloorClick, false, 0, true);
            _local3.mcHouseOptions.cnt.bWall.addEventListener(MouseEvent.CLICK, world.onHouseOptionsWallClick, false, 0, true);
            _local3.mcHouseOptions.cnt.bMisc.addEventListener(MouseEvent.CLICK, world.onHouseOptionsMiscClick, false, 0, true);
            _local3.mcHouseOptions.cnt.bHouse.addEventListener(MouseEvent.CLICK, world.onHouseOptionsHouseClick, false, 0, true);
            _local3.mcHouseOptions.bExpand.addEventListener(MouseEvent.CLICK, world.onHouseOptionsExpandClick, false, 0, true);
            _local3.mcHouseOptions.cnt.bDesign.buttonMode = true;
            _local3.mcHouseOptions.cnt.bSave.buttonMode = true;
            _local3.mcHouseOptions.cnt.bHide.buttonMode = true;
            _local3.mcHouseOptions.cnt.bFloor.buttonMode = true;
            _local3.mcHouseOptions.cnt.bWall.buttonMode = true;
            _local3.mcHouseOptions.cnt.bMisc.buttonMode = true;
            _local3.mcHouseOptions.cnt.bHouse.buttonMode = true;
            _local3.mcHouseOptions.bExpand.buttonMode = true;
            _local3.mcHouseOptions.cnt.bDesign.ti.mouseEnabled = false;
            var _local4:MovieClip = (this as MovieClip);
            _local4.preview.bAdd.buttonMode = true;
            _local4.preview.t2.mouseEnabled = false;
            _local4.preview.bAdd.addEventListener(MouseEvent.CLICK, onItemAddClick, false, 0, true);
            _local4.btnClose.addEventListener(MouseEvent.CLICK, btnCloseClick, false, 0, true);
            _local4.bg.addEventListener(MouseEvent.MOUSE_DOWN, onHouseMenuBGClick, false, 0, true);
            _local4.bg.addEventListener(Event.ENTER_FRAME, onHouseMenuBGEnterFrame, false, 0, true);
            _local4.hit.addEventListener(MouseEvent.MOUSE_DOWN, onHouseMenuBGClick, false, 0, true);
            _local4.hit.addEventListener(Event.ENTER_FRAME, onHouseMenuBGEnterFrame, false, 0, true);
            rootClass.world.showHouseOptions("default");
            if (_arg1.toLowerCase() == "edit"){
                showEditMenu();
            };
        }

        public function showEditMenu():void{
            var _local1:MovieClip = MovieClip(this);
            buildHouseMenu();
            _local1.visible = true;
            _local1.y = 315;
            _local1.x = int((480 - (_local1.bg.width / 2)));
            rootClass.ui.mcPopup.mcHouseOptions.cnt.bDesign.ti.text = "Done Editing";
        }

        public function hideEditMenu():void{
            var _local1:MovieClip;
            _local1 = MovieClip(this);
            _local1.visible = false;
            _local1.x = 1000;
            stage.focus = stage;
            rootClass.ui.mcPopup.mcHouseOptions.cnt.bDesign.ti.text = "Edit House";
            onHandleCancelClick();
        }

        public function btnCloseClick(_arg1:MouseEvent=null):void{
            rootClass.mixer.playSound("Click");
            hideEditMenu();
        }

        public function fClose(_arg1:MouseEvent=null):void{
            hideItemHandle();
            var _local2:MovieClip = MovieClip(this);
            var _local3:MovieClip = MovieClip(rootClass.ui.mcPopup);
            var _local4:MovieClip = MovieClip(this.parent).mcHouseItemHandle;
            _local4.removeEventListener(Event.ENTER_FRAME, onHandleEnterFrame);
            _local4.bCancel.removeEventListener(MouseEvent.CLICK, onHandleCancelClick);
            _local4.bDelete.removeEventListener(MouseEvent.CLICK, onHandleDeleteClick);
            _local4.frame.removeEventListener(MouseEvent.MOUSE_DOWN, onHandleMoveClick);
            _local3.mcHouseOptions.cnt.bDesign.removeEventListener(MouseEvent.CLICK, world.onHouseOptionsDesignClick);
            _local3.mcHouseOptions.cnt.bSave.removeEventListener(MouseEvent.CLICK, world.onHouseOptionsSaveClick);
            _local3.mcHouseOptions.cnt.bHide.removeEventListener(MouseEvent.CLICK, world.onHouseOptionsHideClick);
            _local3.mcHouseOptions.cnt.bFloor.removeEventListener(MouseEvent.CLICK, world.onHouseOptionsFloorClick);
            _local3.mcHouseOptions.cnt.bWall.removeEventListener(MouseEvent.CLICK, world.onHouseOptionsWallClick);
            _local3.mcHouseOptions.cnt.bMisc.removeEventListener(MouseEvent.CLICK, world.onHouseOptionsMiscClick);
            _local3.mcHouseOptions.cnt.bHouse.removeEventListener(MouseEvent.CLICK, world.onHouseOptionsHouseClick);
            _local3.mcHouseOptions.bExpand.removeEventListener(MouseEvent.CLICK, world.onHouseOptionsExpandClick);
            _local2.preview.bAdd.removeEventListener(MouseEvent.CLICK, onItemAddClick);
            _local2.btnClose.removeEventListener(MouseEvent.CLICK, btnCloseClick);
            _local2.bg.removeEventListener(MouseEvent.MOUSE_DOWN, onHouseMenuBGClick);
            _local2.bg.removeEventListener(Event.ENTER_FRAME, onHouseMenuBGEnterFrame);
            _local2.hit.removeEventListener(MouseEvent.MOUSE_DOWN, onHouseMenuBGClick);
            _local2.hit.removeEventListener(Event.ENTER_FRAME, onHouseMenuBGEnterFrame);
            _local2.btnClose.removeEventListener(MouseEvent.CLICK, btnCloseClick);
            destroyIList(_local2.iListA);
            destroyIList(_local2.iListB);
            _local2.visible = false;
            stage.focus = stage;
        }

        public function buildHouseMenu():void{
            var _local8:Array;
            var _local9:int;
            var _local1:int;
            var _local2:Object = {};
            var _local3:MovieClip = (this as MovieClip);
            var _local4:Object = {};
            var _local5 = "";
            var _local6:Array = [];
            var _local7:Boolean = true;
            _local1 = 0;
            while (_local1 < world.myAvatar.houseitems.length) {
                _local7 = true;
                _local4 = world.myAvatar.houseitems[_local1];
                _local5 = _local4.sType;
                if (!(_local5 in _local2)){
                    _local2[_local5] = [];
                };
                _local6 = _local2[_local5];
                _local9 = 0;
                while (_local9 < _local6.length) {
                    if (_local6[_local9].ItemID == _local4.ItemID){
                        _local7 = false;
                    };
                    _local9++;
                };
                if (_local7){
                    _local6.push(_local4);
                };
                _local1++;
            };
            for (_local5 in _local2) {
                _local2[_local5].sortOn("sName");
            };
            fData = _local2;
            _local8 = [];
            for (_local5 in _local2) {
                _local8.push(_local5);
            };
            _local8.sort(rootClass.arraySort);
            buildItemList(_local8, "A", _local3);
        }

        public function buildItemList(_arg1:Array, _arg2:String, _arg3:MovieClip):void{
            var _local6:MovieClip;
            var _local7:MovieClip;
            var _local8:Class;
            var _local4:int;
            var _local5:MovieClip = (this as MovieClip);
            var _local9 = "";
            var _local10:Boolean = true;
            var _local11:int = 90;
            _local5.preview.cnt.visible = false;
            _local5.preview.t2.visible = false;
            _local5.preview.bAdd.visible = false;
            _local5.preview.tPreview.visible = false;
            if (_arg2 == "A"){
                _local5.iListB.visible = false;
                _local6 = _local5.iListA;
                destroyIList(_local6);
                _local6.par = _arg3;
                _local4 = 0;
                while (_local4 < _arg1.length) {
                    _local7 = _local6.iList.addChild(new hProto());
                    _local7.ti.autoSize = "left";
                    _local7.ti.text = String(_arg1[_local4]);
                    if (_local7.ti.textWidth > _local11){
                        _local11 = int(_local7.ti.textWidth);
                    };
                    _local7.hit.alpha = 0;
                    _local7.typ = _arg2;
                    _local7.val = _arg1[_local4];
                    _local7.iSel = false;
                    _local7.addEventListener(MouseEvent.CLICK, onHouseMenuItemClick, false, 0, true);
                    _local7.addEventListener(MouseEvent.MOUSE_OVER, onHouseMenuItemMouseOver, false, 0, true);
                    _local7.y = (_local6.iList.iproto.y + (_local4 * 16));
                    _local7.bg.visible = false;
                    _local7.buttonMode = true;
                    _local4++;
                };
                _local6.iList.iproto.visible = false;
                _local6.iList.y = ((_local6.imask.height / 2) - (_local6.iList.height / 2));
            }
            else {
                if (_arg2 == "B"){
                    _local5.iListB.visible = true;
                    _local6 = _local5.iListB;
                    destroyIList(_local6);
                    _local6.par = _arg3;
                    _local4 = 0;
                    while (_local4 < _arg1.length) {
                        _local7 = _local6.iList.addChild(new hProto());
                        _local7.ti.autoSize = "left";
                        _local7.ti.text = String(_arg1[_local4].sName);
                        if (_local7.ti.textWidth > _local11){
                            _local11 = int(_local7.ti.textWidth);
                        };
                        _local7.hit.alpha = 0;
                        _local7.typ = _arg2;
                        _local7.val = _arg1[_local4];
                        _local7.iSel = false;
                        _local7.addEventListener(MouseEvent.CLICK, onHouseMenuItemClick, false, 0, true);
                        _local7.addEventListener(MouseEvent.MOUSE_OVER, onHouseMenuItemMouseOver, false, 0, true);
                        _local7.y = (_local6.iList.iproto.y + (_local4 * 16));
                        _local7.bg.visible = (_local7.val.bEquip == 1);
                        _local7.buttonMode = true;
                        _local4++;
                    };
                    _local6.iList.iproto.visible = false;
                    _local6.x = ((_local6.par.x + _local6.par.width) + 1);
                    _local6.iList.y = ((_local6.imask.height / 2) - (_local6.iList.height / 2));
                };
            };
            _local11 = (_local11 + 7);
            _local4 = 1;
            while (_local4 < _local6.iList.numChildren) {
                _local7 = (_local6.iList.getChildAt(_local4) as MovieClip);
                _local7.bg.width = _local11;
                _local7.hit.width = _local11;
                _local4++;
            };
            var _local12:MovieClip = _local6.scr;
            var _local13:MovieClip = _local6.imask;
            var _local14:MovieClip = _local6.iList;
            _local12.h.y = 0;
            _local12.visible = false;
            _local12.hit.alpha = 0;
            _local12.mDown = false;
            if (_local14.height > _local12.b.height){
                _local12.h.height = int(((_local12.b.height / _local14.height) * _local12.b.height));
                hRun = (_local12.b.height - _local12.h.height);
                dRun = ((_local14.height - _local12.b.height) + 10);
                _local14.oy = (_local14.y = _local13.y);
                _local12.visible = true;
                _local12.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
                _local12.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                _local14.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
            }
            else {
                _local12.hit.removeEventListener(MouseEvent.MOUSE_DOWN, scrDown);
                _local12.h.removeEventListener(Event.ENTER_FRAME, hEF);
                _local14.removeEventListener(Event.ENTER_FRAME, dEF);
            };
            _local6.imask.width = (_local11 - 1);
            _local6.divider.x = _local11;
            _local6.scr.x = _local11;
            if (_local6.scr.visible){
                _local6.w = (_local11 + _local6.scr.width);
            }
            else {
                _local6.w = (_local11 + 1);
            };
            resizeMe();
        }

        private function destroyIList(_arg1:MovieClip):void{
            var _local2:MovieClip;
            while (_arg1.iList.numChildren > 1) {
                _local2 = _arg1.iList.getChildAt(1);
                _local2.removeEventListener(MouseEvent.CLICK, onHouseMenuItemClick);
                _local2.removeEventListener(MouseEvent.MOUSE_OVER, onHouseMenuItemMouseOver);
                delete _local2.val;
                _arg1.iList.removeChildAt(1);
            };
            _arg1.scr.hit.removeEventListener(MouseEvent.MOUSE_DOWN, scrDown);
            _arg1.scr.h.removeEventListener(Event.ENTER_FRAME, hEF);
            _arg1.iList.removeEventListener(Event.ENTER_FRAME, dEF);
        }

        public function onHouseMenuItemClick(_arg1:MouseEvent):void{
            var _local3:MovieClip;
            var _local6:Object;
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            var _local4:MovieClip = (_local2.parent as MovieClip);
            var _local5:MovieClip = (this as MovieClip);
            var _local7:int;
            var _local8 = "";
            if (_local2.typ == "A"){
                _local7 = 0;
                while (_local7 < _local4.numChildren) {
                    MovieClip(_local4.getChildAt(_local7)).bg.visible = false;
                    _local7++;
                };
                _local2.bg.visible = true;
                buildItemList(fData[_local2.val], "B", MovieClip(_local2.parent));
            };
            if (_local2.typ == "B"){
                _local7 = 1;
                while (_local7 < _local4.numChildren) {
                    _local3 = (_local4.getChildAt(_local7) as MovieClip);
                    _local3.iSel = false;
                    _local7++;
                };
                _local2.iSel = true;
                refreshIListB();
                _local6 = _local2.val;
                world.loadHouseItemB(_local6);
                resizeMe();
            };
        }

        public function onHouseMenuItemMouseOver(_arg1:MouseEvent):void{
            var _local3:MovieClip;
            var _local2:MovieClip = MovieClip(_arg1.currentTarget);
            var _local4:int = 1;
            while (_local4 < _local2.parent.numChildren) {
                _local3 = MovieClip(_local2.parent.getChildAt(_local4));
                if (_local3.bg.alpha < 0.4){
                    _local3.bg.visible = false;
                };
                _local4++;
            };
            if (!_local2.bg.visible){
                _local2.bg.visible = true;
                _local2.bg.alpha = 0.33;
            };
        }

        private function refreshIListB():void{
            var _local3:MovieClip;
            var _local1:MovieClip = MovieClip(this).iListB.iList;
            var _local2:int = 1;
            while (_local2 < _local1.numChildren) {
                _local3 = (_local1.getChildAt(_local2) as MovieClip);
                if (_local3.val != null){
                    _local3.bg.visible = false;
                    if (_local3.iSel){
                        _local3.bg.visible = true;
                        _local3.bg.alpha = 0.5;
                    };
                    if (int(_local3.val.bEquip) == 1){
                        _local3.bg.visible = true;
                        _local3.bg.alpha = 1;
                    };
                };
                _local2++;
            };
        }

        public function onItemAddClick(_arg1:MouseEvent):void{
            var _local3:int;
            var _local2:Object = MovieClip(_arg1.currentTarget.parent).item;
            if (int(_local2.bEquip) != 1){
                if ((((_local2.bUpg == 1)) && (!(rootClass.world.myAvatar.isUpgraded())))){
                    rootClass.showUpgradeWindow();
                }
                else {
                    if (_local2.sType == "House"){
                        world.equipHouse(_local2);
                    }
                    else {
                        _local2.bEquip = 1;
                        refreshIListB();
                        _local3 = (((_local2.sType.toLowerCase().indexOf("wall"))>-1) ? 150 : 300);
                        world.loadHouseItem(_local2, 480, _local3);
                    };
                };
            };
        }

        public function previewHouseItem(_arg1:Object):void{
            var _local2:String;
            if (_arg1.item.sType == "House"){
                _local2 = (_arg1.item.sFile.substr(0, -4).substr((_arg1.item.sFile.lastIndexOf("/") + 1)).split("-").join("_") + "_preview");
            }
            else {
                _local2 = _arg1.item.sLink;
            };
            var _local3:Class = (world.loaderD.getDefinition(_local2) as Class);
            var _local4:MovieClip = (MovieClip(this).preview.cnt as MovieClip);
            if (_local4.numChildren > 0){
                _local4.removeChildAt(0);
            };
            var _local5:MovieClip = (_local4.addChild(new (_local3)()) as MovieClip);
            var _local6:* = (130 / _local5.width);
            if (_local5.height > _local5.width){
                _local6 = (113 / _local5.height);
            };
            _local5.scaleX = _local6;
            _local5.scaleY = _local6;
            _local5.x = (130 / 2);
            _local5.y = ((113 / 2) + (_local5.height / 2));
            _local5.ItemID = _arg1.item.ItemID;
            MovieClip(this).preview.item = _arg1.item;
            MovieClip(this).preview.bAdd.visible = true;
            MovieClip(this).preview.tPreview.visible = true;
            MovieClip(this).preview.t2.visible = false;
            MovieClip(this).preview.cnt.visible = true;
        }

        public function resizeMe(){
            var _local1:MovieClip = MovieClip(this);
            if (_local1.iListA.visible){
                _local1.bg.width = ((_local1.iListA.x + _local1.iListA.w) + 5);
            };
            if (_local1.iListB.visible){
                _local1.iListB.x = ((_local1.iListA.x + _local1.iListA.w) + 1);
                _local1.bg.width = (_local1.bg.width + (_local1.iListB.w + 1));
                _local1.iListA.divider.visible = !(_local1.iListA.scr.visible);
            }
            else {
                _local1.iListA.divider.visible = false;
            };
            if (((_local1.preview.t2.visible) || (_local1.preview.cnt.visible))){
                _local1.preview.x = ((_local1.iListB.x + _local1.iListB.w) + 4);
                _local1.bg.width = (_local1.bg.width + (_local1.preview.width + 4));
                _local1.iListB.divider.visible = !(_local1.iListB.scr.visible);
            }
            else {
                _local1.iListB.divider.visible = false;
            };
            var _local2:* = ((((_local1.tTitle.x + tTitle.width) + 4) + _local1.btnClose.width) + 4);
            if (_local1.bg.width < _local2){
                _local1.bg.width = _local2;
            };
            _local1.btnClose.x = (_local1.bg.width - 19);
            _local1.fxmask.width = _local1.bg.width;
            if (_local1.x < 0){
                _local1.x = 0;
            };
            if ((_local1.x + _local1.bg.width) > 1260){
                _local1.x = (1260 - _local1.bg.width);
            };
            if (_local1.y < 0){
                _local1.y = 0;
            };
            if ((_local1.y + _local1.bg.height) > 495){
                _local1.y = (495 - _local1.bg.height);
            };
        }

        public function scrDown(_arg1:MouseEvent){
            mbY = int(mouseY);
            mhY = int(MovieClip(_arg1.currentTarget.parent).h.y);
            scrTgt = MovieClip(_arg1.currentTarget.parent);
            scrTgt.mDown = true;
            stage.addEventListener(MouseEvent.MOUSE_UP, scrUp, false, 0, true);
        }

        public function scrUp(_arg1:MouseEvent){
            scrTgt.mDown = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, scrUp);
        }

        public function hEF(_arg1:Event){
            var _local2:*;
            if (MovieClip(_arg1.currentTarget.parent).mDown){
                _local2 = MovieClip(_arg1.currentTarget.parent);
                mbD = (int(mouseY) - mbY);
                _local2.h.y = (mhY + mbD);
                if ((_local2.h.y + _local2.h.height) > _local2.b.height){
                    _local2.h.y = int((_local2.b.height - _local2.h.height));
                };
                if (_local2.h.y < 0){
                    _local2.h.y = 0;
                };
            };
        }

        public function dEF(_arg1:Event){
            var _local2:* = MovieClip(_arg1.currentTarget.parent).scr;
            var _local3:* = MovieClip(_arg1.currentTarget);
            var _local4:* = (-(_local2.h.y) / hRun);
            var _local5:* = (int((_local4 * dRun)) + _local3.oy);
            if (Math.abs((_local5 - _local3.y)) > 0.2){
                _local3.y = (_local3.y + ((_local5 - _local3.y) / 4));
            }
            else {
                _local3.y = _local5;
            };
        }

        public function drawItemHandle(_arg1:MovieClip):void{
            var _local2:int = Math.ceil(_arg1.width);
            var _local3:int = Math.ceil(_arg1.height);
            var _local4:MovieClip = (MovieClip(this.parent).mcHouseItemHandle as MovieClip);
            _local4.visible = true;
            var _local5:Rectangle = _arg1.getBounds(stage);
            _local4.frame.width = (((_local2)>100) ? _local2 : 100);
            _local4.frame.height = (((_local3)>50) ? _local3 : 50);
            _local4.x = int((_arg1.x - (_local4.frame.width / 2)));
            _local4.y = int(_local5.y);
            if (_local4.tgt != null){
                _local4.tgt.filters = [];
            };
            _local4.tgt = _arg1;
            _local4.tgt.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 2, 2)];
        }

        public function hideItemHandle():void{
            var _local1:MovieClip = (MovieClip(this.parent).mcHouseItemHandle as MovieClip);
            _local1.visible = false;
            _local1.x = 1000;
            if (_local1.tgt != null){
                _local1.tgt.filters = [];
            };
            _local1.tgt = null;
        }

        public function onHandleMoveClick(_arg1:MouseEvent):void{
            var _local2:MovieClip = rootClass.ui.mcPopup.mcHouseItemHandle;
            _local2.mDown = true;
            _local2.ox = _local2.x;
            _local2.oy = _local2.y;
            _local2.mox = stage.mouseX;
            _local2.moy = stage.mouseY;
            stage.addEventListener(MouseEvent.MOUSE_UP, onHandleMoveRelease, false, 0, true);
        }

        public function onHandleMoveRelease(_arg1:MouseEvent):void{
            var _local2:MovieClip = rootClass.ui.mcPopup.mcHouseItemHandle;
            _local2.mDown = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, onHandleMoveRelease);
            world.houseItemValidate(MovieClip(_local2.tgt));
        }

        public function onHandleDeleteClick(_arg1:MouseEvent):void{
            rootClass.mixer.playSound("Click");
            var _local2:MovieClip = rootClass.ui.mcPopup.mcHouseItemHandle;
            var _local3:MovieClip = _local2.tgt;
            _local3.item.bEquip = 0;
            refreshIListB();
            delete _local3.item;
            delete _local3.ItemID;
            _local3.removeEventListener(Event.ENTER_FRAME, world.onHouseItemEnterFrame);
            _local3.parent.removeChild(_local3);
            hideItemHandle();
        }

        public function onHandleCancelClick(_arg1:MouseEvent=null):void{
            var _local2:MovieClip = rootClass.ui.mcPopup.mcHouseItemHandle;
            if (_local2.tgt != null){
                _local2.tgt.filters = [];
            };
            _local2.tgt = null;
            _local2.x = 1000;
            _local2.visible = false;
        }

        public function onHandleEnterFrame(_arg1:Event){
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            if (_local2.visible){
                _local2.bCancel.x = ((_local2.frame.width - _local2.bCancel.width) - 4);
                _local2.bDelete.x = ((_local2.bCancel.x - _local2.bDelete.width) - 4);
                if (_local2.mDown){
                    _local2.x = (_local2.ox + (stage.mouseX - _local2.mox));
                    _local2.y = (_local2.oy + (stage.mouseY - _local2.moy));
                    if ((_local2.x + (_local2.frame.width / 2)) < 0){
                        _local2.x = -(int((_local2.frame.width / 2)));
                    };
                    if ((_local2.x + (_local2.frame.width / 2)) > 1260){
                        _local2.x = int((1260 - (_local2.frame.width / 2)));
                    };
                    if ((_local2.y + (_local2.frame.height / 2)) < 0){
                        _local2.y = -(int((_local2.frame.height / 2)));
                    };
                    if ((_local2.y + (_local2.frame.height / 2)) > 495){
                        _local2.y = int((495 - (_local2.frame.height / 2)));
                    };
                    _local2.tgt.x = Math.ceil((_local2.x + (_local2.frame.width / 2)));
                    _local2.tgt.y = Math.ceil((_local2.y - (_local2.tgt.getBounds(stage).y - _local2.tgt.y)));
                };
            };
        }

        public function onHouseMenuBGClick(_arg1:MouseEvent):void{
            var _local2:MovieClip = MovieClip(this);
            _local2.mDown = true;
            _local2.ox = _local2.x;
            _local2.oy = _local2.y;
            _local2.mox = stage.mouseX;
            _local2.moy = stage.mouseY;
            stage.addEventListener(MouseEvent.MOUSE_UP, onHouseMenuBGRelease, false, 0, true);
        }

        public function onHouseMenuBGRelease(_arg1:MouseEvent):void{
            var _local2:MovieClip = MovieClip(this);
            _local2.mDown = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, onHouseMenuBGRelease);
        }

        public function onHouseMenuBGEnterFrame(_arg1:Event){
            var _local2:MovieClip = (_arg1.currentTarget.parent as MovieClip);
            if (_local2.visible){
                if (_local2.mDown){
                    _local2.x = (_local2.ox + (stage.mouseX - _local2.mox));
                    _local2.y = (_local2.oy + (stage.mouseY - _local2.moy));
                    if (_local2.x < 0){
                        _local2.x = 0;
                    };
                    if ((_local2.x + _local2.bg.width) > 1260){
                        _local2.x = (1260 - _local2.bg.width);
                    };
                    if (_local2.y < 0){
                        _local2.y = 0;
                    };
                    if ((_local2.y + _local2.bg.height) > 495){
                        _local2.y = (495 - _local2.bg.height);
                    };
                };
            };
        }


    }
}//package 

