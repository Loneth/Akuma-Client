// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//QFrameMC

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.filters.GlowFilter;
    import flash.display.DisplayObject;
    import flash.text.*;

    public class QFrameMC extends MovieClip {

        public var cnt:MovieClip;
        public var world:MovieClip;
        public var rootClass:MovieClip;
        public var qData:Object = null;
        var qMode:String = null;
        var choiceID:int = -1;
        var isOpen:Boolean = false;
        var mc:MovieClip;
        var mDown:Boolean = false;
        var hRun:int = 0;
        var dRun:int = 0;
        var mbY:int = 0;
        var mhY:int = 0;
        var mbD:int = 0;
        var qly:int = 70;
        var qdy:int = 58;
        var qla:Array;
        var qlb:Array;
        public var qIDs:Array;
        public var sIDs:Array;
        public var tIDs:Array;

        public function QFrameMC():void{
            qla = [];
            qlb = [];
            qIDs = [];
            sIDs = [];
            tIDs = [];
            super();
            addFrameScript(6, frame7, 11, frame12, 15, frame16);
            mc = MovieClip(this);
            mc.x = 0;
            mc.y = 65;
            mc.cnt.bg.btnClose.addEventListener(MouseEvent.CLICK, xClick);
			trace("QFRAMEMC");
        }

        public function open(){
            rootClass = MovieClip(this.stage.getChildAt(0));
            world = rootClass.world;
            mc = MovieClip(this);
            mc.cnt.bg.fx.visible = false;
            if (rootClass.isDialoqueUp()){
                mc.cnt.bg.fx.visible = true;
            };
            if (!isOpen){
                isOpen = true;
                mc.cnt.gotoAndPlay("intro");
            }
            else {
                isOpen = false;
                fClose();
            };
        }

        public function showQuestList(){
            var _local1:int;
            var _local2:int;
            if ((((((qMode == "l")) && (!((world.getActiveQuests() == ""))))) || ((qMode == "q")))){
                if (qMode == "l"){
                    qIDs = world.getActiveQuests().split(",");
                }
                else {
                    qIDs = new Array();
                    _local1 = 0;
                    while (_local1 < sIDs.length) {
                        qIDs.push(sIDs[_local1]);
                        _local1++;
                    };
                    _local2 = 0;
                    while (_local2 < tIDs.length) {
                        if (((world.isQuestInProgress(tIDs[_local2])) && ((qIDs.indexOf(tIDs[_local2]) == -1)))){
                            qIDs.push(tIDs[_local2]);
                        };
                        _local2++;
                    };
                };
                world.checkAllQuestStatus();
                buildQuestList();
            }
            else {
                showEmptyList();
            };
            if (qMode == "l"){
                mc.cnt.strTitle.htmlText = 'Current Quests<font color="#FF0000">:</font>';
            };
            if (qMode == "q"){
                mc.cnt.strTitle.htmlText = 'Available Quests<font color="#FF0000">:</font>';
            };
            mc.cnt.qList.visible = true;
            mc.cnt.qList.mHi.visible = false;
            mc.cnt.mouseChildren = true;
        }

        private function isQuestAvailable(_arg1:Object):Boolean{
            if (_arg1 != null){
                if (((!((_arg1.bGuild == null))) && ((_arg1.bGuild == 1)))){
                    if (rootClass.world.myAvatar.objData.guild == null){
                        return (false);
                    };
                    if ((((_arg1.iReqRep > 0)) && ((rootClass.world.myAvatar.objData.guild.guildRep < _arg1.iReqRep)))){
                        return (false);
                    };
                };
                if (((((((((((((!((_arg1.sField == null))) && (!((world.getAchievement(_arg1.sField, _arg1.iIndex) == 0))))) || ((_arg1.iLvl > world.myAvatar.objData.intLevel)))) || ((((_arg1.bUpg == 1)) && (!(world.myAvatar.isUpgraded())))))) || ((((_arg1.iSlot >= 0)) && ((world.getQuestValue(_arg1.iSlot) < (Math.abs(_arg1.iValue) - 1))))))) || ((((_arg1.iClass > 0)) && ((world.myAvatar.getCPByID(_arg1.iClass) < _arg1.iReqCP)))))) || ((((_arg1.FactionID > 1)) && ((world.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))))){
                    return (false);
                };
                if ((((_arg1.QuestID == 3190)) && (!(world.myAvatar.isUpgraded())))){
                    if (world.getQuestValue(43) < 3){
                        return (false);
                    };
                    if (world.getQuestValue(21) < 26){
                        return (false);
                    };
                    if (world.getQuestValue(22) < 35){
                        return (false);
                    };
                    if (world.getQuestValue(25) < 22){
                        return (false);
                    };
                    if (world.getQuestValue(26) < 23){
                        return (false);
                    };
                    if (world.getQuestValue(27) < 14){
                        return (false);
                    };
                    if (world.getQuestValue(32) < 35){
                        return (false);
                    };
                    if (world.getQuestValue(36) < 28){
                        return (false);
                    };
                    if ((((world.getQuestValue(51) < 34)) && ((world.getQuestValue(52) < 34)))){
                        return (false);
                    };
                    if (world.getQuestValue(100) < 15){
                        return (false);
                    };
                    if (world.getQuestValue(117) < 17){
                        return (false);
                    };
                    if (world.getQuestValue(131) < 27){
                        return (false);
                    };
                    if (world.getQuestValue(122) < 35){
                        return (false);
                    };
                };
                return (true);
            };
            return (false);
        }

        private function getQuestListA():void{
            var _local2:*;
            qla = [];
            var _local1:int;
            while (_local1 < qIDs.length) {
                _local2 = world.questTree[qIDs[_local1]];
                qla.push(isQuestAvailable(_local2));
                _local1++;
            };
        }

        private function getQuestListB():void{
            var _local2:*;
            qlb = [];
            var _local1:int;
            while (_local1 < qIDs.length) {
                _local2 = world.questTree[qIDs[_local1]];
                qlb.push(isQuestAvailable(_local2));
                _local1++;
            };
        }

        private function nextQuestAvailable():Object{
            var _local1:Object;
            var _local2:int;
            while (_local2 < qIDs.length) {
                if ((((qla[_local2] == false)) && ((qlb[_local2] == true)))){
                    _local1 = world.questTree[qIDs[_local2]];
                };
                _local2++;
            };
            return (_local1);
        }

        private function hasRequiredItemsForQuest(_arg1:Object):Boolean{
            var _local2:int;
            var _local3:*;
            var _local4:int;
            if (((!((_arg1.reqd == null))) && ((_arg1.reqd.length > 0)))){
                _local2 = 0;
                while (_local2 < _arg1.reqd.length) {
                    _local3 = _arg1.reqd[_local2].ItemID;
                    _local4 = int(_arg1.reqd[_local2].iQty);
                    if ((((rootClass.world.invTree[_local3] == null)) || ((int(rootClass.world.invTree[_local3].iQty) < _local4)))){
                        return (false);
                    };
                    _local2++;
                };
            };
            return (true);
        }

        private function getQuestValidationString(_arg1:Object):String{
            var _local2:int;
            var _local3:*;
            var _local4:int;
            var _local5:*;
            var _local6:String;
            var _local7:int;
            var _local8:Object;
            var _local9:int;
            var _local10:int;
            var _local11:*;
            if (((!((_arg1.sField == null))) && (!((world.getAchievement(_arg1.sField, _arg1.iIndex) == 0))))){
                if (_arg1.sField == "im0"){
                    return ("Monthly Quests are only available once per month.");
                };
                return ("Daily Quests are only available once per day.");
            };
            if ((((_arg1.bUpg == 1)) && (!(world.myAvatar.isUpgraded())))){
                return ("Upgrade is required for this quest!");
            };
            if ((((_arg1.iSlot >= 0)) && ((world.getQuestValue(_arg1.iSlot) < (_arg1.iValue - 1))))){
                return ("Quest has not been unlocked!");
            };
            if (_arg1.iLvl > world.myAvatar.objData.intLevel){
                return ((("Unlocks at Level " + _arg1.iLvl) + "."));
            };
            if ((((_arg1.iClass > 0)) && ((world.myAvatar.getCPByID(_arg1.iClass) < _arg1.iReqCP)))){
                _local2 = rootClass.getRankFromPoints(_arg1.iReqCP);
                _local3 = (_arg1.iReqCP - rootClass.arrRanks[(_local2 - 1)]);
                if (_local3 > 0){
                    return ((((((("Requires " + _local3) + " Class Points on ") + _arg1.sClass) + ", Rank ") + _local2) + "."));
                };
                return ((((("Requires " + _arg1.sClass) + ", Rank ") + _local2) + "."));
            };
            if ((((_arg1.FactionID > 1)) && ((world.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))){
                _local4 = rootClass.getRankFromPoints(_arg1.iReqRep);
                _local5 = (_arg1.iReqRep - rootClass.arrRanks[(_local4 - 1)]);
                if (_local5 > 0){
                    return ((((((("Requires " + _local5) + " Reputation for ") + _arg1.sFaction) + ", Rank ") + _local4) + "."));
                };
                return ((((("Requires " + _arg1.sFaction) + ", Rank ") + _local4) + "."));
            };
            if (((!((_arg1.reqd == null))) && (!(hasRequiredItemsForQuest(_arg1))))){
                _local6 = "Required Item(s): ";
                _local7 = 0;
                while (_local7 < _arg1.reqd.length) {
                    _local8 = world.invTree[_arg1.reqd[_local7].ItemID];
                    _local9 = _arg1.reqd[_local7].iQty;
                    if (_local8.sES == "ar"){
                        _local10 = rootClass.getRankFromPoints(_local9);
                        _local11 = (_local9 - rootClass.arrRanks[(_local10 - 1)]);
                        if (_local11 > 0){
                            _local6 = (_local6 + (_local11 + " Class Points on "));
                        };
                        _local6 = (_local6 + ((_local8.sName + ", Rank ") + _local10));
                    }
                    else {
                        _local6 = (_local6 + _local8.sName);
                        if (_local9 > 1){
                            _local6 = (_local6 + ("x" + _local9));
                        };
                    };
                    _local6 = (_local6 + ", ");
                    _local7++;
                };
                _local6 = (_local6.substr(0, (_local6.length - 2)) + ".");
                return (_local6);
            };
            return ("");
        }

        private function isOneTimeQuestDone(_arg1):Boolean{
            return ((((_arg1.bOnce == 1)) && ((((_arg1.iSlot < 0)) || ((world.getQuestValue(_arg1.iSlot) >= _arg1.iValue))))));
        }

        private function buildQuestList(){
            var _local5:*;
            var _local6:*;
            var _local1:* = 0;
            while (_local1 < qIDs.length) {
                _local5 = world.questTree[qIDs[_local1]];
                if (((!((_local5 == null))) && (!(isOneTimeQuestDone(_local5))))){
                    _local6 = mc.cnt.qList.addChild(new qProto());
                    if (isQuestAvailable(_local5)){
                        _local6.ti.htmlText = (("<font color='#009900'><b>" + _local5.sName) + "</b></font>");
                    }
                    else {
                        _local6.ti.htmlText = (("<font color='#990000'><b>" + _local5.sName) + "</b></font>");
                    };
                    _local6.addEventListener(MouseEvent.CLICK, qListClick);
                    _local6.QuestID = _local5.QuestID;
                    if (_local5.sTyp != null){
                        _local6.ti.htmlText = (_local6.ti.htmlText + ((' <font color="#888888">' + _local5.sTyp) + "</font>"));
                    };
                    if (_local5.status != null){
                        switch (_local5.status){
                            case "p":
                                _local6.ti.htmlText = (_local6.ti.htmlText + "<font color='#888888'> - In progress</font>");
                                break;
                            case "c":
                                _local6.ti.htmlText = (_local6.ti.htmlText + "<font color='#99FF00'> - <b>Complete!</b></font>");
                                break;
                        };
                    };
                    _local6.addEventListener(MouseEvent.MOUSE_OVER, iMouseOver, false, 0, true);
                    _local6.addEventListener(MouseEvent.MOUSE_OUT, iMouseOut, false, 0, true);
                    _local6.buttonMode = true;
                    _local6.hit.alpha = 0;
                    _local6.y = (_local1 * 20);
                    _local6.x = 10;
                };
                _local1++;
            };
            var _local2:* = mc.cnt.scr;
            var _local3:* = mc.cnt.bMask;
            var _local4:* = mc.cnt.qList;
            _local2.h.height = int(((_local2.b.height / _local4.height) * _local2.b.height));
            hRun = (_local2.b.height - _local2.h.height);
            dRun = ((_local4.height - _local2.b.height) + 20);
            _local2.h.y = 0;
            _local4.oy = (_local4.y = qly);
            _local2.visible = false;
            _local2.hit.alpha = 0;
            mDown = false;
            if (_local4.height > _local2.b.height){
                _local2.visible = true;
                _local2.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
                _local2.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                _local4.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
            };
            mc.cnt.qList.iproto.visible = false;
        }

        private function qListClick(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            qData = world.questTree[_local2.QuestID];
            _local2.removeEventListener(MouseEvent.CLICK, qListClick);
            _local2.removeEventListener(MouseEvent.MOUSE_OVER, iMouseOver);
            _local2.removeEventListener(MouseEvent.MOUSE_OUT, iMouseOut);
            mc.cnt.gotoAndPlay("out");
            if (mc.cnt.qList.hasEventListener(Event.ENTER_FRAME)){
                mc.cnt.qList.removeEventListener(Event.ENTER_FRAME, dEF);
            };
            mc.cnt.qList.mouseEnabled = false;
            mc.cnt.qList.mouseChildren = false;
        }

        private function showEmptyList(){
            var _local1:* = mc.cnt.qList.addChild(new qProto());
            _local1.ti.htmlText = "<font color=\"#DDDDDD\">You aren't on any quests!</font>";
            _local1.hit.alpha = 0;
            _local1.x = 10;
            mc.cnt.qList.iproto.visible = false;
            mc.cnt.scr.visible = false;
        }

        public function showQuestDetail(){
            var _local2:String;
            var _local3:Object;
            var _local4:Object;
            var _local10:*;
            var _local11:*;
            var _local12:*;
            var _local13:String;
            var _local14:*;
            var _local15:*;
            var _local16:*;
            var _local17:Class;
            var _local18:MovieClip;
            var _local19:GlowFilter;
            var _local20:Array;
            var _local21:String;
            var _local22:Object;
            var _local23:MovieClip;
            var _local24:Object;
            var _local25:int;
            var _local26:int;
            var _local27:String;
            var _local28:Class;
            var _local29:DisplayObject;
            var _local30:*;
            var _local1:int;
            choiceID = -1;
            world.checkAllQuestStatus();
            mc.cnt.mouseChildren = true;
            mc.cnt.strTitle.text = qData.sName;
            var _local5:* = mc.cnt.core;
            _local5.strNote.autoSize = "left";
            _local5.strNote.text = getQuestValidationString(qData);
            _local5.strDesc.mouseWheelEnabled = false;
            _local5.strReq.mouseWheelEnabled = false;
            _local5.rewards.strRew.mouseWheelEnabled = false;
            _local5.strDesc.autoSize = "left";
            _local5.strReq.autoSize = "left";
            _local5.rewards.strRew.autoSize = "left";
            if ((((((qData.status == "c")) && ((tIDs.indexOf(String(qData.QuestID)) >= 0)))) && (!((qData.sEndText == ""))))){
                _local5.strDesc.text = qData.sEndText;
            }
            else {
                _local5.strDesc.text = qData.sDesc;
            };
            _local5.strReq.htmlText = "";
            if (((!((qData.turnin == null))) && ((qData.turnin.length > 0)))){
                _local13 = "";
                _local1 = 0;
                while (_local1 < qData.turnin.length) {
                    _local14 = world.invTree[qData.turnin[_local1].ItemID];
                    _local15 = _local14.sName;
                    _local16 = int(qData.turnin[_local1].iQty);
                    if (_local1 > 0){
                        _local13 = (_local13 + ",<br>");
                    };
                    if (_local14.iQty < _local16){
                        _local13 = (_local13 + ((((_local15 + ' <font color="#888888">') + _local14.iQty) + "/</font>") + _local16));
                    }
                    else {
                        _local13 = (_local13 + (((((('<font color="#888888">' + _local15) + " ") + _local14.iQty) + "/") + _local16) + "</font>"));
                    };
                    _local1++;
                };
                _local5.strReq.htmlText = _local13;
            };
            var _local6 = (qData.iCopper + '<font color="#D6B694"> copper</font><br>');
			_local6 = (_local6 + (qData.iSilver + '<font color="#D6CFD6"> silver</font><br>'));
			_local6 = (_local6 + (qData.iGold + '<font color="#E7B64A"> gold</font><br>'));
            _local6 = (_local6 + (qData.iExp + '<font color="#FF00FF"> xp</font><br>'));
			/*
			if (qData.gExp > 1) {
				_local6 = (_local6 + (qData.gExp + '<font color="#4A8276"> guild xp</font>'));
			};*/
            if ((((qData.FactionID > 1)) && ((qData.iRep > 0)))){
                _local6 = (_local6 + (((("<br>" + qData.iRep) + " <font color='#00FF66'>rep : ") + qData.sFaction) + "</font>"));
            };
            _local5.rewards.strRew.htmlText = _local6;
            if (_local5.strNote.text == ""){
                _local5.descTitle.y = 0;
            }
            else {
                _local5.descTitle.y = ((_local5.strNote.y + _local5.strNote.textHeight) + 10);
            };
            _local5.strDesc.y = (_local5.descTitle.y + 15);
            _local5.reqTitle.y = Math.round(((_local5.strDesc.y + _local5.strDesc.textHeight) + 10));
            _local5.strReq.y = (_local5.reqTitle.y + 15);
            _local5.rewards.y = Math.round(((_local5.strReq.y + _local5.strReq.textHeight) + 10));
            var _local7:Number = ((_local5.rewards.y + _local5.rewards.height) + 15);
            if (qData.oRewards != null){
                _local17 = world.getClass("DFrameMCcnt");
                _local20 = ["itemsS", "itemsC", "itemsR", "itemsrand"];
                _local1 = 0;
                while (_local1 < _local20.length) {
                    _local21 = _local20[_local1];
                    switch (_local21){
                        case "itemsS":
                        default:
                            _local23 = _local5.rewardsStatic;
                            break;
                        case "itemsC":
                            _local23 = _local5.rewardsChoice;
                            break;
                        case "itemsR":
                            _local23 = _local5.rewardsRoll;
                            break;
                        case "itemsrand":
                            _local23 = _local5.rewardsRandom;
                    };
                    if (qData.oRewards[_local21] == null){
                        _local23.visible = false;
                    }
                    else {
                        _local22 = qData.oRewards[_local21];
                        _local26 = 16;
                        for (_local2 in _local22) {
                            _local24 = _local22[_local2];
                            _local25 = _local24.iQty;
                            trace(((("itemID: " + _local22[_local2].ItemID) + " iQty: ") + _local22[_local2].iQty));
                            _local18 = (_local23.addChild(new (_local17)()) as MovieClip);
                            _local18.ItemID = _local24.ItemID;
                            _local18.strName.autoSize = "left";
                            _local18.strName.htmlText = _local24.sName;
                            _local18.strName.width = (_local18.strName.textWidth + 6);
                            _local18.strType.htmlText = _local24.sType;
                            _local18.bg.width = (int(_local18.strName.textWidth) + 75);
                            if (_local18.bg.width < 175){
                                _local18.bg.width = 175;
                            };
                            _local18.fx1.width = _local18.bg.width;
                            trace(("iQty: " + _local25));
                            if (_local25 > 1){
                                _local18.strQ.text = ("x" + _local25);
                                _local18.strQ.x = ((_local18.bg.width - _local18.strQ.width) - 7);
                                _local18.strQ.visible = true;
                            }
                            else {
                                _local18.strQ.x = 0;
                                _local18.strQ.visible = false;
                            };
                            _local19 = new GlowFilter(world.rarityCA[_local24.iRty], 1, 8, 8, 2, 1, false, false);
                            _local18.bg.filters = [_local19];
                            _local18.icon.removeAllChildren();
                            _local27 = "";
                            if (_local24.sType.toLowerCase() == "refinement"){
                                _local27 = rootClass.getIconBySlot(_local24.sES);
                            }
                            else {
                                if ((((((_local24.sIcon == null)) || ((_local24.sIcon == "")))) || ((_local24.sIcon == "none")))){
                                    if (_local24.sLink.toLowerCase() != "none"){
                                        _local27 = "iidesign";
                                    }
                                    else {
                                        _local27 = "iibag";
                                    };
                                }
                                else {
                                    _local27 = _local24.sIcon;
                                };
                            };
                            try {
                                _local28 = (world.getClass(_local27) as Class);
                                _local29 = _local18.icon.addChild(new (_local28)());
                                _local29.scaleX = (_local29.scaleY = 0.5);
                                _local19 = new GlowFilter(world.rarityCA[_local24.iRty], 1, 8, 8, 2, 1, false, false);
                                _local18.icon.filters = [_local19];
                            }
                            catch(e:Error) {
                            };
                            _local18.y = _local26;
                            _local26 = (_local26 + Math.round((_local18.height + 8)));
                            if ((((((((((_local21 == "itemsC")) && (!((qMode == "l"))))) && (!((qData.status == null))))) && ((qData.status == "c")))) && ((tIDs.indexOf(String(qData.QuestID)) >= 0)))){
                                _local18.mouseEnabled = true;
                                _local18.mouseChildren = false;
                                _local18.buttonMode = true;
                                _local18.addEventListener(MouseEvent.CLICK, btnRewardClick, false, 0, true);
                            };
                        };
                    };
                    if (_local23.visible){
                        _local23.y = _local7;
                        _local7 = ((_local23.y + _local23.height) + 15);
                    };
                    _local1++;
                };
            };
            var _local8:* = null;
            var _local9:* = {};
            if (qMode != "l"){
                if (qData.status == null){
                    _local8 = mc.cnt.btns.dual;
                    mc.cnt.btns.tri.visible = false;
                    _local9 = {
                        b1:{
                            txt:"Accept",
                            fn:btnAccept
                        },
                        b2:{
                            txt:"Decline",
                            fn:btnBack
                        }
                    };
                }
                else {
                    if ((((qData.status == "c")) && ((tIDs.indexOf(String(qData.QuestID)) >= 0)))){
                        _local8 = mc.cnt.btns.tri;
                        mc.cnt.btns.dual.visible = false;
                        _local9 = {
                            b1:{
                                txt:"Back",
                                fn:btnBack
                            },
                            b2:{
                                txt:"Turn in!",
                                fn:btnComplete
                            },
                            b3:{
                                txt:"Abandon",
                                fn:btnAbandon
                            }
                        };
                    }
                    else {
                        _local8 = mc.cnt.btns.dual;
                        mc.cnt.btns.tri.visible = false;
                        _local9 = {
                            b1:{
                                txt:"Back",
                                fn:btnBack
                            },
                            b2:{
                                txt:"Abandon",
                                fn:btnAbandon
                            }
                        };
                    };
                };
            }
            else {
                _local8 = mc.cnt.btns.dual;
                mc.cnt.btns.tri.visible = false;
                _local9 = {
                    b1:{
                        txt:"Back",
                        fn:btnBack
                    },
                    b2:{
                        txt:"Abandon",
                        fn:btnAbandon
                    }
                };
            };
            for (_local10 in _local9) {
                _local30 = _local8[_local10];
                _local30.buttonMode = true;
                _local30.fx.visible = false;
                _local30.ti.mouseEnabled = false;
                _local30.addEventListener(MouseEvent.MOUSE_OVER, bMouseOver, false, 0, true);
                _local30.addEventListener(MouseEvent.MOUSE_OUT, bMouseOut, false, 0, true);
                _local30.ti.text = _local9[_local10].txt;
                _local30.addEventListener(MouseEvent.CLICK, _local9[_local10].fn, false, 0, true);
            };
            _local11 = mc.cnt.scr;
            _local12 = mc.cnt.bMask;
            _local11.h.height = int(((_local11.b.height / _local5.height) * _local11.b.height));
            hRun = (_local11.b.height - _local11.h.height);
            dRun = ((_local5.height - _local11.b.height) + 20);
            _local11.h.y = 0;
            _local5.oy = (_local5.y = qdy);
            _local11.visible = false;
            _local11.hit.alpha = 0;
            mDown = false;
            if (_local5.height > _local11.b.height){
                _local11.visible = true;
                _local11.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
                _local11.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                _local5.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
            };
        }

        private function scrDown(_arg1:MouseEvent){
            mbY = int(mouseY);
            mhY = int(MovieClip(_arg1.currentTarget.parent).h.y);
            mDown = true;
            stage.addEventListener(MouseEvent.MOUSE_UP, scrUp, false, 0, true);
        }

        private function scrUp(_arg1:MouseEvent){
            mDown = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, scrUp);
        }

        private function hEF(_arg1:Event){
            var _local2:*;
            if (mDown){
                _local2 = MovieClip(_arg1.currentTarget.parent);
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
            var _local2:* = MovieClip(_arg1.currentTarget.parent).scr;
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

        public function killDetailUI(){
            if (mc.cnt.core.hasEventListener(Event.ENTER_FRAME)){
                mc.cnt.core.removeEventListener(Event.ENTER_FRAME, dEF);
            };
        }

        public function turninResult(_arg1:String){
            getQuestListB();
            qData = null;
            if (mc.cnt.currentLabel == "hold"){
                if (_arg1 == "pass"){
                    qData = nextQuestAvailable();
                };
                mc.cnt.gotoAndPlay("back");
            };
        }

        private function xClick(_arg1:MouseEvent){
			trace("HERE");
            fClose();
        }

        public function fClose():void{
            mc.cnt.bg.btnClose.removeEventListener(MouseEvent.CLICK, xClick);
            stage.focus = stage;
            mc.parent.removeChild(mc);
        }

        private function btnAccept(_arg1:MouseEvent){
            var _local3:*;
            var _local2:* = getQuestValidationString(qData);
            if (_local2 != ""){
                MovieClip(Game.root).MsgBox.notify(_local2);
            }
            else {
                if (world.coolDown("acceptQuest")){
                    _local3 = MovieClip(_arg1.currentTarget);
                    setCT(_local3.bg, 43775);
                    _local3.removeEventListener(MouseEvent.CLICK, btnAccept);
                    _local3.removeEventListener(MouseEvent.MOUSE_OVER, bMouseOver);
                    _local3.removeEventListener(MouseEvent.MOUSE_OUT, bMouseOut);
                    world.acceptQuest(qData.QuestID);
                    qData = null;
                    mc.cnt.gotoAndPlay("back");
                };
            };
        }

        private function btnAbandon(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            world.abandonQuest(qData.QuestID);
            setCT(_local2.bg, 0xFF0000);
            _local2.removeEventListener(MouseEvent.CLICK, btnAbandon);
            _local2.removeEventListener(MouseEvent.MOUSE_OVER, bMouseOver);
            _local2.removeEventListener(MouseEvent.MOUSE_OUT, bMouseOut);
            qData = null;
            mc.cnt.gotoAndPlay("back");
        }

        private function btnComplete(_arg1:MouseEvent){
            var _local2:*;
            if (((world.coolDown("tryQuestComplete")) && (world.canTurnInQuest(qData.QuestID)))){
                if (((!((qData.oRewards.itemsC == null))) && ((choiceID == -1)))){
                    rootClass.addUpdate("Please choose a reward before turning the quest in!");
                    rootClass.chatF.pushMsg("warning", "Please choose a reward before turning the quest in!", "SERVER", "", 0);
                    return;
                };
                _local2 = MovieClip(_arg1.currentTarget);
                setCT(_local2.bg, 0xFF00);
                _local2.removeEventListener(MouseEvent.CLICK, btnAbandon);
                _local2.removeEventListener(MouseEvent.MOUSE_OVER, bMouseOver);
                _local2.removeEventListener(MouseEvent.MOUSE_OUT, bMouseOut);
                mc.cnt.gotoAndPlay("hold");
                getQuestListA();
                world.tryQuestComplete(qData.QuestID, choiceID);
            };
        }

        private function btnBack(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            setCT(_local2.bg, 0xAAAAAA);
            _local2.removeEventListener(MouseEvent.CLICK, btnBack);
            _local2.removeEventListener(MouseEvent.MOUSE_OVER, bMouseOver);
            _local2.removeEventListener(MouseEvent.MOUSE_OUT, bMouseOut);
            mc.cnt.mouseChildren = false;
            qData = null;
            mc.cnt.gotoAndPlay("back");
        }

        private function btnRewardClick(_arg1:MouseEvent):void{
            var _local4:MovieClip;
            var _local5:Array;
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            var _local3:MovieClip = (_local2.parent as MovieClip);
            choiceID = _local2.ItemID;
            var _local6:int = 1;
            while (_local6 < _local3.numChildren) {
                _local4 = (_local3.getChildAt(_local6) as MovieClip);
                _local5 = _local4.bg.filters;
                if ((((choiceID == _local4.ItemID)) && ((_local5.length == 1)))){
                    _local5.push(new GlowFilter(16763955, 1, 5, 5, 2, 1, true, false));
                    _local4.bg.filters = _local5;
                };
                if (((!((choiceID == _local4.ItemID))) && ((_local5.length > 1)))){
                    _local5.pop();
                    _local4.bg.filters = _local5;
                };
                _local6++;
            };
        }

        private function bMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.fx.visible = true;
        }

        private function bMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.fx.visible = false;
        }

        private function setCT(_arg1, _arg2){
            var _local3:* = _arg1.transform.colorTransform;
            _local3.color = _arg2;
            _arg1.transform.colorTransform = _local3;
        }

        private function iMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.parent.mHi.visible = true;
            _local2.parent.mHi.y = _local2.y;
        }

        private function iMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.parent.mHi.visible = false;
        }

        function frame7(){
            stop();
        }

        function frame12(){
        }

        function frame16(){
            fClose();
        }


    }
}//package 

