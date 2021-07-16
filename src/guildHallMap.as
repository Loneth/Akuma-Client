// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//guildHallMap

package {
    import flash.geom.Point;

    public class guildHallMap {

        private const padDirection:Object = {
            Pad1:new Point(-1, 0),
            Pad2:new Point(-1, 1),
            Pad3:new Point(0, 1),
            Pad4:new Point(1, 1),
            Pad5:new Point(1, 0),
            Pad6:new Point(1, -1),
            Pad7:new Point(0, -1),
            Pad8:new Point(-1, -1)
        };
        private const padToLot:Object = {
            Pad2:"1",
            Pad3:"3",
            Pad4:"4"
        };

        private var guildMap:Object;
        private var Cells:Object;

        public function guildHallMap(_arg1:Object){
            this.Cells = _arg1;
            this.buildGuildMap();
        }

        private function mapConnections(_arg1:Cell):void{
            var _local2:Point;
			trace(">> JUSTINE 1");
            var _local3:*;
            if (_arg1.Connections == null){
                return;
				trace(">> JUSTINE 3");
            };
			trace(">> JUSTINE 4");
            for (_local3 in _arg1.Connections) {
				trace(">> JUSTINE 5");
                if (_local3 != ""){
					trace(">> JUSTINE 6");
                    if (this.guildMap[_arg1.Connections[_local3].frame] == null){
						trace(">> JUSTINE 7");
                        _local2 = this.guildMap[_arg1.Name].add(this.padDirection[_local3]);
						trace(">> JUSTINE 8");
                        this.guildMap[_arg1.Connections[_local3].frame] = _local2;
						trace(">> JUSTINE 9");
                        this.mapConnections(this.Cells[_arg1.Connections[_local3].frame]);
						trace(">> JUSTINE 10");
                    };
                };
            };
        }

        public function buildGuildMap():void{
            this.guildMap = new Object();
            this.guildMap["Enter"] = new Point(0, 0);
			trace("ASD");
            this.mapConnections(this.Cells["Enter"]);
			trace("ASDEF");
        }

        public function traceCellData():void{
            var _local1:*;
            for (_local1 in this.guildMap) {
                trace(((("guildMap[" + _local1) + "]: ") + this.guildMap[_local1]));
            };
        }

        public function getBGList(_arg1:String):Array{
            var _local3:int;
            var _local4:int;
            var _local5:*;
            var _local2:Array = new Array();
            for (_local5 in this.guildMap) {
                _local3 = (this.guildMap[_local5].y - this.guildMap[_arg1].y);
                _local4 = (this.guildMap[_local5].x - this.guildMap[_arg1].x);
                if ((((_local3 == 1)) && ((((_local4 >= -1)) && ((_local4 <= 1)))))){
                    _local2.push({
                        frame:_local5,
                        dir:_local4
                    });
                };
            };
            return (_local2);
        }

        public function hasAdjCell(_arg1:String, _arg2:Point):String{
            var _local3:Point;
            var _local4:*;
            for (_local4 in this.guildMap) {
                _local3 = this.guildMap[_local4].subtract(this.guildMap[_arg1]);
                if (_local3.equals(_arg2)){
                    return (_local4);
                };
            };
            return ("");
        }

        public function getAllAdjCells(_arg1:String):Array{
            var _local3:String;
            var _local4:*;
            var _local2:Array = new Array();
            for (_local4 in this.padDirection) {
                _local3 = this.hasAdjCell(_arg1, this.padDirection[_local4]);
                if (_local3 != ""){
                    _local2.push(_local3);
                };
            };
            return (_local2);
        }

        public function canConnect(_arg1:String, _arg2:String):int{
            var _local3:Point = this.padDirection[_arg2];
            var _local4:String = this.hasAdjCell(_arg1, _local3);
            if (_local4 != ""){
                if (this.Cells[_local4].hasBuildingOnLot(this.padToLot[_arg2])){
                    return (2);
                };
                return (1);
            };
            return (0);
        }

        public function getPadDirection(_arg1:String):Point{
            return (this.padDirection[_arg1]);
        }

        public function get EmptyFrame():String{
            var _local1:uint = 1;
            while (_local1 < 16) {
                if (this.guildMap[("r" + String(_local1))] == null){
                    return (("r" + String(_local1)));
                };
                _local1++;
            };
            return ("");
        }

        public function onLot(_arg1:String):String{
            return (this.padToLot[_arg1]);
        }

        public function hasAltPath(_arg1:String, _arg2:String, _arg3:String, _arg4:String=""):Boolean{
            var _local5:String;
            var _local6:*;
            trace(((((((("hasAltPath, curCell: " + _arg1) + " badCell: ") + _arg2) + " toCell: ") + _arg3) + " previous:") + _arg4));
            for (_local6 in this.Cells[_arg1].Connections) {
                _local5 = this.Cells[_arg1].Connections[_local6].frame;
                if (!(((_local5 == _arg2)) || ((_local5 == _arg4)))){
                    if (_local5 == _arg3){
                        return (true);
                    };
                    if (this.hasAltPath(_local5, _arg2, _arg3, _arg1)){
                        return (true);
                    };
                };
            };
            return (false);
        }

        public function mapAllCells(_arg1:Object, _arg2:String, _arg3:String):void{
            var _local4:String;
            var _local5:*;
            if (_arg1["Enter"] != null){
                return;
            };
            _arg1[_arg2] = true;
            for (_local5 in this.Cells[_arg2].Connections) {
                _local4 = this.Cells[_arg2].Connections[_local5].frame;
                if (_local4 != _arg3){
                    if (_arg1[_local4] == null){
                        if (this.Cells[_local4].ConnectionTotal > 1){
                            this.mapAllCells(_arg1, _local4, _arg2);
                        }
                        else {
                            _arg1[_local4] = true;
                        };
                    };
                };
            };
        }


    }
}//package 

