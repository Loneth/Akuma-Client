// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcMenu_167

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
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

    public dynamic class mcMenu_167 extends MovieClip 
    {

        public var btnTower:SimpleButton;
        public var btnDailyUGC:SimpleButton;
        public var btnMetallurgy:SimpleButton;
        public var trainStateTxt:TextField;
        public var btnTrain:SimpleButton;
        public var btnEvent:SimpleButton;
        public var btnArchaeology:SimpleButton;
        public var titleDailyQuest:MovieClip;
        public var btnEye:SimpleButton;
        public var titleDance:MovieClip;
        public var btnTop:SimpleButton;
        public var titleTop:MovieClip;
        public var btnAddEnergy:SimpleButton;
        public var btnAddition:SimpleButton;
        public var btnDance:SimpleButton;
        public var btnEnchant:SimpleButton;
        public var btnDailyQuest:SimpleButton;
        public var btnQuest:SimpleButton;
        public var mineStateTxt:TextField;
        public var btnMine:SimpleButton;
        public var titleAttestation:MovieClip;
        public var btnGua:SimpleButton;
        public var btnAnswer:SimpleButton;
        public var btnUpC:SimpleButton;
        public var titleDailyUGC:MovieClip;
        public var btnChar:SimpleButton;
        public var btnAward:SimpleButton;
        public var btnBank:SimpleButton;
        public var btnBox:SimpleButton;
        public var btnBag:SimpleButton;
        public var mcEvent:MovieClip;
        public var btnAddMagic:SimpleButton;
        public var titleMetallurgy:MovieClip;
        public var GChit:SimpleButton;
        public var btnSynthesis:SimpleButton;
        public var btnMap:SimpleButton;
        public var btnVIP:SimpleButton;
        public var btnUpgrade:SimpleButton;
        public var btnOption:SimpleButton;
        public var rootClass:MovieClip;
        public var soundOF:MovieClip;

        public function mcMenu_167()
        {
            addFrameScript(0, frame1);
        }
        public function onMouseOver(_arg1:MouseEvent)
        {
            var _local2:MovieClip;
            var _local3:MovieClip;
            _local2 = MovieClip(stage.getChildAt(0));
            _local3 = MovieClip(stage.getChildAt(0)).ui.ToolTip;
            switch (_arg1.currentTarget.name){
                case "btnBag":
                    _local3.openWith({str:"背包（B）"});
                    return;
                case "btnDailyUGC":
                    _local3.openWith({str:"<p align='center'>副本信息<br/>每天6点恢复默认5次</p>"});
                    return;
                case "btnDailyQuest":
                    _local3.openWith({str:"每日任务"});
                    return;
                case "btnMetallurgy":
                    _local3.openWith({str:"<p align='center'>炼金<br/>每天6点恢复炼金次数</p>"});
                    return;
                case "titleAttestation":
                    _local3.openWith({str:"进行防沉迷认证"});
                    return;
                case "btnAddEnergy":
                    if (_local2.world.myAvatar.objData.iExtraEnergy >= _local2.arrBuyExtraEnergy[_local2.world.myAvatar.objData.iUpg]){
                        _local3.openWith({str:"<p align='center'><font color='#FF0000'>没有购买精力次数了<br/>每天6点恢复购买次数</font></p>"});
                    } else {
                        _local3.openWith({str:(("<p align='center'><font color='#FFFF00'>支付" + _local2.getCoins("Energy", (_local2.world.myAvatar.objData.iExtraEnergy + 1))) + "点数<br/>购买30精力点</font></p>")});
                    };
                    return;
                case "btnAddMagic":
                    if (_local2.world.myAvatar.objData.iExtraMagic >= _local2.arrBuyExtraMagic[_local2.world.myAvatar.objData.iUpg]){
                        _local3.openWith({str:"<p align='center'><font color='#FF0000'>没有购买魔力次数了<br/>每天6点恢复购买次数</font></p>"});
                    } else {
                        _local3.openWith({str:(((("<p align='center'><font color='#FFFF00'>支付" + _local2.getCoins("Magic", (_local2.world.myAvatar.objData.iExtraMagic + 1))) + "点数<br/>购买") + _local2.getBuyMagic()) + "魔力值</font></p>")});
                    };
                    return;
                case "btnGua":
                    if (_local2.world.intType == "1"){
                        _local3.openWith({str:"当前地图可以挂机！"});
                    } else {
                        _local3.openWith({str:"<font color='#FF0000'>当前地图无法挂机！</font>"});
                    };
                    return;
                case "btnEvent":
                    if ((((((((_local2.intEvent1Sta == 1)) && ((_local2.intEvent1Num == -1)))) || ((((_local2.intEvent2Sta == 1)) && ((_local2.intEvent2Num == -1)))))) || ((((_local2.intEvent3Sta == 1)) && ((_local2.intEvent3Num == -1)))))){
                        _local3.openWith({str:"当前有限时活动开启!"});
                    } else {
                        _local3.openWith({str:"活动"});
                    };
                    return;
                case "btnArchaeology":
                    _local3.openWith({str:"进入探宝"});
                    return;
                case "btnTrain":
                    _local3.openWith({str:"进入训练场"});
                    return;
                case "btnMine":
                    _local3.openWith({str:"进入采矿场"});
                    return;
                case "btnDance":
                    _local3.openWith({str:"进入圣装舞会"});
                    return;
                case "btnTop":
                    _local3.openWith({str:"排行榜及排行奖励"});
                    return;
                case "btnUpgrade":
                    _local3.openWith({str:"装备强化（N）"});
                    return;
                case "btnSynthesis":
                    _local3.openWith({str:"装备合成（K）"});
                    return;
                case "btnEnchant":
                    _local3.openWith({str:"装备附魔（J）"});
                    return;
                case "btnAddition":
                    _local3.openWith({str:"装备洗炼（P）"});
                    return;
                case "btnEye":
                    switch (stage.quality){
                        case "LOW":
                            _local3.openWith({str:"画面质量：低"});
                            break;
                        case "MEDIUM":
                            _local3.openWith({str:"画面质量：中"});
                            break;
                        case "HIGH":
                            _local3.openWith({str:"画面质量：高"});
                            break;
                    };
                    return;
                case "soundOF":
                    if (_local2.mixer.bSoundOn){
                        _local3.openWith({str:"声音：开"});
                    } else {
                        _local3.openWith({str:"声音：关"});
                    };
                    return;
                case "btnTower":
                    _local3.openWith({str:"挑战罪恶之塔，可获得大量金币！"});
                    return;
                case "btnAnswer":
                    _local3.openWith({str:"挑战解谜学院，可获得大量魔力！"});
                    return;
                case "btnBank":
                    _local3.openWith({str:"圣甲宝库，可获得丰富奖励！"});
                    return;
                case "btnBox":
                    _local3.openWith({str:"领取大礼包！"});
                    return;
                case "btnAward":
                    _local3.openWith({str:"领取充值礼包！"});
                    return;
                case "GChit":
                    _local3.openWith({str:"游戏点数"});
                    return;
                case "btnVIP":
                    if (_local2.world.myAvatar.objData.iUpg == 0){
                        _local3.openWith({str:"充值（升级VIP）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 1){
                        _local3.openWith({str:"充值（VIP1星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 2){
                        _local3.openWith({str:"充值（VIP2星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 3){
                        _local3.openWith({str:"充值（VIP3星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 4){
                        _local3.openWith({str:"充值（VIP4星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 5){
                        _local3.openWith({str:"充值（VIP5星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 6){
                        _local3.openWith({str:"充值（VIP6星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 7){
                        _local3.openWith({str:"充值（VIP7星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 8){
                        _local3.openWith({str:"充值（VIP8星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 9){
                        _local3.openWith({str:"充值（VIP9星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 10){
                        _local3.openWith({str:"充值（VIP10星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 11){
                        _local3.openWith({str:"充值（VIP11星）"});
                    };
                    if (_local2.world.myAvatar.objData.iUpg == 12){
                        _local3.openWith({str:"充值（VIP12星）"});
                    };
                    return;
                case "btnUpC":
                    _local3.openWith({str:"刷新游戏点数（在线充值后使用）"});
                    return;
                case "btnMap":
                    _local3.openWith({str:"地图（M）"});
                    return;
                case "btnOption":
                    _local3.openWith({str:"设置选项（O）"});
                    return;
                case "btnQuest":
                    _local3.openWith({str:"任务（L）"});
                    return;
                case "btnChar":
                    _local3.openWith({str:"人物属性（C）"});
                    return;
            };
        }
        public function onMouseClick(_arg1:MouseEvent)
        {
            var _local2:MovieClip;
            var _local3:MovieClip;
            _local2 = MovieClip(stage.getChildAt(0));
            _local3 = MovieClip(stage.getChildAt(0)).ui.ToolTip;
            MovieClip(Game.root).mixer.playSound("Click");
            switch (_arg1.currentTarget.name){
                case "btnAddition":
                    if (_local2.ui.mcPopup.currentLabel == "Addition"){
                        MovieClip(_local2.ui.mcPopup.getChildByName("mcAddition")).fClose();
                    } else {
                        _local2.ui.mcPopup.fOpen("Addition");
                    };
                    return;
                case "btnBag":
                    toggleInventory();
                    return;
                case "btnMap":
                    if (_local2.ui.mcPopup.currentLabel == "Map"){
                        _local2.ui.mcPopup.onClose();
                    } else {
                        _local2.ui.mcPopup.fOpen("Map");
                    };
                    return;
                case "btnTower":
                    _local2.world.transmitter("罪恶之塔", "Enter", "Spawn");
                    return;
                case "btnAnswer":
                    _local2.world.transmitter("解谜学院", "Enter", "Spawn");
                    return;
                case "btnBank":
                    _local2.world.transmitter("圣甲宝库", "Enter", "Spawn");
                    return;
                case "btnDance":
                    _local2.world.transmitter("圣装舞会", "Enter", "Spawn");
                    return;
                case "btnBox":
                case "GChit":
                case "btnVIP0":
                case "btnVIP":
                    _local2.showUpgradeWindow();
                    return;
                case "btnUpC":
                    _local2.world.sendUpdatedCoinsRequest();
                    return;
                case "btnEye":
                    switch (stage.quality){
                        case "LOW":
                            stage.quality = "HIGH";
                            _local3.openWith({str:"画面质量：高"});
                            break;
                        case "MEDIUM":
                            stage.quality = "LOW";
                            _local3.openWith({str:"画面质量：低"});
                            break;
                        case "HIGH":
                            stage.quality = "MEDIUM";
                            _local3.openWith({str:"画面质量：中"});
                            break;
                    };
                    return;
                case "soundOF":
                    if (!soundOF.bitChecked){
                        soundOF.bitChecked = (_local2.mixer.bSoundOn = false);
                        SoundMixer.stopAll();
                    } else {
                        soundOF.bitChecked = (_local2.mixer.bSoundOn = true);
                        _local2.mixer.playSound("Click");
                    };
                    _local2.uoPref.bSoundOn = _local2.mixer.bSoundOn;
                    soundOF.bitChecked = _local2.uoPref.bSoundOn;
                    _local2.userPreference.data.bSoundOn = _local2.mixer.bSoundOn;
                    _local2.userPreference.flush();
                    _local2.sfc.sendXtMessage("zm", "cmd", ["uopref", "bSoundOn", String(_local2.uoPref.bSoundOn)], "str", 1);
                    if (_local2.mixer.bSoundOn){
                        _local3.openWith({str:"声音：开"});
                    } else {
                        _local3.openWith({str:"声音：关"});
                    };
                    return;
                case "btnTrain":
                    _local2.world.loadSceneMovie(_local2.world.objInfo.sTrain);
                    return;
                case "btnMine":
                    _local2.world.loadSceneMovie(_local2.world.objInfo.sMine);
                    return;
                case "btnArchaeology":
                    _local2.world.loadSceneMovie(_local2.world.objInfo.sArchaeolo);
                    return;
                case "btnGua":
                    _local2.world.toggleGua("guaM");
                    return;
                case "btnEvent":
                    if (_local2.ui.mcPopup.currentLabel == "News"){
                        _local2.ui.mcPopup.onClose();
                    } else {
                        _local2.ui.mcPopup.fOpen("News");
                    };
                    return;
                case "btnAward":
                    if (_local2.ui.mcPopup.currentLabel == "Award"){
                        _local2.ui.mcPopup.onClose();
                    } else {
                        _local2.ui.mcPopup.fOpen("Award");
                    };
                    return;
                case "btnTop":
                    if (_local2.ui.mcPopup.currentLabel == "Top"){
                        _local2.ui.mcPopup.onClose();
                    } else {
                        _local2.ui.mcPopup.fOpen("Top");
                    };
                    return;
                case "btnMetallurgy":
                    _local2.world.loadSceneMovie(_local2.world.objInfo.sMetallurg);
                    return;
                case "btnAddEnergy":
                    _local2.world.toggleAddEnergy();
                    onMouseOut(_arg1);
                    return;
                case "btnAddMagic":
                    _local2.world.toggleAddMagic();
                    onMouseOut(_arg1);
                    return;
                case "titleAttestation":
                    _local2.ui.mcPopup.fOpen("Attestation");
                    return;
                case "btnDailyUGC":
                    if (_local2.ui.mcPopup.currentLabel == "Book"){
                        _local2.ui.mcPopup.onClose();
                    } else {
                        _local2.world.booksLabel = "Adventure";
                        _local2.ui.mcPopup.fOpen("Book");
                    };
                    return;
                case "btnDailyQuest":
                    if (_local2.ui.mcPopup.currentLabel == "Book"){
                        _local2.ui.mcPopup.onClose();
                    } else {
                        _local2.world.booksLabel = "Quest";
                        _local2.ui.mcPopup.fOpen("Book");
                    };
                    return;
                case "btnSynthesis":
                    if (_local2.ui.mcPopup.currentLabel == "Synthesis"){
                        MovieClip(_local2.ui.mcPopup.getChildByName("mcSynthesis")).fClose();
                    } else {
                        _local2.ui.mcPopup.fOpen("Synthesis");
                    };
                    return;
                case "btnUpgrade":
                    if (_local2.ui.mcPopup.currentLabel == "Upgrade"){
                        MovieClip(_local2.ui.mcPopup.getChildByName("mcUpgrade")).fClose();
                    } else {
                        _local2.ui.mcPopup.fOpen("Upgrade");
                    };
                    return;
                case "btnEnchant":
                    if (_local2.ui.mcPopup.currentLabel == "Enchant"){
                        MovieClip(_local2.ui.mcPopup.getChildByName("mcEnchant")).fClose();
                    } else {
                        _local2.ui.mcPopup.fOpen("Enchant");
                    };
                    return;
                case "btnOption":
                    if (_local2.ui.mcPopup.currentLabel == "Option"){
                        _local2.ui.mcPopup.onClose();
                    } else {
                        _local2.ui.mcPopup.fOpen("Option");
                    };
                    return;
                case "btnQuest":
                    _local2.world.toggleQuestLog();
                    return;
                case "btnHouse":
                    _local2.MsgBox.notify("房屋功能暂未开放！");
                    return;
                case "btnChar":
                    _local2.toggleCharpanel("spend");
                    return;
            };
        }
        public function toggleTempInventory():void
        {
            var _local1:MovieClip;
            _local1 = MovieClip(stage.getChildAt(0));
            if (!_local1.world.uiLock){
                if (_local1.ui.mcPopup.currentLabel == "Temp"){
                    _local1.ui.mcPopup.onClose();
                } else {
                    _local1.ui.mcPopup.fOpen("Temp");
                };
            };
        }
        public function onMouseOut(_arg1:MouseEvent)
        {
            var _local2:MovieClip;
            var _local3:MovieClip;
            _local2 = MovieClip(stage.getChildAt(0));
            _local3 = MovieClip(stage.getChildAt(0)).ui.ToolTip;
            if (_local3.t.running){
                _local3.t.stop();
            };
            _local3.close();
        }
        public function toggleInventory():void
        {
            var _local1:MovieClip;
            _local1 = MovieClip(stage.getChildAt(0));
            if (!_local1.world.uiLock){
                if (_local1.ui.mcPopup.currentLabel == "Inventory"){
                    MovieClip(_local1.ui.mcPopup.getChildByName("mcInventory")).fClose();
                } else {
                    _local1.ui.mcPopup.fOpen("Inventory");
                };
            };
        }
        function frame1()
        {
            btnAddition.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnAddition.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnAddition.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnBag.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnBag.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnBag.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnMap.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnMap.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnMap.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnOption.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnOption.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnOption.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnQuest.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnQuest.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnQuest.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnChar.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnChar.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnChar.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnEye.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnEye.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnEye.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnVIP.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnVIP.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnVIP.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnUpC.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnUpC.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnUpC.addEventListener(MouseEvent.CLICK, onMouseClick);
            GChit.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            GChit.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            GChit.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnTower.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnTower.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnTower.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnAnswer.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnAnswer.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnAnswer.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnBank.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnBank.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnBank.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnBox.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnBox.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnBox.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnAward.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnAward.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnAward.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnArchaeology.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnArchaeology.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnArchaeology.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnSynthesis.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnSynthesis.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnSynthesis.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnGua.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnGua.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnGua.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnEvent.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnEvent.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnEvent.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnUpgrade.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnUpgrade.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnUpgrade.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnEnchant.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnEnchant.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnEnchant.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnMetallurgy.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnMetallurgy.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnMetallurgy.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnDailyUGC.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnDailyUGC.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnDailyUGC.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnTop.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnTop.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnTop.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnTrain.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnTrain.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnTrain.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnDance.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnDance.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnDance.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnMine.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnMine.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnMine.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnDailyQuest.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnDailyQuest.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnDailyQuest.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnAddEnergy.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnAddEnergy.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnAddEnergy.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnAddMagic.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnAddMagic.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnAddMagic.addEventListener(MouseEvent.CLICK, onMouseClick);
            titleAttestation.buttonMode = true;
            titleAttestation.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            titleAttestation.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            titleAttestation.addEventListener(MouseEvent.CLICK, onMouseClick);
            titleMetallurgy.mouseEnabled = false;
            titleMetallurgy.mouseChildren = false;
            titleDailyUGC.mouseEnabled = false;
            titleDailyUGC.mouseChildren = false;
            titleTop.mouseEnabled = false;
            titleTop.mouseChildren = false;
            mcEvent.mouseEnabled = false;
            trainStateTxt.mouseEnabled = false;
            titleDance.mouseEnabled = false;
            titleDance.mouseChildren = false;
            mineStateTxt.mouseEnabled = false;
            titleDailyQuest.mouseEnabled = false;
            titleDailyQuest.mouseChildren = false;
            rootClass = MovieClip(stage.getChildAt(0));
            soundOF.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            soundOF.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            soundOF.addEventListener(MouseEvent.CLICK, onMouseClick);
            soundOF.bitChecked = rootClass.mixer.bSoundOn;
            soundOF.checkmark.visible = rootClass.mixer.bSoundOn;
        }

    }
}//package Game_new_fla

