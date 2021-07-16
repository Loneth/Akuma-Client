// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//menuEditBuilding

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class menuEditBuilding extends MovieClip {

        private var guildRoot:MovieClip;
        private var curLot:String;
        private var Parent:MovieClip;
        private var Preview:MovieClip;
        private var buildPreviews:Object;
        private var rootClass:MovieClip;
        private var curPreview:int;
        private var pLoader:GuildLoader;
        private var modal:ModalMC;
        private var modalO:Object;
        private var scr;

        public function menuEditBuilding(_arg1:MovieClip, _arg2:String, _arg3:MovieClip, _arg4:Number, _arg5:MovieClip){
            var _local6:MovieClip;
            var _local7:Object;
            var _local8:int;
            var _local9:*;
            this.buildPreviews = new Object();
            super();
            this.Preview = _arg1;
            this.curLot = _arg2;
            this.guildRoot = _arg3;
            this.rootClass = _arg5;
            trace(("curLot: " + this.curLot));
            if (this.guildRoot.hasBuilding(this.curLot)){
                trace("has building");
                this.modal = new ModalMC();
                this.modalO = {};
                this.modalO.strBody = "Would you like to remove this building?";
                this.modalO.params = {};
                this.modalO.callback = this.destroyBuilding;
                this.modalO.btns = "dual";
                this.rootClass.ui.ModalStack.addChild(this.modal);
                this.modal.init(this.modalO);
            }
            else {
                if (this.Preview != null){
                    this.rootClass.world.map.removeChild(this.Preview);
                    this.Preview = null;
                };
                this.Preview = (new LandPreview() as MovieClip);
                this.Preview.x = 300;
                this.Preview.y = 175;
                this.Preview.cntMask.visible = false;
                this.Preview.imask.visible = false;
                this.rootClass.world.map.addChild(this.Preview);
                this.Preview.btnAdd.addEventListener(MouseEvent.CLICK, this.addNewBuilding, false, 0, true);
                this.Preview.btnAdd.addTxt.text = "Add Building";
                this.Preview.txtTitle.text = "Buildings";
                _local8 = 0;
                trace("add building list");
                this.Preview.mcItemList.mask = this.Preview.imask;
                for (_local9 in this.guildRoot.Inventory) {
                    trace(("s: " + _local9));
                    if (_local9 != "Frames"){
                        _local7 = this.guildRoot.Inventory[_local9];
                        _local6 = (new LandList() as MovieClip);
                        _local6.x = 3;
                        _local6.y = (_local6.height * _local8);
                        _local8++;
                        this.Preview.mcItemList.addChild(_local6);
                        _local6.lTxt.text = _local7.sName;
                        _local6.name = String(_local9);
                        _local6.btn.addEventListener(MouseEvent.CLICK, this.onBuildingClick, false, 0, true);
                    };
                };
            };
            this.scr = new sBar(this.Preview.scr, this.Preview.mcItemList, this.Preview.imask, this.rootClass);
        }

        private function onBuildingClick(_arg1:MouseEvent):void{
            trace("list clicked");
            trace(("name: " + MovieClip(_arg1.currentTarget.parent).name));
            if (this.Preview.mcPreview.numChildren > 0){
                this.Preview.mcPreview.removeChild(this.buildPreviews[this.guildRoot.Inventory[this.curPreview].sLink]);
            };
            this.curPreview = int(MovieClip(_arg1.currentTarget.parent).name);
            if (this.buildPreviews[this.guildRoot.Inventory[this.curPreview].sLink] == null){
                this.pLoader = new GuildLoader(this.onPreviewComplete, ((this.rootClass.getFilePath() + "maps/") + this.guildRoot.Inventory[this.curPreview].sFile), this.guildRoot.Inventory[this.curPreview].sLink, this.curPreview);
            }
            else {
                this.Preview.mcPreview.addChild(this.buildPreviews[this.guildRoot.Inventory[this.curPreview].sLink]);
            };
        }

        private function addNewBuilding(_arg1:MouseEvent):void{
            var _local2:uint;
            trace(("curLot: " + this.curLot));
            if (this.guildRoot.Links[this.guildRoot.Inventory[this.curPreview].sLink] != null){
                this.modal = new ModalMC();
                this.modalO = {};
                this.modalO.strBody = "You have already placed this building in your guild hall.";
                this.modalO.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(this.modal);
                this.modal.init(this.modalO);
                this.Destroy();
                return;
            };
            if (this.curPreview >= 0){
                if ((int(this.curLot) + this.guildRoot.Inventory[this.curPreview].iStk) > 4){
                    this.modal = new ModalMC();
                    this.modalO = {};
                    this.modalO.strBody = "There isn't enough space to place this building here.";
                    this.modalO.btns = "mono";
                    this.rootClass.ui.ModalStack.addChild(this.modal);
                    this.modal.init(this.modalO);
                    this.Destroy();
                    return;
                };
                trace(("iStk: " + this.guildRoot.Inventory[this.curPreview].iStk));
                _local2 = 0;
                while (_local2 < this.guildRoot.Inventory[this.curPreview].iStk) {
                    trace(("checking: " + ("Lot" + String((int(this.curLot) + _local2)))));
                    if (this.guildRoot.hasBuilding(String((int(this.curLot) + _local2)))){
                        this.modal = new ModalMC();
                        this.modalO = {};
                        this.modalO.strBody = "There isn't enough space to place this building here.";
                        this.modalO.btns = "mono";
                        this.rootClass.ui.ModalStack.addChild(this.modal);
                        this.modal.init(this.modalO);
                        this.Destroy();
                        return;
                    };
                    _local2++;
                };
                this.guildRoot.addBuildingToCell(this.curLot, this.guildRoot.Inventory[this.curPreview].iStk, this.curPreview);
            };
        }

        private function onPreviewComplete(_arg1:GuildLoader):void{
            trace("loaded");
            var _local2:MovieClip = MovieClip(new _arg1.swfClass());
            _local2.scaleX = (_local2.scaleY = 0.25);
            _local2.y = _local2.height;
            _local2.x = 75;
            this.buildPreviews[this.guildRoot.Inventory[this.curPreview].sLink] = _local2;
            this.Preview.mcPreview.addChild(_local2);
        }

        public function Destroy():void{
            if (this.Preview != null){
                this.rootClass.world.map.removeChild(this.Preview);
                this.Preview = null;
            };
        }

        public function destroyBuilding(_arg1:Object):void{
            if (_arg1.accept){
                this.guildRoot.destoryBuilding(this.curLot);
            };
        }


    }
}//package 

