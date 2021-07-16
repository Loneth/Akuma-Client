// Hidden Project Augoeides - Official Client Source
// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mcOption

package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.utils.Timer;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.media.SoundMixer;
    import flash.media.SoundTransform;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    //import flash.external.ExternalInterface;

    public class mcOption extends MovieClip {

        private const arrQuality:Array = new Array("AUTO", "LOW", "MEDIUM", "HIGH");

        public var txtGuild:TextField;
        public var txtFriendsList:TextField;
        public var btnLeftTool:MovieClip;
        public var txtGoto:TextField;
		public var txtShowPlayers:TextField;
        public var fbText:TextField;
        public var btnHelp:SimpleButton;
        public var btnLeftParty:MovieClip;
        public var txtFriend:TextField;
        public var btnLogoutFB:MovieClip;
        public var btnLeftWhisp:MovieClip;
        public var btnFriend:SimpleButton;
        public var mcAudio:MovieClip;
        public var txtFBLink:TextField;
        public var btnLeftCloak:MovieClip;
        public var txtCloak:TextField;
        public var btnRightCloak:MovieClip;
		public var btnLeftUserInterface:MovieClip;
        public var txtUserInterface:TextField;
        public var btnRightUserInterface:MovieClip;
		public var btnLeftSkillFX:MovieClip;
        public var txtSkillFX:TextField;
        public var btnRightSkillFX:MovieClip;
        public var btnAccount:MovieClip;
        public var mcVis:MovieClip;
        public var txtShare:TextField;
        public var btnLore:SimpleButton;
		public var btnDiscord:SimpleButton;
        public var btnRightWhisp:MovieClip;
        public var btnRightDuel:MovieClip;
        public var mcServer:MovieClip;
        public var btnLeftGuild:MovieClip;
		public var btnLeftTrade:MovieClip;
		public var btnRightTrade:MovieClip;
		public var txtTrade:TextField;
		public var btnLeftWorldChat:MovieClip;
		public var btnRightWorldChat:MovieClip;
		public var txtWorldChat:TextField;
        public var txtDuel:TextField;
		public var btnLeftWorldBoss:MovieClip;
		public var btnRightWorldBoss:MovieClip;
		public var txtWorldBoss:TextField;
        public var txtHelm:TextField;
        public var btnGame:MovieClip;
        public var btnPlayer:SimpleButton;
        public var btnRightGuild:MovieClip;
        public var btnGeneral:MovieClip;
        public var btnGuild:SimpleButton;
        public var btnCharPage:SimpleButton;
        public var btnRightParty:MovieClip;
        public var btnRightFriend:MovieClip;
        public var btnLeftFriend:MovieClip;
        public var txtTool:TextField;
        public var txtPet:TextField;
        public var btnLeftGoto:MovieClip;
		public var btnLeftShowPlayers:MovieClip;
		public var btnRightShowPlayers:MovieClip;
        public var btnIgnore:SimpleButton;
        public var bg:MovieClip;
        public var txtParty:TextField;
        public var btnRightTool:MovieClip;
        public var btnRightHelm:MovieClip;
        public var btnLeftHelm:MovieClip;
        public var btnChange:SimpleButton;
        public var btnLogout:SimpleButton;
        public var btnFBFriends:SimpleButton;
        public var btnRightPet:MovieClip;
        public var btnLeftPet:MovieClip;
        public var btnScreen:SimpleButton;
        public var btnChat:MovieClip;
        public var btnLink:SimpleButton;
        public var btnAcc:SimpleButton;
        public var txtWhisp:TextField;
        public var btnRightGoto:MovieClip;
        public var btnShare:SimpleButton;
        public var btnLeftDuel:MovieClip;
        private var rootClass:MovieClip;
        private var ptrQ:uint = 0;
        private var serverTimer:Timer;
        private var strFriend:String = "{app_id:163679093835836, redirect_uri:'www.aq.com/?something=something', title='title 50 max characters', data='requestTrackingID=5125136'}";
        private var strExclude:String = "";
        private var passMC:MovieClip;

        public function mcOption(_arg1:MovieClip){
            serverTimer = new Timer(1000);
            super();
            addFrameScript(0, frame1, 9, frame10, 17, frame18, 25, frame26);
            rootClass = _arg1;
        }

        public function Init():void{
            btnGeneral.gotoAndStop(1);
            btnChat.gotoAndStop(1);
            btnAccount.gotoAndStop(1);
            btnGame.gotoAndStop(1);
            if (this.currentLabel != "General"){
                this.gotoAndPlay("General");
            };
            btnGeneral.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnGeneral.gotoAndStop(2);
            btnChat.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnChat.buttonMode = true;
            btnAccount.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnAccount.buttonMode = true;
            btnGame.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnGame.buttonMode = true;
            bg.btnClose.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
            btnLogout.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
            setUpFrame("General");
            serverTimer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
            serverTimer.start();
        }

        public function InitAccount():void{
            btnGeneral.gotoAndStop(1);
            btnChat.gotoAndStop(1);
            btnAccount.gotoAndStop(1);
            btnGame.gotoAndStop(1);
            if (this.currentLabel != "Account"){
                this.gotoAndPlay("Account");
            };
            btnGeneral.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnGeneral.buttonMode = true;
            btnChat.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnChat.buttonMode = true;
            btnGame.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnGame.buttonMode = true;
            btnAccount.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnAccount.buttonMode = true;
            btnLogout.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
            bg.btnClose.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
            btnAccount.gotoAndStop(2);
            serverTimer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
            serverTimer.start();
        }

        private function timerHandler(_arg1:TimerEvent):void{
            if (stage == null){
                serverTimer.stop();
                serverTimer.removeEventListener(TimerEvent.TIMER, timerHandler);
            }
            else {
                if (mcServer != null){
                    mcServer.txtTime.text = rootClass.date_server.toLocaleTimeString();
                };
            };
            if (MovieClip(parent) != null){
                if (MovieClip(parent).currentLabel != "Option"){
                    MovieClip(parent).removeChild(this);
                    serverTimer.stop();
                    serverTimer.removeEventListener(TimerEvent.TIMER, timerHandler);
                };
            };
        }

        private function setUpFrame(_arg1:String):void{
            var _local2:uint;
            switch (_arg1){
                case "General":
                    mcAudio.txtAudio.text = ((rootClass.userPreference.data.bSoundOn) ? "On" : "Off");
                    mcVis.txtQuality.text = rootClass.userPreference.data.quality;
                    mcServer.txtServer.text = "Miracle";
                    if (!mcVis.btnLeftQual.hasEventListener(MouseEvent.CLICK)){
                        mcVis.btnLeftQual.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        mcVis.btnRightQual.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnScreen.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        mcAudio.btnLeftAudio.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        mcAudio.btnRightAudio.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnCharPage.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnFriend.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnGuild.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnIgnore.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnChange.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        _local2 = 0;
                        while (_local2 < arrQuality.length) {
                            if (mcVis.txtQuality.text == arrQuality[_local2]){
                                ptrQ = _local2;
                                break;
                            };
                            _local2++;
                        };
                    };
                    setQual();
                    return;
                case "Gameplay":
                    if (!btnRightTool.hasEventListener(MouseEvent.CLICK)){
                        btnRightTool.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftTool.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightPet.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftPet.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightHelm.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftHelm.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightCloak.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftCloak.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightGoto.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftGoto.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
						btnRightShowPlayers.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
						btnLeftShowPlayers.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
						btnRightUserInterface.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftUserInterface.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
						btnRightSkillFX.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightSkillFX.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                    };
                    txtTool.text = ((rootClass.uoPref.bTT) ? "On" : "Off");
                    txtPet.text = ((rootClass.uoPref.bPet) ? "Yes" : "No");
                    txtHelm.text = ((rootClass.uoPref.bHelm) ? "Yes" : "No");
                    txtCloak.text = ((rootClass.uoPref.bCloak) ? "Yes" : "No");
                    txtGoto.text = ((rootClass.uoPref.bGoto) ? "On" : "Off");
					txtShowPlayers.text = ((rootClass.uoPref.bShowPlayers) ? "Yes" : "No");
					txtUserInterface.text = ((rootClass.uoPref.bUI) ? "On" : "Off");
					txtSkillFX.text = ((rootClass.uoPref.bSkillFX) ? "On" : "Off");
                    return;
                case "Social":
                    if (!btnRightParty.hasEventListener(MouseEvent.CLICK)){
                        btnRightParty.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftParty.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightFriend.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftFriend.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightDuel.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftDuel.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightGuild.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftGuild.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
						btnRightTrade.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftTrade.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
						btnRightWorldChat.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftWorldChat.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
						btnRightWorldBoss.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftWorldBoss.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightWhisp.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftWhisp.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                    };
                    txtParty.text = ((rootClass.uoPref.bParty) ? "On" : "Off");
                    txtFriend.text = ((rootClass.uoPref.bFriend) ? "On" : "Off");
                    txtDuel.text = ((rootClass.uoPref.bDuel) ? "On" : "Off");
                    txtGuild.text = ((rootClass.uoPref.bGuild) ? "On" : "Off");
					txtTrade.text = ((rootClass.uoPref.bTrade) ? "On" : "Off");
					txtWorldBoss.text = ((rootClass.uoPref.bWorldBoss) ? "On" : "Off");
					txtWorldChat.text = ((rootClass.uoPref.bWorldChat) ? "On" : "Off");
                    txtWhisp.text = ((rootClass.uoPref.bWhisper) ? "On" : "Off");
                    return;
                case "Account":
                    if (!btnAcc.hasEventListener(MouseEvent.CLICK)){
                        btnAcc.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnHelp.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnPlayer.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLore.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        if ((((rootClass.world.myAvatar.objData.iAge < 13)) || ((((Game.objLogin.FBID > 0)) && (!(rootClass.FBApi.isLoggedIn)))))){
                            btnLink.visible = false;
                            txtFBLink.visible = false;
                            fbText.visible = false;
                        }
                        else {
                            btnLink.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        };
                    };
                    checkFBStatus();
                    txtFBLink.mouseEnabled = false;
                    btnLogoutFB.visible = rootClass.FBApi.isLoggedIn;
                    btnLogoutFB.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                    btnLogoutFB.buttonMode = true;
                    btnFBFriends.visible = false;
                    txtFriendsList.visible = false;
                    btnShare.visible = false;
                    txtShare.visible = false;
                    return;
            };
        }

        private function onClick(_arg1:MouseEvent):void{
            btnGeneral.gotoAndStop(1);
            btnChat.gotoAndStop(1);
            btnAccount.gotoAndStop(1);
            btnGame.gotoAndStop(1);
            _arg1.currentTarget.gotoAndStop(2);
            switch (_arg1.currentTarget.name){
                case "btnGeneral":
                    if (this.currentLabel != "General"){
                        this.gotoAndPlay("General");
                    };
                    return;
                case "btnGame":
                    if (this.currentLabel != "Gameplay"){
                        this.gotoAndPlay("Gameplay");
                    };
                    return;
                case "btnChat":
                    if (this.currentLabel != "Social"){
                        this.gotoAndPlay("Social");
                    };
                    return;
                case "btnAccount":
                    if (this.currentLabel != "Account"){
                        this.gotoAndPlay("Account");
                    };
                    return;
            };
        }

        private function onArrowClick(_arg1:MouseEvent):void{
            var _local2:MovieClip;
            rootClass.mixer.playSound("Click");
            switch (_arg1.currentTarget.name){
                case "btnLeftQual":
                    ptrQ = (((--ptrQ)<0) ? 3 : ptrQ);
                    setQual();
                    return;
                case "btnRightQual":
                    ptrQ = (((++ptrQ)>3) ? 0 : ptrQ);
                    setQual();
                    return;
                case "btnScreen":
                    rootClass.toggleFullScreen();
                    return;
                case "btnLeftAudio":
                case "btnRightAudio":
                    mcAudio.txtAudio.text = (((mcAudio.txtAudio.text)=="On") ? "Off" : "On");
                    if (rootClass.userPreference.data.bSoundOn){
                        rootClass.mixer.bSoundOn = false;
                        SoundMixer.stopAll();
                        SoundMixer.soundTransform = new SoundTransform(0);
                    }
                    else {
                        rootClass.mixer.bSoundOn = true;
                        SoundMixer.soundTransform = new SoundTransform(1);
                    };
                    rootClass.uoPref.bSoundOn = rootClass.mixer.bSoundOn;
                    rootClass.userPreference.data.bSoundOn = rootClass.mixer.bSoundOn;
                    rootClass.userPreference.flush();
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bSoundOn", String(rootClass.uoPref.bSoundOn)], "str", 1);
                    return;
                case "btnLeftPet":
                case "btnRightPet":
                    txtPet.text = (((txtPet.text)=="Yes") ? "No" : "Yes");
                    if (rootClass.uoPref.bPet){
                        rootClass.uoPref.bPet = false;
                        rootClass.world.hideAllPets();
                    }
                    else {
                        rootClass.uoPref.bPet = true;
                        rootClass.world.showAllPets();
                    };
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bPet", String(rootClass.uoPref.bPet)], "str", 1);
                    return;
                case "btnLeftHelm":
                case "btnRightHelm":
                    txtHelm.text = (((txtHelm.text)=="Yes") ? "No" : "Yes");
                    rootClass.uoPref.bHelm = !(rootClass.uoPref.bHelm);
                    rootClass.world.myAvatar.dataLeaf.showHelm = rootClass.uoPref.bHelm;
                    rootClass.world.myAvatar.pMC.setHelmVisibility(rootClass.uoPref.bHelm);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bHelm", String(rootClass.uoPref.bHelm)], "str", 1);
                    return;
                case "btnLeftCloak":
                case "btnRightCloak":
                    txtCloak.text = (((txtCloak.text)=="Yes") ? "No" : "Yes");
                    rootClass.uoPref.bCloak = !(rootClass.uoPref.bCloak);
                    rootClass.world.myAvatar.dataLeaf.showCloak = rootClass.uoPref.bCloak;
                    rootClass.world.myAvatar.pMC.setCloakVisibility(rootClass.uoPref.bCloak);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bCloak", String(rootClass.uoPref.bCloak)], "str", 1);
                    return;
                case "btnLeftTool":
                case "btnRightTool":
                    txtTool.text = (((txtTool.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bTT = !(rootClass.uoPref.bTT);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bTT", String(rootClass.uoPref.bTT)], "str", 1);
                    return;
                case "btnLeftGoto":
                case "btnRightGoto":
                    txtGoto.text = (((txtGoto.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bGoto = !(rootClass.uoPref.bGoto);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bGoto", String(rootClass.uoPref.bGoto)], "str", 1);
                    return;
				case "btnLeftShowPlayers":
                case "btnRightShowPlayers":
                    txtShowPlayers.text = (((txtShowPlayers.text)=="Yes") ? "No" : "Yes");
                    rootClass.uoPref.bShowPlayers = !(rootClass.uoPref.bShowPlayers);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bShowPlayers", String(rootClass.uoPref.bShowPlayers)], "str", 1);
					if (rootClass.uoPref.bShowPlayers){
                        //rootClass.world.showAllAvatars();
						rootClass.ui.mcInterface.mcMenu.btnShowAvatar.visible = false;
						rootClass.world.hideAvatars = false;
						rootClass.world.cellSetup("1.3", "10", "normal");
                    }
                    else {
						rootClass.ui.mcInterface.mcMenu.btnShowAvatar.visible = true;
						rootClass.world.hideAvatars = true;
						rootClass.world.cellSetup("1.3", "10", "normal");
                    };
                    return;
				case "btnLeftSkillFX":
                case "btnRightSkillFX":
                    txtSkillFX.text = (((txtSkillFX.text)=="On") ? "Off" : "On");
					rootClass.SkillAnimOptions = txtSkillFX.text;
                    rootClass.uoPref.bSkillFX = !(rootClass.uoPref.bSkillFX);
					rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bSkillFX", String(rootClass.uoPref.bSkillFX)], "str", 1);
                    return;
				case "btnLeftUserInterface":
                case "btnRightUserInterface":
                    txtUserInterface.text = (((txtUserInterface.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bUI = !(rootClass.uoPref.bUI);
					if (rootClass.uoPref.bUI){
						rootClass.ui.mcPortrait.visible = true;
						rootClass.ui.mcInterface.visible = true;
						rootClass.ui.iconQuest.visible = true;
						rootClass.ui.mcPVPQueue.visible = true;
						rootClass.ui.mcPartyFrame.visible = true;
						rootClass.ui.mcServerTime.visible = true;
					}
					else {
						rootClass.ui.mcPortrait.visible = false;
						rootClass.ui.mcPortraitTarget.visible = false;
						rootClass.ui.mcInterface.visible = false;
						rootClass.ui.iconQuest.visible = false;
						rootClass.ui.mcServerTime.visible = false;
						rootClass.ui.mcPVPQueue.visible = false;
						rootClass.ui.mcPartyFrame.visible = false;
						rootClass.ui.btnTargetPortraitClose.visible = false;
					};
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bUI", String(rootClass.uoPref.bUI)], "str", 1);
                    return;
                case "btnLeftParty":
                case "btnRightParty":
                    txtParty.text = (((txtParty.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bParty = !(rootClass.uoPref.bParty);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bParty", String(rootClass.uoPref.bParty)], "str", 1);
                    return;
                case "btnLeftDuel":
                case "btnRightDuel":
                    txtDuel.text = (((txtDuel.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bDuel = !(rootClass.uoPref.bDuel);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bDuel", String(rootClass.uoPref.bDuel)], "str", 1);
                    return;
                case "btnLeftFriend":
                case "btnRightFriend":
                    txtFriend.text = (((txtFriend.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bFriend = !(rootClass.uoPref.bFriend);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bFriend", String(rootClass.uoPref.bFriend)], "str", 1);
                    return;
                case "btnLeftGuild":
                case "btnRightGuild":
                    txtGuild.text = (((txtGuild.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bGuild = !(rootClass.uoPref.bGuild);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bGuild", String(rootClass.uoPref.bGuild)], "str", 1);
                    return;
				case "btnLeftTrade":
                case "btnRightTrade":
                    txtTrade.text = (((txtTrade.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bTrade = !(rootClass.uoPref.bTrade);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bTrade", String(rootClass.uoPref.bTrade)], "str", 1);
                    return;
				case "btnLeftWorldBoss":
                case "btnRightWorldBoss":
                    txtWorldBoss.text = (((txtWorldBoss.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bWorldBoss = !(rootClass.uoPref.bWorldBoss);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bWorldBoss", String(rootClass.uoPref.bWorldBoss)], "str", 1);
                    return;
				case "btnLeftWorldChat":
                case "btnRightWorldChat":
                    txtWorldChat.text = (((txtWorldChat.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bWorldChat = !(rootClass.uoPref.bWorldChat);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bWorldChat", String(rootClass.uoPref.bWorldChat)], "str", 1);
                    return;
                case "btnLeftWhisp":
                case "btnRightWhisp":
                    txtWhisp.text = (((txtWhisp.text)=="On") ? "Off" : "On");
                    rootClass.uoPref.bWhisper = !(rootClass.uoPref.bWhisper);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bWhisper", String(rootClass.uoPref.bWhisper)], "str", 1);
                    return;
                case "btnFriend":
                    rootClass.world.showFriendsList();
                    return;
                case "btnGuild":
                    rootClass.world.showGuildList();
                    return;
                case "btnIgnore":
                    rootClass.world.showIgnoreList();
                    return;
                case "btnAcc":
                    navigateToURL(new URLRequest("http://le-miracle.online/?account"), "_blank");
                    return;
                case "btnChar":
                    return;
                case "btnHelp":
                    navigateToURL(new URLRequest("http://le-miracle.online/?contact"), "_blank");
                    return;
                case "btnCharPage":
                    rootClass.mixer.playSound("Click");
                    if (rootClass.params.strSourceID == "BBGames"){
                        navigateToURL(new URLRequest(("http://leviathanworlds.fun/?profile=" + rootClass.world.myAvatar.objData.strUsername)), "_blank");
                    }
                    else {
                        navigateToURL(new URLRequest(("http://leviathanworlds.fun/?profile=" + rootClass.world.myAvatar.objData.strUsername)), "_blank");
                    };
                    return;
                case "btnLogout":
                    rootClass.logout();
                    return;
                case "btnClose":
                    serverTimer.stop();
                    serverTimer.removeEventListener(TimerEvent.TIMER, timerHandler);
                    btnGeneral.gotoAndStop(1);
                    btnChat.gotoAndStop(1);
                    btnAccount.gotoAndStop(1);
                    btnGame.gotoAndStop(1);
                    if (this.currentLabel != "General"){
                        this.gotoAndPlay("General");
                    };
                    _local2 = MovieClip(parent);
                    _local2.removeChild(this);
                    if (_local2.currentLabel != "Init"){
                        _local2.gotoAndPlay("Init");
                    };
                    return;
                case "btnLore":
                    navigateToURL(new URLRequest("http://le-miracle.online/Wiki"), "_blank");
                    return;
                case "btnChange":
					rootClass.showCharacterList();
					//rootClass.gotoAndStop("Login");
                    //rootClass.mcLogin.gotoAndStop("Characters");
                    return;
                case "btnPlayer":
                    navigateToURL(new URLRequest("http://Facebook.com/augoeides.mmo/"), "_blank");
                    return;
                case "btnLink":
                    if (!rootClass.FBApi.isLoggedIn){
                        //ExternalInterface.call("fbLoginWithPermissions", "email,publish_actions", "linkAccount");
                    }
                    else {
                        passMC = (new mcFBPassword(rootClass) as MovieClip);
                        passMC.x = 268;
                        passMC.y = 30;
                        rootClass.ui.addChild(passMC);
                    };
                    return;
                case "btnLogoutFB":
                    rootClass.FBApi.logoutFromFB();
                    rootClass.logout();
                    return;
            };
        }

        private function setQual():void{
            mcVis.txtQuality.text = (rootClass.userPreference.data.quality = arrQuality[ptrQ]);
            if (rootClass.userPreference.data.quality == "AUTO"){
                stage.quality = "HIGH";
            }
            else {
                stage.quality = rootClass.userPreference.data.quality;
            };
            rootClass.userPreference.flush();
        }

        public function checkFBStatus():void{
            if (this.currentLabel == "Account"){
                txtFBLink.text = ((rootClass.FBApi.isLoggedIn) ? "Unlink" : "Link");
            };
        }

        public function closeUnlink():void{
            try {
                rootClass.ui.removeChild(passMC);
            }
            catch(e) {
            };
        }

        function frame1(){
            this.setUpFrame(this.currentLabel);
            stop();
        }

        function frame10(){
            this.setUpFrame(this.currentLabel);
            stop();
        }

        function frame18(){
            this.setUpFrame(this.currentLabel);
            stop();
        }

        function frame26(){
            this.setUpFrame(this.currentLabel);
            stop();
        }


    }
}//package 

