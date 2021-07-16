// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//menuEditPath

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class menuEditPath extends MovieClip {

        private const frameCosts = {
            fr1:{
                iCost:0,
                bCoins:false
            },
            fr2:{
                iCost:1000,
                bCoins:false
            },
            fr3:{
                iCost:100,
                bCoins:false
            },
            fr4:{
                iCost:2000,
                bCoins:false
            },
            fr5:{
                iCost:2500,
                bCoins:false
            },
            fr6:{
                iCost:3000,
                bCoins:false
            }
        };

        private var gMap:guildHallMap;
        private var Preview:MovieClip;
        private var rootClass:MovieClip;
        private var guildRoot:MovieClip;
        private var frameObj:Object;
        private var modal:ModalMC;
        private var modalO:Object;
        private var btn:MovieClip;
        private var Parent:MovieClip;

        public function menuEditPath(_arg1:MovieClip, _arg2:MovieClip, _arg3:guildHallMap, _arg4:MovieClip, _arg5:MovieClip, _arg6:MovieClip, _arg7:Boolean){
            var connType:int;
            var mcList:MovieClip;
            var i:uint;
            var toCell:String;
            var c:Object;
            var p:MovieClip = _arg1;
            var r:MovieClip = _arg2;
            var g:guildHallMap = _arg3;
            var button:MovieClip = _arg4;
            var gr:MovieClip = _arg5;
            var par:MovieClip = _arg6;
            var Add:Boolean = _arg7;
            super();
            this.Preview = p;
            this.rootClass = r;
            this.gMap = g;
            this.guildRoot = gr;
            this.btn = button;
            this.Parent = par;
            var padName:String = ("Pad" + this.btn.name);
            if (Add){
                connType = this.gMap.canConnect(this.guildRoot.CurrentCell, ("Pad" + String(this.btn.name)));
                if (this.Preview != null){
                    this.rootClass.world.map.removeChild(this.Preview);
                    this.Preview = null;
                };
                if (connType == 1){
                    this.modal = new ModalMC();
                    this.modalO = {};
                    this.modalO.strBody = "Would you like to connect to the adjacent frame?";
                    this.modalO.params = {
                        arrow:this.btn.name,
                        toCell:this.gMap.hasAdjCell(this.guildRoot.CurrentCell, this.gMap.getPadDirection(padName))
                    };
                    this.modalO.callback = this.createConnection;
                    this.modalO.btns = "dual";
                    this.rootClass.ui.ModalStack.addChild(this.modal);
                    this.modal.init(this.modalO);
                    this.btn.removeEventListener(MouseEvent.CLICK, this.Parent.padEditClick);
                }
                else {
                    if (connType != 2){
                        if (this.guildRoot.CellTotal >= this.guildRoot.Lots){
                            this.modal = new ModalMC();
                            this.modalO = {};
                            this.modalO.strBody = "You do not own anymore land, please buy more before adding a new area.";
                            this.modalO.btns = "mono";
                            this.rootClass.ui.ModalStack.addChild(this.modal);
                            this.modal.init(this.modalO);
                            return;
                        };
                        this.frameObj = new Object();
                        this.frameObj.padName = padName;
                        this.frameObj.btn = this.btn;
                        this.Preview = (new LandPreview() as MovieClip);
                        this.Preview.imask.visible = false;
                        this.Preview.x = 300;
                        this.Preview.y = 200;
                        this.Preview.mcPreview.mask = this.Preview.cntMask;
                        this.Preview.btnAdd.visible = false;
                        this.rootClass.world.map.addChild(this.Preview);
                        this.Preview.btnAdd.addEventListener(MouseEvent.CLICK, this.addNewFrame, false, 0, true);
                        this.btn.removeEventListener(MouseEvent.CLICK, this.Parent.padEditClick);
                        i = 0;
                        while (i < this.rootClass.world.map.mapFrames.length) {
                            mcList = (new LandList() as MovieClip);
                            mcList.x = 3;
                            mcList.y = (28 + (mcList.height * i));
                            this.Preview.addChild(mcList);
                            mcList.lTxt.text = this.rootClass.world.map.mapFrames[i];
                            mcList.btn.addEventListener(MouseEvent.CLICK, this.onFrameClick, false, 0, true);
                            i = (i + 1);
                        };
                    };
                };
            }
            else {
                try {
                    toCell = this.gMap.hasAdjCell(this.guildRoot.CurrentCell, this.gMap.getPadDirection(padName));
                    trace(("toCell:" + toCell));
                    if ((((toCell == "Enter")) && ((this.guildRoot.getCell(toCell).ConnectionTotal == 1)))){
                        this.modal = new ModalMC();
                        this.modalO = {};
                        this.modalO.strBody = "You cannot remove the last connection to the guild hall enterance.";
                        this.modalO.btns = "mono";
                        this.rootClass.ui.ModalStack.addChild(this.modal);
                        this.modal.init(this.modalO);
                        return;
                    };
                    c = new Object();
                    this.gMap.mapAllCells(c, toCell, this.guildRoot.CurrentCell);
                    if ((((((c["Enter"] == null)) && ((c[this.guildRoot.CurrentCell] == null)))) && ((this.guildRoot.getCell(toCell).ConnectionTotal > 1)))){
                        this.modal = new ModalMC();
                        this.modalO = {};
                        this.modalO.strBody = "Need alternate connections first.";
                        this.modalO.btns = "mono";
                        this.rootClass.ui.ModalStack.addChild(this.modal);
                        this.modal.init(this.modalO);
                        return;
                    };
                    this.modal = new ModalMC();
                    this.modalO = {};
                    if (this.guildRoot.getCell(toCell).ConnectionTotal == 1){
                        this.modalO.strBody = "Would you like to remove this connection? Frame will be deleted as well";
                    }
                    else {
                        this.modalO.strBody = "Would you like to remove the connection?";
                    };
                    this.modalO.params = {
                        arrow:this.btn.name,
                        toCell:toCell
                    };
                    this.modalO.callback = this.destroyConnection;
                    this.modalO.btns = "dual";
                    this.rootClass.ui.ModalStack.addChild(this.modal);
                    this.modal.init(this.modalO);
                }
                catch(e) {
                    trace(e);
                };
            };
        }

        private function onFrameClick(_arg1:MouseEvent):void{
            var _local2:Class = this.rootClass.world.map.getFrame(MovieClip(_arg1.currentTarget.parent).lTxt.text);
            var _local3:MovieClip = (new (_local2)() as MovieClip);
            _local3.scaleX = (_local3.scaleY = 0.16);
            if (this.Preview.mcPreview.numChildren > 0){
                this.Preview.mcPreview.removeChild(this.Preview.mcPreview.getChildAt(0));
            };
            this.frameObj.linkage = MovieClip(_arg1.currentTarget.parent).lTxt.text;
            this.Preview.btnAdd.addTxt.text = ((this.guildRoot.getFrame(this.frameObj.linkage)) ? "Add Frame" : "Buy Frame");
            this.frameObj.buy = !(this.guildRoot.getFrame(this.frameObj.linkage));
            this.frameObj.iCost = this.frameCosts[this.frameObj.linkage].iCost;
            this.frameObj.bCoins = this.frameCosts[this.frameObj.linkage].bCoins;
            this.Preview.btnAdd.visible = true;
            this.Preview.mcPreview.addChild(_local3);
        }

        private function addNewFrame(_arg1:MouseEvent):void{
            var _local2:*;
            var _local3:*;
            if (this.frameObj.linkage == null){
                return;
            };
            if (!this.frameObj.buy){
                this.guildRoot.addNewFrame(this.frameObj);
                this.rootClass.world.map.removeChild(this.Preview);
                this.btn.addEventListener(MouseEvent.CLICK, this.Parent.padChangeClick, false, 0, true);
            }
            else {
                trace("buy frame");
                if (((((this.frameObj.bCoins) && ((this.frameObj.iCost > this.rootClass.world.myAvatar.objData.intCoins)))) || (((!(this.frameObj.bCoins)) && ((this.frameObj.iCost > this.rootClass.world.myAvatar.objData.intGold)))))){
                    this.rootClass.MsgBox.notify("Insufficient Funds!");
                }
                else {
                    _local2 = new ModalMC();
                    _local3 = {};
                    _local3.strBody = (((("Are you sure you want to buy this land for: " + this.frameObj.iCost) + " ") + ((this.frameObj.bCoins) ? "RCs" : "Gold")) + "?");
                    _local3.params = {};
                    _local3.params.Frame = this.frameObj;
                    _local3.callback = this.buyRequest;
                    this.rootClass.ui.ModalStack.addChild(_local2);
                    _local2.init(_local3);
                };
            };
        }

        public function buyRequest(_arg1:Object):void{
            if (_arg1.accept){
                this.guildRoot.addNewFrame(_arg1.Frame);
                this.rootClass.world.map.removeChild(this.Preview);
                this.btn.addEventListener(MouseEvent.CLICK, this.Parent.padChangeClick, false, 0, true);
            };
        }

        public function createConnection(_arg1:Object):void{
            var _local2:String;
            if (_arg1.accept){
                trace("creatConnection");
                trace(((((("o.arrow: " + _arg1.arrow) + " toCell: ") + _arg1.toCell) + " padName: ") + _local2));
                _local2 = ("Pad" + _arg1.arrow);
                this.Parent.togglePath(("arrow" + _arg1.arrow), true);
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["addConnection", this.guildRoot.CurrentCell, _arg1.toCell, _local2], "str", this.rootClass.world.curRoom);
                this.btn.addEventListener(MouseEvent.CLICK, this.Parent.padChangeClick, false, 0, true);
            }
            else {
                this.btn.addEventListener(MouseEvent.MOUSE_OUT, this.Parent.padEditOut, false, 0, true);
                this.btn.addEventListener(MouseEvent.MOUSE_OVER, this.Parent.padEditOver, false, 0, true);
                this.guildRoot.CurrentBG[("arrow" + _arg1.arrow)].visible = false;
                this.btn.addEventListener(MouseEvent.CLICK, this.Parent.padEditClick, false, 0, true);
            };
        }

        public function destroyConnection(_arg1:Object):void{
            var _local2:String;
            if (_arg1.accept){
                _local2 = ("Pad" + _arg1.arrow);
                this.Parent.togglePath(("arrow" + _arg1.arrow), false);
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["removeConnection", this.guildRoot.CurrentCell, _arg1.toCell, _local2], "str", this.rootClass.world.curRoom);
                this.btn.addEventListener(MouseEvent.CLICK, this.Parent.padEditClick, false, 0, true);
            }
            else {
                this.btn.addEventListener(MouseEvent.CLICK, this.Parent.padChangeClick, false, 0, true);
            };
        }

        public function Destroy():void{
            if (this.Preview != null){
                try {
                    this.rootClass.world.map.removeChild(this.Preview);
                }
                catch(e) {
                };
                this.Preview = null;
            };
        }


    }
}//package 

