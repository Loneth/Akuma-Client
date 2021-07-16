// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//guildIntMenu

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.geom.Point;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class guildIntMenu extends MovieClip {

        public var preview:MovieClip;
        public var fxmask:MovieClip;
        public var btnClose:SimpleButton;
        public var tTitle:MovieClip;
        public var bg:MovieClip;
        public var iListA:MovieClip;
        public var iListB:MovieClip;
        public var hit:MovieClip;
        private var rootClass:MovieClip;
        private var gMenu:MovieClip;
        private var floorItems:Array;
        private var wallItems:Array;
        private var guildItems:Array;
        private var Parent:MovieClip;
        private var items:Array;
        private var classes:Object;
        private var curLink:String;
        private var curID:int;
        private var itemLoader:GuildLoader;
        private var mDown:Boolean = false;
        private var mcTarget:MovieClip;
        private var roomInt:Interior;
        private var guildRoot:MovieClip;
        private var Offset:Point;
        private var prevTarget:MovieClip;
        private var bDelete:MovieClip;
        private var scr:sBar;

        public function guildIntMenu(_arg1:MovieClip, _arg2:MovieClip, _arg3:MovieClip, _arg4:Interior){
            this.floorItems = new Array();
            this.wallItems = new Array();
            this.guildItems = new Array();
            this.classes = new Object();
            super();
            this.rootClass = _arg1;
            this.Parent = _arg2;
            this.roomInt = _arg4;
            this.guildRoot = _arg3;
            this.iListB.visible = false;
            this.preview.visible = false;
            this.iListA.scr.visible = false;
            this.resize();
            this.buildItemLists();
            this.x = 200;
            this.y = 200;
            this.hit.addEventListener(MouseEvent.MOUSE_DOWN, this.onHitDown, false, 0, true);
            this.rootClass.addEventListener(MouseEvent.MOUSE_UP, this.onHitUp, false, 0, true);
            this.btnClose.addEventListener(MouseEvent.CLICK, this.onCloseClick, false, 0, true);
            this.preview.bAdd.addEventListener(MouseEvent.CLICK, this.onAddClick, false, 0, true);
            this.addEventListener(Event.ENTER_FRAME, this.onEnter, false, 0, true);
            this.hit.alpha = 0;
            this.rootClass.ui.addChild(this);
            this.bDelete = (new btnDelete() as MovieClip);
            var _local5:uint;
            while (_local5 < this.guildRoot.MCs.length) {
                this.guildRoot.MCs[_local5].addEventListener(MouseEvent.MOUSE_DOWN, this.onHitDown, false, 0, true);
                this.guildRoot.MCs[_local5].addEventListener(MouseEvent.MOUSE_UP, this.onHitUp, false, 0, true);
                _local5++;
            };
            this.bDelete.addEventListener(MouseEvent.CLICK, this.onDeleteClick, false, 0, true);
        }

        public function Destroy():void{
            this.rootClass.ui.removeChild(this);
            if (this.prevTarget != null){
                this.prevTarget.removeChild(this.bDelete);
            };
            var _local1:uint;
            while (_local1 < this.guildRoot.MCs.length) {
                this.guildRoot.MCs[_local1].removeEventListener(MouseEvent.MOUSE_DOWN, this.onHitDown);
                this.guildRoot.MCs[_local1].removeEventListener(MouseEvent.MOUSE_UP, this.onHitUp);
                _local1++;
            };
        }

        private function buildItemLists():void{
            var _local1:Object;
            var _local2:MovieClip;
            var _local3:uint;
            while (_local3 < this.rootClass.world.myAvatar.houseitems.length) {
                _local1 = this.rootClass.world.myAvatar.houseitems[_local3];
                switch (_local1.sType){
                    case "Wall Item":
                        trace("wall");
                        this.wallItems.push(_local1);
                        break;
                    case "Floor Item":
                        trace("floor");
                        this.floorItems.push(_local1);
                        break;
                    case "Guild":
                        trace("guild");
                        this.guildItems.push(_local1);
                        break;
                };
                _local3++;
            };
            this.iListA.iList.removeChildAt(0);
            trace(("floorItems.length: " + this.floorItems.length));
            if (this.floorItems.length > 0){
                _local2 = (new hProto() as MovieClip);
                _local2.name = "Floor";
                _local2.ti.text = "Floor Items";
                _local2.ti.autoSize = "left";
                _local2.hit.alpha = 0;
                _local2.bg.alpha = 0;
                _local2.addEventListener(MouseEvent.CLICK, this.onListAClick, false, 0, true);
                this.iListA.iList.addChild(_local2);
            };
            trace(("wallItems.length: " + this.wallItems.length));
            if (this.wallItems.length > 0){
                _local2 = (new hProto() as MovieClip);
                _local2.name = "Wall";
                _local2.ti.autoSize = "left";
                _local2.ti.text = "Wall Items";
                _local2.hit.alpha = 0;
                _local2.bg.alpha = 0;
                _local2.y = (_local2.height - 4);
                _local2.addEventListener(MouseEvent.CLICK, this.onListAClick, false, 0, true);
                this.iListA.iList.addChild(_local2);
            };
            trace(("guildItems.length: " + this.guildItems.length));
            if (this.guildItems.length > 0){
                _local2 = (new hProto() as MovieClip);
                _local2.name = "Guild";
                _local2.ti.autoSize = "left";
                _local2.ti.text = "Guild Items";
                _local2.hit.alpha = 0;
                _local2.bg.alpha = 0;
                _local2.y = (_local2.height + 10);
                _local2.addEventListener(MouseEvent.CLICK, this.onListAClick, false, 0, true);
                this.iListA.iList.addChild(_local2);
            };
            this.iListA.iList.y = ((this.iListA.imask.y + (this.iListA.imask.height >> 1)) - (this.iListA.iList.height >> 1));
        }

        private function resize():void{
            if (this.preview.visible){
                this.preview.x = this.bg.width;
                this.bg.width = (((this.iListA.width + this.iListB.width) + this.preview.width) + 5);
            }
            else {
                if (this.iListB.visible){
                    trace(((("listA: " + this.iListA.width) + " listB: ") + this.iListB.width));
                    this.bg.width = (this.iListA.width + this.iListB.width);
                }
                else {
                    this.bg.width = ((this.iListA.x + this.iListA.width) + 5);
                };
            };
            this.btnClose.x = (this.bg.width - 19);
            this.fxmask.width = this.bg.width;
        }

        private function onHitDown(_arg1:MouseEvent):void{
            trace("onHitDown");
            this.mDown = true;
            this.mcTarget = MovieClip(_arg1.currentTarget);
            if (this.mcTarget == null){
                return;
            };
            trace(("mcTarget.name: " + this.mcTarget.name));
            if (this.mcTarget == this.hit){
                this.mcTarget = this;
            }
            else {
                if (this.mcTarget.name.indexOf("instance") < 0){
                    trace(("prevTarget: " + this.prevTarget));
                    trace(("mcTarget.name: " + this.mcTarget.name));
                    if (this.prevTarget == null){
                        this.prevTarget = this.mcTarget;
                        this.mcTarget.addChild(this.bDelete);
                    }
                    else {
                        if (this.prevTarget != this.mcTarget){
                            trace("setting prevTarget");
                            this.prevTarget.removeChild(this.bDelete);
                            trace(("setting prevTarget to: " + this.mcTarget));
                            this.prevTarget = this.mcTarget;
                            this.mcTarget.addChild(this.bDelete);
                        };
                    };
                };
            };
            this.Offset = new Point((this.rootClass.mouseX - this.mcTarget.x), (this.rootClass.mouseY - this.mcTarget.y));
        }

        private function onHitUp(_arg1:MouseEvent):void{
            this.mDown = false;
            if (((!((this.mcTarget == this.hit))) && (!((this.mcTarget == null))))){
                trace(("mcTarget.name: " + this.mcTarget.name));
                if (this.mcTarget.name.indexOf("instance") < 0){
                    this.roomInt.updateItem(this.rootClass.world.map.currentLabel, new Point(this.mcTarget.x, this.mcTarget.y), this.mcTarget.name);
                };
                if (((!((this.guildRoot.ItemData[this.mcTarget.name].sMeta == null))) && ((this.guildRoot.ItemData[this.mcTarget.name].sMeta.indexOf("NPC") > -1)))){
                    trace(("scaleX: " + this.mcTarget.scaleX));
                    if (this.mcTarget.x > 480){
                        if (this.mcTarget.scaleX > 0){
                            this.mcTarget.scaleX = (this.mcTarget.scaleX * -1);
                            trace(("scaleX: " + this.mcTarget.scaleX));
                        };
                    }
                    else {
                        if (this.mcTarget.scaleX < 0){
                            this.mcTarget.scaleX = (this.mcTarget.scaleX * -1);
                            trace(("scaleX: " + this.mcTarget.scaleX));
                        };
                    };
                };
            };
            this.mcTarget = null;
        }

        private function onEnter(_arg1:Event):void{
            if (((!((this.mcTarget == null))) && (this.mDown))){
                this.mcTarget.x = (this.rootClass.mouseX - this.Offset.x);
                this.mcTarget.y = (this.rootClass.mouseY - this.Offset.y);
            };
        }

        private function onCloseClick(_arg1:MouseEvent):void{
            this.Destroy();
            this.Parent.closeInt();
        }

        private function onDeleteClick(_arg1:MouseEvent):void{
            var _local2:uint;
            while (_local2 < this.guildRoot.MCs.length) {
                if (this.guildRoot.MCs[_local2] == this.prevTarget){
                    this.guildRoot.MCs.splice(_local2, 1);
                };
                _local2++;
            };
            this.rootClass.world.CHARS.removeChild(this.prevTarget);
            this.prevTarget.removeEventListener(MouseEvent.MOUSE_DOWN, this.onHitDown);
            this.prevTarget.removeEventListener(MouseEvent.MOUSE_UP, this.onHitUp);
            this.roomInt.removeItem(this.rootClass.world.map.currentLabel, this.prevTarget.name);
            this.prevTarget = null;
        }

        private function onAddClick(_arg1:MouseEvent):void{
            var _local2:MovieClip;
            var _local3:*;
            trace(((((("curID: " + this.curID) + " checkID: ") + this.roomInt.checkItemID(int(this.curID))) + " getItemCount: ") + this.roomInt.getItemCount(this.rootClass.world.map.currentLabel)));
            if (((!(this.roomInt.checkItemID(int(this.curID)))) && ((this.roomInt.getItemCount(this.rootClass.world.map.currentLabel) < 10)))){
                _local2 = (new (this.classes[String(this.curID)])() as MovieClip);
                _local2.x = 400;
                _local2.y = 200;
                _local2.name = String(this.curID);
                _local2.addEventListener(MouseEvent.MOUSE_DOWN, this.onHitDown, false, 0, true);
                this.rootClass.world.CHARS.addChild(_local2);
                this.guildRoot.MCs.push(_local2);
                _local3 = this.getItemByID(this.curID);
                if (((!((_local3.sMeta == null))) && ((_local3.sMeta.indexOf("NPC") > -1)))){
                    _local2.scaleX = (_local2.scaleY = 0.2);
                };
                _local2.scaleX = (_local2.scaleX * this.rootClass.world.Scale);
                _local2.scaleY = (_local2.scaleY * this.rootClass.world.Scale);
                this.roomInt.addNewItem(this.rootClass.world.map.currentLabel, new Point(_local2.x, _local2.y), _local3, this.classes[String(this.curID)]);
            };
        }

        private function onListAClick(_arg1:MouseEvent):void{
            var _local2:uint;
            var _local3:MovieClip;
            if (this.scr != null){
                this.scr.Destroy();
                this.scr = null;
            };
            if (this.preview.cnt.numChildren > 0){
                this.preview.cnt.removeChildAt(0);
            };
            this.preview.visible = false;
            this.iListB.visible = true;
            var _local4:int = this.iListB.iList.numChildren;
            _local2 = 0;
            while (_local2 < _local4) {
                this.iListB.iList.removeChildAt(0);
                _local2++;
            };
            trace(("clicked: " + _arg1.currentTarget.name));
            switch (_arg1.currentTarget.name){
                case "Floor":
                    this.items = this.floorItems;
                    break;
                case "Wall":
                    this.items = this.wallItems;
                    break;
                case "Guild":
                    this.items = this.guildItems;
                    break;
            };
            _local2 = 0;
            while (_local2 < this.items.length) {
                _local3 = (new hProto() as MovieClip);
                _local3.ti.text = this.items[_local2].sName;
                _local3.ti.autoSize = "left";
                _local3.y = (_local3.height * _local2);
                _local3.hit.alpha = 0;
                _local3.bg.alpha = 0;
                _local3.name = String(_local2);
                _local3.addEventListener(MouseEvent.CLICK, this.onListBClick, false, 0, true);
                this.iListB.iList.addChild(_local3);
                _local2++;
            };
            this.iListB.scr.x = (this.iListB.width - (this.iListB.scr.width + 1));
            this.iListB.divider.x = (this.iListB.scr.x + this.iListB.scr.width);
            this.resize();
            trace(((("listB height: " + this.iListB.iList.height) + " mask: ") + this.iListB.imask.height));
            if (this.iListB.iList.height > this.iListB.imask.height){
                trace("list > mask");
                this.iListB.iList.y = this.iListB.imask.y;
                this.iListB.scr.visible = true;
                this.scr = new sBar(this.iListB.scr, this.iListB.iList, this.iListB.imask, this.rootClass);
            }
            else {
                trace("list < mask");
                this.iListB.scr.visible = false;
                this.iListB.iList.y = ((this.iListB.imask.y + (this.iListB.imask.height >> 1)) - (this.iListB.iList.height >> 1));
            };
            trace(("y: " + this.iListB.iList.y));
        }

        private function onListBClick(_arg1:MouseEvent):void{
            trace("listB clicked");
            if (this.preview.cnt.numChildren > 0){
                this.preview.cnt.removeChildAt(0);
            };
            this.preview.visible = false;
            this.resize();
            var _local2:* = this.items[int(_arg1.currentTarget.name)];
            trace(("item.sMeta: " + _local2.sMeta));
            if (this.classes[String(_local2.ItemID)] != null){
                this.preview.visible = true;
                if (this.preview.cnt.numChildren > 0){
                    this.preview.cnt.removeChildAt(0);
                };
                this.resize();
                this.attachPreview((new (this.classes[String(_local2.ItemID)])() as MovieClip));
            }
            else {
                trace(("item.sMeta: " + _local2.sMeta));
                this.curLink = _local2.sLink;
                this.curID = int(_local2.ItemID);
                if (((!((_local2.sMeta == null))) && ((_local2.sMeta.indexOf("NPC") > -1)))){
                    this.itemLoader = new GuildLoader(this.onItemLoadComplete, (this.rootClass.getFilePath() + _local2.sFile), (_local2.sLink + "_NPC"), _local2.ItemID);
                }
                else {
                    this.itemLoader = new GuildLoader(this.onItemLoadComplete, (this.rootClass.getFilePath() + _local2.sFile), _local2.sLink, _local2.ItemID);
                };
                this.preview.visible = true;
                this.preview.t2.visible = true;
                this.resize();
            };
        }

        private function onItemLoadComplete(_arg1:GuildLoader):void{
            this.classes[String(_arg1.ID)] = _arg1.swfClass;
            try {
                if (this.guildRoot.ItemData[String(_arg1.ID)].sMeta.indexOf("NPC") > -1){
                    this.guildRoot.ItemData[String(_arg1.ID)].aClass = _arg1.getClass((this.guildRoot.ItemData[String(_arg1.ID)].sLink + "_APOP"));
                };
            }
            catch(e) {
            };
            this.attachPreview(MovieClip(new _arg1.swfClass()));
        }

        private function attachPreview(_arg1:MovieClip){
            var _local2:* = (130 / _arg1.width);
            if (_arg1.height > _arg1.width){
                _local2 = (113 / _arg1.height);
            };
            _arg1.scaleX = _local2;
            _arg1.scaleY = _local2;
            _arg1.x = 65;
            _arg1.y = (56.5 + (_arg1.height >> 1));
            this.preview.cnt.addChild(_arg1);
            this.preview.t2.visible = false;
        }

        private function getItemByID(_arg1:int):Object{
            var _local2:int;
            while (_local2 < this.rootClass.world.myAvatar.houseitems.length) {
                if (this.rootClass.world.myAvatar.houseitems[_local2].ItemID == _arg1){
                    return (this.rootClass.world.myAvatar.houseitems[_local2]);
                };
                _local2++;
            };
            return (null);
        }


    }
}//package 

