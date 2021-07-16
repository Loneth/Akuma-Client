// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//GuildHall

package {
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;

    public class GuildHall extends MovieClip {

        private const lotPads:Object = {
            Lot1:"Left",
            Lot2:"Top2",
            Lot3:"Top4",
            Lot4:"Right"
        };
        private const padSpawnPairs:Object = {
            Pad1:"Right",
            Pad2:"Right",
            Pad3:"Down1",
            Pad4:"Down2",
            Pad5:"Left",
            Pad6:"Left",
            Pad7:"Top3",
            Pad8:"Right"
        };
        private const padPairs:Object = {
            Pad1:"Pad5",
            Pad2:"Pad6",
            Pad3:"Pad7",
            Pad4:"Pad8",
            Pad5:"Pad1",
            Pad6:"Pad2",
            Pad7:"Pad3",
            Pad8:"Pad4"
        };
        private const frameToBit:Object = {
            fr1:0,
            fr2:1,
            fr3:2,
            fr4:3,
            fr5:4,
            fr6:5
        };

        private var rootClass:MovieClip;
        private var Cells:Object;
        private var currentCell:String = "Enter";
        private var guildMap;
        private var currentLot:String = "";
        private var totalFiles:int;
        private var buildingsLoaded:int = 0;
        private var GuildMapGrid:guildHallMap;
        private var HallSize:int = -1;
        private var totalCells:int = 0;
        private var interiorMCs:Array;
        private var buildingFiles:Object;
        private var Menu:GuildMenu;
        private var inBuilding:Boolean = false;
        private var gInv:Object;
        private var guildItemData:Object;
        private var buildingLinks:Object;

        public function GuildHall(_arg1:Array, _arg2:MovieClip){
		trace("GUILDHALLS");
            var _local3:Cell;
            this.Cells = new Object();
            this.buildingFiles = new Object();
            this.guildItemData = new Object();
            this.buildingLinks = new Object();
            super();
            this.rootClass = _arg2;
            var _local4:Array = new Array();
            this.HallSize = this.rootClass.world.myAvatar.objData.guild.HallSize;
            var _local5:uint;
            while (_local5 < _arg1.length) {
                _local3 = new Cell(_arg1[_local5], this.rootClass, this);
                if ((((_local3.Name == "Enter")) || (!((_local3.Connection == null))))){
                    this.Cells[_local3.Name] = _local3;
                    _local4 = _local4.concat(_local3.IntIDs);
                    this.totalCells++;
                };
                _local5++;
            };
            this.GuildMapGrid = new guildHallMap(this.Cells);
            this.GuildMapGrid.traceCellData();
            trace(("nextFrame: " + this.GuildMapGrid.EmptyFrame));
            this.Menu = new GuildMenu(this.rootClass, this);
            var _local6:Array = this.GuildMapGrid.getBGList("Enter");
            var _local7:uint;
            while (_local7 < _local6.length) {
                trace(((((("bgList[" + _local7) + "].frame: ") + _local6[_local7].frame) + " dir: ") + _local6[_local7].dir));
                _local7++;
            };
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["getInterior", _local4], "str", this.rootClass.world.curRoom);
        }

        private function loadAllAssets(_arg1:String):void{
            var _local3:*;
            trace("loadAllAssets");
            var _local2:Object = this.Cells[_arg1].Connections;
            this.totalFiles = this.Cells[_arg1].loadBuildings();
            trace(("totalfiles: " + this.totalFiles));
            for (_local3 in _local2) {
                if (_local3 != ""){
                    this.totalFiles = (this.totalFiles + this.Cells[_local2[_local3].frame].loadBuildings());
                    trace(("totalfiles: " + this.totalFiles));
                };
            };
            trace(("total files to load: " + this.totalFiles));
            if (this.totalFiles > 0){
                this.rootClass.mcConnDetail.showConn(((("Buildings Loaded... " + this.buildingsLoaded) + " of ") + this.totalFiles));
            }
            else {
                this.finishLoad();
            };
        }

        public function updateBuildingLoad():void{
            this.buildingsLoaded++;
            if (this.rootClass.world.mapLoadInProgress){
                this.rootClass.mcConnDetail.showConn(((("Buildings Loaded... " + this.buildingsLoaded) + " of ") + this.totalFiles));
                if (this.buildingsLoaded == this.totalFiles){
                    this.finishLoad();
                };
            };
        }

        private function finishLoad():void{
            if (((!((this.rootClass.world.mondef == null))) && (this.rootClass.world.mondef.length))){
                this.rootClass.world.initMonsters(this.rootClass.world.mondef, this.rootClass.world.monmap);
            }
            else {
                this.rootClass.world.addChildAt(this.rootClass.world.map, 0).x = 0;
                this.rootClass.world.CHARS.x = 0;
                this.rootClass.world.resetSpawnPoint();
                this.rootClass.world.enterMap();
            };
            this.rootClass.world.mapLoadInProgress = false;
        }

        public function changeCell(_arg1:String, _arg2:String):void{
            var _local3:Object;
            trace(((("cell name: " + _arg1) + " padName: ") + _arg2));
            _local3 = this.Cells[_arg1].Connection[_arg2];
            this.Cells[_local3.frame].loadInteriors();
            if (_local3 != null){
                this.rootClass.world.moveToCell(_local3.frame, _local3.pad);
            };
        }

        public function enterBuilding(_arg1:String):void{
            if (this.guildMap == null){
                this.guildMap = this.rootClass.world.map;
            };
            var _local2:Object = this.Cells[this.currentCell].getHousePad(_arg1);
            this.currentLot = _local2.Lot;
            var _local3:MovieClip = this.Cells[this.currentCell].getBuildingMC(this.currentLot);
            this.rootClass.world.map = _local3;
            this.inBuilding = true;
            this.rootClass.world.moveToCell(_local2.Frame, _local2.Pad);
        }

        public function exitBuilding(_arg1:String):void{
            this.rootClass.world.map = this.guildMap;
            this.rootClass.world.moveToCell(this.currentCell, this.lotPads[this.currentLot]);
            this.currentLot = "";
            this.inBuilding = false;
        }

        public function createGuildCell(_arg1:String):MovieClip{
            trace(("create guild cell: " + _arg1));
            this.currentCell = _arg1;
            trace(("IntIDs:" + this.Cells[this.currentCell].IntIDs));
            this.loadAdjData();
            return (this.Cells[_arg1].BgMovie);
        }

        public function loadGuildMap(_arg1:String):void{
            if (_arg1.indexOf("cdn.aqworlds.com") == -1){
                _arg1 = ((this.rootClass.getFilePath() + "maps/") + _arg1);
            };
            trace(("loading guild map: " + _arg1));
            this.rootClass.mcConnDetail.showConn("Loading Guild Map Files...");
            if (this.rootClass.world.map != null){
                this.rootClass.world.map.gotoAndStop("Wait");
                this.rootClass.world.removeChild(this.rootClass.world.map);
                this.rootClass.world.map = null;
            };
            this.rootClass.world.removeMapListeners();
            this.rootClass.world.ldr_map = new Loader();
            this.rootClass.world.ldr_map.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onMapLoadComplete, false, 0, true);
            this.rootClass.world.ldr_map.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onMapLoadError, false, 0, true);
            this.rootClass.world.ldr_map.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.onMapLoadProgress, false, 0, true);
            this.rootClass.world.ldr_map.load(new URLRequest(_arg1));
            this.rootClass.clearPopups();
        }

        private function onMapLoadComplete(_arg1:Event):void{
            this.rootClass.world.map = MovieClip(this.rootClass.world.ldr_map.content);
            this.loadAllAssets("Enter");
            this.rootClass.world.ldr_map.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onMapLoadComplete);
            this.rootClass.world.ldr_map.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onMapLoadError);
            this.rootClass.world.ldr_map.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.onMapLoadProgress);
        }

        private function onMapLoadProgress(_arg1:ProgressEvent):void{
            var _local2:int = Math.floor(((_arg1.bytesLoaded / _arg1.bytesTotal) * 100));
            this.rootClass.mcConnDetail.showConn((("Loading Map... " + _local2) + "%"));
        }

        private function onMapLoadError(_arg1:IOErrorEvent){
            trace(("Mapload failed: " + _arg1));
            this.rootClass.world.mapLoadInProgress = false;
            this.rootClass.mcConnDetail.showError("Loading Map Files... Failed!");
        }

        private function loadAdjData():void{
            var _local1:String;
            var _local2:*;
            for (_local2 in this.Cells[this.currentCell].Connection) {
                if (_local2 != ""){
                    _local1 = this.Cells[this.currentCell].Connection[_local2].frame;
                    this.Cells[_local1].loadBuildings();
                    this.Cells[_local1].loadInteriors();
                };
            };
        }

        public function addNewFrame(_arg1:Object):void{
            var _local2:String = this.GuildMapGrid.EmptyFrame;
            if (_local2 != ""){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["addFrame", _local2, _arg1.linkage, this.currentCell, _arg1.padName, int(_arg1.buy), _arg1.iCost, _arg1.bCoins], "str", this.rootClass.world.curRoom);
            }
            else {
                this.rootClass.MsgBox.notify("You cannot buy any more land!");
            };
        }

        public function updateGuild():void{
            this.GuildMapGrid = new guildHallMap(this.Cells);
        }

        public function addBuildingToCell(_arg1:String, _arg2:String, _arg3:int):void{
            trace(("cur: " + _arg3));
            trace(("file:" + this.gInv[_arg3].sFile));
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["addBuilding", this.currentCell, _arg1, this.gInv[_arg3].ItemID], "str", this.rootClass.world.curRoom);
        }

        public function destoryBuilding(_arg1:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["removeBuilding", this.currentCell, this.Cells[this.currentCell].Buildings[("Lot" + _arg1)].lot], "str", this.rootClass.world.curRoom);
        }

        public function removeConnection(_arg1:String, _arg2:String):void{
            this.Cells[this.currentCell].removeConnection(_arg2);
            if (this.Cells[_arg1].ConnectionTotal == 1){
                delete this.Cells[_arg1];
            }
            else {
                this.Cells[_arg1].removeConnection(this.padPairs[_arg2]);
            };
            this.GuildMapGrid.buildGuildMap();
        }

        public function updateItems(_arg1:Object):void{
            this.guildItemData = _arg1;
            this.Cells["Enter"].loadInteriors();
        }

        public function updateInterior():void{
            var _local1:uint;
            this.Menu.cellChange();
            if (this.interiorMCs != null){
                _local1 = 0;
                while (_local1 < this.interiorMCs.length) {
                    this.rootClass.world.CHARS.removeChild(this.interiorMCs[_local1]);
                    _local1++;
                };
            };
            this.interiorMCs = new Array();
            if (this.currentLot != ""){
                this.Cells[this.currentCell].Buildings[this.currentLot].interior.addItems(this.rootClass.world.map.currentLabel);
            };
        }

        public function updateInventory(_arg1:Object):void{
            var _local2:*;
            var _local3:*;
            if (this.gInv == null){
                this.gInv = new Object();
            };
            for (_local2 in _arg1) {
                trace(("s: " + _local2));
                for (_local3 in _arg1[_local2]) {
                    trace(("i: " + _local3));
                    if ((((this.gInv[_local3] == null)) || ((_local2 == this.rootClass.world.myAvatar.objData.strUsername.toLowerCase())))){
                        if (_local3 != "Frames"){
                            this.gInv[_local3] = _arg1[_local2][_local3];
                            this.gInv[_local3].unm = _local2;
                        }
                        else {
                            if (_local2 == this.rootClass.world.myAvatar.objData.strUsername.toLowerCase()){
                                this.gInv[_local3] = _arg1[_local2][_local3];
                            };
                        };
                    };
                };
            };
        }

        public function handleHallUpdate(_arg1:Object):void{
            var _local2:Cell;
            var _local3:Array;
            var _local4:Array;
            var _local5:uint;
            var _local6:*;
            switch (_arg1.gCmd){
                case "addconnection":
                    this.Cells[_arg1.cellA.strCell].editCellConnection(_arg1.cellA);
                    this.Cells[_arg1.cellB.strCell].editCellConnection(_arg1.cellB);
                    this.updateGuild();
                    return;
                case "removeconnection":
                    this.Cells[_arg1.cellA.strCell].editCellConnection(_arg1.cellA);
                    if (_arg1.doDelete){
                        delete this.Cells[_arg1.cellB.strCell];
                        this.totalCells--;
                    }
                    else {
                        this.Cells[_arg1.cellB.strCell].editCellConnection(_arg1.cellB);
                    };
                    this.updateGuild();
                    return;
                case "addframe":
                    this.Cells = new Object();
                    _local3 = new Array();
                    this.totalCells = 0;
                    _local5 = 0;
                    while (_local5 < _arg1.guildHall.length) {
                        _local2 = new Cell(_arg1.guildHall[_local5], this.rootClass, this);
                        if ((((_local2.Name == "Enter")) || (!((_local2.Connection == null))))){
                            this.Cells[_local2.Name] = _local2;
                            if (_local2.Name == this.currentCell){
                                _local2.showNewConnection();
                            };
                            _local3 = _local3.concat(_local2.IntIDs);
                            this.totalCells++;
                        };
                        _local5++;
                    };
                    this.updateGuild();
                    return;
                case "addbuilding":
                    this.Cells[_arg1.Cell].updateBuildings(_arg1.Buildings);
                    return;
                case "removeBuilding":
                    this.Cells[_arg1.Cell].removeBuilding(("Lot" + String(_arg1.Lot)));
                    return;
                case "guildShop":
                    _local4 = new Array();
                    for (_local6 in this.gInv) {
                        if (_local6 != "Frames"){
                            _local4.push(this.gInv[_local6]);
                        };
                    };
                    this.Menu.openShop(_arg1.shopinfo, _local4);
                    return;
                case "buyItem":
                    if (_arg1.bitSuccess == 1){
                        this.gInv[String(_arg1.Item.ItemID)] = _arg1.Item;
                        if (_arg1.Item.bCoins == 1){
                            this.rootClass.world.myAvatar.objData.intCoins = (this.rootClass.world.myAvatar.objData.intCoins - Number(_arg1.Item.iCost));
                        }
                        else {
                            this.rootClass.world.myAvatar.objData.intGold = (this.rootClass.world.myAvatar.objData.intGold - Number(_arg1.Item.iCost));
                            this.rootClass.ui.mcPortrait.strGold.text = this.rootClass.world.myAvatar.objData.intGold;
                            if (this.rootClass.ui.mcPopup.currentLabel == "Inventory"){
                                MovieClip(this.rootClass.ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                            };
                        };
                        this.rootClass.showItemDrop(_arg1.Item, false);
                        _local4 = new Array();
                        for (_local6 in this.gInv) {
                            if (_local6 != "Frames"){
                                _local4.push(this.gInv[_local6]);
                            };
                        };
                        this.Menu.refreshShop(_local4);
                    };
                    return;
                case "buyPlot":
                    if (_arg1.bitSuccess == 1){
                        this.HallSize++;
                        this.rootClass.world.myAvatar.objData.intGold = (this.rootClass.world.myAvatar.objData.intGold - 1000);
                    };
                    return;
                case "removeItem":
                    delete this.gInv[String(_arg1.ItemID)];
                    trace(("coins: " + (_arg1.bCoins == "1")));
                    if (_arg1.bCoins == "1"){
                        this.rootClass.world.myAvatar.objData.intCoins = (this.rootClass.world.myAvatar.objData.intCoins + Number(_arg1.iCost));
                    }
                    else {
                        this.rootClass.world.myAvatar.objData.intGold = (this.rootClass.world.myAvatar.objData.intGold + Number(_arg1.iCost));
                    };
                    _local4 = new Array();
                    for (_local6 in this.gInv) {
                        if (_local6 != "Frames"){
                            _local4.push(this.gInv[_local6]);
                        };
                    };
                    this.Menu.refreshShop(_local4);
                    return;
                case "updateInterior":
                    trace("updateInterior");
                    this.Cells[_arg1.Cell].updateInterior(_arg1.interior);
                    this.updateInterior();
                    return;
            };
        }

        public function saveInterior():void{
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["saveInt", this.Cells[this.currentCell].CellIntStr, this.currentCell], "str", this.rootClass.world.curRoom);
        }

        public function destroyMenu():void{
            if (this.Menu != null){
                this.Menu.Destory();
            };
        }

        public function get GuildGrid():guildHallMap{
            return (this.GuildMapGrid);
        }

        public function get CurrentBG():MovieClip{
            return (this.Cells[this.currentCell].BgMovie);
        }

        public function get CurrentCell():String{
            return (this.currentCell);
        }

        public function getCell(_arg1:String):Cell{
            return (this.Cells[_arg1]);
        }

        public function getBuildingMCs(_arg1:String):Object{
            return (this.Cells[_arg1].Buildings);
        }

        public function hasConnection(_arg1:String):Boolean{
            return (!((this.Cells[this.currentCell].Connection[_arg1] == null)));
        }

        public function hasBuilding(_arg1:String, _arg2:String=""):Boolean{
            if (_arg2 == ""){
                return (this.Cells[this.currentCell].hasBuildingOnLot(_arg1));
            };
            return (this.Cells[_arg2].hasBuildingOnLot(_arg1));
        }

        public function getConnPad(_arg1:String):String{
            return (this.padSpawnPairs[_arg1]);
        }

        public function getPadPair(_arg1:String):String{
            return (this.padPairs[_arg1]);
        }

        public function get ItemData():Object{
            return (this.guildItemData);
        }

        public function get MCs():Array{
            return (this.interiorMCs);
        }

        public function get Inside():Boolean{
            return (this.inBuilding);
        }

        public function get bInt():Interior{
            return (this.Cells[this.currentCell].Buildings[this.currentLot].interior);
        }

        public function get Inventory():Object{
            return (this.gInv);
        }

        public function getFrame(_arg1:String):Boolean{
            if (this.gInv.Frames == null){
                return ((this.frameToBit[_arg1] == 0));
            };
            return (!(((this.gInv.Frames & Math.pow(2, this.frameToBit[_arg1])) == 0)));
        }

        public function get Links():Object{
            return (this.buildingLinks);
        }

        public function get CellTotal():int{
            return (this.totalCells);
        }

        public function get Lots():int{
            return (this.HallSize);
        }

        public function get EditMode():Boolean{
            return (this.Menu.EditMode);
        }


    }
}//package 

