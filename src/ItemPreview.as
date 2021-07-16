// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//ItemPreview

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import flash.events.MouseEvent;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.filters.GlowFilter;

    public class ItemPreview extends MovieClip {

        public var btnClose:SimpleButton;
        var rootClass:MovieClip;
        var mcStage:MovieClip;
        var curItem:Object;
		var sLinkAccessory:String = "";
        var sLinkArmor:String = "";
        var sLinkCape:String = "";
        var sLinkHelm:String = "";
        var sLinkPet:String = "";
        var sLinkWeapon:String = "";
        var pLoaderD:ApplicationDomain;
        var pLoaderC:LoaderContext;

        public function ItemPreview():void{
            rootClass = MovieClip(Game.root);
            pLoaderD = new ApplicationDomain(ApplicationDomain.currentDomain);
            pLoaderC = new LoaderContext(false, pLoaderD);
            super();
            this.x = 50;
            this.y = 90;
            this.btnClose.addEventListener(MouseEvent.CLICK, xClick, false, 0, true);
            mcStage = MovieClip(this.addChild(new MovieClip()));
        }

        private function xClick(_arg1:MouseEvent){
            this.btnClose.removeEventListener(MouseEvent.CLICK, xClick);
            rootClass.clearModalStack();
        }

        public function loadItem(_arg1:Object):void{
            if (curItem != _arg1){
                curItem = _arg1;
                switch (_arg1.sES){
                    case "Weapon":
                        loadWeapon(_arg1.sFile, _arg1.sLink);
                        return;
                    case "he":
                        loadHelm(_arg1.sFile, _arg1.sLink);
                        return;
                    case "ba":
                        loadCape(_arg1.sFile, _arg1.sLink);
                        return;
                    case "pe":
                        loadPet(_arg1.sFile, _arg1.sLink);
                        return;
                    case "ar":
                    case "co":
                        loadArmor(_arg1.sFile, _arg1.sLink);
                        return;
                    case "ho":
                        loadHouse(_arg1.sFile);
                        return;
                    case "hi":
                        loadItemFile();
                        return;
					case "am":
						loadAccessory(_arg1.sFile, _arg1.sLink);
						return;
                };
            };
        }

        private function clearStage():void{
            var _local1:int = (mcStage.numChildren - 1);
            while (_local1 >= 0) {
                mcStage.removeChildAt(_local1);
                _local1--;
            };
        }

        private function loadWeapon(_arg1, _arg2):void{
            clearStage();
            sLinkWeapon = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.INIT, onLoadWeaponComplete, false, 0, true);
        }

        private function loadCape(_arg1, _arg2):void{
            clearStage();
            sLinkCape = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadCapeComplete, false, 0, true);
        }
		
		private function loadAccessory(_arg1, _arg2):void{
            clearStage();
            sLinkAccessory = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadAccessoryComplete, false, 0, true);
        }

        private function loadHelm(_arg1, _arg2):void{
            clearStage();
            sLinkHelm = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadHelmComplete, false, 0, true);
        }

        private function loadPet(_arg1, _arg2):void{
            clearStage();
            sLinkPet = _arg2;
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _arg1)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadPetComplete, false, 0, true);
        }

        private function loadHouse(_arg1):void{
            clearStage();
            var _local2:* = (("maps/" + curItem.sFile.substr(0, -4)) + "_preview.swf");
            var _local3:* = new Loader();
            _local3.load(new URLRequest((Game.serverFilePath + _local2)), pLoaderC);
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadHouseComplete, false, 0, true);
        }

        function onLoadHouseComplete(_arg1:Event):void{
            var _local2:* = (curItem.sFile.substr(0, -4).substr((curItem.sFile.lastIndexOf("/") + 1)).split("-").join("_") + "_preview");
            var _local3:Class = (pLoaderD.getDefinition(_local2) as Class);
            var _local4:* = new (_local3)();
            _local4.x = 150;
            _local4.y = 200;
            mcStage.addChild(_local4);
            addGlow(_local4);
        }

        private function loadArmor(_arg1, _arg2):void{
            clearStage();
            sLinkArmor = _arg2;
            var _local3:* = mcStage.addChild(new AvatarMC());
            _local3.strGender = rootClass.world.myAvatar.objData.strGender;
            _local3.x = 150;
            _local3.y = 250;
            _local3.scaleX = (_local3.scaleY = 1.65);
            _local3.pAV = rootClass.world.myAvatar;
            _local3.world = MovieClip(Game.root).world;
            _local3.hideHPBar();
            _local3.name = "previewMC";
            _local3.loadArmor(_arg1, _arg2);
            addGlow(_local3.mcChar);
        }

        function onLoadWeaponComplete(_arg1:Event):void{
            var mc:MovieClip;
            var AssetClass:Class;
            var e:Event = _arg1;
            try {
                AssetClass = (pLoaderD.getDefinition(sLinkWeapon) as Class);
                mc = new (AssetClass)();
            }
            catch(err:Error) {
                mc = e.target.content;
            };
            mc.x = 150;
            mc.y = 180;
            mc.scaleX = (mc.scaleY = 0.3);
            mcStage.addChild(mc);
            addGlow(mc);
        }

        function onLoadCapeComplete(_arg1:Event):void{
            var _local2:Class = (pLoaderD.getDefinition(sLinkCape) as Class);
            var _local3:* = new (_local2)();
            _local3.x = 150;
            _local3.y = 150;
            _local3.scaleX = (_local3.scaleY = 0.5);
            mcStage.addChild(_local3);
            addGlow(_local3);
        }
		
		function onLoadAccessoryComplete(_arg1:Event):void{
            var _local2:Class = (pLoaderD.getDefinition(sLinkAccessory) as Class);
            var _local3:* = new (_local2)();
            _local3.x = 200;
            _local3.y = 200;
            _local3.scaleX = (_local3.scaleY = 0.5);
            mcStage.addChild(_local3);
            addGlow(_local3);
        }

        function onLoadHelmComplete(_arg1:Event):void{
            var _local2:Class = (pLoaderD.getDefinition(sLinkHelm) as Class);
            var _local3:* = new (_local2)();
            _local3.x = 170;
            _local3.y = 200;
            mcStage.addChild(_local3);
            addGlow(_local3);
        }

        function onLoadPetComplete(_arg1:Event):void{
            var _local2:Class = (pLoaderD.getDefinition(sLinkPet) as Class);
            var _local3:* = new (_local2)();
            _local3.x = 150;
            _local3.y = 250;
            _local3.scaleX = (_local3.scaleY = 2);
            mcStage.addChild(_local3);
            addGlow(_local3);
        }

        private function addGlow(_arg1:MovieClip):void{
            var _local2:* = new GlowFilter(0xFFFFFF, 1, 8, 8, 2, 1, false, false);
            _arg1.filters = [_local2];
        }

        private function loadItemFile():void{
            clearStage();
            var _local1:* = new Loader();
            _local1.load(new URLRequest((Game.serverFilePath + curItem.sFile)), pLoaderC);
            _local1.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadItemFileComplete, false, 0, true);
        }

        function onLoadItemFileComplete(_arg1:Event):void{
            var _local2:Class = (pLoaderD.getDefinition(curItem.sLink) as Class);
            var _local3:* = new (_local2)();
            _local3.x = 150;
            _local3.y = 250;
            if (_local3.height > 225){
                _local3.height = 225;
                _local3.scaleX = _local3.scaleY;
            };
            if (_local3.width > 275){
                _local3.width = 275;
                _local3.scaleY = _local3.scaleX;
            };
            mcStage.addChild(_local3);
            addGlow(_local3);
        }


    }
}//package 

