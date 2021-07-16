// Decompiled by AS3 Sorcerer 2.99
// http://www.as3sorcerer.com/

//Game_fla.mcPopup_310

package Game_fla{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.display.Loader;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class mcPopup_310 extends MovieClip {

        public var mcStatsView:StatsviewMC;
        public var mcCharpanel:CharpanelMC;
        public var mcBag:SimpleButton;
        public var mcHouseShop:HouseShop;
		public var mcSkillTree:MovieClip;
        public var mcCustomize:MovieClip;
        public var mcMap:MovieClip;
        public var mcMining:MovieClip;
        public var mcAlchemy:MovieClip;
        public var mcDailyLogin:MovieClip;
		public var mcModPanel:MovieClip;
        public var mcTempInventory:TempInventory;
        public var mcPVPPanel:PVPPanelMC;
        public var mcHouseItemHandle:HouseItemHandleMC;
        public var reportMC:MovieClip;
		public var mailMC:MovieClip;
        public var mcHouseOptions:MovieClip;
        public var mcBook:MovieClip;
        public var cnt:FactionsMC;
        public var mcHouseMenu:HouseMenu;
        public var mcCustomizeArmor:MovieClip;
		public var mcCustomizeGuild:MovieClip;
        public var GuildBG:MovieClip;
        public var mcNews:MovieClip;
        public var rootClass:MovieClip;
        public var world:MovieClip;
        public var fData:Object;
        public var layout:LPFLayout;
        public var guild;
        public var li:mcGuildListItem;
        public var onlineCount:int;
        public var Rank:int;
        public var i;
        public var hRun:Number;
		public var mcRedeem:MovieClip;
        public var dRun:Number;
        public var oy:Number;
        public var mbY:int;
        public var mhY:int;
        public var mbD:int;
        public var tradeId:int;
        public var mDown:Boolean;

        public function mcPopup_310(){
            addFrameScript(0, frame1, 1, frame2, 6, frame7, 14, frame15, 23, frame24, 29, frame30, 39, frame40, 48, frame49, 57, frame58, 64, frame65, 71, frame72, 78, frame79, 86, frame87, 94, frame95, 102, frame103, 111, frame112, 120, frame121, 128, frame129, 138, frame139, 148, frame149, 159, frame160, 168, frame169, 179, frame180, 189, frame190, 199, frame200, 208, frame209, 217, frame218, 227, frame228, 237, frame238, 239, frame240, 249, frame250, 259, frame260, 269, frame270, 279, frame280, 289, frame290, 299, frame300, 309, frame310, 319, frame320, 329, frame330);
        }
        public function fOpen(_arg_1:String, _arg_2:Object=null):void{
            if (currentLabel != _arg_1){
                fClose();
                if (_arg_2 != null){
                    fData = _arg_2;
                };
                gotoAndStop(_arg_1);
                visible = true;
            };
        }
        public function fClose(){
            var _local_1:MovieClip = MovieClip(this);
			/*
            if (_local_1.mcHouseMenu != null){
                _local_1.mcHouseMenu.fClose();
            };
			*/
            if (getChildByName("mcInventory") != null){
                MovieClip(getChildByName("mcInventory")).fClose();
            };
            if (getChildByName("mcShop") != null){
                MovieClip(getChildByName("mcShop")).fClose();
            };
			if (getChildByName("mcVending") != null){
                MovieClip(getChildByName("mcVending")).fClose();
            };
			if (getChildByName("mcVendingShop") != null){
                MovieClip(getChildByName("mcVendingShop")).fClose();
            };
            if (getChildByName("mcBank") != null){
                MovieClip(getChildByName("mcBank")).fClose();
            };
            if (getChildByName("mcCharpanel") != null){
                MovieClip(getChildByName("mcCharpanel")).fClose();
            };
            if (getChildByName("mcStatsView") != null){
                MovieClip(getChildByName("mcStatsView")).fClose();
            };
            if (getChildByName("mcTrade") != null){
                MovieClip(getChildByName("mcTrade")).fClose();
            };
            if (getChildByName("mcAuction") != null){
                MovieClip(getChildByName("mcAuction")).fClose();
            };
			if (getChildByName("mcRedeem") != null){
                MovieClip(getChildByName("mcRedeem")).fClose();
            };
			if (getChildByName("mcRefine") != null){
                MovieClip(getChildByName("mcRefine")).fClose();
            };
			if (getChildByName("mcPreview") != null){
                MovieClip(getChildByName("mcPreview")).fClose();
            };
        }
        public function onClose(_arg_1:Event=null):void{
            trace("mcPopup.onClose >");
            if (((!((currentLabel == "Init"))) && (!((currentFrame == 1))))){
                fClose();
                MovieClip(Game.root).mixer.playSound("Click");
                if (((((world.isMyHouse()) && (!(world.mapLoadInProgress)))) && (!((currentLabel == "House"))))){
                    gotoAndPlay("House");
                } else {
                    trace(" > init");
                    gotoAndPlay("Init");
                };
            };
        }
       
        public function loadMap(_arg_1:String){
            mcMap.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcMap.addChild(_local_2);
        }
        public function loadNews(_arg_1:String){
            mcNews.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcNews.addChild(_local_2);
        }
        public function loadBook(_arg_1:String){
            trace((Game.serverFilePath + _arg_1));
            mcBook.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcBook.addChild(_local_2);
        }
        public function loadMining(_arg_1:String){
            mcMining.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcMining.addChild(_local_2);
        }
        public function loadAlchemy(_arg_1:String){
            mcAlchemy.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcAlchemy.addChild(_local_2);
        }
		public function loadModPanel(_arg_1:String){
			mcModPanel.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcModPanel.addChild(_local_2);
		}
        public function loadDailyReward(_arg_1:String){
            mcDailyLogin.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcDailyLogin.addChild(_local_2);
        }
		
		public function strNumWithCommas(_arg1:Number):String{
            var _local2 = "";
            var _local3:String = _arg1.toString();
            var _local4:int;
            var _local5:int;
            _local4 = (_local3.length - 1);
            while (_local4 > -1) {
                if (_local5 == 3){
                    _local5 = 0;
                    _local2 = ((_local3.charAt(_local4) + ",") + _local2);
                }
                else {
                    _local2 = (_local3.charAt(_local4) + _local2);
                };
                _local5++;
                _local4--;
            };
            return (_local2);
        }
		
        public function updateGuildWindow():void{
            var _local_1:MovieClip;
            var _local_2:int;
			_local_1 = GuildBG.mcBuyButtons;
            _local_2 = /*50*/(10 - int(rootClass.world.myAvatar.objData.guild.MaxMembers));
            GuildBG.gSlots.tSlots.text = (String(rootClass.world.myAvatar.objData.guild.MaxMembers) + "/10");
            _local_1.txtRest.text = (("(" + String(_local_2)) + ")");
            _local_1.txtRestCost.text = (String(strNumWithCommas((_local_2 * 200))) + " Fame");
            _local_1.txtCoins.text = strNumWithCommas(rootClass.world.myAvatar.objData.guild.Fame);
            _local_1.btnOne.addEventListener(MouseEvent.CLICK, onBuyClick, false, 0, true);
            _local_1.btnRest.addEventListener(MouseEvent.CLICK, onBuyClick, false, 0, true);
			//_local_1.txtRestCost.mouseChildren = false;
			//_local_1.txtRestCost.mouseEnabled = false;
			/*
            if ((((rootClass.world.myAvatar.objData.guildRank == 3)) && ((rootClass.world.myAvatar.objData.guild.MaxMembers < 10)))){//50)))){
                _local_1 = GuildBG.mcBuyButtons;
                _local_2 = (75 - int(rootClass.world.myAvatar.objData.guild.MaxMembers));
                GuildBG.gSlots.tSlots.text = (String(rootClass.world.myAvatar.objData.guild.MaxMembers) + "/10");
                _local_1.txtRest.text = (("(" + String(_local_2)) + ")");
                _local_1.txtRestCost.text = (String((_local_2 * 200)) + " Diamonds");
                _local_1.txtCoins.text = String(rootClass.world.myAvatar.objData.intCoins);
                _local_1.btnOne.addEventListener(MouseEvent.CLICK, onBuyClick, false, 0, true);
                _local_1.btnRest.addEventListener(MouseEvent.CLICK, onBuyClick, false, 0, true);
            } else {
                GuildBG.gSlots.tSlots.text = (String(rootClass.world.myAvatar.objData.guild.MaxMembers) + "/10");
                GuildBG.mcBuyButtons.visible = false;
            };
			*/
        }
		
        public function onBuyClick(_arg_1:MouseEvent):void{
			if (rootClass.world.myAvatar.objData.guildRank == 3){
				var _local_2:int;
				switch (_arg_1.currentTarget.name){
					case "btnOne":
						_local_2 = 1;
						break;
					case "btnRest":
						_local_2 = (75 - int(rootClass.world.myAvatar.objData.guild.MaxMembers));
						break;
				};
				if ((_local_2 * 200) > rootClass.world.myAvatar.objData.intCoins){
					rootClass.MsgBox.notify("You do not have enough Guild Fame to purchase this.");
				} else {
					rootClass.world.addMemSlots(_local_2);
				};
			} else {
				rootClass.MsgBox.notify("Only a guild master is allowed to use this panel.");
			}
        }
        public function getRank(_arg_1:int):String{
            var _local_2:* = "";
            switch (Number(_arg_1)){
                case 0:
                    _local_2 = "Pleb";
                    break;
                case 1:
                    _local_2 = "Member";
                    break;
                case 2:
                    _local_2 = "Commander";
                    break;
                case 3:
                    _local_2 = "Master";
                    break;
            };
            return (_local_2);
        }
        public function onGClose(_arg_1:MouseEvent):void{
            GuildBG.scr.hit.removeEventListener(MouseEvent.MOUSE_DOWN, onScrDown);
            stage.removeEventListener(MouseEvent.MOUSE_UP, onScrUp);
            GuildBG.scr.h.removeEventListener(Event.ENTER_FRAME, hEF);
            GuildBG.guildDisplay.removeEventListener(Event.ENTER_FRAME, dEF);
            GuildBG.mcBuyButtons.btnOne.removeEventListener(MouseEvent.CLICK, onBuyClick);
            GuildBG.mcBuyButtons.btnFive.removeEventListener(MouseEvent.CLICK, onBuyClick);
            GuildBG.mcBuyButtons.btnRest.removeEventListener(MouseEvent.CLICK, onBuyClick);
            fClose();
        }
        public function onScrDown(_arg_1:MouseEvent){
            mbY = int(mouseY);
            mhY = int(GuildBG.scr.h.y);
            mDown = true;
        }
        public function onScrUp(_arg_1:MouseEvent):void{
            mDown = false;
        }
        public function hEF(_arg_1:Event){
            var _local_2:*;
            if (mDown){
                _local_2 = GuildBG.scr;
                mbD = (int(mouseY) - mbY);
                _local_2.h.y = (mhY + mbD);
                if ((_local_2.h.y + _local_2.h.height) > _local_2.b.height){
                    _local_2.h.y = int((_local_2.b.height - _local_2.h.height));
                };
                if (_local_2.h.y < 0){
                    _local_2.h.y = 0;
                };
            };
        }
        public function dEF(_arg_1:Event){
            var _local_2:* = GuildBG.scr;
            var _local_3:* = GuildBG.guildDisplay;
            var _local_4:* = (-(_local_2.h.y) / hRun);
            var _local_5:* = (int((_local_4 * dRun)) + oy);
            if (Math.abs((_local_5 - _local_3.y)) > 0.2){
                _local_3.y = (_local_3.y + ((_local_5 - _local_3.y) / 4));
            } else {
                _local_3.y = _local_5;
            };
        }
        function frame1(){
            rootClass = MovieClip(stage.getChildAt(0));
            world = (rootClass.world as MovieClip);
            fData = {};
            visible = false;
            stop();
        }
        function frame2(){
            fData = {};
            visible = false;
            if (rootClass.mcO != null){
                this.removeChild(rootClass.mcO);
            };
            stop();
        }
        function frame7(){
            layout = (addChild(new LPFLayoutInvShopEnh()) as LPFLayoutInvShopEnh);
            layout.name = "mcInventory";
            layout.fOpen({
                "fData":{
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"inventory"
            });
            layout = null;
            stop();
        }
        function frame15(){
            stop();
        }
        function frame24(){
            layout = (addChild(new LPFLayoutInvShopEnh()) as LPFLayoutInvShopEnh);
            layout.name = "mcShop";
            layout.fOpen({
                "fData":{
                    "itemsShop":world.shopinfo.items,
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData,
                    "shopinfo":world.shopinfo
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"shopBuy"
            });
            layout = null;
            stop();
        }
        function frame30(){
            layout = (addChild(new LPFLayoutMergeShop()) as LPFLayoutMergeShop);
            layout.name = "mcShop";
            layout.fOpen({
                "fData":{
                    "itemsShop":world.shopinfo.items,
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":-150,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"shopBuy"
            });
            layout = null;
            stop();
        }
        function frame40(){
            stop();
        }
        function frame49(){
            layout = (addChild(new LPFLayoutBank()) as LPFLayoutBank);
            layout.name = "mcBank";
            layout.fOpen({
                "fData":{
                    "itemsB":world.bankinfo.items,
                    "itemsI":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":-150,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"bank"
            });
            layout = null;
            stop();
        }
        function frame58(){
            loadMap(rootClass.world.objInfo.sMap);
            stop();
        }
        function frame65(){
            loadNews(rootClass.world.objInfo.sNews);
            stop();
        }
        function frame72(){
            loadBook(rootClass.world.objInfo.sBook);
            stop();
        }
        function frame79(){
            rootClass.mcO = (((rootClass.mcO)==null) ? (new mcOption(rootClass) as MovieClip) : rootClass.mcO);
            this.addChild(rootClass.mcO);
            rootClass.mcO.x = 600;
            rootClass.mcO.y = 100;
            if (fData.Account == null){
                rootClass.mcO.Init();
            } else {
                if (fData.Account != null){
                    delete fData.Account;
                    rootClass.mcO.InitAccount();
                };
            };
            stop();
        }
        function frame87(){
            stop();
        }
        function frame95(){
            stop();
        }
        function frame103(){
            stop();
        }
        function frame112(){
            stop();
        }
        function frame121(){
            mcHouseMenu.visible = false;
            mcHouseItemHandle.visible = false;
            mcHouseMenu.fOpen("default");
            stop();
        }
        function frame129(){
            stop();
        }
        function frame139(){
            stop();
        }
        function frame149(){
            stop();
        }
        function frame160(){
            GuildBG.btnClose.addEventListener(MouseEvent.CLICK, onClose, false, 0, true);
            guild = rootClass.world.myAvatar.objData.guild;
            GuildBG.tTitle.text = guild.Name;
            GuildBG.tScores.intWins.text = guild.Wins;
            GuildBG.tScores.intLoses.text = guild.Loses;
            GuildBG.tScores.guildPoint.text = (guild.Wins - (guild.Loses * 10.5));
            onlineCount = 0;
            i = 0;
            while (i < guild.ul.length) {
                li = new mcGuildListItem();
                li.x = 0;
                li.y = (i * 17);
                li.tName.text = guild.ul[i].userName;
                li.tRank.text = getRank(guild.ul[i].Rank);
                //li.tServer.text = guild.ul[i].Server;
                li.tLevel.text = String(guild.ul[i].Level);
				li.tContribution.text = String(guild.ul[i].Contribution);
				if (guild.ul[i].Server.toLowerCase() != "offline"){
					li.tServer.htmlText = ('<font color="#00FF00">Online</font>');
				} else {
					li.tServer.htmlText = ('<font color="#FFFFFF">' + guild.ul[i].Server + '</font>');
				};
				
                if (guild.ul[i].Server.toLowerCase() != "offline"){
                    onlineCount++;
                };
                GuildBG.guildDisplay.addChild(li);
                i++;
            };
            GuildBG.tOnline.tMemCount.text = (((String(onlineCount) + "/") + String(guild.ul.length)) + " Online");
            GuildBG.guildDisplay.mask = GuildBG.cntMask;
            if (GuildBG.guildDisplay.height > GuildBG.cntMask.height){
                GuildBG.scr.visible = true;
                GuildBG.scr.hit.alpha = 0;
                GuildBG.scr.h.height = int(((GuildBG.cntMask.height / GuildBG.guildDisplay.height) * GuildBG.scr.b.height));
                hRun = (GuildBG.scr.b.height - GuildBG.scr.h.height);
                dRun = ((GuildBG.guildDisplay.height - GuildBG.cntMask.height) + 5);
                oy = GuildBG.guildDisplay.y;
                GuildBG.scr.hit.addEventListener(MouseEvent.MOUSE_DOWN, onScrDown, false, 0, true);
                stage.addEventListener(MouseEvent.MOUSE_UP, onScrUp, false, 0, true);
                GuildBG.scr.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                GuildBG.guildDisplay.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
            } else {
                GuildBG.scr.visible = false;
            };
            updateGuildWindow();
            mDown = false;
        }
        function frame169(){
            layout = (addChild(new LPFLayoutForgeShop()) as LPFLayoutForgeShop);
            layout.name = "mcShop";
            layout.fOpen({
                "fData":{
                    "itemsShop":world.shopinfo.items,
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"shopBuy"
            });
            layout = null;
            stop();
        }
        function frame180(){
            loadMining(rootClass.world.objInfo.sMining);
            stop();
        }
        function frame190(){
            //loadAlchemy(rootClass.world.objInfo.sAlchemy);
            stop();
        }
        function frame200(){
            loadDailyReward(rootClass.world.objInfo.sDailyReward);
            stop();
        }
        function frame209(){
            stop();
        }
        function frame218(){
            stop();
        }
        function frame228(){
            layout = (addChild(new LPFLayoutTrade()) as LPFLayoutTrade);
            layout.name = "mcTrade";
            layout.fOpen({
                "fData":{
                    "itemsB":world.tradeinfo.itemsA,
                    "itemsC":world.tradeinfo.itemsB,
                    "itemsI":world.myAvatar.items,
                    "objData":world.myAvatar.objData,
                    "tradeId":tradeId
                },
                "r":{
                    "x":-190,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"bank"
            });
            layout = null;
            stop();
        }
        function frame238(){
            stop();
        }
        function frame240(){
            layout = (addChild(new LPFLayoutAuction()) as LPFLayoutAuction);
            layout.name = "mcAuction";			
            layout.fOpen({
                "fData":{
                    "itemsI":world.auctioninfo.items,
                    "itemsB":world.myAvatar.items,
                    "itemsC":world.retrieveinfo.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":-150,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"bank"
            });
            layout = null;
            stop();
        }
        function frame249(){
            stop();
        }
        function frame250(){
            layout = (addChild(new LPFLayoutGuildShop()) as LPFLayoutGuildShop);
            layout.name = "mcShop";
            layout.fOpen({
                "fData":{
                    "itemsShop":world.shopinfo.items,
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"shopBuy"
            });
            layout = null;
            stop();
        }
        function frame260(){
            loadModPanel(rootClass.world.objInfo.sModPanel);
            stop();
        }
		
		function frame270(){
			stop();
        }
		
		function frame280(){
			layout = (addChild(new LPFLayoutVendingShop()) as LPFLayoutVendingShop);
            layout.name = "mcVendingShop";
			layout.fOpen({
                "fData":{
                    "itemsVending":world.vendingshopinfo.items,
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData,
					"objVendor":"Vending"
                },
                "r":{
                    "x":-150,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"shopBuy"//shopBuy
            });
            layout = null;
            stop();
        }
		
		function frame290(){
            layout = (addChild(new LPFLayoutVendingSetup()) as LPFLayoutVendingSetup);
            layout.name = "mcVending";
            layout.fOpen({
                "fData":{
                    "itemsV":world.vendinginfo.items,
                    "itemsI":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":-150,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"bank"
            });
            layout = null;
            stop();
        }
		
		function frame300(){
			stop();
        }
		
		function frame310(){
			layout = (addChild(new LPFLayoutRefineShop()) as LPFLayoutRefineShop);
            layout.name = "mcRefine";
            layout.fOpen({
                "fData":{
                    "itemsShop":world.myAvatar.items,
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":-150,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"shopBuy"
            });
            layout = null;
            stop();
        }
		
		function frame320(){
			stop();
		}
		
		function frame330(){
			layout = (addChild(new LPFLayoutChatItemPreview()) as LPFLayoutChatItemPreview);
            layout.name = "mcPreview";
            layout.fOpen({
                "fData":{
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"preview"
            });
            layout = null;
            stop();
		}
    }
}//package Game_fla
