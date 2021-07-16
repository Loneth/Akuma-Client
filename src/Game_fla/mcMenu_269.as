// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.mcMenu_268

package Game_fla{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.media.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.ui.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.xml.*;

    public dynamic class mcMenu_268 extends MovieClip {

        public var btnQuest:MovieClip;
        public var btnRest:SimpleButton;
        public var btnHouse:SimpleButton;
        public var btnChar:MovieClip;
        public var btnMenu:SimpleButton;
        public var btnBook:SimpleButton;
		public var btnMining:SimpleButton;
        public var btnBag:SimpleButton;
        public var btnMap:SimpleButton;
        public var btnOption:SimpleButton;
		public var btnPvP:SimpleButton;
		public var btnVIP:SimpleButton;
		public var btnAddRC:SimpleButton;
		public var openRedeem:SimpleButton;
		public var soundOF:MovieClip;
        public var menu;

        public function mcMenu_268(){
            addFrameScript(0, frame1);
        }

        public function onMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(stage.getChildAt(0));
            var _local3:* = MovieClip(stage.getChildAt(0)).ui.ToolTip;
            switch (_arg1.currentTarget.name){
				case "btnPvP":
                    _local3.openWith({str:"PvP Battlegrounds"});
                    return;
				case "openRedeem":
					_local3.openWith({str:"Redeem Code"});
					return;
                case "btnRest":
                    _local3.openWith({str:"Rest"});
                    return;
                case "btnBag":
                    _local3.openWith({str:"Inventory"});
                    return;
                case "btnTemp":
                    _local3.openWith({str:"Temp Inventory"});
                    return;
				/*
				case "soundOF":
                    if (_local2.mixer.bSoundOn){
                        _local3.openWith({str:"Sound: On"});
                    } else {
                        _local3.openWith({str:"Sound: Off"});
                    };
                    return;
				*/
                case "btnMenu":
                    _local3.openWith({str:"Game Menu"});
                    return;
				case "btnVIP":
                    _local3.showUpgradeWindow();
                    return;
				case "btnAddRC":
                    _local3.showACWindow();
                    return;
                case "btnMap":
                    _local3.openWith({str:"Map"});
                    return;
                case "btnOption":
                    _local3.openWith({str:"Options"});
                    return;
                case "btnQuest":
                    _local3.openWith({str:"Quests"});
                    return;
                case "btnBook":
                    _local3.openWith({str:"Book of Lore"});
                    return;
                case "btnHouse":
                    _local3.openWith({str:"House"});
                    return;
                case "btnChar":
                    if (menu == null){
                        _local3.openWith({str:"Character"});
                    };
                    return;
            };
        }

        public function onMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(stage.getChildAt(0));
            var _local3:* = MovieClip(stage.getChildAt(0)).ui.ToolTip;
            _local3.close();
        }

        public function onMouseClick(_arg1:MouseEvent){
            var _local2:* = MovieClip(stage.getChildAt(0));
            MovieClip(Game.root).mixer.playSound("Click");
            if (_arg1.currentTarget.name != "btnMenu"){
                _local2.menuClose();
            };
            switch (_arg1.currentTarget.name){
				case "btnPvP":
					_local2.togglePVPPanel("maps");
                    return;
				case "openRedeem":
					toggleRedeem();
					return;
                case "btnRest":
                    handleMenu(null);
                    MovieClip(parent.parent.parent).world.rest();
                    return;
                case "btnBag":
                    handleMenu(null);
                    toggleInventory();
                    return;
                case "btnMenu":
                    handleMenu(null);
                    _local2.MenuShow();
                    return;
                case "btnMap":
                    if (_local2.ui.mcPopup.currentLabel == "Map"){
                        _local2.ui.mcPopup.onClose();
                    }
                    else {
                        handleMenu(null);
                        _local2.ui.mcPopup.fOpen("Map");
                    };
                    return;
                case "btnBook":
                    try {
                        if ((((_local2.world.getQuestValue(139) < 4)) && (!((_local2.world.map.noOpen == null))))) break;
                    }
                    catch(e) {
                    };
                    if (_local2.ui.mcPopup.currentLabel == "Book"){
                        _local2.ui.mcPopup.onClose();
                    }
                    else {
                        handleMenu(null);
                        _local2.ui.mcPopup.fOpen("Book");
                    };
                    return;
				case "btnMining":
                    if (_local2.ui.mcPopup.currentLabel == "Book"){
                        _local2.ui.mcPopup.onClose();
                    }
                    else {
                        handleMenu(null);
                        _local2.ui.mcPopup.fOpen("Book");
                    };
                    return;
				/*
				case "soundOF":
                    if (!soundOF.bitChecked){
                        soundOF.bitChecked = (_local2.mixer.bSoundOn = false);
                        SoundMixer.stopAll();
                    } else {
                        soundOF.bitChecked = (_local2.mixer.bSoundOn = true);
                        _local2.mixer.playSound("Click");
                    };
                    _local2.uoPref.bSoundOn = rootClass.mixer.bSoundOn;
                    soundOF.bitChecked = _local2.uoPref.bSoundOn;
                    _local2.userPreference.data.bSoundOn = _local2.mixer.bSoundOn;
                    _local2.userPreference.flush();
                    _local2.sfc.sendXtMessage("zm", "cmd", ["uopref", "bSoundOn", String(_local2.uoPref.bSoundOn)], "str", 1);
                    if (_local2.mixer.bSoundOn){
                        _local3.openWith({str:"Sound: On"});
                    } 
					else {
                        _local3.openWith({str:"Sound: Off"});
                    };
                    break;
				*/
                case "btnOption":
                    if (_local2.ui.mcPopup.currentLabel == "Option"){
                        _local2.ui.mcPopup.onClose();
                    }
                    else {
                        handleMenu(null);
                        _local2.ui.mcPopup.fOpen("Option");
                    };
                    return;
                case "btnQuest":
                    handleMenu(MovieClip(_arg1.currentTarget));
                    return;
                case "btnHouse":
                    if (_local2.world.isHouseEquipped()){
                        _local2.world.gotoHouse(_local2.sfc.myUserName);
                    }
                    else {
                        _local2.world.gotoTown("buyhouse", "Enter", "Spawn");
                    };
                    return;
                case "btnChar":
                    handleMenu(MovieClip(_arg1.currentTarget));
                    return;
            };
        }

        public function handleMenu(_arg1:MovieClip):void{
            var _local2:MovieClip;
            if (_arg1 == null){
                if (menu == null){
                    return;
                };
                _local2 = MovieClip(this.getChildByName(menu.btnOpen));
                _local2.removeChild(menu.mcMenu);
                menu = null;
                return;
            };
            if (menu == null){
                menu = new interfaceMenu(_arg1.buttons, _arg1.name, MovieClip(stage.getChildAt(0)));
                _arg1.addChild(menu.mcMenu);
            }
            else {
                if ((((_arg1 == null)) || ((menu.btnOpen == _arg1.name)))){
                    _arg1.removeChild(menu.mcMenu);
                    menu = null;
                }
                else {
                    _local2 = MovieClip(this.getChildByName(menu.btnOpen));
                    _local2.removeChild(menu.mcMenu);
                    menu = null;
                    menu = new interfaceMenu(_arg1.buttons, _arg1.name, MovieClip(stage.getChildAt(0)));
                    _arg1.addChild(menu.mcMenu);
                };
            };
        }

        public function toggleTempInventory():void{
            var _local1:* = MovieClip(stage.getChildAt(0));
            if (!_local1.world.uiLock){
                if (_local1.ui.mcPopup.currentLabel == "Temp"){
                    _local1.ui.mcPopup.onClose();
                }
                else {
                    _local1.ui.mcPopup.fOpen("Temp");
                };
            };
		}
		public function toggleRedeem():void{
			var rootClass:* = MovieClip(stage.getChildAt(0));
			rootClass.redeem.gotoAndStop(2);
		
        }

        public function toggleInventory():void{
            var _local1:* = MovieClip(stage.getChildAt(0));
            if (!_local1.world.uiLock){
                if (_local1.ui.mcPopup.currentLabel == "Inventory"){
                    MovieClip(_local1.ui.mcPopup.getChildByName("mcInventory")).fClose();
                }
                else {
                    _local1.ui.mcPopup.fOpen("Inventory");
                };
            };
        }

        function frame1(){
            btnRest.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnRest.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnBag.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnBag.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnMenu.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnMenu.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnMap.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnMap.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnOption.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnOption.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnQuest.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnQuest.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			btnPvP.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnPvP.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnPvP.addEventListener(MouseEvent.CLICK, onMouseClick);
			openRedeem.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            openRedeem.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
	        openRedeem.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnRest.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnBag.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnMenu.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnOption.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnMap.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnQuest.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnBook.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnBook.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnBook.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnHouse.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnHouse.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnHouse.addEventListener(MouseEvent.CLICK, onMouseClick);
			btnVIP.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnVIP.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnVIP.addEventListener(MouseEvent.CLICK, onMouseClick);
			btnAddRC.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnAddRC.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnAddRC.addEventListener(MouseEvent.CLICK, onMouseClick);
            btnChar.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            btnChar.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            btnChar.addEventListener(MouseEvent.CLICK, onMouseClick);
			soundOF.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            soundOF.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            soundOF.addEventListener(MouseEvent.CLICK, onMouseClick);
            soundOF.bitChecked = _local2.mixer.bSoundOn;
            soundOF.checkmark.visible = _local2.mixer.bSoundOn;
        }


    }
}//package Game_fla

