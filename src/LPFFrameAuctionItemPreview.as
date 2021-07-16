// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameAuctionItemPreview

package {
    import flash.text.TextField;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.display.Loader;
    import flash.display.*;
    import flash.net.URLRequest;
    import flash.filters.GlowFilter;
    import flash.geom.Rectangle;
    import flash.text.*;

    public class LPFFrameAuctionItemPreview extends LPFFrame {

        public var tInfo:TextField;
        public var mcPreview:MovieClip;
		public var mcStaff:MovieClip;
        public var mcCoin:MovieClip;
        public var mcUpgrade:MovieClip;
        public var btnDelete:SimpleButton;
        public var btnLight:SimpleButton;
        public var btnDark:SimpleButton;
        public var btnFire:SimpleButton;
        public var btnWater:SimpleButton;
        public var btnStorm:SimpleButton;
        public var btnLightning:SimpleButton;
        private var iSel:Object;
        private var previewArgs:Object;
        private var rootClass:MovieClip;
        private var curItem:Object;
        private var sLinkArmor:String = "";
        private var sLinkCape:String = "";
		private var sLinkAccessory:String = "";
        private var sLinkHelm:String = "";
        private var sLinkPet:String = "";
        private var sLinkWeapon:String = "";
        private var pLoaderD:ApplicationDomain;
        private var pLoaderC:LoaderContext;
        private var loaderStack:Array;
        private var killStack:Array;
        public var UR:MovieClip;
        public var LR:MovieClip;
        public var TR:MovieClip;
		/*
        private var isEquip:Boolean;
        private var isShow:Boolean;
		*/
		
        public function LPFFrameAuctionItemPreview():void{
            previewArgs = {};
            pLoaderD = new ApplicationDomain(ApplicationDomain.currentDomain);
            pLoaderC = new LoaderContext(false, pLoaderD);
            loaderStack = [];
            killStack = [];
            super();
            mcCoin.visible = false;
			mcStaff.visible = false;
            mcUpgrade.visible = false;
            btnLight.visible = false;
            btnDark.visible = false;
            btnFire.visible = false;
            btnWater.visible = false;
            btnStorm.visible = false;
            btnLightning.visible = false;
            UR.visible = false;
            LR.visible = false;
            TR.visible = false;
            //isEquip = false;
            //isShow = false;
			btnDelete.visible = false;
            btnDelete.addEventListener(MouseEvent.CLICK, onBtnDeleteClick, false, 0, true);
            btnDelete.addEventListener(MouseEvent.MOUSE_OVER, onDeleteTTOver, false, 0, true);
            btnDelete.addEventListener(MouseEvent.MOUSE_OUT, onDeleteTTOut, false, 0, true);
            btnLight.addEventListener(MouseEvent.MOUSE_OVER, onLightTTOver, false, 0, true);
            btnLight.addEventListener(MouseEvent.MOUSE_OUT, onLightTTOut, false, 0, true);
            btnDark.addEventListener(MouseEvent.MOUSE_OVER, onDarkTTOver, false, 0, true);
            btnDark.addEventListener(MouseEvent.MOUSE_OUT, onDarkTTOut, false, 0, true);
            btnFire.addEventListener(MouseEvent.MOUSE_OVER, onFireTTOver, false, 0, true);
            btnFire.addEventListener(MouseEvent.MOUSE_OUT, onFireTTOut, false, 0, true);
            btnWater.addEventListener(MouseEvent.MOUSE_OVER, onWaterTTOver, false, 0, true);
            btnWater.addEventListener(MouseEvent.MOUSE_OUT, onWaterTTOut, false, 0, true);
            btnStorm.addEventListener(MouseEvent.MOUSE_OVER, onStormTTOver, false, 0, true);
            btnStorm.addEventListener(MouseEvent.MOUSE_OUT, onStormTTOut, false, 0, true);
            btnLightning.addEventListener(MouseEvent.MOUSE_OVER, onLightningTTOver, false, 0, true);
            btnLightning.addEventListener(MouseEvent.MOUSE_OUT, onLightningTTOut, false, 0, true);
            mcCoin.addEventListener(MouseEvent.MOUSE_OVER, onCoinTTOver, false, 0, true);
            mcCoin.addEventListener(MouseEvent.MOUSE_OUT, onCoinTTOut, false, 0, true);
			mcStaff.addEventListener(MouseEvent.MOUSE_OVER, onCoinTTOver, false, 0, true);
            mcStaff.addEventListener(MouseEvent.MOUSE_OUT, onCoinTTOut, false, 0, true);
            mcUpgrade.addEventListener(MouseEvent.MOUSE_OVER, onUpgradeTTOver, false, 0, true);
            mcUpgrade.addEventListener(MouseEvent.MOUSE_OUT, onUpgradeTTOut, false, 0, true);
            addEventListener(Event.ENTER_FRAME, onEF, false, 0, true);
        }

        override public function fOpen(_arg1:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            positionBy(_arg1.r);
            if (("eventTypes" in _arg1)){
                eventTypes = _arg1.eventTypes;
            };
			/*
            if (("isEquip" in _arg1)){
                isEquip = _arg1.isEquip;
            };
            if (("isShow" in _arg1)){
                isShow = _arg1.isShow;
            };
			*/
            fDraw();
            getLayout().registerForEvents(this, eventTypes);
        }

        override public function fClose():void{
            btnDelete.removeEventListener(MouseEvent.CLICK, onBtnDeleteClick);
            btnDelete.removeEventListener(MouseEvent.MOUSE_OVER, onDeleteTTOver);
            btnDelete.removeEventListener(MouseEvent.MOUSE_OUT, onDeleteTTOut);
            mcCoin.removeEventListener(MouseEvent.MOUSE_OVER, onCoinTTOver);
            mcCoin.removeEventListener(MouseEvent.MOUSE_OUT, onCoinTTOut);
			mcStaff.removeEventListener(MouseEvent.MOUSE_OVER, onCoinTTOver);
            mcStaff.removeEventListener(MouseEvent.MOUSE_OUT, onCoinTTOut);
            mcUpgrade.removeEventListener(MouseEvent.MOUSE_OVER, onUpgradeTTOver);
            mcUpgrade.removeEventListener(MouseEvent.MOUSE_OUT, onUpgradeTTOut);
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        protected function fDraw():void{
            btnDelete.visible = false;
            var _local1 = "";
            var _local2 = "";
            var _local3 = "#00CCFF";
            var _local4:Object = iSel;
            if (_local4 != null){
                LR.visible = false;
                UR.visible = false;
                TR.visible = false;
                btnDelete.visible = true;
                tInfo.htmlText = rootClass.getItemInfoStringB(_local4);
                tInfo.y = int((((btnDelete.y + btnDelete.height) - tInfo.textHeight) - 3));
                mcUpgrade.visible = false;
                mcCoin.visible = false;
				mcStaff.visible = false;
				switch (_local4.iRty){
					case 5:
						LR.visible = true;
						break;
					case 15:
						UR.visible = true;
						break;
					case 28:
						TR.visible = true;
						break;
				};
                if (_local4.bUpg == 1){
                    mcUpgrade.visible = true;
                };
				if (_local4.bStaff == 1){
                    mcStaff.visible = true;
					mcUpgrade.visible = false;
                };
                if (_local4.bCoins == 1){
                    mcUpgrade.visible = false;
                    mcCoin.visible = true;
                };
                switch (_local4.sElement){
					case "Fire":
						btnLight.visible = false;
						btnDark.visible = false;
						btnFire.visible = true;
						btnWater.visible = false;
						btnStorm.visible = false;
						btnLightning.visible = false;
						break;
					case "Light":
						btnLight.visible = true;
						btnDark.visible = false;
						btnFire.visible = false;
						btnWater.visible = false;
						btnStorm.visible = false;
						btnLightning.visible = false;
						break;
					case "Dark":
						btnDark.visible = true;
						btnLight.visible = false;
						btnFire.visible = false;
						btnWater.visible = false;
						btnStorm.visible = false;
						btnLightning.visible = false;
						break;
					case "Wind":
						btnStorm.visible = true;
						btnDark.visible = false;
						btnLight.visible = false;
						btnFire.visible = false;
						btnWater.visible = false;
						btnLightning.visible = false;
						break;
					case "Water":
						btnWater.visible = true;
						btnFire.visible = false;
						btnDark.visible = false;
						btnLight.visible = false;
						btnLightning.visible = false;
						btnStorm.visible = false;
						break;
					case "Lightning":
						btnLightning.visible = true;
						btnWater.visible = false;
						btnFire.visible = false;
						btnDark.visible = false;
						btnLight.visible = false;
						btnStorm.visible = false;
						break;
					default:
						btnFire.visible = false;
						btnLight.visible = false;
						btnDark.visible = false;
						btnStorm.visible = false;
						btnWater.visible = false;
						btnLightning.visible = false;
						break;
				}
                loadPreview(_local4);
			} else {
                //tInfo.htmlText = "Please select an item to preview.";
				tInfo.htmlText = "";
                while (mcPreview.numChildren > 0) {
                    mcPreview.removeChildAt(0);
                };
                clearPreview();
            };
            btnDelete.visible = false;
            if (getLayout().sMode.toLowerCase().indexOf("shop") > -1){
                btnDelete.visible = false;
            };
        }

        override public function notify(_arg1:Object):void{
            iSel = null;
            if (_arg1.fData.eSel != null){
                iSel = _arg1.fData.eSel;
            };
            if (_arg1.fData.iSel != null){
                iSel = _arg1.fData.iSel;
            };
            fDraw();
        }

        private function onBtnDeleteClick(_arg1:Event):void{
            var _local2:*;
            var _local3:*;
            var _local4:int;
            rootClass.mixer.playSound("Click");
            if (iSel.bEquip == 1){
                rootClass.MsgBox.notify("Item is currently equipped!");
            }
            else {
                _local2 = new ModalMC();
                _local3 = {};
                _local3.params = {};
                if (((((!((iSel.bCoins == null))) && ((iSel.bCoins == 1)))) && ((((iSel.iQty > 0)) || ((iSel.sES == "ar")))))){
                    _local3.strBody = "<font color='#FF0000'><b>RC items can not be deleted!</b></font>\n\nYou may sell the item if you really want, but there is no limit on RC item storage!";
                    _local3.btns = "mono";
                }
                else {
                    if (iSel.sES == "ar"){
                        _local3.strBody = (("Are you sure you want to delete '" + iSel.sName) + "' and the rank associated with it?");
                    }
                    else {
                        _local3.strBody = (("Are you sure you want to delete '" + iSel.sName) + "'?");
                    };
                    _local3.callback = deleteRequest;
                    _local4 = (((iSel.iQty)!=null) ? iSel.iQty : 1);
                    if (iSel.sES == "ar"){
                        _local4 = 1;
                    };
                    if (_local4 > 1){
                        _local3.qtySel = {
                            min:1,
                            max:_local4
                        };
                    };
                };
                _local3.glow = "white,medium";
                _local3.greedy = true;
                rootClass.ui.ModalStack.addChild(_local2);
                _local2.init(_local3);
            };
        }

        public function deleteRequest(_arg1:Object):void{
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
                if (_arg1.iQty != null){
                    rootClass.world.sendRemoveItemRequest(iSel, _arg1.iQty);
                }
                else {
                    rootClass.world.sendRemoveItemRequest(iSel);
                };
            };
        }

        private function loadPreview(_arg1:Object):void{
            if (_arg1.sType.toLowerCase() != "refinement"){
                if (curItem != _arg1){
                    curItem = _arg1;
                    switch (_arg1.sES){
                        case "Weapon":
                            loadWeapon(_arg1.sFile, _arg1.sLink);
                            break;
                        case "he":
                            loadHelm(_arg1.sFile, _arg1.sLink);
                            break;
                        case "ba":
                            loadCape(_arg1.sFile, _arg1.sLink);
                            break;
                        case "pe":
                            loadPet(_arg1.sFile, _arg1.sLink);
                            break;
						case "am":
                            loadAccessory(_arg1.sFile, _arg1.sLink);
                            break;
                        case "ar":
                        case "co":
                            loadArmor(_arg1.sFile, _arg1.sLink);
                            break;
                        case "ho":
                            loadHouse(_arg1.sFile);
                            break;
                        case "hi":
                            loadHouseItem(_arg1.sFile, _arg1.sLink);
                            break;
                        default:
                            if ((((_arg1.sType.toLowerCase() == "item")) && (!((String(_arg1.sLink).toLowerCase() == "none"))))){
                                loadBag(_arg1);
                            }
                            else {
                                if (_arg1.sType.toLowerCase() == "egg"){
                                    loadBag(_arg1);
                                }
                                else {
                                    if ((((_arg1.sType.toLowerCase() == "serveruse")) || ((_arg1.sType.toLowerCase() == "clientuse")))){
                                        loadBag(_arg1);
                                    }
                                    else {
                                        clearPreview();
                                    };
                                };
                            };
                    };
                };
            }
            else {
                loadRefinement(_arg1);
            };
        }

        private function clearPreview():void{
            var _local3:int;
            clearLoaderStack();
            var _local1:Boolean = true;
            var _local2:int;
            while (_local2 < mcPreview.numChildren) {
                _local1 = true;
                if (("fClose" in MovieClip(mcPreview.getChildAt(_local2)))){
                    rootClass.recursiveStop(MovieClip(mcPreview.getChildAt(_local2)));
                    _local3 = 0;
                    while (_local3 < killStack.length) {
                        if (killStack[_local3].mc == mcPreview.getChildAt(_local2)){
                            _local1 = false;
                        };
                        _local3++;
                    };
                    if (_local1){
                        killStack.push({
                            c:0,
                            mc:mcPreview.getChildAt(_local2)
                        });
                    };
                }
                else {
                    mcPreview.removeChildAt(_local2);
                    _local2--;
                };
                _local2++;
            };
            curItem = null;
        }

        private function loadRefinement(_arg1):void{
            var mc:MovieClip;
            var AssetClass:Class;
            var item:* = _arg1;
            clearPreview();
            try {
                AssetClass = (rootClass.world.getClass("iidesign") as Class);
                mc = new (AssetClass)();
            }
            catch(err:Error) {
                trace(err);
            };
            mc.scaleX = (mc.scaleY = 3);
            mcPreview.addChild(mc);
            addGlow(mc);
        }

        private function loadBag(_arg1, _arg2:Boolean=false):void{
            var _local3:MovieClip;
            clearPreview();
            var _local4:Class = (rootClass.world.getClass("iibag") as Class);
            if (((_arg2) || ((((((((_arg1 == null)) || (!(("sFile" in _arg1))))) || ((String(_arg1.sFile).length < 1)))) || ((rootClass.world.getClass(_arg1.sFile) == null)))))){
                _local4 = (rootClass.world.getClass(_arg1.sIcon) as Class);
            }
            else {
                if (((((((!((_arg1 == null))) && (("sFile" in _arg1)))) && ((String(_arg1.sFile).length > 0)))) && (!((rootClass.world.getClass(_arg1.sFile) == null))))){
                    _local4 = (rootClass.world.getClass(_arg1.sFile) as Class);
                };
            };
            try {
                _local3 = new (_local4)();
                _local3.scaleX = (_local3.scaleY = 3);
                mcPreview.addChild(_local3);
                addGlow(_local3);
            }
            catch(e:Error) {
            };
        }

        private function loadWeapon(_arg1, _arg2):void{
            clearPreview();
            sLinkWeapon = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.INIT, onLoadWeaponComplete, false, 0, true);
            addToLoaderStack(_local3);
        }

        private function loadCape(_arg1, _arg2):void{
            clearPreview();
            sLinkCape = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadCapeComplete, false, 0, true);
            addToLoaderStack(_local3);
        }
		
		private function loadAccessory(_arg1, _arg2):void{
            clearPreview();
            sLinkAccessory = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadAccessoryComplete, false, 0, true);
            addToLoaderStack(_local3);
        }

        private function loadHelm(_arg1, _arg2):void{
            clearPreview();
            sLinkHelm = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadHelmComplete, false, 0, true);
            addToLoaderStack(_local3);
        }

        private function loadPet(_arg1, _arg2):void{
            clearPreview();
            sLinkPet = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadPetComplete, false, 0, true);
            addToLoaderStack(_local3);
        }

        private function loadHouse(_arg1):void{
            var _local2:*;
            var _local3:*;
            try {
                clearPreview();
                _local2 = (("maps/" + curItem.sFile.substr(0, -4)) + "_preview.swf");
                _local3 = new Loader();
                _local3.load(new URLRequest((Game.serverFilePath + _local2)), pLoaderC);
                _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadHouseComplete, false, 0, true);
                addToLoaderStack(_local3);
            }
            catch(e) {
            };
        }

        private function onLoadHouseComplete(_arg1:Event):void{
            removeFromLoaderStack(_arg1.target);
            var _local2:* = (curItem.sFile.substr(0, -4).substr((curItem.sFile.lastIndexOf("/") + 1)).split("-").join("_") + "_preview");
            var _local3:Class = (pLoaderD.getDefinition(_local2) as Class);
            var _local4:* = new (_local3)();
            _local4.x = 150;
            _local4.y = 200;
            mcPreview.addChild(_local4);
            addGlow(_local4);
        }

        private function loadArmor(_arg1, _arg2):void{
            clearPreview();
            sLinkArmor = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest(((((Game.serverFilePath + "classes/") + rootClass.world.myAvatar.objData.strGender) + "/") + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.INIT, onLoadArmorComplete, false, 0, true);
            addToLoaderStack(_local3);
        }

        private function onLoadWeaponComplete(_arg1:Event):void{
            var mc:MovieClip;
            var AssetClass:Class;
            var e:Event = _arg1;
            removeFromLoaderStack(e.target);
            try {
                AssetClass = (pLoaderD.getDefinition(sLinkWeapon) as Class);
                mc = new (AssetClass)();
            }
            catch(err:Error) {
                mc = e.target.content;
            };
            mc.scaleX = (mc.scaleY = 0.3);
            mcPreview.addChild(mc);
            addGlow(mc);
        }

        private function onLoadCapeComplete(_arg1:Event):void{
            var _local2:Class;
            var _local3:*;
            removeFromLoaderStack(_arg1.target);
            try {
                _local2 = (pLoaderD.getDefinition(sLinkCape) as Class);
                _local3 = new (_local2)();
                _local3.scaleX = (_local3.scaleY = 0.5);
                mcPreview.addChild(_local3);
                addGlow(_local3);
            }
            catch(e:Error) {
            };
        }
		
		private function onLoadAccessoryComplete(_arg1:Event):void{
            var _local2:Class;
            var _local3:*;
            removeFromLoaderStack(_arg1.target);
            try {
                _local2 = (pLoaderD.getDefinition(sLinkAccessory) as Class);
                _local3 = new (_local2)();
                _local3.scaleX = (_local3.scaleY = 6.0);
                mcPreview.addChild(_local3);
                addGlow(_local3);
            }
            catch(e:Error) {
            };
        }

        private function onLoadHelmComplete(_arg1:Event):void{
            var _local2:Class;
            var _local3:*;
            removeFromLoaderStack(_arg1.target);
            try {
                _local2 = (pLoaderD.getDefinition(sLinkHelm) as Class);
                _local3 = new (_local2)();
                _local3.scaleX = (_local3.scaleY = 0.8);
                mcPreview.addChild(_local3);
                addGlow(_local3);
            }
            catch(e:Error) {
            };
        }

        private function onLoadArmorComplete(_arg1:Event):void{
            removeFromLoaderStack(_arg1.target);
            var _local2:* = mcPreview.addChild(new AvatarMC());
            _local2.visible = false;
            _local2.strGender = rootClass.world.myAvatar.objData.strGender;
            _local2.pAV = rootClass.world.myAvatar;
            _local2.world = MovieClip(Game.root).world;
            _local2.hideHPBar();
            _local2.name = "previewMCB";
            addGlow(_local2.mcChar, false);
            _local2.loadArmorPiecesFromDomain(sLinkArmor, pLoaderD);
            _local2.visible = true;
        }

        private function onLoadPetComplete(_arg1:Event):void{
            removeFromLoaderStack(_arg1.target);
            var _local2:Class = (pLoaderD.getDefinition(sLinkPet) as Class);
            var _local3:* = new (_local2)();
            _local3.scaleX = (_local3.scaleY = 2);
            mcPreview.addChild(_local3);
            addGlow(_local3);
        }

        private function addGlow(_arg1:MovieClip, _arg2:Boolean=true):void{
            var _local3:* = new GlowFilter(0xFFFFFF, 1, 8, 8, 2, 1, false, false);
            _arg1.filters = [_local3];
            if (_arg2){
                repositionPreview(_arg1);
            };
        }

        public function repositionPreview(_arg1:MovieClip):void{
            var _local2:Rectangle = _arg1.getBounds(this);
            if (_local2.height > 175){
                _arg1.scaleX = (_arg1.scaleX * (175 / _local2.height));
                _arg1.scaleY = (_arg1.scaleY * (175 / _local2.height));
            };
            _arg1.x = (_arg1.x - int(((_arg1.getBounds(this).x + (_arg1.getBounds(this).width / 2)) - (this.width / 2))));
            _arg1.y = int((_arg1.y - _arg1.getBounds(this).y));
        }

        private function loadHouseItem(_arg1, _arg2):void{
            clearPreview();
            var _local3:* = new Loader();
            previewArgs.sLink = _arg2;
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onloadHouseItemComplete, false, 0, true);
            addToLoaderStack(_local3);
        }

        private function onloadHouseItemComplete(_arg1:Event):void{
            removeFromLoaderStack(_arg1.target);
            var _local2:Class = (pLoaderD.getDefinition(previewArgs.sLink) as Class);
            var _local3:* = new (_local2)();
            mcPreview.addChild(_local3);
            addGlow(_local3);
        }

        private function onDeleteTTOver(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Delete item"});
        }

        private function onDeleteTTOut(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.close();
        }

        private function onCoinTTOver(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"This item requires Diamonds to purchase."});
        }

        private function onCoinTTOut(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.close();
        }

        private function onLightTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Light"});
        }

        private function onLightTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onDarkTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Dark"});
        }

        private function onDarkTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onFireTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Fire"});
        }

        private function onFireTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onWaterTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Water"});
        }

        private function onWaterTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onLightningTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Lightning"});
        }

        private function onLightningTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onStormTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Wind"});
        }

        private function onStormTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }
		
        private function onUpgradeTTOver(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"This item is exclusive to upgraded members."});
        }

        private function onUpgradeTTOut(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.close();
        }

        private function addToLoaderStack(_arg1:Loader):void{
            clearLoaderStack();
            loaderStack.push(_arg1);
        }

        private function removeFromLoaderStack(_arg1:Object):void{
            var _local2:Loader;
            for each (_local2 in loaderStack) {
                if (_local2.contentLoaderInfo == _arg1){
                    loaderStack.splice(loaderStack.indexOf(_local2), 1);
                };
            };
        }

        private function clearLoaderStack():void{
            var _local1:Loader;
            while (loaderStack.length > 0) {
                _local1 = loaderStack.shift();
                try {
                    _local1.removeEventListener(Event.INIT, onLoadWeaponComplete);
                    _local1.removeEventListener(Event.INIT, onLoadArmorComplete);
                    _local1.removeEventListener(Event.COMPLETE, onLoadCapeComplete);
					_local1.removeEventListener(Event.COMPLETE, onLoadAccessoryComplete);
                    _local1.removeEventListener(Event.COMPLETE, onLoadHelmComplete);
                    _local1.removeEventListener(Event.COMPLETE, onLoadPetComplete);
                    _local1.removeEventListener(Event.COMPLETE, onLoadHouseComplete);
                    _local1.removeEventListener(Event.COMPLETE, onloadHouseItemComplete);
                    _local1.close();
                }
                catch(e:Error) {
                };
            };
        }

        private function onEF(_arg1:Event):void{
            var _local2:int;
            while (_local2 < killStack.length) {
                if (killStack[_local2].c++ > 2){
                    mcPreview.removeChild(killStack[_local2].mc);
                    killStack.splice(_local2, 1);
                    _local2--;
                };
                _local2++;
            };
        }


    }
}//package 

