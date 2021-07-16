// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Cell

package {
    import flash.display.MovieClip;
    import flash.filters.BlurFilter;
    import flash.utils.*;
    import flash.filters.*;

    public class Cell {

        private const Arrows:Object = {
            Pad1:"arrow1",
            Pad2:"arrow2",
            Pad3:"arrow3",
            Pad4:"arrow4",
            Pad5:"arrow5",
            Pad6:"arrow6",
            Pad7:"arrow7",
            Pad8:"arrow8"
        };

        private var cellName:String;
        private var cellLinkage:String;
        private var cellConnections:Object;
        private var incConn:int = 0;
        private var buildings:Object;
        private var mcBg:MovieClip;
        private var rootClass:MovieClip;
        private var cellSetup:Boolean = false;
        private var buildingPads:Object;
        private var loaders;
        private var lotLoading:String = "";
        private var totalConnections:int = 0;
        private var cellObjects:Interior;
        private var cellIDs:Array;
        private var ID:int = -1;
        public var parent:MovieClip;

        public function Cell(_arg1:Object, _arg2:MovieClip, _arg3:MovieClip){
            var _local5:Array;
            var _local6:Array;
            var _local7:uint;
            var _local8:*;
            var _local9:Building;
            var _local10:uint;
            this.cellConnections = new Object();
            this.buildingPads = new Object();
            this.cellIDs = new Array();
            super();
            this.buildings = new Object();
            this.rootClass = _arg2;
            this.parent = _arg3;
            this.ID = _arg1.ID;
            this.cellName = _arg1.strCell;
            this.cellLinkage = _arg1.strLinkage;
            trace(("cellName: " + this.cellName));
            if (_arg1.strConnections != null){
                _local5 = _arg1.strConnections.split("|");
                this.totalConnections = _local5.length;
                _local7 = 0;
                while (_local7 < _local5.length) {
                    _local6 = _local5[_local7].split(",");
                    this.cellConnections[_local6[0]] = {
                        frame:_local6[1],
                        pad:_local6[2]
                    };
                    _local7++;
                };
            };
            if (_arg1.strInterior == null){
                _arg1.strInterior = "|||";
            };
            var _local4:Array = _arg1.strInterior.split("|");
            trace(("interiors: " + _local4));
            if (((!((_arg1.strBuildings == null))) && (!((_arg1.strBuildings == ""))))){
                _local8 = _arg1.strBuildings.split("|");
                _local10 = 0;
                while (_local10 < _local8.length) {
                    _local9 = new Building(_local8[_local10], "", this, this.rootClass);
                    this.buildings[("Lot" + String(_local9.lot))] = _local9;
                    this.checkSize(_local9);
                    this.parent.Links[_local9.Link] = true;
                    _local9.interior = new Interior(_local4[(_local9.lot - 1)], this.rootClass, this.parent);
                    _local10++;
                };
            };
        }

        private function checkSize(_arg1:Building){
            switch (_arg1.Size){
                case 2:
                    this.buildings[("Lot" + String((_arg1.lot + 1)))] = _arg1;
                    return;
                case 3:
                    this.buildings[("Lot" + String((_arg1.lot + 1)))] = _arg1;
                    this.buildings[("Lot" + String((_arg1.lot + 2)))] = _arg1;
                    return;
                case 4:
                    this.buildings[("Lot" + String((_arg1.lot + 1)))] = _arg1;
                    this.buildings[("Lot" + String((_arg1.lot + 2)))] = _arg1;
                    this.buildings[("Lot" + String((_arg1.lot + 3)))] = _arg1;
                    return;
            };
        }

        private function createBgMovie():void{
            var _local2:*;
            var _local1:Class = this.rootClass.world.map.getFrame(this.cellLinkage);
            this.mcBg = (new (_local1)() as MovieClip);
            for (_local2 in this.Arrows) {
                try {
                    if (this.cellConnections[_local2] == null){
                        if ((((_local2 == "Pad1")) || ((_local2 == "Pad5")))){
                            this.mcBg[this.Arrows[_local2]].visible = true;
                        }
                        else {
                            this.mcBg[this.Arrows[_local2]].visible = false;
                        };
                    }
                    else {
                        if ((((_local2 == "Pad1")) || ((_local2 == "Pad5")))){
                            this.mcBg[this.Arrows[_local2]].visible = false;
                        };
                    };
                }
                catch(e) {
                };
            };
            this.displayBuildings();
        }

        public function displayBuildings():void{
            var _local1:*;
            for (_local1 in this.buildings) {
                if (!this.buildings[_local1].bLoaded){
                    this.buildings[_local1].Load();
                }
                else {
                    this.addBuildingToMap(_local1);
                };
            };
        }

        public function addBuildingToMap(_arg1:String):void{
            var _local2:MovieClip = this.buildings[_arg1].BuildingExt;
            _local2.x = ((240 * (this.buildings[_arg1].lot - 1)) + (_local2.width >> 1));
            trace(("m.x: " + _local2.x));
            _local2.y = 275;
            if (!this.buildings[_arg1].cellSetup){
                this.buildingSetup(_local2, this.buildings[_arg1].lot);
                this.buildings[_arg1].cellSetup = true;
            };
            trace(("m: " + _local2));
            trace("adding building");
            this.mcBg.addChild(_local2);
        }

        private function addBackgroundBuilding(_arg1:guildHallMap):void{
            var _local2:Object;
            var _local3:MovieClip;
            var _local5:BlurFilter;
            var _local8:*;
            var _local4:Array = _arg1.getBGList(this.cellName);
            var _local6:Array = new Array(5, 325, 645);
            var _local7:uint;
            while (_local7 < _local4.length) {
                _local2 = this.parent.getBuildingMCs(_local4[_local7].frame);
                for (_local8 in _local2) {
                    _local3 = (this.mcBg.addChildAt(_local2[_local8].BuildingCopy, (this.mcBg.numChildren - 2)) as MovieClip);
                    _local5 = new BlurFilter();
                    _local5.quality = 3;
                    _local5.blurX = 1.25;
                    _local5.blurY = 1.25;
                    _local3.scaleX = (_local3.scaleY = 0.45);
                    _local3.y = 150;
                    _local3.x = (_local6[(_local4[_local7].dir + 1)] + (77.5 * (_local2[_local8].lot - 1)));
                    _local3.filters = [_local5];
                };
                _local7++;
            };
        }

        public function loadBuildings():int{
            var _local2:*;
            trace("loading buildings");
            trace(("buildings: " + this.buildings));
            var _local1:int;
            for (_local2 in this.buildings) {
                trace(((("loading building: " + _local2) + " loaded: ") + this.buildings[_local2].bLoaded));
                if (((!(this.buildings[_local2].bLoaded)) && (!(this.buildings[_local2].bLoading)))){
                    _local1 = (_local1 + this.buildings[_local2].loadBuildingFile());
                };
            };
            trace(("returning loaders: " + _local1));
            return (_local1);
        }

        private function buildingSetup(_arg1:MovieClip, _arg2:int, _arg3:Boolean=false):void{
            var _local4:MovieClip;
            var _local5:Class;
            var _local6:MovieClip;
            var _local7:*;
            for (_local7 in _arg1.pads) {
                _local5 = this.rootClass.world.map.getFrame("GotoCell");
                _local4 = (new (_local5)() as MovieClip);
                _local4.x = (_arg1.x + _arg1.pads[_local7].X);
                _local4.y = (275 + _arg1.pads[_local7].Y);
                _local4.height = _arg1.pads[_local7].H;
                _local4.width = _arg1.pads[_local7].W;
                this.mcBg.addChild(_local4);
                _local4.name = (("Lot" + String(_arg2)) + _arg1.pads[_local7].padName);
                this.buildingPads[_local4.name] = {
                    Lot:("Lot" + String(_arg2)),
                    Frame:_arg1.pads[_local7].strFrame,
                    Pad:_arg1.pads[_local7].strPad
                };
                if (_arg3){
                    this.rootClass.world.arrEvent.push(MovieClip(_local4));
                };
            };
        }

        public function editCellConnection(_arg1:Object):void{
            var cellConn:Array;
            var connInfo:Array;
            var i:uint;
            var s:* = undefined;
            var c:Object = _arg1;
            trace("editCellConnection");
            this.cellConnections = new Object();
            if (c.strConnections != null){
                cellConn = c.strConnections.split("|");
                this.totalConnections = cellConn.length;
                i = 0;
                while (i < cellConn.length) {
                    connInfo = cellConn[i].split(",");
                    this.cellConnections[connInfo[0]] = {
                        frame:connInfo[1],
                        pad:connInfo[2]
                    };
                    i = (i + 1);
                };
            };
            trace(((("cellName: " + this.cellName) + " CurrentCell: ") + this.parent.CurrentCell));
            if (this.cellName == this.parent.CurrentCell){
                for (s in this.Arrows) {
                    try {
                        if (this.cellConnections[s] == null){
                            trace(("s: " + s));
                            if ((((s == "Pad1")) || ((s == "Pad5")))){
                                this.mcBg[this.Arrows[s]].visible = true;
                            }
                            else {
                                this.mcBg[this.Arrows[s]].visible = false;
                            };
                            trace(((("mcBg[Arrows[" + s) + "]].visible: ") + this.mcBg[this.Arrows[s]].visible));
                        }
                        else {
                            if ((((s == "Pad1")) || ((s == "Pad5")))){
                                this.mcBg[this.Arrows[s]].visible = false;
                            };
                        };
                    }
                    catch(e) {
                        trace(e);
                    };
                };
            }
            else {
                this.mcBg = null;
            };
        }

        public function removeConnection(_arg1:String):void{
            delete this.cellConnections[_arg1];
            this.totalConnections--;
        }

        public function updateBuildings(_arg1:String):void{
            var _local3:Building;
            trace("updateBuilding");
            var _local2:Array = _arg1.split("|");
            var _local4:uint;
            while (_local4 < _local2.length) {
                _local3 = new Building(_local2[_local4], "", this, this.rootClass);
                if (this.buildings[("Lot" + String(_local3.lot))] == null){
                    this.buildings[("Lot" + String(_local3.lot))] = _local3;
                    this.checkSize(_local3);
                };
                _local3.interior = new Interior("", this.rootClass, this.parent);
                trace(((("cellName: " + this.cellName) + " currentCell: ") + this.parent.CurrentCell));
                if (this.cellName == this.parent.CurrentCell){
                    this.lotLoading = ("Lot" + String(_local3.lot));
                    this.parent.Links[_local3.Link] = true;
                    _local3.loadBuildingFile();
                    this.addBuildingToFrame();
                };
                _local4++;
            };
        }

        private function addBuildingToFrame():void{
            trace("addBuildingToFrame");
            if (this.buildings[this.lotLoading].bLoaded){
                this.addBuildingToMap(this.lotLoading);
            }
            else {
                this.buildings[this.lotLoading].Load();
            };
        }

        public function removeBuilding(_arg1:String):void{
            var _local3:MovieClip;
            var _local4:*;
            var _local5:Building;
            var _local2:MovieClip = this.buildings[_arg1].BuildingExt;
            for (_local4 in _local2.pads) {
                this.mcBg.removeChild(this.mcBg.getChildByName((_arg1 + _local2.pads[_local4].padName)));
            };
            this.rootClass.world.removeChild(this.buildings[_arg1].BuildingMap);
            this.mcBg.removeChild(_local2);
            delete this.parent.Links[this.buildings[_arg1].Link];
            _local5 = this.buildings[_arg1];
            for (_local4 in this.buildings) {
                if (this.buildings[_local4] == _local5){
                    delete this.buildings[_local4];
                };
            };
            this.rootClass.world.cellSetup(0.8, 8, "normal");
        }

        public function loadInteriors():void{
            var _local1:*;
            for (_local1 in this.buildings) {
                if (this.buildings[_local1].interior != null){
                    this.buildings[_local1].interior.loadAllItems();
                };
            };
        }

        public function showNewConnection():void{
            var _local1:*;
            for (_local1 in this.Arrows) {
                try {
                    if (this.cellConnections[_local1] == null){
                        if ((((_local1 == "Pad1")) || ((_local1 == "Pad5")))){
                            this.mcBg[this.Arrows[_local1]].visible = true;
                        }
                        else {
                            this.mcBg[this.Arrows[_local1]].visible = false;
                        };
                    }
                    else {
                        if ((((_local1 == "Pad1")) || ((_local1 == "Pad5")))){
                            this.mcBg[this.Arrows[_local1]].visible = false;
                        };
                    };
                }
                catch(e) {
                };
            };
        }

        public function updateInterior(_arg1:String):void{
            var _local3:*;
            var _local2:Array = _arg1.split("|");
            for (_local3 in this.buildings) {
                this.buildings[_local3].interior = new Interior(_local2[(this.buildings[_local3].lot - 1)], this.rootClass, this.parent);
                this.buildings[_local3].interior.loadAllItems();
            };
        }

        public function get Name():String{
            return (this.cellName);
        }

        public function get Connections():Object{
            return (this.cellConnections);
        }

        public function get BgMovie():MovieClip{
            if (this.mcBg == null){
                this.createBgMovie();
            };
            return (this.mcBg);
        }

        public function get Buildings():Object{
            return (this.buildings);
        }

        public function get ConnectionTotal():int{
            return (this.totalConnections);
        }

        public function hasBuildingOnLot(_arg1:String):Boolean{
            return ((((_arg1)==null) ? false : !((this.buildings[("Lot" + _arg1)] == null))));
        }

        public function getBuildingMC(_arg1:String):MovieClip{
            return (this.buildings[_arg1].BuildingMap);
        }

        public function getHousePad(_arg1:String):Object{
            return (this.buildingPads[_arg1]);
        }

        public function get Connection():Object{
            return (this.cellConnections);
        }

        public function get IntIDs():Array{
            var _local2:*;
            var _local1:Array = new Array();
            _local1 = _local1.concat(this.cellIDs);
            for (_local2 in this.buildings) {
                _local1 = _local1.concat(this.buildings[_local2].interior.IDs);
            };
            trace(("a: " + _local1));
            return (_local1);
        }

        public function get CellIntStr():String{
            var _local1 = "";
            trace("line 297");
            var _local2:uint = 1;
            while (_local2 < 5) {
                trace(("lot: " + String(_local2)));
                if (((!((this.buildings[("Lot" + String(_local2))] == null))) && (!((this.buildings[("Lot" + String(_local2))] == this.buildings[("Lot" + String((_local2 - 1)))]))))){
                    _local1 = ((_local1 + this.buildings[("Lot" + String(_local2))].interior.IntStr) + "|");
                }
                else {
                    _local1 = (_local1 + "|");
                };
                trace(("s: " + _local1));
                _local2++;
            };
            _local1 = _local1.substr(0, (_local1.length - 1));
            return (_local1);
        }


    }
}//package 

