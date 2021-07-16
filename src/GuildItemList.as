// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//GuildItemList

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.geom.Rectangle;

    public class GuildItemList extends MovieClip {

        public var mcSort:MovieClip;
        public var btnUp:SimpleButton;
        public var btnDown:SimpleButton;
        public var mcScrollBar:MovieClip;
        var rootClass:MovieClip;
        private var inventorySlot:Number = 20;
        var intSelected:Number = -1;
        var intPlacement:Number = 0;
        var itemList:Array;
        var sortedList:Array;
        var strSortBy:String = "all";

        public function GuildItemList(_arg1:MovieClip){
            var _local3:MovieClip;
            super();
            this.rootClass = _arg1;
            this.mcSort.visible = false;
            this.mcScrollBar.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler, false, 0, true);
            this.btnUp.addEventListener(MouseEvent.CLICK, this.onBtnClickHandler, false, 0, true);
            this.btnDown.addEventListener(MouseEvent.CLICK, this.onBtnClickHandler, false, 0, true);
            var _local2:int;
            while (_local2 < 10) {
                _local3 = new InventoryItem();
                _local3.name = ("mcInventoryItem" + _local2);
                _local3.y = (22 * _local2);
                _local3.strIndex.text = "";
                _local3.strName.text = "";
                _local3.strLevel.text = "";
                _local3.intIndex = -1;
                this.addChild(_local3);
                _local2++;
            };
            this.mcSort.btnAll.addEventListener(MouseEvent.CLICK, this.onSortClick, false, 0, true);
            this.mcSort.btnArmor.addEventListener(MouseEvent.CLICK, this.onSortClick, false, 0, true);
            this.mcSort.btnWeapon.addEventListener(MouseEvent.CLICK, this.onSortClick, false, 0, true);
            this.mcSort.btnHelm.addEventListener(MouseEvent.CLICK, this.onSortClick, false, 0, true);
            this.mcSort.btnBack.addEventListener(MouseEvent.CLICK, this.onSortClick, false, 0, true);
            this.mcSort.btnPet.addEventListener(MouseEvent.CLICK, this.onSortClick, false, 0, true);
            this.mcSort.btnItem.addEventListener(MouseEvent.CLICK, this.onSortClick, false, 0, true);
            this.mcSort.btnDesign.addEventListener(MouseEvent.CLICK, this.onSortClick, false, 0, true);
        }

        private function onSortClick(_arg1:Event):void{
            switch (_arg1.target.name){
                case "btnAll":
                    this.sortBy("all");
                    return;
                case "btnArmor":
                    this.sortBy("armor");
                    return;
                case "btnWeapon":
                    this.sortBy("weapon");
                    return;
                case "btnHelm":
                    this.sortBy("helm");
                    return;
                case "btnBack":
                    this.sortBy("back");
                    return;
                case "btnPet":
                    this.sortBy("pet");
                    return;
                case "btnItem":
                    this.sortBy("item");
                    return;
                case "btnDesign":
                    this.sortBy("design");
                    return;
            };
        }

        public function sort():void{
            this.sortBy(this.strSortBy);
        }

        public function sortBy(_arg1:String):void{
            var _local4:Object;
            this.strSortBy = _arg1.toLowerCase();
            var _local2:Array = new Array();
            var _local3:int;
            while (_local3 < this.itemList.length) {
                _local4 = this.itemList[_local3];
                switch (_arg1.toLowerCase()){
                    case "all":
                        _local2.push(_local4);
                        break;
                    case "armor":
                        if ((((_local4.sES == "ar")) || ((_local4.sES == "co")))){
                            _local2.push(_local4);
                        };
                        break;
                    case "weapon":
                        if (_local4.sES == "Weapon"){
                            _local2.push(_local4);
                        };
                        break;
                    case "helm":
                        if (_local4.sES == "he"){
                            _local2.push(_local4);
                        };
                        break;
                    case "back":
                        if (_local4.sES == "ba"){
                            _local2.push(_local4);
                        };
                        break;
                    case "pet":
                        if (_local4.sES == "pe"){
                            _local2.push(_local4);
                        };
                        break;
                    case "item":
                        if (_local4.sES == "None"){
                            _local2.push(_local4);
                        };
                        break;
                    case "design":
                        if (((((!((_local4.sES == "co"))) && (!((_local4.sES == "None"))))) && (!((_local4.RefineID > 0))))){
                            _local2.push(_local4);
                        };
                        break;
                    case "nonac":
                        if (_local4.bCoins == 0){
                            _local2.push(_local4);
                        };
                        break;
                    case "ac":
                        if (_local4.bCoins == 1){
                            _local2.push(_local4);
                        };
                        break;
                    default:
                        _local2.push(_local4);
                };
                _local3++;
            };
            this.inventorySlot = _local2.length;
            this.sortedList = _local2;
            this.reset();
        }

        private function get intScrollCount():Number{
            return ((this.inventorySlot - 10));
        }

        public function clearSelection():void{
            var _local1:* = MovieClip(this.getChildByName(("mcInventoryItem" + (this.intSelected - this.intPlacement))));
            if (_local1 != null){
                _local1.reset();
            };
            this.intSelected = -1;
            if (this.intPlacement != 0){
                this.intPlacement = 0;
                this.mcScrollBar.mcSlider.y = 0;
            };
            MovieClip(parent).refreshDetail();
        }

        public function init(_arg1:Array):void{
            trace(("itemlist init, items: " + _arg1));
            if (_arg1 == null){
                return;
            };
            this.itemList = _arg1;
            if (this.itemList == this.rootClass.world.myAvatar.items){
                this.mcSort.visible = true;
            };
            this.mcScrollBar.mcSlider.visible = (this.intScrollCount > 0);
            this.sort();
        }

        public function reset():void{
            this.clearSelection();
            this.refreshList();
        }

        public function refreshList():void{
            var _local2:Object;
            var _local3:MovieClip;
            var _local4:*;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local8:*;
            var _local9:Class;
            var _local10:*;
            var _local11:Class;
            var _local12:MovieClip;
            var _local13:Number;
            var _local1:int;
            while (_local1 < 10) {
                _local2 = this.sortedList[(_local1 + this.intPlacement)];
                _local3 = MovieClip(this.getChildByName(("mcInventoryItem" + _local1)));
                _local3.strIndex.text = ((_local1 + this.intPlacement) + 1);
                if (this.intSelected == (_local1 + this.intPlacement)){
                    _local3.select();
                }
                else {
                    _local3.reset();
                };
                _local3.intIndex = (_local1 + this.intPlacement);
                if (_local2 == null){
                    _local3.clearText();
                    _local3.unequip();
                }
                else {
                    if (_local2.sType == "Refinement"){
                        _local2.sIcon = this.getESIcon(_local2.sES);
                        _local2.RefineLvl = _local2.iLvl;
                    };
                    _local4 = "#E6E2DB";
                    if (_local2.bUpg == 1){
                        _local4 = "#FFB817";
                    };
                    _local3.strName.htmlText = (((("<font color='" + _local4) + "'>") + _local2.sName) + "</font>");
                    if (_local2.RefineLvl != null){
                        _local3.strLevel.text = ("Lvl " + _local2.RefineLvl);
                    }
                    else {
                        _local3.strLevel.text = "";
                    };
                    if (_local2.bEquip == 1){
                        _local3.equip();
                    }
                    else {
                        _local3.unequip();
                    };
                    _local5 = 21;
                    _local6 = 19;
                    _local7 = _local5;
                    _local8 = _local6;
                    _local3.icon.removeAllChildren();
                    if (((((!((_local2.sIcon == null))) && (!((_local2.sIcon == ""))))) && (!((_local2.sIcon == "none"))))){
                        try {
                            _local9 = (this.rootClass.world.getClass(_local2.sIcon) as Class);
                            _local10 = _local3.icon.addChild(new (_local9)());
                            _local7 = _local10.width;
                            _local8 = _local10.height;
                            if (_local7 > _local8){
                                _local10.scaleX = (_local10.scaleY = (_local5 / _local7));
                            }
                            else {
                                _local10.scaleX = (_local10.scaleY = (_local6 / _local8));
                            };
                            _local3.icon.visible = true;
                        }
                        catch(err:Error) {
                        };
                    };
                    if (((this.isEnhanceable(_local2.sES)) && (!((_local2.RefineID > 0))))){
                        _local11 = (this.rootClass.world.getClass("iidesign") as Class);
                        _local12 = new (_local11)();
                        _local12.alpha = 0.4;
                        _local7 = _local12.width;
                        _local8 = _local12.height;
                        if (_local7 > _local8){
                            _local12.scaleX = (_local12.scaleY = (_local5 / _local7));
                        }
                        else {
                            _local12.scaleX = (_local12.scaleY = (_local6 / _local8));
                        };
                        _local3.icon.addChild(_local12);
                    };
                    if ((((_local2.sES == "ar")) && ((_local2.RefineID > 0)))){
                        _local13 = this.rootClass.getRankFromPoints(_local2.iQty);
                        _local3.strName.htmlText = (_local3.strName.htmlText + ((" <font color='#999999'>(Rank " + _local13) + ")</font>"));
                    };
                };
                _local1++;
            };
        }

        public function isEnhanceable(_arg1:String):Boolean{
            var _local2:Array = ["Weapon", "he", "ba", "pe", "ar"];
            return ((_local2.indexOf(_arg1) >= 0));
        }

        public function getESIcon(_arg1:String):String{
            switch (_arg1){
                case "Weapon":
                    return ("iwsword");
                case "he":
                    return ("iihelm");
                case "ba":
                    return ("iicape");
                case "pe":
                    return ("iipet");
                case "ar":
                    return ("iiclass");
                case "co":
                    return ("iwarmor");
                case "ho":
                    return ("ihhouse");
                default:
                    return ("none");
            };
        }

        public function selectItem(_arg1:int):void{
            var _local3:*;
            if (_arg1 == -1){
                return;
            };
            if (((((this.intSelected - this.intPlacement) >= 0)) && (((this.intSelected - this.intPlacement) < 10)))){
                _local3 = MovieClip(this.getChildByName(("mcInventoryItem" + (this.intSelected - this.intPlacement))));
                _local3.reset();
            };
            this.rootClass.mixer.playSound("Click");
            this.intSelected = _arg1;
            var _local2:* = MovieClip(this.getChildByName(("mcInventoryItem" + (this.intSelected - this.intPlacement))));
            _local2.select();
            MovieClip(parent).refreshDetail();
        }

        public function set Root(_arg1:MovieClip):void{
            this.rootClass = _arg1;
        }

        public function set InventorySlot(_arg1:int):void{
            this.inventorySlot = _arg1;
        }

        public function get selectedItem():Object{
            if (this.itemList == null){
                return (null);
            };
            return (this.sortedList[this.intSelected]);
        }

        function mouseDownHandler(_arg1:Event):void{
            this.mcScrollBar.mcSlider.startDrag(false, new Rectangle(0, 0, 0, 103));
            stage.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler, false, 0, true);
        }

        function mouseUpHandler(_arg1:Event):void{
            this.mcScrollBar.mcSlider.stopDrag();
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
        }

        function mouseMoveHandler(_arg1:Event):void{
            var _local2:int = ((this.mcScrollBar.mcSlider.y * this.intScrollCount) / 103);
            if ((((_local2 >= 0)) && ((_local2 <= this.intScrollCount)))){
                this.intPlacement = _local2;
            };
            this.refreshList();
        }

        private function onBtnClickHandler(_arg1:Event):void{
            if (_arg1.currentTarget.name == "btnUp"){
                if (this.intPlacement > 0){
                    this.intPlacement--;
                };
            }
            else {
                if (_arg1.currentTarget.name == "btnDown"){
                    if (this.intPlacement < this.intScrollCount){
                        this.intPlacement++;
                    };
                };
            };
            this.refreshList();
            this.mcScrollBar.mcSlider.y = Math.ceil(((this.intPlacement * 103) / this.intScrollCount));
        }


    }
}//package 

