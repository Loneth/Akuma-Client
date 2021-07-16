// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//ServerList

package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.geom.ColorTransform;
    import flash.events.MouseEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public class ServerList extends MovieClip {

        public var uCount:MovieClip;
        public var l1:MovieClip;
        public var bg:MovieClip;
        public var l2:MovieClip;
        public var iList:MovieClip;
        public var txtServerSelect:TextField;
        public var legend:MovieClip;
        public var liveLink:MovieClip;
        private var objLogin:Object;
        private var rootClass:MovieClip;
        private var arrServers:Array;
        private var blackCT:ColorTransform;
        private var iCap:int = 0;
        private var mDown:Boolean = false;
        private var hRun:int = 0;
        private var dRun:int = 0;
        private var mbY:int = 0;
        private var mhY:int = 0;
        private var mbD:int = 0;
        private var ox:int = 0;
        private var oy:int = 0;
        private var mox:int = 0;
        private var moy:int = 0;
        private var scrTgt:MovieClip;
        private var whiteListA:Array;
        private var whiteListB:Array;
        private var langMap:Object;
        private var iTotal:int = 0;

        public function ServerList(){
            var itemClass:Class;
            var server:MovieClip;
            var n:int;
            blackCT = new ColorTransform();
            whiteListA = ["74.53.22.26", "74.53.7.201"];
            whiteListB = ["74.53.7.201"];
            langMap = {
                xx:"Canned-Chat",
                en:"English",
                pt:"Portuguese",
                ph:"Philippines",
                it:"International"
            };
            super();
            addFrameScript(0, frame1, 1, frame2);
            visible = false;
            objLogin = Game.objLogin;
            rootClass = MovieClip(root);
			rootClass.StageFrame = "Game";
	        var LoginIP:String;
            var Online:Boolean;
            legend.fbWindow.btnFBID.visible = false;
            if (rootClass.FBApi.isLoggedIn){
                legend.fbNoLink.visible = false;
                legend.fbWindow.visible = true;
                legend.fbWindow.fbImg.visible = true;
                legend.fbWindow.btnFBLogout.visible = true;
                try {
                    legend.fbWindow.txtFBName.text = rootClass.FBApi.Name;
                }
                catch(e) {
                    trace("error 81");
                };
            }
            else {
                if (objLogin.FBID > 0){
                    legend.fbNoLink.visible = false;
                    legend.fbWindow.visible = true;
                    legend.fbWindow.btnFBLogout.visible = false;
                    try {
                        legend.fbWindow.txtFBName.text = ((((!((objLogin.FBName == ""))) && (!((objLogin.FBName == null))))) ? objLogin.FBName : ("Facebook ID: " + objLogin.FBID));
                    }
                    catch(e) {
                        trace("error 93");
                    };
                    legend.fbWindow.btnFBID.visible = true;
                    legend.fbWindow.btnFBID.addEventListener(MouseEvent.CLICK, onIDClick, false, 0, true);
                }
                else {
                    legend.fbWindow.visible = false;
                    legend.fbNoLink.visible = true;
                    legend.fbWindow.addEventListener(MouseEvent.CLICK, onBackClick, false, 0, true);
                };
            };
            txtServerSelect.text = (Game.loginInfo.strUsername + ", please select a server.");
            if (objLogin.iAccess >= 70){
                arrServers = whiteList(objLogin.servers, []);
            }
            else {
                if (Game.bPTR){
                    if (objLogin.iAccess >= 40){
                        arrServers = whiteList(objLogin.servers, whiteListA);
                    }
                    else {
                        arrServers = whiteList(objLogin.servers, whiteListB);
                    };
                    liveLink.alpha = 100;
                }
                else {
                    arrServers = whiteList(objLogin.servers, []);
                };
            };
            rootClass.serialCmd.servers = objLogin.servers;
            blackCT.color = 0;
            var i:* = 0;
            while (i < arrServers.length) {
                itemClass = (iList.iProto.constructor as Class);
                server = (iList.addChildAt(new (itemClass)(), 0) as MovieClip);
                server.ttStr = "";
                if ((i % 2) > 0){
                    server.x = 286;
                }
                else {
                    server.x = 0;
                };
                server.y = (Math.floor((i / 2)) * 32);
                server.obj = arrServers[i];
                server.tName.ti.text = arrServers[i].sName;
                try {
                    server.mcPop.txtLang.text = langMap[arrServers[i].sLang];
                }
                catch(e) {
                    server.mcPop.txtLang.text = "English";
                };
                if (arrServers[i].bUpg == 1){
                    server.mcPop.txtLang.text = "Member";
                };
                iTotal = (iTotal + int(arrServers[i].iCount));
                if (objLogin.iAccess >= 40){
                    iCap = 10000;
                }
                else {
                    if (objLogin.iUpgDays >= 0){
                        iCap = (arrServers[i].iMax + 1000);
                    }
                    else {
                        iCap = arrServers[i].iMax;
                    };
                };
                arrServers[i].iMax = iCap;
                server.iconStandard.visible = false;
                server.iconSafe.visible = false;
                server.iconLegen.visible = false;
                server.iconChat.visible = true;
                server.iconChat.nullset.visible = false;
                if (arrServers[i].bUpg == 0){
                    server.ttStr = (server.ttStr + "This is a free server. ");
                }
                else {
                    server.ttStr = (server.ttStr + "This is an upgrade-only server. ");
                    server.tName.ti.textColor = 16763955;
                };
                if (arrServers[i].iChat == 0){
                    server.iconSafe.visible = true;
                    server.iconChat.nullset.visible = true;
                    server.ttStr = (server.ttStr + "Only Canned Chat enabled.");
                }
                else {
                    if (arrServers[i].iChat == 1){
                        server.iconChat.alpha = 0.5;
                        server.ttStr = (server.ttStr + "Chat is limited.");
                    }
                    else {
                        server.ttStr = (server.ttStr + "Chat is enabled.");
                    };
                    if (arrServers[i].bUpg == 1){
                        server.iconLegen.visible = true;
                    }
                    else {
                        server.iconStandard.visible = true;
                    };
                    server.iconChat.visible = true;
                };
                n = arrServers[i].iCount;
                server.mcPop.visible = true;
                server.iconFull.visible = false;
                if (n < iCap){
                    server.mcPop.txtPopulation.text = n;
                }
                else {
                    server.mcPop.visible = false;
                    server.iconFull.visible = true;
                    server.ttStr = "Server is full.";
                };
                if (arrServers[i].bOnline == 1){
                    if (langMap[rootClass.params.sLang] == null){
                        rootClass.params.sLang = "en";
                    };
                    server.bgOn.gotoAndStop("Online");
                    if (arrServers[i].sLang == "xx"){
                        server.mcNonPreferred.visible = false;
                    }
                    else {
                        if ((((((arrServers[i].sLang == rootClass.params.sLang)) || ((arrServers[i].sLang == "it")))) && ((objLogin.iAge >= 13)))){
                            server.mcNonPreferred.visible = false;
                        };
                    };
                    server.iconOffline.visible = false;
                }
                else {
                    server.bgOn.gotoAndStop("Offline");
                    server.iconOffline.visible = true;
                    server.iconStandard.visible = false;
                    server.iconSafe.visible = false;
                    server.iconLegen.visible = false;
                    server.iconChat.visible = false;
                    server.mcPop.visible = false;
                    server.tName.alpha = 0.8;
                    server.ttStr = "Server is temporarily offline.";
                };
                server.mouseChildren = false;
                server.addEventListener(MouseEvent.CLICK, onServerClick, false, 0, true);
                server.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
                server.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
                if ((((((((((arrServers[i].bOnline == 0)) || ((n >= iCap)))) || ((((arrServers[i].bUpg == 1)) && ((objLogin.iUpgDays < 0)))))) || ((((((arrServers[i].iChat > 0)) && ((objLogin.iAge < 13)))) && ((objLogin.iUpgDays < 0)))))) || ((((arrServers[i].iChat > 0)) && ((objLogin.bCCOnly == 1)))))){
                    server.buttonMode = true;
                }
                else {
                    server.mouseChildren = false;
                    server.buttonMode = true;
                };
				
				if (arrServers[i].bOnline == 1 && arrServers[i].sName == "Infinity Arts") {
                    rootClass.objServerInfo = arrServers[0];
                    rootClass.chatF.iChat = arrServers[0].iChat;
                    LoginIP = arrServers[0].sIP;
                    Online = true;
				};   
                i = (i + 1);
            };
            iList.iProto.visible = false;
            l2.y = ((iList.y + iList.height) + 10);
            legend.y = (l2.y + 8);
            var bgh:int = int(bg.height);
            bg.height = int(((legend.y + legend.height) + 7));
            bg.y = (bg.y + int(((bg.height - bgh) / 2)));
            var ts:String = "";
            if (iTotal > 0){
                uCount.ti.htmlText = '<font color="#FFBB3E">';
                uCount.ti.htmlText = (uCount.ti.htmlText + rootClass.strNumWithCommas(iTotal));
                uCount.ti.htmlText = (uCount.ti.htmlText + "</font>");
                uCount.t2.x = (uCount.ti.textWidth + 7);
            }
            else {
                uCount.visible = false;
            };
            MovieClip(this).y = int((275 - (MovieClip(this).height / 2)));
            legend.btnBack.addEventListener(MouseEvent.CLICK, onBackClick, false, 0, true);
            legend.btnHelp.addEventListener(MouseEvent.CLICK, onHelpClick, false, 0, true);
            legend.btnManage.addEventListener(MouseEvent.CLICK, onManageClick, false, 0, true);
            legend.fbWindow.btnFBLogout.addEventListener(MouseEvent.CLICK, onFBLogoutClick, false, 0, true);
            legend.fbWindow.btnFBLogout.buttonMode = true;
            if (rootClass.FBApi.isLoggedIn){
                try {
                    if (rootClass.FBApi.FBImage != null){
                        legend.fbImg.removeChildAt(0);
                        legend.fbWindow.fbImg.addChildAt(rootClass.FBApi.FBImage, 1);
                    };
                }
                catch(e) {
                };
            };
			
			if (Online) {
			    rootClass.connectTo(LoginIP); 
			}
        }

        private function onIDClick(_arg1:MouseEvent):void{
            navigateToURL(new URLRequest(("http://www.facebook.com/profile.php?id=" + objLogin.FBID)), "_blank");
        }

        private function onFBLogoutClick(_arg1:MouseEvent):void{
            trace("logout clicked");
            rootClass.FBApi.logoutFromFB();
            MovieClip(parent).gotoAndPlay("Login");
        }

        private function onHelpClick(_arg1:MouseEvent):void{
            navigateToURL(new URLRequest("http://leviathanworlds.fun/?contact"), "_blank");
        }

        private function onManageClick(_arg1:MouseEvent):void{
            navigateToURL(new URLRequest("http://leviathanworlds.fun/?account"), "_blank");
        }

        private function onBackClick(_arg1:MouseEvent){
            MovieClip(parent).gotoAndPlay("Characters");
        }

        private function onServerClick(_arg1:MouseEvent){
            var _local2:ModalMC;
            var _local3:Object;
            var _local4:*;
            if (!rootClass.serialCmdMode){
                _local4 = MovieClip(_arg1.currentTarget);
                if (_local4.obj.bOnline == 0){
                    rootClass.MsgBox.notify("Server currently offline!");
                }
                else {
                    if (_local4.obj.iCount >= _local4.obj.iMax){
                        rootClass.MsgBox.notify("Server is Full!");
                    }
                    else {
                        if ((((_local4.obj.iChat > 0)) && ((objLogin.bCCOnly == 1)))){
                            rootClass.MsgBox.notify("Account Restricted to Moglin Sage Server Only.");
                        }
                        else {
                                if ((((_local4.obj.bUpg == 1)) && ((objLogin.iUpgDays < 0)))){
                                    _local2 = new ModalMC();
                                    _local3 = {};
                                    _local3.strBody = "VIP Server! Do you want to upgrade your account to access this premium server now?";
                                    _local3.params = {};
                                    _local3.callback = onModalClickUpgrade;
                                    _local3.glow = "white,medium";
                                    _local3.btns = "dual";
                                    rootClass.mcLogin.ModalStack.addChild(_local2);
                                    _local2.init(_local3);
                                }
                                else {
                                    rootClass.objServerInfo = _local4.obj;
                                    rootClass.chatF.iChat = _local4.obj.iChat;
                                    fClose();
                                    rootClass.connectTo(_local4.obj.sIP, _local4.obj.sPort);//5588
                                };
                        };
                    };
                };
            };
        }

        private function onMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            if ((((_local2.obj.bOnline > 0)) && (!((_local2.frame.currentLabel == "in"))))){
                _local2.frame.gotoAndPlay("in");
            };
        }

        private function onMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            if ((((_local2.obj.bOnline > 0)) && ((_local2.frame.currentLabel == "in")))){
                _local2.frame.gotoAndPlay("out");
            };
        }

        private function onModalClickUpgrade(_arg1:Object):void{
            if (_arg1.accept){
                navigateToURL(new URLRequest("https://augoeides.org/upgrade"), "_blank");
            };
        }

        private function onModalClickPTR(_arg1:Object):void{
            if (_arg1.accept){
                fClose();
                navigateToURL(new URLRequest("default_ptr.asp"), "_self");
            };
        }

        private function onLiveLinkClick(_arg1:MouseEvent){
            fClose();
            navigateToURL(new URLRequest("default.asp"), "_self");
        }

        public function fClose():void{
            killModals();
        }

        private function killModals():void{
            var _local2:MovieClip;
            var _local1:MovieClip = rootClass.mcLogin.ModalStack;
            var _local3:int;
            while (_local3 < _local1.numChildren) {
                _local2 = (_local1.getChildAt(_local3) as MovieClip);
                if (("fClose" in _local2)){
                    _local2.fClose();
                };
                _local3++;
            };
        }

        public function getServerTabByIP(_arg1:String):MovieClip{
            var _local2:* = numChildren;
            var _local3:* = null;
            var _local4:int;
            while (_local4 < _local2) {
                _local3 = getChildAt(_local4);
                if ((((((_local3.constructor.toString().indexOf("MCServerItem") > -1)) && (!((MovieClip(_local3).obj == null))))) && ((_local3.obj.sIP == _arg1)))){
                    return (MovieClip(_local3));
                };
                _local4++;
            };
            return (null);
        }

        private function whiteList(_arg1:Array, _arg2:Array, _arg3:Boolean=false):Array{
            var _local5:Boolean;
            var _local6:int;
            var _local4:Array = [];
            if (_arg1.length > 0){
                _local6 = 0;
                while (_local6 < _arg1.length) {
                    _local5 = false;
                    if ((((_arg2.length == 0)) || ((_arg2.indexOf(_arg1[_local6].sIP) > -1)))){
                        _local5 = true;
                        if (((_arg3) && ((rootClass.objLogin.iUpgDays < 1)))){
                            _local5 = false;
                        };
                    };
                    if (_local5){
                        _local4.push(_arg1[_local6]);
                    };
                    _local6++;
                };
            };
            return (_local4);
        }

        private function ccWhiteList(_arg1:Array, _arg2:String):Array{
            if (_arg2 == ""){
                return (_arg1);
            };
            var _local3:Array = new Array();
            var _local4:uint;
            while (_local4 < _arg1.length) {
                if ((((((_arg1[_local4].sLang == _arg2)) || ((_arg1[_local4].bUpg == 1)))) || ((_arg1[_local4].sLang == "it")))){
                    _local3.push(_arg1[_local4]);
                }
                else {
                    iTotal = (iTotal + int(arrServers[_local4].iCount));
                };
                _local4++;
            };
            return (_local3);
        }

        private function sortServers(_arg1:Array, _arg2:String):Array{
            var _local3:Object = {
                upg:[],
                it:[]
            };
            _local3[_arg2] = [];
            var _local4:uint;
            while (_local4 < _arg1.length) {
                switch (_arg1[_local4].sLang){
                    case "ph":
                    case "pt":
                    case "it":
                        _local3[_arg1[_local4].sLang].push(_arg1[_local4]);
                        break;
                    default:
                        _local3["upg"].push(_arg1[_local4]);
                };
                _local4++;
            };
            var _local5:Array = new Array();
            _local5 = pushServers(_local5, "it", _local3);
            _local5 = pushServers(_local5, "upg", _local3);
            _local5 = pushServers(_local5, _arg2, _local3);
            return (_local5);
        }

        private function pushServers(_arg1:Array, _arg2:String, _arg3:Object):Array{
            var _local4:uint;
            while (_local4 < _arg3[_arg2].length) {
                _arg1.push(_arg3[_arg2][_local4]);
                _local4++;
            };
            return (_arg1);
        }

        function frame1(){
            visible = false;
        }

        function frame2(){
            visible = true;
            stop();
        }


    }
}//package 
