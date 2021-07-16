// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//AvatarMCCopier

package {
    import flash.display.MovieClip;
    import flash.display.DisplayObject;
    import flash.events.Event;

    public class AvatarMCCopier {

        private var world;
        private var rootClass;
        private var mcChar:MovieClip;
        private var objLinks:Object;
        private var pAV:Avatar;
        private var strGender:String;

        public function AvatarMCCopier(_arg1:MovieClip):void{
            this.objLinks = {};
            super();
            this.world = _arg1;
        }

        public function copyTo(_arg1:MovieClip):void{
            var _local3:*;
            var _local4:*;
            this.mcChar = _arg1;
            MovieClip(this.mcChar.parent).pAV = this.world.myAvatar;
            this.pAV = this.world.myAvatar;
            this.strGender = this.pAV.objData.strGender;
            var _local2:* = ["cape", "backhair", "robe", "backrobe"];
            for (_local3 in _local2) {
                if (typeof(this.mcChar[_local2[_local3]]) != undefined){
                    this.mcChar[_local2[_local3]].visible = false;
                };
            };
            if (((!(this.pAV.dataLeaf.showHelm)) || (((!(("he" in this.pAV.objData.eqp))) && ((this.pAV.objData.eqp.he == null)))))){
                this.onHairLoadComplete(null);
            };
            for (_local4 in this.world.myAvatar.objData.eqp) {
                switch (_local4){
                    case "Weapon":
                        this.world.queueLoad({
                            strFile:(this.world.rootClass.getFilePath() + this.pAV.objData.eqp[_local4].sFile),
                            callBackA:this.onLoadWeaponComplete
                        });
                        break;
                    case "he":
                        if (this.pAV.dataLeaf.showHelm){
                            this.onLoadHelmComplete(null);
                        };
                        break;
                    case "ba":
                        if (this.pAV.dataLeaf.showCloak){
                            this.onLoadCapeComplete(null);
                        };
                        break;
					case "am":
                            this.onLoadAccessoryComplete(null);
                        break;
                    case "ar":
                        if (this.world.myAvatar.objData.eqp.co == null){
                            this.objLinks.ar = this.pAV.objData.eqp.ar.sLink;
                            this.onLoadArmorComplete(null);
                        };
                        break;
                    case "co":
                        this.objLinks.ar = this.pAV.objData.eqp.co.sLink;
                        this.onLoadArmorComplete(null);
                        break;
                };
            };
        }

        public function loadArmorPieces(_arg1:String):void{
            var AssetClass:Class;
            var child:DisplayObject;
            var strSkinLinkage:String = _arg1;
            try {
                AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Head")) as Class);
                this.mcChar.head.addChildAt(new (AssetClass)(), 0);
                this.mcChar.head.removeChildAt(1);
            }
            catch(err:Error) {
                AssetClass = (world.getClass(("mcHead" + strGender)) as Class);
                mcChar.head.addChildAt(new (AssetClass)(), 0);
                mcChar.head.removeChildAt(1);
            };
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Chest")) as Class);
            this.mcChar.chest.removeChildAt(0);
            this.mcChar.chest.addChild(new (AssetClass)());
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Hip")) as Class);
            this.mcChar.hip.removeChildAt(0);
            this.mcChar.hip.addChild(new (AssetClass)());
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "FootIdle")) as Class);
            this.mcChar.idlefoot.removeChildAt(0);
            this.mcChar.idlefoot.addChild(new (AssetClass)());
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Foot")) as Class);
            this.mcChar.frontfoot.removeChildAt(0);
            this.mcChar.frontfoot.addChild(new (AssetClass)());
            this.mcChar.frontfoot.visible = false;
            this.mcChar.backfoot.removeChildAt(0);
            this.mcChar.backfoot.addChild(new (AssetClass)());
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Shoulder")) as Class);
            this.mcChar.frontshoulder.removeChildAt(0);
            this.mcChar.frontshoulder.addChild(new (AssetClass)());
            this.mcChar.backshoulder.removeChildAt(0);
            this.mcChar.backshoulder.addChild(new (AssetClass)());
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Hand")) as Class);
            this.mcChar.fronthand.removeChildAt(0);
            this.mcChar.fronthand.addChild(new (AssetClass)());
            this.mcChar.backhand.removeChildAt(0);
            this.mcChar.backhand.addChild(new (AssetClass)());
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Thigh")) as Class);
            this.mcChar.frontthigh.removeChildAt(0);
            this.mcChar.frontthigh.addChild(new (AssetClass)());
            this.mcChar.backthigh.removeChildAt(0);
            this.mcChar.backthigh.addChild(new (AssetClass)());
            AssetClass = (this.world.getClass(((strSkinLinkage + this.strGender) + "Shin")) as Class);
            this.mcChar.frontshin.removeChildAt(0);
            this.mcChar.frontshin.addChild(new (AssetClass)());
            this.mcChar.backshin.removeChildAt(0);
            this.mcChar.backshin.addChild(new (AssetClass)());
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
        }

        public function onLoadArmorComplete(_arg1:Event):void{
            this.loadArmorPieces(this.objLinks.ar);
        }

        public function onHairLoadComplete(_arg1:Event):void{
            var _local2:Class;
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
            }
            else {
                this.mcChar.backhair.visible = false;
            };
        }

        public function loadWeapon(_arg1, _arg2):void{
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
            this.mcChar.weapon.removeChildAt(0);
            try {
                AssetClass = (this.world.getClass(this.pAV.objData.eqp.Weapon.sLink) as Class);
                this.mcChar.weapon.addChild(new (AssetClass)());
            }
            catch(err:Error) {
                mcChar.weapon.addChild(e.target.content);
            };
            this.mcChar.weapon.visible = true;
            if (("eventTrigger" in MovieClip(this.world.map))){
                this.world.map.eventTrigger({cmd:"copyAvatarMCCompleted"});
            };
        }

        public function onLoadCapeComplete(_arg1:Event):void{
            var _local2:Class = (this.world.getClass(this.pAV.objData.eqp.ba.sLink) as Class);
            this.mcChar.cape.removeChildAt(0);
            this.mcChar.cape.cape = new (_local2)();
            this.mcChar.cape.addChild(this.mcChar.cape.cape);
            this.mcChar.cape.visible = true;
        }
		
		 public function onLoadAccessoryComplete(_arg1:Event):void{
            var _local2:Class = (this.world.getClass(this.pAV.objData.eqp.ba.sLink) as Class);
            this.mcChar.necklace.removeChildAt(0);
            this.mcChar.necklace.necklace = new (_local2)();
            this.mcChar.necklace.addChild(this.mcChar.necklace.necklace);
            this.mcChar.necklace.visible = true;
        }

        public function onLoadHelmComplete(_arg1:Event):void{
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
                        this.mcChar.backhair.visible = true;
                        this.mcChar.backhair.addChild(new (_local3)());
                    };
                }
                else {
                    this.mcChar.backhair.visible = ((this.mcChar.head.hair.visible) && (this.pAV.pMC.bBackHair));
                };
                this.mcChar.head.helm.addChild(new (_local2)());
            }
            else {
                this.world.rootClass.chatF.pushMsg("warning", "Could not resolve Helm definition.", "SERVER", "", 0);
            };
        }


    }
}//package 

