// Decompiled by AS3 Sorcerer 1.40
// http://www.as3sorcerer.com/

//Avatar

package {
    import flash.display.MovieClip;
    import flash.filters.GlowFilter;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    public class Avatar {

        public var rootClass;
        public var uid:int;
        public var pMC:MovieClip;
        public var pnm:String;
        public var objData:Object = null;
        public var dataLeaf:Object;
        public var guild:Object;
        public var npcType:String = "player";
        public var target = null;
        public var targets:Object;
        public var isMyAvatar:Boolean = false;
        public var friends:Array;
		public var playerkills:Array;
        public var classes:Array;
        public var factions:Array;
        public var bank:Array;
		public var vending:Array;
        public var iBankCount:int;
        public var items:Array;
        public var houseitems:Array;
        public var tempitems:Array;
        public var bitData:Boolean = false;
        public var strFrame:String = "";
        public var petMC:PetMC;
        public var sLinkPet:String = "";
        public var friendsLoaded:Boolean = false;
		public var playerkillsLoaded:Boolean = false;
        public var strProj:String = "";
        public var invLoaded:Boolean = false;
		public var onCasting:Boolean = false;
        private var loadCount:int = 0;
        private var firstLoad:Boolean = true;
        private var specialAnimation:Object;

        public function Avatar(_arg1:MovieClip){
            dataLeaf = {};
            guild = {};
            targets = {};
            friends = [];
            factions = [];
            tempitems = [];
			playerkills = [];
            specialAnimation = new Object();
            super();
            rootClass = _arg1;
        }

        public function initAvatar(_arg1:Object){
            var _local4:*;
            trace("** AVATAR initAvatar >");
            var _local2:* = rootClass.world;
            var _local3:* = _local2.uoTree[pnm.toLowerCase()];
            objData = _arg1.data;
            if (("intGold" in objData)){
                objData.intGold = Number(objData.intGold);
            };
            if (("intCoins" in objData)){
                objData.intCoins = Number(objData.intCoins);
            };
            if (("dUpgExp" in objData)){
                objData.dUpgExp = rootClass.stringToDate(objData.dUpgExp);
            };
            if (("dMutedTill" in objData)){
                objData.dMutedTill = rootClass.stringToDate(objData.dMutedTill);
            };
            if (("dCreated" in objData)){
                objData.dCreated = rootClass.stringToDate(objData.dCreated);
            };
            pMC.strGender = objData.strGender;
            updateRep();
            pMC.updateName();
            trace(("objData.iUpgDays: " + objData.iUpgDays));
			if (Number(_arg1.data.intAccessLevel) >= 2) //vip
            {
                this.pMC.pname.ti.textColor = 0xFFFF;
            };
            if (Number(_arg1.data.intAccessLevel) >= 40) //Mod
            {
                this.pMC.pname.ti.textColor = 16763955;
            };
            if (Number(_arg1.data.intAccessLevel) >= 60) //Admin
            {
                this.pMC.pname.ti.textColor = 16724787;
            };
            if (Number(_arg1.data.intAccessLevel) == 5 || Number(_arg1.data.intAccessLevel) == 6 || Number(_arg1.data.intAccessLevel) == 7) //Champs
            {
                this.pMC.pname.ti.textColor = 0xFF00FF;
            };
			//Custom Colored Names Begin Here
			if(String(objData.strUsername) == "Stacia")
			{
				pMC.pname.ti.textColor = 13369599;
			};
			/*
			if(String(objData.strUsername) == "Yoshino")
			{
				pMC.pname.ti.textColor = 16711935;
			};
			*/
            /*
			if (Number(_arg1.data.intAccessLevel) >= 40){
                pMC.pname.ti.textColor = 16763955;
                pMC.pname.filters = [new GlowFilter(0, 1, 3, 3, 64, 1)];
            }
            else {
                if (isUpgraded()){
                    pMC.pname.ti.textColor = 9229823;
                    pMC.pname.filters = [new GlowFilter(0, 1, 3, 3, 64, 1)];
                };
            };
			*/
            if (objData.guild != null){
				if(objData.guild.Color) {
					this.pMC.pname.tg.textColor = objData.guild.Color;
				}
                pMC.pname.tg.text = (("< " + String(objData.guild.Name)) + " >");
				switch (String(this.objData.guild.Name))
				{
                    case "Player Support Team":
						this.pMC.pname.tg.textColor = 0xFFFF00;
						this.pMC.pname.ti.textColor = 10092390;
                        break;
                };
            };
			/*
			if(String(objData.strUsername) == "Doffy")
			{
				pMC.pname.ti.visible = false;
				pMC.pname.kappa.visible = true;
				pMC.pname.kappa.ti.textColor = 6749952;//10040268////12632256//3342591
				pMC.pname.Married.visible = true;
			};
			if(String(objData.strUsername) == "Chriztine")
			{
				pMC.pname.ti.text = "?";
				//pMC.pname.ti.textColor = 16711935;
				pMC.pname.Ambassador.visible = false;
				pMC.pname.Staff.visible = true;
				pMC.pname.Married.visible = true;
				//pMC.pname.tg.text = "< Julia Barregos >";
			};
			if(String(objData.strUsername) == "rin")
			{
				pMC.pname.ti.text = "?";
			};
			*/
            pMC.ignore.visible = rootClass.chatF.isIgnored(_arg1.data.strUsername);
            trace(((("username: " + objData.strUsername) + " objData.eqp: ") + objData.eqp));
            if (objData.eqp != null){
                for (_local4 in objData.eqp) {
                    loadCount++;
                    loadMovieAtES(_local4, objData.eqp[_local4].sFile, objData.eqp[_local4].sLink);
                    updateItemAnimation(objData.eqp[_local4].sMeta);
                };
            };
            pMC.loadHair();
            bitData = true;
        }

        public function loadMovieAtES(_arg1, _arg2, _arg3):void{
            trace(("** AVATAR loadMovieAtES > " + _arg1));
            if (_arg1 != null){
                switch (_arg1){
                    case "Weapon":
                        pMC.loadWeapon(_arg2, _arg3);
						//pMC.StaciaWeaponOn = true;
                        return;
                    case "he":
                        pMC.loadHelm(_arg2, _arg3);
                        return;
                    case "ba":
                        pMC.loadCape(_arg2, _arg3);
                        return;
                    case "ar":
                        pMC.loadClass(_arg2, _arg3);
                        return;
                    case "co":
                        pMC.loadArmor(_arg2, _arg3);
                        return;
					case "am":
                        pMC.loadAccessory(_arg2, _arg3);
                        return;
                    case "pe":
                        loadPet();
                        return;
                };
            };
        }

        public function unloadMovieAtES(_arg1):void{
            trace("** AVATAR unloadMovieAtES >");
            if (_arg1 != null){
                switch (_arg1){
                    case "he":
                        pMC.mcChar.head.helm.visible = false;
                        pMC.mcChar.head.hair.visible = true;
                        pMC.mcChar.backhair.visible = pMC.bBackHair;
                        if (this == rootClass.world.myAvatar){
                            rootClass.showPortrait(this);
                        };
                        if (this == rootClass.world.myAvatar.target){
                            rootClass.showPortraitTarget(this);
                        };
                        return;
                    case "ba":
                        pMC.mcChar.cape.visible = false;
                        return;
                    case "pe":
						/*
						if (this == this.myAvatar.petMC){
							rootClass.ui.mcPetPortrait.visible = false;
						};
						*/
                        unloadPet();
                        return;
					case "am":
                        pMC.mcChar.necklace.visible = false;
                        return;
                    case "co":
                        pMC.loadClass(objData.eqp["ar"].sFile, objData.eqp["ar"].sLink);
                        return;
					case "Weapon":
						pMC.mcChar.weapon.visible = false;
						pMC.mcChar.weaponOff.visible = false;
						//pMC.StaciaWeaponOn = false;
						return;
                };
            };
        }

        public function loadPet():void{
            var _local1:*;
			var pItem:Object;
            if (((((((((rootClass.uoPref.bPet) && (!((objData == null))))) && (!((objData.eqp == null))))) && (!((objData.eqp["pe"] == null))))) && (rootClass.world.CHARS.contains(pMC)))){
                if (petMC == null){
                    petMC = new PetMC();
                    petMC.mouseEnabled = (petMC.mouseChildren = false);
                    petMC.WORLD = rootClass.world;
                    petMC.pAV = this;
                };
                _local1 = new Loader();
                _local1.load(new URLRequest((rootClass.getFilePath() + objData.eqp["pe"].sFile)), rootClass.world.loaderC);
                _local1.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadPetComplete, false, 0, true);
                _local1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadPetError, false, 0, true);
				
				if (rootClass.world.myAvatar.getItemByEquipSlot("pe") != null){
					rootClass.showPetBox(objData.eqp["pe"].sFile, objData.eqp["pe"].sLink);
					rootClass.ui.mcPetPortrait.strName.text = objData.eqp["pe"].sName;
					rootClass.ui.mcPetPortrait.strLevel.text = objData.eqp["pe"].Level;
					rootClass.ui.mcPetPortrait.XPBar.mcRep.scaleY = (objData.eqp["pe"].iQty / objData.eqp["pe"].PetExpToLevel);
				};
            };
        }

        private function onLoadPetError(_arg1:Event):void{
            trace("Loading Pet.. Failed!");
            unloadPet();
        }

        public function onLoadPetComplete(_arg1:Event):void{
            var _local2:Class;
            try {
                _local2 = (rootClass.world.loaderD.getDefinition(objData.eqp["pe"].sLink) as Class);
                petMC.removeChildAt(1);
                petMC.mcChar = MovieClip(petMC.addChildAt(new (_local2)(), 1));
                petMC.mcChar.name = "mc";
            }
            catch(e:Error) {
            };
            if (rootClass.world.uoTree[objData.strUsername.toLowerCase()].strFrame == rootClass.world.strFrame){
                if ((((petMC.stage == null)) && ((petMC.getChildByName("defaultmc") == null)))){
                    MovieClip(rootClass.world.CHARS.addChild(petMC)).name = ("pet_" + uid);
                };
                petMC.scale(pMC.mcChar.scaleY);
                petMC.x = (pMC.x - 20);
                petMC.y = (pMC.y + 5);
            };
        }

        public function unloadPet():void{
            if (petMC != null){
                if (petMC.stage != null){
                    rootClass.world.CHARS.removeChild(petMC);
                };
                petMC = null;
            };
        }

        public function showMC():void{
            if (pMC != null){
                if (rootClass.world.TRASH.contains(pMC)){
                    rootClass.world.CHARS.addChild(rootClass.world.TRASH.removeChild(pMC));
                }
                else {
                    rootClass.world.CHARS.addChild(pMC);
                };
                showPetMC();
            };
        }

        public function hideMC():void{
            if (pMC != null){
                if (rootClass.world.CHARS.contains(pMC)){
                    rootClass.world.TRASH.addChild(rootClass.world.CHARS.removeChild(pMC));
                }
                else {
                    rootClass.world.TRASH.addChild(pMC);
                };
                hidePetMC();
            };
        }

        public function showPetMC():void{
            if (petMC == null){
                loadPet();
            } else {
                if ((((petMC.stage == null)) && ((petMC.getChildByName("defaultmc") == null)))){
                    rootClass.world.CHARS.addChild(petMC);
                    petMC.scale(pMC.mcChar.scaleY);
                    petMC.x = (pMC.x - 20);
                    petMC.y = (pMC.y + 5);
                };
            };
        }
	
        public function hidePetMC():void{
            if (((!((petMC == null))) && (!((petMC.stage == null))))){
                rootClass.world.CHARS.removeChild(petMC);
            };
        }

        public function initFactions(_arg1:Array):void{
            var _local2:int;
            if (_arg1 == null){
                factions = [];
            }
            else {
                factions = _arg1;
                _local2 = 0;
                while (_local2 < factions.length) {
                    initFaction(factions[_local2]);
                    _local2++;
                };
            };
        }

        public function addFaction(_arg1:Object):void{
            if (((!((_arg1 == null))) && (!((factions == null))))){
                factions.push(_arg1);
                initFaction(_arg1);
            };
        }

        public function addRep(_arg1:int, _arg2:int, _arg3:int=0):void{
            var _local5:int;
            var _local6:String;
            var _local4:* = getFaction(_arg1);
            if (_local4 != null){
                _local5 = _local4.iRank;
                _local4.iRep = (_local4.iRep + _arg2);
                initFaction(_local4);
                if (_local4.iRank > _local5){
                    rankUp(_local4.sName, _local4.iRank);
                    rootClass.FB_showFeedDialog("Rank Up!", (((("reached Rank " + _local4.iRank) + " for ") + _local4.sName) + " Reputation in AQWorlds!"), "aqw-rankup.jpg");
                };
                _local6 = "";
                if (_arg3 > 0){
                    _local6 = ((" + " + _arg3) + "(Bonus)");
                };
                rootClass.chatF.pushMsg("server", ((((("Reputation for " + _local4.sName) + " increased by ") + (_arg2 - _arg3)) + _local6) + "."), "SERVER", "", 0);
            };
        }

        public function initFaction(_arg1):void{
            _arg1.iRep = int(_arg1.iRep);
            _arg1.iRank = rootClass.getRankFromPoints(_arg1.iRep);
            _arg1.iRepToRank = 0;
            if (_arg1.iRank < rootClass.iRankMax){
                _arg1.iRepToRank = (rootClass.arrRanks[_arg1.iRank] - rootClass.arrRanks[(_arg1.iRank - 1)]);
            };
            _arg1.iSpillRep = (_arg1.iRep - rootClass.arrRanks[(_arg1.iRank - 1)]);
        }

        public function getRep(_arg1:Object):int{
            var _local2:* = getFaction(_arg1);
            return ((((_local2)==null) ? 0 : _local2.iRep));
        }

        public function getFaction(_arg1:Object):Object{
            return (((isNaN(Number(_arg1))) ? getFactionByName(String(_arg1)) : getFactionByID(int(_arg1))));
        }

        private function getFactionByID(_arg1:int):Object{
            var _local2:int;
            while (_local2 < factions.length) {
                if (factions[_local2].FactionID == _arg1){
                    return (factions[_local2]);
                };
                _local2++;
            };
            return (null);
        }

        private function getFactionByName(_arg1:String):Object{
            var _local2:int;
            while (_local2 < factions.length) {
                if (factions[_local2].sName == _arg1){
                    return (factions[_local2]);
                };
                _local2++;
            };
            return (null);
        }

        public function initFriendsList(_arg1:Array):void{
            if (_arg1 != null){
                friends = _arg1;
            };
        }
		
		public function initPlayerkillsList(_arg1:Array):void{
            if (_arg1 != null){
                playerkills = _arg1;
            };
        }

        public function addFriend(_arg1:Object):void{
            if (_arg1 != null){
                friends.push(_arg1);
                if (rootClass.ui.mcOFrame.currentLabel == "Idle"){
                    rootClass.ui.mcOFrame.update();
                };
            };
        }

        public function updateFriend(_arg1:Object):void{
            var _local2:int;
            if (_arg1 != null){
                _local2 = 0;
                while (_local2 < friends.length) {
                    if (friends[_local2].ID == _arg1.ID){
                        friends[_local2] = _arg1;
                        break;
                    };
                    _local2++;
                };
                if (rootClass.ui.mcOFrame.currentLabel == "Idle"){
                    rootClass.ui.mcOFrame.update();
                };
            };
        }

        public function deleteFriend(_arg1:int):void{
            var _local2:int;
            while (_local2 < friends.length) {
                if (friends[_local2].ID == _arg1){
                    friends.splice(_local2, 1);
                    break;
                };
                _local2++;
            };
            if (rootClass.ui.mcOFrame.currentLabel == "Idle"){
                rootClass.ui.mcOFrame.update();
            };
        }

        public function isFriend(_arg1:int):Boolean{
            var _local2:* = 0;
            while (_local2 < friends.length) {
                if (friends[_local2].ID == _arg1){
                    return (true);
                };
                _local2++;
            };
            return (false);
        }

        public function isFriendName(_arg1:String):Boolean{
            var _local2:* = 0;
            while (_local2 < friends.length) {
                if (friends[_local2].sName.toLowerCase() == _arg1.toLowerCase()){
                    return (true);
                };
                _local2++;
            };
            return (false);
        }
		
		public function isPlayerKill(_arg1:int):Boolean{
            var _local2:* = 0;
            while (_local2 < playerkills.length) {
                if (playerkills[_local2].ID == _arg1){
                    return (true);
                };
                _local2++;
            };
            return (false);
        }

        public function isPlayerKillName(_arg1:String):Boolean{
            var _local2:* = 0;
            while (_local2 < friends.length) {
                if (playerkills[_local2].sName.toLowerCase() == _arg1.toLowerCase()){
                    return (true);
                };
                _local2++;
            };
            return (false);
        }

        function initGuild(_arg1:Object):void{
            guild = _arg1;
            if (_arg1 != null){
                pMC.pname.tg.text = (("< " + String(_arg1.Name)) + " >");
                rootClass.chatF.chn.guild.act = 1;
                objData.guild = _arg1;
            };
        }

        public function updateGuild(_arg1:Object):void{
            objData.guild = _arg1;
            if (objData.guild != null){
                pMC.pname.tg.text = (("< " + String(objData.guild.Name)) + " >");
            }
            else {
                pMC.pname.tg.text = "";
            };
        }

        public function initInventory(_arg1:Array):void{
            var _local2:*;
            trace("** AVATAR initInventory >");
            if (_arg1 == null){
                items = [];
            }
            else {
                items = _arg1;
                _local2 = 0;
                while (_local2 < items.length) {
                    items[_local2].iQty = int(items[_local2].iQty);
                    rootClass.world.invTree[items[_local2].ItemID] = items[_local2];
                    _local2++;
                };
            };
        }

        public function cleanInventory():void{
            var _local2:*;
            var _local1:* = 0;
            while (_local1 < items.length) {
                _local2 = items[_local1];
                if (_local2.iQty == null){
                    _local2.iQty = 1;
                };
                _local1++;
            };
        }

        public function initBank(_arg1:Array):void{
            var _local2:int;
            if (_arg1 == null){
                bank = [];
            }
            else {
                bank = _arg1;
                _local2 = 0;
                while (_local2 < bank.length) {
                    if (bank[_local2].bCoins == 0){
                        iBankCount++;
                    };
                    bank[_local2].iQty = int(bank[_local2].iQty);
                    _local2++;
                };
            };
        }
		
        public function tradeFromInv(_arg1:int, _arg2:int, _arg3:int):void{
            var _local2:int;
			var test:int;			
            while (_local2 < items.length) {
                if (items[_local2].ItemID == _arg1){
				    var initItem:Object = rootClass.copyObj(items[_local2]);
					var test2:* = rootClass.copyObj(items.splice(_local2, 1));
					var _local4:int;
					while (_local4 < test2.length) {
					    if (test2[_local4].ItemID == _arg1) {
						    test2[_local4].iQty = _arg3;
							trace(" Quantity Set: " + _arg3);
						}
					    _local4++;
					}
					
				    rootClass.world.addItemsToTradeA(test2);		
					
					initItem.iQty -= _arg3;
					if (initItem.iQty > 0) {
					    trace("Quantity item: " + initItem.iQty);
					    rootClass.world.invTree[_arg1].iQty = initItem.iQty;
					    items.push(rootClass.world.invTree[_arg1]);
					} else {
					    rootClass.world.invTree[_arg1].iQty = 0;
					}					
                    return;
                };
                _local2++;
            };
        }
		
        public function tradeToInvReset():void{
            var _local3:*;
            var _local2:int;            
			var test:*;
            while (_local2 < rootClass.world.tradeinfo.itemsA.length) {
                _local3 = rootClass.world.tradeinfo.itemsA[_local2];
				trace("Offer Item: " + _local3.ItemID);
				if (isItemInInventory(_local3.ItemID)) {
				    trace("Found");
				    _local3.iQty += rootClass.world.invTree[_local3.ItemID].iQty;
					var _local4:int;
					while (_local4 < items.length) {
                        if (items[_local4].ItemID == _local3.ItemID) {
						    items[_local4].iQty = _local3.iQty;
							trace("Updated existing: " + _local3.ItemID);
							break;
						}
						_local4++;
					}
				} else {
				    trace("Adding back item: " + _local3.ItemID);
                    items.push(_local3);		
                }
					
                rootClass.world.invTree[_local3.ItemID] = _local3;
                _local2++;
            };
        }
		
		public function vendingReset():void{
			rootClass.world.vendinginfo.items.splice(0);
			rootClass.world.vendingshopinfo.items.splice(0);
			//rootClass.auctionTabs.fRefresh({filter:'*'});
        }
		
        public function auctionReset():void{
			rootClass.world.auctioninfo.items.splice(0);
			rootClass.auctionTabs.fRefresh({filter:'*'});
        }
		
        public function retrieveReset():void{
			rootClass.world.retrieveinfo.items.splice(0);
			rootClass.auctionTabs.fRefresh({test:''});
        }
		
        public function removeRetrieve(AuctionId:int):void{
            var _local3:*;
            var _local2:int;            
			var test:*;
            while (_local2 < rootClass.world.retrieveinfo.items.length) {
                if (rootClass.world.retrieveinfo.items[_local2].AuctionID == AuctionId){
                    _local3 = rootClass.world.retrieveinfo.items[_local2];
					test = rootClass.world.retrieveinfo.items.splice(_local2, 1)[0];
                    return;
                };
                _local2++;
            };
        }
		
        public function auctionToInv(AuctionId:int, itemId:int):void{
            var _local3:*;
            var _local2:int;            
			var test:*;
            while (_local2 < rootClass.world.auctioninfo.items.length) {
                if (rootClass.world.auctioninfo.items[_local2].AuctionID == AuctionId){
                    _local3 = rootClass.world.auctioninfo.items[_local2];
					test = rootClass.world.auctioninfo.items.splice(_local2, 1)[0];
					if (isItemInInventory(itemId)) {
					    trace("Found");
					    _local3.iQty += rootClass.world.invTree[itemId].iQty;
						var _local4:int;
						while (_local4 < items.length) {
                            if (items[_local4].ItemID == itemId) {
							    items[_local4].iQty = _local3.iQty;
								trace("Updated existing");
								break;
							}
							_local4++;
						}
					} else {
                        items.push(test);		
                    }
					
                    rootClass.world.invTree[itemId] = _local3;
                    return;
                };
                _local2++;
            };
        }

        public function tradeToInvA(_arg1:int):void{
            var _local3:*;
            var _local2:int;            
			var test:*;
            while (_local2 < rootClass.world.tradeinfo.itemsA.length) {
                if (rootClass.world.tradeinfo.itemsA[_local2].ItemID == _arg1){
                    _local3 = rootClass.world.tradeinfo.itemsA[_local2];
					test = rootClass.world.tradeinfo.itemsA.splice(_local2, 1)[0];
					if (isItemInInventory(_arg1)) {
					    trace("Found");
					    _local3.iQty += rootClass.world.invTree[_arg1].iQty;
						var _local4:int;
						while (_local4 < items.length) {
                            if (items[_local4].ItemID == _arg1) {
							    items[_local4].iQty = _local3.iQty;
								trace("Updated existing");
								break;
							}
							_local4++;
						}
					} else {
                        items.push(test);		
                    }
					
                    rootClass.world.invTree[_arg1] = _local3;
                    return;
                };
                _local2++;
            };
        }
		
        public function tradeToInvB(_arg1:int):void{
            var _local2:int;
            while (_local2 < rootClass.world.tradeinfo.itemsB.length) {
                if (rootClass.world.tradeinfo.itemsB[_local2].ItemID == _arg1){
                    rootClass.world.tradeinfo.itemsB.splice(_local2, 1)[0];
                    return;
                };
                _local2++;
            };
        }
		
        public function tradeSwapInv(_arg1:int, _arg2:int):void{
            var _local3:Object;
            var _local4:Object;
            var _local5:int;
            _local5 = 0;
            while (_local5 < items.length) {
                if (items[_local5].ItemID == _arg1){
                    _local4 = items.splice(_local5, 1)[0];
                    break;
                };
                _local5++;
            };
            _local5 = 0;
            while (_local5 < rootClass.world.tradeinfo.itemsA.length) {
                if (rootClass.world.tradeinfo.itemsA[_local5].ItemID == _arg2){
                    _local3 = rootClass.world.tradeinfo.itemsA.splice(_local5, 1)[0];
                    break;
                };
                _local5++;
            };
            if (((!((_local3 == null))) && (!((_local4 == null))))){
                rootClass.world.tradeinfo.itemsA.push(rootClass.copyObj(_local4));
                rootClass.world.invTree[_arg1].iQty = 0;
                items.push(_local3);
                rootClass.world.invTree[_arg2] = _local3;
            };
        }
		
		public function vendingFromInv(_arg1:int):void{
            var _local3:*;
            var _local2:int;            
			var test:*;
            while (_local2 < rootClass.world.vendinginfo.items.length) {
                if (rootClass.world.vendinginfo.items[_local2].ItemID == _arg1){
                    _local3 = rootClass.world.vendinginfo.items[_local2];
					test = rootClass.world.vendinginfo.items.splice(_local2, 1)[0];
					if (isItemInInventory(_arg1)) {
					    trace("Found");
					    _local3.iQty += rootClass.world.invTree[_arg1].iQty;
						var _local4:int;
						while (_local4 < items.length) {
                            if (items[_local4].ItemID == _arg1) {
							    items[_local4].iQty = _local3.iQty;
								trace("Updated existing");
								break;
							}
							_local4++;
						}
					} else {
                        items.push(test);		
                    }
					
                    rootClass.world.invTree[_arg1] = _local3;
                    return;
                };
                _local2++;
            };
        }
		
		public function vendingToInv(VendingId:int, itemId:int):void{
            var _local3:*;
            var _local2:int;            
			var test:*;
			
            while (_local2 < rootClass.world.vendinginfo.items.length) {
                if (rootClass.world.vendinginfo.items[_local2].VendingID == VendingId){
                    _local3 = rootClass.world.vendinginfo.items[_local2];
					test = rootClass.world.vendinginfo.items.splice(_local2, 1)[0];
					if (isItemInInventory(itemId)) {
					    trace("Found");
					    _local3.iQty += rootClass.world.invTree[itemId].iQty;
						var _local4:int;
						while (_local4 < items.length) {
							rootClass.chatF.pushMsg("warning", "Quantity: " + _local3.iQty, "SERVER", "", 0);
                            if (items[_local4].ItemID == itemId) {
							    items[_local4].iQty = _local3.iQty;
								trace("Updated existing");
								break;
							}
							_local4++;
						}
					} else {
                        items.push(test);	
                    }
                    rootClass.world.invTree[itemId] = _local3;
                    return;
                };
                _local2++;
            };
        }

		
		public function vendingShopToInv(VendingId:int, itemId:int):void{
            var _local3:*;
            var _local2:int;            
			var test:*;
			
            while (_local2 < rootClass.world.vendingshopinfo.items.length) {
                if (rootClass.world.vendingshopinfo.items[_local2].VendingID == VendingId){
                    _local3 = rootClass.world.vendingshopinfo.items[_local2];
					test = rootClass.world.vendingshopinfo.items.splice(_local2, 1)[0];
					if (isItemInInventory(itemId)) {
					    trace("Found");
					    _local3.iQty += rootClass.world.invTree[itemId].iQty;
						var _local4:int;
						while (_local4 < items.length) {
                            if (items[_local4].ItemID == itemId) {
							    items[_local4].iQty = _local3.iQty;
								trace("Updated existing");
								break;
							}
							_local4++;
						}
					} else {
                        items.push(test);	
                    }
                    rootClass.world.invTree[itemId] = _local3;
					//rootClass.chatF.pushMsg("server", ("ULOL CARLO BOBO 9"), "SERVER", "", 0);
                    return;
                };
                _local2++;
            };
        }

		public function vendingSwapInv(_arg1:int, _arg2:int):void{
            var _local3:Object;
            var _local4:Object;
            var _local5:int;
            _local5 = 0;
            while (_local5 < items.length) {
                if (items[_local5].ItemID == _arg1){
                    _local4 = items.splice(_local5, 1)[0];
                    break;
                };
                _local5++;
            };
            _local5 = 0;
            while (_local5 < rootClass.world.vendinginfo.items.length) {
                if (rootClass.world.vendinginfo.items[_local5].ItemID == _arg2){
                    _local3 = rootClass.world.vendinginfo.items.splice(_local5, 1)[0];
                    break;
                };
                _local5++;
            };
            if (((!((_local3 == null))) && (!((_local4 == null))))){
                rootClass.world.vendinginfo.items.push(rootClass.copyObj(_local4));
                /*if (_local4.bCoins == 0){
                    iBankCount++;
                };*/
                rootClass.world.invTree[_arg1].iQty = 0;
                items.push(_local3);
                /*if (_local3.bCoins == 0){
                    iBankCount--;
                };*/
                rootClass.world.invTree[_arg2] = _local3;
            };
        }
		
        public function bankFromInv(_arg1:int):void{
            var _local2:int;
            while (_local2 < items.length) {
                if (items[_local2].ItemID == _arg1){
                    if (items[_local2].bCoins == 0){
                        iBankCount++;
                    };
                    rootClass.world.addItemsToBank(rootClass.copyObj(items.splice(_local2, 1)));
                    rootClass.world.invTree[_arg1].iQty = 0;
                    return;
                };
                _local2++;
            };
        }

        public function bankToInv(_arg1:int):void{
            var _local3:*;
            var _local2:int;
            while (_local2 < rootClass.world.bankinfo.items.length) {
                if (rootClass.world.bankinfo.items[_local2].ItemID == _arg1){
                    _local3 = rootClass.world.bankinfo.items[_local2];
                    if (_local3.bCoins == 0){
                        iBankCount--;
                    };
                    items.push(rootClass.world.bankinfo.items.splice(_local2, 1)[0]);
                    rootClass.world.invTree[_arg1] = _local3;
                    return;
                };
                _local2++;
            };
        }

        public function bankSwapInv(_arg1:int, _arg2:int):void{
            var _local3:Object;
            var _local4:Object;
            var _local5:int;
            _local5 = 0;
            while (_local5 < items.length) {
                if (items[_local5].ItemID == _arg1){
                    _local4 = items.splice(_local5, 1)[0];
                    break;
                };
                _local5++;
            };
            _local5 = 0;
            while (_local5 < rootClass.world.bankinfo.items.length) {
                if (rootClass.world.bankinfo.items[_local5].ItemID == _arg2){
                    _local3 = rootClass.world.bankinfo.items.splice(_local5, 1)[0];
                    break;
                };
                _local5++;
            };
            if (((!((_local3 == null))) && (!((_local4 == null))))){
                rootClass.world.bankinfo.items.push(rootClass.copyObj(_local4));
                if (_local4.bCoins == 0){
                    iBankCount++;
                };
                rootClass.world.invTree[_arg1].iQty = 0;
                items.push(_local3);
                if (_local3.bCoins == 0){
                    iBankCount--;
                };
                rootClass.world.invTree[_arg2] = _local3;
            };
        }

        public function removeItem(_arg1:int, _arg2:int=1):void{
            var _local3:Object = {};
            var _local4:int;
            while (_local4 < items.length) {
                _local3 = items[_local4];
                if (_local3.CharItemID == _arg1){
                    if ((((_local3.sES == "ar")) || (((_local3.iQty - _arg2) < 1)))){
                        _local3.iQty = 0;
                        rootClass.resetInvTreeByItemID(_local3.ItemID);
                        items.splice(_local4, 1);
                    }
                    else {
                        _local3.iQty = (_local3.iQty - _arg2);
                    };
                    return;
                };
                _local4++;
            };
            var _local5:int;
            while (_local5 < houseitems.length) {
                if (houseitems[_local5].CharItemID == _arg1){
                    if (houseitems[_local5].iQty > 1){
                        houseitems[_local5].iQty--;
                    }
                    else {
                        houseitems[_local5].iQty = 0;
                        houseitems.splice(_local5, 1);
                    };
                    return;
                };
                _local5++;
            };
        }

        public function removeItemByID(_arg1:int, _arg2:int=1):void{
            var _local3:int;
            while (_local3 < items.length) {
                if (items[_local3].ItemID == _arg1){
                    if ((((items[_local3].sES == "ar")) || ((items[_local3].iQty <= _arg2)))){
                        items[_local3].iQty = 0;
                        items.splice(_local3, 1);
                    }
                    else {
					    trace("Initial qty: " + items[_local3].iQty);
                        items[_local3].iQty = (items[_local3].iQty - _arg2);
						trace("After qty: " + items[_local3].iQty);
                    };
                    return;
                };
                _local3++;
            };
        }

        public function addItem(_arg1:Object):void{
            var _local2:Array;
            if (Boolean(_arg1.bBank)){
                addToBank(_arg1);
                return;
            };
            _local2 = (((_arg1.bHouse)==1) ? houseitems : items);
            var _local3:int;
            while (_local3 < _local2.length) {
                if (_local2[_local3].ItemID == _arg1.ItemID){
                    _local2[_local3].iQty = (_local2[_local3].iQty + int(_arg1.iQty));
                    return;
                };
                _local3++;
            };
            _arg1.iQty = int(_arg1.iQty);
            rootClass.world.invTree[_arg1.ItemID] = _arg1;
            _local2.push(_arg1);
        }

        public function addToBank(_arg1):void{
            if ((((bank == null)) || ((bank.length == 0)))){
                return;
            };
            var _local2:int;
            while (_local2 < bank.length) {
                if (bank[_local2].ItemID == _arg1.ItemID){
                    bank[_local2].iQty = (bank[_local2].iQty + int(_arg1.iQty));
                    return;
                };
                _local2++;
            };
        }

        public function varVal(_arg1:String){
            var _local2:* = MovieClip(pMC.mcChar.stage.getChildAt(0));
            var _local3:* = _local2.world;
            return (_local2.sfc.getRoom(_local3.curRoom).getUser(uid).getVariable(_arg1));
        }

        public function getItemByID(_arg1:int):Object{
            var _local2:int;
            while (_local2 < items.length) {
                if (items[_local2].ItemID == _arg1){
                    return (items[_local2]);
                };
                _local2++;
            };
            var _local3:int;
            while (_local3 < houseitems.length) {
                if (houseitems[_local3].ItemID == _arg1){
                    return (houseitems[_local3]);
                };
                _local3++;
            };
            var _local4:int;
            while (_local4 < tempitems.length) {
                if (tempitems[_local4].ItemID == _arg1){
                    return (tempitems[_local4]);
                };
                _local4++;
            };
            return (null);
        }

        public function getItemIDByName(_arg1:String):int{
            var _local2:int;
            while (_local2 < items.length) {
                if (items[_local2].sName == _arg1){
                    return (items[_local2].ItemID);
                };
                _local2++;
            };
            var _local3:int;
            while (_local3 < houseitems.length) {
                if (houseitems[_local3].sName == _arg1){
                    return (houseitems[_local3].ItemID);
                };
                _local3++;
            };
            var _local4:int;
            while (_local4 < tempitems.length) {
                if (tempitems[_local4].sName == _arg1){
                    return (tempitems[_local4].ItemID);
                };
                _local4++;
            };
            return (-1);
        }

        public function isItemInBank(_arg1:Number):Boolean{
            var _local2:int;
            if (bank != null){
                _local2 = 0;
                while (_local2 < bank.length) {
                    if (bank[_local2].ItemID == _arg1){
                        return (true);
                    };
                    _local2++;
                };
            };
            return (false);
        }
		
		public function isItemInVending(_arg1:Number):Boolean{
            var _local2:int;
            if (bank != null){
                _local2 = 0;
                while (_local2 < bank.length) {
                    if (bank[_local2].ItemID == _arg1){
                        return (true);
                    };
                    _local2++;
                };
            };
            return (false);
        }

        public function isItemInInventory(_arg1:Object):Boolean{
            var _local3:int;
            var _local4:int;
            var _local2:int = ((isNaN(Number(_arg1))) ? getItemIDByName(String(_arg1)) : int(_arg1));
            if (_local2 > 0){
                _local3 = 0;
                while (_local3 < items.length) {
                    if (items[_local3].ItemID == _local2){
                        return (true);
                    };
                    _local3++;
                };
                _local4 = 0;
                while (_local4 < houseitems.length) {
                    if (houseitems[_local4].ItemID == _local2){
                        return (true);
                    };
                    _local4++;
                };
            };
            return (false);
        }

        public function isItemStackMaxed(_arg1:Number):Boolean{
            var _local2:int;
            if (bank != null){
                _local2 = 0;
                while (_local2 < bank.length) {
                    if ((((bank[_local2].ItemID == _arg1)) && ((bank[_local2].iQty >= bank[_local2].iStk)))){
                        return (true);
                    };
                    _local2++;
                };
            };
            if (items != null){
                _local2 = 0;
                while (_local2 < items.length) {
                    if ((((items[_local2].ItemID == _arg1)) && ((items[_local2].iQty >= items[_local2].iStk)))){
                        return (true);
                    };
                    _local2++;
                };
            };
            if (houseitems != null){
                _local2 = 0;
                while (_local2 < houseitems.length) {
                    if ((((houseitems[_local2].ItemID == _arg1)) && ((houseitems[_local2].iQty >= houseitems[_local2].iStk)))){
                        return (true);
                    };
                    _local2++;
                };
            };
            return (false);
        }

        public function addTempItem(_arg1:Object):void{
            var _local2:int;
            while (_local2 < tempitems.length) {
                if (tempitems[_local2].ItemID == _arg1.ItemID){
                    tempitems[_local2].iQty = (tempitems[_local2].iQty + int(_arg1.iQty));
                    return;
                };
                _local2++;
            };
            tempitems.push(_arg1);
            rootClass.world.invTree[_arg1.ItemID] = _arg1;
        }

        public function removeTempItem(_arg1:int, _arg2:int):void{
            var _local3:int;
            while (_local3 < tempitems.length) {
                if (tempitems[_local3].ItemID == _arg1){
                    if (tempitems[_local3].iQty > _arg2){
                        tempitems[_local3].iQty = (tempitems[_local3].iQty - _arg2);
                    }
                    else {
                        tempitems[_local3].iQty = 0;
                        tempitems.splice(_local3, 1);
                    };
                    return;
                };
                _local3++;
            };
        }

        public function checkTempItem(_arg1:int, _arg2:int):Boolean{
            var _local3:int;
            while (_local3 < tempitems.length) {
                if ((((tempitems[_local3].ItemID == _arg1)) && ((tempitems[_local3].iQty >= _arg2)))){
                    return (true);
                };
                _local3++;
            };
            return (false);
        }

        public function getTempItemQty(_arg1:int):int{
            var _local2:int;
            while (_local2 < tempitems.length) {
                if (tempitems[_local2].ItemID == _arg1){
                    return (tempitems[_local2].iQty);
                };
                _local2++;
            };
            return (-1);
        }

        public function unequipItemAtES(_arg1:String):void{
            var _local2:int;
            _local2 = 0;
            while (_local2 < items.length) {
                if (items[_local2].sES == _arg1){
                    items[_local2].bEquip = 0;
                    removeItemAnimation(items[_local2].sMeta);
                };
                _local2++;
            };
            _local2 = 0;
            while (_local2 < tempitems.length) {
                if (tempitems[_local2].sES == _arg1){
                    tempitems[_local2].bEquip = 0;
                };
                _local2++;
            };
        }

        public function equipItem(_arg1:int):void{
            var _local2:int;
            rootClass.world.afkPostpone();
            if (((!((items == null))) && ((items.length > 0)))){
                _local2 = 0;
				//rootClass.chatF.pushMsg("server", ("ASD"), "SERVER", "", 0);
                while (_local2 < items.length) {
					//rootClass.chatF.pushMsg("server", ("ASD " + items.length), "SERVER", "", 0);
                    if (items[_local2].ItemID == _arg1){
						//rootClass.chatF.pushMsg("server", ("ASD " + _arg1), "SERVER", "", 0);
                        trace(("item found: " + items[_local2].ItemID));
                        unequipItemAtES(items[_local2].sES);
						//rootClass.chatF.pushMsg("server", ("ASD " + items[_local2].sES), "SERVER", "", 0);
                        items[_local2].bEquip = 1;
						//rootClass.chatF.pushMsg("server", ("ASD " + items[_local2].bEquip), "SERVER", "", 0);
                        updateItemAnimation(items[_local2].sMeta);
						//rootClass.chatF.pushMsg("server", ("DONE " + items[_local2].bEquip), "SERVER", "", 0);
                        return;
                    };
                    _local2++;
                };
            };
            if (((!((tempitems == null))) && ((tempitems.length > 0)))){
                _local2 = 0;
                while (_local2 < tempitems.length) {
                    if (tempitems[_local2].ItemID == _arg1){
                        unequipItemAtES(tempitems[_local2].sES);
                        tempitems[_local2].bEquip = 1;
                        return;
                    };
                    _local2++;
                };
            };
        }

        public function unequipItem(_arg1:int):void{
            var _local2:int;
            trace("unequip called");
            if (((!((items == null))) && ((items.length > 0)))){
                _local2 = 0;
                while (_local2 < items.length) {
                    if (items[_local2].ItemID == _arg1){
                        items[_local2].bEquip = 0;
                        removeItemAnimation(items[_local2].sMeta);
                        return;
                    };
                    _local2++;
                };
            };
            if (((!((tempitems == null))) && ((tempitems.length > 0)))){
                _local2 = 0;
                while (_local2 < tempitems.length) {
                    if (tempitems[_local2].ItemID == _arg1){
                        tempitems[_local2].bEquip = 0;
                        return;
                    };
                    _local2++;
                };
            };
        }

        public function checkItemAnimation():void{
            var _local1:uint;
            while (_local1 < items.length) {
                if (items[_local1].bEquip == 1){
                    updateItemAnimation(items[_local1].sMeta);
                };
                _local1++;
            };
        }

        private function updateItemAnimation(_arg1:String):void{
            var _local5:Array;
            if (_arg1 == null){
                return;
            };
            if ((((_arg1.indexOf("anim") < 0)) && ((_arg1.indexOf("proj") < 0)))){
                return;
            };
            var _local2 = "";
            var _local3:Number = -1;
            var _local4:Array = _arg1.split(",");
            var _local6:uint;
            while (_local6 < _local4.length) {
                _local5 = _local4[_local6].split(":");
                if (_local5[0] == "anim"){
                    _local2 = _local5[1];
                }
                else {
                    if (_local5[0] == "chance"){
                        _local3 = Number(_local5[1]);
                    };
                    if (_local5[0] == "proj"){
                        strProj = _local5[1];
                    };
                };
                _local6++;
            };
            if (((!((_local2 == ""))) && ((_local3 > 0)))){
                specialAnimation[_local2] = _local3;
            };
        }

        private function removeItemAnimation(_arg1:String){
            var _local2:String;
            trace(("strMeta: " + _arg1));
            if (_arg1 == null){
                return;
            };
            if (_arg1.indexOf("proj") > -1){
                strProj = "";
            };
            for (_local2 in specialAnimation) {
                if (_arg1.indexOf(_local2) > -1){
                    delete specialAnimation[_local2];
                    return;
                };
            };
        }

        public function isItemEquipped(_arg1:int):Boolean{
            var _local2:* = getItemByID(_arg1);
            if ((((((_local2 == null)) || ((_local2.bEquip == null)))) || ((_local2.bEquip == 0)))){
                return (false);
            };
            return (true);
        }

        public function getClassArmor(_arg1:String):Object{
            var _local2:int;
            while (_local2 < items.length) {
                if ((((items[_local2].sName == _arg1)) && ((items[_local2].sES == "ar")))){
                    return (items[_local2]);
                };
                _local2++;
            };
            return (null);
        }

        public function getEquippedItemBySlot(_arg1:String):Object{
            var _local2:int;
            while (_local2 < items.length) {
                if ((((items[_local2].bEquip == 1)) && ((items[_local2].sES == _arg1)))){
                    return (items[_local2]);
                };
                _local2++;
            };
            return (null);
        }

        public function getItemByEquipSlot(_arg1:String):Object{
            if (((((!((objData == null))) && (!((objData.eqp == null))))) && (!((objData.eqp[_arg1] == null))))){
                return (objData.eqp[_arg1]);
            };
            return (null);
        }

        public function updateArmorRep():void{
            var _local1:* = getClassArmor(objData.strClassName);
            _local1.iQty = Number(objData.iCP);
        }

        public function getArmorRep(_arg1:String=""):int{
            if (_arg1 == ""){
                _arg1 = objData.strClassName;
            };
            var _local2:* = getClassArmor(_arg1);
            if (_local2 != null){
                return (_local2.iQty);
            };
            return (0);
        }

        public function getCPByID(_arg1:int):int{
            var _local2:* = getItemByID(_arg1);
            if (_local2 != null){
                return (_local2.iQty);
            };
            return (-1);
        }

        public function updateRep():void{
            var _local1:* = objData.iRank;
            var _local2:* = objData.iCP;
            var _local3:int = rootClass.getRankFromPoints(_local2);
            var _local4:int;
            var _local5:* = rootClass.world;
            if (_local3 < rootClass.iRankMax){
                _local4 = (rootClass.arrRanks[_local3] - rootClass.arrRanks[(_local3 - 1)]);
            };
            objData.iCurCP = (_local2 - rootClass.arrRanks[(_local3 - 1)]);
            objData.iRank = _local3;
            objData.iCPToRank = _local4;
            if (((isMyAvatar) && (!((_local1 == _local3))))){
                _local5.updatePortrait(this);
            };
            if (isMyAvatar){
                rootClass.updateRepBar();
            };
        }

        public function levelUp():void{
            healAnimation();
            var _local1:* = pMC.addChild(new LevelUpDisplay());
            _local1.t.ti.text = objData.intLevel;
            _local1.x = pMC.mcChar.x;
            _local1.y = (pMC.pname.y + 10);
            rootClass.FB_showFeedDialog("Level Up!", (("reached Level " + objData.intLevel) + " in AQWorlds!"), "aqw-levelup.jpg");
        }

        public function rankUp(_arg1:String, _arg2:int):void{
            healAnimation();
            var _local3:* = pMC.addChild(new RankUpDisplay());
            _local3.t.ti.text = ((_arg1 + ", Rank ") + _arg2);
            _local3.x = pMC.mcChar.x;
            _local3.y = (pMC.pname.y + 10);
        }

        public function healAnimation():void{
            rootClass.mixer.playSound("Heal");
            var _local1:* = pMC.parent.addChild(new sp_eh1());
            _local1.x = pMC.x;
            _local1.y = pMC.y;
        }

        public function isUpgraded():Boolean{
            return ((int(objData.iUpgDays) >= 0));
        }

        public function hasUpgraded():Boolean{
            return ((int(objData.iUpg) > 0));
        }

        public function isVerified():Boolean{
            return ((((((objData.intAQ > 0)) || ((objData.intDF > 0)))) || ((objData.intMQ > 0))));
        }

        public function isStaff():Boolean{
            return ((objData.intAccessLevel >= 40));
        }

        public function isEmailVerified():Boolean{
            return ((objData.intActivationFlag == 5));
        }

        public function updatePending(_arg1:int):void{
            var _local5:String;
            var _local6:uint;
            if (objData.pending == null){
                _local5 = "";
                _local6 = 0;
                while (_local6 < 500) {
                    _local5 = (_local5 + String.fromCharCode(0));
                    _local6++;
                };
                objData.pending = _local5;
            };
            var _local2:int = Math.floor((_arg1 >> 3));
            var _local3:int = (_arg1 % 8);
            var _local4:int = objData.pending.charCodeAt(_local2);
            _local4 = (_local4 | (1 << _local3));
            objData.pending = ((objData.pending.substr(0, _local2) + String.fromCharCode(_local4)) + objData.pending.substr((_local2 + 1)));
        }

        public function updateScrolls(_arg1:int):void{
            var _local5:String;
            var _local6:uint;
            if (objData.scrolls == null){
                _local5 = "";
                _local6 = 0;
                while (_local6 < 500) {
                    _local5 = (_local5 + String.fromCharCode(0));
                    _local6++;
                };
                objData.scrolls = _local5;
            };
            var _local2:int = Math.floor((_arg1 >> 3));
            var _local3:int = (_arg1 % 8);
            var _local4:int = objData.scrolls.charCodeAt(_local2);
            _local4 = (_local4 | (1 << _local3));
            objData.scrolls = ((objData.scrolls.substr(0, _local2) + String.fromCharCode(_local4)) + objData.scrolls.substr((_local2 + 1)));
        }

        public function handleItemAnimation():void{
            var _local2:String;
            var _local3:Class;
            var _local4:MovieClip;
            trace("handle Animation");
            var _local1:Number = (Math.random() * 100);
            for (_local2 in specialAnimation) {
                trace((("rand: " + _local1) + " specialAnimations[s]"));
                if (_local1 < specialAnimation[_local2]){
                    _local3 = (rootClass.world.getClass(_local2) as Class);
                    if (_local3 != null){
                        _local4 = (new (_local3)() as MovieClip);
                        _local4.x = pMC.x;
                        _local4.y = pMC.y;
                        trace("x and y set");
                        if (pMC.mcChar.scaleX < 0){
                            _local4.scaleX = (_local4.scaleX * -1);
                        };
                        rootClass.world.CHARS.addChild(_local4);
                    };
                    return;
                };
            };
        }

        public function get FirstLoad():Boolean{
            return (firstLoad);
        }

        public function get LoadCount():int{
            return (loadCount);
        }

        public function updateLoaded():void{
            loadCount--;
        }

        public function firstDone():void{
            firstLoad = false;
        }


    }
}//package 

