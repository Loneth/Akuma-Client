// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//PVPPanelMC

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;

    public class PVPPanelMC extends MovieClip {

        public var btnClose:SimpleButton;
        public var cnt:MovieClip;
        private var rootClass:MovieClip;
        private var world:MovieClip;
        private var mcPopup:MovieClip;
        private var nextMode:String;
        private var uoLeaf:Object;
        private var uoData:Object;
        private var itemSel:MovieClip;
        private var pending:Boolean = false;

        public function PVPPanelMC():void{
            rootClass = (stage.getChildAt(0) as MovieClip);
            world = (rootClass.world as MovieClip);
            mcPopup = rootClass.ui.mcPopup;
            uoLeaf = world.myLeaf();
            uoData = world.myAvatar.objData;
            super();
            addFrameScript(0, frame1, 4, frame5, 11, frame12, 24, frame25, 29, frame30, 36, frame37, 49, frame50);
            btnClose.addEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick, false, 0, true);
        }

        public function openWith(_arg1:Object):void{
            nextMode = _arg1.typ;
            if (isValidMode(nextMode)){
                if (((!((this.currentLabel == "init"))) && ((this.currentLabel.indexOf("-out") < 0)))){
                    this.gotoAndPlay((this.currentLabel + "-out"));
                }
                else {
                    this.gotoAndPlay(nextMode);
                };
            };
        }

        public function fClose():void{
            killCurrentListeners();
        }

        private function playNextMode():void{
            killCurrentListeners();
            this.gotoAndPlay(nextMode);
        }

        private function isValidMode(_arg1:String):Boolean{
            var _local2:Boolean;
            var _local3:int;
            while ((((_local3 < this.currentLabels.length)) && (!(_local2)))) {
                if (this.currentLabels[_local3].name == _arg1){
                    _local2 = true;
                };
                _local3++;
            };
            return (_local2);
        }

        private function update():void{
            if (MovieClip(this).currentLabel == "maps"){
                updateMaps();
            };
            if (MovieClip(this).currentLabel == "results"){
                updateResults();
            };
        }

        private function updateMaps():void{
            var _local1:Object;
            var _local2:MovieClip;
            _local1 = {};
            while (cnt.iList.numChildren > 1) {
                cnt.iList.removeChildAt(1);
            };
            var _local3:int;
            var _local4:int;
            while (_local4 < world.PVPMaps.length) {
                _local1 = world.PVPMaps[_local4];
                if (!_local1.hidden){
                    _local2 = cnt.iList.addChild(new pvpProto());
                    _local2.t1.ti.text = _local1.nam;
                    _local2.t2.ti.text = _local1.desc;
                    _local2.icon.gotoAndStop(_local1.icon);
                    _local2.y = (_local3 * 55);
                    _local2.iSel = false;
                    _local2.iHi = false;
                    _local2.label = _local1.label;
                    _local2.warzone = _local1.warzone;
                    _local2.hit.alpha = 0;
                    _local2.hit.buttonMode = true;
                    _local2.hit.addEventListener(MouseEvent.CLICK, onMapItemClick, false, 0, true);
                    _local2.hit.addEventListener(MouseEvent.MOUSE_OVER, onMapItemOver, false, 0, true);
                    _local2.hit.addEventListener(MouseEvent.MOUSE_OUT, onMapItemOut, false, 0, true);
                    _local3++;
                };
                _local4++;
            };
            cnt.iList.iproto.visible = false;
            cnt.body.bJoin.addEventListener(MouseEvent.MOUSE_DOWN, btnJoinClick, false, 0, true);
            cnt.body.bExit.addEventListener(MouseEvent.MOUSE_DOWN, btnExitClick, false, 0, true);
            cnt.body.bJoin.visible = false;
            cnt.body.bExit.visible = false;
            cnt.body.msg.visible = false;
            cnt.body.gotoAndPlay("init");
        }

        private function updateResults():void{
            var _local1:Object = world.PVPResults;
            var _local2:int = _local1.team;
            if (_local2 == world.myAvatar.dataLeaf.pvpTeam){
                cnt.outlineV.visible = true;
                cnt.outlineL.visible = false;
            }
            else {
                cnt.outlineV.visible = false;
                cnt.outlineL.visible = true;
            };
            if (world.PVPFactions.length == 0){
                cnt.ti.text = (("Team " + ["A", "B"][_local2]) + " won!");
            }
            else {
                cnt.ti.text = (("The " + world.PVPFactions[_local2].sName) + " team won!");
            };
            cnt.btnBack.addEventListener(MouseEvent.CLICK, btnBackClick, false, 0, true);
        }

        private function onMapItemClick(_arg1:MouseEvent):void{
            var _local3:MovieClip;
            var _local2:MovieClip = (_arg1.currentTarget.parent as MovieClip);
            _local2.iHi = false;
            if (!_local2.iSel){
                itemSel = _local2;
                _local2.iSel = true;
                _local2.gotoAndPlay("in2");
            };
            var _local4:int = 1;
            while (_local4 < cnt.iList.numChildren) {
                _local3 = (cnt.iList.getChildAt(_local4) as MovieClip);
                if (_local3 != _local2){
                    if (_local3.iSel){
                        _local3.gotoAndPlay("out2");
                    };
                    if (_local3.iHi){
                        _local3.gotoAndPlay("out1");
                    };
                    _local3.iSel = false;
                    _local3.iHi = false;
                };
                _local4++;
            };
            cnt.body.gotoAndStop(_local2.label);
        }

        private function onMapItemOver(_arg1:MouseEvent):void{
            var _local3:MovieClip;
            var _local2:MovieClip = (_arg1.currentTarget.parent as MovieClip);
            if (((!(_local2.iHi)) && (!(_local2.iSel)))){
                _local2.iHi = true;
                _local2.gotoAndPlay("in1");
            };
            var _local4:int = 1;
            while (_local4 < cnt.iList.numChildren) {
                _local3 = (cnt.iList.getChildAt(_local4) as MovieClip);
                if (_local3 != _local2){
                    if (((_local3.iHi) && (!(_local3.iSel)))){
                        _local3.gotoAndPlay("out1");
                    };
                    _local3.iHi = false;
                };
                _local4++;
            };
        }

        private function onMapItemOut(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget.parent as MovieClip);
            if (((_local2.iHi) && (!(_local2.iSel)))){
                _local2.iHi = false;
                _local2.gotoAndPlay("out1");
            };
        }

        public function updateBody():void{
            var _local1:MovieClip = cnt.body;
            if (pending){
                pending = false;
            };
            if (itemSel.warzone != world.PVPQueue.warzone){
                _local1.bJoin.visible = true;
                _local1.msg.visible = false;
                _local1.bExit.visible = false;
            }
            else {
                _local1.bJoin.visible = false;
                _local1.msg.visible = true;
                _local1.bExit.visible = true;
            };
        }

        private function killCurrentListeners():void{
            if (this.currentLabel == "maps"){
                cnt.body.bJoin.removeEventListener(MouseEvent.MOUSE_DOWN, btnJoinClick);
                cnt.body.bExit.removeEventListener(MouseEvent.MOUSE_DOWN, btnExitClick);
            };
            if (this.currentLabel == "results"){
                cnt.btnBack.removeEventListener(MouseEvent.CLICK, btnBackClick);
            };
            btnClose.removeEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick);
        }

        private function btnCloseClick(_arg1:MouseEvent=null):void{
            mcPopup.onClose();
        }

        private function btnJoinClick(_arg1:MouseEvent):void{
            if (!pending){
                pending = true;
                world.requestPVPQueue(itemSel.warzone);
            };
        }

        private function btnExitClick(_arg1:MouseEvent):void{
            if (!pending){
                pending = true;
                world.requestPVPQueue("none");
            };
        }

        private function btnBackClick(_arg1:MouseEvent):void{
            world.gotoTown("Faroff", "Enter", "Spawn");
            mcPopup.onClose();
        }

        function frame1(){
            openWith(MovieClip(parent).fData);
        }

        function frame5(){
            update();
        }

        function frame12(){
            stop();
        }

        function frame25(){
            playNextMode();
        }

        function frame30(){
            update();
        }

        function frame37(){
            stop();
        }

        function frame50(){
            playNextMode();
        }


    }
}//package 

