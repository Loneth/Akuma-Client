// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//cMenuMC

package {
    import flash.display.MovieClip;
    import flash.geom.ColorTransform;
    import flash.events.MouseEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.text.*;

    public class cMenuMC extends MovieClip {

        public var cnt:MovieClip;
        var world:MovieClip;
        var fData:Object = null;
        var isOpen:Boolean = false;
        var fMode:String;
        var mc:MovieClip;
        var rootClass:MovieClip;
        var iHi:Number = -1;
        var iSel:Number = -1;
        var iCT:ColorTransform;

        public function cMenuMC(){
            addFrameScript(0, frame1, 4, frame5, 9, frame10);
            mc = MovieClip(this);
            rootClass = MovieClip(stage.getChildAt(0));
            mc.cnt.iproto.visible = false;
            mc.addEventListener(MouseEvent.MOUSE_OVER, mouseOn);
            mc.addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
            fData = {};
            fData.params = {};
            fData.user = ["Char Page", "Is Moderator?", "Whisper", "Add Friend", "Go To", "Invite", "Report", "Delete Friend", "Ignore", "Duel", "Trade", "Close"];
            fData.party = ["Char Page", "Whisper", "Add Friend", "Go To", "Remove", "Summon", "Promote", "Report", "Delete Friend", "Ignore", "Duel", "Trade", "Close"];
            fData.self = ["Char Page", "Reputation", "Vending", "Leave Party", "Close"];
			fData.pet = ["Statistics", "Close"];
            fData.pvpqueue = ["Leave Queue", "Close"];
            fData.offline = ["Delete Friend", "Close"];
            fData.ignored = ["Unignore", "Close"];
            fData.cl = [];
            fData.clc = [];
        }

        public function fOpenWith(_arg1, _arg2){
            var _local7:*;
            var _local8:*;
            var _local9:*;
            isOpen = true;
            fMode = _arg1.toLowerCase();
            fData.params = _arg2;
            mc.cnt.mHi.visible = false;
            iCT = mc.cnt.mHi.transform.colorTransform;
            iCT.color = 13434675;
            mc.cnt.mHi.transform.colorTransform = iCT;
            var _local3:int;
            _local3 = 0;
            while (_local3 < 9) {
                _local7 = mc.cnt.getChildByName(("i" + _local3));
                if (_local7 != null){
                    _local7.removeEventListener(MouseEvent.CLICK, itemClick);
                    _local7.removeEventListener(MouseEvent.MOUSE_OVER, itemMouseOver);
                    mc.cnt.removeChild(_local7);
                };
                _local3++;
            };
            var _local4:* = 0;
            delete fData.cl;
            delete fData.clc;
            var _local5:* = fData.params.strUsername.toLowerCase();
            var _local6:* = rootClass.world.uoTree[_local5];
            fData.cl = rootClass.copyObj(fData[fMode]);
            fData.clc = [];
            _local3 = 0;
            while (_local3 < fData.cl.length) {
                if ((((fData.cl[_local3] == "Add Friend")) && (rootClass.world.myAvatar.isFriend(fData.params.ID)))){
                    fData.cl.splice(_local3, 1);
                    _local3--;
                };
                if ((((fData.cl[_local3] == "Delete Friend")) && (!(rootClass.world.myAvatar.isFriend(fData.params.ID))))){
                    fData.cl.splice(_local3, 1);
                    _local3--;
                };
                _local3++;
            };
            _local3 = 0;
            while (_local3 < fData.cl.length) {
                if (_local5 == rootClass.sfc.myUserName){
                };
                if ((((fData.cl[_local3] == "Ignore")) && (rootClass.chatF.isIgnored(_local5)))){
                    fData.cl[_local3] = "Unignore";
                };
                _local8 = mc.cnt.addChild(new cProto());
                _local8.name = ("i" + _local3);
                _local8.y = (mc.cnt.iproto.y + (_local3 * 14));
                iCT = _local8.transform.colorTransform;
                _local9 = true;
                switch (fData.cl[_local3].toLowerCase()){
                    case "add friend":
                        if (((((!((rootClass.world.getAvatarByUserName(_local5) == null))) && (!((rootClass.world.getAvatarByUserName(_local5).objData == null))))) && (((rootClass.world.getAvatarByUserName(_local5).isStaff()) && (!(rootClass.world.myAvatar.isStaff())))))){
                            _local9 = false;
                        };
                        break;
					//case "vending":
                        //if (rootClass.ui.mcPortrait.strClass.text != "Sage"){
                            //_local9 = false;
                        //};
                      //  break;
                    case "go to":
                        if (!((rootClass.world.isPartyMember(_local5)) || (rootClass.world.myAvatar.isFriend(fData.params.ID)))){
                            _local9 = false;
                        };
                        break;
                    case "ignore":
                    case "unignore":
                        if (_local5 == rootClass.sfc.myUserName){
                            _local9 = false;
                        };
                        break;
                    case "invite":
                        if ((((((((((((((_local5 == rootClass.sfc.myUserName)) || ((_local6 == null)))) || (((((!((rootClass.world.getAvatarByUserName(_local5) == null))) && (!((rootClass.world.getAvatarByUserName(_local5).objData == null))))) && (((rootClass.world.getAvatarByUserName(_local5).isStaff()) && (!(rootClass.world.myAvatar.isStaff())))))))) || ((rootClass.world.partyMembers.length > 4)))) || (rootClass.world.isPartyMember(fData.params.strUsername)))) || (((rootClass.world.bPvP) && (!((_local6.pvpTeam == rootClass.world.myAvatar.dataLeaf.pvpTeam))))))) || ((((rootClass.world.partyMembers.length > 0)) && (!((rootClass.world.partyOwner.toLowerCase() == rootClass.sfc.myUserName))))))){
                            _local9 = false;
                        };
                        break;
                    case "leave party":
                        if (rootClass.world.partyMembers.length == 0){
                            _local9 = false;
                        };
                        break;
                    case "remove":
                        if (rootClass.world.partyOwner.toLowerCase() != rootClass.sfc.myUserName){
                            fData.cl[_local3] = "Leave Party";
                        };
                        break;
                    case "private: on":
                    case "private: off":
                    case "promote":
                        if (rootClass.world.partyOwner != rootClass.world.myAvatar.objData.strUsername){
                            _local9 = false;
                        };
                        break;
                    case "inspect":
                        if ((((_local6 == null)) || (!((_local6.strFrame == rootClass.world.strFrame))))){
                            _local9 = false;
                        };
                        break;
                };
                if (_local9){
                    iCT.color = 0x999999;
                    _local8.addEventListener(MouseEvent.CLICK, itemClick, false, 0, true);
                    _local8.buttonMode = true;
                }
                else {
                    iCT.color = 0x666666;
                };
                _local8.addEventListener(MouseEvent.MOUSE_OVER, itemMouseOver, false, 0, true);
                fData.clc.push(iCT.color);
                _local8.ti.text = fData.cl[_local3];
                if (_local8.ti.textWidth > _local4){
                    _local4 = _local8.ti.textWidth;
                };
                _local8.transform.colorTransform = iCT;
                _local8.ti.width = (_local8.ti.textWidth + 5);
                _local8.hit.width = ((_local8.ti.x + _local8.ti.textWidth) + 2);
                _local3++;
            };
            mc.cnt.bg.height = (mc.cnt.getChildByName(String(("i" + (fData.cl.length - 1)))).y + 26);
            mc.cnt.bg.width = (_local4 + 20);
            mc.x = (MovieClip(parent).mouseX - 5);
            mc.y = (MovieClip(parent).mouseY - 5);
            if ((mc.x + mc.cnt.bg.width) > 1260){
                mc.x = (MovieClip(parent).mouseX - mc.cnt.bg.width);
            };
            if ((mc.y + mc.cnt.bg.height) > 500){
                mc.y = (500 - mc.cnt.bg.height);
            };
            mc.gotoAndPlay("in");
        }

        public function fClose(){
            isOpen = false;
            if (mc.currentFrame != 1){
                if (mc.currentFrame == 10){
                    mc.gotoAndPlay("out");
                }
                else {
                    mc.gotoAndStop("hold");
                };
            };
        }

        private function itemMouseOver(_arg1:MouseEvent){
            var _local4:*;
            var _local2:* = MovieClip(_arg1.currentTarget);
            iHi = int(_local2.name.substr(1));
            var _local3:int;
            _local3 = 0;
            while (_local3 < fData.cl.length) {
                _local4 = mc.cnt.getChildByName(("i" + _local3));
                iCT = _local4.transform.colorTransform;
                if (_local3 == iHi){
                    if (_local2.hasEventListener(MouseEvent.CLICK)){
                        iCT.color = 0xFFFFFF;
                        cnt.mHi.visible = true;
                        cnt.mHi.y = (_local4.y + 3);
                    }
                    else {
                        cnt.mHi.visible = false;
                    };
                }
                else {
                    iCT.color = fData.clc[_local3];
                };
                _local4.transform.colorTransform = iCT;
                _local3++;
            };
        }

        private function itemClick(_arg1:MouseEvent){
            var _local3:String;
            var _local5:String;
            var _local6:int;
            var _local2:* = MovieClip(_arg1.currentTarget);
            iSel = int(_local2.name.substr(1));
            iCT = mc.cnt.mHi.transform.colorTransform;
            iCT.color = 16763955;
            mc.cnt.mHi.transform.colorTransform = iCT;
            fClose();
            _local3 = fData.cl[iSel];
            var _local4:String = fData.params.strUsername;
            switch (_local3.toLowerCase()){
                case "char page":
                    rootClass.mixer.playSound("Click");
                    if (rootClass.params.strSourceID == "BBGames"){
                        navigateToURL(new URLRequest(("http://leviathanworlds.fun/?profile=" + _local4)), "_blank");
                    }
                    else {
                        navigateToURL(new URLRequest(("http://leviathanworlds.fun/?profile=" + _local4)), "_blank");
                    };
                    return;
				 case "statistics":
                    rootClass.mixer.playSound("Click");
                    if (rootClass.params.strSourceID == "BBGames"){
                        navigateToURL(new URLRequest(("http://leviathanworlds.fun/?profile=" + _local4)), "_blank");
                    }
                    else {
                        navigateToURL(new URLRequest(("http://leviathanworlds.fun/?profile=" + _local4)), "_blank");
                    };
                    return;
                case "is moderator?":
                    rootClass.world.isModerator(_local4);
                    return;
                case "reputation":
                    rootClass.mixer.playSound("Click");
                    rootClass.showFactionInterface();
                    return;
				/*
				case "stall":
                    rootClass.mixer.playSound("Click");
                    rootClass.showFactionInterface();
                    return;
				*/
				case "vending":
                    rootClass.mixer.playSound("Click");
                    //rootClass.world.vendingToggle();
					rootClass.toggleVendingSetup();
                    return;
                case "whisper":
                    rootClass.chatF.openPMsg(_local4);
                    return;
                case "ignore":
                    rootClass.chatF.ignore(_local4);
                    rootClass.chatF.pushMsg("server", (("You are now ignoring user " + _local4) + "."), "SERVER", "", 0);
                    return;
				//Duel Feature
				case "duel":
				    rootClass.world.sendDuelInvite(_local4);
                    break;
				//End
				case "trade":
				    rootClass.world.sendTradeInvite(_local4);
                    break;
                case "unignore":
                    rootClass.chatF.unignore(_local4);
                    rootClass.chatF.pushMsg("server", (("User " + _local4) + " is no longer being ignored."), "SERVER", "", 0);
                    return;
                case "report":
                    rootClass.ui.mcPopup.fOpen("Report", {unm:_local4});
                    return;
                case "close":
                    if ((((fMode == "user")) || ((fMode == "party")))){
                        rootClass.world.cancelTarget();
                    };
                    return;
                case "add friend":
                    if (rootClass.world.myAvatar.friends.length >= 100){
                        rootClass.chatF.pushMsg("server", "You are too popular! (100 friends max)", "SERVER", "", 0);
                    }
                    else {
                        rootClass.world.requestFriend(_local4);
                    };
                    return;
                case "delete friend":
                    rootClass.world.deleteFriend(fData.params.ID, _local4);
                    return;
                case "go to":
                    rootClass.world.goto(_local4);
                    return;
                case "invite":
                    rootClass.world.partyInvite(_local4);
                    return;
                case "remove":
                    rootClass.world.partyKick(_local4);
                    return;
                case "leave party":
                    rootClass.world.partyLeave();
                    return;
                case "private: on":
                case "private: off":
                    _local5 = _local3.toLowerCase().split(": ")[0];
                    _local6 = (((_local3.toLowerCase().split(": ")[1])=="on") ? 1 : 0);
                    rootClass.world.partyUpdate(_local5, _local6);
                    return;
                case "promote":
                    rootClass.world.partyPromote(_local4);
                    return;
                case "summon":
                    rootClass.world.partySummon(_local4);
                    return;
                case "leave queue":
                    rootClass.world.requestPVPQueue("none");
                    return;
            };
        }

        private function mouseOn(_arg1:MouseEvent){
            MovieClip(_arg1.currentTarget).cnt.gotoAndStop("hold");
        }

        private function mouseOut(_arg1:MouseEvent){
            MovieClip(_arg1.currentTarget).cnt.gotoAndPlay("out");
        }

        function frame1(){
            visible = false;
            stop();
        }

        function frame5(){
            visible = true;
        }

        function frame10(){
            stop();
        }


    }
}//package 

