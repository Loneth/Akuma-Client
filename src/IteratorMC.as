// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//IteratorMC

package {
    import flash.display.MovieClip;
    import flash.geom.ColorTransform;
    import flash.events.MouseEvent;
    import flash.display.DisplayObject;
    import flash.events.Event;

    public class IteratorMC extends MovieClip {

        var objLogin:Object;
        var mcI:MovieClip;
        var rootClass:MovieClip;
        var iCap:int = 0;
        var mHiOnCT:ColorTransform;
        var mHiPendingCT:ColorTransform;
        var eventStackCenter:int;
        var cheatArr;

        public function IteratorMC(){
            this.mHiOnCT = new ColorTransform();
            this.mHiPendingCT = new ColorTransform();
            this.cheatArr = ["/iay Artix@Battle On!", "/iteratortest", "/clear map", "/clear quest", "/clear item", "/clear shop", "/clear report", "/shutdownnow", "/shutdown"];
            super();
            trace("setting up iterator");
        }

        public function init(_arg1:MovieClip, _arg2:MovieClip, _arg3:Object){
            this.rootClass = _arg1;
            this.mcI = _arg2;
            this.mcI.cheats.cnt.iproto.visible = false;
            this.mcI.serverStack.cnt.iproto.visible = false;
            this.mcI.eventStack.cnt.iproto.visible = false;
            this.mcI.bgfx.visible = false;
            this.objLogin = _arg3;
            this.rootClass.serialCmd.servers = [];
            this.mHiOnCT.color = 39423;
            this.mHiPendingCT.color = 0xFF6600;
            this.eventStackCenter = this.mcI.eventStack.y;
            this.mcI.cmd.btnGo.addEventListener(MouseEvent.CLICK, this.submitClick, false, 0, true);
            this.mcI.cmd.btnGo.buttonMode = true;
            this.buildCheats();
            this.buildServers();
            this.initEventStack();
        }

        private function buildServers():void{
            var _local5:Object;
            var _local6:MovieClip;
            var _local1:Array = this.objLogin.servers;
            var _local2:MovieClip = this.mcI.serverStack.cnt;
            var _local3:int;
            var _local4:int;
            while (_local4 < _local1.length) {
                _local5 = _local1[_local4];
                _local6 = (_local2.addChild(new itProto()) as MovieClip);
                _local6.t1.text = _local5.sName;
                _local6.t2.text = _local5.sIP;
                _local6.t3.visible = false;
                _local6.isOn = false;
                _local6.server = _local1[_local4];
                _local6.name = ("i" + _local4);
                _local6.buttonMode = true;
                _local6.addEventListener(MouseEvent.MOUSE_DOWN, this.onServerDown, false, 0, true);
                _local6.addEventListener(MouseEvent.MOUSE_OVER, this.onServerOver, false, 0, true);
                _local6.mouseChildren = false;
                var _temp1 = _local3;
                _local3 = (_local3 + 1);
                _local6.y = (this.mcI.serverStack.cnt.iproto.y - (_temp1 * 24));
                if (_local5.sName.substr(0, 3) == "Dev"){
                    this.serverOff(_local6);
                }
                else {
                    this.serverOn(_local6);
                };
                _local4++;
            };
        }

        private function buildCheats():void{
            var _local2:MovieClip;
            var _local1:MovieClip = this.mcI.cheats.cnt;
            var _local3:int;
            while (_local3 < this.cheatArr.length) {
                _local2 = (_local1.addChild(new itCProto()) as MovieClip);
                _local2.ti.text = this.cheatArr[_local3];
                _local2.addEventListener(MouseEvent.CLICK, this.onCheatClick, false, 0, true);
                _local2.buttonMode = true;
                _local2.y = (this.mcI.cheats.cnt.iproto.y + (_local3 * 21));
                _local3++;
            };
        }

        private function initEventStack():void{
            this.mcI.eventStack.adder.addEventListener(MouseEvent.CLICK, this.onAdderClick);
            this.mcI.eventStack.adder.buttonMode = true;
        }

        private function updateEventStack():void{
            var _local3:DisplayObject;
            var _local4:int;
            var _local1:MovieClip = this.mcI.eventStack.cnt;
            var _local2:int = _local1.numChildren;
            if (_local2 > 1){
                _local4 = 1;
                while (_local4 < _local2) {
                    _local3 = _local1.getChildAt(_local4);
                    _local3.y = int((_local4 * 26));
                    _local4++;
                };
            };
        }

        private function addToEventStack():void{
            var _local1:MovieClip = this.mcI.eventStack.cnt;
            var _local2:MovieClip = _local1.iproto;
            var _local3:* = _local2.constructor;
            var _local4:MovieClip = (_local1.addChild(new itEProto()) as MovieClip);
            _local4.btnAdd.addEventListener(MouseEvent.CLICK, this.onVarAddClick, false, 0, true);
            _local4.btnDel.addEventListener(MouseEvent.CLICK, this.onVarDelClick, false, 0, true);
            _local4.btnAdd.buttonMode = true;
            _local4.btnDel.buttonMode = true;
            this.updateEventStack();
        }

        private function addVarToCmd(_arg1:String, _arg2:String, _arg3:String):void{
            var _local8:Array;
            var _local9:int;
            var _local10:Array;
            var _local4:String = this.mcI.cmd.ti.text;
            var _local5:Array = this.mcI.cmd.ti.text.split(" ");
            var _local6:Boolean;
            var _local7:Boolean;
            if ((((((_local5.length > 2)) && ((_local5[1].toLowerCase() == _arg1.toLowerCase())))) && ((_local4.indexOf("=") > -1)))){
                _local8 = _local5[2].split(",");
                _local9 = 0;
                while (_local9 < _local8.length) {
                    _local10 = _local8[_local9].split("=");
                    if (_local10[0].toLowerCase() == _arg2.toLowerCase()){
                        _local7 = true;
                        _local10[1] = _arg3;
                        _local8[_local9] = _local10.join("=");
                    };
                    _local9++;
                };
                if (!_local7){
                    _local8.push(((_arg2 + "=") + _arg3));
                };
                _local5[2] = _local8.join(",");
                this.mcI.cmd.ti.text = ((("/event " + _arg1) + " ") + _local5[2]);
            }
            else {
                this.mcI.cmd.ti.text = ((((("/event " + _arg1) + " ") + _arg2) + "=") + _arg3);
            };
        }

        private function delVarFromCmd(_arg1:String, _arg2:String, _arg3:String):void{
        }

        public function getServerItemByIP(_arg1:String):MovieClip{
            var _local3:MovieClip;
            var _local2:int = this.mcI.serverStack.cnt.numChildren;
            var _local4:int;
            while (_local4 < _local2) {
                _local3 = (this.mcI.serverStack.cnt.getChildAt(_local4) as MovieClip);
                if (((((!((_local3.name.toLowerCase() == "iproto"))) && (!((_local3.server == null))))) && ((_local3.server.sIP == _arg1)))){
                    return (_local3);
                };
                _local4++;
            };
            return (null);
        }

        private function assignActiveServers():void{
            var _local3:MovieClip;
            var _local1:int = this.mcI.serverStack.cnt.numChildren;
            this.rootClass.serialCmd.servers = [];
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = (this.mcI.serverStack.cnt.getChildAt(_local2) as MovieClip);
                if (((!((_local3.name == "iproto"))) && (_local3.isOn))){
                    this.rootClass.serialCmd.servers.push(_local3.server);
                    this.serverPending(_local3);
                };
                _local2++;
            };
        }

        private function onCheatClick(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            this.mcI.cmd.ti.text = _local2.ti.text;
        }

        private function toggleServer(_arg1:MovieClip):void{
            if (_arg1.isOn){
                this.serverOff(_arg1);
            }
            else {
                this.serverOn(_arg1);
            };
        }

        public function serverOn(_arg1:MovieClip):void{
            _arg1.isOn = true;
            _arg1.mHi.visible = true;
            _arg1.mHi.transform.colorTransform = this.mHiOnCT;
        }

        public function serverOff(_arg1:MovieClip):void{
            _arg1.isOn = false;
            _arg1.mHi.visible = false;
            _arg1.mHi.transform.colorTransform = this.mHiOnCT;
        }

        private function serverPending(_arg1:MovieClip):void{
            _arg1.mHi.visible = true;
            _arg1.mHi.transform.colorTransform = this.mHiPendingCT;
        }

        public function serversOff(_arg1:MovieClip):void{
            var _local2:Array = this.rootClass.serialCmd.servers;
            var _local3:int;
            while (_local3 < _local2.length) {
                _arg1 = this.getServerItemByIP(_local2[_local3].sIP);
                if (_arg1 != null){
                    this.serverOff(_arg1);
                };
                _local3++;
            };
        }

        private function onServerDown(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            this.toggleServer(_local2);
        }

        private function onServerOver(_arg1:MouseEvent):void{
            if (_arg1.buttonDown){
                this.serverOn((_arg1.currentTarget as MovieClip));
            };
        }

        private function onVarAddClick(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget.parent as MovieClip);
            this.addVarToCmd(_local2.t1.text, _local2.t2.text, _local2.t3.text);
        }

        private function onVarDelClick(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget.parent as MovieClip);
            _local2.btnAdd.removeEventListener(MouseEvent.CLICK, this.onVarAddClick);
            _local2.btnDel.removeEventListener(MouseEvent.CLICK, this.onVarDelClick);
            this.delVarFromCmd(_local2.t1.text, _local2.t2.text, _local2.t3.text);
            this.mcI.eventStack.cnt.removeChild(_local2);
            this.updateEventStack();
        }

        private function onAdderClick(_arg1:MouseEvent):void{
            this.addToEventStack();
        }

        private function submitClick(_arg1:MouseEvent):void{
            if (!this.rootClass.serialCmd.active){
                this.clearTimes();
                this.mcI.cmd.lastcmd.ti.text = this.mcI.cmd.ti.text;
                if (!this.mcI.cmd.lastcmd.visible){
                    this.mcI.cmd.lastcmd.visible = true;
                };
                this.assignActiveServers();
                this.rootClass.serialCmdInit(this.mcI.cmd.ti.text);
            }
            else {
                trace("serirlCmd busy!!");
            };
        }

        private function eventStackPos(_arg1:Event):void{
            if (int((this.mcI.eventStack.y + (this.mcI.eventStack.height / 2))) != this.eventStackCenter){
                this.mcI.eventStack.y = (this.mcI.eventStack.y - (((this.mcI.eventStack.y - (this.mcI.eventStack.height / 2)) - this.eventStackCenter) / 4));
                if (Math.abs(((this.mcI.eventStack.y - (this.mcI.eventStack.height / 2)) - this.eventStackCenter)) < 1){
                    this.mcI.eventStack.y = int((this.eventStackCenter + (this.mcI.eventStack.height / 2)));
                };
            };
        }

        private function clearTimes():void{
            var _local3:MovieClip;
            var _local1:int = this.mcI.serverStack.cnt.numChildren;
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = (this.mcI.serverStack.cnt.getChildAt(_local2) as MovieClip);
                if (((!((_local3.name == "iproto"))) && (_local3.isOn))){
                    _local3.t3.visible = false;
                };
                _local2++;
            };
        }


    }
}//package 

