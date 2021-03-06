package 
{
	import flash.events.*
    import flash.display.MovieClip;
	import flash.display.SimpleButton;
    import flash.geom.Point;
    import flash.geom.ColorTransform;
    import flash.geom.Rectangle;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.display.DisplayObject;
    import flash.events.IOErrorEvent;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import flash.display.Graphics;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLVariables;
	import flash.display.Loader;
	import flash.utils.getDefinitionByName;

    public class AvatarMC extends MovieClip {

        private const MAX_RATIO:Number = 4.6566128752458E-10;
        private const NEGA_MAX_RATIO:Number = -(AvatarMC.MAX_RATIO);
		public var framePrefix:String = "";
        public var bFly:Boolean = false;
        private var jumpTargetY:Number;
        private var jumpTS:Number;
        private var jumpOP:Point;
        private var bLanding:Boolean;
        public var bFlyTransition:Boolean = false;
		
        public var hpBar:MovieClip;
        // public var mcChar:MovieClip;
        public var mcChar: mcSkel;
		// public var EmoticonMC:MovieClip;
        public var pname:MovieClip;
        public var ignore:MovieClip;
        public var shadow:MovieClip;
        public var Sounds:MovieClip;
        public var fx:MovieClip;
        public var proxy:MovieClip;
        public var bubble:MovieClip;
		public var mcVending:SimpleButton;
        private var xDep;
        private var yDep;
        private var xTar;
        private var yTar:Number;
        private var nDuration;
        private var nXStep;
        private var nYStep;
        private var walkSpeed:Number;
        private var op:Point;
        private var tp:Point;
        private var walkTS:Number;
        private var walkD:Number;
        private var headPoint:Point;
        private var cbx;
        private var cby:Number;
        private var bLoadingHelm:Boolean = false;
        private var objLinks:Object;
        private var heavyAssets:Array;
        private var totalTransform:Object;
        private var clampedTransform:ColorTransform;
        private var animQueue:Array;
        public var pAV:Avatar;
        public var projClass:Projectile;
        public var spFX:Object;
        public var spellDur:int = 0;
        public var bBackHair:Boolean = false;
        public var isLoaded:Boolean = false;
        public var STAGE:MovieClip;
        public var world:MovieClip;
        public var px;
        public var py;
        public var tx;
        public var ty:Number;
        public var kv:Killvis = null;
        public var defaultCT:ColorTransform;
        public var strGender:String;
        public var previousframe:int = -1;
        public var hitboxR:Rectangle;
        public var CT3:ColorTransform;
        public var CT2:ColorTransform;
        public var CT1:ColorTransform;
        private var rootClass:MovieClip;
        private var r:int;
        private var randNum:Number;
		//private var StaciaWeaponOn:Boolean = true;
        private var weaponLoad:Boolean = true;
        private var armorLoad:Boolean = true;
        private var classLoad:Boolean = true;
        private var helmLoad:Boolean = true;
        private var hairLoad:Boolean = true;
		private var accessoryLoad:Boolean = true;
        private var capeLoad:Boolean = true;
        private var animEvents:Object;
        private var mcOrder:Object;
        private var testMC;
        private var topIndex:int = 0;
		public var mcCharacter:MovieClip;
		public var gameClass:MovieClip;

        public function AvatarMC():void{
            this.objLinks = {};
            this.heavyAssets = [];
            this.totalTransform = {
                alphaMultiplier:1,
                alphaOffset:0,
                redMultiplier:1,
                redOffset:0,
                greenMultiplier:1,
                greenOffset:0,
                blueMultiplier:1,
                blueOffset:0
            };
            this.clampedTransform = new ColorTransform();
            this.animQueue = [];
            this.spFX = {};
            this.defaultCT = MovieClip(this).transform.colorTransform;
            this.CT3 = new ColorTransform(1, 1, 1, 1, 0xFF, 0xFF, 0xFF, 0);
            this.CT2 = new ColorTransform(1, 1, 1, 1, 127, 127, 127, 0);
            this.CT1 = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
            this.r = (Math.random() * int.MAX_VALUE);
            this.animEvents = new Object();
            this.mcOrder = new Object();
            super();
            addFrameScript(0, this.frame1, 4, this.frame5, 7, this.frame8, 9, this.frame10, 11, this.frame12, 12, this.frame13, 13, this.frame14, 17, this.frame18, 19, this.frame20, 22, this.frame23);
			var gameClass = Game.root;
			
			/** LOAD AVATAR FILE ASSET **/
			// var character:Class = gameClass.getAssetClass("Skeleton");
            // this.mcChar = MovieClip(this.addChildAt(new (character)(), 1));
			// this.mcChar.x = -2;
			
			/** LOAD EMOJI FILE ASSET **/
			// var emoji:Class = gameClass.getAssetClass("Kerubi");
            // this.EmoticonMC = MovieClip(this.addChildAt(new (emoji)(), 1));
			
			// this.EmoticonMC.visible = false;
			this.Sounds.visible = false;
            this.ignore.visible = false;
            this.mcChar.addEventListener(MouseEvent.CLICK, this.onClickHandler);
            this.mcChar.buttonMode = true;
            this.mcChar.pvpFlag.mouseEnabled = false;
            this.mcChar.pvpFlag.mouseChildren = false;
			this.mcChar.vertigoMC.mouseEnabled = false;
            this.mcChar.vertigoMC.mouseChildren = false;
			this.mcChar.blindMC.mouseEnabled = false;
            this.mcChar.blindMC.mouseChildren = false;
			this.mcChar.AuraFX.mouseEnabled = false;
            this.mcChar.AuraFX.mouseChildren = false;
			this.mcChar.AuraFX.visible = false;
			this.mcChar.addEventListener(MouseEvent.MOUSE_OVER, onRevealName);
			this.mcChar.addEventListener(MouseEvent.MOUSE_OUT, onHideName);
			this.mcChar.silenceMC.mouseEnabled = false;
            this.mcChar.silenceMC.mouseChildren = false;
			// this.EmoticonMC.mouseEnabled = false;
            // this.EmoticonMC.mouseChildren = false;
            this.mcChar.mouseChildren = true;
			this.pname.mouseChildren = false;
            this.pname.buttonMode = false;
			this.pname.visible = false;
            this.bubble.mouseEnabled = (this.bubble.mouseChildren = false);
            this.shadow.mouseEnabled = (this.shadow.mouseChildren = false);
            this.addEventListener(Event.ENTER_FRAME, this.checkQueue, false, 0, true);
			this.mcVending.visible = false;
            this.bubble.visible = false;
			this.pname.VIP.visible = false;
			this.pname.Ambassador.visible = false;
			this.pname.Staff.visible = false;
			this.pname.Married.visible = false;
			this.pname.ARise.visible = false;
			this.pname.PedoArmy.visible = false;
			this.pname.kappa.visible = false;
            this.bubble.t = "";
            this.pname.ti.text = "";
            this.headPoint = new Point(0, (this.mcChar.head.y - (1.4 * this.mcChar.head.height)));
            this.hideOptionalParts();
        }
		
		public function onRevealName(e:MouseEvent):void {
			this.pname.visible = true;
			this.mcVending.visible = false;
		}
		
		public function get location():Point
        {
            return (new Point(this.x, this.y));
        }

		public function onHideName(e:MouseEvent):void {
			var uoLeaf:* = this.world.uoTree[this.pAV.pnm];
			this.pname.visible = false;
			if (uoLeaf.vending){
				this.mcVending.visible = true;
				//this.mcVending.addEventListener(MouseEvent.CLICK, onLoadVending);
			} else {
				this.mcVending.visible = false;
			};
		}

        public function fClose():void{
            if (this.pAV != null){
                this.pAV.unloadPet();
                if (this.pAV == this.world.myAvatar){
                    this.world.setTarget(null);
                }
                else {
                    this.pAV.target = null;
                };
                this.pAV.pMC = null;
                this.pAV = null;
            };
            this.recursiveStop(this);
            this.world = MovieClip(stage.getChildAt(0)).world;
            this.mcChar.removeEventListener(MouseEvent.CLICK, this.onClickHandler);
            this.pname.removeEventListener(MouseEvent.CLICK, this.onClickHandler);
            this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrameWalk);
            this.removeEventListener(Event.ENTER_FRAME, this.checkQueue);
            if (this.world.CHARS.contains(this)){
                this.world.CHARS.removeChild(this);
            };
            if (this.world.TRASH.contains(this)){
                this.world.TRASH.removeChild(this);
            };
            try {
                if (getChildByName("HealIconMC") != null){
                    MovieClip(getChildByName("HealIconMC")).fClose();
                };
            }
            catch(e:Error) {
            };
            while (this.fx.numChildren > 0) {
                this.fx.removeChildAt(0);
            };
        }

        override public function gotoAndPlay(_arg1:Object, _arg2:String=null):void{
            this.handleAnimEvent(String(_arg1));
            super.gotoAndPlay(_arg1);
        }

        public function disablePNameMouse():void{
            mouseEnabled = false;
            this.pname.mouseEnabled = false;
            this.pname.mouseChildren = false;
            this.pname.removeEventListener(MouseEvent.CLICK, this.onClickHandler);
        }

        public function hasLabel(_arg1:String):Boolean{
            var _local2:Array = this.mcChar.currentLabels;
            var _local3:int;
            while (_local3 < _local2.length) {
                if (_local2[_local3].name == _arg1){
                    return (true);
                };
                _local3++;
            };
            return (false);
        }

        private function recursiveStop(_arg1:MovieClip):void{
            var _local3:DisplayObject;
            var _local2:int;
            while (_local2 < _arg1.numChildren) {
                _local3 = _arg1.getChildAt(_local2);
                if ((_local3 is MovieClip)){
                    MovieClip(_local3).stop();
                    this.recursiveStop(MovieClip(_local3));
                };
                _local2++;
            };
        }

        public function showHPBar():void{
			this.hpBar.y = (this.pname.y - 3);
            this.hpBar.visible = true;
            this.updateHPBar();
        }

        public function hideHPBar():void{
            this.hpBar.visible = false;
        }
		
		public function onLoadVending(e:MouseEvent):void{
			world.rootClass.sfc.sendXtMessage("zm", "loadVendingShop", [this.pAV.objData.strUsername], "str", 1);
			//world.rootClass.toggleVendingShop();
        }

        public function updateHPBar():void{
            var _local3:Object;
            var _local1:MovieClip = (this.hpBar.g as MovieClip);
            var _local2:MovieClip = (this.hpBar.r as MovieClip);
            if (this.hpBar.visible){
                _local3 = this.pAV.dataLeaf;
                if (((!((_local3 == null))) && (!((_local3.intHP == null))))){
                    _local1.visible = true;
                    _local1.width = Math.round(((_local3.intHP / _local3.intHPMax) * _local2.width));
                    if (_local3.intHP < 1){
                        _local1.visible = false;
                    };
                };
            };
        }

        public function updateName():void{
            var uoLeaf:* = this.world.uoTree[this.pAV.pnm];
            if (uoLeaf == null){
                uoLeaf = this.world.uoTree[this.pAV.pnm.toLowerCase()];
            };
			if (this.pAV.objData.intAccessLevel == 2) {
                   this.pname.VIP.visible = true;
			} else if (this.pAV.objData.intAccessLevel == 40 || this.pAV.objData.intAccessLevel == 60 ) {
				   this.pname.Staff.visible = true;
			}
            try {
				if (uoLeaf.vending){
                    this.mcVending.visible = true;
					this.mcVending.addEventListener(MouseEvent.CLICK, onLoadVending);
                } else {
                    this.mcVending.visible = false;
                };
				if (uoLeaf.afk){
                    this.pname.ti.text = ("<AFK> " + this.pAV.objData.strUsername);
                } else {
                    this.pname.ti.text = this.pAV.objData.strUsername;
                };
				/*
				if(this.pAV.objData.Stage == "Kid"){
					trace("KID");
					trace("X:" + this.mcChar.scaleX);
					trace("Y:" + this.mcChar.scaleY);
					this.mcChar.scaleX = (this.mcChar.scaleX - 0.08);
					this.mcChar.scaleY = (this.mcChar.scaleY - 0.08);
					//this.mcChar.scaleY = (this.mcChar.scaleY - 0.3);
					//mcChar.scaleY = 1;
					//mcChar.scaleX = 1;
				} else {
					trace("ADULT");
				};*/				
                trace(("guild: " + this.pAV.objData.guild));
                if (this.pAV.objData.guild != null){
                    this.pname.tg.text = (("< " + String(this.pAV.objData.guild.Name)) + " >");
                };
            }
			catch(e:Error) {
                trace(("error on set name: " + e));
            };
        }

        private function hideOptionalParts():void{
            var _local1:* = ["cape", "backhair", "robe", "backrobe", "pvpFlag", "vertigoMC", "silenceMC", "blindMC"];//"hexMC"
            var _local2:* = ["weapon", "weaponOff", "weaponFist", "weaponFistOff", "shield"];
            var _local3 = "";
            for (_local3 in _local1) {
                if (typeof(this.mcChar[_local1[_local3]]) != undefined){
                    this.mcChar[_local1[_local3]].visible = false;
                };
            };
            for (_local3 in _local2) {
                if (typeof(this.mcChar[_local2[_local3]]) != undefined){
                    this.mcChar[_local2[_local3]].visible = false;
                };
            };
        }

        private function onClickHandler(_arg1:MouseEvent):void{
            this.world = (MovieClip(stage.getChildAt(0)).world as MovieClip);
            var _local2:Avatar = _arg1.currentTarget.parent.pAV;
            if (_arg1.shiftKey){
                this.world.onWalkClick();
            }
            else {
                if (!_arg1.ctrlKey){
                    if (((((((!((_local2 == this.world.myAvatar))) && (this.world.bPvP))) && (!((_local2.dataLeaf.pvpTeam == this.world.myAvatar.dataLeaf.pvpTeam))))) && ((_local2 == this.world.myAvatar.target)))){
                        this.world.approachTarget();
                    }
                    else {
                        if (_local2 != this.world.myAvatar.target){
                            this.world.setTarget(_local2);
                        };
                    };
                };
            };
        }

        public function loadClass(_arg1:String, _arg2:String):void{
            if (this.pAV.objData.eqp.co == null){
                this.classLoad = false;
                trace("** PMC loadClass >");
                this.world.queueLoad({
                    strFile:((((this.world.rootClass.getFilePath() + "classes/") + this.strGender) + "/") + _arg1),
                    callBackA:this.onLoadClassComplete,
                    callBackB:this.ioErrorHandler,
                    avt:this.pAV,
                    sES:"ar"
                });
            };
        }

        public function onLoadClassComplete(_arg1:Event):void
		{
			var _local2:*;
            trace(("** PMC onLoadClassComplete >" + this.pAV.objData.eqp.ar.sLink));
            this.classLoad = true;
            if (((this.pAV.isMyAvatar) && (this.pAV.FirstLoad)))
			{
                this.pAV.updateLoaded();
                if (this.pAV.LoadCount <= 0)
                {
                    this.pAV.firstDone();
                    _local2 = this.world.getAchievement("id0", 11);
					this.world.rootClass.showMenuButton();
                    if (_local2 == 0)
                    {
                        this.world.rootClass.ui.mcPopup.fOpen("DailyLogin");
                    };
                };
            };
            trace(("on avatar load, rootClass: " + this.rootClass));
            if (this.pAV.objData.eqp.co == null){
                this.loadArmorPieces(this.pAV.objData.eqp.ar.sLink);
            };
        }

        public function loadArmor(_arg1:String, _arg2:String):void{
            trace("** PMC loadArmor >");
            this.objLinks.co = _arg2;
            this.armorLoad = false;
            this.world.queueLoad({
                strFile:((((this.world.rootClass.getFilePath() + "classes/") + this.strGender) + "/") + _arg1),
                callBackA:this.onLoadArmorComplete,
                callBackB:this.ioErrorHandler,
                avt:this.pAV,
                sES:"ar"
            });
        }

        public function onLoadArmorComplete(_arg1:Event):void{
			var _local2:*;
            trace(("** PMC onLoadArmorComplete >" + this.objLinks.co));
            this.armorLoad = true;
            if (((this.pAV.isMyAvatar) && (this.pAV.FirstLoad))){
                this.pAV.updateLoaded();
                if (this.pAV.LoadCount <= 0)
                {
                    this.pAV.firstDone();
                    _local2 = this.world.getAchievement("id0", 11);
					this.world.rootClass.showMenuButton();
                    if (_local2 == 0)
                    {
                        this.world.rootClass.ui.mcPopup.fOpen("DailyLogin");
                    };
                };
            };
            this.loadArmorPieces(this.objLinks.co);
            if (this.name.indexOf("previewMCB") > -1){
                MovieClip(parent.parent).repositionPreview(MovieClip(this.mcChar));
            };
        }
		
		public function updateFly():void{
            var uoLeaf:* = this.world.uoTree[this.pAV.pnm];
            if (uoLeaf == null){
                uoLeaf = this.world.uoTree[this.pAV.pnm.toLowerCase()];
            };
            try {
				if (uoLeaf.fly){
					framePrefix = "Fly";
                    //this.mcVending.visible = true;
					//this.mcVending.addEventListener(MouseEvent.CLICK, onLoadVending);
                } else {
                    framePrefix = "";
                };
				
            }
			catch(e:Error) {
                trace(("error on set name: " + e));
            };
        }

        public function ioErrorHandler(_arg1:IOErrorEvent):void{
            trace(("ioErrorHandler: " + _arg1));
        }

        public function loadArmorPieces(_arg1:String):void{
            var AssetClass:Class;
            var child:DisplayObject;
            var strSkinLinkage:String = _arg1;
            trace(">>>>>>>>>>>> loadArmorPieces");
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Head")) as Class);
                child = this.mcChar.head.getChildByName("face");
                if (child != null){
                    this.mcChar.head.removeChild(child);
                };
                this.testMC = this.mcChar.head.addChildAt(new (AssetClass)(), 0);
                this.testMC.name = "face";
            }
            catch(err:Error) {
                AssetClass = (world.getClass(("mcHead" + strGender)) as Class);
                child = mcChar.head.getChildByName("face");
                if (child != null){
                    mcChar.head.removeChild(child);
                };
                testMC = mcChar.head.addChildAt(new (AssetClass)(), 0);
                testMC.name = "face";
            };
            if (this.pAV == this.world.myAvatar){
                this.world.rootClass.showPortrait(this.pAV);
            }
            else {
                if (this.pAV == this.world.myAvatar.target){
                    this.world.rootClass.showPortraitTarget(this.pAV);
                };
            };
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Chest")) as Class);
                this.mcChar.chest.removeChildAt(0);
                this.mcChar.chest.addChild(new (AssetClass)());
            }
            catch(e:Error) {
            };
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Hip")) as Class);
                this.mcChar.hip.removeChildAt(0);
                this.mcChar.hip.addChild(new (AssetClass)());
            }
            catch(e:Error) {
            };
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "FootIdle")) as Class);
                this.mcChar.idlefoot.removeChildAt(0);
                this.mcChar.idlefoot.addChild(new (AssetClass)());
            }
            catch(e:Error) {
            };
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Foot")) as Class);
                this.mcChar.frontfoot.removeChildAt(0);
                this.mcChar.frontfoot.addChild(new (AssetClass)());
                this.mcChar.frontfoot.visible = false;
                this.mcChar.backfoot.removeChildAt(0);
                this.mcChar.backfoot.addChild(new (AssetClass)());
            }
            catch(e:Error) {
            };
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Shoulder")) as Class);
                this.mcChar.frontshoulder.removeChildAt(0);
                this.mcChar.frontshoulder.addChild(new (AssetClass)());
                this.mcChar.backshoulder.removeChildAt(0);
                this.mcChar.backshoulder.addChild(new (AssetClass)());
            }
            catch(e:Error) {
            };
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Hand")) as Class);
                this.mcChar.fronthand.removeChildAt(0);
                this.mcChar.fronthand.addChild(new (AssetClass)());
                this.mcChar.backhand.removeChildAt(0);
                this.mcChar.backhand.addChild(new (AssetClass)());
            }
            catch(e:Error) {
            };
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Ground")) as Class);
            if (AssetClass != null){
                this.shadow.removeChildAt(0);
                this.shadow.addChild(new (AssetClass)());
                this.shadow.alpha = 1;
                this.shadow.scaleX = 0.7;
                this.shadow.scaleY = 0.7;
                this.shadow.scaleX = (this.shadow.scaleX * -1);
            }
            else {
                this.shadow.removeChildAt(0);
                AssetClass = (this.world.getClass("mcShadow") as Class);
                this.shadow.addChild(new (AssetClass)());
                this.shadow.scaleX = 1;
                this.shadow.scaleY = 1;
            };
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Thigh")) as Class);
                this.mcChar.frontthigh.removeChildAt(0);
                this.mcChar.frontthigh.addChild(new (AssetClass)());
                this.mcChar.backthigh.removeChildAt(0);
                this.mcChar.backthigh.addChild(new (AssetClass)());
            }
            catch(e:Error) {
            };
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Shin")) as Class);
                this.mcChar.frontshin.removeChildAt(0);
                this.mcChar.frontshin.addChild(new (AssetClass)());
                this.mcChar.backshin.removeChildAt(0);
                this.mcChar.backshin.addChild(new (AssetClass)());
            }
            catch(e:Error) {
            };
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Robe")) as Class);
            if (AssetClass != null){
                this.mcChar.robe.removeChildAt(0);
                this.mcChar.robe.addChild(new (AssetClass)());
                this.mcChar.robe.visible = true;
            }
            else {
                this.mcChar.robe.visible = false;
            };
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "RobeBack")) as Class);
            if (AssetClass != null){
                this.mcChar.backrobe.removeChildAt(0);
                this.mcChar.backrobe.addChild(new (AssetClass)());
                this.mcChar.backrobe.visible = true;
            }
            else {
                this.mcChar.backrobe.visible = false;
            };
            this.gotoAndPlay("in1");
            this.isLoaded = true;
        }

        public function loadArmorPiecesFromDomain(_arg1:String, _arg2:ApplicationDomain):void{
            var AssetClass:Class;
            var child:DisplayObject;
            var strSkinLinkage:String = _arg1;
            var pLoaderD:ApplicationDomain = _arg2;
            trace((">>>>>>>>>>>> loadArmorPiecesFromDomain > " + strSkinLinkage));
            try {
                AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "Head")) as Class);
                child = this.mcChar.head.getChildByName("face");
                if (child != null){
                    this.mcChar.head.removeChild(child);
                };
                this.testMC = this.mcChar.head.addChildAt(new (AssetClass)(), 0);
                this.testMC.name = "face";
            }
            catch(err:Error) {
                AssetClass = (pLoaderD.getDefinition(("mcHead" + strGender)) as Class);
                child = mcChar.head.getChildByName("face");
                if (child != null){
                    mcChar.head.removeChild(child);
                };
                testMC = mcChar.head.addChildAt(new (AssetClass)(), 0);
                testMC.name = "face";
            };
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "Chest")) as Class);
            this.mcChar.chest.removeChildAt(0);
            this.mcChar.chest.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "Hip")) as Class);
            this.mcChar.hip.removeChildAt(0);
            this.mcChar.hip.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "FootIdle")) as Class);
            this.mcChar.idlefoot.removeChildAt(0);
            this.mcChar.idlefoot.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "Foot")) as Class);
            this.mcChar.frontfoot.removeChildAt(0);
            this.mcChar.frontfoot.addChild(new (AssetClass)());
            this.mcChar.frontfoot.visible = false;
            this.mcChar.backfoot.removeChildAt(0);
            this.mcChar.backfoot.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "Shoulder")) as Class);
            this.mcChar.frontshoulder.removeChildAt(0);
            this.mcChar.frontshoulder.addChild(new (AssetClass)());
            this.mcChar.backshoulder.removeChildAt(0);
            this.mcChar.backshoulder.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "Hand")) as Class);
            this.mcChar.fronthand.removeChildAt(0);
            this.mcChar.fronthand.addChild(new (AssetClass)());
            this.mcChar.backhand.removeChildAt(0);
            this.mcChar.backhand.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "Thigh")) as Class);
            this.mcChar.frontthigh.removeChildAt(0);
            this.mcChar.frontthigh.addChild(new (AssetClass)());
            this.mcChar.backthigh.removeChildAt(0);
            this.mcChar.backthigh.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "Shin")) as Class);
            this.mcChar.frontshin.removeChildAt(0);
            this.mcChar.frontshin.addChild(new (AssetClass)());
            this.mcChar.backshin.removeChildAt(0);
            this.mcChar.backshin.addChild(new (AssetClass)());
            try {
                AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "Robe")) as Class);
                if (AssetClass != null){
                    this.mcChar.robe.removeChildAt(0);
                    this.mcChar.robe.addChild(new (AssetClass)());
                    this.mcChar.robe.visible = true;
                }
                else {
                    this.mcChar.robe.visible = false;
                };
            }
            catch(e:Error) {
                mcChar.robe.visible = false;
            };
            try {
                AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + this.strGender) + "RobeBack")) as Class);
                if (AssetClass != null){
                    this.mcChar.backrobe.removeChildAt(0);
                    this.mcChar.backrobe.addChild(new (AssetClass)());
                    this.mcChar.backrobe.visible = true;
                }
                else {
                    this.mcChar.backrobe.visible = false;
                };
            }
            catch(e:Error) {
                mcChar.backrobe.visible = false;
            };
            this.gotoAndPlay("in1");
            this.isLoaded = true;
        }

        public function loadHair():void{
            trace("pMC.loadHair >");
            var _local1:* = this.pAV.objData.strHairFilename;
            if ((((((((_local1 == undefined)) || ((_local1 == null)))) || ((_local1 == "")))) || ((_local1 == "none")))){
                this.mcChar.head.hair.visible = false;
                return;
            };
            this.hairLoad = false;
            this.world.queueLoad({
                strFile:(this.world.rootClass.getFilePath() + _local1),
                callBackA:this.onHairLoadComplete,
                avt:this.pAV,
                sES:"hair"
            });
        }

        public function onHairLoadComplete(_arg1:Event):void{
            var _local2:Class;
			var _local3:*;
            trace("onHairLoadComplete >");
            this.hairLoad = true;
            if (((this.pAV.isMyAvatar) && (this.pAV.FirstLoad))){
                this.pAV.updateLoaded();
                if (this.pAV.LoadCount <= 0)
                {
                    this.pAV.firstDone();
                    _local3 = this.world.getAchievement("id0", 11);
					this.world.rootClass.showMenuButton();
                    if (_local3 == 0)
                    {
                        this.world.rootClass.ui.mcPopup.fOpen("DailyLogin");
                    };
                };
            };
            try {
                _local2 = (this.world.getClass(((this.pAV.objData.strHairName + this.pAV.objData.strGender) + "Hair")) as Class);
                if (_local2 != null){
                    if (this.mcChar.head.hair.numChildren > 0){
                        this.mcChar.head.hair.removeChildAt(0);
                    };
                    this.mcChar.head.hair.addChild(new (_local2)());
                    this.mcChar.head.hair.visible = true;
                }
                else {
                    this.mcChar.head.hair.visible = false;
                };
                _local2 = (this.world.getClass(((this.pAV.objData.strHairName + this.pAV.objData.strGender) + "HairBack")) as Class);
                if (_local2 != null){
                    if (this.mcChar.backhair.numChildren > 0){
                        this.mcChar.backhair.removeChildAt(0);
                    };
                    this.mcChar.backhair.addChild(new (_local2)());
                    this.mcChar.backhair.visible = true;
                    this.bBackHair = true;
                }
                else {
                    this.mcChar.backhair.visible = false;
                    this.bBackHair = false;
                };
                if (((((this.pAV.isMyAvatar) && (!(MovieClip(parent.parent.parent).ui.mcPortrait.visible)))) && (!(this.bLoadingHelm)))){
                    this.world.rootClass.showPortrait(this.pAV);
					this.world.rootClass.showAvatarinTutorial(this.pAV);
                };
                if (((("he" in this.pAV.objData.eqp)) && (!((this.pAV.objData.eqp.he == null))))){
                    if (this.pAV.dataLeaf.showHelm){
                        this.mcChar.head.hair.visible = false;
                    }
                    else {
                        this.mcChar.head.hair.visible = true;
                    };
                };
            }
            catch(e:Error) {
            };
        }

        public function loadWeapon(_arg1, _arg2):void{
            this.weaponLoad = false;
            this.world.queueLoad({
                strFile:(this.world.rootClass.getFilePath() + _arg1),
                callBackA:this.onLoadWeaponComplete,
                avt:this.pAV,
                sES:"weapon"
            });
        }

        public function onLoadWeaponComplete(_arg1:Event):void{
            var AssetClass:Class;
            var e:Event = _arg1;
            var _local2:* = undefined;
            trace("onLoadWeaponComplete >");
			
			var p:*;
			
			//p = this.world.myAvatar.pMC.location;
			//mvPT = myAvatar.pMC.simulateTo(p.x, p.y, WALKSPEED);
			//this.world.pushMove(pAV, p.x, p.y, 8);
			this.world.updateLocation();
			
			
            this.weaponLoad = true;
            if (((this.pAV.isMyAvatar) && (this.pAV.FirstLoad))){
                this.pAV.updateLoaded();
                if (this.pAV.LoadCount <= 0)
                {
                    this.pAV.firstDone();
                    _local2 = this.world.getAchievement("id0", 11);
					this.world.rootClass.showMenuButton();
                    if (_local2 == 0)
                    {
                        this.world.rootClass.ui.mcPopup.fOpen("DailyLogin");
                    };
                };
            };
            this.mcChar.weapon.removeChildAt(0);
            try {
                AssetClass = (this.world.getClass(this.pAV.objData.eqp.Weapon.sLink) as Class);
                this.mcChar.weapon.mcWeapon = new (AssetClass)();
                this.mcChar.weapon.addChild(this.mcChar.weapon.mcWeapon);
            }
            catch(err:Error) {
                trace(" Weapon added to display list manually");
                mcChar.weapon.mcWeapon = MovieClip(e.target.content);
                mcChar.weapon.addChild(mcChar.weapon.mcWeapon);
            };
            this.mcChar.weapon.visible = true;
            this.mcChar.weaponOff.visible = false;
            var wItem:Object = this.pAV.getItemByEquipSlot("Weapon");
            if (((!((wItem == null))) && (!((wItem.sType == null))))){
                if (wItem.sType == "Dagger"){
                    this.loadWeaponOff(this.pAV.objData.eqp.Weapon.sFile, this.pAV.objData.eqp.Weapon.sLink);
                };
            };
        }

        public function loadWeaponOff(_arg1, _arg2):void{
            this.weaponLoad = false;
            this.world.queueLoad({
                strFile:(this.world.rootClass.getFilePath() + _arg1),
                callBackA:this.onLoadWeaponOffComplete,
                avt:this.pAV,
                sES:"weapon"
            });
        }

        public function onLoadWeaponOffComplete(_arg1:Event):void{
            var AssetClass:Class;
            var e:Event = _arg1;
			var _local2:* = undefined;
            trace("onLoadWeaponOffComplete >");
            this.weaponLoad = true;
            if (((this.pAV.isMyAvatar) && (this.pAV.FirstLoad))){
                this.pAV.updateLoaded();
                if (this.pAV.LoadCount <= 0)
                {
                    this.pAV.firstDone();
                    _local2 = this.world.getAchievement("id0", 11);
					this.world.rootClass.showMenuButton();
                    if (_local2 == 0)
                    {
                        this.world.rootClass.ui.mcPopup.fOpen("DailyLogin");
                    };
                };
            };
            this.mcChar.weaponOff.removeChildAt(0);
            try {
                AssetClass = (this.world.getClass(this.pAV.objData.eqp.Weapon.sLink) as Class);
                this.mcChar.weaponOff.addChild(new (AssetClass)());
            }
            catch(err:Error) {
                trace(" weaponOff added to display list manually");
                mcChar.weaponOff.addChild(e.target.content);
            };
            this.mcChar.weaponOff.visible = true;
        }

        public function loadCape(_arg1, _arg2):void{
            this.capeLoad = false;
            this.world.queueLoad({
                strFile:(this.world.rootClass.getFilePath() + _arg1),
                callBackA:this.onLoadCapeComplete,
                avt:this.pAV,
                sES:"cape"
            });
        }

        public function onLoadCapeComplete(_arg1:Event):void{
            var _local2:Class;
			var _local3:*;
            this.capeLoad = true;
            if (((this.pAV.isMyAvatar) && (this.pAV.FirstLoad))){
                this.pAV.updateLoaded();
                if (this.pAV.LoadCount <= 0)
                {
                    this.pAV.firstDone();
                    _local3 = this.world.getAchievement("id0", 11);
					this.world.rootClass.showMenuButton();
                    if (_local3 == 0)
                    {
                        this.world.rootClass.ui.mcPopup.fOpen("DailyLogin");
                    };
                };
            };
            try {
                _local2 = (this.world.getClass(this.pAV.objData.eqp.ba.sLink) as Class);
                this.mcChar.cape.removeChildAt(0);
                this.mcChar.cape.cape = new (_local2)();
                this.mcChar.cape.addChild(this.mcChar.cape.cape);
                this.mcChar.cape.visible = this.pAV.dataLeaf.showCloak;
            }
            catch(e) {
            };
        }

        public function loadHelm(_arg1, _arg2):void{
            trace("pMC.loadHelm >");
            this.helmLoad = false;
            this.world.queueLoad({
                strFile:(this.world.rootClass.getFilePath() + _arg1),
                callBackA:this.onLoadHelmComplete,
                avt:this.pAV,
                sES:"helm"
            });
            this.bLoadingHelm = true;
        }

        public function onLoadHelmComplete(_arg1:Event):void{
			var _local4:*;
            trace("pMC.onLoadHelmComplete >");
            this.helmLoad = true;
            if (((this.pAV.isMyAvatar) && (this.pAV.FirstLoad))){
                this.pAV.updateLoaded();
                if (this.pAV.LoadCount <= 0)
                {
                    this.pAV.firstDone();
                    _local4 = this.world.getAchievement("id0", 11);
					this.world.rootClass.showMenuButton();
                    if (_local4 == 0)
                    {
                        this.world.rootClass.ui.mcPopup.fOpen("DailyLogin");
                    };
                };
            };
            var _local2:Class = (this.world.getClass(this.pAV.objData.eqp.he.sLink) as Class);
            var _local3:Class = (this.world.getClass((this.pAV.objData.eqp.he.sLink + "_backhair")) as Class);
            if (_local2 != null){
                if (this.mcChar.head.helm.numChildren > 0){
                    this.mcChar.head.helm.removeChildAt(0);
                };
                this.mcChar.head.helm.visible = this.pAV.dataLeaf.showHelm;
                this.mcChar.head.hair.visible = !(this.mcChar.head.helm.visible);
                if (_local3 != null){
                    if (this.pAV.dataLeaf.showHelm){
                        if (this.mcChar.backhair.numChildren > 0){
                            this.mcChar.backhair.removeChildAt(0);
                        };
                        this.mcChar.backhair.visible = true;
                        this.mcChar.backhair.addChild(new (_local3)());
                    };
                }
                else {
                    this.mcChar.backhair.visible = ((this.mcChar.head.hair.visible) && (this.bBackHair));
                };
                this.mcChar.head.helm.addChild(new (_local2)());
                if (this.pAV == this.world.myAvatar){
                    this.world.rootClass.showPortrait(this.pAV);
                };
                if (this.pAV == this.world.myAvatar.target){
                    this.world.rootClass.showPortraitTarget(this.pAV);
                };
            };
            this.bLoadingHelm = false;
        }

        public function setHelmVisibility(_arg1:Boolean):void{
            trace(("setHelmVisibility > " + _arg1));
            if (((!((this.pAV.objData.eqp.he == null))) && (!((this.pAV.objData.eqp.he.sLink == null))))){
                if (_arg1){
                    this.mcChar.head.helm.visible = true;
                    this.mcChar.head.hair.visible = false;
                    this.mcChar.backhair.visible = false;
                }
                else {
                    this.mcChar.head.helm.visible = false;
                    this.mcChar.head.hair.visible = true;
                    this.mcChar.backhair.visible = this.bBackHair;
                };
                if (this.pAV == this.world.myAvatar){
                    this.world.rootClass.showPortrait(this.pAV);
                };
                if (this.pAV == this.world.myAvatar.target){
                    this.world.rootClass.showPortraitTarget(this.pAV);
                };
            };
        }

        public function setCloakVisibility(_arg1:Boolean):void{
            trace(("setCloakVisibility > " + _arg1));
            if (((!((this.pAV.objData.eqp.ba == null))) && (!((this.pAV.objData.eqp.ba.sLink == null))))){
                if (_arg1){
                    this.mcChar.cape.visible = true;
                }
                else {
                    this.mcChar.cape.visible = false;
                };
            };
        }

        public function setColor(mc:MovieClip, _arg2:String, strLocation:String, strShade:String):void{
            //var _local5:Number = Number(this.pAV.objData[("intColor" + _arg3)]);
			var intColor:Number = Number(pAV.objData[("intColor" + strLocation)]);
            mc.isColored = true;
            mc.intColor = intColor;
            mc.strLocation = strLocation;
            mc.strShade = strShade;
            this.changeColor(mc, intColor, strShade);
        }
		
		 public function changeColor(mc:MovieClip, intColor:Number, strShade:String, coloradditive:String=""):void
        {
            var newCT:ColorTransform = new ColorTransform();
            newCT.color = intColor;
            switch (strShade.toUpperCase()){
                case "LIGHT":
                    newCT.redOffset = (newCT.redOffset + 100);
                    newCT.greenOffset = (newCT.greenOffset + 100);
                    newCT.blueOffset = (newCT.blueOffset + 100);
                    break;
                case "DARK":
                    newCT.redOffset = (newCT.redOffset - 25);
                    newCT.greenOffset = (newCT.greenOffset - 50);
                    newCT.blueOffset = (newCT.blueOffset - 50);
                    break;
                case "DARKER":
                    newCT.redOffset = (newCT.redOffset - 125);
                    newCT.greenOffset = (newCT.greenOffset - 125);
                    newCT.blueOffset = (newCT.blueOffset - 125);
                    break;
            };
			/*
			if (coloradditive == "-"){
                newCT.redOffset = (newCT.redOffset * -1);
                newCT.greenOffset = (newCT.greenOffset * -1);
                newCT.blueOffset = (newCT.blueOffset * -1);
            };
            if ((((coloradditive == "")) || (!((mc.transform.colorTransform.redOffset == newCT.redOffset))))){
                mc.transform.colorTransform = newCT;
            };
			*/
            mc.transform.colorTransform = newCT;
        }

        public function modulateColor(_arg1:ColorTransform, _arg2:String):void{
            var _local3:MovieClip = (this.stage.getChildAt(0) as MovieClip);
            if (_arg2 == "+"){
                this.totalTransform.alphaMultiplier = (this.totalTransform.alphaMultiplier + _arg1.alphaMultiplier);
                this.totalTransform.alphaOffset = (this.totalTransform.alphaOffset + _arg1.alphaOffset);
                this.totalTransform.redMultiplier = (this.totalTransform.redMultiplier + _arg1.redMultiplier);
                this.totalTransform.redOffset = (this.totalTransform.redOffset + _arg1.redOffset);
                this.totalTransform.greenMultiplier = (this.totalTransform.greenMultiplier + _arg1.greenMultiplier);
                this.totalTransform.greenOffset = (this.totalTransform.greenOffset + _arg1.greenOffset);
                this.totalTransform.blueMultiplier = (this.totalTransform.blueMultiplier + _arg1.blueMultiplier);
                this.totalTransform.blueOffset = (this.totalTransform.blueOffset + _arg1.blueOffset);
            }
            else {
                if (_arg2 == "-"){
                    this.totalTransform.alphaMultiplier = (this.totalTransform.alphaMultiplier - _arg1.alphaMultiplier);
                    this.totalTransform.alphaOffset = (this.totalTransform.alphaOffset - _arg1.alphaOffset);
                    this.totalTransform.redMultiplier = (this.totalTransform.redMultiplier - _arg1.redMultiplier);
                    this.totalTransform.redOffset = (this.totalTransform.redOffset - _arg1.redOffset);
                    this.totalTransform.greenMultiplier = (this.totalTransform.greenMultiplier - _arg1.greenMultiplier);
                    this.totalTransform.greenOffset = (this.totalTransform.greenOffset - _arg1.greenOffset);
                    this.totalTransform.blueMultiplier = (this.totalTransform.blueMultiplier - _arg1.blueMultiplier);
                    this.totalTransform.blueOffset = (this.totalTransform.blueOffset - _arg1.blueOffset);
                };
            };
            this.clampedTransform.alphaMultiplier = _local3.clamp(this.totalTransform.alphaMultiplier, -1, 1);
            this.clampedTransform.alphaOffset = _local3.clamp(this.totalTransform.alphaOffset, -255, 0xFF);
            this.clampedTransform.redMultiplier = _local3.clamp(this.totalTransform.redMultiplier, -1, 1);
            this.clampedTransform.redOffset = _local3.clamp(this.totalTransform.redOffset, -255, 0xFF);
            this.clampedTransform.greenMultiplier = _local3.clamp(this.totalTransform.greenMultiplier, -1, 1);
            this.clampedTransform.greenOffset = _local3.clamp(this.totalTransform.greenOffset, -255, 0xFF);
            this.clampedTransform.blueMultiplier = _local3.clamp(this.totalTransform.blueMultiplier, -1, 1);
            this.clampedTransform.blueOffset = _local3.clamp(this.totalTransform.blueOffset, -255, 0xFF);
            this.transform.colorTransform = this.clampedTransform;
        }

        public function updateColor(_arg1:Object=null){
            var _local2:* = this.pAV.objData;
            if (_arg1 != null){
                _local2 = _arg1;
            };
            var _local3:* = MovieClip(stage.getChildAt(0)).ui;
            this.scanColor(this, _local2);
            if (((((!((this.pAV == null))) && (!((_local3.mcPortrait.pAV == null))))) && ((_local3.mcPortrait.pAV == this.pAV)))){
                this.scanColor(_local3.mcPortrait.mcHead, _local2);
            };
            if (((((!((this.pAV == null))) && (!((_local3.mcPortraitTarget.pAV == null))))) && ((_local3.mcPortraitTarget.pAV == this.pAV)))){
                this.scanColor(_local3.mcPortraitTarget.mcHead, _local2);
            };
        }

        private function scanColor(_arg1:MovieClip, _arg2):void{
            var _local4:DisplayObject;
            if (("isColored" in _arg1)){
                this.changeColor(_arg1, Number(_arg2[("intColor" + _arg1.strLocation)]), _arg1.strShade);
            };
            var _local3:int;
            while (_local3 < _arg1.numChildren) {
                _local4 = _arg1.getChildAt(_local3);
                if ((_local4 is MovieClip)){
                    this.scanColor(MovieClip(_local4), _arg2);
                };
                _local3++;
            };
        }

        public function queueAnim(_arg1:String):void{
            var petSplit:Array;
            var p:String;
            var pItem:Object;
            var wItem:Object;
            var sType:* = undefined;
            var world:MovieClip;
            var l:String;
            var s:String = _arg1;
            if (s.indexOf("Pet") > -1){
                pItem = this.pAV.getItemByEquipSlot("pe");
                if (s.indexOf(":") > -1){
                    petSplit = s.split(":");
                    s = petSplit[0];
                    try {
                        if (pItem != null){
                            if (petSplit[1] == "PetAttack"){
                                p = ["Attack1", "Attack2"][Math.round((Math.random() * 1))];
                                if (this.pAV.petMC.mcChar.currentLabel == "Idle"){
                                    this.pAV.petMC.mcChar.gotoAndPlay(p);
                                };
                            }
                            else {
                                p = petSplit[1].slice(3);
                                if (this.pAV.petMC.mcChar.currentLabel == "Idle"){
                                    this.pAV.petMC.mcChar.gotoAndPlay(p);
                                };
                            };
                        };
                    }
                    catch(e) {
                    };
                }
                else {
                    if (pItem != null){
                        try {
                            p = ["Attack1", "Attack2"][Math.round((Math.random() * 1))];
                            if (this.pAV.petMC.mcChar.currentLabel == "Idle"){
                                this.pAV.petMC.mcChar.gotoAndPlay(p);
                            };
                            return;
                        }
                        catch(e) {
                            s = ["Attack1", "Attack2"][Math.round((Math.random() * 1))];
                        };
                    }
                    else {
                        s = (((s.indexOf("1"))>-1) ? "Attack1" : "Attack2");
                    };
                };
            };
            if ((((s == "Attack1")) || ((s == "Attack2")))){
                wItem = this.pAV.getItemByEquipSlot("Weapon");
                if (((!((wItem == null))) && (!((wItem.sType == null))))){
                    sType = wItem.sType;
                    if ((((wItem.ItemID == 0)) || ((wItem.ItemID == 100060)) || ((wItem.ItemID == 200379)))){
                        sType = "Unarmed";
                    };
                    switch (sType){
                        case "Unarmed":
                            s = ["UnarmedAttack1", "UnarmedAttack2", "KickAttack", "FlipAttack"][Math.round((Math.random() * 3))];
                            break;
                        case "Polearm":
                            s = ["PolearmAttack1", "PolearmAttack2"][Math.round((Math.random() * 1))];
                            break;
                        case "Dagger":
                            s = ["DuelWield/DaggerAttack1", "DuelWield/DaggerAttack2"][Math.round((Math.random() * 1))];
                            break;
						case "Claw":
                        	s = ["FistweaponAttack1", "FistweaponAttack2"][Math.round((Math.random() * 1))];
                        	break;
                    	case "Shield":
                        	s = ["Sword/ShieldAttack1", "Sword/ShieldAttack2"][Math.round((Math.random() * 1))];
                        	break;
                        case "Bow":
                            s = "RangedAttack1";
                            break;
                    };
                } else {
					s = ["UnarmedAttack1", "UnarmedAttack2", "KickAttack", "FlipAttack"][Math.round((Math.random() * 3))];
				};
            };
            if (((this.hasLabel(s)) && ((this.pAV.dataLeaf.intState > 0)))){
                this.pAV.handleItemAnimation();
                world = (MovieClip(stage.getChildAt(0)).world as MovieClip);
                l = this.mcChar.currentLabel;
                if ((((world.combatAnims.indexOf(s) > -1)) && ((world.combatAnims.indexOf(l) > -1)))){
                    this.animQueue.push(s);
                }
                else {
                    this.mcChar.gotoAndPlay(s);
                    if ((((s.indexOf("Attack") >= 0)) && ((this.mcChar.weapon.mcWeapon.bAttack == true)))){
                        this.mcChar.weapon.mcWeapon.gotoAndPlay("Attack");
                    };
                };
            };
        }
		
		public function loadAccessory(_arg1, _arg2):void{
            this.accessoryLoad = false;
            this.world.queueLoad({
                strFile:(this.world.rootClass.getFilePath() + _arg1),
                callBackA:this.onLoadAccessoryComplete,
                avt:this.pAV,
                sES:"necklace"
            });
        }

        public function onLoadAccessoryComplete(_arg1:Event):void{
            var _local2:Class;
			var _local3:*;
            this.accessoryLoad = true;
            if (((this.pAV.isMyAvatar) && (this.pAV.FirstLoad))){
                this.pAV.updateLoaded();
                if (this.pAV.LoadCount <= 0)
                {
                    this.pAV.firstDone();
                    _local3 = this.world.getAchievement("id0", 11);
					this.world.rootClass.showMenuButton();
                    if (_local3 == 0)
                    {
                        this.world.rootClass.ui.mcPopup.fOpen("DailyLogin");
                    };
                };
            };
            try {
                _local2 = (this.world.getClass(this.pAV.objData.eqp.am.sLink) as Class);
                this.mcChar.necklace.removeChildAt(0);
                this.mcChar.necklace.necklace = new (_local2)();
                this.mcChar.necklace.addChild(this.mcChar.necklace.necklace);
				this.mcChar.necklace.visible = true;
				this.mcChar.necklace.temp.visible = false;
            }
            catch(e) {
            };
        }

        private function checkQueue(_arg1:Event):Boolean{
            var _local2:MovieClip;
            var _local3:String;
            var _local4:int;
            var _local5:*;
            if (this.animQueue.length > 0){
                _local2 = (MovieClip(stage.getChildAt(0)).world as MovieClip);
                _local3 = this.mcChar.currentLabel;
                _local4 = this.mcChar.emoteLoopFrame();
                if ((((_local2.combatAnims.indexOf(_local3) > -1)) && ((this.mcChar.currentFrame > (_local4 + 4))))){
                    _local5 = this.animQueue[0];
                    this.mcChar.gotoAndPlay(_local5);
                    if ((((_local5.indexOf("Attack") >= 0)) && ((this.mcChar.weapon.mcWeapon.bAttack == true)))){
                        this.mcChar.weapon.mcWeapon.gotoAndPlay("Attack");
                    };
                    this.animQueue.shift();
                    return (true);
                };
            };
            return (false);
        }

        public function clearQueue():void{
            this.animQueue = [];
        }

        private function linearTween(_arg1, _arg2, _arg3, _arg4):Number{
            return ((((_arg3 * _arg1) / _arg4) + _arg2));
        }

        public function walkTo(_arg1:int, _arg2:int, _arg3:int):void{
            var dist:Number;
            var dx:Number;
            var toX:int = _arg1;
            var toY:int = _arg2;
            var walkSpeed:int = _arg3;
            var isOK:Boolean = true;
            try {
                this.STAGE = MovieClip(parent.parent);
            }
            catch(e:Error) {
                isOK = false;
            };
            if (isOK){
                if (((!((this.pAV.petMC == null))) && (!((this.pAV.petMC.mcChar == null))))){
                    this.pAV.petMC.walkTo((toX - 20), (toY + 5), (walkSpeed - 3));
                };
                this.op = new Point(this.x, this.y);
                this.tp = new Point(toX, toY);
                this.walkSpeed = walkSpeed;
                dist = Point.distance(this.op, this.tp);
                this.walkTS = new Date().getTime();
                this.walkD = Math.round((1000 * (dist / (walkSpeed * 22))));
                if (this.walkD > 0){
                    dx = (this.op.x - this.tp.x);
                    if (dx < 0){
                        this.turn("right");
                    }
                    else {
                        this.turn("left");
                    };
                    if (!this.mcChar.onMove){
                        this.mcChar.onMove = true;
						if (this.mcChar.currentLabel != (framePrefix + "Walk")){
                            this.mcChar.gotoAndPlay((framePrefix + "Walk"));
                        };
                        //if (this.mcChar.currentLabel != "Walk"){
                        //    this.mcChar.gotoAndPlay("Walk");
                        //};
                    };
                    this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrameWalk);
                    this.addEventListener(Event.ENTER_FRAME, this.onEnterFrameWalk);
                };
            };
        }

        private function onEnterFrameWalk(_arg1:Event):void{
            var vX:*;
            var vY:*;
            var bitCollision:Boolean;
            var n:*;
            var nY:*;
            var i:*;
            var j:*;
            var k:int;
            var hitOK:Boolean;
            var aP:Point;
            var aR:Rectangle;
            var now:Number = new Date().getTime();
            var f:Number = ((now - this.walkTS) / this.walkD);
            if (f > 1){
                f = 1;
            };
			this.STAGE = MovieClip(parent.parent);
            if ((((Point.distance(this.op, this.tp) > 0.5)) && (this.mcChar.onMove))){
                vX = this.x;
                vY = this.y;
                this.x = Point.interpolate(this.tp, this.op, f).x;
                this.y = Point.interpolate(this.tp, this.op, f).y;
				if (!(bFly)){
					bitCollision = false;
					n = 0;
					while (n < this.STAGE.arrSolid.length) {
						if (this.shadow.hitTestObject(this.STAGE.arrSolid[n].shadow)){
							bitCollision = true;
							n = this.STAGE.arrSolid.length;
						};
						n++;
					};
					if (bitCollision){
						nY = this.y;
						this.y = vY;
						bitCollision = false;
						i = 0;
						while (i < this.STAGE.arrSolid.length) {
							if (this.shadow.hitTestObject(this.STAGE.arrSolid[i].shadow)){
								this.y = nY;
								bitCollision = true;
								break;
							};
							i++;
						};
						if (bitCollision){
							this.x = vX;
							bitCollision = false;
							j = 0;
							while (j < this.STAGE.arrSolid.length) {
								if (this.shadow.hitTestObject(this.STAGE.arrSolid[j].shadow)){
									bitCollision = true;
									break;
								};
								j++;
							};
							if (bitCollision){
								this.x = vX;
								this.y = vY;
								this.stopWalking();
							};
						};
					};
				};
                if ((((((Math.round(vX) == Math.round(this.x))) && ((Math.round(vY) == Math.round(this.y))))) && ((now > (this.walkTS + 50))))){
                    this.stopWalking();
                };
                if (this.pAV.isMyAvatar){
					var rootClass:MovieClip;
					rootClass = (this.stage.getChildAt(0) as MovieClip);
					rootClass.world.mapScrollCheck();
                    this.checkPadLabels();
                    k = 0;
                    while (k < this.STAGE.arrEvent.length) {
                        hitOK = false;
                        this.world = MovieClip(stage.getChildAt(0)).world;
                        if (this.world.bPvP){
                            aP = this.shadow.localToGlobal(new Point(0, 0));
                            aR = this.STAGE.arrEvent[k].shadow.getBounds(stage);
                            if (aR.containsPoint(aP)){
                                hitOK = true;
                            };
                        }
                        else {
                            if (this.shadow.hitTestObject(this.STAGE.arrEvent[k].shadow)){
                                hitOK = true;
                            };
                        };
                        if (hitOK){
                            if (((!(this.STAGE.arrEvent[k]._entered)) && (MovieClip(this.STAGE.arrEvent[k]).isEvent))){
                                this.STAGE.arrEvent[k]._entered = true;
                                if (this == MovieClip(parent.parent).myAvatar.pMC){
                                    this.STAGE.arrEvent[k].dispatchEvent(new Event("enter"));
                                };
                            };
                        }
                        else {
                            if (this.STAGE.arrEvent[k]._entered){
                                this.STAGE.arrEvent[k]._entered = false;
                            };
                        };
                        k++;
                    };
                };
            }
            else {
                this.stopWalking();
            };
        }

        public function simulateTo(_arg1:int, _arg2:int, _arg3:int):Point{
            this.STAGE = MovieClip(parent.parent);
            this.xDep = this.x;
            this.yDep = this.y;
            this.xTar = _arg1;
            this.yTar = _arg2;
            this.walkSpeed = _arg3;
            this.nDuration = Math.round((Math.sqrt((Math.pow((this.xTar - this.x), 2) + Math.pow((this.yTar - this.y), 2))) / _arg3));
            var _local4:* = new Point();
            if (this.nDuration){
                this.nXStep = 0;
                this.nYStep = 0;
                if (!this.mcChar.onMove){
                    this.mcChar.onMove = true;
                };
                _local4 = this.simulateWalkLoop();
            }
            else {
                _local4 = null;
            };
            this.x = this.xDep;
            this.y = this.yDep;
            this.mcChar.onMove = false;
            return (_local4);
        }

        private function simulateWalkLoop():Point{

            var vX:*;
            var vY:*;
            var bitCollision:Boolean;
            var n:*;
            var nY:*;
            var i:*;
            var j:*;
			this.STAGE = MovieClip(parent.parent);
            while ((((((this.nXStep <= this.nDuration)) || ((this.nYStep <= this.nDuration)))) && (this.mcChar.onMove))) {
                vX = this.x;
                vY = this.y;
                this.x = linearTween(this.nXStep, this.xDep, (this.xTar - this.xDep), this.nDuration);
                this.y = linearTween(this.nYStep, this.yDep, (this.yTar - this.yDep), this.nDuration);
                bitCollision = false;
                n = 0;
                while (n < STAGE.arrSolid.length) {
					//trace(">> 1");
                    if (this.shadow.hitTestObject(STAGE.arrSolid[n].shadow)){
                        bitCollision = true;
                        n = STAGE.arrSolid.length;
                    };
                    n++;
                };
				//trace(bitCollision);
                if (((!(bFly)) && (bitCollision))){
                    nY = this.y;
                    this.y = vY;
                    bitCollision = false;
                    i = 0;
                    while (i < STAGE.arrSolid.length) {
                        if (this.shadow.hitTestObject(STAGE.arrSolid[i].shadow)){
                            this.y = nY;
                            bitCollision = true;
                            break;
                        };
                        i++;
						//trace(bitCollision);
                    };
                    if (bitCollision){
                        this.x = vX;
                        bitCollision = false;
                        j = 0;
                        while (j < STAGE.arrSolid.length) {
                            if (this.shadow.hitTestObject(STAGE.arrSolid[j].shadow)){
                                bitCollision = true;
                                break;
                            };
                            j++;
							//trace(bitCollision);
                        };
                        if (bitCollision){
                            this.x = vX;
                            this.y = vY;
                            this.mcChar.onMove = false;
                            this.nDuration = -1;
                            return (new Point(this.x, this.y));
							//trace(bitCollision);
                        };
                        if (this.nYStep <= this.nDuration){
                            this.nYStep++;
                        };
                    } else {
                        if (this.nXStep <= this.nDuration){
                            this.nXStep++;
                        };
                    };
                } else {
                    if (this.nXStep <= this.nDuration){
                        this.nXStep++;
                    };
                    if (this.nYStep <= this.nDuration){
                        this.nYStep++;
                    };
                };
                if ((((((Math.round(vX) == Math.round(this.x))) && ((Math.round(vY) == Math.round(this.y))))) && ((((this.nXStep > 1)) || ((this.nYStep > 1)))))){
                    this.mcChar.onMove = false;
                    this.nDuration = -1;
                    return (new Point(this.x, this.y));
                };
            };
            this.mcChar.onMove = false;
            this.nDuration = -1;
            return (new Point(this.x, this.y));
        }
		
		public function get fly():Boolean {
            return (bFly);
        }
		
		public function set fly(flag:Boolean):void
        {
            bFly = flag;
            if (bFly){
                framePrefix = "Fly";
				
				//TO BE ADDED NEXT
                //this.mcChar.cape.mcCape.gotoAndPlay("Fly");
                this.shadow.visible = false;
            } else {
                framePrefix = "";
                //this.mcChar.cape.mcCape.gotoAndPlay("Ground");
            };
        }

        public function stopWalking():void{
            this.world = MovieClip(stage.getChildAt(0)).world;
            if (this.mcChar.onMove){
                this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrameWalk);
                if (((this.pAV.isMyAvatar) && (MovieClip(parent.parent).actionReady))){
                    this.world.testAction(this.world.getAutoAttack());
                };
            };
            this.mcChar.onMove = false;
            if (this.walkSpeed > 23){
                this.mcChar.gotoAndPlay("Fight");
            }
            else {
				this.mcChar.gotoAndPlay((framePrefix + "Idle"));
                //this.mcChar.gotoAndPlay("Idle");
            };
        }

        public function checkPadLabels(){
            var _local4:*;
            var _local5:*;
            var _local1:* = MovieClip(stage.getChildAt(0));
            var _local2:* = _local1.ui;
            var _local3:int;
            while (_local3 < _local2.mcPadNames.numChildren) {
                _local4 = MovieClip(_local2.mcPadNames.getChildAt(_local3));
                _local5 = new Point(4, 8);
                _local5 = _local4.cnt.localToGlobal(_local5);
                if (_local1.distanceO(this, _local5) < 200){
                    if (!_local4.isOn){
                        _local4.isOn = true;
                        _local4.gotoAndPlay("in");
                    };
                }
                else {
                    if (_local4.isOn){
                        _local4.isOn = false;
                        _local4.gotoAndPlay("out");
                    };
                };
                _local3++;
            };
        }

        public function turn(_arg1:String):void{
            if ((((((_arg1 == "right")) && ((this.mcChar.scaleX < 0)))) || ((((_arg1 == "left")) && ((this.mcChar.scaleX > 0)))))){
                this.mcChar.scaleX = (this.mcChar.scaleX * -1);
            };
        }

        public function scale(_arg1:Number):void{
            if ((this.mcChar.scaleX >= 0)){
                this.mcChar.scaleX = _arg1;
            } else {
                this.mcChar.scaleX = -(_arg1);
            };
			this.mcChar.scaleY = _arg1;
            /*
			//this.pAV.objData.intAccessLevel == 60
			if ((this.mcChar.scaleX >= 0)){
				if(this.world.myAvatarpAV.objData.Stage == "Kid"){
					this.mcChar.scaleX = 4;
				} else {
					this.mcChar.scaleX = _arg1;
				}
            } else {
                this.mcChar.scaleX = -(_arg1);
            };
			*/
			
            this.shadow.scaleX = (this.shadow.scaleY = _arg1);
            var _local2:Point = this.mcChar.localToGlobal(this.headPoint);
            _local2 = this.globalToLocal(_local2);
            this.pname.y = int(_local2.y);
			this.mcVending.y = int(((this.pname.y - this.ignore.height) - 2))
			// this.EmoticonMC.y = int(_local2.y);
			// this.EmoticonMC.x = 20;
			this.bubble.y = ((this.pname.y - this.bubble.bg.height) + 15);
            //this.bubble.y = int((this.hpBar.y));//int((this.pname.y - this.bubble.height));
            this.ignore.y = int(((this.pname.y - this.ignore.height) - 2));
            this.drawHitBox();
        }

        public function endAction():void{
            var _local2:Number;
            var _local3:String;
            var _local4:Object;
            var _local5:*;
            var _local1:* = null;
            if (this.pAV.target != null){
                _local1 = this.pAV.target.pMC.mcChar;
            };
            if (!this.checkQueue(null)){
                if (this.mcChar.onMove){
                    this.mcChar.gotoAndPlay("Walk");
                    _local2 = (this.x - this.xTar);
                    if ((_local2 < 0)){
                        this.turn("right");
                    }
                    else {
                        this.turn("left");
                    };
                }
                else {
                    if ((((_local1 == null)) || (((!((_local1 == null))) && ((((((((_local1.currentLabel == "Die")) || ((_local1.currentLabel == "Feign")))) || ((_local1.currentLabel == "Dead")))) || ((((this.pAV.target.npcType == "player")) && (((!(("pvpTeam" in this.pAV.dataLeaf))) || ((this.pAV.dataLeaf.pvpTeam == this.pAV.target.dataLeaf.pvpTeam)))))))))))){
                        if (this.mcChar.currentLabel != "Jump"){
                            this.mcChar.gotoAndPlay("Idle");
                        };
                        if (_local1 != null){
                            if (this.pAV.target.dataLeaf.intState == 0){
                                if (this.pAV == this.world.myAvatar){
                                    this.world.setTarget(null);
                                };
                            };
                        };
                    }
                    else {
                        _local3 = "Fight";
                        _local4 = this.pAV.getItemByEquipSlot("Weapon");
                        if (((!((_local4 == null))) && (!((_local4.sType == null))))){
                            _local5 = _local4.sType;
                            if (_local4.ItemID == 156){
                                _local5 = "Unarmed";
                            };
                            switch (_local5){
                                case "Unarmed":
                                    _local3 = "UnarmedFight";
                                    break;
                                case "Polearm":
                                    _local3 = "PolearmFight";
                                    break;
                                case "Dagger":
                                    _local3 = "DuelWield/DaggerFight";
                                    break;
								case "Claw":
                        			_local3 = "FistweaponFight";
                       				 break;
                    			case "Shield":
                       				_local3 = "Sword/ShieldFight";
                        			break;
                   				case "Bow":
                        			_local3 = "RangedFight";
                        			break;
                            };
                        };
                        this.mcChar.gotoAndPlay(_local3);
                    };
                };
            };
        }

        private function drawHitBox():void{
            this.mcChar.hitbox.graphics.clear();
            var _local1:int = -30;
            var _local2:int = 60;
            var _local3:int = this.mcChar.head.y;
            var _local4:int = (-(_local3) * 0.8);
            this.hitboxR = new Rectangle(_local1, _local3, _local2, _local4);
            var _local5:Graphics = this.mcChar.hitbox.graphics;
            _local5.lineStyle(0, 0xFFFFFF, 0);
            _local5.beginFill(0xAA00FF, 0);
            _local5.moveTo(_local1, _local3);
            _local5.lineTo((_local1 + _local2), _local3);
            _local5.lineTo((_local1 + _local2), (_local3 + _local4));
            _local5.lineTo(_local1, (_local3 + _local4));
            _local5.lineTo(_local1, _local3);
            _local5.endFill();
        }

        public function showHealIcon():void{
            var _local1:HealIconMC;
            if (!getChildByName("HealIconMC")){
                _local1 = new HealIconMC(this.pAV, this.world);
                _local1.name = "HealIconMC";
                addChild(_local1);
            };
        }

        private function randomNumber(_arg1:Number, _arg2:Number):Number{
            this.randNum = (_arg1 + (((_arg2 + 1) - _arg1) * this.XORandom()));
            return ((((this.randNum)<_arg2) ? this.randNum : _arg2));
        }

        private function XORandom():Number{
            this.r = (this.r ^ (this.r << 21));
            this.r = (this.r ^ (this.r >>> 35));
            this.r = (this.r ^ (this.r << 4));
            if (this.r > 0){
                return ((this.r * this.MAX_RATIO));
            };
            return ((this.r * this.NEGA_MAX_RATIO));
        }

        public function playSound():void{
            var _local1:String;
            trace("playing sounds");
            if (this.world.rootClass.mixer.bSoundOn){
                _local1 = ("Fart" + String(int(this.randomNumber(8, 13))));
                trace(("playing: " + _local1));
                this.Sounds.gotoAndPlay(_local1);
            };
        }

        public function addAnimationListener(_arg1:String, _arg2:Function):void{
            if (this.animEvents[_arg1] == null){
                this.animEvents[_arg1] = new Array();
            };
            if (!this.hasAnimationListener(_arg1, _arg2)){
                this.animEvents[_arg1].push(_arg2);
            };
        }

        public function removeAnimationListener(_arg1:String, _arg2:Function):void{
            if (this.animEvents[_arg1] == null){
                return;
            };
            var _local3:uint;
            while (_local3 < this.animEvents[_arg1].length) {
                if (this.animEvents[_arg1][_local3] == _arg2){
                    this.animEvents[_arg1].splice(_local3, 1);
                    return;
                };
                _local3++;
            };
        }

        public function hasAnimationListener(_arg1:String, _arg2:Function):Boolean{
            if (this.animEvents[_arg1] == null){
                return (false);
            };
            var _local3:uint;
            while (_local3 < this.animEvents[_arg1].length) {
                if (this.animEvents[_arg1][_local3] == _arg2){
                    return (true);
                };
                _local3++;
            };
            return (false);
        }

        private function handleAnimEvent(_arg1:String):void{
            var _local2:Function;
            if (this.animEvents[_arg1] == null){
                return;
            };
            var _local3:uint;
            while (_local3 < this.animEvents[_arg1].length) {
                _local2 = this.animEvents[_arg1][_local3];
                (_local2());
                _local3++;
            };
        }

        public function get AnimEvent():Object{
            return (this.animEvents);
        }

        public function artLoaded():Boolean{
            return (((((((((((((this.weaponLoad) && (this.capeLoad))) && (this.helmLoad))) && (this.armorLoad))) && (this.classLoad))) && (this.hairLoad))) && (this.accessoryLoad)));
        }

        function frame1(){
            //this.mcChar.transform.colorTransform = this.CT1;
            //this.mcChar.alpha = 0;
            stop();
        }

        function frame5(){
            //this.mcChar.transform.colorTransform = this.CT1;
            //this.mcChar.alpha = 0;
        }

        function frame8(){
            stop();
        }

        function frame10(){
            this.mcChar.alpha = 0;
        }

        function frame12(){
            this.mcChar.transform.colorTransform = this.CT3;
        }

        function frame13(){
            this.mcChar.transform.colorTransform = this.CT2;
        }

        function frame14(){
            this.mcChar.transform.colorTransform = this.CT1;
        }

        function frame18(){
            stop();
        }

        function frame20(){
            this.mcChar.transform.colorTransform = this.CT1;
        }

        function frame23(){
            stop();
        }
		
		public function simulateJumpUp():Point
        {
            return (new Point(this.x, (this.y - (96 * this.mcChar.scaleY))));
        }
		
		public function GroundToFly():void
        {
            jumpOP = new Point(this.x, this.y);
            jumpTS = new Date().getTime();
            this.addEventListener(Event.ENTER_FRAME, onJumpEnterFrame);
            this.mcChar.gotoAndPlay("Ground2Fly");
            bFlyTransition = true;
        }
		
		public function FlyToGround():void
        {
            jumpOP = new Point(this.x, this.y);
            bLanding = false;
            jumpTS = new Date().getTime();
            this.addEventListener(Event.ENTER_FRAME, onJumpDownEnterFrame);
            bFlyTransition = true;
        }
		
		 private function onJumpEnterFrame(e:Event):void
        {
            var now:Number;
            var f:Number;
            var jumpY:int;
            var deltaY:Number;
            now = new Date().getTime();
            f = (((now - jumpTS) * 24) / 1000);
            jumpY = (-96 * this.mcChar.scaleY);
            if (f >= 10){
                deltaY = (((jumpY * 2) / 3) + (((f - 10) * jumpY) / (3 * 6)));
                this.y = (jumpOP.y + deltaY);
            };
            if (f >= 16){
                this.y = (jumpOP.y + jumpY);
                this.removeEventListener(Event.ENTER_FRAME, onJumpEnterFrame);
                bFlyTransition = false;
            };
            if (this.pAV.isMyAvatar){
				var rootClass:MovieClip;
				rootClass = (this.stage.getChildAt(0) as MovieClip);
                rootClass.world.mapScrollCheck();
            };
        }
		
		private function onJumpDownEnterFrame(e:Event):void
        {
            var now:Number;
            var f:Number;
            var deltaY:Number;
            var bCollision:Boolean;
            var r:Rectangle;
            var lookahead:Number;
            var i:*;
            now = new Date().getTime();
            f = (((now - jumpTS) * 24) / 1000);
            deltaY = (12 * this.mcChar.scaleY);
            if (!(bLanding)){
                bCollision = false;
                r = this.shadow.getBounds(stage);
                lookahead = (8 * deltaY);
                i = 0;
                while (i < STAGE.arrSolid.length) {
                    if (((STAGE.arrSolid[i].shadow.hitTestPoint(r.x, (r.y + lookahead))) || (STAGE.arrSolid[i].shadow.hitTestPoint(r.right, (r.y + lookahead))))){
                        bCollision = true;
                        break;
                    };
                    i++;
                };
                if (!(bCollision)){
                    this.mcChar.gotoAndPlay("Fly2Ground");
                    this.jumpTargetY = (this.y + lookahead);
                    if (world.map.localToGlobal(new Point(0, this.jumpTargetY)).y >= 500){
                        this.jumpTargetY = world.map.globalToLocal(new Point(0, 500)).y;
                    };
					//var rootClass:MovieClip;
					//rootClass = (this.stage.getChildAt(0) as MovieClip);
					//var location = rootClass.world.myAvatar.pMC.location;
					//rootClass.world.pushMove(rootClass.world.myAvatar.pMC, location.x, location.y, 8);
                    bLanding = true;
                };
            };
            this.y = (jumpOP.y + (f * deltaY));
            if (((bLanding) && ((this.y >= this.jumpTargetY)))){
                this.y = this.jumpTargetY;
                this.shadow.visible = true;
                this.removeEventListener(Event.ENTER_FRAME, onJumpDownEnterFrame);
                bFlyTransition = false;
                this.mcChar.gotoAndPlay("Fly2Ground2");
            };
            if (this.pAV.isMyAvatar){
				var rootClass2:MovieClip;
				rootClass2 = (this.stage.getChildAt(0) as MovieClip);
                rootClass2.world.mapScrollCheck();
            };
        }
		
		
		public function simulateJumpDown():Point
        {
            var pt:Point;
            var deltaY:Number;
            var r:Rectangle;
            var lookahead:Number;
            var bCollision:Boolean;
            var i:*;
            pt = new Point(this.x, this.y);
            deltaY = (12 * this.mcChar.scaleY);
            r = this.shadow.getBounds(stage);
            lookahead = (8 * deltaY);
            while (true) {
                bCollision = false;
                i = 0;
                while (i < STAGE.arrSolid.length) {
                    if (((STAGE.arrSolid[i].shadow.hitTestPoint(r.x, (r.y + lookahead))) || (STAGE.arrSolid[i].shadow.hitTestPoint(r.right, (r.y + lookahead))))){
                        bCollision = true;
                        break;
                    };
                    i++;
                };
                if (!(bCollision)){
                    pt.y = (pt.y + lookahead);
                    break;
                };
                r.offset(0, deltaY);
                pt.y = (pt.y + deltaY);
            };
            if (world.map.localToGlobal(pt).y >= 500){
                pt.y = world.map.globalToLocal(new Point(0, 500)).y;
            };
            return (pt);
        }


    }
}//package 

