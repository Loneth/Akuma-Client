// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcPopup_188_270

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.Event;
    import flash.display.Loader;
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

    public dynamic class mcPopup_188_270 extends MovieClip 
    {

        public var attestationMC:MovieClip;
        public var world:MovieClip;
        public var mcHouseOptions:MovieClip;
        public var fData:Object;
        public var layout:LPFLayout;
        public var cnt:FactionsMC;
        public var mcHouseShop:HouseShop;
        public var mcCustomizeArmor:MovieClip;
        public var mcOptions:MovieClip;
        public var mcCharpanel:CharpanelMC;
        public var mcNews:MovieClip;
        public var mcTop:MovieClip;
        public var mcAward:MovieClip;
        public var mcBag:SimpleButton;
        public var mcBook:MovieClip;
        public var mcCustomize:MovieClip;
        public var mcHouseMenu:HouseMenu;
        public var mcPVPPanel:PVPPanelMC;
        public var rootClass:MovieClip;
        public var reportMC:MovieClip;
        public var mcHouseItemHandle:HouseItemHandleMC;
        public var mcMap:MovieClip;
        public var mcTMap:MovieClip;
        public var mcTempInventory:TempInventory;
        public var OpenShopNum:int;

        public function mcPopup_188_270()
        {
            addFrameScript(0, frame1, 1, frame2, 6, frame7, 14, frame15, 23, frame24, 29, frame30, 38, frame39, 43, frame44, 49, frame50, 56, frame57, 66, frame67, 75, frame76, 84, frame85, 93, frame94, 100, frame101, 107, frame108, 114, frame115, 121, frame122, 128, frame129, 135, frame136, 143, frame144, 151, frame152, 159, frame160, 167, frame168, 176, frame177, 185, frame186, 193, frame194, 203, frame204, 213, frame214);
        }
        public function fOpen(_arg1:String, _arg2:Object=null):void
        {
            if (currentLabel != _arg1){
                fClose();
                if (_arg2 != null){
                    fData = _arg2;
                };
                gotoAndStop(_arg1);
                visible = true;
            };
        }
        public function fClose()
        {
            var _local1:MovieClip;
            _local1 = MovieClip(this);
            if (_local1.mcHouseMenu != null){
                _local1.mcHouseMenu.fClose();
            };
            if (getChildByName("mcInventory") != null){
                MovieClip(getChildByName("mcInventory")).fClose();
            };
            if (getChildByName("mcShop") != null){
                MovieClip(getChildByName("mcShop")).fClose();
            };
            if (getChildByName("mcBank") != null){
                MovieClip(getChildByName("mcBank")).fClose();
            };
            if (getChildByName("mcRefine") != null){
                MovieClip(getChildByName("mcRefine")).fClose();
            };
            if (getChildByName("mcSynthesis") != null){
                MovieClip(getChildByName("mcSynthesis")).fClose();
            };
            if (getChildByName("mcUpgrade") != null){
                MovieClip(getChildByName("mcUpgrade")).fClose();
            };
            if (getChildByName("mcAddition") != null){
                MovieClip(getChildByName("mcAddition")).fClose();
            };
            if (getChildByName("mcEnchant") != null){
                MovieClip(getChildByName("mcEnchant")).fClose();
            };
            if (getChildByName("mcCIS") != null){
                MovieClip(getChildByName("mcCIS")).fClose();
            };
            if (getChildByName("mcCharpanel") != null){
                MovieClip(getChildByName("mcCharpanel")).fClose();
            };
        }
        public function onClose(_arg1:Event=null):void
        {
            if (((!((currentLabel == "Init"))) && (!((currentFrame == 1))))){
                fClose();
                if (((((world.isMyHouse()) && (!(world.mapLoadInProgress)))) && (!((currentLabel == "House"))))){
                    gotoAndPlay("House");
                } else {
                    gotoAndPlay("Init");
                };
            };
        }
        public function loadAward(_arg1:String)
        {
            var _local2:Loader;
            mcAward.removeChildAt(0);
            _local2 = new Loader();
            _local2.load(new URLRequest((Game.serverFilePath + _arg1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcAward.addChild(_local2);
        }
        public function loadTop(_arg1:String)
        {
            var _local2:Loader;
            mcTop.removeChildAt(0);
            _local2 = new Loader();
            _local2.load(new URLRequest((Game.serverFilePath + _arg1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcTop.addChild(_local2);
        }
        public function loadNews(_arg1:String)
        {
            var _local2:Loader;
            mcNews.removeChildAt(0);
            _local2 = new Loader();
            _local2.load(new URLRequest((Game.serverFilePath + _arg1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcNews.addChild(_local2);
        }
        public function loadBook(_arg1:String)
        {
            var _local2:Loader;
            mcBook.removeChildAt(0);
            _local2 = new Loader();
            _local2.load(new URLRequest((Game.serverFilePath + _arg1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcBook.addChild(_local2);
        }
        public function loadTMap(_arg1:String)
        {
            var _local2:Loader;
            mcTMap.removeChildAt(0);
            _local2 = new Loader();
            _local2.load(new URLRequest((Game.serverFilePath + _arg1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcTMap.addChild(_local2);
        }
        public function loadMap(_arg1:String)
        {
            var _local2:Loader;
            mcMap.removeChildAt(0);
            _local2 = new Loader();
            _local2.load(new URLRequest((Game.serverFilePath + _arg1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcMap.addChild(_local2);
        }
        function frame1()
        {
            rootClass = MovieClip(stage.getChildAt(0));
            world = (rootClass.world as MovieClip);
            fData = {};
            visible = false;
            stop();
        }
        function frame2()
        {
            fData = {};
            visible = false;
            stop();
        }
        function frame7()
        {
            layout = (addChild(new LPFLayoutInvShopEnh()) as LPFLayoutInvShopEnh);
            layout.name = "mcInventory";
            layout.fOpen({
                fData:{
                    itemsInv:world.myAvatar.items,
                    objData:world.myAvatar.objData
                },
                r:{
                    x:0,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"inventory"
            });
            layout = null;
            stop();
        }
        function frame15()
        {
            stop();
        }
        function frame24()
        {
            OpenShopNum = world.OpenShopNum;
            layout = (addChild(new LPFLayoutInvShopEnh()) as LPFLayoutInvShopEnh);
            layout.name = "mcShop";
            layout.fOpen({
                fData:{
                    shopName:world.shopinfo[OpenShopNum].strName,
                    itemsShop:world.shopinfo[OpenShopNum].items,
                    itemsInv:world.myAvatar.items,
                    objData:world.myAvatar.objData
                },
                r:{
                    x:0,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"shopBuy"
            });
            layout = null;
            stop();
        }
        function frame30()
        {
            OpenShopNum = world.OpenShopNum;
            layout = (addChild(new LPFLayoutMergeShop()) as LPFLayoutMergeShop);
            layout.name = "mcShop";
            layout.fOpen({
                fData:{
                    itemsShop:world.shopinfo[OpenShopNum].items,
                    itemsInv:world.myAvatar.items,
                    objData:world.myAvatar.objData
                },
                r:{
                    x:0,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"shopBuy"
            });
            layout = null;
            stop();
        }
        function frame39()
        {
            layout = (addChild(new LPFLayoutBank()) as LPFLayoutBank);
            layout.name = "mcBank";
            layout.fOpen({
                fData:{
                    itemsB:world.bankinfo.items,
                    itemsI:world.myAvatar.items,
                    objData:world.myAvatar.objData
                },
                r:{
                    x:0,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"bank"
            });
            layout = null;
            stop();
        }
        function frame44()
        {
            layout = (addChild(new LPFLayoutRefine()) as LPFLayoutRefine);
            layout.name = "mcRefine";
            layout.fOpen({
                fData:{
                    itemsR:world.refineinfo.items,
                    itemsI:world.myAvatar.items,
                    objData:world.myAvatar.objData
                },
                r:{
                    x:0,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"refine"
            });
            layout = null;
            stop();
        }
        function frame50()
        {
            layout = (addChild(new LPFLayoutSynthesis()) as LPFLayoutSynthesis);
            layout.name = "mcSynthesis";
            layout.fOpen({
                fData:{
                    itemsS:world.myAvatar.items,
                    itemsI:world.myAvatar.items,
                    objData:world.myAvatar.objData
                },
                r:{
                    x:0,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"synthesis"
            });
            layout = null;
            stop();
        }
        function frame57()
        {
            layout = (addChild(new LPFLayoutCIS()) as LPFLayoutCIS);
            layout.name = "mcCIS";
            layout.fOpen({
                r:{
                    x:0,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"CIS",
                eventType:"refreshItems"
            });
            layout = null;
            stop();
        }
        function frame67()
        {
            layout = (addChild(new LPFLayoutUpgrade()) as LPFLayoutUpgrade);
            layout.name = "mcUpgrade";
            layout.fOpen({
                fData:{
                    itemsU:world.myAvatar.items,
                    itemsI:world.myAvatar.items,
                    objData:world.myAvatar.objData
                },
                r:{
                    x:134,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"upgrade"
            });
            layout = null;
            stop();
        }
        function frame76()
        {
            layout = (addChild(new LPFLayoutAddition()) as LPFLayoutAddition);
            layout.name = "mcAddition";
            layout.fOpen({
                fData:{
                    itemsU:world.myAvatar.items,
                    itemsI:world.myAvatar.items,
                    objData:world.myAvatar.objData
                },
                r:{
                    x:134,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"addition"
            });
            layout = null;
            stop();
        }
        function frame85()
        {
            layout = (addChild(new LPFLayoutEnchant()) as LPFLayoutEnchant);
            layout.name = "mcEnchant";
            layout.fOpen({
                fData:{
                    itemsU:world.myAvatar.items,
                    itemsI:world.myAvatar.items,
                    objData:world.myAvatar.objData
                },
                r:{
                    x:0,
                    y:0,
                    w:stage.stageWidth,
                    h:stage.stageHeight
                },
                sMode:"enchant"
            });
            layout = null;
            stop();
        }
        function frame94()
        {
            loadMap(rootClass.world.objInfo.sMap);
            stop();
        }
        function frame101()
        {
            loadTMap(rootClass.world.objInfo.sTMap);
            stop();
        }
        function frame108()
        {
            loadTop(rootClass.world.objInfo.sTopScroll);
            stop();
        }
        function frame115()
        {
            loadAward(rootClass.world.objInfo.sAward);
            stop();
        }
        function frame122()
        {
            loadNews(rootClass.world.objInfo.sNews);
            stop();
        }
        function frame129()
        {
            loadBook(rootClass.world.objInfo.sBook);
            stop();
        }
        function frame136()
        {
            stop();
        }
        function frame144()
        {
            stop();
        }
        function frame152()
        {
            stop();
        }
        function frame160()
        {
            stop();
        }
        function frame168()
        {
            stop();
        }
        function frame177()
        {
            stop();
        }
        function frame186()
        {
            mcHouseMenu.visible = false;
            mcHouseItemHandle.visible = false;
            mcHouseMenu.fOpen("default");
            stop();
        }
        function frame194()
        {
            stop();
        }
        function frame204()
        {
            stop();
        }
        function frame214()
        {
            stop();
        }

    }
}//package Game_new_fla

