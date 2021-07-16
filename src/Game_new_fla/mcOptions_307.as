// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcOptions_307

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.external.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class mcOptions_307 extends MovieClip 
    {

        public var chkHelm:MovieClip;
        public var btnLogout:SimpleButton;
        public var chkSound:MovieClip;
        public var chkPVP:MovieClip;
        public var btnHigh:SimpleButton;
        public var btnFS:SimpleButton;
        public var chkFriend:MovieClip;
        public var bg:LPFPanelBg;
        public var btnIgnore:SimpleButton;
        public var btnLow:SimpleButton;
        public var arrQuality:Array;
        public var btnTopWD:SimpleButton;
        public var txtQuality:TextField;
        public var btnTopAP:SimpleButton;
        public var btnTopDP:SimpleButton;
        public var chkTT:MovieClip;
        public var chkPet:MovieClip;
        public var rootClass:MovieClip;
        public var chkCloak:MovieClip;
        public var txtServer:TextField;
        public var chkParty:MovieClip;
        public var intCurQuality:int;

        public function mcOptions_307()
        {
            addFrameScript(0, frame1);
        }
        public function onSoundClick(_arg1:Event):void
        {
            if (!chkSound.bitChecked){
                chkSound.bitChecked = (rootClass.mixer.bSoundOn = false);
                SoundMixer.stopAll();
            } else {
                chkSound.bitChecked = (rootClass.mixer.bSoundOn = true);
                rootClass.mixer.playSound("Click");
            };
            rootClass.uoPref.bSoundOn = rootClass.mixer.bSoundOn;
            chkSound.bitChecked = rootClass.uoPref.bSoundOn;
            rootClass.userPreference.data.bSoundOn = rootClass.mixer.bSoundOn;
            rootClass.userPreference.flush();
            rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bSoundOn", String(rootClass.uoPref.bSoundOn)], "str", 1);
        }
        public function onFriendClick(_arg1:Event):void
        {
            if (!chkFriend.bitChecked){
                chkFriend.bitChecked = (rootClass.uoPref.bFriend = false);
            } else {
                chkFriend.bitChecked = (rootClass.uoPref.bFriend = true);
            };
            rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bFriend", String(rootClass.uoPref.bFriend)], "str", 1);
        }
        public function onHighClick(_arg1:Event):void
        {
            if (intCurQuality < 2){
                rootClass.mixer.playSound("Click");
                intCurQuality++;
                stage.quality = arrQuality[intCurQuality];
                switch (stage.quality){
                    case "LOW":
                        txtQuality.text = "低";
                        return;
                    case "MEDIUM":
                        txtQuality.text = "中";
                        return;
                    case "HIGH":
                        txtQuality.text = "高";
                        return;
                };
            };
        }
        public function onTTClick(_arg1:Event):void
        {
            if (!chkTT.bitChecked){
                chkTT.bitChecked = (rootClass.uoPref.bTT = false);
            } else {
                chkTT.bitChecked = (rootClass.uoPref.bTT = true);
            };
            rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bTT", String(rootClass.uoPref.bTT)], "str", 1);
        }
        public function onLogout(_arg1:Event):void
        {
            var _local2:String;
            rootClass.mixer.playSound("Click");
            if (rootClass.params.SrcURL != null){
                _local2 = rootClass.params.SrcURL;
                navigateToURL(new URLRequest(_local2), "_self");
            } else {
                rootClass.logout();
            };
        }
        public function onToggleFullScreen(_arg1:Event):void
        {
            rootClass.toggleFullScreen();
        }
        public function onPartyClick(_arg1:Event):void
        {
            if (!chkParty.bitChecked){
                chkParty.bitChecked = (rootClass.uoPref.bParty = false);
            } else {
                chkParty.bitChecked = (rootClass.uoPref.bParty = true);
            };
            rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bParty", String(rootClass.uoPref.bParty)], "str", 1);
        }
        public function onIgnore(_arg1:Event):void
        {
            rootClass.mixer.playSound("Click");
            rootClass.world.showIgnoreList();
        }
        public function onLowClick(_arg1:Event):void
        {
            if (intCurQuality > 0){
                rootClass.mixer.playSound("Click");
                intCurQuality--;
                stage.quality = arrQuality[intCurQuality];
                switch (stage.quality){
                    case "LOW":
                        txtQuality.text = "低";
                        return;
                    case "MEDIUM":
                        txtQuality.text = "中";
                        return;
                    case "HIGH":
                        txtQuality.text = "高";
                        return;
                };
            };
        }
        public function onClose(_arg1:Event=null):void
        {
            if (MovieClip(parent).currentLabel != "Init"){
                rootClass.mixer.playSound("Click");
                MovieClip(parent).gotoAndPlay("Init");
            };
        }
        public function onPetClick(_arg1:Event):void
        {
            if (!chkPet.bitChecked){
                chkPet.bitChecked = (rootClass.uoPref.bPet = false);
                rootClass.world.hideAllPets();
            } else {
                chkPet.bitChecked = (rootClass.uoPref.bPet = true);
                rootClass.world.showAllPets();
            };
            rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bPet", String(rootClass.uoPref.bPet)], "str", 1);
        }
        public function onTopAP(_arg1:Event):void
        {
            rootClass.mixer.playSound("Click");
            rootClass.world.requestGetTop("AP");
        }
        public function onTopDP(_arg1:Event):void
        {
            rootClass.mixer.playSound("Click");
            rootClass.world.requestGetTop("DP");
        }
        public function onTopWD(_arg1:Event):void
        {
            rootClass.mixer.playSound("Click");
            rootClass.world.requestGetTop("WD");
        }
        public function onPVPClick(_arg1:Event):void
        {
            if (!chkPVP.bitChecked){
                chkPVP.bitChecked = (rootClass.uoPref.bPVP = false);
            } else {
                chkPVP.bitChecked = (rootClass.uoPref.bPVP = true);
            };
            rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bPVP", String(rootClass.uoPref.bPVP)], "str", 1);
        }
        public function onHelmClick(_arg1:Event):void
        {
            if (!chkHelm.bitChecked){
                chkHelm.bitChecked = (rootClass.uoPref.bHelm = false);
            } else {
                chkHelm.bitChecked = (rootClass.uoPref.bHelm = true);
            };
            rootClass.world.myAvatar.dataLeaf.showHelm = rootClass.uoPref.bHelm;
            rootClass.world.myAvatar.pMC.setHelmVisibility(rootClass.uoPref.bHelm);
            rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bHelm", String(rootClass.uoPref.bHelm)], "str", 1);
        }
        public function onCloakClick(_arg1:Event):void
        {
            if (!chkCloak.bitChecked){
                chkCloak.bitChecked = (rootClass.uoPref.bCloak = false);
            } else {
                chkCloak.bitChecked = (rootClass.uoPref.bCloak = true);
            };
            rootClass.world.myAvatar.dataLeaf.showCloak = rootClass.uoPref.bCloak;
            rootClass.world.myAvatar.pMC.setCloakVisibility(rootClass.uoPref.bCloak);
            rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bCloak", String(rootClass.uoPref.bCloak)], "str", 1);
        }
        function frame1()
        {
            stop();
            bg.frame.height = 445;
            bg.bg.height = (bg.frame.height - 10);
            bg.tTitle.text = "设置选项";
            rootClass = MovieClip(stage.getChildAt(0));
            arrQuality = new Array("LOW", "MEDIUM", "HIGH");
            intCurQuality = arrQuality.indexOf(stage.quality);
            switch (stage.quality){
                case "LOW":
                    txtQuality.text = "低";
                    break;
                case "MEDIUM":
                    txtQuality.text = "中";
                    break;
                case "HIGH":
                    txtQuality.text = "高";
                    break;
            };
            txtServer.text = rootClass.objServerInfo.sName;
            chkSound.chkBtn.addEventListener(MouseEvent.CLICK, onSoundClick, false, 0, true);
            chkSound.bitChecked = rootClass.mixer.bSoundOn;
            chkSound.checkmark.visible = rootClass.mixer.bSoundOn;
            chkPet.chkBtn.addEventListener(MouseEvent.CLICK, onPetClick, false, 0, true);
            chkPet.checkmark.visible = (chkPet.bitChecked = rootClass.uoPref.bPet);
            chkParty.chkBtn.addEventListener(MouseEvent.CLICK, onPartyClick, false, 0, true);
            chkParty.checkmark.visible = (chkParty.bitChecked = rootClass.uoPref.bParty);
            chkFriend.chkBtn.addEventListener(MouseEvent.CLICK, onFriendClick, false, 0, true);
            chkFriend.checkmark.visible = (chkFriend.bitChecked = rootClass.uoPref.bFriend);
            chkPVP.chkBtn.addEventListener(MouseEvent.CLICK, onPVPClick, false, 0, true);
            chkPVP.checkmark.visible = (chkPVP.bitChecked = rootClass.uoPref.bPVP);
            chkCloak.chkBtn.addEventListener(MouseEvent.CLICK, onCloakClick, false, 0, true);
            chkCloak.checkmark.visible = (chkCloak.bitChecked = rootClass.uoPref.bCloak);
            chkHelm.chkBtn.addEventListener(MouseEvent.CLICK, onHelmClick, false, 0, true);
            chkHelm.checkmark.visible = (chkHelm.bitChecked = rootClass.uoPref.bHelm);
            chkTT.chkBtn.addEventListener(MouseEvent.CLICK, onTTClick, false, 0, true);
            chkTT.checkmark.visible = (chkTT.bitChecked = rootClass.uoPref.bTT);
            btnLow.addEventListener(MouseEvent.CLICK, onLowClick, false, 0, true);
            btnHigh.addEventListener(MouseEvent.CLICK, onHighClick, false, 0, true);
            btnTopAP.addEventListener(MouseEvent.CLICK, onTopAP, false, 0, true);
            btnTopDP.addEventListener(MouseEvent.CLICK, onTopDP, false, 0, true);
            btnTopWD.addEventListener(MouseEvent.CLICK, onTopWD, false, 0, true);
            btnIgnore.addEventListener(MouseEvent.CLICK, onIgnore, false, 0, true);
            btnLogout.addEventListener(MouseEvent.CLICK, onLogout, false, 0, true);
            btnFS.addEventListener(MouseEvent.CLICK, onToggleFullScreen, false, 0, true);
            bg.btnClose.addEventListener(MouseEvent.CLICK, onClose, false, 0, true);
        }

    }
}//package Game_new_fla

