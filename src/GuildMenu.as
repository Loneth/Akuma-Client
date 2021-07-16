// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//GuildMenu

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class GuildMenu extends MovieClip {

        private const memMenu:Array = new Array({txt:"Guild Hall Menu"}, {
            txt:"Building Shop",
            fct:"buildShop"
        });

        private var Parent:MovieClip;
        private var menuMC:MovieClip;
        private var rootClass:MovieClip;
        private var lastClicked:MovieClip;
        private var editMode:Boolean = false;
        private var gMap:guildHallMap;
        private var btns:Array;
        private var Menus:Array;
        private var menusAdded:Array;
        private var Preview:MovieClip;
        private var buildEdit:menuEditBuilding;
        private var pathEdit:menuEditPath;
        private var gShop:GuildShop;
        private var modal:ModalMC;
        private var modalO:Object;
        private var interiorMenu:MovieClip;
        private var mainMenu:Array;

        public function GuildMenu(_arg1:MovieClip, _arg2:MovieClip){
            this.menuMC = new MovieClip();
            this.Menus = new Array();
            this.menusAdded = new Array();
            this.mainMenu = new Array({txt:"Guild Hall Menu"}, {
                txt:"Edit Mode",
                fct:"editGuildHall"
            }, {
                txt:"Buy Land",
                fct:"buyLand"
            }, {
                txt:"Building Shop",
                fct:"buildShop"
            }, {
                txt:"Save Item Placement",
                fct:"saveInterior"
            });
            super();
            this.rootClass = _arg1;
            this.Parent = _arg2;
            if (this.rootClass.world.myAvatar.objData.guildRank >= 2){
                this.buildMenu(this.mainMenu, 900, 50);
            }
            else {
                this.buildMenu(this.memMenu, 900, 50);
            };
            this.rootClass.ui.addChild(this.menuMC);
        }

        private function buildMenu(_arg1:Array, _arg2:Number, _arg3:Number):MovieClip{
            var _local5:MovieClip;
            var _local4:MovieClip = new MovieClip();
            if (_arg1[0].fct == null){
                _local5 = new guildMenuTop();
                _local5.txt.text = _arg1[0].txt;
            }
            else {
                _local5 = new guildMenuListItem();
                _local5.mTxt.text = _arg1[0].txt;
                _local5.name = _arg1[0].fct;
                _local5.addEventListener(MouseEvent.CLICK, this.callFunction, false, 0, true);
            };
            _local5.y = _arg3;
            _local5.x = _arg2;
            _local4.addChild(_local5);
            var _local6:uint = 1;
            while (_local6 < _arg1.length) {
                _local5 = new guildMenuListItem();
                _local5.y = (_local4.height + _arg3);
                _local4.addChild(_local5);
                _local5.x = _arg2;
                _local5.name = _arg1[_local6].fct;
                _local5.mTxt.text = _arg1[_local6].txt;
                _local5.buttonMode = true;
                _local5.mouseChildren = false;
                _local5.addEventListener(MouseEvent.CLICK, this.callFunction, false, 0, true);
                _local6++;
            };
            _local5 = new guildMenuBottom();
            _local5.y = (_local4.height + _arg3);
            _local4.addChild(_local5);
            _local5.x = _arg2;
            this.menuMC.addChild(_local4);
            return (_local4);
        }

        private function callFunction(_arg1:MouseEvent):void{
            var _local3:Function;
            this.lastClicked = MovieClip(_arg1.currentTarget);
            var _local2:Array = _arg1.currentTarget.name.split(".");
            switch (_local2.length){
                case 1:
                    _local3 = this[_arg1.currentTarget.name];
                    break;
                case 2:
                    _local3 = this.rootClass[_local2[1]];
                    break;
                case 3:
                    _local3 = this.rootClass.world[_local2[2]];
                    break;
            };
            (_local3());
        }

        public function closeInt():void{
            this.editGuildHall();
        }

        public function cellChange():void{
            trace(("change cell, editMode: " + this.editMode));
            if (this.editMode){
                this.editGuildHall();
            };
        }

        private function editGuildHall():void{
            var _local1:uint;
            var _local2:*;
            var _local3:MovieClip;
            var _local4:String;
            var _local5:uint;
            var _local6:*;
            trace("editGuildHall");
            if (this.editMode){
                this.editMode = false;
                this.lastClicked.mTxt.text = "Edit Mode";
                try {
                    _local1 = 0;
                    while (_local1 < this.btns.length) {
                        this.rootClass.world.map.removeChild(this.btns[_local1]);
                        _local1++;
                    };
                    this.buildEdit.Destroy();
                }
                catch(e) {
                };
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["getInv"], "str", this.rootClass.world.curRoom);
                this.btns = new Array();
                this.editMode = true;
                this.lastClicked.mTxt.text = "Edit Off";
                if (this.Parent.Inside){
                    this.interiorMenu = new guildIntMenu(this.rootClass, this, this.Parent, this.Parent.bInt);
                    return;
                };
                _local2 = this.Parent.CurrentBG;
                this.gMap = this.Parent.GuildGrid;
                _local5 = 1;
                for (;_local5 <= 8;_local5++) {
                    _local4 = ("Pad" + String(_local5));
                    if (_local5 > 5){
                        _local6 = this.gMap.hasAdjCell(this.Parent.CurrentCell, this.gMap.getPadDirection(_local4));
                        if (this.Parent.hasBuilding(this.gMap.onLot(this.Parent.getPadPair(_local4)), _local6)) continue;
                    };
                    if (!this.Parent.hasBuilding(this.gMap.onLot(_local4))){
                        _local3 = new EditBtn();
                        _local3.x = _local2[_local4].x;
                        _local3.y = _local2[_local4].y;
                        _local3.width = _local2[_local4].width;
                        _local3.height = _local2[_local4].height;
                        this.btns.push(this.rootClass.world.map.addChild(_local3));
                        _local3.name = String(_local5);
                        if (!this.Parent.hasConnection(_local4)){
                            _local3.addEventListener(MouseEvent.MOUSE_OUT, this.padEditOut, false, 0, true);
                            _local3.addEventListener(MouseEvent.MOUSE_OVER, this.padEditOver, false, 0, true);
                            _local3.addEventListener(MouseEvent.CLICK, this.padEditClick, false, 0, true);
                        }
                        else {
                            _local3.addEventListener(MouseEvent.CLICK, this.padChangeClick, false, 0, true);
                        };
                    };
                    if (this.gMap.onLot(_local4) != null){
                        if (!this.Parent.hasConnection(_local4)){
                            _local3 = new EditBuilding();
                            _local3.y = 175;
                            _local3.x = this.getBuildingPos(("Lot" + this.gMap.onLot(_local4)));
                            _local3.name = this.gMap.onLot(_local4);
                            _local3.buttonMode = true;
                            this.btns.push(this.rootClass.world.map.addChild(_local3));
                            _local3.addEventListener(MouseEvent.CLICK, this.buildingEditClick, false, 0, true);
                        };
                    };
                };
                _local3 = new EditBuilding();
                _local3.name = "2";
                _local3.y = 175;
                _local3.x = this.getBuildingPos("Lot2");
                _local3.buttonMode = true;
                _local3.addEventListener(MouseEvent.CLICK, this.buildingEditClick, false, 0, true);
                this.btns.push(this.rootClass.world.map.addChild(_local3));
            };
        }

        private function buyLand():void{
            if (this.Parent.Lots < 16){
                this.modal = new ModalMC();
                this.modalO = {};
                this.modalO.strBody = (("You own " + this.Parent.Lots) + "/16 plots. Would you like to buy another for 1000 Gold.");
                this.modalO.params = {};
                this.modalO.callback = this.doBuyLand;
                trace(("callBack: " + this.modalO.callBack));
                this.modalO.btns = "dual";
                this.rootClass.ui.ModalStack.addChild(this.modal);
                this.modal.init(this.modalO);
            }
            else {
                this.modal = new ModalMC();
                this.modalO = {};
                this.modalO.strBody = "You already have the maximum amount of land.";
                this.modalO.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(this.modal);
                this.modal.init(this.modalO);
            };
        }

        public function doBuyLand(_arg1:Object):void{
            trace("doBuyLand");
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["buyplot"], "str", this.rootClass.world.curRoom);
            };
        }

        private function buildShop():void{
            if (this.Parent.Inventory == null){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["getInv"], "str", this.rootClass.world.curRoom);
            };
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["getShop", 672], "str", this.rootClass.world.curRoom);
        }

        private function getBuildingPos(_arg1:String):int{
            switch (_arg1){
                case "Lot1":
                    return (5);
                case "Lot2":
                    return (245);
                case "Lot3":
                    return (485);
                case "Lot4":
                    return (725);
            };
            return (0);
        }

        public function padEditOut(_arg1:MouseEvent):void{
            this.togglePath(("arrow" + _arg1.currentTarget.name), false);
        }

        public function padEditOver(_arg1:MouseEvent):void{
            this.togglePath(("arrow" + _arg1.currentTarget.name), true);
        }

        public function togglePath(_arg1:String, _arg2:Boolean):void{
            if ((((_arg1 == "arrow1")) || ((_arg1 == "arrow5")))){
                this.Parent.CurrentBG[_arg1].visible = !(_arg2);
                return;
            };
            this.Parent.CurrentBG[_arg1].visible = _arg2;
        }

        public function buildingEditClick(_arg1:MouseEvent):void{
            trace(("Building Clicked: " + _arg1.currentTarget.name));
            this.clearMenus();
            this.buildEdit = new menuEditBuilding(this.Preview, _arg1.currentTarget.name, this.Parent, _arg1.currentTarget.x, this.rootClass);
        }

        public function padEditClick(_arg1:MouseEvent):void{
            this.clearMenus(_arg1.currentTarget.name);
            this.pathEdit = new menuEditPath(this.Preview, this.rootClass, this.gMap, MovieClip(_arg1.currentTarget), this.Parent, this, true);
            _arg1.currentTarget.removeEventListener(MouseEvent.MOUSE_OVER, this.padEditOver);
            _arg1.currentTarget.removeEventListener(MouseEvent.MOUSE_OUT, this.padEditOut);
        }

        public function padChangeClick(_arg1:MouseEvent):void{
            this.pathEdit = new menuEditPath(this.Preview, this.rootClass, this.gMap, MovieClip(_arg1.currentTarget), this.Parent, this, false);
        }

        private function saveInterior():void{
            this.Parent.saveInterior();
        }

        private function clearMenus(_arg1:String=null):void{
            if (this.buildEdit != null){
                this.buildEdit.Destroy();
                this.buildEdit = null;
            };
            if (this.pathEdit != null){
                this.pathEdit.Destroy();
                this.pathEdit = null;
            };
        }

        private function removeMenu(_arg1:Array):void{
            var _local2:uint;
            while (_local2 < _arg1.length) {
                this.menuMC.removeChild(_arg1[_local2]);
                _local2++;
            };
            _arg1 = [];
        }

        public function openShop(_arg1:Object, _arg2:Array):void{
            trace("creating new guild shop");
            this.gShop = new GuildShop(this.rootClass, this, _arg1, _arg2);
        }

        public function closeShop():void{
            this.gShop.Destroy();
            this.gShop = null;
        }

        public function refreshShop(_arg1:Array):void{
            trace(("refreshShop, gShop: " + this.gShop));
            if (this.gShop != null){
                this.gShop.reset(_arg1);
            };
        }

        public function Destory():void{
            var _local1:uint;
            if (this.interiorMenu != null){
                this.interiorMenu.Destroy();
            };
            if (this.buildEdit != null){
                this.buildEdit.Destroy();
            };
            if (this.pathEdit != null){
                this.pathEdit.Destroy();
            };
            if (this.gShop != null){
                this.gShop.Destroy();
            };
            try {
                _local1 = 0;
                while (_local1 < this.btns.length) {
                    this.rootClass.world.map.removeChild(this.btns[_local1]);
                    _local1++;
                };
            }
            catch(e) {
            };
            this.rootClass.ui.removeChild(this.menuMC);
        }

        public function isItemInInventory(_arg1:int):Boolean{
            var _local2:* = this.Parent.Inventory[String(_arg1)];
            if (_local2 == null){
                return (false);
            };
            if (_local2.unm == this.rootClass.world.myAvatar.objData.strUsername){
                return (true);
            };
            return (false);
        }

        public function get Menu():MovieClip{
            return (this.menuMC);
        }

        public function get EditMode():Boolean{
            return (this.editMode);
        }


    }
}//package 

