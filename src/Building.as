// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Building

package {
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.utils.*;

    public class Building {

        private var Lot:int = -1;
        private var Linkage:String;
        private var enterPad:String;
        private var buildSize:int;
        private var strFileName:String;
        private var buildingLoader:GuildLoader;
        private var parent:Object;
        private var buildingExt:MovieClip;
        private var rootClass:MovieClip;
        private var bc:Class;
        private var buildingInterior:Interior;
        private var Setup:Boolean = false;
        private var mcBuilding:MovieClip;
        public var bLoaded:Boolean = false;
        public var bLoading:Boolean = false;
        private var checkLoad:Timer;
        private var buildingError:Boolean = false;

        public function Building(_arg1:String, _arg2:String, _arg3:Object, _arg4:MovieClip){
            this.parent = _arg3;
            this.rootClass = _arg4;
            var _local5:Array = _arg1.split(",");
            var _local6:Array = new Array();
            var _local7:uint;
            while (_local7 < _local5.length) {
                _local6 = _local5[_local7].split(":");
                switch (_local6[0]){
                    case "slot":
                        this.Lot = int(_local6[1]);
                        break;
                    case "linkage":
                        this.Linkage = _local6[1];
                        break;
                    case "pad":
                        this.enterPad = _local6[1];
                        break;
                    case "size":
                        this.buildSize = _local6[1];
                        break;
                    case "file":
                        this.strFileName = _local6[1];
                        break;
                };
                _local7++;
            };
        }

        public function loadBuildingFile():int{
            this.buildingLoader = new GuildLoader(this.onBuildLoadComplete, ((this.rootClass.getFilePath() + "maps/") + this.strFileName), this.Linkage, -1, this.onBuildLoadError);
            this.bLoading = true;
            trace((((("building: " + this.parent.Name) + " filename: ") + this.strFileName) + " setup"));
            return (1);
        }

        private function onBuildLoadComplete(_arg1:GuildLoader):void{
            this.bLoaded = true;
            this.mcBuilding = _arg1.swfContent;
            trace("adding building frames to map, update");
            this.rootClass.world.addChildAt(this.mcBuilding, 0).x = 0;
            this.buildingExt = MovieClip(new _arg1.swfClass());
            trace("file loaded and set up");
            this.parent.parent.updateBuildingLoad();
        }

        private function onBuildLoadError():void{
            trace("building load error");
            this.buildingError = true;
            this.parent.parent.updateBuildingLoad();
        }

        public function Load():void{
            if (((!(this.bLoaded)) && (!(this.buildingError)))){
                this.checkLoad = new Timer(1000, 1);
                this.checkLoad.addEventListener(TimerEvent.TIMER, this.onTimer, false, 0, true);
                this.checkLoad.start();
            };
        }

        private function onTimer(_arg1:TimerEvent):void{
            if (((this.bLoaded) && (!(this.buildingError)))){
                this.checkLoad.stop();
                this.checkLoad.removeEventListener(TimerEvent.TIMER, this.onTimer);
                this.parent.addBuildingToMap(("Lot" + String(this.Lot)));
            }
            else {
                this.checkLoad.stop();
                this.checkLoad.reset();
                this.checkLoad.start();
            };
        }

        public function get BuildingExt():MovieClip{
            return (this.buildingExt);
        }

        public function get lot():int{
            return (this.Lot);
        }

        public function get BuildingMap():MovieClip{
            return (this.mcBuilding);
        }

        public function get BuildingCopy():MovieClip{
            return ((new this.bc() as MovieClip));
        }

        public function get interior():Interior{
            return (this.buildingInterior);
        }

        public function set interior(_arg1:Interior){
            this.buildingInterior = _arg1;
        }

        public function get cellSetup():Boolean{
            return (this.Setup);
        }

        public function set cellSetup(_arg1:Boolean){
            this.Setup = _arg1;
        }

        public function get Link():String{
            return (this.Linkage);
        }

        public function get Size():int{
            return (this.buildSize);
        }


    }
}//package 

