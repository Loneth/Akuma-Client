// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//OFrameMC

package {
    import flash.display.MovieClip;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.geom.ColorTransform;
    import flash.text.*;

    public class OFrameMC extends MovieClip {

        public var t1:MovieClip;
        public var cntMask:MovieClip;
        public var bg:MovieClip;
        var world:MovieClip;
        var rootClass:MovieClip;
        public var fData:Object = null;
        var uli:int;
        var isOpen:Boolean = false;
        var mc:MovieClip;
        var tcnt:MovieClip;
        var mDown:Boolean = false;
        var hRun:int = 0;
        var dRun:int = 0;
        var mbY:int = 0;
        var mhY:int = 0;
        var mbD:int = 0;

        public function OFrameMC(){
            addFrameScript(0, frame1, 4, frame5, 9, frame10);
            mc = MovieClip(this);
            rootClass = MovieClip(stage.getChildAt(0));
        }

        public function fOpenWith(_arg1){
            fData = _arg1;
            isOpen = true;
            clearCnt();
            if (mc.currentLabel != "Idle"){
                mc.gotoAndPlay("Open");
            }
            else {
                update();
            };
        }

        public function fClose(){
            isOpen = false;
            fData = {};
            clearCnt();
            if (mc.currentLabel != "Init"){
                if (mc.currentLabel == "Idle"){
                    mc.gotoAndPlay("Close");
                }
                else {
                    mc.gotoAndStop("Init");
                };
            };
        }

        public function update(){
            var _local1:String;
            var _local2:Class;
            var _local3:MovieClip;
            var _local4:Class;
            var _local5:Object;
            var _local8:String;
            var _local9:MovieClip;
            var _local10:MovieClip;
            var _local11:MovieClip;
            clearCnt();
            var _local6:int;
            var _local7:int;
            switch (fData.typ){
                case "userListA":
                    _local1 = "mcUListA";
                    _local2 = (getDefinitionByName(_local1) as Class);
                    _local3 = (mc.addChild(new (_local2)()) as MovieClip);
                    _local3.name = "cnt";
                    _local3.x = 10;
                    _local3.y = ((t1.y + t1.height) + 4);
                    _local3.mask = cntMask;
                    _local3.scr.buttonMode = true;
                    t1.txtTitle.text = "Users in your area";
                    t1.txtSubTitle.text = "/who";
                    _local6 = 0;
                    tcnt = MovieClip(mc.getChildByName("cnt"));
                    tcnt.strMeta.text = "Class";
                    for (_local8 in fData.ul) {
                        _local5 = tcnt.cnt.addChild(new mcUListAItem());
                        _local5.ID = fData.ul[_local8].ID;
                        _local5.txtName.text = fData.ul[_local8].sName;
                        _local5.txtMeta.htmlText = fData.ul[_local8].sClass;
                        _local5.txtLevel.text = fData.ul[_local8].iLvl;
                        _local5.addEventListener(MouseEvent.CLICK, uNameClick, false, 0, true);
                        _local5.buttonMode = true;
                        _local5.y = (_local6 * 20);
                        _local6++;
                    };
                    _local9 = tcnt.scr;
                    if (tcnt.cnt.height < tcnt.cntMask.height){
                        _local9.visible = false;
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.cntMask.width / 2)));
                    }
                    else {
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.width / 2)));
                        _local10 = tcnt.cntMask;
                        _local11 = tcnt.cnt;
                        _local9.visible = true;
                        _local9.h.height = int(((_local10.height / _local11.height) * _local9.b.height));
                        hRun = (_local9.b.height - _local9.h.height);
                        dRun = ((_local11.height - _local10.height) + 5);
                        _local9.h.y = 0;
                        _local11.oy = (_local11.y = _local9.y);
                        _local9.visible = false;
                        _local9.hit.alpha = 0;
                        mDown = false;
                        if (_local11.height > _local9.b.height){
                            _local9.visible = true;
                            _local9.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
                            _local9.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                            _local11.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
                        };
                    };
                    tcnt.cnt.iproto.visible = false;
                    break;
				case "userListPK":
                    _local1 = "mcUListA";
                    _local2 = (getDefinitionByName(_local1) as Class);
                    _local3 = (mc.addChild(new (_local2)()) as MovieClip);
                    _local3.name = "cnt";
                    _local3.x = 10;
                    _local3.y = ((t1.y + t1.height) + 4);
                    _local3.mask = cntMask;
                    _local3.scr.buttonMode = true;
                    t1.txtTitle.text = "Player Kills";
                    t1.txtSubTitle.text = "/playerkills";
                    _local6 = 0;
                    tcnt = MovieClip(mc.getChildByName("cnt"));
                    tcnt.strMeta.text = "Bounty";
                    _local7 = 0;
                    while (_local7 < fData.ul.length) {
                        _local5 = tcnt.cnt.addChild(new mcUListAItem());
                        _local5.ID = fData.ul[_local7].ID;
                        _local5.txtName.text = fData.ul[_local7].sName;
                        _local5.txtMeta.text = fData.ul[_local7].iBounty;
                        _local5.txtLevel.text = fData.ul[_local7].iLvl;
                        _local5.addEventListener(MouseEvent.CLICK, uNameClick, false, 0, true);
                        _local5.buttonMode = true;
                        _local5.y = (_local6 * 20);
                        _local6++;
                        /*if (fData.ul[_local7].sServer == "Offline"){
                            _local5.transform.colorTransform = new ColorTransform(1, 1, 1, 1, -100, -100, -100, 0);
                        };
						*/
                        _local7++;
                    };
                    _local9 = tcnt.scr;
                    if (tcnt.cnt.height < tcnt.cntMask.height){
                        _local9.visible = false;
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.cntMask.width / 2)));
                    }
                    else {
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.width / 2)));
                        _local10 = tcnt.cntMask;
                        _local11 = tcnt.cnt;
                        _local9.visible = true;
                        _local9.h.height = int(((_local10.height / _local11.height) * _local9.b.height));
                        hRun = (_local9.b.height - _local9.h.height);
                        dRun = ((_local11.height - _local10.height) + 5);
                        _local9.h.y = 0;
                        _local11.oy = (_local11.y = _local9.y);
                        _local9.visible = false;
                        _local9.hit.alpha = 0;
                        mDown = false;
                        if (_local11.height > _local9.b.height){
                            _local9.visible = true;
                            _local9.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
                            _local9.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                            _local11.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
                        };
                    };
                    tcnt.cnt.iproto.visible = false;
                    break;
                case "userListFriends":
                    _local1 = "mcUListA";
                    _local2 = (getDefinitionByName(_local1) as Class);
                    _local3 = (mc.addChild(new (_local2)()) as MovieClip);
                    _local3.name = "cnt";
                    _local3.x = 10;
                    _local3.y = ((t1.y + t1.height) + 4);
                    _local3.mask = cntMask;
                    _local3.scr.buttonMode = true;
                    t1.txtTitle.text = "Friends List";
                    t1.txtSubTitle.text = "/friends";
                    _local6 = 0;
                    tcnt = MovieClip(mc.getChildByName("cnt"));
                    tcnt.strMeta.text = "Server";
                    _local7 = 0;
                    while (_local7 < fData.ul.length) {
                        _local5 = tcnt.cnt.addChild(new mcUListAItem());
                        _local5.ID = fData.ul[_local7].ID;
                        _local5.txtName.text = fData.ul[_local7].sName;
                        _local5.txtMeta.text = fData.ul[_local7].sServer;
                        _local5.txtLevel.text = fData.ul[_local7].iLvl;
                        _local5.addEventListener(MouseEvent.CLICK, uNameClick, false, 0, true);
                        _local5.buttonMode = true;
                        _local5.y = (_local6 * 20);
                        _local6++;
                        if (fData.ul[_local7].sServer == "Offline"){
                            _local5.transform.colorTransform = new ColorTransform(1, 1, 1, 1, -100, -100, -100, 0);
                        };
                        _local7++;
                    };
                    _local9 = tcnt.scr;
                    if (tcnt.cnt.height < tcnt.cntMask.height){
                        _local9.visible = false;
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.cntMask.width / 2)));
                    }
                    else {
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.width / 2)));
                        _local10 = tcnt.cntMask;
                        _local11 = tcnt.cnt;
                        _local9.visible = true;
                        _local9.h.height = int(((_local10.height / _local11.height) * _local9.b.height));
                        hRun = (_local9.b.height - _local9.h.height);
                        dRun = ((_local11.height - _local10.height) + 5);
                        _local9.h.y = 0;
                        _local11.oy = (_local11.y = _local9.y);
                        _local9.visible = false;
                        _local9.hit.alpha = 0;
                        mDown = false;
                        if (_local11.height > _local9.b.height){
                            _local9.visible = true;
                            _local9.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
                            _local9.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                            _local11.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
                        };
                    };
                    tcnt.cnt.iproto.visible = false;
                    break;
                case "userListGuild":
                    _local1 = "mcUListA";
                    _local2 = (getDefinitionByName(_local1) as Class);
                    _local3 = (mc.addChild(new (_local2)()) as MovieClip);
                    _local3.name = "cnt";
                    _local3.x = 10;
                    _local3.y = ((t1.y + t1.height) + 4);
                    _local3.mask = cntMask;
                    _local3.scr.buttonMode = true;
                    t1.txtTitle.text = "Guild Members";
                    t1.txtSubTitle.text = "/guild";
                    _local6 = 0;
                    tcnt = MovieClip(mc.getChildByName("cnt"));
                    tcnt.strMeta.text = "Server";
                    _local7 = 0;
                    while (_local7 < fData.ul.length) {
                        trace(((((("username: " + fData.ul[_local7].userName) + " server: ") + fData.ul[_local7].Rank) + " Level: ") + fData.ul[_local7].Level));
                        _local5 = tcnt.cnt.addChild(new mcUListAItem());
                        _local5.ID = fData.ul[_local7].ID;
                        _local5.txtName.text = fData.ul[_local7].userName;
                        _local5.txtMeta.text = fData.ul[_local7].Server;
                        _local5.txtLevel.text = fData.ul[_local7].Level;
                        _local5.addEventListener(MouseEvent.CLICK, uNameClick, false, 0, true);
                        _local5.buttonMode = true;
                        _local5.y = (_local6 * 20);
                        _local6++;
                        if (fData.ul[_local7].sServer == "Offline"){
                            _local5.transform.colorTransform = new ColorTransform(1, 1, 1, 1, -100, -100, -100, 0);
                        };
                        _local7++;
                    };
                    _local9 = tcnt.scr;
                    if (tcnt.cnt.height < tcnt.cntMask.height){
                        _local9.visible = false;
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.cntMask.width / 2)));
                    }
                    else {
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.width / 2)));
                        _local10 = tcnt.cntMask;
                        _local11 = tcnt.cnt;
                        _local9.visible = true;
                        _local9.h.height = int(((_local10.height / _local11.height) * _local9.b.height));
                        hRun = (_local9.b.height - _local9.h.height);
                        dRun = ((_local11.height - _local10.height) + 5);
                        _local9.h.y = 0;
                        _local11.oy = (_local11.y = _local9.y);
                        _local9.visible = false;
                        _local9.hit.alpha = 0;
                        mDown = false;
                        if (_local11.height > _local9.b.height){
                            _local9.visible = true;
                            _local9.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
                            _local9.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                            _local11.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
                        };
                    };
                    tcnt.cnt.iproto.visible = false;
                    break;
                case "userListIgnore":
                    _local1 = "mcUListB";
                    _local2 = (getDefinitionByName(_local1) as Class);
                    _local3 = (mc.addChild(new (_local2)()) as MovieClip);
                    _local3.name = "cnt";
                    _local3.x = 10;
                    _local3.y = ((t1.y + t1.height) + 4);
                    _local3.mask = cntMask;
                    _local3.scr.buttonMode = true;
                    t1.txtTitle.text = "Ignore List";
                    t1.txtSubTitle.text = "";
                    _local6 = 0;
                    tcnt = MovieClip(mc.getChildByName("cnt"));
                    fData.ul = [];
                    for each (_local8 in rootClass.chatF.ignoreList.data.users) {
                        fData.ul.push({sName:_local8});
                    };
                    _local7 = 0;
                    while (_local7 < fData.ul.length) {
                        _local5 = tcnt.cnt.addChild(new mcUListBItem());
                        _local5.txtName.text = fData.ul[_local7].sName;
                        _local5.addEventListener(MouseEvent.CLICK, uNameClick, false, 0, true);
                        _local5.buttonMode = true;
                        _local5.y = (_local6 * 20);
                        _local6++;
                        _local7++;
                    };
                    _local9 = tcnt.scr;
                    if (tcnt.cnt.height < tcnt.cntMask.height){
                        _local9.visible = false;
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.cntMask.width / 2)));
                    }
                    else {
                        _local3.x = int(((mc.bg.x + (mc.bg.width / 2)) - (_local3.width / 2)));
                        _local10 = tcnt.cntMask;
                        _local11 = tcnt.cnt;
                        _local9.visible = true;
                        _local9.h.height = int(((_local10.height / _local11.height) * _local9.b.height));
                        hRun = (_local9.b.height - _local9.h.height);
                        dRun = ((_local11.height - _local10.height) + 5);
                        _local9.h.y = 0;
                        _local11.oy = (_local11.y = _local9.y);
                        _local9.visible = false;
                        _local9.hit.alpha = 0;
                        mDown = false;
                        if (_local11.height > _local9.b.height){
                            _local9.visible = true;
                            _local9.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
                            _local9.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                            _local11.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
                        };
                    };
                    tcnt.cnt.iproto.visible = false;
                    break;
            };
            mc.bg.btnClose.addEventListener(MouseEvent.CLICK, closeClick, false, 0, true);
            mc.bg.fx.visible = false;
        }

        private function clearCnt(){
            var _local1:* = mc.getChildByName("cnt");
            if (_local1 != null){
                mc.removeChild(_local1);
            };
        }

        private function closeClick(_arg1:MouseEvent){
            fClose();
        }

        private function uNameClick(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            var _local3:* = {};
            if (("ID" in _local2)){
                _local3.ID = _local2.ID;
            };
            _local3.strUsername = _local2.txtName.text;
            if ((((fData.typ == "userListFriends")) && (!((_local2.txtMeta.text == "Augoeides"))))){
                rootClass.ui.cMenu.fOpenWith("offline", _local3);
            }
            else {
                if (fData.typ == "userListIgnore"){
                    rootClass.ui.cMenu.fOpenWith("ignored", _local3);
                }
                else {
                    rootClass.ui.cMenu.fOpenWith("user", _local3);
                };
            };
        }

        private function scrUp(_arg1:MouseEvent){
            mDown = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, scrUp);
        }

        private function scrDown(_arg1:MouseEvent){
            mbY = int(mouseY);
            mhY = int(tcnt.scr.h.y);
            mDown = true;
            stage.addEventListener(MouseEvent.MOUSE_UP, scrUp);
        }

        private function hEF(_arg1:Event){
            var _local2:*;
            if (mDown){
                _local2 = tcnt.scr;
                mbD = (int(mouseY) - mbY);
                _local2.h.y = (mhY + mbD);
                if ((_local2.h.y + _local2.h.height) > _local2.b.height){
                    _local2.h.y = int((_local2.b.height - _local2.h.height));
                };
                if (_local2.h.y < 0){
                    _local2.h.y = 0;
                };
            };
        }

        private function dEF(_arg1:Event){
            var _local2:* = tcnt.scr;
            var _local3:* = MovieClip(_arg1.currentTarget);
            var _local4:* = (-(_local2.h.y) / hRun);
            var _local5:* = (int((_local4 * dRun)) + _local3.oy);
            if (Math.abs((_local5 - _local3.y)) > 0.2){
                _local3.y = (_local3.y + ((_local5 - _local3.y) / 4));
            }
            else {
                _local3.y = _local5;
            };
        }

        function frame1(){
            stop();
        }

        function frame5(){
            update();
        }

        function frame10(){
            stop();
        }


    }
}//package 

