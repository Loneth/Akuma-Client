// Decompiled by AS3 Sorcerer 1.40
// http://www.as3sorcerer.com/

//AvatarMC

package 
{
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.geom.ColorTransform;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.utils.getDefinitionByName;
    import flash.filters.GlowFilter;

    public class AvatarMC2 extends MovieClip 
    {

        public var mcChar:MovieClip;
        public var shadow:MovieClip;
        public var strGender:String;
		public var strArmorSWF:String;
		public var strArmorLink:String;
		public var strWeaponLink:String;
		public var strCapeLink:String;
		public var strHelmLink:String;
		public var strHairLink:String;
		public var strPetLink:String;
        public var noGlow:Boolean = false;
        var ldr:Loader;
        var defaultCT:ColorTransform;
        var serverFilePath:String = "";
        public var pAV:Object;
        var strSkinLinkage:String;
		
		public var rootClass;

        public function AvatarMC2()
        {
			rootClass = MovieClip(stage.getChildAt(0));
            this.ldr = new Loader();
            this.defaultCT = MovieClip(this).transform.colorTransform;
            this.pAV = new Object();
            super();
            var reg:RegExp = /http:\/\/[\w.]+/i;
            this.serverFilePath = (this.rootClass.getFilePath());//("http://le-miracle.online/gamefiles/");
            visible = false;
            this.hideOptionalParts();
        }

        public function hideOptionalParts():void
        {
            var i:*;
            var killList:* = ["cape", "backhair", "robe", "backrobe"];
            for (i in killList) {
                if (typeof(this.mcChar[killList[i]]) != undefined){
                    this.mcChar[killList[i]].visible = false;
                };
            };
        }

        public function loadArmor(sFile:String, sLink:String)
        {
            this.strSkinLinkage = sLink;
            //this.ldr.load(new URLRequest(((((this.serverFilePath + "classes/") + this.pAV.objLogin.chars[charindex].strGender) + "/") + strFilename)), new LoaderContext(false, ApplicationDomain.currentDomain));
			this.ldr.load(new URLRequest(((((this.serverFilePath + "classes/") + this.strGender) + "/") + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            this.ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadSkinComplete);
            this.ldr.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
        }

        private function onLoadSkinComplete(evt:Event)
        {
            var AssetClass:Class;
            var evt:Event = evt;
            //this.strGender = this.pAV.objData.strGender;
			this.strGender = this.strGender;
            try {
                AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "Head")) as Class);
                this.mcChar.head.removeChildAt(0);
                this.mcChar.head.addChildAt(new (AssetClass)(), 0);
            } catch(err:Error) {
                AssetClass = (getDefinitionByName(("mcHead" + strGender)) as Class);
                mcChar.head.removeChildAt(0);
                mcChar.head.addChildAt(new (AssetClass)(), 0);
            };
            AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "Chest")) as Class);
            this.mcChar.chest.removeChildAt(0);
            this.mcChar.chest.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "Hip")) as Class);
            this.mcChar.hip.removeChildAt(0);
            this.mcChar.hip.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "FootIdle")) as Class);
            this.mcChar.idlefoot.removeChildAt(0);
            this.mcChar.idlefoot.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "Foot")) as Class);
            this.mcChar.backfoot.removeChildAt(0);
            this.mcChar.backfoot.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "Shoulder")) as Class);
            this.mcChar.frontshoulder.removeChildAt(0);
            this.mcChar.frontshoulder.addChild(new (AssetClass)());
            this.mcChar.backshoulder.removeChildAt(0);
            this.mcChar.backshoulder.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "Hand")) as Class);
            this.mcChar.fronthand.removeChildAt(0);
            this.mcChar.fronthand.addChild(new (AssetClass)());
            this.mcChar.backhand.removeChildAt(0);
            this.mcChar.backhand.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "Thigh")) as Class);
            this.mcChar.frontthigh.removeChildAt(0);
            this.mcChar.frontthigh.addChild(new (AssetClass)());
            this.mcChar.backthigh.removeChildAt(0);
            this.mcChar.backthigh.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "Shin")) as Class);
            this.mcChar.frontshin.removeChildAt(0);
            this.mcChar.frontshin.addChild(new (AssetClass)());
            this.mcChar.backshin.removeChildAt(0);
            this.mcChar.backshin.addChild(new (AssetClass)());
            try {
                AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "Robe")) as Class);
                this.mcChar.robe.removeChildAt(0);
                this.mcChar.robe.addChild(new (AssetClass)());
                this.mcChar.robe.visible = true;
            } catch(err:Error) {
            };
            try {
                AssetClass = (getDefinitionByName(((this.strSkinLinkage + this.strGender) + "RobeBack")) as Class);
                this.mcChar.backrobe.removeChildAt(0);
                this.mcChar.backrobe.addChild(new (AssetClass)());
                this.mcChar.backrobe.visible = true;
            } catch(err:Error) {
            };
            this.addGlow(this.mcChar);
            visible = true;
        }

        private function ioErrorHandler(event:IOErrorEvent):void
        {
            trace(("ioErrorHandler: " + event));
        }

        public function loadHair(sFile:String, sLink:String):void
        {
			this.strHairLink = sLink;
            var ldr:* = new Loader();
            ldr.load(new URLRequest((this.serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onHairLoadComplete);
        }

        private function onHairLoadComplete(event:Event):void
        {
            var event:Event = event;
            var AssetClass:Class = event.target.loader.contentLoaderInfo.applicationDomain.getDefinition(((this.strHairLink + this.strGender) + "Hair"));
            this.mcChar.head.hair.removeChildAt(0);
            this.mcChar.head.hair.addChild(new (AssetClass)());
            try {
                AssetClass = (getDefinitionByName(((this.strHairLink + this.strGender) + "HairBack")) as Class);
                this.mcChar.backhair.removeChildAt(0);
                this.mcChar.backhair.addChild(new (AssetClass)());
                this.mcChar.backhair.visible = true;
            } catch(err:Error) {
                mcChar.backhair.visible = false;
            };
        }

        public function setColor(mc:MovieClip, strLocation:String, strShade:String):void
        {
            var intColor:Number = Number(pAV.objData[("intColor" + strLocation)]);
            mc.isColored = true;
            mc.intColor = intColor;
            mc.strLocation = strLocation;
            mc.strShade = strShade;
            changeColor(mc, intColor, strShade);
        }

        public function changeColor(mc:MovieClip, intColor:Number, strShade:String):void
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
            mc.transform.colorTransform = newCT;
        }

        private function addGlow(mc:MovieClip):void
        {
            if (this.noGlow){
                return;
            };
            var mcFilter:* = new GlowFilter(0xFFFFFF, 1, 8, 8, 2, 1, false, false);
            mc.filters = [mcFilter];
        }

        public function loadWeapon(sFile:String, sLink:String):void
        {
			this.strWeaponLink = sLink;
            var ldr:* = new Loader();
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadWeaponComplete);
            ldr.load(new URLRequest((this.serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
        }

        public function onLoadWeaponComplete(e:Event):void
        {
            var AssetClass:* = undefined;
            var e:Event = e;
            this.mcChar.weapon.removeChildAt(0);
            try {
                AssetClass = (getDefinitionByName(this.strWeaponLink) as Class);
                this.mcChar.weapon.addChild(new (AssetClass)());
            } catch(err:Error) {
                mcChar.weapon.addChild(e.target.content);
            };
        }

        public function loadWeaponOff(sFile:String, sLink:String):void
        {
			this.strWeaponLink = sLink;
            var ldr:* = new Loader();
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadWeaponOffComplete);
            ldr.load(new URLRequest((this.serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
        }

        public function onLoadWeaponOffComplete(e:Event):void
        {
            var AssetClass:* = undefined;
            var e:Event = e;
            this.mcChar.weaponOff.removeChildAt(0);
            try {
                AssetClass = (getDefinitionByName(this.strWeaponLink) as Class);
                this.mcChar.weaponOff.addChild(new (AssetClass)());
            } catch(err:Error) {
                mcChar.weaponOff.addChild(e.target.content);
            };
            this.mcChar.weaponOff.visible = true;
        }

        public function loadCape(sFile:String, sLink:String):void
        {
			this.strCapeLink = sLink;
            var ldr:* = new Loader();
            ldr.load(new URLRequest((this.serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadCapeComplete, false, 0, true);
        }

        public function onLoadCapeComplete(e:Event):void
        {
            var AssetClass:Class = (getDefinitionByName(this.strCapeLink) as Class);
            this.mcChar.cape.removeChildAt(0);
            this.mcChar.cape.cape = new (AssetClass)();
            this.mcChar.cape.addChild(this.mcChar.cape.cape);
            this.mcChar.cape.visible = true;
        }

        public function loadHelm(sFile:String, sLink:String):void
        {
			this.strHelmLink = sLink;
            var ldr:* = new Loader();
            ldr.load(new URLRequest((this.serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadHelmComplete, false, 0, true);
        }

        public function onLoadHelmComplete(e:Event):void
        {
            var AssetClass:Class = (getDefinitionByName(this.strHelmLink) as Class);
            this.mcChar.head.helm.removeChildAt(0);
            this.mcChar.head.helm.addChild(new (AssetClass)());
            this.mcChar.head.helm.visible = true;
            this.mcChar.head.hair.visible = false;
            this.mcChar.backhair.visible = false;
        }

        public function loadPet(sFile:String, sLink:String):void
        {
			this.strPetLink = sLink;
            var ldr:* = new Loader();
            ldr.load(new URLRequest((this.serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadPetComplete, false, 0, true);
        }

        function onLoadPetComplete(e:Event):void
        {
            var AssetClass:Class = (getDefinitionByName(this.strPetLink) as Class);
            var mc:* = new (AssetClass)();
            mc.x = -40;
            mc.y = 10;
			
            addChild(mc);
            this.addGlow(mc);
        }


    }
}//package 

