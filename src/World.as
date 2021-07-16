// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//World

package {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
    import flash.media.SoundTransform;
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.display.BitmapData;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import flash.utils.Timer;
    import flash.geom.ColorTransform;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.display.Bitmap;
    import flash.geom.Matrix;
    import flash.media.Sound;
    import flash.utils.getQualifiedClassName;
    //import flash.external.ExternalInterface;
    import flash.display.Sprite;
    import flash.display.Graphics;
    import flash.text.TextFormat;
    import flash.filters.GlowFilter;
    import flash.utils.*;
    import flash.external.*;

    public class World extends MovieClip {

        private const TICK_MAX = 24;

        public var uiLock:Boolean = false;
        public var objInfo:Object;
        public var objSession:Object;
        public var objResponse:Object;
        public var objQuestString;
        var FEATURE_COLLISION:Boolean = true;
        var CELL_MODE:String = "normal";
        public var SCALE:Number = 1;
        public var WALKSPEED:Number = 8;
        var bitWalk:Boolean = false;
        var lastWalk:Date;
		public var MapMusic:String = null;
		public var isCoordinates:int;
		public var MapBGM:Sound = new Sound();
		public var BGMChannel:SoundChannel = new SoundChannel();
		public var MapBGM2:Sound = new Sound();
		public var BGMChannel2:SoundChannel = new SoundChannel();
        public var strAreaName:String;
        public var strMapName:String;
        public var strMapFileName:String;
		public var strMapBackgroundMusic:String;
        public var intType:int;
        public var intKillCount:int;
        public var objLock;
        public var objExtra;
        public var objHouseData;
        public var objGuildData;
        public var returnInfo:Object;
        public var strFrame:String = "";
		public var BGMisPlaying = 0;
        public var strPad:String = "";
        public var spawnPoint:Object;
        var FG:MovieClip;
        public var CHARS:MovieClip;
        public var TRASH:MovieClip;
        public var map:MovieClip;
		public var linkPreview: MovieClip;
		public var selectPreview;
        public var mapBoundsMC:MovieClip = null;
        public var zSortArr:Array;
        public var ldr_map:Loader;
        var preLMC;
        var zManager:MovieClip;
        public var EFAO:Object;
		public var hideAvatars: Boolean = false;
        public var arrEvent:Array;
        public var arrEventR:Array;
        public var arrSolid:Array;
        public var arrSolidR:Array;
        public var avatars:Object;
        public var myAvatar:Avatar;
        public var mondef:Array;
        public var monswf:Array;
        public var monmap:Array;
        public var monsters:Array;
        public var combatAnims:Array;
        public var staticAnims:Array;
        public var bankinfo:Object;
        public var tradeinfo:Object;
        public var shopinfo:Object;
		public var vendinginfo:Object;
		public var vendingshopinfo:Object;
        public var auctioninfo:Object;
        public var retrieveinfo:Object;
        public var shopBuyItem:Object;
		public var shopVendingBuyItem:Object;
        public var refineShopID:int = -1;
        public var refineShopItems:Array;
		public var refItem:Object;
        public var hairshopinfo:Object;
        public var mapEvents:Object;
        public var adData:Object;
        public var cellMap:Object;
        private var tbmd:BitmapData;
        public var scrollData:Object;
		var SCROLL:Boolean = false;
        public var loaderD:ApplicationDomain;
        public var loaderC:LoaderContext;
        public var loaderContents;
        public var loaderContentsFileNames;
        public var loaderQueue:Array;
        public var playerDomains:Object;
        public var loaderManager:Object;
        public var mapLoadInProgress:Boolean = false;
        private var mapW:int = 1260;
        private var mapH:int = 550;
        private var mapNW:int;
        private var mapNH:int;
        private var mapBmps:Array;
        private var mapTimer:Timer;
        public var actions:Object;
        var restTimer:Timer;
        var AATestTimer:Timer;
        var connTestTimer:Timer;
        var autoActionTimer:Timer;
        var afkTimer:Timer;
        var mvTimer:Timer;
        var mvTimerObj:Object;
        var actionTimer:Timer;
        var actionMap:Array;
        var autoAction:Object;
        var actionReady:Boolean = false;
        var actionResults:Object;
        var actionResultsMon:Object;
        var actionID:Number = 0;
        var actionIDLimit:Number = 30;
        var actionIDMon:Number = 0;
        var actionIDLimitMon:Number = 30;
        var actionDamage;
        var actionRangeSpamTS:Number = 0;
        var actionResultID:Number = 0;
        var actionResultIDLimit:Number = 30;
        var minLatencyOneWay = 20;
        var TcpAckDel = 170;
        var connMsgOut = false;
        public var guildHallData:GuildHall;
        public var mData:mapData;
        public var cHandle:cutsceneHandler;
        public var sController:soundController;
        public var chaosNames:Array;
        public var lock:Object;
        public var invTree:Object;
		public var linkTree:Object;
        public var uoTree:Object;
        public var monTree:Object;
        public var waveTree:Object;
        public var questTree:Object;
        public var refinePatternTree:Object;
        public var defaultCT:ColorTransform;
        public var whiteCT:ColorTransform;
        public var iconCT:ColorTransform;
        public var rarityCA:Array;
        public var deathCT:ColorTransform;
        public var monCT:ColorTransform;
        public var avtCT:ColorTransform;
        public var avtWCT:ColorTransform;
        public var avtMCT:ColorTransform;
        public var avtPCT:ColorTransform;
        public var statusPoisonCT:ColorTransform;
		public var statusFreezeCT:ColorTransform; //Freeze HP Addon Aura
        public var statusStoneCT:ColorTransform;
        public var GCD:int = 1500;
        public var GCDO:int = 1500;
        public var GCDTS:Number = 0;
        public var curRoom:int = 1;
        public var modID:int = -1;
        public var partyID:int = -1;
        public var guildID:int = -1;
        public var bPvP:Boolean = false;
        public var partyMembers:Array;
        public var partyOwner:String = "";
        public var areaUsers:Array;
        public var showHPBar:Boolean = false;
        public var rootClass:MovieClip;
        public var PVPMaps:Array;
        public var PVPQueue:Object;
        public var PVPResults:Object;
        public var PVPFactions:Array;
        public var bookData:Object;
        public var arrHouseItemQueue;
        public var ldr_House:Loader;
        private var ticksum:Number = 0;
        private var ticklist;
        private var bfps:Boolean = false;
        private var fpsTS:Number = 0;
        private var fpsQualityCounter:int = 0;
        private var fpsArrayQuality:Array;
        var arrQuality:Array;

        public function World(_arg1:MovieClip){
            this.objInfo = new Object();
            this.objSession = new Object();
            this.objResponse = new Object();
            this.lastWalk = new Date();
            this.spawnPoint = new Object();
            this.zSortArr = new Array();
            this.ldr_map = new Loader();
            this.EFAO = {
                zc:0,
                zn:1,
                xpc:0,
                xpn:50,
                xpb:false
            };
            this.avatars = new Object();
            this.monsters = new Array();
            this.combatAnims = ["Attack1", "Attack2", "Attack3", "Attack4", "Hit", "Knockout", "Getup", "Stab", "Thrash", "Castgood", "Cast1", "Cast2", "Cast3", "Sword/ShieldFight", "Sword/ShieldAttack1", "Sword/ShieldAttack2", "ShieldBlock", "DuelWield/DaggerFight", "DuelWield/DaggerAttack1", "DuelWield/DaggerAttack2", "FistweaponFight", "FistweaponAttack1", "FistweaponAttack2", "PolearmFight", "PolearmAttack1", "PolearmAttack2", "RangedFight", "RangedAttack1", "UnarmedFight", "UnarmedAttack1", "UnarmedAttack2", "KickAttack", "FlipAttack", "Dodge"];
            this.staticAnims = ["Fall", "Knockout", "Die"];
            this.bankinfo = {
                items:[],
                hasRequested:{}
            };
			this.vendinginfo = {
                items:[],
                hasRequested:{}
            };
			this.vendingshopinfo = {
                items:[],
                hasRequested:{}
            };
            this.auctioninfo = {
                items:[],
                hasRequested:{}
            };
            this.retrieveinfo = {
                items:[],
                hasRequested:{}
            };
            this.tradeinfo = {
                itemsA:[],
                itemsB:[],
                hasRequested:{}
            };
            this.loaderD = new ApplicationDomain(ApplicationDomain.currentDomain);
            this.loaderC = new LoaderContext(false, this.loaderD);
            this.loaderContents = [];
            this.loaderContentsFileNames = [];
            this.loaderQueue = [];
            this.playerDomains = {};
            this.loaderManager = {
                i0:{
                    n:"i0",
                    loaderData:null,
                    timer:new Timer(5000, 1),
                    ldr:new Loader(),
                    free:true,
                    url:""
                },
                i1:{
                    n:"i1",
                    loaderData:null,
                    timer:new Timer(5000, 1),
                    ldr:new Loader(),
                    free:true,
                    url:""
                },
                i2:{
                    n:"i2",
                    loaderData:null,
                    timer:new Timer(5000, 1),
                    ldr:new Loader(),
                    free:true,
                    url:""
                },
                i3:{
                    n:"i3",
                    loaderData:null,
                    timer:new Timer(5000, 1),
                    ldr:new Loader(),
                    free:true,
                    url:""
                },
                i4:{
                    n:"i4",
                    loaderData:null,
                    timer:new Timer(5000, 1),
                    ldr:new Loader(),
                    free:true,
                    url:""
                },
                i5:{
                    n:"i5",
                    loaderData:null,
                    timer:new Timer(5000, 1),
                    ldr:new Loader(),
                    free:true,
                    url:""
                }
            };
            this.mapNW = this.mapW;
            this.mapNH = this.mapH;
            this.mapBmps = [];
            this.mapTimer = new Timer(2000);
            this.actions = new Object();
            this.restTimer = new Timer(2000, 1);
            this.AATestTimer = new Timer(700, 1);
            this.connTestTimer = new Timer(5000, 1);
            this.autoActionTimer = new Timer(2000, 1);
            this.afkTimer = new Timer(120000, 1);
            this.mvTimer = new Timer(1000, 1);
            this.actionMap = new Array();
            this.actionResults = new Object();
            this.actionResultsMon = new Object();
            this.chaosNames = new Array();
            this.lock = {
                loadShop:{
                    cd:3000,
                    ts:0
                },
				loadVendingShop:{
                    cd:3000,
                    ts:0
                },
                loadRefineShop:{
                    cd:3000,
                    ts:0
                },
                loadHairShop:{
                    cd:3000,
                    ts:0
                },
                equipItem:{
                    cd:1500,
                    ts:0
                },
                unequipItem:{
                    cd:1500,
                    ts:0
                },
                buyItem:{
                    cd:1000,
                    ts:0
                },
				buyVendingItem:{
                    cd:1000,
                    ts:0
                },
                sellItem:{
                    cd:1000,
                    ts:0
                },
                getMapItem:{
                    cd:1000,
                    ts:0
                },
                tryQuestComplete:{
                    cd:1250,
                    ts:0
                },
                acceptQuest:{
                    cd:1000,
                    ts:0
                },
                doIA:{
                    cd:1000,
                    ts:0
                },
                rest:{
                    cd:1900,
                    ts:0
                },
                who:{
                    cd:3000,
                    ts:0
                },
                tfer:{
                    cd:3000,
                    ts:0
                }
            };
            this.invTree = {};
			this.linkTree = {};
            this.uoTree = {};
            this.monTree = {};
            this.waveTree = {};
            this.questTree = {};
            this.refinePatternTree = {};
            this.defaultCT = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
            this.whiteCT = new ColorTransform(1, 1, 1, 1, 0xFF, 0xFF, 0xFF, 0);
            this.iconCT = new ColorTransform(0.5, 0.5, 0.5, 1, -50, -50, -50, 0);
            this.rarityCA = [0x666666, 0xFFFFFF, 0x66FF00, 2663679, 0xFF00FF, 0xFFCC00, 0xFF0000];
            this.deathCT = new ColorTransform(0.7, 0.7, 1, 1, -20, -20, 20, 0);
            this.monCT = new ColorTransform(1, 1, 1, 1, 30, 0, 0, 0);
            this.avtCT = new ColorTransform(1, 1, 1, 1, 40, 40, 70, 0);
            this.avtWCT = new ColorTransform(0, 0, 0, 0, 0xFF, 0xFF, 0xFF, 0);
            this.avtMCT = new ColorTransform(0, 0, 0, 0, 30, 0, 0, 0);
            this.avtPCT = new ColorTransform(0, 0, 0, 0, 40, 40, 70, 0);
            this.statusPoisonCT = new ColorTransform(-0.3, -0.3, -0.3, 0, 0, 20, 0, 0);
			this.statusFreezeCT = new ColorTransform(-0.3, -0.3, -0.3, 0, -50, 80, 0xFF, 0); //Freeze Aura Feature
            this.statusStoneCT = new ColorTransform(-1.3, -1.3, -1.3, 0, 100, 100, 100, 0);
            this.partyMembers = [];
            this.areaUsers = [];
            this.PVPMaps = [{
                nam:"It's Us Or Them",
                desc:"This cozy PvP map is ideal for players new to PvP in AQW.",
                warzone:"usorthem",
                label:"usorthem",
                icon:"tower",
                hidden:true
            }, {
                nam:"Bludrut Brawl!",
                desc:"A larger map requiring initiation.",
                warzone:"bludrutbrawl",
                label:"bludrutbrawl",
                icon:"swords",
                hidden:false
            }, {
                nam:"Chaos Brawl!",
                desc:"A larger map requiring communication, coordination, and a whole lot of DPS.",
                warzone:"chaosbrawl",
                label:"chaosbrawl",
                icon:"flag",
                hidden:true
			/* HP PVP Arenas */
			}, {
                nam:"Heavens Shot!",
                desc:"A ranged only fight, good for Magics.",
                warzone:"heavensshot",
                label:"wsg",
                icon:"swords",
                hidden:false
			}, {
                nam:"Champions Arena!",
                desc:"Join in the ancient war between Champions!",
                warzone:"arena",
                label:"usorthem",
                icon:"tower",
                hidden:false
			/* End */
            }, {
                nam:"Frost Brawl!",
                desc:"A larger map requiring communication, coordination, and a whole lot of DPS.",
                warzone:"frostbrawl",
                label:"frostbrawl",
                icon:"swords",
                hidden:true
            }, {
                nam:"Guild War!",
                desc:"Join in the ancient war between guilds!",
                warzone:"guildwar",
                label:"darkoviapvp",
                icon:"flag",
                hidden:true
            }, {
                nam:"Doomwood Arena",
                desc:"This arena is for one on one duels.",
                warzone:"doomarena",
                label:"doomarena",
                icon:"swords",
                hidden:true
            }];
            this.PVPQueue = {
                warzone:"",
                ts:-1,
                avgWait:-1
            };
            this.PVPResults = {
                pvpScore:[],
                team:0
            };
            this.PVPFactions = [];
            this.arrHouseItemQueue = [];
            this.ldr_House = new Loader();
            this.ticklist = new Array();
            this.fpsArrayQuality = new Array();
            this.arrQuality = new Array("LOW", "MEDIUM", "HIGH");
            super();
			this.SCROLL = false;
            this.rootClass = _arg1;
            this.map = new MovieClip();
            this.addChild(this.map);
            this.CHARS = new MovieClip();
            var _local2:DisplayObject = this.addChild(this.CHARS);
            this.CHARS.mouseEnabled = false;
            _local2.x = 0;
            _local2.y = 0;
            this.TRASH = new MovieClip();
            this.addChild(this.TRASH);
            this.TRASH.mouseEnabled = false;
            this.TRASH.visible = false;
            this.TRASH.y = -1000;
            this.zManager = new MovieClip();
            this.addChild(this.zManager);
            this.FG = new MovieClip();
            this.addChild(this.FG);
            this.zManager.removeEventListener(Event.ENTER_FRAME, this.onZmanagerEnterFrame);
            this.autoActionTimer.removeEventListener("timer", this.autoActionHandler);
            this.restTimer.removeEventListener("timer", this.restRequest);
            this.AATestTimer.removeEventListener("timer", this.AATest);
            this.connTestTimer.removeEventListener("timer", this.connTest);
            this.afkTimer.removeEventListener("timer", this.afkTimerHandler);
            this.mvTimer.removeEventListener("timer", this.mvTimerHandler);
            this.mapTimer.removeEventListener(TimerEvent.TIMER, this.mapResizeCheck);
            this.zManager.addEventListener(Event.ENTER_FRAME, this.onZmanagerEnterFrame, false, 0, true);
            this.autoActionTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.autoActionHandler);
            this.restTimer.addEventListener("timer", this.restRequest);
            this.AATestTimer.addEventListener("timer", this.AATest);
            this.connTestTimer.addEventListener("timer", this.connTest);
            this.afkTimer.addEventListener("timer", this.afkTimerHandler);
            this.mvTimer.addEventListener("timer", this.mvTimerHandler);
            this.mapTimer.addEventListener(TimerEvent.TIMER, this.mapResizeCheck, false, 0, true);
            this.mapTimer.start();
            this.initLoaders();
            this.initCutscenes();
        }

        public function initGuildhallData(_arg1:Array):void{
            var _local3:*;
			trace("ARRRR >> 2");
            trace(("gd: " + _arg1));
            var _local2:uint;
            while (_local2 < _arg1.length) {
                trace(("i: " + _local2));
                for (_local3 in _arg1[_local2]) {
                    trace(((((("gd[" + _local2) + "].[") + _local3) + "]: ") + _arg1[_local2][_local3]));
                };
                _local2++;
            };
            this.guildHallData = new GuildHall(_arg1, this.rootClass);
        }

        public function killTimers():void{
            this.autoActionTimer.reset();
            this.restTimer.reset();
            this.AATestTimer.reset();
            this.connTestTimer.reset();
            this.afkTimer.reset();
            this.rootClass.chatF.mute.timer.reset();
            this.autoActionTimer.removeEventListener("timer", this.autoActionHandler);
            this.restTimer.removeEventListener("timer", this.restRequest);
            this.AATestTimer.removeEventListener("timer", this.AATest);
            this.connTestTimer.removeEventListener("timer", this.connTest);
            this.afkTimer.removeEventListener("timer", this.afkTimerHandler);
            this.mvTimer.removeEventListener("timer", this.mvTimerHandler);
            this.rootClass.chatF.mute.timer.removeEventListener("timer", this.rootClass.chatF.unmuteMe);
        }

        public function killListeners():void{
            this.zManager.removeEventListener(Event.ENTER_FRAME, this.onZmanagerEnterFrame);
            removeChild(this.zManager);
        }

        public function queueLoad(_arg1){
            _arg1.retries = 1;
            this.loaderQueue.push(_arg1);
            var _local2:* = this.getFreeLoader();
            if (_local2 != null){
                this.loadNext(_local2);
            };
        }

        public function loaderCallback(_arg1:Event){
            var _local2:* = _arg1.target.loader;
            var _local3:* = this.getLoaderHost(_local2);
            if (_local3 != null){
                if (_local3.callBackA != null){
                    _local3.callBackA(_arg1);
                };
            };
            this.closeLoader(_local3, true);
        }

        public function loaderErrorHandler(_arg1:IOErrorEvent){
            var _local2:String = _arg1.toString();
            var _local3:String = _local2.substr((_local2.indexOf("URL: ") + 5));
            _local3 = _local3.substr(0, (_local3.length - 1));
            var _local4:* = this.getLoaderHostByURL(_local3);
            if (_local4 != null){
                if (_local4.callBackB != null){
                    _local4.callBackB(_arg1);
                };
            };
            this.closeLoader(_local4, false, false);
        }

        private function loaderProgressHandler(_arg1:Event){
            var _local2:* = _arg1.currentTarget;
            var _local3:* = this.getLoaderHostByLoaderInfo(_local2);
            if (_local3 != null){
                _local3.isOpen = true;
            };
        }

        private function loaderTimerComplete(_arg1:TimerEvent):void{
            var _local2:* = this.getLoaderHostByTimer(Timer(_arg1.currentTarget));
            if (_local2 != null){
                _local2.timer.reset();
                if (!_local2.isOpen){
                    if (_local2.loaderData.retries-- > 0){
                        this.loaderQueue.push(_local2.loaderData);
                    };
                    this.closeLoader(_local2, false, true);
                };
            };
        }

        public function getLoaderHost(_arg1){
            var _local2:*;
            for (_local2 in this.loaderManager) {
                if (this.loaderManager[_local2].ldr == _arg1){
                    return (this.loaderManager[_local2]);
                };
            };
            return (null);
        }

        public function getLoaderHostByLoaderInfo(_arg1):Object{
            var _local2:*;
            for (_local2 in this.loaderManager) {
                if (this.loaderManager[_local2].ldr.contentLoaderInfo == _arg1){
                    return (this.loaderManager[_local2]);
                };
            };
            return (null);
        }

        public function getLoaderHostByTimer(_arg1:Timer):Object{
            var _local2:*;
            for (_local2 in this.loaderManager) {
                if (this.loaderManager[_local2].timer == _arg1){
                    return (this.loaderManager[_local2]);
                };
            };
            return (null);
        }

        public function getLoaderHostByURL(_arg1:String):Object{
            var _local2:*;
            for (_local2 in this.loaderManager) {
                if (_arg1.indexOf(this.loaderManager[_local2].url) > -1){
                    return (this.loaderManager[_local2]);
                };
            };
            return (null);
        }

        public function getFreeLoader():Object{
            var _local1:*;
            if (this.loaderQueue.length > 0){
                for (_local1 in this.loaderManager) {
                    if (this.loaderManager[_local1].free){
                        this.loaderManager[_local1].free = false;
                        return (this.loaderManager[_local1]);
                    };
                };
                return (null);
            };
            return (null);
        }

        public function closeLoader(_arg1:Object, _arg2:Boolean=true, _arg3:Boolean=true, _arg4:Boolean=true):void{
            if (_arg3){
                try {
                    _arg1.ldr.unload();
                }
                catch(e:Error) {
                };
            };
            _arg1.free = true;
            _arg1.isOpen = false;
            _arg1.loaderData = null;
            _arg1.timer.reset();
            var _local5:* = this.getFreeLoader();
            if (((!((_local5 == null))) && (_arg4))){
                this.loadNext(_local5);
            };
        }

        public function initLoaders():void{
            var _local1:Object;
            var _local2:*;
            for (_local2 in this.loaderManager) {
                _local1 = this.loaderManager[_local2];
                _local1.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.loaderTimerComplete, false, 0, true);
                _local1.ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, this.loaderCallback, false, 0, true);
                _local1.ldr.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.loaderErrorHandler, false, 0, true);
                _local1.ldr.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.loaderProgressHandler, false, 0, true);
            };
        }

        public function clearLoaders(_arg1:Boolean=false){
            var lmi:Object;
            var i:* = undefined;
            var clearPlayerDomains:Boolean = _arg1;
            for (i in this.loaderManager) {
                lmi = this.loaderManager[i];
                try {
                    lmi.ldr.close();
                }
                catch(e:Error) {
                };
                try {
                    lmi.ldr.unload();
                }
                catch(e:Error) {
                };
                lmi.free = true;
                lmi.isOpen = false;
                lmi.loaderData = null;
                lmi.timer.reset();
                lmi.callBackA = null;
                lmi.callBackB = null;
            };
            if (clearPlayerDomains){
                this.playerDomains = {};
            };
            this.loaderD = new ApplicationDomain(ApplicationDomain.currentDomain);
            this.loaderC = new LoaderContext(false, this.loaderD);
            this.loaderQueue = [];
        }

        public function killLoaders(){
            var _local1:Object;
            var _local2:*;
            for (_local2 in this.loaderManager) {
                _local1 = this.loaderManager[_local2];
                _local1.free = true;
                _local1.isOpen = false;
                _local1.loaderData = null;
                _local1.timer.reset();
                _local1.callBackA = null;
                _local1.callBackB = null;
            };
            this.loaderQueue = [];
        }

        public function loadNext(_arg1:Object){
            if (this.loaderQueue.length > 0){
                this.loadNextWith(_arg1, this.loaderQueue.shift());
            };
        }

        private function loadNextWith(_arg1:Object, _arg2:Object):void{
            var _local3:URLRequest;
            var _local4:LoaderContext = this.loaderC;
            if (_arg1 != null){
                _arg1.free = false;
                if (_arg2.callBackA != null){
                    _arg1.callBackA = _arg2.callBackA;
                }
                else {
                    _arg1.callBackA = null;
                };
                if (_arg2.callBackB != null){
                    _arg1.callBackB = _arg2.callBackB;
                }
                else {
                    _arg1.callBackB = null;
                };
                if (((((!((_arg2.avt == null))) && ((_arg2.avt == this.myAvatar)))) && (!((_arg2.sES == null))))){
                    _local4 = this.mapPlayerAssetClass(_arg2.sES);
                };
                _local3 = new URLRequest(_arg2.strFile);
                _arg1.ldr.load(_local3, _local4);
                _arg1.url = _local3.url;
                _arg1.isOpen = false;
                _arg1.loaderData = _arg2;
                _arg1.timer.reset();
                _arg1.timer.start();
            }
            else {
                trace();
                trace("** No available loader found, event flow may terminate");
                trace();
            };
        }

        private function mapPlayerAssetClass(_arg1:String):LoaderContext{
            if (this.playerDomains[_arg1] == null){
                this.playerDomains[_arg1] = {};
                this.playerDomains[_arg1].loaderD = new ApplicationDomain(ApplicationDomain.currentDomain);
                this.playerDomains[_arg1].loaderC = new LoaderContext(false, this.playerDomains[_arg1].loaderD);
            };
            return (this.playerDomains[_arg1].loaderC);
        }

        public function getClass(_arg1:String):Class{
            var _local3:Class;
            var _local4:String;
            var _local2:Object = {};
            try {
                _local3 = (getDefinitionByName(_arg1) as Class);
                if (_local3 != null){
                    return (_local3);
                };
            }
            catch(e:Error) {
            };
            try {
                _local3 = (this.rootClass.assetsDomain.getDefinition(_arg1) as Class);
                if (_local3 != null){
                    return (_local3);
                };
            }
            catch(e:Error) {
            };
            try {
                _local3 = (this.loaderD.getDefinition(_arg1) as Class);
                if (_local3 != null){
                    return (_local3);
                };
            }
            catch(e:Error) {
            };
            for (_local4 in this.playerDomains) {
                if (this.playerDomains[_local4].loaderD.hasDefinition(_arg1)){
                    return ((this.playerDomains[_local4].loaderD.getDefinition(_arg1) as Class));
                };
            };
            trace((("getClass() could not find " + _arg1) + "!"));
            return (null);
        }
		
		public function onMapBGMLoadComplete(evt:Event):void {
			trace("PLAYING MUSIC");
			BGMChannel = s.play(0, 9999);
		}

        public function loadMap(_arg1:String, _arg2:String){
            if (_arg1.indexOf("cdn.aqworlds.com") == -1){
                _arg1 = ((this.rootClass.getFilePath() + "maps/") + _arg1);
            };
			if (_arg2.indexOf("cdn.aqworlds.com") == -1 && this.rootClass.mixer.bSoundOn != false){
				s = new Sound();
				s.addEventListener(Event.COMPLETE, onMapBGMLoadComplete, false, 0, true);
				SoundMixer.stopAll();
				BGMChannel.stop();
				s.load(new URLRequest(this.rootClass.getFilePath() + "maps/BGMs/" + _arg2));
            };
            this.rootClass.mcConnDetail.showConn("Loading Map Files...");
			this.rootClass.mcConnDetail.logo.alpha = 0;
            if (this.map != null){
                this.map.gotoAndStop("Wait");
                this.removeChild(this.map);
                this.map = null;
            };
            this.ldr_map.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onMapLoadComplete);
            this.ldr_map.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onMapLoadError);
            this.ldr_map.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.onMapLoadProgress);
            this.ldr_map = new Loader();
            this.ldr_map.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onMapLoadComplete, false, 0, true);
            this.ldr_map.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onMapLoadError, false, 0, true);
            this.ldr_map.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.onMapLoadProgress, false, 0, true);
            this.ldr_map.load(new URLRequest(_arg1));
            this.rootClass.clearPopups();
        }

        public function removeMapListeners():void{
            this.ldr_map.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onMapLoadComplete);
            this.ldr_map.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onMapLoadError);
            this.ldr_map.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.onMapLoadProgress);
        }

        private function onMapLoadProgress(_arg1:ProgressEvent):void{
            var _local2:int = Math.floor(((_arg1.bytesLoaded / _arg1.bytesTotal) * 100));
			var m:int = Math.pow(10, 3);
            var meth:Number = Math.round((_arg1.bytesLoaded / _arg1.bytesTotal) * m) / m;
            this.rootClass.mcConnDetail.showConn(("Loading Map... " + _local2+"%"));
			this.rootClass.mcConnDetail.logo.alpha = meth;
			
			//this.rootClass.mcConnDetail.loading_bar.visible = true;
			//this.rootClass.mcConnDetail.loading_bar.scaleX = Math.floor(((_arg1.bytesLoaded / _arg1.bytesTotal) * 100));
        }

        private function onMapLoadError(_arg1:IOErrorEvent){
            trace(("Mapload failed: " + _arg1));
            this.mapLoadInProgress = false;
			//this.rootClass.mcConnDetail.loading_bar.visible = false;
            this.rootClass.mcConnDetail.showError("Loading Map Files... Failed!");
        }

        private function onMapLoadComplete(_arg1:Event){
            trace(("Mapload complete: " + _arg1));
            trace(_arg1.target.url);
			//this.rootClass.mcConnDetail.loading_bar.visible = false;
            this.rootClass.ui.visible = true;
            this.mapLoadInProgress = false;
            this.map = MovieClip(this.ldr_map.content);
            addChildAt(this.map, 0).x = 0;
            this.CHARS.x = 0;
            this.resetSpawnPoint();
            if (((!((this.mondef == null))) && (this.mondef.length))){
                this.initMonsters(this.mondef, this.monmap);
            } else {
                this.enterMap();
            };
            if (this.isMyHouse()){
                this.rootClass.ui.mcPopup.fOpen("House");
            };
        }

        public function reloadCurrentMap():void{
            this.clearMonstersAndProps();
            this.loadMap(((this.strMapFileName + "?") + Math.random()));
        }

        public function enterMap():void{
            var _local1:* = this.uoTreeLeaf(this.rootClass.sfc.myUserName);
            if ((((this.intType == 0)) || ((this.returnInfo == null)))){
				if(isCoordinates != 1){
					this.moveToArea(_local1.tx, _local1.ty, _local1.strFrame, _local1.strPad, _local1.fly);
					isCoordinates == 0;
				} else {
					this.moveToCell(_local1.strFrame, _local1.strPad);
					isCoordinates == 0;
				}
            } else {
				
				if(isCoordinates == 1){
					trace("SPAWN2AREA");
					this.moveToArea(_local1.tx, _local1.ty, _local1.strFrame, _local1.strPad, _local1.fly);
					this.returnInfo = null;
					isCoordinates == 0;
				} else {
					trace("MOVETOCELL");
					this.moveToCell(this.returnInfo.strCell, this.returnInfo.strPad);
					this.returnInfo = null;
					isCoordinates == 0;
				}
            };
            this.initMapEvents();
            this.rootClass.mcConnDetail.hideConn();
            this.rootClass.ui.mcInterface.areaList.visible = true;
			
			
            if (this.myAvatar != null){
				//trace("ASDSAD");
				//trace("LOCATION: " + myAvatar.pMC.location);
                this.rootClass.showPortrait(this.myAvatar);
            };
        }

        public function setReturnInfo(_arg1:String, _arg2:String, _arg3:String):void{
            this.returnInfo = new Object();
            this.returnInfo.strMap = _arg1;
            this.returnInfo.strCell = _arg2;
            this.returnInfo.strPad = _arg3;
        }
		
		public function setCoordinatesInfo(_arg1:String, _arg2:String, _arg3:String):void{
            this.returnInfo = new Object();
            this.returnInfo.strMap = _arg1;
            this.returnInfo.tx = _arg2;
            this.returnInfo.ty = _arg3;
        }

        public function exitCell():void{
            this.mvTimerKill();
            this.exitCombat();
            this.rootClass.clearPopups(["House"]);
            if (this.myAvatar != null){
                this.myAvatar.targets = {};
                if (this.myAvatar.pMC != null){
                    this.myAvatar.pMC.stopWalking();
                };
                if (this.myAvatar.petMC != null){
                    this.myAvatar.petMC.stopWalking();
                };
                if (this.myAvatar.target != null){
                    this.setTarget(null);
                };
            };
            if (this.strFrame != "Wait"){
                this.clearMonstersAndProps();
                this.hideAllAvatars();
            };
            this.rootClass.sfcSocial = false;
            this.rootClass.ui.mcInterface.areaList.gotoAndStop("init");
        }

        public function moveToCell(_arg1:String, _arg2:String, _arg3:Boolean=false):void{
            var _local4:*;
            var _local5:*;
            this.afkPostpone();
			this.vendingPostpone();
            if ((((((this.objLock == null)) || ((this.objLock[_arg1] == null)))) || ((this.objLock[_arg1] <= this.intKillCount)))){
                if (this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()].freeze == null){
                    _local4 = [];
                    this.actionReady = false;
                    this.bitWalk = false;
                    _local5 = {};
                    _local5.strFrame = _arg1;
                    _local5.strPad = _arg2;
                    if (_arg2.toLowerCase() != "none"){
                        _local5.tx = 0;
                        _local5.ty = 0;
                    };
                    this.uoTreeLeafSet(this.rootClass.sfc.myUserName, _local5);
                    this.strFrame = _arg1;
                    this.strPad = _arg2;
                    if ((((this.strAreaName.indexOf("battleon") < 0)) || ((this.strAreaName.indexOf("battleontown") > -1)))){
                        this.rootClass.menuClose();
                    };
                    if (!_arg3){
                        this.rootClass.sfc.sendXtMessage("zm", "moveToCell", [_arg1, _arg2], "str", this.curRoom);
                    };
                    this.exitCell();
                    this.map.gotoAndPlay("Blank");
                };
            };
        }
		
		public function moveToArea(_arg1:String, _arg2:String, _arg3:String, _arg4:String, _arg5:int, _arg6:Boolean=false):void{
			
			trace("MOVE TO AREA: X;" + _arg1 + " Y; " + _arg2);
			isCoordinates == 1
            var _local4:*;
            var _local5:*;
            this.afkPostpone();
			this.vendingPostpone();
            if ((((((this.objLock == null)) || ((this.objLock[_arg1] == null)))) || ((this.objLock[_arg1] <= this.intKillCount)))){
                if (this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()].freeze == null){
                    _local4 = [];
                    this.actionReady = false;
                    this.bitWalk = false;
                    _local5 = {};
					_local5.tx = _arg1;
					_local5.ty = _arg2;
                    _local5.strFrame = _arg3;
                    _local5.strPad = _arg4;
					_local5.fly = _arg5;
					trace(_arg3 + " " + _arg5);
                    this.uoTreeLeafSet(this.rootClass.sfc.myUserName, _local5);
                    this.strFrame = _arg3;
                    this.strPad = _arg4;
                    if ((((this.strAreaName.indexOf("battleon") < 0)) || ((this.strAreaName.indexOf("battleontown") > -1)))){
                        this.rootClass.menuClose();
                    };
                    if (!_arg6){
                        this.rootClass.sfc.sendXtMessage("zm", "moveToArea", [_arg1, _arg2, _arg3, _arg4, _arg5], "str", this.curRoom);
                    };
                    this.exitCell();
                    this.map.gotoAndPlay("Blank");
                };
            };
        }

        public function moveToCellByIDa(_arg1:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "mtcid", [_arg1], "str", this.curRoom);
        }

        public function moveToCellByIDb(_arg1:int):void{
            var _local2:MovieClip;
            var _local3:int;
            while (_local3 < this.arrEvent.length) {
                _local2 = (this.arrEvent[_local3] as MovieClip);
                if (((((("tID" in _local2)) && ((_local2.tID == _arg1)))) || ((((_local2.name.indexOf("ia") == 0)) && ((int(_local2.name.substr(2)) == _arg1)))))){
                    this.moveToCell(_local2.tCell, _local2.tPad, true);
                };
                _local3++;
            };
        }

        public function hideAllAvatars():void{
            var _local1:*;
            for (_local1 in this.avatars) {
                if (((!((this.avatars[_local1] == null))) && (!((this.avatars[_local1].pMC == null))))){
                    this.avatars[_local1].hideMC();
                };
            };
        }

        public function clearAllAvatars():void{
            var _local1:String;
            for (_local1 in this.avatars) {
                this.destroyAvatar(Number(_local1));
            };
            this.avatars = new Object();
        }

        public function clearMonstersAndProps():void{
            var _local2:DisplayObject;
            var _local3:*;
            var _local1:int;
            _local1 = 0;
            while (_local1 < this.CHARS.numChildren) {
                _local2 = this.CHARS.getChildAt(_local1);
                if (((_local2.hasOwnProperty("isProp")) && (MovieClip(_local2).isProp))){
                    this.CHARS.removeChild(_local2);
                    _local1--;
                }
                else {
                    if (((_local2.hasOwnProperty("isHouseItem")) && (MovieClip(_local2).isHouseItem))){
                        _local2.removeEventListener(MouseEvent.MOUSE_DOWN, this.onHouseItemClick);
                        this.CHARS.removeChild(_local2);
                        _local1--;
                    }
                    else {
                        if (((_local2.hasOwnProperty("isMonster")) && (MovieClip(_local2).isMonster))){
                            MovieClip(_local2).fClose();
                            _local1--;
                        };
                    };
                };
                _local1++;
            };
            _local1 = 0;
            while (_local1 < this.TRASH.numChildren) {
                _local2 = this.TRASH.getChildAt(_local1);
                if (((_local2.hasOwnProperty("isMonster")) && (MovieClip(_local2).isMonster))){
                    MovieClip(_local2).fClose();
                    _local1--;
                };
                _local1++;
            };
            _local1 = 0;
            while (_local1 < this.monsters.length) {
                this.monsters[_local1].pMC = null;
                _local1++;
            };
            while (this.rootClass.ui.mcPadNames.numChildren) {
                _local3 = this.rootClass.ui.mcPadNames.getChildAt(0);
                MovieClip(_local3).stop();
                this.rootClass.ui.mcPadNames.removeChild(_local3);
            };
        }

        public function setMapEvents(_arg1:Object):void{
            this.mapEvents = _arg1;
        }

        public function initMapEvents():void{
            if (((("eventUpdate" in this.map)) && (!((this.mapEvents == null))))){
                this.map.eventUpdate({
                    cmd:"event",
                    args:this.mapEvents
                });
            };
            this.mapEvents = null;
        }

        public function setCellMap(_arg1:Object):void{
            this.cellMap = _arg1;
        }

        public function updateCellMap(_arg1:Object):void{
            var _local3:String;
            var _local4:MovieClip;
            var _local5:String;
            var _local2:Object = {};
            for (_local3 in this.cellMap) {
                _local2 = this.cellMap[_local3];
                if (((!((_local2.ias == null))) && (!((_local2.ias[_arg1.ID] == null))))){
                    for (_local5 in _arg1) {
                        _local2.ias[_arg1.ID][_local5] = _arg1[_local5];
                    };
                };
            };
            try {
                _local4 = MovieClip(this.CHARS.getChildByName(("ia" + _arg1.ID)));
                _local4.update();
                return;
            }
            catch(e:Error) {
            };
            try {
                _local4 = MovieClip(this.map.getChildByName(("ia" + _arg1.ID)));
                _local4.update();
            }
            catch(e:Error) {
            };
        }
		/*
        public function onWalkClick(e:Event=null):void{
			
        }
		*/
		public function onWalkClick(e:Event=null):void
        {
            var cLeaf:Object;
            var aura:Object;
            var p:Point;
            var mvPT:* = undefined;
            var e = e;
            trace("onWalkClick >");
            cLeaf = myAvatar.dataLeaf;
            for each (aura in cLeaf.auras) {
                try {
                    if (aura.cat != null){
                        if (aura.cat == "stun"){
                            return;
                        };
                        if (aura.cat == "stone"){
                            return;
                        };
						if (aura.cat == "freeze"){
                            return;
                        };
                        if (aura.cat == "disabled"){
                            return;
                        };
                    };
                } catch(e:Error) {
                    trace(("world.onWalkClick > " + e));
                };
            };
            p = new Point(mouseX, mouseY);
            if (bitWalk){
                afkPostpone();
				vendingPostpone();
                if ((((((((mouseX >= 0)) && ((mouseX <= 1260)))) && ((mouseY >= 0)))) && ((mouseY <= 500)))){
                    p = CHARS.globalToLocal(p);
                    p.x = Math.round(p.x);
                    p.y = Math.round(p.y);
                    mvPT = myAvatar.pMC.simulateTo(p.x, p.y, WALKSPEED);
                    if (((!((mvPT == null))) && ((Point.distance(mvPT, myAvatar.pMC.location) > 5)))){
						//trace("OOPSIE");
                        myAvatar.pMC.walkTo(mvPT.x, mvPT.y, WALKSPEED);
                        if (bPvP){
                            pushMove(myAvatar.pMC, mvPT.x, mvPT.y, WALKSPEED);
                        } else {
                            if (clickOnEventTest(mvPT.x, mvPT.y)){
                                pushMove(myAvatar.pMC, mvPT.x, mvPT.y, WALKSPEED);
                            } else {
                                moveRequest({
                                    mc:myAvatar.pMC,
                                    tx:mvPT.x,
                                    ty:mvPT.y,
                                    sp:WALKSPEED
                                });
                            };
                        };
                    };
                };
            };
        }

        public function clickOnEventTest(_arg1:int, _arg2:int):Boolean{
            var _local3:Rectangle = this.myAvatar.pMC.shadow.getBounds(this);
            var _local4:Rectangle = new Rectangle();
            _local3.x = (_arg1 - (_local3.width / 2));
            _local3.y = (_arg2 - (_local3.height / 2));
            var _local5:int;
            while (_local5 < this.arrEvent.length) {
                _local4 = this.arrEvent[_local5].shadow.getBounds(this);
                if (_local3.intersects(_local4)){
                    return (true);
                };
                _local5++;
            };
            return (false);
        }
		/*
        public function moveRequest(_arg1:Object):void{
            if (!this.mvTimer.running){
                this.pushMove(_arg1.mc, _arg1.tx, _arg1.ty, _arg1.sp);
                this.mvTimer.reset();
                this.mvTimer.start();
            }
            else {
                this.mvTimerObj = _arg1;
            };
        }
		*/
		
		public function moveRequest(o:Object):void
        {
            if (!(mvTimer.running)){
                pushMove(o.mc, o.tx, o.ty, o.sp);
                mvTimer.reset();
                mvTimer.start();
            } else {
                mvTimerObj = o;
            };
        }

        public function mvTimerHandler(_arg1:TimerEvent):void{
            var _local2:Object = {};
            if (this.mvTimerObj != null){
                this.pushMove(this.mvTimerObj.mc, this.mvTimerObj.tx, this.mvTimerObj.ty, this.mvTimerObj.sp);
                this.mvTimerObj = null;
                this.mvTimer.reset();
                this.mvTimer.start();
            };
        }

        public function mvTimerKill():void{
            this.mvTimer.reset();
            this.mvTimerObj = null;
        }
		/*
        public function pushMove(_arg1:MovieClip, _arg2:int, _arg3:int, _arg4:int){
            var _local5:* = {};
            _local5.tx = int(_arg2);
            _local5.ty = int(_arg3);
            _local5.sp = int(_arg4);
            this.uoTreeLeafSet(this.rootClass.sfc.myUserName, _local5);
            this.rootClass.sfc.sendXtMessage("zm", "mv", [_arg2, _arg3, _arg4], "str", this.curRoom);
        }*/
		public function pushMove(_arg1:MovieClip, tx:int, ty:int, sp:int){
            var _local5:* = {};
            _local5.tx = int(tx);
            _local5.ty = int(ty);
            _local5.sp = int(sp);
            this.uoTreeLeafSet(this.rootClass.sfc.myUserName, _local5);
            this.rootClass.sfc.sendXtMessage("zm", "mv", [tx, ty, sp], "str", this.curRoom);
        }
		
		public function ToFly(mc:MovieClip, tx:int, ty:int, sp:int, fly:int=-1)
        {
            var uoLeafSet:*;
            var request:*;
            uoLeafSet = {};
            uoLeafSet.tx = int(tx);
            uoLeafSet.ty = int(ty);
            uoLeafSet.sp = int(sp);
            request = [tx, ty, sp];
            if (((!((fly == -1))) && (!((myAvatar.dataLeaf.fly == Boolean(fly)))))){
                uoLeafSet.fly = Boolean(fly);
                myAvatar.pMC.fly = uoLeafSet.fly;
                request.push(fly);
            };
			trace("REQUEST: " + request);
            uoTreeLeafSet(rootClass.sfc.myUserName, uoLeafSet);
            rootClass.sfc.sendXtMessage("zm", "fly", request, "str", curRoom);
        }

        public function monstersToPads(){
            var _local1:*;
            var _local2:*;
            for (_local1 in this.monsters) {
                _local2 = this.monsters[_local1];
                if (((!((_local2.objData == null))) && ((_local2.objData.strFrame == this.strFrame)))){
                    _local2.pMC.walkTo(_local2.pMC.ox, _local2.pMC.oy, (this.WALKSPEED * 1.4));
                };
            };
        }

        public function updatePadNames(){
            var _local2:*;
            var _local1:int;
            while (_local1 < this.rootClass.ui.mcPadNames.numChildren) {
                _local2 = MovieClip(this.rootClass.ui.mcPadNames.getChildAt(_local1));
                if ((((((this.objLock == null)) || ((this.objLock[_local2.tCell] == null)))) || ((this.objLock[_local2.tCell] <= this.intKillCount)))){
                    _local2.cnt.lock.visible = false;
                }
                else {
                    _local2.cnt.lock.visible = true;
                };
                _local1++;
            };
        }
		
		public function updateLocation(){
           trace("LOCATION");
			var p:*;
			
			p = myAvatar.pMC.location;
			trace("AVATAR: " + p);
			mapScrollCheck();
			//pushMove(this.myAvatar.pMC, p.x, p.y, 8);
			/*trace("IS FLY: " + myAvatar.objData.intLevel);
			if(myAvatar.pMC.fly == 1){
				trace("IS FLYING");
			} else {
				trace("NOT FLYING");
			}*/
			/*
			
			if(myAvatar.pMC.fly == 1){
				var uoLeaf:*;
				var tarPt:Point;
				uoLeaf = uoTree[rootClass.sfc.myUserName];
				tarPt = this.myAvatar.pMC.simulateJumpUp();
				this.myAvatar.pMC.GroundToFly();
                ToFly(this.myAvatar.pMC, tarPt.x, tarPt.y, 0, int(!(uoLeaf.fly)));
			}*/
			trace("PLAYING");
        }
		
		/*
		public function loadBGM():void{
            var _local1:Class;
            if (this.loaderInfo.url.toLowerCase().indexOf("file://") != 0){
				LoginBGM.load(new URLRequest("Gamefiles/maps/BGMs/" + params.sBGM));
				LoginBGM.addEventListener(Event.COMPLETE, onBGMLoadComplete, false, 0, true);
				trace("BGM loading");
            };
        }
		*/
		
		/*
        public function cellSetup(_arg1:Number, _arg2:Number, _arg3:Boolean, _arg4:String):void{
            var _local4:Bitmap;
            var _local9:DisplayObject;
            var _local10:uint;
            var _local11:DisplayObject;
            var _local12:*;
			var cell:*;
            var _local13:Array;
            var _local14:Avatar;
            var _local15:*;
            trace("cellSetup");
			map.x = (map.y = 0);
            this.SCALE = _arg1;
            this.WALKSPEED = _arg2;
			this.SCROLL = _arg3;
			this.CELL_MODE = _arg4;
            this.arrSolid = new Array();
            this.arrEvent = new Array();
            var _local5:BitmapData = new BitmapData(960, 550, true, 0);
            var _local6:Array = [];
            trace(("extra: " + this.objExtra["bMonName"]));
            var _local7 = (Number(this.objExtra["bMonName"]) == 1);
            var _local8:int;
			cell = map;
			
            if (cell.walk != null){
				trace("AW");
				cell.walk.addEventListener(MouseEvent.CLICK, onWalkClick, false, 0, true);
				trace("AW2");
                //cell.walk.addEventListener(MouseEvent.CLICK, onWalkClick, false, 0, true);
            };
            while (_local8 < this.map.numChildren) {
                _local9 = this.map.getChildAt(_local8);
                if ((_local9 is MovieClip)){
                    if (MovieClip(_local9).hasPads){
                        trace("movieclip has pads");
                        _local10 = 0;
                        while (_local10 < MovieClip(_local9).numChildren) {
                            _local11 = MovieClip(_local9).getChildAt(_local10);
                            if ((((((_local11 is MovieClip)) && (MovieClip(_local11).isEvent))) && (!(MovieClip(_local11).isProp)))){
                                this.arrEvent.push(MovieClip(_local11));
                            };
                            if ((((_local11 is MovieClip)) && (MovieClip(_local11).isSolid))){
                                this.arrSolid.push(MovieClip(_local9));
                            };
                            _local10++;
                        };
                    };
                };
                if ((((_local9 is MovieClip)) && (MovieClip(_local9).isSolid))){
                    this.arrSolid.push(MovieClip(_local9));
                };
                if ((((_local9 is MovieClip)) && (("walk" in _local9)))){
                    MovieClip(_local9).btnWalkingArea.useHandCursor = false;
                };
                if ((((((_local9 is MovieClip)) && (MovieClip(_local9).isEvent))) && (!(MovieClip(_local9).isProp)))){
                    this.arrEvent.push(MovieClip(_local9));
                };
                if ((((_local9 is MovieClip)) && (MovieClip(_local9).isMonster))){
                    _local12 = [];
                    _local13 = this.getMonsters(MovieClip(_local9).MonMapID);
                    for each (_local14 in _local13) {
                        if (_local14 == null){
                            trace("No Monster Definition found for Pad!");
                        }
                        else {
                            _local14.pMC = this.createMonsterMC(MovieClip(_local9), _local14.objData.MonID, _local7);
                            _local14.pMC.scale(this.SCALE);
                            _local14.pMC.pAV = _local14;
                            _local14.pMC.setData();
                            if (_local14.dataLeaf == null){
                                this.TRASH.addChild(_local14.pMC);
                            };
                        };
                    };
                };
                if ((((_local9 is MovieClip)) && (MovieClip(_local9).isProp))){
                    _local15 = this.CHARS.addChild(_local9);
                    if (MovieClip(_local15).isEvent){
                        this.arrEvent.push(MovieClip(_local15));
                        MovieClip(_local15).isEvent = false;
                    };
                    _local8--;
                };
                if ((((((((((_local9 is MovieClip)) && ((_local9.width > 700)))) && (!(("isSolid" in _local9))))) && (!(("walk" in _local9))))) && (!(("btnSkip" in _local9))))){
                    MovieClip(_local9).mouseEnabled = false;
                    MovieClip(_local9).mouseChildren = false;
                };
                if ((((((((((_local9 is MovieClip)) && ((_local9.width >= 1260)))) && (!(("isSolid" in _local9))))) && (!(("walk" in _local9))))) && (!(("btnSkip" in _local9))))){
                };
                _local8++;
            };
            this.buildBoundingRects();
            if (this.map.bounds != null){
                this.mapBoundsMC = (this.map.getChildByName("bounds") as MovieClip);
            };
            //this.rebuildMapBMP(this.map);
            this.playerInit();
            this.updateMonsters();
            this.updatePadNames();
            if (this.objHouseData != null){
                this.updateHouseItems();
            };
            if (this.guildHallData != null){
                this.guildHallData.updateInterior();
            };
			*/
        public function cellSetup(intScale:Number, intSpeed:Number, bitScroll:Boolean, strMode:String):void
        {
            var bmp:Bitmap;
            var bmd:BitmapData;
            var bma:Array;
            var cell:*;
            var i:int;
            var child:DisplayObject;
            var monArr:*;
            var Mons:Array;
            var Mon:Avatar;
            var oref:*;
            trace("cellSetup");
            CHARS.x = (CHARS.y = 0);
            map.x = (map.y = 0);
            CELL_MODE = strMode;
            SCALE = intScale;
            WALKSPEED = intSpeed;
            SCROLL = bitScroll;
            arrSolid = new Array();
            arrEvent = new Array();
            bmd = new BitmapData(1260, 550, true, 0);
            bma = [];
            cell = map;
            if (cell.walk != null){
				trace("AW");
                cell.walk.addEventListener(MouseEvent.CLICK, onWalkClick, false, 0, true);
            };
            i = 0;
            while (i < cell.numChildren) {
                child = cell.getChildAt(i);
                if ((((child is MovieClip)) && (MovieClip(child).isSolid))){
                    arrSolid.push(MovieClip(child));
                };
                if ((((child is MovieClip)) && (("walk" in child)))){
                    MovieClip(child).btnWalkingArea.useHandCursor = false;
                    MovieClip(child).btnWalkingArea.addEventListener(MouseEvent.CLICK, onWalkClick, false, 0, true);
                };
                if ((((((child is MovieClip)) && (MovieClip(child).isEvent))) && (!(MovieClip(child).isProp)))){
                    arrEvent.push(MovieClip(child));
                };
                if ((((child is MovieClip)) && (MovieClip(child).isMonster))){
                    monArr = [];
                    Mons = getMonsters(MovieClip(child).MonMapID);
                    for each (Mon in Mons) {
                        if (Mon == null){
                            trace("No Monster Definition found for Pad!");
                        } else {
                            Mon.pMC = createMonsterMC(MovieClip(child), Mon.objData.MonID);
                            Mon.pMC.scale(SCALE);
                            Mon.pMC.pAV = Mon;
                            if (Mon.dataLeaf == null){
                                TRASH.addChild(Mon.pMC);
                            };
                        };
                    };
                };
                if ((((child is MovieClip)) && (MovieClip(child).isProp))){
                    oref = CHARS.addChild(child);
                    if (MovieClip(oref).isEvent){
                        arrEvent.push(MovieClip(oref));
                        MovieClip(oref).isEvent = false;
                    };
                    i--;
                };
                if ((((((((((((child is MovieClip)) && ((child.width > 700)))) && (!(("isSolid" in child))))) && (!(("walk" in child))))) && (!(("btnSkip" in child))))) && (!((child.name == "walk"))))){
                    MovieClip(child).mouseEnabled = false;
                    MovieClip(child).mouseChildren = false;
                };
                if ((((((((((child is MovieClip)) && ((child.width >= 1260)))) && (!(("isSolid" in child))))) && (!(("walk" in child))))) && (!(("btnSkip" in child))))){
                };
                i++;
            };
            buildBoundingRects();
            if (map.bounds != null){
                mapBoundsMC = (map.getChildByName("bounds") as MovieClip);
            };
			//rebuildMapBMP(map);
            playerInit();
            updateMonsters();
            updatePadNames();
			updateLocation();
            if (objHouseData != null){
                updateHouseItems();
            };
			trace("ARRRR");
			if (guildHallData != null){
				trace("USER HAS ARRRR");
                guildHallData.updateInterior();
            };
            trace("exit cellSetup");
        }

        private function buildBoundingRects():void{
            var _local2:Rectangle;
            var _local3:MovieClip;
            var _local1:int;
            this.arrEventR = [];
            this.arrSolidR = [];
            _local1 = 0;
            while (_local1 < this.arrEvent.length) {
                _local3 = this.arrEvent[_local1];
                _local2 = _local3.getBounds(this.rootClass.stage);
                this.arrEventR.push(_local2);
                _local1++;
            };
            _local1 = 0;
            while (_local1 < this.arrSolid.length) {
                _local3 = this.arrSolid[_local1];
                _local2 = _local3.getBounds(this.rootClass.stage);
                this.arrSolidR.push(_local2);
                _local1++;
            };
        }

        public function killWalkObjects():void{
            var _local2:DisplayObject;
            var _local1:int;
            while (_local1 < this.map.numChildren) {
                _local2 = this.map.getChildAt(_local1);
                if ((((_local2 is MovieClip)) && (MovieClip(_local2).isEvent))){
                    removeEventListener("enter", MovieClip(_local2).onEnter);
                };
                _local1++;
            };
        }

        public function exitQuest():void{
            if (this.returnInfo != null){
                this.rootClass.sfc.sendXtMessage("zm", "cmd", ["tfer", this.rootClass.sfc.myUserName, this.returnInfo.strMap, this.returnInfo.strCell, this.returnInfo.strPad], "str", this.curRoom);
            };
        }

        public function gotoTown(_arg1:String, _arg2:String, _arg3:String):void{
            var _local4:* = this.uoTree[this.rootClass.sfc.myUserName];
            if (_local4.intState == 0){
                this.rootClass.chatF.pushMsg("warning", "You are dead!", "SERVER", "", 0);
            }
            else {
                if (((!(this.rootClass.world.myAvatar.invLoaded)))){
                    this.rootClass.MsgBox.notify("Character still being loaded.");
                }
                else {
                    if (this.coolDown("tfer")){
                        this.rootClass.MsgBox.notify(("Joining " + _arg1));
                        this.setReturnInfo(_arg1, _arg2, _arg3);
                        this.rootClass.sfc.sendXtMessage("zm", "cmd", ["tfer", this.rootClass.sfc.myUserName, _arg1, _arg2, _arg3], "str", this.curRoom);
                        if ((((this.strAreaName.indexOf("battleon") < 0)) || ((this.strAreaName.indexOf("battleontown") > -1)))){
                            this.rootClass.menuClose();
                        };
                    }
                    else {
                        this.rootClass.MsgBox.notify("You must wait 5 seconds before joining another map.");
                    };
                };
            };
        }

        public function gotoQuest(_arg1:String, _arg2:String, _arg3:String):void{
            this.gotoTown(_arg1, _arg2, _arg3);
        }

        public function openApop(_arg1){
            var _local2:MovieClip;
            if (((this.isMovieFront("Apop")) || (((!(("frame" in _arg1))) || (((("frame" in _arg1)) && (("cnt" in _arg1)))))))){
                this.rootClass.menuClose();
                _local2 = this.attachMovieFront("Apop");
                _local2.update(_arg1);
            };
        }

        public function setSpawnPoint(_arg1, _arg2):void{
            this.spawnPoint.strFrame = _arg1;
            this.spawnPoint.strPad = _arg2;
        }

        public function resetSpawnPoint():void{
            this.spawnPoint.strFrame = "Enter";
            this.spawnPoint.strPad = "Spawn";
        }

        public function initObjExtra(_arg1:String):void{
            var _local2:Array;
            var _local3:int;
            var _local4:Array;
            this.objExtra = new Object();
            if (((!((_arg1 == null))) && (!((_arg1 == ""))))){
                _local2 = _arg1.split(",");
                _local3 = 0;
                while (_local3 < _local2.length) {
                    _local4 = _local2[_local3].split("=");
                    this.objExtra[_local4[0]] = _local4[1];
                    _local3++;
                };
            };
        }

        public function initObjInfo(_arg1:String):void{
            var _local2:Array;
            var _local3:int;
            var _local4:Array;
            this.objInfo = new Object();
            if (((!((_arg1 == null))) && (!((_arg1 == ""))))){
                _local2 = _arg1.split(",");
                _local3 = 0;
                while (_local3 < _local2.length) {
                    _local4 = _local2[_local3].split("=");
                    this.objInfo[_local4[0]] = _local4[1];
                    _local3++;
                };
            };
        }

        private function rasterize(_arg1:Array, _arg2:Boolean=false):void{
            var _local5:Object;
            var _local6:Point;
            var _local7:Matrix;
            var _local8:String;
            var _local9:DisplayObject;
            trace("rasterize");
            this.mapNW = this.rootClass.stage.stageWidth;
            trace("line 572");
            var _local3:Number = (this.mapNW / this.mapW);
            var _local4:int;
            this.mapNH = Math.round((this.mapH * _local3));
            trace("line 577");
            for each (_local5 in _arg1) {
                _local5.child.x = _local5.x;
                if (_local5.bmd != null){
                    _local5.bmd.dispose();
                };
                _local5.bmd = new BitmapData(this.mapNW, this.mapNH, true, 0x999999);
                _local6 = new Point(0, 0);
                _local6 = _local5.child.globalToLocal(_local6);
                _local7 = new Matrix((_local3 * _local5.child.transform.matrix.a), 0, 0, (_local3 * _local5.child.transform.matrix.d), -(((_local6.x * _local3) * _local5.child.transform.matrix.a)), -(((_local6.y * _local3) * _local5.child.transform.matrix.d)));
                _local5.bmd.draw(_local5.child, _local7, _local5.child.transform.colorTransform, null, new Rectangle(0, 0, this.mapNW, this.mapNH), false);
                _local5.bm = new Bitmap(_local5.bmd);
                _local8 = String(("bmp" + _local4));
                _local9 = _local5.child.parent.getChildByName(_local8);
                if (_local9 != null){
                    _local5.child.parent.removeChild(_local9);
                };
                _local5.bmDO = _local5.child.parent.addChildAt(_local5.bm, (_local5.child.parent.getChildIndex(_local5.child) + 1));
                _local5.bmDO.name = _local8;
                _local5.bmDO.width = this.mapW;
                _local5.bmDO.height = this.mapH;
                _local5.child.visible = false;
                if (_arg2){
                    _local5.child.x = (_local5.child.x + 1200);
                };
                _local4++;
            };
        }

        private function rebuildMapBMP(_arg1:MovieClip):void{
            var _local2:MovieClip;
            var _local3:int;
            this.clearMapBmps();
            _local3 = 0;
            while (_local3 < _arg1.numChildren) {
                _local2 = (_arg1.getChildAt(_local3) as MovieClip);
                if ((((((((((((((((((((((((_local2 is MovieClip)) && ((_local2.width >= 1260)))) && ((_local2.name.toLowerCase().indexOf("bmp") == -1)))) && ((_local2.name.toLowerCase().indexOf("cs") == -1)))) && ((_local2.name.toLowerCase().indexOf("bounds") == -1)))) && (((((_local2 as MovieClip) == null)) || ((MovieClip(_local2).totalFrames < 15)))))) && (!(("isSolid" in _local2))))) && (!(("isFloor" in _local2))))) && (!(("isWall" in _local2))))) && (!(("walk" in _local2))))) && (!(("btnSkip" in _local2))))) && (!(("noBmp" in _local2))))){
                    trace(("RASTERIZING " + _local2.name));
                    this.mapBmps.push({
                        child:_local2,
                        x:_local2.x,
                        bmDO:null
                    });
                };
                _local3++;
            };
            this.rasterize(this.mapBmps);
        }

        private function mapResizeCheck(_arg1:TimerEvent):void{
            if (((!((this.map == null))) && ((this.mapBmps.length > 0)))){
                if (this.mapNW != this.rootClass.stage.stageWidth){
                    this.rasterize(this.mapBmps);
                };
            };
        }

        private function clearMapBmps():void{
            var _local1:Object;
            if (this.mapBmps.length > 0){
                for each (_local1 in this.mapBmps) {
                    _local1.bmDO.parent.removeChild(_local1.bmDO);
                    if (_local1.bmd != null){
                        _local1.bmd.dispose();
                    };
                    _local1.child = null;
                    _local1.bmd = null;
                    _local1.bm = null;
                };
            };
            this.mapBmps = [];
        }

        public function initMap():mapData{
            this.mData = new mapData(this.rootClass);
            return (this.mData);
        }

        public function initCutscenes():cutsceneHandler{
            this.cHandle = new cutsceneHandler(this.rootClass);
            return (this.cHandle);
        }

        public function initSound(_arg1:Sound):soundController{
            this.sController = new soundController(_arg1, this.rootClass);
            return (this.sController);
        }

        public function gotoHouse(_arg1:String):void{
            _arg1 = _arg1.toLowerCase();
            if (((!((this.objHouseData == null))) && ((this.objHouseData.unm == _arg1)))){
                return;
            };
            this.rootClass.sfc.sendXtMessage("zm", "house", [_arg1], "str", 1);
        }

        public function isHouseEquipped():Boolean{
            var _local1:int;
            while (_local1 < this.myAvatar.houseitems.length) {
                if (this.myAvatar.houseitems[_local1].bEquip == 1){
                    return (true);
                };
                _local1++;
            };
            return (false);
        }

        public function isMyHouse(){
            return (((!((this.objHouseData == null))) && ((this.objHouseData.unm == this.myAvatar.objData.strUsername.toLowerCase()))));
        }

        public function showHouseOptions(_arg1:String):void{
            var _local2:MovieClip = this.rootClass.ui.mcPopup.mcHouseOptions;
            switch (_arg1){
                case "default":
                case "save":
                default:
                    _local2.visible = true;
                    _local2.bg.x = 0;
                    _local2.cnt.x = 0;
                    _local2.tTitle.x = 5;
                    _local2.bExpand.x = 190;
                    _local2.bg.visible = true;
                    _local2.cnt.visible = true;
                    _local2.tTitle.visible = true;
                    _local2.bExpand.visible = false;
                    return;
                case "hide":
                    _local2.visible = true;
                    _local2.bg.x = 181;
                    _local2.cnt.x = 181;
                    _local2.tTitle.x = 186;
                    _local2.bExpand.x = 120;
                    _local2.bg.visible = false;
                    _local2.cnt.visible = false;
                    _local2.tTitle.visible = false;
                    _local2.bExpand.visible = true;
            };
        }

        public function hideHouseOptions():void{
            var _local2:int;
            var _local1:MovieClip = this.rootClass.ui.mcPopup.mcHouseOptions;
            if (_local1.visible){
                _local2 = 0;
                while (_local2 < _local1.numChildren) {
                    _local1.getChildAt(_local2).x = 190;
                    _local2++;
                };
            };
            _local1.visible = false;
        }

        public function onHouseOptionsDesignClick(_arg1:MouseEvent):void{
            this.rootClass.mixer.playSound("Click");
            this.toggleHouseEdit();
        }

        public function onHouseOptionsSaveClick(_arg1:MouseEvent):void{
            this.rootClass.mixer.playSound("Click");
            this.saveHouseSetup();
        }

        public function onHouseOptionsHideClick(_arg1:MouseEvent):void{
            this.rootClass.mixer.playSound("Click");
            this.showHouseOptions("hide");
        }

        public function onHouseOptionsExpandClick(_arg1:MouseEvent):void{
            this.rootClass.mixer.playSound("Click");
            this.showHouseOptions("default");
        }

        public function onHouseOptionsFloorClick(_arg1:MouseEvent):void{
            this.rootClass.mixer.playSound("Click");
            this.showHouseInventory(70);
        }

        public function onHouseOptionsWallClick(_arg1:MouseEvent):void{
            this.rootClass.mixer.playSound("Click");
            this.showHouseInventory(72);
        }

        public function onHouseOptionsMiscClick(_arg1:MouseEvent):void{
            this.rootClass.mixer.playSound("Click");
            this.showHouseInventory(73);
        }

        public function onHouseOptionsHouseClick(_arg1:MouseEvent):void{
            this.rootClass.mixer.playSound("Click");
            this.gotoTown("buyhouse", "Enter", "Spawn");
        }

        public function showHouseInventory(_arg1:int){
            if (this.myAvatar.houseitems != null){
                this.sendLoadShopRequest(_arg1);
            };
        }

        public function toggleHouseEdit():void{
            if (((this.isMyHouse()) && (!((this.myAvatar.houseitems == null))))){
                if (this.rootClass.ui.mcPopup.mcHouseMenu.visible){
                    this.rootClass.ui.mcPopup.mcHouseMenu.hideEditMenu();
                }
                else {
                    this.rootClass.ui.mcPopup.mcHouseMenu.showEditMenu();
                };
            };
        }

        public function loadHouseInventory(){
            this.rootClass.sfc.sendXtMessage("zm", "loadHouseInventory", [], "str", this.curRoom);
        }
		
        public function redeemCode(_arg1):void{
            this.rootClass.sfc.sendXtMessage("zm", "redeemCode", [_arg1], "str", this.curRoom);
        }

        public function updateHouseItems():void{
            var _local1:int;
            var _local2:Object;
            if (this.objHouseData != null){
                if (this.isMyHouse()){
                    this.initEquippedItems(this.objHouseData.arrPlacement);
                };
                _local1 = 0;
                while (_local1 < this.objHouseData.arrPlacement.length) {
                    if (this.strFrame == this.objHouseData.arrPlacement[_local1].c){
                        _local2 = this.getHouseItem(this.objHouseData.arrPlacement[_local1].ID);
                        if (_local2 != null){
                            this.loadHouseItem(_local2, this.objHouseData.arrPlacement[_local1].x, this.objHouseData.arrPlacement[_local1].y);
                        };
                    };
                    _local1++;
                };
            };
        }
		
		

        public function attachHouseItem(_arg1:Object):void{
            var _local2:Class = (this.loaderD.getDefinition(_arg1.item.sLink) as Class);
            var _local3:* = new (_local2)();
            _local3.x = _arg1.x;
            _local3.y = _arg1.y;
            _local3.ItemID = _arg1.item.ItemID;
            _local3.item = _arg1.item;
            _local3.isHouseItem = true;
            _local3.isStable = false;
            _local3.addEventListener(MouseEvent.MOUSE_DOWN, this.onHouseItemClick, false, 0, true);
            var _local4:MovieClip = (this.CHARS.addChild(_local3) as MovieClip);
            _local4.name = ("mc" + getQualifiedClassName(_local4));
            this.houseItemValidate(_local3);
        }

        public function onHouseItemClick(_arg1:Event):void{
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            if (((this.isMyHouse()) && (this.rootClass.ui.mcPopup.mcHouseMenu.visible))){
                this.rootClass.ui.mcPopup.mcHouseMenu.drawItemHandle(MovieClip(_arg1.currentTarget));
                this.rootClass.ui.mcPopup.mcHouseMenu.onHandleMoveClick(_arg1.clone());
            }
            else {
                if ((((_local2.btnButton == null)) || (!(_local2.btnButton.hasEventListener(MouseEvent.CLICK))))){
                    this.onWalkClick();
                };
            };
        }

        public function houseItemValidate(_arg1:MovieClip):void{
            var _local3:int;
            var _local4:DisplayObject;
            var _local2:* = this.getHouseItem(_arg1.ItemID);
            if (_local2.sType == "Floor Item"){
                _arg1.isStable = false;
                _arg1.addEventListener(Event.ENTER_FRAME, this.onHouseItemEnterFrame);
            }
            else {
                if (_local2.sType == "Wall Item"){
                    _arg1.isStable = true;
                    _local3 = 0;
                    while (_local3 < this.map.numChildren) {
                        _local4 = this.map.getChildAt(_local3);
                        if ((((((_local4 is MovieClip)) && (MovieClip(_local4).isFloor))) && (MovieClip(_local4).hitTestObject(_arg1)))){
                            _arg1.isStable = false;
                            break;
                        };
                        _local3++;
                    };
                    if (!_arg1.isStable){
                        _arg1.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 100, 0, 0, 0);
                    }
                    else {
                        _arg1.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
                    };
                };
            };
        }

        public function onHouseItemEnterFrame(_arg1:Event):void{
            var _local4:DisplayObject;
            var _local5:Rectangle;
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            var _local3:int;
            while (_local3 < this.map.numChildren) {
                _local4 = this.map.getChildAt(_local3);
                if ((((((_local4 is MovieClip)) && (MovieClip(_local4).isFloor))) && (MovieClip(_local4).hitTestPoint(_local2.x, _local2.y)))){
                    _local2.removeEventListener(Event.ENTER_FRAME, this.onHouseItemEnterFrame);
                    _local2.isStable = true;
                    break;
                };
                _local3++;
            };
            if (!_local2.isStable){
                _local5 = _local2.getBounds(this.rootClass.stage);
                if ((_local5.y + (_local5.height / 2)) > 495){
                    _local2.isStable = true;
                    _local2.y = Math.ceil((_local5.y - (_local5.y - _local2.y)));
                    _local2.removeEventListener(Event.ENTER_FRAME, this.onHouseItemEnterFrame);
                }
                else {
                    _local2.y = (_local2.y + 10);
                };
                if (this.rootClass.ui.mcPopup.mcHouseMenu.visible){
                    this.rootClass.ui.mcPopup.mcHouseMenu.drawItemHandle(_local2);
                };
            };
        }

        public function initHouseData(_arg1:Object):void{
            this.objHouseData = _arg1;
            if (this.objHouseData != null){
                this.objHouseData.arrPlacement = this.createItemPlacementArray(this.objHouseData.sHouseInfo);
                this.verifyItemQty();
            };
        }

        public function verifyItemQty():void{
            var _local3:*;
            var _local4:*;
            var _local1:* = {};
            var _local2:int;
            while (_local2 < this.objHouseData.arrPlacement.length) {
                _local3 = this.objHouseData.arrPlacement[_local2].ID;
                if (_local1[_local3] == null){
                    _local1[_local3] = 1;
                }
                else {
                    var _local5 = _local1;
                    var _local6 = _local3;
                    var _local7 = (_local5[_local6] + 1);
                    _local5[_local6] = _local7;
                };
                _local4 = this.getHouseItem(_local3);
                if ((((_local4 == null)) || ((_local4.iQty < _local1[_local3])))){
                    this.objHouseData.sHouseInfo = "";
                    this.objHouseData.arrPlacement = [];
                };
                _local2++;
            };
        }

        public function getHouseItem(_arg1:int):Object{
            var _local2:int;
            var _local3:int;
            if (this.isMyHouse()){
                _local2 = 0;
                while (_local2 < this.myAvatar.houseitems.length) {
                    if (this.myAvatar.houseitems[_local2].ItemID == _arg1){
                        return (this.myAvatar.houseitems[_local2]);
                    };
                    _local2++;
                };
            }
            else {
                _local3 = 0;
                while (_local3 < this.objHouseData.items.length) {
                    if (this.objHouseData.items[_local3].ItemID == _arg1){
                        return (this.objHouseData.items[_local3]);
                    };
                    _local3++;
                };
            };
            return (null);
        }

        public function removeSelectedItem():void{
            var _local1:MovieClip;
            if (this.objHouseData.selectedMC == null){
                this.rootClass.MsgBox.notify("Please selected an item to be removed.");
            }
            else {
                _local1 = this.objHouseData.selectedMC;
                _local1.removeEventListener(MouseEvent.MOUSE_DOWN, this.onHouseItemClick);
                this.unequipHouseItem(_local1.ItemID);
                this.CHARS.removeChild(_local1);
                delete this.objHouseData.selectedMC;
            };
        }

        public function equipHouse(_arg1:Object):void{
            var _local2:* = new ModalMC();
            var _local3:* = {};
            _local3.strBody = (("Are you sure you want to equip '" + _arg1.sName) + "'? It will reset your house items?");
            _local3.params = {item:_arg1};
            _local3.callback = this.equipHouseRequest;
            this.rootClass.ui.ModalStack.addChild(_local2);
            _local2.init(_local3);
        }

        public function equipHouseRequest(_arg1):void{
            if (_arg1.accept){
                this.rootClass.world.sendEquipItemRequest(_arg1.item);
                this.rootClass.world.equipHouseByID(_arg1.item.ItemID);
            };
        }

        public function equipHouseByID(_arg1:int):void{
            var _local2:int;
            while (_local2 < this.myAvatar.houseitems.length) {
                this.myAvatar.houseitems[_local2].bEquip = (((this.myAvatar.houseitems[_local2].ItemID)==_arg1) ? 1 : 0);
                _local2++;
            };
        }

        public function saveHouseSetup():void{
            var _local3:DisplayObject;
            var _local1:int;
            while (_local1 < this.objHouseData.arrPlacement.length) {
                if (this.strFrame == this.objHouseData.arrPlacement[_local1].c){
                    this.objHouseData.arrPlacement.splice(_local1, 1);
                    _local1--;
                };
                _local1++;
            };
            _local1 = 0;
            while (_local1 < this.CHARS.numChildren) {
                _local3 = this.CHARS.getChildAt(_local1);
                if (((_local3.hasOwnProperty("isHouseItem")) && (MovieClip(_local3).isHouseItem))){
                    if (MovieClip(_local3).isStable){
                        this.objHouseData.arrPlacement.push({
                            c:this.strFrame,
                            ID:MovieClip(_local3).ItemID,
                            x:_local3.x,
                            y:_local3.y
                        });
                    }
                    else {
                        this.unequipHouseItem(MovieClip(_local3).ItemID);
                        _local3.removeEventListener(MouseEvent.MOUSE_DOWN, this.onHouseItemClick);
                        this.CHARS.removeChild(_local3);
                    };
                };
                _local1++;
            };
            var _local2:String = this.createItemPlacementString(this.objHouseData.arrPlacement);
            trace(this.objHouseData.sHouseInfo);
            trace(_local2);
            if (this.objHouseData.sHouseInfo != _local2){
                this.sendSaveHouseSetup(_local2);
                this.objHouseData.sHouseInfo = _local2;
            };
        }

        public function createItemPlacementString(_arg1:Array):String{
            var _local3:int;
            var _local4:*;
            var _local2 = "";
            if (_arg1.length > 0){
                _local3 = 0;
                while (_local3 < _arg1.length) {
                    for (_local4 in _arg1[_local3]) {
                        _local2 = ((((_local2 + _local4) + ":") + _arg1[_local3][_local4]) + ",");
                    };
                    _local2 = _local2.substring(0, (_local2.length - 1));
                    _local2 = (_local2 + "|");
                    _local3++;
                };
                _local2 = _local2.substring(0, (_local2.length - 1));
            };
            return (_local2);
        }

        public function createItemPlacementArray(_arg1:String):Array{
            var _local3:*;
            var _local4:int;
            var _local5:*;
            var _local6:*;
            var _local7:int;
            var _local2:Array = [];
            if (_arg1.length > 0){
                _local3 = _arg1.split("|");
                _local4 = 0;
                while (_local4 < _local3.length) {
                    _local5 = {};
                    _local6 = _local3[_local4].split(",");
                    _local7 = 0;
                    while (_local7 < _local6.length) {
                        _local5[_local6[_local7].split(":")[0]] = _local6[_local7].split(":")[1];
                        _local7++;
                    };
                    _local2.push(_local5);
                    _local4++;
                };
            };
            return (_local2);
        }

        public function sendSaveHouseSetup(_arg1):void{
            this.rootClass.sfc.sendXtMessage("zm", "housesave", [_arg1], "str", 1);
        }

        public function initEquippedItems(_arg1):void{
            var _local3:int;
            var _local2:int;
            while (_local2 < this.myAvatar.houseitems.length) {
                if (this.myAvatar.houseitems[_local2].sType != "House"){
                    this.myAvatar.houseitems[_local2].bEquip = 0;
                    _local3 = 0;
                    while (_local3 < _arg1.length) {
                        if (this.myAvatar.houseitems[_local2].ItemID == _arg1[_local3].ID){
                            this.myAvatar.houseitems[_local2].bEquip = 1;
                        };
                        _local3++;
                    };
                };
                _local2++;
            };
        }

        public function initHouseInventory(_arg1):void{
            this.myAvatar.houseitems = (((_arg1.items)==null) ? [] : _arg1.items);
            this.initEquippedItems(this.createItemPlacementArray(_arg1.sHouseInfo));
            var _local2:Array = this.myAvatar.houseitems;
            var _local3:int;
            while (_local3 < _local2.length) {
                _local2[_local3].iQty = int(_local2[_local3].iQty);
                this.rootClass.world.invTree[_local2[_local3].ItemID] = _local2[_local3];
                _local3++;
            };
        }

        public function unequipHouseItem(_arg1:int):void{
            var _local2:int;
            while (_local2 < this.myAvatar.houseitems.length) {
                if (this.myAvatar.houseitems[_local2].ItemID == _arg1){
                    this.myAvatar.houseitems[_local2].bEquip = 0;
                };
                _local2++;
            };
        }

        public function loadHouseItem(_arg1:Object, _arg2:int, _arg3:int):void{
            var item:Object = _arg1;
            var x:int = _arg2;
            var y:int = _arg3;
            try {
                this.attachHouseItem({
                    item:item,
                    x:x,
                    y:y
                });
            }
            catch(err:Error) {
                arrHouseItemQueue.push({
                    item:item,
                    typ:"A",
                    x:x,
                    y:y
                });
                if (arrHouseItemQueue.length > 0){
                    loadNextHouseItem();
                };
            };
        }

        public function loadNextHouseItem():void{
            this.ldr_House.load(new URLRequest((this.rootClass.getFilePath() + this.arrHouseItemQueue[0].item.sFile)), this.loaderC);
            if (!this.ldr_House.hasEventListener(Event.COMPLETE)){
                this.ldr_House.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onHouseItemComplete);
            };
        }

        public function onHouseItemComplete(_arg1:Event):void{
            var _local2:* = this.arrHouseItemQueue[0];
            if (_local2.typ == "A"){
                this.attachHouseItem(_local2);
                this.arrHouseItemQueue.splice(0, 1);
                if (this.arrHouseItemQueue.length > 0){
                    this.loadNextHouseItem();
                };
            }
            else {
                this.rootClass.ui.mcPopup.mcHouseMenu.previewHouseItem(_local2);
                this.arrHouseItemQueue.splice(0, 1);
                if (this.arrHouseItemQueue.length > 0){
                    this.loadNextHouseItemB();
                };
            };
        }

        public function loadHouseItemB(_arg1:Object):void{
            var item:Object = _arg1;
            try {
                this.rootClass.ui.mcPopup.mcHouseMenu.previewHouseItem({item:item});
            }
            catch(err:Error) {
                rootClass.ui.mcPopup.mcHouseMenu.preview.t2.visible = true;
                rootClass.ui.mcPopup.mcHouseMenu.preview.cnt.visible = false;
                rootClass.ui.mcPopup.mcHouseMenu.preview.bAdd.visible = false;
                arrHouseItemQueue.push({
                    item:item,
                    typ:"B"
                });
                if (arrHouseItemQueue.length > 0){
                    loadNextHouseItemB();
                };
            };
        }

        public function loadNextHouseItemB():void{
            var _local1:Object = this.arrHouseItemQueue[0].item;
            var _local2:String = _local1.sFile;
            if (_local1.sType == "House"){
                _local2 = (("maps/" + _local1.sFile.substr(0, -4)) + "_preview.swf");
            };
            this.ldr_House.load(new URLRequest((this.rootClass.getFilePath() + _local2)), this.loaderC);
            if (!this.ldr_House.hasEventListener(Event.COMPLETE)){
                this.ldr_House.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onHouseItemComplete);
            };
        }

        public function playerInit(){
            var _local2:*;
            trace("------------------------------ Player Init");
            trace((" > " + this.rootClass.sfc.ipAddress));
            var _local1:* = this.rootClass.sfc.getRoom(this.curRoom).getUserList();
            var _local3:Array = [];
            var _local4:int;
            for (_local2 in _local1) {
                _local3.push(_local1[_local2].getId());
            };
            if (_local3.length > 0){
                this.objectByIDArray(_local3);
            };
            this.myAvatar = this.avatars[this.rootClass.sfc.myUserId];
            this.myAvatar.isMyAvatar = true;
            this.myAvatar.pMC.disablePNameMouse();
            this.rootClass.sfcSocial = true;
        }

        public function objectByIDArray(_arg1:Array){
            var _local2:int;
            var _local3:int;
            var _local4:*;
            var _local5:String;
            var _local6:Object;
            var _local7:String;
            trace("** WORLD objectByIDArray >");
            var _local8:Array = [];
            _local2 = 0;
            while (_local2 < _arg1.length) {
                _local3 = _arg1[_local2];
                _local6 = this.getUoLeafById(_local3);
                if (_local6 != null){
                    _local5 = _local6.uoName;
                    _local7 = String(_local6.strFrame);
                    if (_local3 == this.rootClass.sfc.myUserId){
                        _local7 = this.strFrame;
                    };
                    if (this.avatars[_local3] == null){
                        this.avatars[_local3] = new Avatar(this.rootClass);
                        this.avatars[_local3].uid = _local3;
                        this.avatars[_local3].pnm = _local5;
                    };
                    this.avatars[_local3].dataLeaf = _local6;
                    if ((((this.avatars[_local3].pMC == null)) && ((_local7 == this.strFrame)))){
                        this.avatars[_local3].pMC = this.createAvatarMC(_local3);
                        _local8.push(_local3);
                    };
                    this.updateUserDisplay(_local3);
                }
                else {
                    trace(("login failed for uid: " + _local3));
                };
                _local2++;
            };
            if (_local8.length > 0){
                this.getUserDataByIds(_local8);
            };
        }

        public function objectByID(_arg1:Number){
            var _local3:*;
            var _local4:*;
            trace("** WORLD objectByID >");
            var _local2:* = this.getUoLeafById(_arg1);
            if (_local2 != null){
                _local3 = _local2.uoName;
                trace((" unm : " + _local3));
                _local4 = String(_local2.strFrame);
                if (_arg1 == this.rootClass.sfc.myUserId){
                    _local4 = this.strFrame;
                };
                if (this.avatars[_arg1] == null){
                    this.avatars[_arg1] = new Avatar(this.rootClass);
                    this.avatars[_arg1].uid = _arg1;
                    this.avatars[_arg1].pnm = _local3;
                };
                this.avatars[_arg1].dataLeaf = _local2;
                if ((((this.avatars[_arg1].pMC == null)) && ((_local4 == this.strFrame)))){
                    this.avatars[_arg1].pMC = this.createAvatarMC(_arg1);
                    this.getUserDataById(_arg1);
                };
                this.updateUserDisplay(_arg1);
            };
        }

        public function createAvatarMC(_arg1:Number):AvatarMC{
            trace("** WORLD createAvatarMC >");
            var _local2:AvatarMC = new AvatarMC();
            _local2.name = ("a" + _arg1);
            _local2.x = -600;
            _local2.y = 0;
            _local2.pAV = this.avatars[_arg1];
            _local2.world = this;
			//_local2.rootClass = this.rootClass
            return (_local2);
        }

        public function destroyAvatar(_arg1:Number){
            if (this.avatars[_arg1] != null){
                if (this.avatars[_arg1].pMC != null){
                    if (!this.avatars[_arg1].isMyAvatar){
                        this.avatars[_arg1].pMC.fClose();
                        delete this.avatars[_arg1];
                    };
                };
            };
        }

        public function updateUserDisplay(_arg1:Number){
			/*
		
            var _local5:*;
            var _local6:*;
            var _local7:*;
            trace(("** WORLD updateUserDisplay > " + _arg1));
            var _local2:* = this.getMCByUserID(_arg1);
            var _local3:* = this.getUoLeafById(_arg1);
            var _local4:* = String(_local3.strFrame);
            if (_local4 == this.strFrame){
                _local2.tx = int(_local3.tx);
                _local2.ty = int(_local3.ty);
                _local5 = int(_local3.intState);
                _local6 = null;
                if (((((("strPad" in _local3)) && (!((_local3.strPad.toLowerCase() == "none"))))) && ((_local3.strPad in this.map)))){
                    _local6 = this.map[_local3.strPad];
                };
                if (((!((_local2.tx == 0))) || (!((_local2.ty == 0))))){
                    if (!this.testTxTy(new Point(_local2.tx, _local2.ty), _local2)){
                        _local7 = this.solveTxTy(new Point(_local2.tx, _local2.ty), _local2);
                        if (_local7 != null){
                            _local2.x = _local7.x;
                            _local2.y = _local7.y;
                        }
                        else {
                            _local2.x = int((1260 / 2));
                            _local2.y = int((550 / 2));
                        };
                    }
                    else {
                        _local2.x = _local2.tx;
                        _local2.y = _local2.ty;
                    };
                }
                else {
                    if (_local6 != null){
                        _local2.x = int(((_local6.x + int((Math.random() * 10))) - 5));
                        _local2.y = int(((_local6.y + int((Math.random() * 10))) - 5));
                    }
                    else {
                        _local2.x = int((1260 / 2));
                        _local2.y = int((550 / 2));
                    };
                };
				trace(">>1");
				if (_local2.pAV.isMyAvatar){
                    trace(">>2");
                    mapScrollCheck();
                };
				//if (_local2.pAV.isMyAvatar){
					//trace(">>2");
                   // mapScrollCheck();
                //};
                _local2.scale(this.SCALE);
                if (_local5){
                    _local2.mcChar.gotoAndStop("Idle");
                }
                else {
                    _local2.mcChar.gotoAndStop("Dead");
                };
                if (this.showHPBar){
                    _local2.showHPBar();
                }
                else {
                    _local2.hideHPBar();
                };
                if (_arg1 == this.rootClass.sfc.myUserId){
                    this.bitWalk = true;
                };
                if ((((this.CELL_MODE == "normal")) || ((_arg1 == this.rootClass.sfc.myUserId)))){
                    _local2.pAV.showMC();
                }
                else {
                    _local2.pAV.hideMC();
                };
                if (((((this.bPvP) && (!((_local3.pvpTeam == null))))) && ((_local3.pvpTeam > -1)))){
                    _local2.mcChar.pvpFlag.visible = true;
                    _local2.mcChar.pvpFlag.gotoAndStop(new Array("a", "b", "c")[_local3.pvpTeam]);
                }
                else {
                    _local2.mcChar.pvpFlag.visible = false;
                };
                if (_local2.isLoaded){
                    _local2.gotoAndPlay("in2");
					//_local2.updateSize();
                } else {
                    _local2.gotoAndPlay("hold");
                };
				*/
			var umc:*;
            var uoLeaf:*;
            var strF:*;
            var intState:*;
            var spawnPad:*;
            var pt:*;
            trace(("** WORLD updateUserDisplay > " + _arg1));
            umc = getMCByUserID(_arg1);
            uoLeaf = getUoLeafById(_arg1);
            strF = String(uoLeaf.strFrame);
            if (strF == strFrame){
                umc.tx = int(uoLeaf.tx);
                umc.ty = int(uoLeaf.ty);
                intState = int(uoLeaf.intState);
                spawnPad = null;
				trace("UMC: " + umc);
				trace("strF: " + strF);
				trace("strFrame: " + strFrame);
				trace("TX: " + umc.tx);
				trace("TY: " + umc.ty);
				trace("strPad: " + strPad);
                if (((("strPad" in uoLeaf)) && (!((uoLeaf.strPad.toLowerCase() == "none"))))){
                    if ((uoLeaf.strPad in map)){
                        spawnPad = map[uoLeaf.strPad];
                    };
                    if (spawnPad == null){
                        spawnPad = map.cell[uoLeaf.strPad];
                    };
                } else if (("tx" in uoLeaf) && ("ty" in uoLeaf)){
					trace("FUCK");
					if ((uoLeaf.tx in map)){
                         umc.x = map[uoLeaf.tx];
                    };
                    if ((uoLeaf.ty in map)){
						 umc.y = map[uoLeaf.ty];
                    };
				};
                if (((!((umc.tx == 0))) || (!((umc.ty == 0))))){
                    if (testTxTy(new Point(umc.tx, umc.ty), umc)){
                        umc.x = umc.tx;
                        umc.y = umc.ty;
                    } else {
                        pt = solveTxTy(new Point(umc.tx, umc.ty), umc);
                        if (pt == null){
                            umc.x = int((1260 / 2));
                            umc.y = int((550 / 2));
                        } else {
                            umc.x = pt.x;
                            umc.y = pt.y;
                        };
                    };
                } else {
                    if (spawnPad == null){
                        umc.x = int((1260 / 2));
                        umc.y = int((550 / 2));
                    } else {
                        umc.x = int(((spawnPad.x + int((Math.random() * 10))) - 5));
                        umc.y = int(((spawnPad.y + int((Math.random() * 10))) - 5));
                    };
                };
                //if (umc.pAV.isMyAvatar){
					//trace("INSIDE");
                    //mapScrollCheck();
                //};
                umc.scale(SCALE);
                if (showHPBar){
                    umc.showHPBar();
                } else {
                    umc.hideHPBar();
                };
                if (_arg1 == rootClass.sfc.myUserId){
                    bitWalk = true;
                };
                if ((((CELL_MODE == "normal" && !this.hideAvatars)) || ((_arg1 == rootClass.sfc.myUserId)))){
                    umc.pAV.showMC();
                } else {
                    umc.pAV.hideMC();
                };
                if (((((bPvP) && (!((uoLeaf.pvpTeam == null))))) && ((uoLeaf.pvpTeam > -1)))){
                    umc.mcChar.pvpFlag.visible = true;
                    umc.mcChar.pvpFlag.gotoAndStop(new Array("a", "b", "c")[uoLeaf.pvpTeam]);
                };
                if (umc.isLoaded){
                    umc.gotoAndPlay("in2");
                } else {
                    umc.gotoAndPlay("hold");
                };
				if (uoLeaf.fly == 1){
					umc.simulateJumpUp();
					umc.GroundToFly();
					umc.fly = 1;
				}
            };
        }

        public function repairAvatars():void{
            var _local1:Avatar;
            this.rootClass.chatF.pushMsg("server", "Attempting to repair incomplete Avatars...", "SERVER", "", 0);
            var _local2:Boolean;
            for each (_local1 in this.avatars) {
                if (!_local1.pMC.isLoaded){
                    _local2 = true;
                    if (_local1.objData != null){
                        this.rootClass.chatF.pushMsg("server", (" > repairing " + _local1.objData.strUsername), "SERVER", "", 0);
                        _local1.initAvatar(_local1.objData);
                    }
                    else {
                        if (_local1.pnm != null){
                            this.rootClass.chatF.pushMsg("warning", ((" *> Data load incomplete for " + _local1.pnm) + ", repair cannot continue."), "SERVER", "", 0);
                        }
                        else {
                            this.rootClass.chatF.pushMsg("warning", " *> Avatar instantiated but no data exists at all!", "SERVER", "", 0);
                        };
                    };
                };
            };
            if (!_local2){
                this.rootClass.chatF.pushMsg("server", " > No incomplete Avatars found!", "SERVER", "", 0);
            };
        }

        private function solveTxTy(_arg1:Point, _arg2:MovieClip):Point{
            var _local6:Point;
            var _local7:Point;
            var _local10:int;
            var _local3:int = 20;
            var _local4:int = (1260 / _local3);
            var _local5:int = (550 / _local3);
            var _local8:Array = [];
            var _local9:int;
            while (_local9 <= _local4) {
                _local10 = 0;
                while (_local10 <= _local5) {
                    _local6 = new Point((_local9 * _local3), (_local10 * _local3));
                    if (this.testTxTy(_local6, _arg2)){
                        _local8.push({
                            x:_local6.x,
                            y:_local6.y,
                            d:Math.abs(Point.distance(_arg1, _local6))
                        });
                    };
                    _local10++;
                };
                _local9++;
            };
            if (_local8.length){
                _local8.sortOn(["d"], [Array.NUMERIC]);
                _local7 = new Point(((_local8[0].x + int((Math.random() * 10))) - 5), ((_local8[0].y + int((Math.random() * 10))) - 5));
                while (!(this.testTxTy(_local7, _arg2))) {
                    _local7 = new Point(((_local8[0].x + int((Math.random() * 10))) - 5), ((_local8[0].y + int((Math.random() * 10))) - 5));
                };
                return (_local7);
            };
            return (null);
        }

        private function testTxTy(_arg1:Point, _arg2:MovieClip):Boolean{
            var _local3:int = _arg2.shadow.width;
            var _local4:int = _arg2.shadow.height;
            var _local5:int = (_arg1.x - (_local3 / 2));
            var _local6:int = (_arg1.y - (_local4 / 2));
            var _local7:Rectangle = new Rectangle(_local5, _local6, _local3, _local4);
            var _local8:Rectangle;
            var _local9:MovieClip;
            var _local10:Boolean;
            var _local11:int;
            while (_local11 < this.arrSolid.length) {
                _local9 = MovieClip(this.arrSolid[_local11].shadow);
                _local8 = new Rectangle(_local9.x, _local9.y, _local9.width, _local9.height);
                _local10 = !(_local8.intersects(_local7));
                _local11++;
            };
            return (_local10);
        }

        public function updatePortrait(_arg1:Avatar){
            var _local2:Array;
            var _local3:MovieClip;
            var _local6:int;
            var _local7:*;
            var _local8:*;
            var _local9:*;
            var _local10:*;
            var _local4:int;
            var _local5:int;
            if (_arg1 != this.myAvatar){
                _local2 = [this.rootClass.ui.mcPortraitTarget];
            }
            else {
                if (_arg1 == this.myAvatar.target){
                    _local2 = [this.rootClass.ui.mcPortraitTarget, this.rootClass.ui.mcPortrait];
                }
                else {
                    _local2 = [this.rootClass.ui.mcPortrait];
                };
            };
            _local4 = 0;
            while (_local4 < _local2.length) {
                _local7 = {};
                _local3 = _local2[_local4];
				try {
				_local3.Element.btnLight.visible = false;
				_local3.Element.btnDark.visible = false;
				_local3.Element.btnFire.visible = false;
				_local3.Element.btnWater.visible = false;
			    _local3.Element.btnStorm.visible = false;
				_local3.Element.btnLightning.visible = false;
				} catch(e:Error) {
                    trace("Elements not initialized yet! (Maybe)");
			    };
                _local3.strName.mouseEnabled = false;
                _local3.strClass.mouseEnabled = false;
                if (_arg1.npcType == "monster"){
                    _local7 = this.monTree[_arg1.objData.MonMapID];
                    _local3.strName.text = _arg1.objData.strMonName.toUpperCase();
                    _local3.strClass.htmlText = "Monster";
                    if (("stars" in _local3)){
                        _local6 = Math.round((Math.pow((_arg1.objData.intLevel * 1.3), 0.5) / 2));
                        _local5 = 1;
                        while (_local5 < 6) {
                            if (_local5 <= _local6){
                                _local3.stars.getChildByName(("s" + _local5)).visible = true;
                            }
                            else {
                                _local3.stars.getChildByName(("s" + _local5)).visible = false;
                            };
                            _local5++;
                        };
                    };					
                };
			
                if (_arg1.npcType == "player"){
                    _local7 = this.uoTree[_arg1.pnm.toLowerCase()];
                    _local3.strName.text = _arg1.objData.strUsername.toUpperCase();
                    _local3.strClass.htmlText = ((_arg1.objData.strClassName + ", Rank ") + _arg1.objData.iRank);
                    if (("stars" in _local3)){
                        _local5 = 1;
                        while (_local5 < 6) {
                            _local3.stars.getChildByName(("s" + _local5)).visible = false;
                            _local5++;
                        };
                    };
					
                };
                if ((((_arg1.npcType == "monster")) || ((_arg1.npcType == "player"))))
				{
					try {
					switch (_arg1.objData.strElement){
					case "Light":
                    	_local3.Element.btnLight.visible = true;
						_local3.Element.btnDark.visible = false;
						_local3.Element.btnFire.visible = false;
						_local3.Element.btnWater.visible = false;
						_local3.Element.btnStorm.visible = false;
						_local3.Element.btnLightning.visible = false;
						break;
					case "Dark":
	                    _local3.Element.btnLight.visible = false;
						_local3.Element.btnDark.visible = true;
						_local3.Element.btnFire.visible = false;
						_local3.Element.btnWater.visible = false;
						_local3.Element.btnStorm.visible = false;
						_local3.Element.btnLightning.visible = false;
						break;
					case "Water":							 
	                    _local3.Element.btnLight.visible = false;
						_local3.Element.btnDark.visible = false;
						_local3.Element.btnFire.visible = false;
						_local3.Element.btnWater.visible = true;
						_local3.Element.btnStorm.visible = false;
						_local3.Element.btnLightning.visible = false;
						break;
					case "Fire":
	                    _local3.Element.btnLight.visible = false;
						_local3.Element.btnDark.visible = false;
						_local3.Element.btnFire.visible = true;
						_local3.Element.btnWater.visible = false;
						_local3.Element.btnStorm.visible = false;
						_local3.Element.btnLightning.visible = false;
						break;
					case "Wind":
	                    _local3.Element.btnLight.visible = false;
						_local3.Element.btnDark.visible = false;
						_local3.Element.btnFire.visible = false;
						_local3.Element.btnWater.visible = false;
						_local3.Element.btnStorm.visible = true;
						_local3.Element.btnLightning.visible = false;
						break;
					case "Lightning":
	                    _local3.Element.btnLight.visible = false;
						_local3.Element.btnDark.visible = false;
						_local3.Element.btnFire.visible = false;
						_local3.Element.btnWater.visible = false;
						_local3.Element.btnStorm.visible = false;
						_local3.Element.btnLightning.visible = true;
						break;
					default:
						_local3.Element.btnLight.visible = false;
						_local3.Element.btnDark.visible = false;
						_local3.Element.btnFire.visible = false;
						_local3.Element.btnWater.visible = false;
						_local3.Element.btnStorm.visible = false;
						_local3.Element.btnLightning.visible = false;
					}
				} catch(e:Error) {
                    trace("User data not retrieved yet");
			    };
					if ((_arg1.objData.intLevel - myAvatar.objData.intLevel) > 60)
					{
                    	_local3.strLevel.text = "";
						_local3.strLevel.visible = false;
                    	_local3.mcLevel.gotoAndStop("High");
					} else {
						_local3.strLevel.text = _arg1.objData.intLevel;
                    	_local3.strLevel.visible = true;
                    	_local3.mcLevel.gotoAndStop("Normal");
                    };
                    _local3.strLevel.text = _arg1.objData.intLevel;
                    _local8 = 0;
                    _local9 = 0;
                    _local10 = null;
                    _local8 = _local7.intHP;
                    _local9 = _local7.intHPMax;
                    _local10 = _local3.HP;
                    if (_local7.intHP >= 0){
                        _local10.strIntHP.text = String(_local7.intHP);
                    }
                    else {
                        _local10.strIntHP.text = "X";
                    };
                    if (_local8 < 0){
                        _local8 = 0;
                    };
                    if (_local8 > _local9){
                        _local8 = _local9;
                    };
					_local10.intHPbar.x = Math.min(-((_local10.intHPbar.width * (1 - (_local8 / _local9)))), 0);
					if (_arg1 == myAvatar){
						if ((1 - (_local8 / _local9)) > 0.7){
                            _local10.Glint.gotoAndPlay("b");
							//_local10.InterfaceGlint.gotoAndPlay("b");
                        } else {
                            _local10.Glint.gotoAndStop("a");
							//_local10.InterfaceGlint.gotoAndPlay("a");
                        };
						} else {
							_local10.Glint.gotoAndStop("a");
							//_local10.InterfaceGlint.gotoAndPlay("a");
					};
                    _local10.intHPbar.x = Math.min(-((_local10.intHPbar.width * (1 - (_local8 / _local9)))), 0);
                    _local8 = _local7.intMP;
                    _local9 = _local7.intMPMax;
                    _local10 = _local3.MP;
                    if (_local7.intMP >= 0){
                        _local10.strIntMP.text = String(_local7.intMP);
                    }
                    else {
                        _local10.strIntMP.text = "X";
                    };
                    if (_local8 < 0){
                        _local8 = 0;
                    };
                    if (_local8 > _local9){
                        _local8 = _local9;
                    };
					_local10.intMPbar.x = Math.min(-((_local10.intMPbar.width * (1 - (_local8 / _local9)))), 0);
					if (_arg1 == myAvatar){
						if ((1 - (_local8 / _local9)) > 0.7){
                            _local10.Glint.gotoAndPlay("b");
                        } else {
                            _local10.Glint.gotoAndStop("a");
                        };
						} else {
                        _local10.Glint.gotoAndStop("a");
                    };
                    _local10.intMPbar.x = Math.min(-((_local10.intMPbar.width * (1 - (_local8 / _local9)))), 0);
                };
                _local4++;
            };
        }

        public function getAvatarByUserID(_arg1:int):Avatar{
            var _local2:String = String(_arg1);
            if ((_local2 in this.avatars)){
                return (this.avatars[_local2]);
            };
            return (null);
        }

        public function getAvatarByUserName(_arg1:String):Avatar{
            var _local2:String;
            for (_local2 in this.avatars) {
                if (((((!((this.avatars[_local2] == null))) && (!((this.avatars[_local2].pnm == null))))) && ((this.avatars[_local2].pnm.toLowerCase() == _arg1.toLowerCase())))){
                    return (this.avatars[_local2]);
                };
            };
            return (null);
        }

        public function getMCByUserName(_arg1):AvatarMC{
            var _local2:String;
            for (_local2 in this.avatars) {
                if (((((!((this.avatars[_local2] == null))) && (!((this.avatars[_local2].pnm == null))))) && ((this.avatars[_local2].pnm.toLowerCase() == _arg1.toLowerCase())))){
                    if (this.avatars[_local2].pMC != null){
                        return (this.avatars[_local2].pMC);
                    };
                };
            };
            return (null);
        }

        public function getMCByUserID(_arg1):AvatarMC{
            if (((!((this.avatars[_arg1] == undefined))) && (!((this.avatars[_arg1].pMC == null))))){
                return (this.avatars[_arg1].pMC);
            };
            return (null);
        }

        public function getUserByName(_arg1){
            var _local3:*;
            var _local4:*;
            var _local5:*;
            var _local6:*;
            var _local2:Array = this.rootClass.sfc.getAllRooms();
            for (_local3 in _local2) {
                _local4 = _local2[_local3];
                for (_local5 in _local4.getUserList()) {
                    _local6 = _local4.getUserList()[_local5];
                    if (String(_local6.getName()) == _arg1){
                        return (_local6);
                    };
                };
            };
            return (null);
        }

        public function getUserById(_arg1:Number){
            return (this.rootClass.sfc.getRoom(this.curRoom).getUser(Number(_arg1)));
        }

        public function getUoLeafById(_arg1):Object{
            var _local2:Object;
            for each (_local2 in this.uoTree) {
                if (_local2.entID == _arg1){
                    return (_local2);
                };
            };
            return (null);
        }

        public function getUoLeafByName(_arg1:String):Object{
            var _local2:Object;
            _arg1 = _arg1.toLowerCase();
            for each (_local2 in this.uoTree) {
                if (_local2.uoName.toLowerCase() == _arg1){
                    return (_local2);
                };
            };
            return (null);
        }

        public function getUserDataById(_arg1){
            trace("** WORLD getUserDataById >");
            this.rootClass.sfc.sendXtMessage("zm", "retrieveUserData", [_arg1], "str", this.curRoom);
        }

        public function getUserDataByIds(_arg1:Array){
            trace("** WORLD getUserDataByIds >");
            this.rootClass.sfc.sendXtMessage("zm", "retrieveUserDatas", _arg1, "str", this.curRoom);
        }

        public function getUsersByCell(_arg1:String):Array{
            var _local3:String;
            var _local2:Array = [];
            for (_local3 in this.avatars) {
                if (this.avatars[_local3].dataLeaf.strFrame == _arg1){
                    _local2.push(this.avatars[_local3]);
                };
            };
            return (_local2);
        }

        public function getAllAvatarsInCell():Array{
            var _local1:Array = [];
            _local1 = this.getMonstersByCell(this.myAvatar.dataLeaf.strFrame);
            _local1 = _local1.concat(this.getUsersByCell(this.myAvatar.dataLeaf.strFrame));
            return (_local1);
        }

        private function lookAtValue(_arg1:String, _arg2:int):Number{
            return (parseInt(_arg1.charAt(_arg2), 36));
        }

        private function updateValue(_arg1, _arg2:int, _arg3:Number):String{
            var _local4:String;
            if ((((_arg3 >= 0)) && ((_arg3 < 10)))){
                _local4 = String(_arg3);
            }
            else {
                if ((((_arg3 >= 10)) && ((_arg3 < 36)))){
                    _local4 = String.fromCharCode((_arg3 + 55));
                }
                else {
                    _local4 = "0";
                };
            };
            return (this.rootClass.strSetCharAt(_arg1, _arg2, _local4));
        }

        public function getQuestValue(_arg1:Number):Number{
            if (((!((this.myAvatar == null))) && (!((this.myAvatar.objData == null))))){
                if (_arg1 > 99){
                    return (this.lookAtValue(this.myAvatar.objData.strQuests2, (_arg1 - 100)));
                };
                return (this.lookAtValue(this.myAvatar.objData.strQuests, _arg1));
            };
            return (-1);
        }

        public function setQuestValue(_arg1:Number, _arg2:Number):void{
            if (_arg1 > 99){
                this.myAvatar.objData.strQuests2 = this.updateValue(this.myAvatar.objData.strQuests2, (_arg1 - 100), _arg2);
            }
            else {
                this.myAvatar.objData.strQuests = this.updateValue(this.myAvatar.objData.strQuests, _arg1, _arg2);
            };
        }

        public function sendUpdateQuestRequest(_arg1:Number, _arg2:Number):void{
            this.rootClass.sfc.sendXtMessage("zm", "updateQuest", [_arg1, _arg2], "str", this.curRoom);
        }

        public function setHomeTownCurrent():void{
            this.rootClass.sfc.sendXtMessage("zm", "setHomeTown", [], "str", this.curRoom);
            this.myAvatar.objData.strHomeTown = this.myAvatar.objData.strMapName;
        }

        public function setHomeTown(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "setHomeTown", [_arg1], "str", this.curRoom);
            this.myAvatar.objData.strHomeTown = _arg1;
        }
		
		public function sendVendingFromInvRequest(_arg1:Object, _arg2:int, _arg3:int, _arg4:int, _arg5:int){

            var _local2:ModalMC;
            var _local3:Object;
            if (_arg1.bEquip == 1){
                _local2 = new ModalMC();
                _local3 = {};
                _local3.strBody = "You must unequip the item before storing it in the vending shop!";
                _local3.params = {};
                _local3.glow = "red,medium";
                _local3.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(_local2);
                _local2.init(_local3);
            } else {
				this.rootClass.sfc.sendXtMessage("zm", "vendingFromInv", [_arg1.ItemID, _arg1.CharItemID, _arg2, _arg3, _arg4, _arg5, _arg1.Quantity], "str", this.curRoom);
                
            };
        }
		
		public function sendVendingToInvRequest(_arg1:Object){
            var _local2:*;
            var _local3:*;
            if (this.myAvatar.items.length >= this.myAvatar.objData.iBagSlots){
                _local2 = new ModalMC();
                _local3 = {};
                _local3.strBody = "You have exceeded your maximum inventory storage!";
                _local3.params = {};
                _local3.glow = "red,medium";
                _local3.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(_local2);
                _local2.init(_local3);
            } else {
                this.rootClass.sfc.sendXtMessage("zm", "vendingToInv", [_arg1.ItemID, _arg1.VendingID], "str", this.curRoom);
            };
        }
		
		public function sendEmoji(_arg1:Object){
			this.rootClass.sfc.sendXtMessage("zm", "emoticon", [_arg1.strEmote], "str", this.curRoom);
        }

        public function sendBankFromInvRequest(_arg1:Object){
            var _local2:ModalMC;
            var _local3:Object;
            if (_arg1.bEquip == 1){
                _local2 = new ModalMC();
                _local3 = {};
                _local3.strBody = "You must unequip the item before storing it in the bank!";
                _local3.params = {};
                _local3.glow = "red,medium";
                _local3.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(_local2);
                _local2.init(_local3);
            }
            else {
                if ((((_arg1.bCoins == 0)) && ((this.myAvatar.iBankCount >= this.myAvatar.objData.iBankSlots)))){
                    _local2 = new ModalMC();
                    _local3 = {};
                    _local3.strBody = "You have exceeded your maximum bank storage for non-RC items!";
                    _local3.params = {};
                    _local3.glow = "red,medium";
                    _local3.btns = "mono";
                    this.rootClass.ui.ModalStack.addChild(_local2);
                    _local2.init(_local3);
                }
                else {
                    this.rootClass.sfc.sendXtMessage("zm", "bankFromInv", [_arg1.ItemID, _arg1.CharItemID], "str", this.curRoom);
                };
            };
        }

        public function sendBankToInvRequest(_arg1:Object){
            var _local2:*;
            var _local3:*;
            if (this.myAvatar.items.length >= this.myAvatar.objData.iBagSlots){
                _local2 = new ModalMC();
                _local3 = {};
                _local3.strBody = "You have exceeded your maximum inventory storage!";
                _local3.params = {};
                _local3.glow = "red,medium";
                _local3.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(_local2);
                _local2.init(_local3);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "bankToInv", [_arg1.ItemID, _arg1.CharItemID], "str", this.curRoom);
            };
        }

        public function sendBankSwapInvRequest(_arg1:Object, _arg2:Object){
            var _local3:ModalMC;
            var _local4:Object;
            if (_arg2.bEquip == 1){
                _local3 = new ModalMC();
                _local4 = {};
                _local4.strBody = "You must unequip the item before storing it in the bank!";
                _local4.params = {};
                _local4.glow = "red,medium";
                _local4.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(_local3);
                _local3.init(_local4);
            }
            else {
                if ((((((_arg2.bCoins == 0)) && ((_arg1.bCoins == 1)))) && ((this.myAvatar.iBankCount >= this.myAvatar.objData.iBankSlots)))){
                    _local3 = new ModalMC();
                    _local4 = {};
                    _local4.strBody = "You have exceeded your maximum bank storage for non-RC items!";
                    _local4.params = {};
                    _local4.glow = "red,medium";
                    _local4.btns = "mono";
                    this.rootClass.ui.ModalStack.addChild(_local3);
                    _local3.init(_local4);
                }
                else {
                    this.rootClass.sfc.sendXtMessage("zm", "bankSwapInv", [_arg2.ItemID, _arg2.CharItemID, _arg1.ItemID, _arg1.CharItemID], "str", this.curRoom);
                };
            };
        }
		
		public function sendVendingSwapInvRequest(_arg1:Object, _arg2:Object){
            var _local3:ModalMC;
            var _local4:Object;
            if (_arg2.bEquip == 1){
                _local3 = new ModalMC();
                _local4 = {};
                _local4.strBody = "You must unequip the item before storing it in the vending shop!";
                _local4.params = {};
                _local4.glow = "red,medium";
                _local4.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(_local3);
                _local3.init(_local4);
            } else {/*
                if ((((((_arg2.bCoins == 0)) && ((_arg1.bCoins == 1)))) && ((this.myAvatar.iBankCount >= this.myAvatar.objData.iBankSlots)))){
                    _local3 = new ModalMC();
                    _local4 = {};
                    _local4.strBody = "You have exceeded your maximum vending shop storage for non-RC items!";
                    _local4.params = {};
                    _local4.glow = "red,medium";
                    _local4.btns = "mono";
                    this.rootClass.ui.ModalStack.addChild(_local3);
                    _local3.init(_local4);
                }
                else {*/
                    this.rootClass.sfc.sendXtMessage("zm", "vendingSwapInv", [_arg2.ItemID, _arg2.CharItemID, _arg1.ItemID, _arg1.CharItemID], "str", this.curRoom);
                //};
            };
        }

        public function getInventory(_arg1){
            //this.rootClass.sfc.sendXtMessage("zm", "retrieveInventory", [_arg1], "str", this.curRoom);
			this.rootClass.sfc.sendXtMessage("zm", "retrievelnventory", [_arg1], "str", this.curRoom);
        }
		
        public function sendChangeColorRequest(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "changeColor", [_arg1, _arg2, _arg3, _arg4, this.hairshopinfo.HairShopID], "str", this.curRoom);
        }

        public function sendChangeArmorColorRequest(_arg1:int, _arg2:int, _arg3:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "changeArmorColor", [_arg1, _arg2, _arg3], "str", this.curRoom);
        }
		/*
		public function sendChangeGuildSettingsRequest(_arg1:int, _arg2:int, _arg3:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "changeGuildColor", [_arg1, _arg2, _arg3], "str", this.curRoom);
        }*/
		
		public function sendChangeGuildSettingsRequest(_arg1: int, _arg2: int, _arg3: int): void {
			this.rootClass.sfc.sendXtMessage("zm", "changeGuildColor", [_arg1], "str", this.curRoom);
		}

        public function sendLoadBankRequest(_arg1:Array=null):void{
            var _local2:String;
            if (_arg1[0] == "*"){
                _arg1 = ["All"];
            };
            for each (_local2 in _arg1) {
                this.bankinfo.hasRequested[_local2] = true;
            };
            this.rootClass.sfc.sendXtMessage("zm", "loadBank", _arg1, "str", this.curRoom);
        }
		
		public function sendLoadVendingRequest(_arg1:Array=null):void{
            var _local2:String;
            if (_arg1[0] == "*"){
                _arg1 = ["All"];
            };
            for each (_local2 in _arg1) {
                this.vendinginfo.hasRequested[_local2] = true;
            };
            this.rootClass.sfc.sendXtMessage("zm", "loadVending", _arg1, "str", this.curRoom);
        }
		
		public function sendReloadShopRequest(_arg1:int):void{
            if (((((!((this.shopinfo == null))) && ((this.shopinfo.ShopID == _arg1)))) && (!((this.shopinfo.bLimited == null))))){
                this.rootClass.sfc.sendXtMessage("zm", "reloadShop", [_arg1], "str", this.curRoom);
            };
        }
		
		public function sendLoadVendingShopRequest(_arg1:Array=null):void{
			//this.rootClass.world.myAvatar.vendingReset();
            var _local2:String;
            if (_arg1[0] == "*"){
                _arg1 = ["All"];
            };
            for each (_local2 in _arg1) {
				this.vendingshopinfo.hasRequested[_local2] = true;
            };
			//this.rootClass.sfc.sendXtMessage("zm", "loadVendingShop", _arg1, "str", this.curRoom);
        }

        public function sendReloadVendingShopRequest(_arg1:int):void{
			this.rootClass.world.myAvatar.vendingReset();
            if (((((!((this.vendingshopinfo == null))) && ((this.vendingshopinfo.VendingID == _arg1)))) && (!((this.vendingshopinfo.bLimited == null))))){
                this.rootClass.sfc.sendXtMessage("zm", "reloadVendingShop", [_arg1], "str", this.curRoom);
            };
        }

        public function sendLoadShopRequest(_arg1:int):void{
            if ((((this.shopinfo == null)) || (((!((this.shopinfo.ShopID == _arg1))) || (this.shopinfo.bLimited))))){
                if (this.coolDown("loadShop")){
                    this.rootClass.menuClose();
                    this.rootClass.sfc.sendXtMessage("zm", "loadShop", [_arg1], "str", this.curRoom);
                };
            }
            else {
                this.rootClass.menuClose();
                if (this.shopinfo.bHouse == 1){
                    this.rootClass.ui.mcPopup.fOpen("HouseShop");
                }
				else {
					//FORGE SHOP
					if (this.shopinfo.ShopID == -987){
                        this.rootClass.ui.mcPopup.fOpen("ForgeShop");
						}
						else {
							//GUILD SHOP
							if (this.shopinfo.ShopID == -528){
								this.rootClass.ui.mcPopup.fOpen("GuildShop");
								}
								else {
									if (this.rootClass.isMergeShop(this.shopinfo)){
										this.rootClass.ui.mcPopup.fOpen("MergeShop");
									}
									else {
										this.rootClass.ui.mcPopup.fOpen("Shop");
									};
								};
							};
						};
					};
        }
		
		public function sendReloadVendingRequest(_arg1:int):void{
            if (((((!((this.vendinginfo == null))) && ((this.vendinginfo.VendingID == _arg1)))) && (!((this.vendinginfo.bLimited == null))))){
                this.rootClass.sfc.sendXtMessage("zm", "reloadVending", [_arg1], "str", this.curRoom);
            };
        }

        public function sendLoadHairShopRequest(_arg1:int):void{
            if ((((this.hairshopinfo == null)) || (!((this.hairshopinfo.HairShopID == _arg1))))){
                this.rootClass.sfc.sendXtMessage("zm", "loadHairShop", [_arg1], "str", this.curRoom);
            }
            else {
                this.rootClass.openCharacterCustomize();
            };
        }

        public function sendLoadEnhShopRequest(_arg1:int):void{
            var _local2:ModalMC = new ModalMC();
            var _local3:Object = {};
            _local3.strBody = "Old refinement shops are disabled on the PTR.  Please visit AugoEidEs for the new shops.";
            _local3.params = {};
            _local3.btns = "mono";
            this.rootClass.ui.ModalStack.addChild(_local2);
            _local2.init(_local3);
        }

        public function sendRefineItemRequest(_arg1:Object):void{
            this.refItem = _arg1;
            this.rootClass.sfc.sendXtMessage("zm", "refineItem", [_arg1.ItemID, _arg1.RefineID, this.refineShopID], "str", this.curRoom);
        }

        public function sendRefineItemRequestShop(_arg1:Object, _arg2:Object):void{
            if (this.coolDown("buyItem")){
                this.refItem = _arg1;
                this.rootClass.sfc.sendXtMessage("zm", "refineItemShop", [_arg1.ItemID, _arg2.ItemID, this.shopinfo.ShopID], "str", this.curRoom);
            };
        }
		
		public function sendRefineItemRequestLocalServer(New:Object):void{
			removeHelpMovie();
			//this.rootClass.chatF.pushMsg("warning", "Item 1: " + New.Item1.ItemID, "SERVER", "", 0);
			//this.rootClass.chatF.pushMsg("warning", "Item 2: " + New.Item2.ItemID, "SERVER", "", 0);
			this.rootClass.sfc.sendXtMessage("zm", "refineItemLocal", [New.Item1.ItemID, New.Item2.ItemID], "str", this.curRoom);
		}
		
        public function sendRefineItemRequestLocal(_arg1:Object, _arg2:Object):void{
            if (this.coolDown("buyItem")){
                this.refItem = _arg1;
				var castBar: Object;
				rootClass.mixer.playSound("Synthesis");
				castBar = {};
				castBar.typ = "generic";
				castBar.dur = 7;
				attachHelpMovie("MCSynthesisWindow5s");
				castBar.txt = "Refining...";
				castBar.callback = sendRefineItemRequestLocalServer;
				castBar.args = {
					Item1: _arg1,
					Item2: _arg2
				};
				this.rootClass.ui.mcCastBar.fOpenWith(castBar);
				this.myAvatar.pMC.stopWalking();
				this.rootClass.chatF.submitMsg("/use", "emote", "");
            };
        }
		
		public function sendBuyAuctionItemRequest(_arg1: Object): void {
			var _local2: int;
			if (this.coolDown("buyItem")) {
				if ((((_arg1.bStaff == 1)) && ((this.myAvatar.objData.intAccessLevel < 40)))) {
					this.rootClass.MsgBox.notify("Test Item: Cannot be purchased yet!");
				} else {
					if ((((_arg1.bUpg == 1)) && (!(this.myAvatar.isUpgraded())))) {
						this.rootClass.showUpgradeWindow();
					} else {
						if ((((_arg1.FactionID > 1)) && ((this.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))) {
							this.rootClass.MsgBox.notify("Item Locked: Reputation Requirement not met.");
						} else {
							if (!this.rootClass.validateArmor(_arg1)) {
								this.rootClass.MsgBox.notify("Item Locked: Class Requirement not met.");
							} else {
								if ((((_arg1.iQSindex >= 0)) && ((this.getQuestValue(_arg1.iQSindex) < int(_arg1.iQSvalue))))) {
									this.rootClass.MsgBox.notify("Item Locked: Quest Requirement not met.");
								} else {
									if (((((this.myAvatar.isItemInInventory(_arg1.ItemID)) || (this.myAvatar.isItemInBank(_arg1.ItemID)))) && (this.myAvatar.isItemStackMaxed(_arg1.ItemID)))) {
										this.rootClass.MsgBox.notify((("You cannot have more than " + _arg1.iStk) + " of that item!"));
									} else {
										if (((((!(this.rootClass.isHouseItem(_arg1))) && ((this.myAvatar.items.length >= this.myAvatar.objData.iBagSlots)))) || (((this.rootClass.isHouseItem(_arg1)) && ((this.myAvatar.houseitems.length >= this.myAvatar.objData.iHouseSlots)))))) {
											this.rootClass.MsgBox.notify("Inventory Full!");
										} else {
											this.rootClass.sfc.sendXtMessage("zm", "buyAuctionItem", [_arg1.AuctionID], "str", this.curRoom);
										};
									};
								};
							};
						};
					};
				};
			};
		}
		
		/**

        public function sendBuyAuctionItemRequest(_arg1:Object):void{
            var _local2:int;
            if (this.coolDown("buyItem")){
                if ((((_arg1.bStaff == 1)) && ((this.myAvatar.objData.intAccessLevel < 40)))){
                    this.rootClass.MsgBox.notify("Test Item: Cannot be purchased yet!");
                }
                else {
                        if ((((_arg1.bUpg == 1)) && (!(this.myAvatar.isUpgraded())))){
                            this.rootClass.showUpgradeWindow();
                        }
                        else {
                            if ((((_arg1.FactionID > 1)) && ((this.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))){
                                this.rootClass.MsgBox.notify("Item Locked: Reputation Requirement not met.");
                            }
                            else {
                                if (!this.rootClass.validateArmor(_arg1)){
                                    this.rootClass.MsgBox.notify("Item Locked: Class Requirement not met.");
                                }
                                else {
                                    if ((((_arg1.iQSindex >= 0)) && ((this.getQuestValue(_arg1.iQSindex) < int(_arg1.iQSvalue))))){
                                        this.rootClass.MsgBox.notify("Item Locked: Quest Requirement not met.");
                                    }
                                    else {
                                        if (((((this.myAvatar.isItemInInventory(_arg1.ItemID)) || (this.myAvatar.isItemInBank(_arg1.ItemID)))) && (this.myAvatar.isItemStackMaxed(_arg1.ItemID)))){
                                            this.rootClass.MsgBox.notify((("You cannot have more than " + _arg1.iStk) + " of that item!"));
                                        }
                                        else {

                                            if ((((_arg1.bCoins == 0)) && ((_arg1.iCost > this.myAvatar.objData.intGold)))){
                                                this.rootClass.MsgBox.notify("Insufficient Funds!");
                                            }
											else {
												if ((((_arg1.bCoins == 0)) && ((_arg1.bSilver == 0)) && ((_arg1.bCopper == 0)) && ((_arg1.iCost > this.myAvatar.objData.intGold)))){
													this.rootClass.MsgBox.notify("Insufficient Funds!");
												}
												else {
													if ((((_arg1.bSilver == 1)) && ((_arg1.iCost > this.myAvatar.objData.intSilver)))){
														this.rootClass.MsgBox.notify("Insufficient Funds!");
													}
													else {
														if ((((_arg1.bCopper == 1)) && ((_arg1.iCost > this.myAvatar.objData.intCopper)))){
															this.rootClass.MsgBox.notify("Insufficient Funds!");
														}
														else {
															if ((((_arg1.bCoins == 1)) && ((_arg1.iCost > this.myAvatar.objData.intCoins)))){
																//_local2 = ExternalInterface.call("getGroup");
																if (_local2 == 1){
																	this.rootClass.showACWindow();
																}
																else {
																	this.rootClass.MsgBox.notify("Insufficient Funds!");
																};
															}
															else {
																if (((((!(this.rootClass.isHouseItem(_arg1))) && ((this.myAvatar.items.length >= this.myAvatar.objData.iBagSlots)))) || (((this.rootClass.isHouseItem(_arg1)) && ((this.myAvatar.houseitems.length >= this.myAvatar.objData.iHouseSlots)))))){
																	this.rootClass.MsgBox.notify("Inventory Full!");
																}
																else {
																	this.rootClass.sfc.sendXtMessage("zm", "buyAuctionItem", [_arg1.AuctionID], "str", this.curRoom);
																};
															};
														};
													};
												};
											};
                                        };
                                    };
                                };
                            };
                        };
                };
            };
			**/		
		
		public function sendBuyVendingItemRequest(_arg1: Object): void {
			var _local2: int;
			if (this.coolDown("buyItem")) {
				if ((((_arg1.bStaff == 1)) && ((this.myAvatar.objData.intAccessLevel < 40)))) {
					this.rootClass.MsgBox.notify("Test Item: Cannot be purchased yet!");
				} else {
					if ((((_arg1.bUpg == 1)) && (!(this.myAvatar.isUpgraded())))) {
						this.rootClass.showUpgradeWindow();
					} else {
						if ((((_arg1.FactionID > 1)) && ((this.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))) {
							this.rootClass.MsgBox.notify("Item Locked: Reputation Requirement not met.");
						} else {
							if (!this.rootClass.validateArmor(_arg1)) {
								this.rootClass.MsgBox.notify("Item Locked: Class Requirement not met.");
							} else {
								if ((((_arg1.iQSindex >= 0)) && ((this.getQuestValue(_arg1.iQSindex) < int(_arg1.iQSvalue))))) {
									this.rootClass.MsgBox.notify("Item Locked: Quest Requirement not met.");
								} else {
									if (((((this.myAvatar.isItemInInventory(_arg1.ItemID)) || (this.myAvatar.isItemInBank(_arg1.ItemID)))) && (this.myAvatar.isItemStackMaxed(_arg1.ItemID)))) {
										this.rootClass.MsgBox.notify((("You cannot have more than " + _arg1.iStk) + " of that item!"));
									} else {
										if (((((!(this.rootClass.isHouseItem(_arg1))) && ((this.myAvatar.items.length >= this.myAvatar.objData.iBagSlots)))) || (((this.rootClass.isHouseItem(_arg1)) && ((this.myAvatar.houseitems.length >= this.myAvatar.objData.iHouseSlots)))))) {
											this.rootClass.MsgBox.notify("Inventory Full!");
										} else {
											this.rootClass.sfc.sendXtMessage("zm", "buyVendingItem", [_arg1.VendingID], "str", this.curRoom);
										};
									};
								};
							};
						};
					};
				};
			};
		}
		
		
        public function sendBuyItemRequest(_arg1:Object):void{
            var _local2:int;
            if (this.coolDown("buyItem")){
                if ((((_arg1.bStaff == 1)) && ((this.myAvatar.objData.intAccessLevel < 40)))){
                    this.rootClass.MsgBox.notify("Test Item: Cannot be purchased yet!");
                }
                else {
                    if (((!((this.shopinfo.sField == ""))) && (!((this.getAchievement(this.shopinfo.sField, this.shopinfo.iIndex) == 1))))){
                        this.rootClass.MsgBox.notify("Item Locked: Special requirement not met.");
                    }
                    else {
                        if ((((_arg1.bUpg == 1)) && (!(this.myAvatar.isUpgraded())))){
                            this.rootClass.showUpgradeWindow();
                        }
                        else {
                            if ((((_arg1.FactionID > 1)) && ((this.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))){
                                this.rootClass.MsgBox.notify("Item Locked: Reputation Requirement not met.");
                            }
                            else {
                                if (!this.rootClass.validateArmor(_arg1)){
                                    this.rootClass.MsgBox.notify("Item Locked: Class Requirement not met.");
                                }
                                else {
                                    if ((((_arg1.iQSindex >= 0)) && ((this.getQuestValue(_arg1.iQSindex) < int(_arg1.iQSvalue))))){
                                        this.rootClass.MsgBox.notify("Item Locked: Quest Requirement not met.");
                                    }
                                    else {
                                        if (((((this.myAvatar.isItemInInventory(_arg1.ItemID)) || (this.myAvatar.isItemInBank(_arg1.ItemID)))) && (this.myAvatar.isItemStackMaxed(_arg1.ItemID)))){
                                            this.rootClass.MsgBox.notify((("You cannot have more than " + _arg1.iStk) + " of that item!"));
                                        }
                                        else {
                                           if ((((_arg1.bCoins == 0)) && ((_arg1.bSilver == 0)) && ((_arg1.bCopper == 0)) && ((_arg1.iCost > this.myAvatar.objData.intGold)))){
                                                this.rootClass.MsgBox.notify("Insufficient Funds!");
                                            }
											else {
                                                if ((((_arg1.bSilver == 1)) && ((_arg1.iCost > this.myAvatar.objData.intSilver)))){
													this.rootClass.MsgBox.notify("Insufficient Funds!");
												}
												else {
													if ((((_arg1.bCopper == 1)) && ((_arg1.iCost > this.myAvatar.objData.intCopper)))){
														this.rootClass.MsgBox.notify("Insufficient Funds!");
													}
													else {
														if ((((_arg1.bCoins == 1)) && ((_arg1.iCost > this.myAvatar.objData.intCoins)))){
															//_local2 = ExternalInterface.call("getGroup");
															if (_local2 == 1){
																this.rootClass.showACWindow();
															}
															else {
																this.rootClass.MsgBox.notify("Insufficient Funds!");
															};
														}
														else {
															if (((((!(this.rootClass.isHouseItem(_arg1))) && ((this.myAvatar.items.length >= this.myAvatar.objData.iBagSlots)))) || (((this.rootClass.isHouseItem(_arg1)) && ((this.myAvatar.houseitems.length >= this.myAvatar.objData.iHouseSlots)))))){
																this.rootClass.MsgBox.notify("Inventory Full!");
															}
															else {
																if ((((this.shopBuyItem == null)) || (!((this.shopBuyItem.ShopItemID == _arg1.ShopItemID))))){
																	this.shopBuyItem = _arg1;
																};
																this.rootClass.sfc.sendXtMessage("zm", "buyItem", [this.shopBuyItem.ItemID, this.shopinfo.ShopID, this.shopBuyItem.ShopItemID], "str", this.curRoom);
															};
														};
													};
												};
											};
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

		
        public function sendSellItemRequest(_arg1:Object):void{
            if (this.coolDown("sellItem")){
                this.rootClass.sfc.sendXtMessage("zm", "sellItem", [_arg1.ItemID, _arg1.iQty, _arg1.CharItemID], "str", this.curRoom);
            };
        }

        public function sendRemoveItemRequest(_arg1:Object, _arg2:int=1):void{
            if (_arg2 == 1){
                this.rootClass.sfc.sendXtMessage("zm", "removeItem", [_arg1.ItemID, _arg1.CharItemID], "str", this.curRoom);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "removeItem", [_arg1.ItemID, _arg1.CharItemID, _arg2], "str", this.curRoom);
            };
        }
		
		public function sendChatShowItemRequest(_arg1:Object): void {
			if (coolDown("tfer")) {
				rootClass.sfc.sendXtMessage("zm", "chatItemShow", [_arg1.CharItemID], "str", curRoom);
			} else {
				rootClass.MsgBox.notify("Please do not flood the server with messages.");
			};
		}

        public function sendRemoveTempItemRequest(_arg1:int, _arg2:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "removeTempItem", [_arg1, _arg2], "str", this.curRoom);
            this.myAvatar.removeTempItem(_arg1, _arg2);
        }

        public function sendEquipItemRequest(_arg1:Object):Boolean{
            var _local2:Boolean = true;
            if (((!((_arg1 == null))) && (!(this.myAvatar.isItemEquipped(_arg1.ItemID))))){
                if (this.coolDown("equipItem")){
                    this.rootClass.sfc.sendXtMessage("zm", "equipItem", [_arg1.ItemID], "str", this.curRoom);
                }
                else {
                    _local2 = false;
                };
            }
            else {
                _local2 = false;
            };
            return (_local2);
        }

        public function sendForceEquipRequest(_arg1:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "forceEquipItem", [_arg1], "str", this.curRoom);
        }

        public function sendUnequipItemRequest(_arg1:Object):void{
            if (((!((_arg1 == null))) && (this.myAvatar.isItemEquipped(_arg1.ItemID)))){
                if (this.coolDown("unequipItem")){
                    this.rootClass.sfc.sendXtMessage("zm", "unequipItem", [_arg1.ItemID], "str", this.curRoom);
                };
            };
        }

        public function sendChangeClassRequest(_arg1:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "changeClass", [_arg1], "str", this.curRoom);
        }

        public function selfMute(_arg1:int=1):void{
            this.rootClass.sfc.sendXtMessage("zm", "cmd", ["mute", _arg1, this.myAvatar.objData.strUsername.toLowerCase()], "str", this.rootClass.world.curRoom);
        }

        public function equipUseableItem(_arg1:Object):void{
			//trace("ITEM ID TO BE EQUIPPED: " + _arg1.ItemID);
            var _local2:Object;
            var _local4:Object;
            var _local3:int;
            _local3 = 0;
            while (_local3 < this.actions.active.length) {
                if (this.actions.active[_local3].ref == "i1"){
                    _local2 = this.actions.active[_local3];
                };
                _local3++;
            };
			//trace(">>> 1");
            _local2.sArg1 = String(_arg1.ItemID);
            _local2.sArg2 = String(_arg1.sDesc);
            this.rootClass.updateIcons(this.getActIcons(_local2), [_arg1.sFile], _arg1);
            this.rootClass.updateActionObjIcon(_local2);
            _local3 = 0;
			//trace(">>> 2");
            while (_local3 < this.myAvatar.items.length) {
				//trace(">>> 3");
                _local4 = this.myAvatar.items[_local3];
                if ((((_local4.sType.toLowerCase() == "item")) && (!((_local4.sLink.toLowerCase() == "none"))))){
					//trace(">>> 4");
                    if (_local4.ItemID == _arg1.ItemID){
                        _local4.bEquip = 1;
                        this.rootClass.sfc.sendXtMessage("zm", "geia", [_local4.sLink, _local4.sMeta], "str", this.rootClass.world.curRoom);
                    } else if(_arg1.ItemID == 0){
						//trace(">>> 5");
						_local4.bEquip = 1;
                        this.rootClass.sfc.sendXtMessage("zm", "geia", [_local4.sLink, _local4.sMeta], "str", this.rootClass.world.curRoom);
					} else {
						//trace(">>> 6");
                        _local4.bEquip = 0;
                    };
                };
				trace(">>> 7");
                _local3++;
            };
            if (this.rootClass.ui.mcPopup.mcInventory != null){
                this.rootClass.ui.mcPopup.mcInventory.mcItemList.refreshList();
                this.rootClass.ui.mcPopup.mcInventory.refreshDetail();
            };
        }

        public function unequipUseableItem(_arg1:Object=null):void{
            var _local2:Object;
            var _local3:Object;
            var _local4:int;
            _local4 = 0;
            while (_local4 < this.actions.active.length) {
                if (this.actions.active[_local4].ref == "i1"){
                    _local2 = this.actions.active[_local4];
                };
                _local4++;
            };
            _local2.sArg1 = "";
            _local2.sArg2 = "";
            this.rootClass.updateIcons(this.getActIcons(_local2), ["icu1"], null);
            if (_arg1 == null){
                _local4 = 0;
                while (_local4 < this.myAvatar.items.length) {
                    _local3 = this.myAvatar.items[_local4];
                    if (String(_local3.ItemID) == _local2.sArg1){
                        _arg1 = _local3;
                    };
                    _local4++;
                };
            };
            _arg1.bEquip = 0;
            if (this.rootClass.ui.mcPopup.mcInventory != null){
                this.rootClass.ui.mcPopup.mcInventory.mcItemList.refreshList();
                this.rootClass.ui.mcPopup.mcInventory.refreshDetail();
            };
        }

        public function tryUseItem(Item:Object):void{
			
			switch (Item.sType.toLowerCase()){
				case "clientuse":
					switch (Item.sLink){};
					break;
				case "serveruse":
                    this.sendUseItemRequest(Item);
					break;
				case "egg":
                    this.sendHatchItemRequest(Item);
					break;
					
			}
        }
		
		public function sendHatchItemRequest(_arg1:Object):void{
            this.rootClass.sfc.sendXtMessage("zm", "serverHatchItem", [_arg1.ItemID], "str", -1);
        }

        public function sendUseItemRequest(_arg1:Object):void{
            this.rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["+", _arg1.ItemID], "str", -1);
        }

        public function sendUseItemArrayRequest(_arg1:Array):void{
            this.rootClass.sfc.sendXtMessage("zm", "serverUseItem", _arg1, "str", -1);
        }

        public function bankContains(_arg1:Array):Boolean{
            var _local4:String;
            var _local5:Object;
            trace(("bankContains > " + _arg1.toString()));
            var _local2:Array = [];
            var _local3:int;
            while ((((_local3 < this.bankinfo.items.length)) && (!((_local2.length == _arg1.length))))) {
                _local5 = this.bankinfo.items[_local3];
                _local3++;
                if ((((_local2.indexOf(_local5.sType) == -1)) && ((_arg1.indexOf(_local5.sType) > -1)))){
                    _local2.push(_local5.sType);
                };
            };
            return ((_local2.length == _arg1.length));
        }
		
		public function vendingContains(_arg1:Array):Boolean{
            var _local4:String;
            var _local5:Object;
            trace(("vendingContains > " + _arg1.toString()));
            var _local2:Array = [];
            var _local3:int;
            while ((((_local3 < this.vendinginfo.items.length)) && (!((_local2.length == _arg1.length))))) {
                _local5 = this.vendinginfo.items[_local3];
                _local3++;
                if ((((_local2.indexOf(_local5.sType) == -1)) && ((_arg1.indexOf(_local5.sType) > -1)))){
                    _local2.push(_local5.sType);
                };
            };
            return ((_local2.length == _arg1.length));
        }
		
		public function vendingshopContains(_arg1:Array):Boolean{
            var _local4:String;
            var _local5:Object;
            trace(("vendingContains > " + _arg1.toString()));
            var _local2:Array = [];
            var _local3:int;
            while ((((_local3 < this.vendingshopinfo.items.length)) && (!((_local2.length == _arg1.length))))) {
                _local5 = this.vendingshopinfo.items[_local3];
                _local3++;
                if ((((_local2.indexOf(_local5.sType) == -1)) && ((_arg1.indexOf(_local5.sType) > -1)))){
                    _local2.push(_local5.sType);
                };
            };
            return ((_local2.length == _arg1.length));
        }

        public function bankHasRequested(_arg1:Array):Boolean{
            var _local2:String;
            for each (_local2 in _arg1) {
                if (!(_local2 in this.bankinfo.hasRequested)){
                    return (false);
                };
            };
            return (true);
        }

        public function tradeHasRequested(_arg1:Array):Boolean{
            var _local2:String;
            for each (_local2 in _arg1) {
                if (!(_local2 in this.tradeinfo.hasRequested)){
                    return (false);
                };
            };
            return (true);
        }
		
		public function vendingHasRequested(_arg1:Array):Boolean{
            var _local2:String;
            for each (_local2 in _arg1) {
                if (!(_local2 in this.vendinginfo.hasRequested)){
                    return (false);
                };
            };
            return (true);
        }
		
		public function vendingShopHasRequested(_arg1:Array):Boolean{
            var _local2:String;
            for each (_local2 in _arg1) {
                if (!(_local2 in this.vendingshopinfo.hasRequested)){
                    return (false);
                };
            };
            return (true);
        }
		
        public function auctionHasRequested(_arg1:Array):Boolean{
            var _local2:String;
            for each (_local2 in _arg1) {
                if (!(_local2 in this.auctioninfo.hasRequested)){
                    return (false);
                };
            };
            return (true);
        }
		
        public function retrieveHasRequested(_arg1:Array):Boolean{
            var _local2:String;
            for each (_local2 in _arg1) {
                if (!(_local2 in this.retrieveinfo.hasRequested)){
                    return (false);
                };
            };
            return (true);
        }
		
        public function addItemsToTradeA(_arg1:Array):void{
            var _local3:Object;
            var _local4:Object;
            var _local2:Boolean = true;
            for each (_local3 in _arg1) {
                _local2 = true;
                for each (_local4 in this.tradeinfo.itemsA) {
                    if (_local4.ItemID == _local3.ItemID) {
					    trace("Existed");
						_local4.iQty = _local3.iQty;
                        _local2 = false;
                        break;
                    };
                };
                if (_local2){
                    this.tradeinfo.itemsA.push(_local3);
                };
            };
        }
		
        public function addItemsToTradeB(_arg1:Array):void{
            var _local3:Object;
            var _local4:Object;
            var _local2:Boolean = true;
            for each (_local3 in _arg1) {
                _local2 = true;
                for each (_local4 in this.tradeinfo.itemsB) {
                    if (_local4.ItemID == _local3.ItemID){
                        _local2 = false;
                        break;
                    };
                };
                if (_local2){
                    this.tradeinfo.itemsB.push(_local3);
                };
            };
        }
		
        public function addItemsToBank(_arg1:Array):void{
            var _local3:Object;
            var _local4:Object;
            var _local2:Boolean = true;
            for each (_local3 in _arg1) {
                _local2 = true;
                for each (_local4 in this.bankinfo.items) {
                    if (_local4.ItemID == _local3.ItemID){
                        _local2 = false;
                        break;
                    };
                };
                if (_local2){
                    this.bankinfo.items.push(_local3);
                };
            };
        }
		
		public function addItemsToVending(_arg1:Array):void{
            var _local3:Object;
            var _local4:Object;
            var _local2:Boolean = true;
            for each (_local3 in _arg1) {
                _local2 = true;
                for each (_local4 in this.vendinginfo.items) {
                    if (_local4.VendingID == _local3.VendingID){
                        _local2 = false;
                        break;
                    };
                };
                if (_local2){
                    this.vendinginfo.items.push(_local3);
                };
            };
        }
		
		public function addItemsToVendingShop(_arg1:Array):void{
            var _local3:Object;
            var _local4:Object;
            var _local2:Boolean = true;
            for each (_local3 in _arg1) {
                _local2 = true;
                for each (_local4 in this.vendingshopinfo.items) {
                    if (_local4.VendingID == _local3.VendingID){
                        _local2 = false;
                        break;
                    };
                };
                if (_local2){
                    this.vendingshopinfo.items.push(_local3);
                };
            };
        }
		
		public function addVendorToVendingShop(_arg1:String):void{
            this.vendingshopinfo.sName = _arg1;
        }

        public function addItemsToAuction(_arg1:Array):void{
            var _local3:Object;
            var _local4:Object;
            var _local2:Boolean = true;
            for each (_local3 in _arg1) {
                _local2 = true;
                for each (_local4 in this.auctioninfo.items) {
                    if (_local4.AuctionID == _local3.AuctionID){
                        _local2 = false;
                        break;
                    };
                };
                if (_local2){
                    this.auctioninfo.items.push(_local3);
                };
            };
        }
		
        public function addItemsToRetrieve(_arg1:Array):void {
            var _local3:Object;
            var _local4:Object;
            var _local2:Boolean = true;
            for each (_local3 in _arg1) {
                _local2 = true;
                for each (_local4 in this.retrieveinfo.items) {
                    if (_local4.AuctionID == _local3.AuctionID){
                        _local2 = false;
                        break;
                    };
                };
                if (_local2){
                    this.retrieveinfo.items.push(_local3);
                };
            };
        }
		
		/*
        public function toggleBank():void{
            if (!this.uiLock){
                if (this.rootClass.ui.mcPopup.currentLabel == "Bank"){
                    MovieClip(this.rootClass.ui.mcPopup.getChildByName("mcBank")).fClose();
                }
                else {
                    this.rootClass.ui.mcPopup.fOpen("Bank");
                };
            };
        }
		*/

        public function sendReport(_arg1:Array):void{
            this.rootClass.sfc.sendXtMessage("zm", "cmd", _arg1, "str", this.rootClass.world.curRoom);
        }

        public function sendWhoRequest():void{
            if (this.coolDown("who")){
                this.rootClass.sfc.sendXtMessage("zm", "cmd", ["who"], "str", this.curRoom);
            };
        }

        public function sendRewardReferralRequest(_arg1):void{
            this.rootClass.sfc.sendXtMessage("zm", "rewardReferral", [], "str", this.curRoom);
        }

        public function sendGetAdDataRequest():void{
            if (this.rootClass.world.myAvatar.objData.iDailyAds < this.rootClass.world.myAvatar.objData.iDailyAdCap){
                this.rootClass.sfc.sendXtMessage("zm", "getAdData", [], "str", this.curRoom);
            };
        }

        public function sendGetAdRewardRequest():void{
            if (this.rootClass.world.myAvatar.objData.iDailyAds < this.rootClass.world.myAvatar.objData.iDailyAdCap){
                this.rootClass.sfc.sendXtMessage("zm", "getAdReward", [], "str", this.curRoom);
            };
        }

        public function sendWarVarsRequest():void{
            this.rootClass.sfc.sendXtMessage("zm", "loadWarVars", [], "str", this.curRoom);
        }

        public function loadQuestStringData():void{
            this.rootClass.sfc.sendXtMessage("zm", "loadQuestStringData", [], "str", this.curRoom);
        }

        public function buyBagSlots(_arg1:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "buyBagSlots", [_arg1], "str", this.curRoom);
        }

        public function buyBankSlots(_arg1:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "buyBankSlots", [_arg1], "str", this.curRoom);
        }

        public function buyHouseSlots(_arg1:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "buyHouseSlots", [_arg1], "str", this.curRoom);
        }

        public function sendLoadFriendsListRequest(){
            this.rootClass.sfc.sendXtMessage("zm", "loadFriendsList", [], "str", this.curRoom);
        }

        public function sendLoadFactionRequest(){
            this.rootClass.sfc.sendXtMessage("zm", "loadFactions", [], "str", this.curRoom);
        }
		
		public function sendSaveSpawnLocation(_arg1){
            this.rootClass.sfc.sendXtMessage("zm", "saveSpawnLocation", [_arg1], "str", this.curRoom);
        }

        public function initAchievements():void{
            var _local2 = this.myAvatar.objData;
            with (_local2) {
                ip0 = uint(ip0);
                ia0 = uint(ia0);
                ia1 = uint(ia1);
                id0 = uint(id0);
                id1 = uint(id1);
                id2 = uint(id2);
                im0 = uint(im0);
                iq0 = uint(iq0);
            };
        }

        public function getAchievement(_arg1:String, _arg2:int):int{
            if ((((_arg2 < 0)) || ((_arg2 > 31)))){
                return (-1);
            };
            var _local3:* = this.myAvatar.objData[_arg1];
            if (_local3 == null){
                return (-1);
            };
            trace(("returning: " + ((_local3 & Math.pow(2, _arg2)) == 0)));
            return (((((_local3 & Math.pow(2, _arg2)))==0) ? 0 : 1));
        }

        public function setAchievement(_arg1:String, _arg2:int, _arg3:int=1):void{
            var _local4:* = ["ia0", "iq0"];
            if ((((((((_local4.indexOf(_arg1) >= 0)) && ((_arg2 >= 0)))) && ((_arg2 < 32)))) && (!((this.getAchievement(_arg1, _arg2) == _arg3))))){
                this.rootClass.sfc.sendXtMessage("zm", "setAchievement", [_arg1, _arg2, _arg3], "str", this.curRoom);
            };
        }
		
		public function rewardAchievement(_arg1:int):void{
			this.rootClass.sfc.sendXtMessage("zm", "rewardAchievement", [_arg1, this.curRoom], "str", 1);
		}

        public function updateAchievement(_arg1:String, _arg2:int, _arg3:int):void{
            if (_arg3 == 0){
                this.myAvatar.objData[_arg1] = (this.myAvatar.objData[_arg1] & ~(Math.pow(2, _arg2)));
            }
            else {
                if (_arg3 == 1){
                    this.myAvatar.objData[_arg1] = (this.myAvatar.objData[_arg1] | Math.pow(2, _arg2));
                };
            };
            this.rootClass.readIA1Preferences();
        }

        public function getStatPoints():void{
			this.rootClass.sfc.sendXtMessage("zm", "getStatPoints", [], "str", -1);
        }
		
		public function showFriendsList():void{
            var _local1:*;
            trace(("friends: " + this.myAvatar.friends));
            if (((!((this.myAvatar.friends == null))) && (this.myAvatar.friendsLoaded))){
                _local1 = {};
                _local1.typ = "userListFriends";
                _local1.ul = this.myAvatar.friends;
                this.rootClass.ui.mcOFrame.fOpenWith(_local1);
            }
            else {
                this.myAvatar.friendsLoaded = true;
                this.rootClass.sfc.sendXtMessage("zm", "getfriendlist", [], "str", -1);
            };
        }
		
		public function showPlayerKillList():void{
            var _local1:*;
			trace(("pk: " + this.myAvatar.playerkills));
            if (((!((this.myAvatar.playerkills == null))) && (this.myAvatar.playerkillsLoaded))){
                _local1 = {};
                _local1.typ = "userListPK";
                _local1.ul = this.myAvatar.playerkills;
                this.rootClass.ui.mcOFrame.fOpenWith(_local1);
            }
            else {
                this.myAvatar.playerkillsLoaded = true;
                this.rootClass.sfc.sendXtMessage("zm", "getplayerkilllist", [], "str", -1);
            };
        }

        public function showGuildList():void{
            if (this.myAvatar.objData.guild != null){
                this.rootClass.ui.mcPopup.fOpen("GuildPanel");
            }
            else {
                this.rootClass.MsgBox.notify("You need to create or join a guild first.");
            };
        }

        public function showIgnoreList():void{
            var _local1:Object;
            if (((!((this.rootClass.chatF.ignoreList.data.users == null))) && ((this.rootClass.chatF.ignoreList.data.users.length > 0)))){
                _local1 = {};
                _local1.typ = "userListIgnore";
                this.rootClass.ui.mcOFrame.fOpenWith(_local1);
            }
            else {
                this.rootClass.chatF.pushMsg("warning", "Your ignore list is empty!.", "SERVER", "", 0);
            };
        }

        public function isModerator(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "isModerator", [_arg1], "str", -1);
        }

        public function toggleName(_arg1, _arg2:String){
            if (_arg2 == "on"){
                this.getMCByUserID(_arg1).pname.visible = true;
            };
            if (_arg2 == "off"){
                this.getMCByUserID(_arg1).pname.visible = false;
            };
        }

        public function toggleHPBar():void{
            var _local1:String;
            var _local2:MovieClip;
            var _local3:Avatar;
            this.showHPBar = !(this.showHPBar);
            for (_local1 in this.avatars) {
                _local3 = this.avatars[_local1];
                if (_local3.pMC != null){
                    _local2 = _local3.pMC;
                    if (this.showHPBar){
                        _local2.showHPBar();
                    }
                    else {
                        _local2.hideHPBar();
                    };
                };
            };
        }

        public function resPlayer(){
            this.afkPostpone();
			this.vendingPostpone();
            this.rootClass.sfc.sendXtMessage("zm", "resPlayerTimed", [this.rootClass.sfc.myUserId], "str", this.curRoom);
        }

        public function showResCounter(){
            trace("line 1131");
            var _local1:* = MovieClip(this.rootClass.ui.mcRes);
            if (_local1.currentLabel == "in"){
                return;
            };
            _local1.gotoAndPlay("in");
            _local1.resC = 10;
            trace("line 1136");
            trace("line 1146");
            if (_local1.resTimer == null){
                _local1.resTimer = new Timer(1000);
                _local1.resTimer.addEventListener("timer", this.resTimer);
            }
            else {
                _local1.resTimer.reset();
            };
            trace("line 1153");
            _local1.resTimer.start();
        }

        public function resTimer(_arg1:TimerEvent){
            var _local2:* = MovieClip(this.rootClass.ui.mcRes);
            _local2.resC--;
            if (_local2.resC > 0){
                _local2.mcTomb.mcTimer.ti.text = ("0" + _local2.resC);
            } else {
                _local2.mcTomb.mcTimer.ti.text = "00";
				_local2.mcTomb.gotoAndPlay(2);
                _arg1.target.reset();
                //_local2.visible = false;
                //_local2.gotoAndStop(1);
                //this.resPlayer();
            };
        }

        public function danceRequest(_arg1){
            var _local2:*;
            if (_arg1.accept){
                this.rootClass.chatF.submitMsg(_arg1.emote1, "emote", this.rootClass.sfc.myUserName);
            }
            else {
                _local2 = {};
                _local2.typ = "danceDenied";
                _local2.cell = this.strFrame;
                this.rootClass.sfc.sendObjectToGroup(_local2, [_arg1.sender.getId()], this.curRoom);
            };
        }

        public function rest():void{
            if (!this.restTimer.running){
                this.myAvatar.pMC.mcChar.gotoAndPlay("Rest");
                this.rootClass.sfc.sendXtMessage("zm", "emotea", ["rest"], "str", 1);
                this.restStart();
            };
        }

        public function restStart(){
            this.afkPostpone();
            this.restTimer.reset();
            this.restTimer.start();
        }

        public function restRequest(_arg1:TimerEvent){
            var _local2:* = this.getUoLeafById(this.myAvatar.uid);
            if (((((((!((_local2.intHP == _local2.intHPMax))) || (!((_local2.intMP == _local2.intMPMax))))) && ((this.myAvatar.pMC.mcChar.currentLabel == "Rest")))) && ((_local2.intState == 1)))){
                if (this.coolDown("rest")){
                    this.rootClass.sfc.sendXtMessage("zm", "restRequest", [""], "str", 1);
                    this.restTimer.reset();
                    this.restTimer.start();
                }
                else {
                    this.restStart();
                };
            }
            else {
                this.restTimer.reset();
            };
        }

        public function afkToggle():void{
            var _local1:* = this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()];
            if (_local1 != null){
                this.rootClass.sfc.sendXtMessage("zm", "afk", [!(_local1.afk)], "str", 1);
            };
        }
		
		public function vendingToggle():void{
            var _local1:* = this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()];
            if (_local1 != null){
                this.rootClass.sfc.sendXtMessage("zm", "vending", [!(_local1.vending)], "str", 1);
            };
        }

        public function afkTimerHandler(_arg1:Event):void{
            var _local2:* = this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()];
            if (_local2 != null){
                this.rootClass.sfc.sendXtMessage("zm", "afk", [true], "str", 1);
            };
        }
		

        public function afkPostpone():void{
            this.afkTimer.reset();
            this.afkTimer.start();
            var _local1:* = new Date().getTime();
            var _local2:* = this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()];
            if (((((!((_local2 == null))) && (_local2.afk))) && ((((_local2.afkts == null)) || ((_local1 > (_local2.afkts + 500))))))){
                this.rootClass.sfc.sendXtMessage("zm", "afk", [false], "str", 1);
                _local2.afkts = _local1;
            };
        }
		
		public function vendingPostpone():void{
            var _local1:* = new Date().getTime();
            var _local2:* = this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()];
            if (((((!((_local2 == null))) && (_local2.vending))))){
                this.rootClass.sfc.sendXtMessage("zm", "vending", [false], "str", 1);
                _local2.vendingts = _local1;
            };
        }

        public function hideAllPets():void{
            var _local1:*;
            for (_local1 in this.avatars) {
                if (this.avatars[_local1] != null){
                    this.avatars[_local1].unloadPet();
                };
            };
        }

        public function showAllPets():void{
            var _local1:*;
            var _local2:Object;
            var _local3:*;
            for (_local1 in this.avatars) {
                _local2 = this.getUoLeafById(_local1);
                _local3 = String(_local2.strFrame);
                if (_local3 == this.strFrame){
                    this.avatars[_local1].loadPet();
                };
            };
        }

        public function updateMonsters(){
            var _local1:int;
            if (this.monmap != null){
                _local1 = 0;
                while (_local1 < this.monmap.length) {
                    if (this.monmap[_local1].strFrame == this.strFrame){
                        this.updateMonster(this.monmap[_local1]);
                    };
                    _local1++;
                };
            };
        }

        public function updateMonster(_arg1:Object):void{
            var _local2:* = this.getMonsterDefinition(_arg1.MonID);
            var _local3:* = this.getMonster(_arg1.MonMapID);
            if (_local3.pMC == null){
                trace((">> Monster Pad Missing - MonMapID:" + _arg1.MonMapID));
                return;
            };
            _local3.objData.intMPMax = int(_local3.objData.intMPMax);
            _local3.objData.intHPMax = int(_local3.objData.intMPMax);
            var _local4:* = this.monTree[_arg1.MonMapID];
            if (((!((_local4.MonID == _local3.objData.MonID))) || ((_local4.intState == 0)))){
                _local3.pMC.visible = false;
            };
            if ((_local3.pMC.x - this.myAvatar.pMC.x) >= 0){
                _local3.pMC.turn("left");
            };
            _local3.pMC.updateNamePlate();
        }

        public function createMonsterMC(_arg1:MovieClip, _arg2:int, _arg3:Boolean=false):MonsterMC{
            var _local5:MonsterMC;
            var _local6:int;
            var _local7:Class;
            var _local4:* = this.getMonsterDefinition(_arg2);
            if (_arg3){
                _local6 = Math.round((Math.random() * (this.chaosNames.length - 1)));
                trace("chaos names");
                trace(this.chaosNames);
                if (this.chaosNames[_local6] != this.rootClass.world.myAvatar.objData.strUsername){
                    _local5 = new MonsterMC(this.chaosNames[_local6]);
                }
                else {
                    _local6 = (((_local6)==0) ? ++_local6 : --_local6);
                    _local5 = new MonsterMC(this.chaosNames[_local6]);
                };
                trace(("mon name: " + this.chaosNames[_local6]));
            }
            else {
                if (Number((this.objExtra["bChar"] == 1))){
                    _local5 = new MonsterMC(this.myAvatar.objData.strUsername);
                }
                else {
                    _local5 = new MonsterMC(_local4.strMonName);
                };
            };
            this.CHARS.addChild(_local5);
            _local5.x = _arg1.x;
            _local5.y = _arg1.y;
            _local5.ox = _local5.x;
            _local5.oy = _local5.y;
            if (Number((this.objExtra["bChar"] == 1))){
                _local5.removeChildAt(1);
                _local5.addChildAt((new dummyMC() as MovieClip), 1);
                this.copyAvatarMC((_local5.getChildAt(1) as MovieClip));
            }
            else {
                _local7 = (this.loaderD.getDefinition(_local4.strLinkage) as Class);
                _local5.removeChildAt(1);
                _local5.addChildAt(new (_local7)(), 1);
            };
            _local5.mouseEnabled = false;
            _local5.bubble.mouseEnabled = (_local5.bubble.mouseChildren = false);
            _local5.init();
            if (("strDir" in _arg1)){
                if (_arg1.strDir == "static"){
                    _local5.isStatic = true;
                };
            };
            if (("noMove" in _arg1)){
                _local5.noMove = _arg1.noMove;
            };
            return (_local5);
        }

        public function getMonDataById(){
        }

        public function retrieveMonData(){
            this.rootClass.sfc.sendXtMessage("zm", "retrieveMonData", [], "str", 1);
        }

        private function getMonID(_arg1:int):int{
            var _local2:String;
            var _local3:*;
            for (_local2 in this.monTree) {
                _local3 = this.monTree[_local2];
                if (_local3.MonMapID == _arg1){
                    return (_local3.MonID);
                };
            };
            return (-1);
        }

        private function getMonsterDefinition(_arg1:int):Object{
            var _local2:int;
            while (_local2 < this.mondef.length) {
                if (this.mondef[_local2].MonID == _arg1){
                    return (this.mondef[_local2]);
                };
                _local2++;
            };
            return (null);
        }

        public function getMonster(_arg1:int):Avatar{
            var _local2:int;
            while (_local2 < this.monsters.length) {
                if ((((this.monsters[_local2].objData.MonMapID == _arg1)) && ((this.monsters[_local2].objData.MonID == this.monTree[_arg1].MonID)))){
                    return (this.monsters[_local2]);
                };
                _local2++;
            };
            return (null);
        }

        public function getMonsters(_arg1:int):Array{
            var _local2:Array = [];
            var _local3:int;
            while (_local3 < this.monsters.length) {
                if (this.monsters[_local3].objData.MonMapID == _arg1){
                    _local2.push(this.monsters[_local3]);
                };
                _local3++;
            };
            if (_local2.length > 0){
                return (_local2);
            };
            return (null);
        }

        public function getMonsterCluster(_arg1:int):Array{
            var _local2:* = [];
            var _local3:int;
            while (_local3 < this.monsters.length) {
                if (this.monsters[_local3].objData.MonMapID == _arg1){
                    _local2.push(this.monsters[_local3]);
                };
                _local3++;
            };
            return (_local2);
        }

        public function getMonstersByCell(_arg1:String):Array{
            var _local2:Array = [];
            var _local3:int;
            while (_local3 < this.monsters.length) {
                if (((!((this.monsters[_local3].dataLeaf == null))) && ((this.monsters[_local3].dataLeaf.strFrame == _arg1)))){
                    _local2.push(this.monsters[_local3]);
                };
                _local3++;
            };
            return (_local2);
        }

        public function initMonsters(_arg1:Array, _arg2:Array){
            var _local4:Object;
            var _local5:int;
            var _local6:*;
            var _local7:*;
            var _local8:*;
            var _local3:int;
            if (((!((_arg1 == null))) && (!((_arg2 == null))))){
                this.monswf = new Array();
                this.monsters = new Array();
                _local4 = null;
                _local3 = 0;
                while (_local3 < _arg2.length) {
                    _local5 = 0;
                    while (_local5 < _arg1.length) {
                        if (_arg2[_local3].MonID == _arg1[_local5].MonID){
                            _local4 = _arg1[_local5];
                        };
                        _local5++;
                    };
                    this.monsters.push(new Avatar(this.rootClass));
                    _local6 = this.monsters[(this.monsters.length - 1)];
                    _local6.npcType = "monster";
                    if (_local6.objData == null){
                        _local6.objData = {};
                    };
                    for (_local7 in _local4) {
                        _local6.objData[_local7] = _local4[_local7];
                    };
                    for (_local7 in _arg2[_local3]) {
                        _local6.objData[_local7] = _arg2[_local3][_local7];
                    };
                    _local8 = this.monTree[String(_local6.objData.MonMapID)];
                    _local8.strFrame = String(_local6.objData.strFrame);
                    if (_local8.MonID == _local6.objData.MonID){
                        _local6.dataLeaf = this.monTree[_local6.objData.MonMapID];
                    }
                    else {
                        _local6.dataLeaf = null;
                    };
                    _local3++;
                };
                _local3 = 0;
                while (_local3 < _arg1.length) {
                    trace(((((_local3 + "  ") + this.rootClass.getFilePath()) + "mon/") + _arg1[_local3].strMonFileName));
                    this.queueLoad({
                        strFile:((this.rootClass.getFilePath() + "mon/") + _arg1[_local3].strMonFileName),
                        callBackA:this.onMonLoadComplete
                    });
                    _local3++;
                };
            };
        }

        private function onMonLoadComplete(_arg1:Event){
            this.monswf.push(MovieClip(Loader(_arg1.target.loader).content));
            trace(((((("      >>>> successful " + Loader(_arg1.target.loader).contentLoaderInfo.url) + " ") + this.monswf.length) + " / ") + this.mondef.length));
            if (this.monswf.length == this.mondef.length){
                this.enterMap();
            };
        }

        public function setTarget(_arg1){
            if (((!((this.myAvatar == null))) && (!((this.myAvatar.target == _arg1))))){
                if (this.myAvatar.target != null){
                    if (this.myAvatar.target.npcType == "monster"){
                        if (((((this.bPvP) && (!((this.myAvatar.target.dataLeaf.react == null))))) && ((this.myAvatar.target.dataLeaf.react[this.myAvatar.dataLeaf.pvpTeam] == 1)))){
                            this.myAvatar.target.pMC.modulateColor(this.avtPCT, "-");
                        }
                        else {
                            this.myAvatar.target.pMC.modulateColor(this.avtMCT, "-");
                        };
                    };
                    if (this.myAvatar.target.npcType == "player"){
                        if (((this.bPvP) && (!((this.myAvatar.target.dataLeaf.pvpTeam == this.myAvatar.dataLeaf.pvpTeam))))){
                            this.myAvatar.target.pMC.modulateColor(this.avtMCT, "-");
                        }
                        else {
                            this.myAvatar.target.pMC.modulateColor(this.avtPCT, "-");
                        };
                    };
                };
                if (_arg1 != null){
                    if (((!(this.bPvP)) && ((_arg1.npcType == "player")))){
                        if (this.autoActionTimer != null){
                            this.cancelAutoAttack();
                        };
                    };
                    this.myAvatar.target = _arg1;
                    if (this.myAvatar.target.npcType == "monster"){
                        if (((((this.bPvP) && (!((this.myAvatar.target.dataLeaf.react == null))))) && ((this.myAvatar.target.dataLeaf.react[this.myAvatar.dataLeaf.pvpTeam] == 1)))){
                            this.myAvatar.target.pMC.modulateColor(this.avtPCT, "+");
                        }
                        else {
                            this.myAvatar.target.pMC.modulateColor(this.avtMCT, "+");
                        };
                    };
                    if (this.myAvatar.target.npcType == "player"){
                        if (((this.bPvP) && (!((this.myAvatar.target.dataLeaf.pvpTeam == this.myAvatar.dataLeaf.pvpTeam))))){
                            this.myAvatar.target.pMC.modulateColor(this.avtMCT, "+");
                        }
                        else {
                            this.myAvatar.target.pMC.modulateColor(this.avtPCT, "+");
                        };
                    };
                    this.rootClass.showPortraitTarget(_arg1);
                } else {
                    this.rootClass.hidePortraitTarget();
                    if (this.myAvatar.dataLeaf.intState > 0){
                       this.exitCombat();
                    };
                    this.myAvatar.target = null;
                };
            };
        }

        public function cancelTarget():void{
            if (((!((this.autoActionTimer == null))) && (this.autoActionTimer.running))){
                this.cancelAutoAttack();
                this.myAvatar.pMC.mcChar.gotoAndStop("Idle");
                return;
            };
			//this.rootClass.mcPortraitTarget.visible = false;
			
            if (this.myAvatar.target != null){
                this.setTarget(null);
                return;
            };
			
        }
		/*
        public function approachTarget(){
            var _local3:Object;
            var _local5:Boolean;
            var _local6:Point;
            var _local7:Point;
            var _local8:Number;
            var _local9:Number;
            var _local10:int;
            var _local11:int;
            var _local12:int;
            var _local13:int;
            var _local14:int;
            var _local15:int;
            var _local16:*;
            var _local17:*;
            var _local18:*;
            var _local19:int;
            var _local20:int;
            var _local21:Array;
            var _local22:Array;
            var _local1:Boolean = true;
            var _local2:Object = this.uoTree[this.rootClass.sfc.myUserName];
            var _local4:Object = this.getAutoAttack();
			if(this.myAvatar.onCasting == true){
				rootClass.ui.mcCastBar.fClose();
				this.myAvatar.onCasting == false;
			}
            if (this.myAvatar.target != null){
                if (this.myAvatar.target.npcType == "monster"){
                    _local3 = this.monTree[this.myAvatar.target.objData.MonMapID];
                }
                else {
                    if (this.myAvatar.target.npcType == "player"){
                        _local3 = this.myAvatar.target.dataLeaf;
                    };
                };
                if ((((((_local3 == null)) || ((_local2.intState == 0)))) || ((_local3.intState == 0)))){
                    _local1 = false;
                };
                trace(("bPvP ? " + this.bPvP));
                trace(("myAvatar.target.npcType ? " + (this.myAvatar.target.npcType == "player")));
                if (((((this.bPvP) && (((((!((_local3.react == null))) && ((_local3.react[_local2.pvpTeam] == 1)))) || ((_local2.pvpTeam == _local3.pvpTeam)))))) || (((!(this.bPvP)) && ((this.myAvatar.target.npcType == "player")))))){
                    _local1 = false;
                };
                if (_local1){
                    this.rootClass.mixer.playSound("ClickBig");
                    if (_local4 != null){
                        if (this.actionRangeCheck(_local4)){
                            this.testAction(_local4);
                        }    else {
                            this.actionReady = true;
                            _local5 = false;
                            _local6 = this.myAvatar.pMC.mcChar.localToGlobal(new Point(0, 0));
                            _local7 = this.myAvatar.target.pMC.mcChar.localToGlobal(new Point(0, 0));
                            if (_local4.range > 301){
                                _local8 = Point.distance(_local6, _local7);
                                _local9 = (_local4.range * this.SCALE);
                                _local9 = (_local9 * 0.9);
                                if (_local9 < _local8){
                                    _local7 = Point.interpolate(_local6, _local7, (_local9 / _local8));
                                };
                                _local5 = !(this.padHit(_local7.x, _local7.y, this.myAvatar.pMC.shadow.getBounds(this.rootClass.stage)));
                            }
                            else {
                                _local10 = 0;
                                while ((((_local10 < 100)) && (!(_local5)))) {
                                    _local11 = int((50 + (Math.random() * 110)));
                                    if (_local10 > 50){
                                        _local11 = (_local11 * -1);
                                    };
                                    _local12 = ((((_local7.x - _local6.x))>=0) ? -(_local11) : _local11);
                                    _local13 = ((Math.random() * 40) - 20);
                                    _local12 = Math.ceil((_local12 * this.SCALE));
                                    _local13 = Math.floor((_local13 * this.SCALE));
                                    _local14 = (_local7.x + _local12);
                                    _local15 = (_local7.y + _local13);
                                    _local5 = !(this.padHit(_local14, _local15, this.myAvatar.pMC.shadow.getBounds(this.rootClass.stage)));
                                    _local10++;
                                };
                                _local7.x = (_local7.x + _local12);
                                _local7.y = (_local7.y + _local13);
                            };
                            if (_local5){
                                this.myAvatar.pMC.walkTo(_local7.x, _local7.y, (this.WALKSPEED * 2));
                                this.pushMove(this.myAvatar.pMC, _local7.x, _local7.y, (this.WALKSPEED * 2));
                            }  else {
                                this.rootClass.chatF.pushMsg("server", "No path found!", "SERVER", "", 0);
                            };
                        };
                    };
                };
            }
            else {
                _local16 = this.myAvatar;
                _local17 = null;
                _local18 = null;
                _local19 = ((("tgtMin" in _local4)) ? _local4.tgtMin : 1);
                _local20 = ((("tgtMax" in _local4)) ? _local4.tgtMax : 1);
                _local21 = [];
                _local22 = this.getAllAvatarsInCell();
                for each (_local17 in _local22) {
                    _local3 = _local17.dataLeaf;
                    if (((((!((_local3 == null))) && (((((((!(this.bPvP)) && ((_local17.npcType == "monster")))) || (((((this.bPvP) && ((_local17.npcType == "player")))) && (!((_local2.pvpTeam == _local3.pvpTeam))))))) || (((((((this.bPvP) && ((_local17.npcType == "monster")))) && (!((_local3.react == null))))) && ((_local3.react[_local2.pvpTeam] == 0)))))))) && (this.actionRangeCheck(_local4, _local17)))){
                        this.setTarget(_local17);
                        this.testAction(_local4);
                        return;
                    };
                };
                this.rootClass.chatF.pushMsg("warning", "No target selected!", "SERVER", "", 0);
            };
        }*/
		
		public function approachTarget()
        {
            var clickOK:Boolean;
            var cLeaf:Object;
            var tLeaf:Object;
            var actionObj:Object;
            var cReg:Point;
            var tReg:Point;
            var softScale:Number;
            var tries:int;
            var buffer:int;
            var xBuffer:int;
            var yBuffer:int;
            var xTarget:int;
            var yTarget:int;
            var moveOK:Boolean;
            var cAvt:*;
            var tAvt:*;
            var pAvt:*;
            var tgtMin:int;
            var tgtMax:int;
            var targets:Array;
            var scan:Array;
            clickOK = true;
            cLeaf = uoTree[rootClass.sfc.myUserName];
            actionObj = getAutoAttack();
            if (myAvatar.target != null){
                if (myAvatar.target.npcType == "monster"){
                    tLeaf = monTree[myAvatar.target.objData.MonMapID];
                } else {
                    if (myAvatar.target.npcType == "player"){
                        tLeaf = myAvatar.target.dataLeaf;
                    };
                };
                if ((((((tLeaf == null)) || ((cLeaf.intState == 0)))) || ((tLeaf.intState == 0)))){
					//if(actionObj.nam != "Resurrect"){
						clickOK = false;
					//};
                   
                };
                trace(("bPvP ? " + bPvP));
                trace(("myAvatar.target.npcType ? " + (myAvatar.target.npcType == "player")));
                if (((((bPvP) && (((((!((tLeaf.react == null))) && ((tLeaf.react[cLeaf.pvpTeam] == 1)))) || ((cLeaf.pvpTeam == tLeaf.pvpTeam)))))) || (((!(bPvP)) && ((myAvatar.target.npcType == "player")))))){
                    clickOK = false;
                };
                if (clickOK){
                    rootClass.mixer.playSound("ClickBig");
                    if (actionObj != null){
                        if (actionRangeCheck(actionObj)){
                            testAction(actionObj);
                        } else {
                            actionReady = true;
                            cReg = myAvatar.pMC.mcChar.localToGlobal(new Point(0, 0));
                            tReg = myAvatar.target.pMC.mcChar.localToGlobal(new Point(0, 0));
                            softScale = SCALE;
                            tries = 0;
                            moveOK = false;
                            while ((((tries < 100)) && (!(moveOK)))) {
                                buffer = int((150 + (Math.random() * 20)));
                                if (tries > 50){
                                    buffer = (buffer * -1);
                                };
                                xBuffer = ((((tReg.x - cReg.x))>=0) ? -(buffer) : buffer);
                                yBuffer = ((Math.random() * 40) - 20);
                                xBuffer = Math.ceil((xBuffer * softScale));
                                yBuffer = Math.floor((yBuffer * softScale));
                                xTarget = (tReg.x + xBuffer);
                                yTarget = (tReg.y + yBuffer);
                                moveOK = !(padHit(xTarget, yTarget, myAvatar.pMC.shadow.getBounds(stage)));
                                tries++;
                            };
                            if (moveOK){
                                myAvatar.pMC.walkTo((myAvatar.target.pMC.x + xBuffer), (myAvatar.target.pMC.y + yBuffer), 32);
                                pushMove(myAvatar.pMC, (myAvatar.target.pMC.x + xBuffer), (myAvatar.target.pMC.y + yBuffer), 32);
                            } else {
                                rootClass.chatF.pushMsg("server", "No path found!", "SERVER", "", 0);
                            };
                        };
                    };
                };
            } else {
                cAvt = myAvatar;
                tAvt = null;
                pAvt = null;
                tgtMin = ((("tgtMin" in actionObj)) ? actionObj.tgtMin : 1);
                tgtMax = ((("tgtMax" in actionObj)) ? actionObj.tgtMax : 1);
                targets = [];
                scan = getAllAvatarsInCell();
                for each (tAvt in scan) {
                    tLeaf = tAvt.dataLeaf;
                    if (((((!((tLeaf == null))) && (((((((!(bPvP)) && ((tAvt.npcType == "monster")))) || (((((bPvP) && ((tAvt.npcType == "player")))) && (!((cLeaf.pvpTeam == tLeaf.pvpTeam))))))) || (((((((bPvP) && ((tAvt.npcType == "monster")))) && (!((tLeaf.react == null))))) && ((tLeaf.react[cLeaf.pvpTeam] == 0)))))))) && (actionRangeCheck(actionObj, tAvt)))){
                        setTarget(tAvt);
                        testAction(actionObj);
                        return;
                    };
                };
                rootClass.chatF.pushMsg("warning", "No target selected!", "SERVER", "", 0);
            };
        }

        public function padHit(_arg1:int, _arg2:int, _arg3:Rectangle):Boolean{
            var _local5:Rectangle;
            var _local6:MovieClip;
            var _local4:int;
            if ((((((((_arg1 < 0)) || ((_arg1 > 1260)))) || ((_arg2 < 10)))) || ((_arg2 > 530)))){
                return (false);
            };
            _arg3.x = int((_arg1 - (_arg3.width / 2)));
            _arg3.y = int((_arg2 - (_arg3.height / 2)));
            _local4 = 0;
            while (_local4 < this.arrEvent.length) {
                _local6 = this.arrEvent[_local4];
                if (((("strSpawnCell" in _local6)) || (("tCell" in _local6)))){
                    _local5 = this.arrEventR[_local4];
                    if (_arg3.intersects(_local5)){
                        return (true);
                    };
                };
                _local4++;
            };
            return (false);
        }

        public function drawRects(_arg1:Array):void{
            var _local5:Rectangle;
            var _local2:Array = [0xFF0000, 0xFF00, 0xFF];
            var _local3:Sprite = new Sprite();
            var _local4:Graphics = _local3.graphics;
            var _local6:int;
            _local6 = 0;
            while (_local6 < _arg1.length) {
                _local5 = _arg1[_local6];
                _local4.moveTo(_local5.x, _local5.y);
                _local4.beginFill(_local2[_local6], 0.3);
                _local4.lineTo((_local5.x + _local5.width), _local5.y);
                _local4.lineTo((_local5.x + _local5.width), (_local5.y + _local5.height));
                _local4.lineTo(_local5.x, (_local5.y + _local5.height));
                _local4.lineTo(_local5.x, _local5.y);
                _local4.endFill();
                _local6++;
            };
        }

        public function testAction(_arg1:Object, _arg2:Boolean=false){
            var tLeaf:Object;
            var aura:Object;
            var pet:* = undefined;
            var tgtOK:Boolean;
            var sAvt:Avatar;
            var to:Object;
            var now:Number;
            var actionObj:Object = _arg1;
            var forceAARangeError:Boolean = _arg2;
            trace(("testAction > " + actionObj.nam));
            var a:int;
            var b:int;
            var c:int;
            var cLeaf:Object = this.uoTreeLeaf(this.rootClass.sfc.myUserName);
            var cAvt:* = this.myAvatar;
            var tAvt:* = null;
            var pAvt:* = null;
            var tgtMin:int = ((("tgtMin" in actionObj)) ? actionObj.tgtMin : 1);
            var tgtMax:int = ((("tgtMax" in actionObj)) ? actionObj.tgtMax : 1);
            var targets:Array = [];
            var scan:Array = this.getAllAvatarsInCell();
            a = 0;
            while (a < scan.length) {
                tAvt = scan[a];
				/** THIS **/
				if ((((((tAvt.dataLeaf == null)) || ((tAvt.dataLeaf.intState == 0)))) || ((((tAvt.pMC == null)) || ((tAvt.pMC.x == null)))))){
					//this.rootClass.chatF.pushMsg("warning", "INSIDE", "SERVER", "", 0);
					scan.splice(a, 1);
					a = (a - 1);
					if (tAvt == this.myAvatar.target){
						if(actionObj.nam != "Resurrect"){
							this.setTarget(null);
						};
					};
                };
                a = (a + 1);
            };
            a = 0;
            tAvt = null;
            if (((!((this.myAvatar.target == null))) && ((scan.indexOf(this.myAvatar.target) > -1)))){
                scan.unshift(scan.splice(scan.indexOf(this.myAvatar.target), 1)[0]);
            };
            this.afkPostpone();
			this.vendingPostpone();
            var errMsg:String = "none";
            var forceAAloop:Boolean;
            if (!this.actionTimeCheck(actionObj)){
                errMsg = (("Ability '" + actionObj.nam) + "' is not ready yet.");
            };
            if ((((((errMsg == "none")) && (!((actionObj.mp == null))))) && ((Math.round((actionObj.mp * cLeaf.sta["$cmc"])) > cLeaf.intMP)))){
                errMsg = "Not enough mana!";
            };
            if ((((errMsg == "none")) && (!((actionObj.sp == null))))){
                if (!this.checkSP(actionObj.sp, cLeaf)){
                    errMsg = "Not Enough Spirit Power!";
                };
            };
            if ((((((errMsg == "none")) && ((actionObj.ref == "i1")))) && ((actionObj.sArg1 == "")))){
                errMsg = "No item assigned to that slot!";
            };
            if ((((((((((errMsg == "none")) && (!((this.myAvatar.target == null))))) && (("filter" in actionObj)))) && (("sRace" in this.myAvatar.target.objData)))) && (!((this.myAvatar.target.objData.sRace.toLowerCase() == actionObj.filter.toLowerCase()))))){
                errMsg = (("Target is not a " + actionObj.filter) + "!");
            };
            if (errMsg == "none"){
                for each (aura in cLeaf.auras) {
                    try {
                        if (aura.cat != null){
                            if (aura.cat == "stun"){
                                errMsg = "Cannot act while stunned!";
                            };
							/* Addon Aura Errors */
							if (aura.cat == "hex"){
                                errMsg = "Cannot act while in hex!";
                            };
							if (aura.cat == "freeze"){
                                errMsg = "Cannot act while frozen!";
                            };
							/* End */
                            if (aura.cat == "stone"){
                                errMsg = "Cannot act while petrified!";
                            };
                            if (aura.cat == "disabled"){
                                errMsg = "Cannot act while disabled!";
                            };
							if (aura.cat == "silenced"){
                                errMsg = "Cannot act while silenced!";
                            };
                            if (errMsg != "none"){
                                forceAAloop = true;
                            };
                        };
                    }
                    catch(e:Error) {
                        trace(("combat.auraPreFlight > " + e));
                    };
                };
            };
            if (errMsg == "none"){
                if (actionObj.pet != null){
                    pet = cAvt.getItemByEquipSlot("pe");
                    if (cAvt.getItemByEquipSlot("pe") == null){
                        if (cAvt.checkTempItem(actionObj.pet, 1)){
                            this.summonPet(actionObj.pet, true);
                        }
                        else {
                            this.summonPet(actionObj.pet, false);
                        };
                    };
                }
                else {
                    if (actionObj.checkPet != null){
                        if (cAvt.getItemByEquipSlot("pe").sMeta.indexOf(actionObj.checkPet) == -1){
                            errMsg = "No battle pet equipped.";
                        };
                    };
                };
            };
            if ((((errMsg == "none")) || (forceAAloop))){
                if (this.myAvatar.target != null){
                    tAvt = this.myAvatar.target;
                    if (this.myAvatar.target.npcType == "monster"){
                        tLeaf = this.monTree[tAvt.objData.MonMapID];
                    }
                    else {
                        if (tAvt.npcType == "player"){
                            tLeaf = tAvt.dataLeaf;
                        };
                    };
                };
                switch (actionObj.tgt){
                    case "h":
                        if (tAvt == null){
                            if (tgtMin > 0){
                                for each (tAvt in scan) {
                                    tLeaf = tAvt.dataLeaf;
                                    if (((((!((tLeaf == null))) && (((((((!(this.bPvP)) && ((tAvt.npcType == "monster")))) || (((((this.bPvP) && ((tAvt.npcType == "player")))) && (!((cLeaf.pvpTeam == tLeaf.pvpTeam))))))) || (((((((this.bPvP) && ((tAvt.npcType == "monster")))) && (!((tLeaf.react == null))))) && ((tLeaf.react[cLeaf.pvpTeam] == 0)))))))) && (this.actionRangeCheck(actionObj, tAvt)))){
                                        this.setTarget(tAvt);
                                        this.testAction(actionObj);
                                        return;
                                    };
                                };
                                errMsg = "No target selected!";
                                if (actionObj.typ == "aa"){
                                    this.cancelAutoAttack();
                                };
                            };
                        }
                        else {
                            if (((((((!(this.bPvP)) && ((tAvt.npcType == "player")))) || (((((this.bPvP) && ((tAvt.npcType == "player")))) && ((cLeaf.pvpTeam == tLeaf.pvpTeam)))))) || (((((((this.bPvP) && ((tAvt.npcType == "monster")))) && (!((tLeaf.react == null))))) && ((tLeaf.react[cLeaf.pvpTeam] == 1)))))){
                                errMsg = "Can't attack that target!";
                                if (actionObj.typ == "aa"){
                                    this.cancelAutoAttack();
                                };
                            };
                            if ((((tgtMin > 0)) && ((tAvt.dataLeaf.intState == 0)))){
                                errMsg = "Your target is dead!";
                            };
                        };
                        break;
					case "r":
                        tLeaf = tAvt.dataLeaf;
                        break;
                    case "f":
                        if (tAvt == null){
                            this.setTarget(this.myAvatar);
                            tAvt = this.myAvatar;
                            tLeaf = tAvt.dataLeaf;
                        };
                        if (((((((!(this.bPvP)) && ((tAvt.npcType == "monster")))) || (((this.bPvP) && (!((cLeaf.pvpTeam == tLeaf.pvpTeam))))))) || (((((((this.bPvP) && ((tAvt.npcType == "monster")))) && (!((tLeaf.react == null))))) && ((tLeaf.react[cLeaf.pvpTeam] == 1)))))){
                            tAvt = this.myAvatar;
                        };
                        tLeaf = tAvt.dataLeaf;
                        break;
                    case "s":
                        if (tAvt == null){
                            this.setTarget(this.myAvatar);
                            tAvt = this.myAvatar;
                        };
                        if (((!((tAvt == null))) && (!((tAvt == this.myAvatar))))){
                            tAvt = this.myAvatar;
                        };
                        tLeaf = tAvt.dataLeaf;
                        break;
                };
                pAvt = tAvt;
                if ((((((errMsg == "none")) && (!(this.actionRangeCheck(actionObj, pAvt))))) || (forceAAloop))){
                    if (!forceAAloop){
                        errMsg = "You are out of range!  Move closer to your target!";
                    };
                    if (actionObj.typ == "aa"){
                        this.autoActionTimer.delay = 500;
                        this.autoActionTimer.reset();
                        this.autoActionTimer.start();
                    };
                };
                tgtOK = true;
                if (errMsg == "none"){
                    while (scan.length > 0) {
                        tAvt = scan[0];
                        tLeaf = tAvt.dataLeaf;
                        tgtOK = true;
                        if (tLeaf.intState == 0){
							//if(actionObj.nam != "Resurrect"){
								tgtOK = false;
							//};
                        };
                        if (((((!((tAvt == null))) && (("filter" in actionObj)))) && (("sRace" in tAvt.objData)))){
                            if (tAvt.objData.sRace.toLowerCase() != actionObj.filter.toLowerCase()){
                                tgtOK = false;
                            };
                        };
                        switch (actionObj.tgt){
                            case "h":
                                if (((((((!(this.bPvP)) && ((tAvt.npcType == "player")))) || (((((this.bPvP) && ((tAvt.npcType == "player")))) && ((cLeaf.pvpTeam == tLeaf.pvpTeam)))))) || (((((((this.bPvP) && ((tAvt.npcType == "monster")))) && (!((tLeaf.react == null))))) && ((tLeaf.react[cLeaf.pvpTeam] == 1)))))){
                                    tgtOK = false;
                                };
                                break;
                            case "f":
                                if (((((((!(this.bPvP)) && ((tAvt.npcType == "monster")))) || (((this.bPvP) && (!((cLeaf.pvpTeam == tLeaf.pvpTeam))))))) || (((((((this.bPvP) && ((tAvt.npcType == "monster")))) && (!((tLeaf.react == null))))) && ((tLeaf.react[cLeaf.pvpTeam] == 1)))))){
                                    tgtOK = false;
                                };
                                break;
							case "r":
                                break;
                            case "s":
                                if (((!((tAvt == null))) && (!((tAvt == this.myAvatar))))){
                                    tgtOK = false;
                                };
                                break;
                        };
                        if (tgtOK){
                            sAvt = this.myAvatar;
                            if ((((actionObj.fx == "c")) && ((targets.length > 0)))){
                                sAvt = targets[(targets.length - 1)].avt;
                            };
                            a = Math.abs((tAvt.pMC.x - sAvt.pMC.x));
                            b = Math.abs((tAvt.pMC.y - sAvt.pMC.y));
                            c = Math.pow(((a * a) + (b * b)), 0.5);
                            if (this.actionRangeCheck(actionObj, tAvt)){
                                targets.push({
                                    avt:tAvt,
                                    d:c,
                                    hp:tLeaf.intHP
                                });
                            };
                        };
                        scan.shift();
                    };
                };
                targets.sortOn("hp", Array.NUMERIC);
                if (pAvt != null){
                    a = 0;
                    while (a < targets.length) {
                        to = targets[a];
                        if (to.avt == pAvt){
                            targets.unshift(targets.splice(a, 1)[0]);
                        };
                        a = (a + 1);
                    };
                };
                if (targets.length > tgtMax){
                    targets = targets.splice(0, tgtMax);
                };
                if (targets.length > 0){
                    if (pAvt != null){
                        if (((!((targets[0].avt == null))) && (!((targets[0].avt.dataLeaf == null))))){
                            tAvt = targets[0].avt;
                            tLeaf = tAvt.dataLeaf;
                        }
                        else {
                            tAvt = null;
                            tLeaf = null;
                        };
                    }
                    else {
                        tAvt = null;
                        tLeaf = null;
                    };
                };
            };
            if (errMsg == "none"){
                if (cLeaf.intState != 0){
					
                    if (((((!(actionObj.lock)) && ((((tLeaf == null)) || (!((tLeaf.intState == 0))))))) && ((targets.length >= tgtMin)))){
						trace("CASTING:" + actionObj.casting);
						if(actionObj.casting != 0){
							/** CASTING **/
							this.myAvatar.onCasting = true;
							rootClass.chatF.submitMsg("/" + actionObj.castanimation, "emotea", rootClass.sfc.myUserName);
							var castObj:* = {};
							castObj.typ = "generic";
							castObj.callback = castingDone;
							castObj.args = {str:actionObj,str2:targets};
							castObj.dur = actionObj.casting;//4
							castObj.txt = "Casting...";
							rootClass.ui.mcCastBar.fOpenWith(castObj);
						} else {
							this.myAvatar.onCasting == false;
							this.doAction(actionObj, targets);
						};						
                    };
                    if ((((this.myAvatar.target == null)) || ((((tLeaf == null)) || ((tLeaf.intState == 0)))))){
                        this.exitCombat();
                    };
                };
            }
            else {
                now = new Date().getTime();
                if ((((errMsg == "You are out of range!  Move closer to your target!")) && (((!((actionObj.typ == "aa"))) || (forceAARangeError))))){
                    if ((now - this.actionRangeSpamTS) > 3000){
                        this.actionRangeSpamTS = now;
                        this.rootClass.chatF.pushMsg("warning", errMsg, "SERVER", "", 0);
                    };
                }
                else {
                    if (actionObj.typ != "aa"){
                        this.rootClass.chatF.pushMsg("warning", errMsg, "SERVER", "", 0);
                    };
                };
            };
        }

        public function summonPet(_arg1:int, _arg2:Boolean){
            if (_arg2){
                this.rootClass.sfc.sendXtMessage("zm", "equipItem", [_arg1], "str", this.curRoom);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "summonPet", [_arg1], "str", this.curRoom);
            };
        }

        public function autoActionHandler(_arg1:TimerEvent){
            trace("* autoActionHandler >");
            if (((((((((!((this.myAvatar.dataLeaf == null))) && (!((this.myAvatar.dataLeaf.intState == 0))))) && (!((this.myAvatar.target == null))))) && (!((this.myAvatar.target.dataLeaf == null))))) && (!((this.myAvatar.target.dataLeaf.intState == 0))))){
				//if(this.myAvatar.onCasting == false){
					this.testAction(this.getAutoAttack(), true);
					//this.myAvatar.onCasting == false;
				//} else {
					//this.myAvatar.onCasting == false;
				//}
            }
            else {
                this.exitCombat();
            };
        }

        public function getAutoAttack():Object{
            var _local1:* = 0;
            while (_local1 < this.actions.active.length) {
                if (((((!((this.actions.active[_local1] == null))) && (!((this.actions.active[_local1].auto == null))))) && ((this.actions.active[_local1].auto == true)))){
                    return (this.actions.active[_local1]);
                };
                _local1++;
            };
            return (null);
        }

        public function exitCombat(){
            var _local1:int;
            this.actionReady = false;
            if (((!((this.actions == null))) && (!((this.actions.active == null))))){
                _local1 = 0;
                while (_local1 < this.actions.active.length) {
                    this.actions.active[_local1].lock = false;
                    _local1++;
                };
            };
            if (this.myAvatar != null){
                if (((((((!((this.myAvatar.pMC == null))) && (!((this.myAvatar.pMC.mcChar == null))))) && (!(this.myAvatar.pMC.mcChar.onMove)))) && (!((this.myAvatar.pMC.mcChar.currentLabel == "Rest"))))){
                    this.myAvatar.pMC.mcChar.gotoAndStop("Idle");
                };
                if (this.myAvatar.dataLeaf != null){
                    this.myAvatar.dataLeaf.targets = {};
                };
                this.cancelAutoAttack();
            };
        }

        public function cancelAutoAttack(){
            var icon:MovieClip;
            if (this.autoActionTimer != null){
                this.autoActionTimer.reset();
            };
            if (this.AATestTimer != null){
                this.AATestTimer.reset();
            };
            var i:* = 0;
            while (i < this.actionMap.length) {
                try {
                    if (this.actionMap[i] == "aa"){
                        icon = MovieClip(this.rootClass.ui.mcInterface.actBar.getChildByName(("i" + (i + 1))));
                        icon.bg.gotoAndStop(1);
                    };
                }
                catch(e:Error) {
                    trace(e);
                };
                i = (i + 1);
            };
        }

        public function doAction(_arg1, _arg2){
            var _local3:Avatar;
			/*if(this.myAvatar.onCasting == true){
				rootClass.ui.mcCastBar.fClose();
			}*/
            trace(("doAction > " + _arg1.nam));
            this.afkPostpone();
			this.vendingPostpone();
            if (_arg2.length > 0){
                _local3 = _arg2[0].avt;
                if (_local3 != this.myAvatar){
                    if ((_local3.pMC.x - this.myAvatar.pMC.x) >= 0){
                        this.myAvatar.pMC.turn("right");
                    }
                    else {
                        this.myAvatar.pMC.turn("left");
                    };
                };
            };
            var _local4:int;
            while (_local4 < _arg2.length) {
                _local3 = _arg2[_local4].avt;
                switch (_local3.npcType){
                    case "monster":
                        if (this.myAvatar.dataLeaf.targets[_local3.objData.MonMapID] == null){
                            this.myAvatar.dataLeaf.targets[_local3.objData.MonMapID] = "m";
                        };
                        break;
                    case "player":
                        if (this.myAvatar.dataLeaf.targets[_local3.objData.uid] == null){
                            this.myAvatar.dataLeaf.targets[_local3.objData.uid] = "p";
                        };
                        break;
                };
                _local4++;
            };
            this.getActionResult(_arg1, _arg2);
        }
		
		/** CASTING **/
		public function castingDone(_arg1):void{
			trace(_arg1);
            this.doAction(_arg1.str, _arg1.str2);
			this.myAvatar.onCasting == false;
        }

        public function aggroMap(_arg1:String, _arg2:String, _arg3):void{
            var _local12:*;
            var _local13:*;
            var _local4:String = _arg1.split(":")[0];
            var _local5:String = _arg1.split(":")[1];
            var _local6:String = _arg2.split(":")[0];
            var _local7:String = _arg2.split(":")[1];
            var _local8 = "";
            var _local9 = "";
            var _local10:Object = {};
            var _local11:Object = {};
            if (_local4 == "p"){
                _local10 = this.getUoLeafById(_local5);
            }
            else {
                _local10 = this.monTree[_local5];
            };
            if (_local6 == "p"){
                _local11 = this.getUoLeafById(_local7);
            }
            else {
                _local11 = this.monTree[_local7];
            };
            if (!("targets" in _local10)){
                _local10.targets = {};
            };
            if (!("targets" in _local11)){
                _local11.targets = {};
            };
            if (_local6 == "m"){
                if (!(_local7 in _local10.targets)){
                    _local10.targets[_local7] = _local6;
                };
                if (!(_local5 in _local11.targets)){
                    _local11.targets[_local5] = _local4;
                };
            };
            if ((((((_local4 == "p")) && ((_local6 == "p")))) && (_arg3))){
                for (_local12 in this.monTree) {
                    _local13 = this.monTree[_local12];
                    if (((!((_local13.targets[_local7] == null))) && (!((_local5 in _local13.targets))))){
                        _local13.targets[_local5] = _local4;
                    };
                };
            };
        }

        private function actionTimeCheck(_arg1):Boolean{
            var _local4:int;
            trace("actionTimeCheck >");
            var _local2:Number = new Date().getTime();
            var _local3:Number = (1 - Math.min(Math.max(this.myAvatar.dataLeaf.sta.$tha, -1), 0.5));
            if (_arg1.auto){
                if (this.autoActionTimer.running){
                    trace("AA TIMER SELF-CLIPPING");
                    return (false);
                };
                return (true);
            };
            if ((_local2 - this.GCDTS) < this.GCD){
                return (false);
            };
            if (_arg1.OldCD != null){
                _local4 = Math.round((_arg1.OldCD * _local3));
            }
            else {
                _local4 = Math.round((_arg1.cd * _local3));
            };
            trace(((("ActionObj: " + _arg1.nam) + " cooldown: ") + _arg1.cd));
            if ((_local2 - _arg1.ts) >= _local4){
                delete _arg1.OldCD;
                return (true);
            };
            return (false);
        }

        private function actionRangeCheck(_arg1, _arg2:Avatar=null):Boolean{
            var _local3:Point;
            var _local4:Point;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local8:*;
            trace("actionRangeCheck >");
            if ((((_arg2 == null)) && (!((this.myAvatar.target == null))))){
                _arg2 = this.myAvatar.target;
            };
            if (_arg2 == this.myAvatar){
                return (true);
            };
            if (((("tgtMin" in _arg1)) && ((_arg1.tgtMin == 0)))){
                return (true);
            };
            if (_arg2 == null){
                return (false);
            };
            _local3 = this.myAvatar.pMC.mcChar.localToGlobal(new Point(0, 0));
            _local4 = _arg2.pMC.mcChar.localToGlobal(new Point(0, 0));
            _local5 = Math.abs((_local4.x - _local3.x));
            _local6 = Math.abs((_local4.y - _local3.y));
            _local7 = Math.pow(((_local5 * _local5) + (_local6 * _local6)), 0.5);
            _local8 = (_arg1.range * this.SCALE);
            if (_arg1.range <= 301){
                if ((((_local5 <= _local8)) && ((_local6 <= (30 * this.SCALE))))){
                    return (true);
                };
                return (false);
            };
            if (_local7 <= _local8){
                return (true);
            };
            return (false);
        }

        public function aggroAllMon(){
            var _local2:*;
            var _local1:* = [];
            for (_local2 in this.monTree) {
                if (this.monTree[_local2].strFrame == this.strFrame){
                    _local1.push(_local2);
                };
            };
            this.aggroMons(_local1);
        }

        public function aggroMon(_arg1){
            var _local2:* = [];
            _local2.push(_arg1);
            this.aggroMons(_local2);
        }

        public function aggroMons(_arg1){
            if (_arg1.length){
                this.rootClass.sfc.sendXtMessage("zm", "aggroMon", _arg1, "str", this.curRoom);
            };
        }

        public function castSpellFX(_arg1, _arg2, _arg3, _arg4:int=0){
            var _local5:Avatar;
            var _local6:Class;
            var _local7:*;
            var _local8:Array;
            var _local9:int;
            if (((((!((_arg2.strl == null))) && (!((_arg2.strl == ""))))) && (!((_arg2.avts == null))))){
                _local8 = [];
                _local9 = 0;
                if (_arg2.fx == "c"){
                    if (_arg2.strl == "lit1"){
                        _local8.push(_arg1.pMC.mcChar);
                        _local9 = 0;
                        while (_local9 < _arg2.avts.length) {
                            _local5 = _arg2.avts[_local9];
                            if (((((!((_local5 == null))) && (!((_local5.pMC == null))))) && (!((_local5.pMC.mcChar == null))))){
                                _local8.push(_local5.pMC.mcChar);
                            };
                            _local9++;
                        };
                        if (_local8.length > 1){
                            _local6 = (this.getClass("sp_C1") as Class);
                            if (_local6 != null){
                                _local7 = new (_local6)();
                                _local7.mouseEnabled = false;
                                _local7.mouseChildren = false;
                                _local7.visible = true;
                                _local7.world = this.rootClass.world;
                                _local7.strl = _arg2.strl;
                                this.rootClass.drawChainsLinear(_local8, 33, MovieClip(this.CHARS.addChild(_local7)));
                            };
                        };
                    };
                }
                else {
                    if (_arg2.fx == "f"){
                        _local8.push(_arg1.pMC.mcChar);
                        _local5 = _arg2.avts[0];
                        if (((((!((_local5 == null))) && (!((_local5.pMC == null))))) && (!((_local5.pMC.mcChar == null))))){
                            _local8.push(_local5.pMC.mcChar);
                        };
                        if (_local8.length > 1){
                            _local7 = new MovieClip();
                            _local7.mouseEnabled = false;
                            _local7.mouseChildren = false;
                            _local7.visible = true;
                            _local7.world = this.rootClass.world;
                            _local7.strl = _arg2.strl;
                            this.rootClass.drawFunnel(_local8, MovieClip(this.CHARS.addChild(_local7)));
                        };
                    }
                    else {
                        _local9 = 0;
                        while (_local9 < _arg2.avts.length) {
                            _local5 = _arg2.avts[_local9];
                            _local6 = (this.getClass(_arg2.strl) as Class);
                            if (_local6 != null){
                                _local7 = new (_local6)();
                                _local7.spellDur = _arg4;
                                if (_arg3 != null){
                                    _local7.transform = _arg3.transform;
                                };
                                this.CHARS.addChild(_local7);
                                _local7.mouseEnabled = false;
                                _local7.mouseChildren = false;
                                _local7.visible = true;
                                _local7.world = this.rootClass.world;
                                _local7.strl = _arg2.strl;
                                _local7.tMC = _local5.pMC;
                                switch (_arg2.fx){
                                    case "p":
                                        _local7.x = _arg1.pMC.x;
                                        _local7.y = (_arg1.pMC.y - (_arg1.pMC.mcChar.height * 0.5));
                                        _local7.dir = ((((_local5.pMC.x - _arg1.pMC.x))>=0) ? 1 : -1);
                                        break;
                                    case "w":
                                        _local7.x = _local7.tMC.x;
                                        _local7.y = (_local7.tMC.y + 3);
                                        if (_arg1 != null){
                                            if (_local7.tMC.x < _arg1.pMC.x){
                                                _local7.scaleX = (_local7.scaleX * -1);
                                            };
                                        };
                                        break;
                                };
                            }
                            else {
                                trace();
                                trace(("*>*>*> Could not load class " + _arg2.strl));
                                trace();
                            };
                            _local9++;
                        };
                    };
                };
            };
        }

        public function showSpellFXHit(_arg1){
            var _local2:* = {};
            switch (_arg1.strl){
                case "sp_ice1":
                    _local2.strl = "sp_ice2";
                    break;
                case "sp_el3":
                    _local2.strl = "sp_el2";
                    break;
                case "sp_ed3":
                    _local2.strl = "sp_ed1";
                    break;
                case "sp_ef1":
                case "sp_ef6":
                    _local2.strl = "sp_ef2";
                    break;
            };
            _local2.fx = "w";
            _local2.avts = [_arg1.tMC.pAV];
            this.castSpellFX(null, _local2, null);
        }

        public function doCastIA(_arg1:Object):void{
        }

        public function getActionByActID(_arg1:int):Object{
            var _local2:Object;
            var _local3:int;
            while (_local3 < this.actions.active.length) {
                if (this.actions.active[_local3].actID == _arg1){
                    _local2 = this.actions.active[_local3];
                };
                _local3++;
            };
            return (_local2);
        }

        public function getActionByRef(_arg1:String):Object{
            var _local2:*;
            for each (_local2 in this.actions.active) {
                if (_local2.ref == _arg1){
                    return (_local2);
                };
            };
            for each (_local2 in this.actions.passive) {
                if (_local2.ref == _arg1){
                    return (_local2);
                };
            };
			/*
			for each (_local2 in this.actions.unused) {
                if (_local2.ref == _arg1){
					return (_local2);
                };
            };*/
			for each (_local2 in this.actions.tree) {
                if (_local2.ref == _arg1){
					trace("TREE");
					return (_local2);
                };
            };
            return (null);
        }
		
		public function getActionbySlot(_arg1:String):Object{
			trace(">> 1 " + _arg1);

            var _local2:*;
            for each (_local2 in this.actions.active) {
                if (_local2.slot == _arg1){
					trace(">> 2");
					return (_local2);
                };
            };
            for each (_local2 in this.actions.passive) {
                if (_local2.slot == _arg1){
					trace(">> 3");
					return (_local2);
                };
            };
			/*
			for each (_local2 in this.actions.unused) {
                if (_local2.slot == _arg1){
					trace(">> 4");
					return (_local2);
                };
            };*/
			for each (_local2 in this.actions.tree) {
                if (_local2.slot == _arg1){
					trace("TREE");
					return (_local2);
                };
            };
            return (null);
        }
		
		public function getActionbyTreeSlot(_arg1:String):Object{
			trace(">> 1 " + _arg1);

            var _local2:*;
            for each (_local2 in this.actions.tree) {
                if (_local2.ref == _arg1){
					trace("TREE");
					return (_local2);
                };
            };
            for each (_local2 in this.actions.passive) {
                if (_local2.ref == _arg1){
					return (_local2);
                };
            };
			/*
			for each (_local2 in this.actions.unused) {
                if (_local2.ref == _arg1){
					return (_local2);
                };
            };
			*/
            return (null);
        }

        public function handleSAR(_arg1:Object):void{
            var _local2:Object = {};
            var _local3 = "";
            var _local4:int = -1;
            var _local5 = "";
            var _local6:int = -1;
            if (_arg1.iRes == 1){
                if (_arg1.actionResult.typ == "d"){
                    this.showAuraImpact(_arg1.actionResult);
                    _local2 = this.rootClass.copyObj(_arg1.actionResult);
                    _local2.a = [this.rootClass.copyObj(_arg1.actionResult)];
                }
                else {
                    this.aggroMap(_arg1.actionResult.cInf, _arg1.actionResult.tInf, (_arg1.actionResult.hp >= 0));
                    _local3 = _arg1.actionResult.cInf.split(":")[0];
                    _local4 = int(_arg1.actionResult.cInf.split(":")[1]);
                    _local5 = _arg1.actionResult.tInf.split(":")[0];
                    _local6 = int(_arg1.actionResult.tInf.split(":")[1]);
                    _local2 = this.rootClass.copyObj(_arg1.actionResult);
                    _local2.a = [this.rootClass.copyObj(_arg1.actionResult)];
                    if ((((_local3 == "p")) && ((_local4 == this.rootClass.sfc.myUserId)))){
                        this.showActionResult(_local2, _local2.actID);
                    }
                    else {
                        this.showIncomingAttackResult(_local2);
                    };
                };
            };
            if (_arg1.iRes == 0){
                switch (_arg1.actionResult.cInf.split(":")[0]){
                    case "p":
                        this.showActionResult(null, _arg1.actID);
                        return;
                };
            };
        }

        public function handleSARS(_arg1:Object):void{
            var _local9:Array;
            var _local10:int;
            var _local2:Object = {};
            var _local3 = "";
            var _local4:int = -1;
            var _local5 = "";
            var _local6:int = -1;
            var _local7:String = _arg1.cInf;
            _local7 = _arg1.cInf;
            _local3 = _local7.split(":")[0];
            _local4 = int(_local7.split(":")[1]);
            var _local8:Object = {};
            if (_arg1.iRes == 1){
                _local9 = [];
                _local10 = 0;
                while (_local10 < _arg1.a.length) {
                    _local8 = _arg1.a[_local10];
                    this.aggroMap(_local7, _local8.tInf, (_local8.hp >= 0));
                    _local10++;
                };
                if ((((_local3 == "p")) && ((_local4 == this.rootClass.sfc.myUserId)))){
                    this.showActionResult(this.rootClass.copyObj(_arg1), _arg1.actID);
                }
                else {
                    this.showIncomingAttackResult(this.rootClass.copyObj(_arg1));
                };
            };
            if (_arg1.iRes == 0){
                switch (_local7.split(":")[0]){
                    case "p":
                        this.showActionResult(null, _arg1.actID);
                        return;
                };
            };
        }

        public function getActionResult(_arg1, _arg2){
            var _local3:*;
            var _local4:*;
            var _local5:String;
            var _local6:Avatar;
            var _local7:int;
            var _local8:Number;
            var _local9:*;
            trace(("GAR > " + _arg1.nam));
            _local3 = [];
            _local4 = "gar";
            _local5 = "";
            _local7 = 0;
            _local3.push(this.actionID);
            if (_arg2.length > 0){
                _local7 = 0;
                while (_local7 < _arg2.length) {
                    _local6 = _arg2[_local7].avt;
                    if (_local7 > 0){
                        _local5 = (_local5 + ",");
                    };
                    _local5 = (_local5 + (_arg1.ref + ">"));
                    if (_local6.npcType == "monster"){
                        _local5 = (_local5 + ("m:" + _local6.objData.MonMapID));
                    };
                    if (_local6.npcType == "player"){
                        _local5 = (_local5 + ("p:" + _local6.uid));
                    };
                    _local7++;
                };
            }
            else {
                _local5 = (_local5 + (_arg1.ref + ">"));
            };
            _local3.push(_local5);
            if (_arg1.ref == "i1"){
                _local3.push(_arg1.sArg1);
            };
			if (_arg1.nam == "Levitate"){
				flyToggle();
			};
			if (_arg1.nam == "Resurrect"){
				var Name = this.rootClass.ui.mcPortraitTarget.strName.text;
				this.rootClass.sfc.sendXtMessage("zm", "resurrectPlayer", [Name], "str", 1);
				this.rootClass.mixer.playSound("Good");
			};
            _local3.push("wvz");
            this.rootClass.sfc.sendXtMessage("zm", _local4, _local3, "str", 1);
            _local8 = new Date().getTime();
            _arg1.lock = true;
            _arg1.actID = this.actionID;
            this.actionID++;
            if (this.actionID > this.actionIDLimit){
                this.actionID = 0;
            };
            _arg1.lastTS = _arg1.ts;
            _arg1.ts = _local8;
            if (_arg1.typ != "aa"){
                this.coolDownAct(_arg1);
                this.globalCoolDownExcept(_arg1);
                if (((!(this.autoActionTimer.running)) && ((_arg1.tgt == "h")))){
                    this.testAction(this.getAutoAttack());
                };
            }
            else {
                _local7 = 0;
                while (_local7 < this.actionMap.length) {
                    if (this.actionMap[_local7] == _arg1.ref){
                        _local9 = MovieClip(this.rootClass.ui.mcInterface.actBar.getChildByName(("i" + (_local7 + 1))));
                        if (_local9.bg.currentLabel != "pulse"){
                            _local9.bg.gotoAndPlay("pulse");
                        };
                    };
                    _local7++;
                };
                this.actionReady = false;
            };
            this.actionResults[this.actionResultID] = {};
        }

        public function showActionResult(_arg1, _arg2){
            var _local3:*;
            var _local4:*;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local8:*;
            var _local9:*;
            _local3 = new Date();
            _local4 = this.getActionByActID(_arg2);
            if (_local4 != null){
                _local4.lock = false;
                _local4.actID = -1;
                _local5 = _local4.ts;
                _local6 = _local3.getTime();
                _local7 = int(((_local6 - _local5) / 2));
                if (_local4.typ == "aa"){
                    _local8 = Math.round((_local4.cd * (1 - Math.min(Math.max(this.myAvatar.dataLeaf.sta.$tha, -1), 0.5))));
                    _local9 = (_local8 - int((_local6 - _local5)));
                    if (_local9 > _local8){
                        _local9 = _local8;
                    };
                    if (_local9 < (_local8 - 100)){
                        _local9 = (_local8 - 100);
                    };
                    this.autoActionTimer.delay = _local9;
                    this.autoActionTimer.reset();
                    this.autoActionTimer.start();
                };
                if (_arg1 == null){
                    _local4.ts = _local4.lastTS;
                }
                else {
                    _local4.ts = Math.max(int((_local6 - _local7)), (_local5 + this.minLatencyOneWay));
                    this.unlockActionsExcept(_local4);
                    this.rootClass.updateActionObjIcon(_local4);
                };
            };
            if (_arg1 != null){
                this.playActionSound(_arg1);
                if (_arg1.type != "none"){
                    this.actionResults[this.actionResultID] = new ActionImpactTimer();
                    this.actionResults[this.actionResultID].world = MovieClip(this);
                    this.actionResults[this.actionResultID].actionResult = _arg1;
                    this.actionResults[this.actionResultID].showImpact(250);
                    if (++this.actionResultID > this.actionResultIDLimit){
                        this.actionResultID = 0;
                    };
                };
            };
        }

        public function showIncomingAttackResult(_arg1:Object):void{
            this.playActionSound(_arg1);
            this.actionResultsMon[this.actionIDMon] = new ActionImpactTimer();
            this.actionResultsMon[this.actionIDMon].world = MovieClip(this);
            this.actionResultsMon[this.actionIDMon].actionResult = _arg1;
            this.actionResultsMon[this.actionIDMon].showImpact(350);
            this.actionIDMon++;
            if (this.actionIDMon > this.actionIDLimitMon){
                this.actionIDMon = 0;
            };
        }

        public function playActionSound(_arg1:Object):void{
            var _local2:Object;
            if ((((_arg1.a.length > 0)) && (!((_arg1.a[0].type == null))))){
                _local2 = _arg1.a[0];
                switch (_local2.type){
                    case "hit":
                        if (_local2.hp >= 0){
                            if (Math.random() < 0.5){
                                this.rootClass.mixer.playSound("Hit1");
                            }
                            else {
                                this.rootClass.mixer.playSound("Hit2");
                            };
                        }
                        else {
                            this.rootClass.mixer.playSound("Heal");
                        };
                        return;
                    case "crit":
                        if (_local2.hp >= 0){
                            this.rootClass.mixer.playSound("Hit3");
                        }
                        else {
                            this.rootClass.mixer.playSound("Heal");
                        };
                        return;
                    case "miss":
                        		/*
						randomNumber = rootClass.mcConnDetail.randomNumbers(1,4);
						HitFX = randomNumber;
						switch(HitFX){
							case 1:
								this.rootClass.mixer.playSound("Miss");
								break;
							case 2:
								this.rootClass.mixer.playSound("Dodge");
								break;
							case 3:
								this.rootClass.mixer.playSound("Parry");
								break;
							case 4:
								this.rootClass.mixer.playSound("Block");
								break;
							};
					*/
						//this.rootClass.mixer.playSound("Miss");
                        return;
                    case "none":
                        this.rootClass.mixer.playSound("Good");
                        return;
                };
            };
        }

        public function showActionImpact(_arg1){
            var _local2:MovieClip;
            var _local3:*;
            var _local4:*;
            var _local5:String;
            var _local6:int;
            var _local8:Array;
            var _local10:int;
            var _local11:TextFormat;
            var _local12:int;
            var _local13:Array;
            var _local14:Object;
            _local3 = null;
            _local4 = null;
            _local5 = "";
            _local6 = 0;
            var _local7:Array = ["GOOD", "GREAT!", "MASSIVE!!"];
            _local8 = [0xFFFFFF, 0xFFFFFF, 0xFFFFFF];
            var _local9:Array = [2381688, 0, 0];
            _local10 = 0;
            _local11 = new TextFormat();
            _local12 = 0;
            _local13 = _arg1.a;
            _local14 = {};
            _local12 = 0;
            while (_local12 < _local13.length) {
                _local14 = _local13[_local12];
                _local5 = _local14.tInf.split(":")[0];
                _local6 = int(_local14.tInf.split(":")[1]);
                switch (_local5){
                    case "p":
                        _local2 = this.avatars[_local6].pMC;
                        break;
                    case "m":
                        _local2 = this.getMonster(_local6).pMC;
                        break;
                };
                if (((((!((_local2 == null))) && (!((_local2.pAV == null))))) && (!((_local2.pAV.dataLeaf == null))))){
                    switch (_local14.type){
                        case "hit":
                            _local4 = new hitDisplay();
                            _local4.t.ti.autoSize = "center";
                            if (_local14.hp >= 0){
                                _local10 = 0;
                                _local4.t.ti.text = _local14.hp;
                                _local4.t.ti.textColor = _local8[_local10];
                                _local4.t.ti.filters = [new GlowFilter(0, 1, 5, 5, 5, 1, false, false)];
                                _local4.t.ti.setTextFormat(_local11);
                            }
                            else {
                                _local4.t.ti.text = (("+" + -(_local14.hp)) + "+");
                                _local4.t.ti.textColor = 65450;
                            };
                            this.wound(_local2, "damage");
							//Hit animation Addon
                            break;
                        case "crit":
                            _local4 = new critDisplay();
                            _local4.t.ti.autoSize = "center";
                            if (_local14.hp > 0){
                                _local4.t.ti.text = _local14.hp;
                                _local4.t.ti.textColor = 16750916;
                                _local4.t.ti.filters = [new GlowFilter(0x330000, 1, 5, 5, 5, 1, false, false)];
                            }
                            else {
                                _local4.t.ti.text = -(_local14.hp);
                                _local4.t.ti.textColor = 65450;
                            };
                            this.wound(_local2, "damage");
							if (this.isMoveOK(_local2.pAV.dataLeaf)){
                                _local2.queueAnim("Hit");
                            };
                            break;
                        case "miss":
                            randomNumber = rootClass.mcConnDetail.randomNumbers(1, 4);
							switch (randomNumber) {
								case 1:
									_local4 = new avoidDisplay();
									_local4.t.ti.text = "Miss!";
									_local4.t.ti.textColor = 0xff0000;
									if (this.isMoveOK(_local2.pAV.dataLeaf)) {
										_local2.queueAnim("Dodge");
										rootClass.mixer.playSound("Miss");
									};
									break;
								case 2:
									_local4 = new avoidDisplay();
									_local4.t.ti.text = "Dodge!";
									_local4.t.ti.textColor = 0x9966ff;
									if (this.isMoveOK(_local2.pAV.dataLeaf)) {
										_local2.queueAnim("Dodge");
										rootClass.mixer.playSound("Dodge");
									};
									break;
								case 3:
									_local4 = new avoidDisplay();
									_local4.t.ti.text = "Parry!";
									_local4.t.ti.textColor = 0x00CC00;
									if (this.isMoveOK(_local2.pAV.dataLeaf)) {
										if (_local5 == "p") {
											_local2.queueAnim("Sword/ShieldAttack1");
											rootClass.mixer.playSound("Parry");
										} else {
											_local2.queueAnim("Attack3");
											rootClass.mixer.playSound("Parry");
										};
									};
									break;
								case 4:
									_local4 = new avoidDisplay();
									_local4.t.ti.text = "Block!";
									_local4.t.ti.textColor = 0x0099CC;
									//if (this.isMoveOK(_local2.pAV.dataLeaf)){
									if (_local5 == "p") {
										_local2.queueAnim("ShieldBlock");
										rootClass.mixer.playSound("Block");
									} else {
										_local2.queueAnim("Block");
										rootClass.mixer.playSound("Block");
									};
									//};
									break;
							};
                            break;
                        case "dodge":
                            randomNumber = rootClass.mcConnDetail.randomNumbers(1, 4);
							switch (randomNumber) {
								case 1:
									_local4 = new avoidDisplay();
									_local4.t.ti.text = "Miss!";
									_local4.t.ti.textColor = 0xff0000;
									if (this.isMoveOK(_local2.pAV.dataLeaf)) {
										_local2.queueAnim("Dodge");
										rootClass.mixer.playSound("Miss");
									};
									break;
								case 2:
									_local4 = new avoidDisplay();
									_local4.t.ti.text = "Dodge!";
									_local4.t.ti.textColor = 0x9966ff;
									if (this.isMoveOK(_local2.pAV.dataLeaf)) {
										_local2.queueAnim("Dodge");
										rootClass.mixer.playSound("Dodge");
									};
									break;
								case 3:
									_local4 = new avoidDisplay();
									_local4.t.ti.text = "Parry!";
									_local4.t.ti.textColor = 0x00CC00;
									if (this.isMoveOK(_local2.pAV.dataLeaf)) {
										if (_local5 == "p") {
											_local2.queueAnim("Sword/ShieldAttack1");
											rootClass.mixer.playSound("Parry");
										} else {
											_local2.queueAnim("Attack3");
											rootClass.mixer.playSound("Parry");
										};
									};
									break;
								case 4:
									_local4 = new avoidDisplay();
									_local4.t.ti.text = "Block!";
									_local4.t.ti.textColor = 0x0099CC;
									//if (this.isMoveOK(_local2.pAV.dataLeaf)){
									if (_local5 == "p") {
										_local2.queueAnim("ShieldBlock");
										rootClass.mixer.playSound("Block");
									} else {
										_local2.queueAnim("Block");
										rootClass.mixer.playSound("Block");
									};
									//};
									break;
							};
                            break;
                        case "parry":
                            _local4 = new avoidDisplay();
                            _local4.t.ti.text = "Parry!";
                            if (this.isMoveOK(_local2.pAV.dataLeaf)){
                                _local2.queueAnim("Dodge");
                            };
                            break;
                        case "block":
                            _local4 = new avoidDisplay();
                            _local4.t.ti.text = "Block!";
                            if (this.isMoveOK(_local2.pAV.dataLeaf)){
                                _local2.queueAnim("Block");
                            };
                            break;
                        case "none":
                    };
                    if (_local4 != null){
                        _local2.addChild(_local4);
                        _local4.x = _local2.mcChar.x;
                        _local4.y = (_local2.pname.y + 10);
                    };
                    if (_local3 != null){
                        _local2.addChild(_local3);
                        _local3.x = _local2.mcChar.x;
                        _local3.y = (_local2.pname.y + (_local2.mcChar.height / 2));
                    };
                };
                _local12++;
            };
        }

        public function showAuraImpact(_arg1){
            var _local2:MovieClip;
            var _local3:*;
            var _local4:*;
            var _local5:*;
            _local3 = _arg1.tInf.split(":")[0];
            _local4 = int(_arg1.tInf.split(":")[1]);
            _local5 = null;
            switch (_local3){
                case "p":
                    if (((((!((this.avatars[_local4] == null))) && (("pMC" in this.avatars[_local4])))) && (!((this.avatars[_local4].pMC == null))))){
                        _local2 = this.avatars[_local4].pMC;
                    };
                    break;
                case "m":
                    if (((((!((this.getMonster(_local4) == null))) && (("pMC" in this.getMonster(_local4))))) && (!((this.getMonster(_local4).pMC == null))))){
                        _local2 = this.getMonster(_local4).pMC;
                    };
                    break;
            };
            if (_local2 != null){
                _local5 = new dotDisplay();
                _local5.t.ti.text = Math.abs(_arg1.hp);
                if (_arg1.hp > 0){
                    _local5.t.ti.textColor = 0xEE9900;
                };
                _local2.addChild(_local5);
                _local5.x = _local2.mcChar.x;
                _local5.y = (_local2.pname.y + 10);
            };
        }

        public function showAuraChange(_arg1:Object, _arg2:Avatar, _arg3:Object){
            var tMC:MovieClip;
            var actionDamage:* = undefined;
            var cLeaf:Object;
            var i:int;
            var nc:int;
            var gap:int;
            var child:DisplayObject;
            var cTyp:String;
            var cID:int;
            var tTyp:String;
            var tID:int;
            var aura:Object;
            var existingAura:Object;
            var dateObj:Date;
            var isOK:Boolean;
            var tFilters:Array;
            var tFilter:* = undefined;
            var auras:* = undefined;
            var ai:* = undefined;
            var actObj:* = undefined;
            var icon1:* = undefined;
            var filterIndex:int;
            var resObj:Object = _arg1;
            var tAvt:Avatar = _arg2;
            var tLeaf:Object = _arg3;
            trace("showAuraChange > ");
            tMC = tAvt.pMC;
            actionDamage = null;
            var cAvt:Avatar;
            cLeaf = null;
            if (tMC != null){
                i = 0;
                nc = tMC.numChildren;
                gap = 1;
                if (resObj.cInf != null){
                    cTyp = String(resObj.cInf.split(":")[0]);
                    cID = int(resObj.cInf.split(":")[1]);
                    switch (cTyp){
                        case "p":
                            cAvt = this.getAvatarByUserID(cID);
                            cLeaf = this.getUoLeafById(cID);
                            break;
                        case "m":
                            cAvt = this.getMonster(cID);
                            cLeaf = this.monTree[cID];
                            break;
                    };
                };
                if (resObj.auras != null){
                    gap = resObj.auras.length;
                };
                i = 0;
                while (i < nc) {
                    child = tMC.getChildAt(i);
                    if (((((!((child == null))) && (!((child.toString() == null))))) && ((child.toString().indexOf("auraDisplay") > -1)))){
                        child.y = (child.y - (int((child.height + 3)) * gap));
                    };
                    i = (i + 1);
                };
                aura = {};
                existingAura = {};
                dateObj = new Date();
                isOK = true;
                if (tLeaf.auras == null){
                    tLeaf.auras = [];
                };
                if (tLeaf.passives == null){
                    tLeaf.passives = [];
                };
				/*
				if (tLeaf.unused == null){
                    tLeaf.unused = [];
                };
				*/
                switch (resObj.cmd){
                    case "aura+":
                    case "aura++":
                    case "aura+p":
                        i = 0;
                        while (i < resObj.auras.length) {
                            aura = resObj.auras[i];
                            aura.cLeaf = cLeaf;
                            if (resObj.cmd == "aura+p"){
                                aura.passive = true;
                            }
                            else {
                                aura.passive = false;
                            };
                            if (!aura.passive){
                                if (aura.t != null){
                                    aura.ts = dateObj.getTime();
                                };
                                if ((((((((tAvt == this.myAvatar)) || ((tAvt == this.myAvatar.target)))) || (((!((tLeaf.targets == null))) && (!((tLeaf.targets[this.rootClass.sfc.myUserId] == null))))))) || ((resObj.cmd == "aura++")))){
                                    actionDamage = new auraDisplay();
                                    actionDamage.t.ti.text = (aura.nam + "!");
                                    if (aura.nam == "Spirit Power"){
                                        actionDamage.t.ti.text = ((aura.nam + " ") + aura.val);
                                    };
                                    trace(("potionType: " + aura.potionType));
                                    if (aura.potionType != null){
                                        if (aura.potionType.toLowerCase() == "tonic"){
                                            tAvt.objData.Tonic = true;
                                        };
                                        if (aura.potionType.toLowerCase() == "elixir"){
                                            tAvt.objData.Elixir = true;
                                        };
                                    };
                                    if (aura.nam == "Skill Locked"){
                                        ai = 0;
                                        while (ai < this.actions.active.length) {
                                            actObj = this.actions.active[ai];
                                            if (actObj.nam == aura.val){
                                                icon1 = this.rootClass.ui.mcInterface.actBar.getChildByName(("i" + (ai + 1)));
                                                icon1.actObj.skillLock = true;
                                            };
                                            ai = (ai + 1);
                                        };
                                    };
                                    tMC.addChild(actionDamage);
                                    actionDamage.x = (((tMC.mcChar.scaleX)<0) ? 35 : (-(actionDamage.t.ti.textWidth) - 35));
                                    actionDamage.y = ((tMC.pname.y + 25) + ((actionDamage.height + 3) * i));
                                    if (aura.fx != null){
                                        this.addAuraFX(tMC, aura.fx);
                                    };
                                };
                                if (aura.s != null){
                                    switch (aura.s){
                                        case "s":
                                            if (tMC.mcChar.currentLabel != "Fall"){
                                                tMC.clearQueue();
                                                tMC.mcChar.gotoAndPlay("Fall");
                                            };
                                            break;
                                    };
                                };
                                if (aura.cat != null){
                                    isOK = true;
                                    for each (existingAura in tLeaf.auras) {
                                        try {
                                            if (((!((existingAura.cat == null))) && ((existingAura.cat == aura.cat)))){
                                                isOK = false;
                                            };
                                        }
                                        catch(e:Error) {
                                            trace(("combat.applyAuras > " + e));
                                        };
                                    };
                                    if (isOK){
                                        switch (aura.cat){
											/* HP's Aura Addon */
											case "stun":
                                                tMC.mcChar.gotoAndStop("Facepalm");
                                                tMC.mcChar.vertigoMC.visible = true;
												rootClass.ui.mcStatus.iconStun.visible = true;
                                                break;
											case "hex":
												tMC.mcChar.stop();
												tMC.mcChar.gotoAndStop("Hex");
												rootClass.ui.mcStatus.iconHex.visible = true;
                                                break;
											case "silenced":
												tMC.mcChar.gotoAndPlay("Facepalm");
                                                tMC.mcChar.silenceMC.visible = true;
												rootClass.ui.mcStatus.iconSilenced.visible = true;
                                                break;
											case "freeze":
                                                tMC.modulateColor(this.statusFreezeCT, "+");
                                                tMC.mcChar.stop();
												rootClass.ui.mcStatus.iconFreeze.visible = true;
                                                break;
											/* End */
											case "invi":
												tMC.mcChar.visible = false;
												tMC.shadow.visible = false;
												tMC.pname.visible = false;
												tMC.hpBar.visible = false;
												myAvatar.petMC.visible = false;
												rootClass.ui.mcStatus.iconInvicible.visible = true;
												break;
                                            case "paralyze":
												tMC.mcChar.stop();
												rootClass.ui.mcStatus.iconParalyze.visible = true;
												break;
                                            case "stone":
                                                tMC.modulateColor(this.statusStoneCT, "+");
                                                tMC.mcChar.stop();
												rootClass.ui.mcStatus.iconStone.visible = true;
                                                break;
											/*	
											case "d":
												rootClass.chatF.submitMsg("Aura dmg:" + aura.dmgInc, "", rootClass.sfc.myUserName);
                                                if (aura.dmgInc < 0){
													rootClass.ui.mcStatus.iconHoT.visible = true;
												} else {
													rootClass.ui.mcStatus.iconDoT.visible = true;	
												}
                                                break;
											*/
											case "disabled":
                                                rootClass.ui.mcStatus.iconDisabled.visible = true;
												tMC.mcChar.stop();
                                                break;
                                            case "clean":
                                                tFilters = tMC.mcChar.filters;
                                                tFilters.push(new GlowFilter(0xFFFFFF, 1, 30, 30, 2, 2));
                                                tMC.mcChar.filters = tFilters;
												rootClass.ui.mcStatus.iconClean.visible = true;
                                                break;
											case "recharge":
                                                tFilters = tMC.mcChar.filters;
                                                tFilters.push(new GlowFilter(0xFF0000, 1, 30, 30, 2, 2));
                                                tMC.mcChar.filters = tFilters;
                                                break;
											case "restack":
                                                tFilters = tMC.mcChar.filters;
                                                tFilters.push(new GlowFilter(0x000000, 1, 30, 30, 2, 2));
                                                tMC.mcChar.filters = tFilters;
                                                break;
											case "gay":
												rootClass.chatF.submitMsg("I'm Gay.", "", rootClass.sfc.myUserName);
												break;
											case "dmgTrc":
												rootClass.chatF.submitMsg("Aura Damage:" + aura.dmgInc, "", rootClass.sfc.myUserName);
												break;
											default:
                                                if (aura.dmgInc > 0){
													rootClass.ui.mcStatus.iconHoT.visible = true;
												} else {
													rootClass.ui.mcStatus.iconDoT.visible = true;	
												}
												break;
                                        };
                                    };
                                };
                                if (((!((aura.animOn == null))) && ((((cLeaf == null)) || ((cLeaf.intState == 2)))))){
                                    if (aura.animOn.indexOf("fadeFX:") > -1){
                                        this.removeAuraFX(tMC, aura.animOn.split(":")[1], "fade");
                                    }
                                    else {
                                        if (aura.animOn.indexOf("useFX:") > -1){
                                            this.removeAuraFX(tMC, aura.animOn.split(":")[1], "use");
                                        }
                                        else {
                                            if (aura.animOn.indexOf("removeFX:") > -1){
                                                this.removeAuraFX(tMC, aura.animOn.split(":")[1]);
                                            }
                                            else {
                                                tMC.mcChar.gotoAndPlay(aura.animOn);
                                            };
                                        };
                                    };
                                };
                                if (aura.msgOn != null){
                                    if (aura.msgOn.charAt(0) == "@"){
                                        if (tAvt == this.myAvatar){
                                            this.rootClass.addUpdate(aura.msgOn.substr(1));
                                        };
                                    }
                                    else {
                                        this.rootClass.addUpdate(aura.msgOn);
                                    };
                                };
                                if (aura.isNew){
                                    tLeaf.auras.push(aura);
                                }
                                else {
                                    this.updateAuraData(cLeaf, aura, tLeaf);
                                };
                            }
                            else {
                                tLeaf.passives.push(aura);
                            };
                            i = (i + 1);
                        };
                        return;
                    case "aura-":
                    case "aura--":
                        auras = [];
                        if (resObj.auras != null){
                            auras = resObj.auras;
                        }
                        else {
                            if (resObj.aura != null){
                                auras = [resObj.aura];
                            };
                        };
                        i = 0;
                        while (i < auras.length) {
                            aura = auras[i];
                            if (this.removeAura(aura, tLeaf, tMC)){
                                if ((((((((tAvt == this.myAvatar)) || ((tAvt == this.myAvatar.target)))) || (((!((tLeaf.targets == null))) && (!((tLeaf.targets[this.rootClass.sfc.myUserId] == null))))))) || ((resObj.cmd == "aura--")))){
                                    actionDamage = new auraDisplay();
                                    actionDamage.t.ti.text = (("*" + aura.nam) + " fades*");
                                    actionDamage.t.ti.textColor = 0x999999;
                                    tMC.addChild(actionDamage);
                                    actionDamage.x = (((tMC.mcChar.scaleX)<0) ? 35 : (-(actionDamage.t.ti.textWidth) - 35));
                                    actionDamage.y = (tMC.pname.y + 25);
                                };
                                if (aura.potionType != null){
                                    if (aura.potionType.toLowerCase() == "tonic"){
                                        tAvt.objData.Tonic = false;
                                    };
                                    if (aura.potionType.toLowerCase() == "elixir"){
                                        tAvt.objData.Elixir = false;
                                    };
                                };
                                if (aura.s != null){
                                    switch (aura.s){
                                        case "s":
                                            if (tMC.mcChar.currentLabel == "Fall"){
                                                if (this.isStatusGone("s", tLeaf)){
                                                    tMC.mcChar.gotoAndPlay("Getup");
                                                };
                                            };
                                            break;
                                    };
                                };
                                if (aura.cat != null){
                                    isOK = true;
                                    for each (existingAura in tLeaf.auras) {
                                        try {
                                            if (((!((existingAura.cat == null))) && ((existingAura.cat == aura.cat)))){
                                                isOK = false;
                                            };
                                        }
                                        catch(e:Error) {
                                            trace(("combat.applyAuras > " + e));
                                        };
                                    };
                                    if (isOK){
                                        switch (aura.cat){
											/* HP's Aura Addon */
											case "stun":
                                                tMC.mcChar.gotoAndPlay("Getup");
                                                tMC.mcChar.vertigoMC.visible = false;
												rootClass.ui.mcStatus.iconStun.visible = false;
                                                break;
											case "silenced":
                                                tMC.mcChar.gotoAndPlay("Getup");
                                                tMC.mcChar.silenceMC.visible = false;
												rootClass.ui.mcStatus.iconSilenced.visible = false;
                                                break;
											case "hex":
												tMC.mcChar.gotoAndPlay("Getup");
												rootClass.ui.mcStatus.iconHex.visible = false;
												break;
											case "freeze":
                                                tMC.modulateColor(this.statusFreezeCT, "-");
                                                tMC.mcChar.play();
												rootClass.ui.mcStatus.iconFreeze.visible = false;
                                                break;
											case "invi":
												tMC.mcChar.visible = true;
												tMC.shadow.visible = true;
												tMC.pname.visible = true;
												tMC.hpBar.visible = true;
												myAvatar.petMC.visible = true;
												rootClass.ui.mcStatus.iconInvicible.visible = false;
												break;
											/* End */
                                            case "stone":
                                                tMC.modulateColor(this.statusStoneCT, "-");
                                                tMC.mcChar.play();
												rootClass.ui.mcStatus.iconStone.visible = false;
                                                break;
											/*
											case "d":
                                                if (aura.dmgInc < 0){
													rootClass.ui.mcStatus.iconHoT.visible = false;
												} else {
													rootClass.ui.mcStatus.iconDoT.visible = false;
												}
                                                break;
											*/
                                            case "paralyze":
												tMC.mcChar.stop();
												rootClass.ui.mcStatus.iconParalyze.visible = false;
												break;
											case "disabled":
                                                rootClass.ui.mcStatus.iconDisabled.visible = false;
												tMC.mcChar.play();
                                                break;
                                            case "clean":
                                                tFilters = tMC.mcChar.filters;
                                                filterIndex = 0;
                                                while (filterIndex < tFilters.length) {
                                                    tFilter = tFilters[filterIndex];
                                                    if ((((tFilter is GlowFilter)) && ((GlowFilter(tFilter).color == 0xFFFFFF)))){
                                                        tFilters.splice(filterIndex, 1);
                                                        filterIndex = (filterIndex - 1);
                                                    };
                                                    filterIndex = (filterIndex + 1);
                                                };
                                                tMC.mcChar.filters = tFilters;
												rootClass.ui.mcStatus.iconClean.visible = false;
                                                break;
											case "recharge":
                                                tFilters = tMC.mcChar.filters;
                                                filterIndex = 0;
                                                while (filterIndex < tFilters.length) {
                                                    tFilter = tFilters[filterIndex];
                                                    if ((((tFilter is GlowFilter)) && ((GlowFilter(tFilter).color == 0xFF0000)))){
                                                        tFilters.splice(filterIndex, 1);
                                                        filterIndex = (filterIndex - 1);
                                                    };
                                                    filterIndex = (filterIndex + 1);
                                                };
                                                tMC.mcChar.filters = tFilters;
                                                break;
											case "restack":
                                                tFilters = tMC.mcChar.filters;
                                                filterIndex = 0;
                                                while (filterIndex < tFilters.length) {
                                                    tFilter = tFilters[filterIndex];
                                                    if ((((tFilter is GlowFilter)) && ((GlowFilter(tFilter).color == 0x000000)))){
                                                        tFilters.splice(filterIndex, 1);
                                                        filterIndex = (filterIndex - 1);
                                                    };
                                                    filterIndex = (filterIndex + 1);
                                                };
                                                tMC.mcChar.filters = tFilters;
                                                break;
											case "dmgTrc":
												if (aura.dmgInc > 0){
													rootClass.chatF.submitMsg("Aura Damage is Positive", "", rootClass.sfc.myUserName);
												} else {
													rootClass.chatF.submitMsg("Aura Damage is Negative", "", rootClass.sfc.myUserName);
												}
												break;
											case "gay":
												rootClass.chatF.submitMsg("/fart", "", rootClass.sfc.myUserName);
												break;
											default:
												//rootClass.chatF.submitMsg("Aura dmg:" + aura.dmgInc, "", rootClass.sfc.myUserName);
                                                if (aura.dmgInc > 0){
													rootClass.ui.mcStatus.iconHoT.visible = false;
												} else {
													rootClass.ui.mcStatus.iconDoT.visible = false;	
												}
												break;
                                        };
                                    };
                                };
                                if (aura.nam == "Skill Locked"){
                                    ai = 0;
                                    while (ai < this.actions.active.length) {
                                        actObj = this.actions.active[ai];
                                        if (actObj.nam == aura.val){
                                            icon1 = this.rootClass.ui.mcInterface.actBar.getChildByName(("i" + (ai + 1)));
                                            icon1.actObj.skillLock = false;
                                            icon1.cnt.alpha = 1;
                                        };
                                        ai = (ai + 1);
                                    };
                                };
                                if (aura.animOff != null){
                                    tMC.mcChar.gotoAndPlay(aura.animOff);
                                };
                                if (aura.msgOff != null){
                                    if (aura.msgOff.charAt(0) == "@"){
                                        if (tAvt == this.myAvatar){
                                            this.rootClass.addUpdate(aura.msgOff.substr(1));
                                        };
                                    }
                                    else {
                                        this.rootClass.addUpdate(aura.msgOff);
                                    };
                                };
                            };
                            i = (i + 1);
                        };
                        return;
                    case "aura*":
                        actionDamage = new auraDisplay();
                        actionDamage.t.ti.text = "* IMMUNE *";
                        tMC.addChild(actionDamage);
                        actionDamage.x = (((tMC.mcChar.scaleX)<0) ? 35 : (-(actionDamage.t.ti.textWidth) - 35));
                        actionDamage.y = ((tMC.pname.y + 25) + ((actionDamage.height + 3) * i));
                        return;
                };
            };
        }

        public function updateAuraData(_arg1:Object, _arg2:Object, _arg3:Object):void{
            var _local4:Object;
            for each (_local4 in _arg3.auras) {
                if ((((_local4.nam == _arg2.nam)) && ((_local4.cLeaf == _arg1)))){
                    _local4.dur = _arg2.dur;
                    _local4.val = _arg2.val;
                };
            };
        }

        public function handleAuraEvent(_arg1:String, _arg2:Object):void{
            var cLeaf:Object;
            var tLeaf:Object;
            var cAvt:Avatar;
            var tAvt:Avatar;
            var cTyp:String;
            var cID:int;
            var tTyp:String;
            var tID:int;
            var forceAura:Boolean;
            var cmd:String = _arg1;
            var resObj:Object = _arg2;
            trace("handleAuraEvent >");
            if (this.rootClass.sfcSocial){
                forceAura = false;
                if ((((cmd.indexOf("++") > -1)) || ((cmd.indexOf("--") > -1)))){
                    forceAura = true;
                };
                cAvt = null;
                tAvt = null;
                if (resObj.cInf != null){
                    cTyp = String(resObj.cInf.split(":")[0]);
                    cID = int(resObj.cInf.split(":")[1]);
                    switch (cTyp){
                        case "p":
                            cAvt = this.getAvatarByUserID(cID);
                            cLeaf = this.getUoLeafById(cID);
                            break;
                        case "m":
                            cAvt = this.getMonster(cID);
                            cLeaf = this.monTree[cID];
                            break;
                    };
                };
                if (resObj.tInf != null){
                    tTyp = String(resObj.tInf.split(":")[0]);
                    tID = int(resObj.tInf.split(":")[1]);
                    switch (tTyp){
                        case "p":
                            try {
                                tAvt = this.getAvatarByUserID(tID);
                                tLeaf = this.getUoLeafById(tID);
                                if (((forceAura) || ((tLeaf.strFrame == this.strFrame)))){
                                    if (this.rootClass.sfcSocial){
                                        this.showAuraChange(resObj, tAvt, tLeaf);
                                    };
                                };
                            }
                            catch(e:Error) {
                            };
                            return;
                        case "m":
                            try {
                                tAvt = this.getMonster(tID);
                                tLeaf = this.monTree[tID];
                                if (((forceAura) || ((((cLeaf == null)) || (((!((cLeaf.targets[tID] == null))) && ((tLeaf.strFrame == this.strFrame)))))))){
                                    if (this.rootClass.sfcSocial){
                                        this.showAuraChange(resObj, tAvt, tLeaf);
                                    };
                                };
                            }
                            catch(e:Error) {
                                trace((" HAE > " + e));
                            };
                            return;
                    };
                };
            };
        }

        public function removeAura(_arg1:Object, _arg2:Object, _arg3:MovieClip):Boolean{
            var _local4:Boolean;
            var _local5:int;
            trace(("removeAura > " + _arg1.nam));
            if (this.rootClass.sfcSocial){
                _local4 = false;
                _local5 = 0;
                _local5 = 0;
                while (_local5 < _arg2.auras.length) {
                    if (_arg2.auras[_local5].nam == _arg1.nam){
                        if (((!((_arg3 == null))) && (!((_arg2.auras[_local5].fx == null))))){
                            this.removeAuraFX(_arg3, _arg2.auras[_local5].fx, "fade");
                        };
                        _arg2.auras.splice(_local5, 1);
                        _local5 = _arg2.auras.length;
                        _local4 = true;
                    };
                    _local5++;
                };
                _local5 = 0;
                while (_local5 < _arg2.passives.length) {
                    if (_arg2.passives[_local5].nam == _arg1.nam){
                        _arg2.passives.splice(_local5, 1);
                        _local5 = _arg2.passives.length;
                        _local4 = false;
                    };
                    _local5++;
                };
                trace(("returning " + _local4));
                return (_local4);
            };
            trace("Unsocial, returning false");
            return (false);
        }

        public function addAuraFX(_arg1:MovieClip, _arg2:String):void{
            var c:Class;
            var fx:MovieClip;
            var tMC:MovieClip = _arg1;
            var fxName:String = _arg2;
            trace(("addAuraFX  > " + fxName));
            try {
                if (tMC.fx.getChildByName(fxName) == null){
                    c = this.getClass(fxName);
                    fx = MovieClip(tMC.fx.addChild(new (c)()));
                    fx.name = fxName;
                    fx.y = -30;
                };
            }
            catch(e:Error) {
                trace(e);
            };
            trace("");
        }

        public function removeAuraFX(_arg1:MovieClip, _arg2:String, _arg3:String=null):void{
            var i:int;
            var fx:MovieClip;
            var tMC:MovieClip = _arg1;
            var fxName:String = _arg2;
            var fxLabel = _arg3;
            trace((("removeAuraFX  > " + fxName) + (((fxLabel)!=null) ? (" " + fxLabel) : "")));
            i = 0;
            i = 0;
            while (i < tMC.fx.numChildren) {
                fx = MovieClip(tMC.fx.getChildAt(i));
                if ((((fxName == "all")) || ((fx.name == fxName)))){
                    if (fxLabel != null){
                        try {
                            MovieClip(fx.getChildByName("inner")).gotoAndPlay(fxLabel);
                        }
                        catch(fxe:Error) {
                            trace(("fx play error > " + fxe));
                        };
                    }
                    else {
                        MovieClip(tMC.fx.removeChildAt(i)).stop();
                        i = (i - 1);
                    };
                };
                i = (i + 1);
            };
        }

        public function isStatusGone(_arg1:String, _arg2:Object):Boolean{
            var _local3:*;
            _local3 = 0;
            while (_local3 < _arg2.auras.length) {
                if (((!((_arg2.auras[_local3].s == null))) && ((_arg2.auras[_local3].s == _arg1)))){
                    return (false);
                };
                _local3++;
            };
            return (true);
        }

        public function isMoveOK(_arg1:Object):Boolean{
            var isOK:Boolean;
            var aura:Object;
            var tLeaf:Object = _arg1;
            isOK = true;
            aura = {};
            if (tLeaf.auras != null){
                for each (aura in tLeaf.auras) {
                    try {
                        if (aura.cat != null){
                            if (aura.cat == "stun"){
                                isOK = false;
                            };
							if (aura.cat == "freeze"){
                                isOK = false;
                            };
                            if (aura.cat == "stone"){
                                isOK = false;
                            };
                            if (aura.cat == "disabled"){
                                isOK = false;
                            };
							if (aura.cat == "silenced"){
                                isOK = false;
                            };
                        };
                    }
                    catch(e:Error) {
                        trace(("doAnim > " + e));
                    };
                };
                return (isOK);
            };
            return (false);
        }

        public function wound(_arg1, _arg2){
            var _local3:*;
            if (_arg2 == "damage"){
                _local3 = new MovieClip();
                _local3.name = "flickermc";
                _local3.maxF = 3;
                _local3.curF = 0;
                _local3.addEventListener(Event.ENTER_FRAME, this.flickerFrame);
                if (_arg1.contains(_local3)){
                    _arg1.flickermc.removeEventListener(Event.ENTER_FRAME, this.flickerFrame);
                    _arg1.removeChild(_local3);
                };
                _arg1.addChild(_local3);
            };
        }

        public function flickerFrame(_arg1:Event){
            var _local2:*;
            _local2 = MovieClip(_arg1.currentTarget);
            if (((!((_local2.parent == null))) && (!((_local2.parent.stage == null))))){
                if (_local2.curF == 0){
                    _local2.parent.modulateColor(this.avtWCT, "+");
                };
                if (_local2.curF == 1){
                    _local2.parent.modulateColor(this.avtWCT, "-");
                };
                if (_local2.curF == 2){
                    _local2.parent.modulateColor(this.avtWCT, "+");
                };
                if (_local2.curF >= _local2.maxF){
                    _local2.parent.modulateColor(this.avtWCT, "-");
                    _local2.removeEventListener(Event.ENTER_FRAME, this.flickerFrame);
                    _local2.parent.removeChild(_local2);
                };
                _local2.curF++;
            }
            else {
                _local2.removeEventListener(Event.ENTER_FRAME, this.flickerFrame);
            };
        }

        public function unlockActionsExcept(_arg1){
            var _local2:*;
            var _local3:*;
            var _local4:*;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            _local2 = [];
            _local3 = 0;
            _local3 = 0;
            while (_local3 < this.actions.active.length) {
                _local5 = this.actions.active[_local3];
                if (((((!((_local5.ref == _arg1.ref))) && ((_local5.lock == true)))) && ((_local5.ts < _arg1.ts)))){
                    _local6 = 0;
                    while (_local6 < this.actionMap.length) {
                        if (this.actionMap[_local6] == _local5.ref){
                            _local2.push(("i" + (_local6 + 1)));
                        };
                        _local6++;
                    };
                };
                _local3++;
            };
            _local4 = 0;
            while (_local4 < _local2.length) {
                _local7 = this.rootClass.ui.mcInterface.actBar.getChildByName(_local2[_local4]);
                if (_local7.actObj != null){
                    _local7.actObj.lock = false;
                };
                _local4++;
            };
        }

        public function unlockActions(){
            var _local1:*;
            var _local2:*;
            _local1 = 0;
            while (_local1 < this.actions.active.length) {
                _local2 = this.actions.active[_local1];
                _local2.lock = false;
                _local1++;
            };
        }

        public function updateActBar():void{
            var _local1:*;
            var _local2:*;
            var _local3:*;
            if (((((!((this.myAvatar == null))) && (!((this.myAvatar.dataLeaf == null))))) && (!((this.myAvatar.dataLeaf.sta == null))))){
                _local1 = 0;
                while (_local1 < this.rootClass.ui.mcInterface.actBar.numChildren) {
                    _local2 = this.rootClass.ui.mcInterface.actBar.getChildAt(_local1);
                    if (((("actObj" in _local2)) && (!((_local2.actObj == null))))){
                        _local3 = _local2.actObj.skillLock;
                        _local3 = (((_local3)==null) ? false : _local3);
                        if ((((this.myAvatar.dataLeaf.intMP >= Math.round((_local2.actObj.mp * this.myAvatar.dataLeaf.sta["$cmc"])))) && (!(_local3)))){
                            if (_local2.cnt.alpha < 1){
                                _local2.cnt.alpha = 1;
                            };
                        }
                        else {
                            if (_local2.cnt.alpha == 1){
                                _local2.cnt.alpha = 0.4;
                            };
                        };
                    };
                    _local1++;
                };
            };
        }

        public function getActIcons(_arg1:Object):Array{
            var _local2:Array;
            var _local3:MovieClip;
            var _local4:*;
            _local2 = [];
            _local4 = 0;
            while (_local4 < this.actionMap.length) {
                if (this.actionMap[_local4] == _arg1.ref){
                    _local3 = (this.rootClass.ui.mcInterface.actBar.getChildByName(("i" + (_local4 + 1))) as MovieClip);
                    if (_local3 != null){
                        _local2.push(_local3);
                    };
                };
                _local4++;
            };
            return (_local2);
        }

        public function globalCoolDownExcept(_arg1:Object):void{
            var _local2:Number;
            var _local3:MovieClip;
            var _local4:Object;
            _local2 = new Date().getTime();
            for each (_local4 in this.actions.active) {
                if (_local4.isOK){
                    _local3 = this.getActIcons(_local4)[0];
                    if (_local3 != null){
                        try {
                            if (((((!((_local4 == _arg1))) && (!((_local4.ref == "aa"))))) && (((((!(("icon2" in _local3))) || ((_local3.icon2 == null)))) || (((((_local4.ts + _local4.cd) > _local2)) && ((((_local4.ts + _local4.cd) - _local2) < this.GCD)))))))){
                                this.coolDownAct(_local4, this.GCD, _local2);
                            };
                        }
                        catch(e:Error) {
                        };
                    };
                };
            };
            this.GCDTS = _local2;
        }

        public function checkCooldown(_arg1:Object){
            var _local2:Array;
            var _local3:MovieClip;
            var _local4:int;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            _local2 = this.getActIcons(_arg1);
            while (_local4 < _local2.length) {
                _local3 = _local2[_local4];
                if (_local3.icon2 != null){
                    _local3.bitmapData.dispose();
                    _local5 = new BitmapData(50, 50, true, 0);
                    _local5.draw(_local3, null, this.iconCT);
                    _local6 = new Bitmap(_local5);
                    _local7 = this.rootClass.ui.mcInterface.actBar.addChild(_local6);
                    _local3.icon2 = _local7;
                };
                _local4++;
            };
        }

        public function coolDownAct(_arg1:Object, _arg2:int=-1, _arg3:Number=-1){
            var _local4:Array;
            var _local5:MovieClip;
            var _local6:int;
            var _local7:*;
            var _local8:MovieClip;
            var _local9:*;
            var _local10:*;
            var _local11:int;
            var _local12:DisplayObject;
            _local4 = this.getActIcons(_arg1);
            _local6 = 0;
            while (_local6 < _local4.length) {
                _local5 = _local4[_local6];
                _local7 = null;
                _local8 = null;
                if (_local5.icon2 == null){
                    _local9 = new BitmapData(50, 50, true, 0);
                    _local9.draw(_local5, null, this.iconCT);
                    _local10 = new Bitmap(_local9);
                    _local7 = this.rootClass.ui.mcInterface.actBar.addChild(_local10);
                    _local5.icon2 = _local7;
                    if (_arg2 == -1){
                        _local12 = this.rootClass.ui.mcInterface.actBar.addChild(new iconFlare());
                        _local7.transform = (_local12.transform = _local5.transform);
                        _local5.ts = _arg1.ts;
                        _local5.cd = _arg1.cd;
                    }
                    else {
                        _local7.transform = _local5.transform;
                        _local5.ts = _arg3;
                        _local5.cd = _arg2;
                    };
                    _local8 = (this.rootClass.ui.mcInterface.actBar.addChild(new ActMask()) as MovieClip);
                    _local8.scaleX = 0.33;
                    _local8.scaleY = 0.33;
                    _local8.x = int(((_local7.x + (_local7.width / 2)) - (_local8.width / 2)));
                    _local8.y = int(((_local7.y + (_local7.height / 2)) - (_local8.height / 2)));
                    _local11 = 0;
                    while (_local11 < 4) {
                        _local8[(("e" + _local11) + "oy")] = _local8[("e" + _local11)].y;
                        _local11++;
                    };
                    _local7.mask = _local8;
                }
                else {
                    _local7 = _local5.icon2;
                    _local8 = _local7.mask;
                    if (_arg2 == -1){
                        _local5.ts = _arg1.ts;
                        _local5.cd = _arg1.cd;
                    }
                    else {
                        _local5.ts = _arg3;
                        _local5.cd = _arg2;
                    };
                };
                _local8.e0.stop();
                _local8.e1.stop();
                _local8.e2.stop();
                _local8.e3.stop();
                _local5.removeEventListener(Event.ENTER_FRAME, this.countDownAct);
                _local5.addEventListener(Event.ENTER_FRAME, this.countDownAct, false, 0, true);
                _local6++;
            };
        }

        public function countDownAct(_arg1:Event):void{
            var _local2:*;
            var _local3:*;
            var _local4:*;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local8:*;
            var _local9:*;
            var _local10:*;
            var _local11:*;
            _local2 = new Date();
            _local3 = _local2.getTime();
            _local4 = MovieClip(_arg1.target);
            _local5 = _local4.icon2;
            _local6 = Math.round((_local4.cd * (1 - Math.min(Math.max(this.myAvatar.dataLeaf.sta.$tha, -1), 0.5))));
            _local7 = ((_local3 - _local4.ts) / _local6);
            _local8 = Math.floor((_local7 * 4));
            _local9 = (int(((_local7 * 360) % 90)) + 1);
            if (!_local4.actObj.lock){
                if (_local7 < 0.99){
                    _local10 = 0;
                    while (_local10 < 4) {
                        if (_local10 < _local8){
                            _local5.mask[("e" + _local10)].y = -300;
                        }
                        else {
                            _local5.mask[("e" + _local10)].y = _local5.mask[(("e" + _local10) + "oy")];
                            if (_local10 > _local8){
                                _local5.mask[("e" + _local10)].gotoAndStop(0);
                            };
                        };
                        _local10++;
                    };
                    MovieClip(_local5.mask[("e" + _local8)]).gotoAndStop(_local9);
                }
                else {
                    _local11 = _local5.mask;
                    _local5.mask = null;
                    _local5.parent.removeChild(_local11);
                    _local4.removeEventListener(Event.ENTER_FRAME, this.countDownAct);
                    _local5.parent.removeChild(_local5);
                    _local5.bitmapData.dispose();
                    _local4.icon2 = null;
                };
            };
        }

        public function healByIcon(_arg1:Avatar):void{
            var _local2:Object;
            _local2 = this.getFirstHeal();
            if (_local2 != null){
                this.setTarget(_arg1);
                this.testAction(_local2);
            };
        }

        public function getFirstHeal():Object{
            var _local1:*;
            try {
                _local1 = 0;
                while (_local1 < this.actions.active.length) {
                    if (((((((!((this.actions.active[_local1] == null))) && (!((this.actions.active[_local1].damage == null))))) && ((this.actions.active[_local1].damage < 0)))) && (this.actions.active[_local1].isOK))){
                        return (this.actions.active[_local1]);
                    };
                    _local1++;
                };
            }
            catch(e:Error) {
            };
            return (null);
        }

        public function AATest(_arg1:Event){
            trace("TIMER AATest > DISABLED");
        }

        public function connTest(_arg1:Event){
            trace("TIMER connTest > Failed!  This should not appear, test was removed.");
        }

        function checkSP(_arg1:int, _arg2:Object):Boolean{
            var _local3:*;
            _local3 = 0;
            while (_local3 < _arg2.auras.length) {
                if (_arg2.auras[_local3].nam == "Spirit Power"){
                    if (_arg1 <= _arg2.auras[_local3].val){
                        return (true);
                    };
                    return (false);
                };
                _local3++;
            };
            return (false);
        }

        public function acceptQuest(_arg1:int):void{
            if (this.questTree[_arg1] == null){
                this.getQuests([_arg1]);
            };
            if (this.questTree[_arg1].status == null){
                this.questTree[_arg1].status = "p";
                this.rootClass.ui.mcQTracker.updateQuest();
            };
            if (!this.rootClass.ui.mcQTracker.visible){
                this.rootClass.ui.mcQTracker.toggle();
            };
            this.rootClass.sfc.sendXtMessage("zm", "acceptQuest", [_arg1], "str", this.curRoom);
        }

        public function tryQuestComplete(_arg1:int, _arg2:int=-1, _arg3:Boolean=false):void{
            this.rootClass.sfc.sendXtMessage("zm", "tryQuestComplete", [_arg1, _arg2, _arg3, "wvz"], "str", this.curRoom);
        }

        public function getMapItem(_arg1:int):void{
            if (this.coolDown("getMapItem")){
                this.rootClass.sfc.sendXtMessage("zm", "getMapItem", [_arg1], "str", this.curRoom);
            };
        }

        public function isQuestInProgress(_arg1:int):Boolean{
            return (((!((this.questTree[_arg1] == null))) && (!((this.questTree[_arg1].status == null)))));
        }

        public function getQuests(_arg1:Array):void{
            this.rootClass.sfc.sendXtMessage("zm", "getQuests", _arg1, "str", this.curRoom);
        }

        public function getQuest(_arg1:int):void{
        }

        public function showQuestList(_arg1:String, _arg2:String, _arg3:String):void{
            var _local4:*;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local8:*;
            var _local9:String;
            if (!this.rootClass.isGreedyModalInStack()){
                this.rootClass.clearPopupsQ();
                _local4 = this.rootClass.attachOnModalStack("QFrameMC");
                _local5 = _arg2.split(",");
                _local6 = _arg3.split(",");
                _local4.sIDs = _local5;
                _local4.tIDs = _local6;
                _local4.world = this;
                _local4.rootClass = this.rootClass;
                _local4.qMode = _arg1;
                _local7 = [];
                _local8 = 0;
                while (_local8 < _local5.length) {
                    _local9 = _local5[_local8];
                    if (this.questTree[_local9] == null){
                        _local7.push(_local9);
                    }
                    else {
                        if (this.questTree[_local9].strDynamic != null){
                            this.questTree[_local9] = null;
                            delete this.questTree[_local9];
                            _local7.push(_local9);
                        };
                    };
                    _local8++;
                };
                if ((((_local7.length > 0)) && (!((_arg2 == ""))))){
                    this.getQuests(_local7);
                }
                else {
                    _local4.open();
                };
            };
        }

        public function showQuests(_arg1:String, _arg2:String):void{
            this.showQuestList(_arg2, _arg1, _arg1);
        }

        public function showQuestLink(_arg1:Object):void{
            var _local2:String;
            var _local3:String;
            var _local4:String;
            _local2 = "$({";
            _local3 = "})$";
            _local4 = "";
            if (_arg1.unm.toLowerCase() != this.rootClass.sfc.myUserName){
                _local4 = (_local4 + ((_arg1.unm + " issues a Call to Arms for ") + _local2));
                _local4 = (_local4 + ["quest", _arg1.quest.sName, _arg1.quest.QuestID, _arg1.quest.iLvl, _arg1.unm].toString());
                _local4 = (_local4 + (_local3 + "!"));
            }
            else {
                _local4 = (_local4 + (("You issue a Call to Arms for " + _arg1.quest.sName) + "!"));
            };
            this.rootClass.chatF.pushMsg("event", _local4, "SERVER", "", 0);
        }

        public function getActiveQuests():String{
            var _local1:String;
            var _local2:*;
            var _local3:*;
            _local1 = "";
            for (_local2 in this.questTree) {
                _local3 = this.questTree[_local2];
                if (_local3.status != null){
                    if (_local1.length){
                        _local1 = (_local1 + ("," + _local2));
                    }
                    else {
                        _local1 = (_local1 + _local2);
                    };
                };
            };
            return (_local1);
        }

        public function checkAllQuestStatus(_arg1=null){
            var _local2:Array;
            var _local3:String;
            var _local4:*;
            var _local5:*;
            var _local6:*;
            var _local7:int;
            var _local8:*;
            var _local9:*;
            var _local10:*;
            _local2 = [];
            if (_arg1 != null){
                _local2 = [String(_arg1)];
            }
            else {
                for (_local3 in this.questTree) {
                    _local2.push(_local3);
                };
            };
            for each (_local3 in _local2) {
                _local4 = this.questTree[_local3];
                _local5 = {};
                if (_local4.status != null){
                    if (((!((_local4.turnin == null))) && ((_local4.turnin.length > 0)))){
                        _local5.sItems = true;
                        _local7 = 0;
                        while (_local7 < _local4.turnin.length) {
                            _local8 = _local4.turnin[_local7].ItemID;
                            _local9 = _local4.turnin[_local7].iQty;
                            if ((((this.invTree[_local8] == null)) || ((this.invTree[_local8].iQty < _local9)))){
                                _local5.sItems = false;
                                break;
                            };
                            _local7++;
                        };
                    };
                    if (_local4.iTime != null){
                        _local5.iTime = false;
                        if (_local4.ts != null){
                            _local10 = new Date();
                            if ((_local10.getTime() - _local4.ts) <= _local4.iTime){
                                _local5.iTime = true;
                            };
                        };
                    };
                    _local4.status = "c";
                    for (_local6 in _local5) {
                        if (_local5[_local6] == false){
                            _local4.status = "p";
                        };
                    };
                };
            };
            this.rootClass.ui.mcQTracker.updateQuest();
        }

        public function updateQuestProgress(_arg1:String, _arg2:Object):void{
            var _local3:*;
            var _local4:*;
            var _local5:*;
            var _local6:int;
            var _local7:*;
            var _local8:*;
            var _local9:*;
            for (_local3 in this.questTree) {
                _local4 = this.questTree[_local3];
                _local5 = {};
                if (((!((_local4.status == null))) && ((_local4.status == "p")))){
                    if ((((((_arg1 == "item")) && (!((_local4.turnin == null))))) && ((_local4.turnin.length > 0)))){
                        _local5.sItems = true;
                        _local6 = 0;
                        while (_local6 < _local4.turnin.length) {
                            _local7 = _local4.turnin[_local6].ItemID;
                            _local8 = _local4.turnin[_local6].iQty;
                            if ((((((_arg2.ItemID == _local7)) && (!((this.invTree[_local7] == null))))) && ((this.invTree[_local7].iQty <= _local8)))){
                                _local9 = this.invTree[_local7];
                                this.rootClass.addUpdate(((((((_local4.sName + ": ") + _local9.sName) + " ") + this.invTree[_local7].iQty) + "/") + _local8));
                            };
                            _local6++;
                        };
                    };
                    this.checkAllQuestStatus(_local3);
                    if (_local4.status == "c"){
                        this.rootClass.addUpdate((_local4.sName + " complete!"));
                        this.rootClass.mixer.playSound("Good");
                    };
                };
            };
        }

        public function canTurnInQuest(_arg1:int):Boolean{
            var _local2:*;
            var _local3:int;
            var _local4:*;
            var _local5:*;
            _local2 = this.questTree[_arg1];
            if (((!((_local2.turnin == null))) && ((_local2.turnin.length > 0)))){
                _local3 = 0;
                while (_local3 < _local2.turnin.length) {
                    _local4 = _local2.turnin[_local3].ItemID;
                    _local5 = _local2.turnin[_local3].iQty;
                    if ((((this.invTree[_local4] == null)) || ((this.invTree[_local4].iQty < _local5)))){
                        return (false);
                    };
                    if (this.myAvatar.isItemEquipped(_local4)){
                        this.rootClass.MsgBox.notify("Cannot turn in equipped item(s)!");
                        return (false);
                    };
                    _local3++;
                };
            };
            return (true);
        }

        public function abandonQuest(_arg1:int):void{
            this.questTree[_arg1].status = null;
            this.rootClass.ui.mcQTracker.updateQuest();
        }

        public function completeQuest(_arg1:int):void{
            if (this.questTree[_arg1] != null){
                this.questTree[_arg1].status = null;
                this.rootClass.ui.mcQTracker.updateQuest();
            };
        }

        public function toggleQuestLog():void{
            var _local1:*;
            _local1 = this.rootClass.getInstanceFromModalStack("QFrameMC");
            if (_local1 == null){
                this.showQuests("", "l");
            }
            else {
                _local1.open();
            };
        }

        public function isPartyMember(_arg1:String):Boolean{
            var _local2:int;
            _arg1 = _arg1.toLowerCase();
            if (_arg1 != this.rootClass.sfc.myUserName){
                _local2 = 0;
                while (_local2 < this.partyMembers.length) {
                    if (this.partyMembers[_local2].toLowerCase() == _arg1){
                        return (true);
                    };
                    _local2++;
                };
            };
            return (false);
        }

        public function doPartyAccept(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "gp", ["pa", _arg1.pid], "str", 1);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "gp", ["pd", _arg1.pid], "str", 1);
            };
        }

        public function doCTAAccept(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "gp", ["ctaa", _arg1.unm], "str", 1);
                this.showQuests(_arg1.QuestID, "q");
            };
        }

        public function doCTAClick(_arg1:MouseEvent):void{
            var _local2:MovieClip;
            var _local3:ModalMC;
            var _local4:Object;
            _local2 = (_arg1.currentTarget as MovieClip);
            _local3 = new ModalMC();
            _local4 = {};
            _local4.strBody = (("Would you like to join the next available party for " + _local2.sName) + "?");
            _local4.callback = this.doCTAAccept;
            _local4.params = {
                QuestID:_local2.QuestID,
                unm:_local2.unm
            };
            _local4.btns = "dual";
            this.rootClass.ui.ModalStack.addChild(_local3);
            _local3.init(_local4);
        }

        public function addPartyMember(_arg1:String){
            this.partyMembers.push(_arg1);
            this.updatePartyFrame();
        }

        public function removePartyMember(_arg1:String){
            var _local2:*;
            if (_arg1 != this.rootClass.sfc.myUserName){
                _local2 = this.partyMembers.indexOf(_arg1);
                if (_local2 > -1){
                    this.partyMembers.splice(_local2, 1);
                };
            }
            else {
                this.partyID = -1;
                this.partyOwner = "";
                this.partyMembers = [];
            };
            this.updatePartyFrame();
        }

        public function updatePartyFrame(_arg1:Object=null){
            var _local2:MovieClip;
            var _local3:int;
            var _local4:int;
            var _local5:MovieClip;
            var _local6:int;
            var _local7:Object;
            var _local8:Array;
            var _local9:Boolean;
            var _local10:Boolean;
            var _local11:String;
            var _local12:*;
            var _local13:*;
            _local2 = null;
            _local3 = 0;
            _local4 = 0;
            _local5 = null;
            _local6 = 0;
            _local7 = null;
            _local8 = [];
            _local9 = true;
            _local10 = false;
            if (((((!((_arg1 == null))) && (!((_arg1.range == null))))) && ((_arg1.range == false)))){
                _local9 = false;
            };
            if (_arg1 != null){
                _local8 = [_arg1.unm];
            }
            else {
                _local10 = true;
                _local8 = this.partyMembers;
            };
            if (_local8.length > 0){
                _local11 = "";
                if (_arg1 == null){
                    _local12 = [];
                    _local6 = 0;
                    _local6 = 0;
                    while (_local6 < this.rootClass.ui.mcPartyFrame.numChildren) {
                        _local12.push(MovieClip(this.rootClass.ui.mcPartyFrame.getChildAt(_local6)));
                        _local6++;
                    };
                    _local6 = 0;
                    _local6 = 0;
                    while (_local6 < _local12.length) {
                        _local2 = _local12[_local6];
                        _local13 = _local2.strName.text;
                        if (this.partyMembers.indexOf(_local13) == -1){
                            _local2.removeEventListener(MouseEvent.CLICK, this.onPartyPanelClick);
                            this.rootClass.ui.mcPartyFrame.removeChild(_local2);
                        };
                        _local6++;
                    };
                };
                _local6 = 0;
                while (_local6 < _local8.length) {
                    _local11 = _local8[_local6];
                    _local2 = this.getPartyPanelByName(_local11);
                    _local7 = this.uoTree[_local11.toLowerCase()];
                    if (_local7 == null){
                        _local2.HP.visible = false;
                        _local2.MP.visible = false;
                        _local2.txtRange.visible = true;
                    }
                    else {
                        if (_local9){
                            _local3 = _local7.intHP;
                            _local4 = _local7.intHPMax;
                            _local5 = _local2.HP;
                            if (_local3 >= 0){
                                _local5.strIntHP.text = (_local5.strIntHPs.text = String(_local7.intHP));
                            }
                            else {
                                _local5.strIntHP.text = (_local5.strIntHPs.text = "X");
                            };
                            if (_local3 < 0){
                                _local3 = 0;
                            };
                            _local5.intHPbar.x = -((_local5.intHPbar.width * (1 - (_local3 / _local4))));
                            _local3 = _local7.intMP;
                            _local4 = _local7.intMPMax;
                            _local5 = _local2.MP;
                            if (_local3 >= 0){
                                _local5.strIntMP.text = (_local5.strIntMPs.text = String(_local7.intMP));
                            }
                            else {
                                _local5.strIntMP.text = (_local5.strIntMPs.text = "X");
                            };
                            if (_local3 < 0){
                                _local3 = 0;
                            };
                            _local5.intMPbar.x = -((_local5.intMPbar.width * (1 - (_local3 / _local4))));
                            _local2.HP.visible = true;
                            _local2.MP.visible = true;
                            _local2.txtRange.visible = false;
                        }
                        else {
                            _local2.HP.visible = false;
                            _local2.MP.visible = false;
                            _local2.txtRange.visible = true;
                        };
                    };
                    if (_local10){
                        _local2.y = int(((_local2.height + 2) * _local6));
                    };
                    _local2.partyLead.visible = (_local11.toLowerCase() == this.partyOwner.toLowerCase());
                    _local6++;
                };
            }
            else {
                _local6 = 0;
                while ((((this.rootClass.ui.mcPartyFrame.numChildren > 0)) && ((_local6 < 10)))) {
                    _local2 = MovieClip(this.rootClass.ui.mcPartyFrame.getChildAt(0));
                    _local2.removeEventListener(MouseEvent.CLICK, this.onPartyPanelClick);
                    this.rootClass.ui.mcPartyFrame.removeChildAt(0);
                    _local6++;
                };
            };
            this.rootClass.ui.mcPortrait.partyLead.visible = (this.partyOwner.toLowerCase() == this.rootClass.sfc.myUserName);
        }

        public function createPartyPanel(_arg1:Object):MovieClip{
            var _local3:*;
            var _local2:* = (this.rootClass.ui.mcPartyFrame.numChildren + 1);
            _local3 = MovieClip(this.rootClass.ui.mcPartyFrame.addChild(new PartyPanel()));
            _local3.strName.text = _arg1.unm;
            _local3.HP.visible = false;
            _local3.MP.visible = false;
            _local3.txtRange.visible = false;
            _local3.addEventListener(MouseEvent.CLICK, this.onPartyPanelClick, false, 0, true);
            _local3.buttonMode = true;
            return (_local3);
        }

        public function getPartyPanelByName(_arg1:String):MovieClip{
            var _local2:*;
            var _local3:MovieClip;
            var _local4:int;
            _local2 = this.rootClass.ui.mcPartyFrame.numChildren;
            _local3 = null;
            _local4 = 0;
            while (_local4 < _local2) {
                _local3 = MovieClip(this.rootClass.ui.mcPartyFrame.getChildAt(_local4));
                if (_local3.strName.text == _arg1){
                    return (_local3);
                };
                _local4++;
            };
            return (this.createPartyPanel({unm:_arg1}));
        }

        public function onPartyPanelClick(_arg1:MouseEvent):void{
            var _local2:*;
            var _local3:*;
            var _local4:Avatar;
            _local2 = MovieClip(_arg1.currentTarget);
            _local3 = {};
            _local3.strUsername = _local2.strName.text;
            if (_arg1.shiftKey){
                _local4 = this.getAvatarByUserName(_local3.strUsername.toLowerCase());
                if (((((((!((_local4 == null))) && (!((_local4.pMC == null))))) && (!((_local4.dataLeaf == null))))) && ((_local4.dataLeaf.strFrame == this.myAvatar.dataLeaf.strFrame)))){
                    this.setTarget(_local4);
                };
            }
            else {
                this.rootClass.ui.cMenu.fOpenWith("party", _local3);
            };
        }

        public function partyInvite(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "gp", ["pi", _arg1], "str", 1);
        }

        public function partyKick(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "gp", ["pk", _arg1], "str", 1);
        }

        public function partyLeave():void{
            this.rootClass.sfc.sendXtMessage("zm", "gp", ["pl"], "str", 1);
        }

        public function partySummon(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "gp", ["ps", _arg1], "str", 1);
        }

        public function acceptPartySummon(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "gp", ["psa"], "str", 1);
                if (_arg1.strF == null){
                    this.rootClass.sfc.sendXtMessage("zm", "cmd", ["goto", _arg1.unm], "str", 1);
                }
                else {
                    this.moveToCell(_arg1.strF, _arg1.strP);
                };
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "gp", ["psd", _arg1.unm], "str", 1);
            };
        }
		
		
		public function acceptStatUpdate(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "us", [_arg1.Strenght, _arg1.Intellect, _arg1.Endurance, _arg1.Dexterity, _arg1.Wisdom, _arg1.Luck], "str", 1);
            };
        }

        public function partyUpdate(_arg1:String, _arg2:String):void{
        }

        public function partyPromote(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "gp", ["pp", _arg1], "str", 1);
        }

        public function goto(_arg1){
            var _local2:*;
            var _local3:*;
            _arg1 = _arg1.toLowerCase();
            _local2 = this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()];
            _local3 = this.uoTree[String(_arg1).toLowerCase()];
            if ((((_local2.intState == 1)) && ((((_local2.pvpTeam == null)) || ((_local2.pvpTeam == -1)))))){
                if (((!((_local3 == null))) && (!((_local2.uoName == _local3.uoName))))){
                    if (((("nogoto" in this.map)) && (this.map.nogoto))){
                        this.rootClass.chatF.pushMsg("warning", "/goto can't target players within this map.", "SERVER", "", 0);
                        return;
                    };
                    if (_local2.strFrame != _local3.strFrame){
                        this.moveToCell(_local3.strFrame, _local3.strPad);
                    };
                }
                else {
                    this.rootClass.sfc.sendXtMessage("zm", "cmd", ["goto", _arg1], "str", 1);
                };
            };
        }
		/*
		public function flyToggle():void
        {	
            var tarPt:Point;
            if ((((((myAvatar == null)) || ((myAvatar.pMC == null)))) || (myAvatar.pMC.bFlyTransition))){
                return;
            };
			
			var _local1:* = this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()];
            if (_local1 != null){
                this.rootClass.sfc.sendXtMessage("zm", "afk", [!(_local1.afk)], "str", 1);
				myAvatar.pMC.fly = !(uoLeaf.fly);
                if (!(uoLeaf.fly)){
                    tarPt = myAvatar.pMC.simulateJumpUp();
                    myAvatar.pMC.GroundToFly();
                } else {
                    tarPt = myAvatar.pMC.simulateJumpDown();
                    myAvatar.pMC.FlyToGround();
                };
                ToFly(myAvatar.pMC, tarPt.x, tarPt.y, 0, int(!(uoLeaf.fly)));
            };
			
			/*var uoLeaf:* = this.uoTree[this.rootClass.sfc.myUserName.toLowerCase()];
            if (((!((uoLeaf == null))) && ((uoLeaf.intState == 1)))){
                myAvatar.pMC.fly = !(uoLeaf.fly);
                if (!(uoLeaf.fly)){
                    tarPt = myAvatar.pMC.simulateJumpUp();
                    myAvatar.pMC.GroundToFly();
                } else {
                    tarPt = myAvatar.pMC.simulateJumpDown();
                    myAvatar.pMC.FlyToGround();
                };
                ToFly(myAvatar.pMC, tarPt.x, tarPt.y, 0, int(!(uoLeaf.fly)));
            };
			
        }*/
		
		public function flyToggle():void
        {
            var uoLeaf:*;
            var tarPt:Point;
            if ((((((myAvatar == null)) || ((myAvatar.pMC == null)))) || (myAvatar.pMC.bFlyTransition))){
				trace(">> 1");
                return;
            };
            uoLeaf = uoTree[rootClass.sfc.myUserName];
            if (((!((uoLeaf == null))) && ((uoLeaf.intState == 1)))){
                myAvatar.pMC.fly = !(uoLeaf.fly);
                if (!(uoLeaf.fly)){
					trace(">> 2");
                    tarPt = myAvatar.pMC.simulateJumpUp();
                    myAvatar.pMC.GroundToFly();
                } else {
					trace(">> 3");
                    tarPt = myAvatar.pMC.simulateJumpDown();
                    myAvatar.pMC.FlyToGround();
                };
                ToFly(myAvatar.pMC, tarPt.x, tarPt.y, 0, int(!(uoLeaf.fly)));
            };
        }
			

        public function pull(_arg1){
            _arg1 = _arg1.toLowerCase();
            this.rootClass.sfc.sendXtMessage("zm", "cmd", ["pull", _arg1], "str", 1);
        }

        public function requestFriend(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "requestFriend", [_arg1], "str", 1);
        }

        public function addFriend(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "addFriend", [_arg1.unm], "str", 1);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "declineFriend", [_arg1.unm], "str", 1);
            };
        }

        public function deleteFriend(_arg1:int, _arg2):void{
            this.rootClass.sfc.sendXtMessage("zm", "deleteFriend", [_arg1, _arg2], "str", 1);
        }

        public function guildInvite(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["gi", _arg1], "str", 1);
        }
		//War Extension
        public function replyToGuildWarInvite(_arg1:Object):void{
            if (_arg1.accept){
                this.sendGuildWarInviteAccept();
            }
            else {
                this.sendGuildWarInviteDecline();
            };
        }

        public function sendGuildWarInviteAccept():void{
            this.rootClass.sfc.sendXtMessage("zm", "gw", ["1"], "str", this.rootClass.world.curRoom);
        }

        public function sendGuildWarInviteDecline():void{
            this.rootClass.sfc.sendXtMessage("zm", "gw", ["0"], "str", this.rootClass.world.curRoom);
        }

        public function sendGuildWarInvite(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "gw", [_arg1], "str", 1);
        }
		
        public function doGuildWarAccept(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "gwa", [_arg1.unm], "str", 1);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "gwd", [_arg1.unm], "str", 1);
            };
        }
		
        public function GuildWarExpire(){
            this.rootClass.closeModalByStrBody("has challenged you to a guild war.");
        }

		//Guild Summon
        public function replyToGuildLeaderSummon(_arg1:Object):void{
            if (_arg1.accept){
                this.sendGuildLeaderSummonAccept();
            }
            else {
                this.sendGuildLeaderSummonDecline();
            };
        }

        public function sendGuildLeaderSummonAccept():void{
            this.rootClass.sfc.sendXtMessage("zm", "gs", ["1"], "str", this.rootClass.world.curRoom);
        }

        public function sendGuildLeaderSummonDecline():void{
            this.rootClass.sfc.sendXtMessage("zm", "gs", ["0"], "str", this.rootClass.world.curRoom);
        }

        public function sendGuildLeaderSummonInvite():void{
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["gs"], "str", 1);
        }
		
        public function doGuildLeaderSummonAccept(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gsa", _arg1.unm], "str", 1);
				if (_arg1.strF == null){
                    this.rootClass.sfc.sendXtMessage("zm", "cmd", ["goto", _arg1.unm], "str", 1);
                }
                else {
                    this.moveToCell(_arg1.strF, _arg1.strP);
                };
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gsd", _arg1.unm], "str", 1);
            };
        }
		
        public function GuildLeaderSummonExpire(){
            this.rootClass.closeModalByStrBody("has summoned you.");
        }

		public function doGuildLeaderChangeAccept(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gcl", _arg1.userName], "str", 1);
				this.rootClass.world.myAvatar.objData.guildRank = 1;
            }
        }

        public function guildRemove(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gr", _arg1.userName], "str", 1);
            };
        }

        public function guildPromote(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["gp", _arg1], "str", 1);
        }

        public function guildDemote(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["gd", _arg1], "str", 1);
        }

        public function doGuildAccept(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["ga", _arg1.guildID, _arg1.owner], "str", 1);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gdi", _arg1.guildID, _arg1.owner], "str", 1);
            };
        }

        public function setGuildMOTD(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["motd", _arg1], "str", 1);
        }

        public function createGuild(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gc", _arg1.guildName], "str", 1);
            };
        }

        public function addMemSlots(_arg1:int):void{
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["slots", _arg1], "str", 1);
        }

        public function renameGuild(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["rename", _arg1.guildName], "str", 1);
            };
        }

        public function requestPVPQueue(_arg1:String, _arg2:int=-1):void{
            this.rootClass.sfc.sendXtMessage("zm", "PVPQr", [_arg1, _arg2], "str", this.rootClass.world.curRoom);
        }

        public function handlePVPQueue(_arg1:Object):void{
            var _local2:MovieClip;
            if (_arg1.bitSuccess == 1){
                this.PVPQueue.warzone = _arg1.warzone;
                this.PVPQueue.ts = new Date().getTime();
                this.PVPQueue.avgWait = _arg1.avgWait;
                this.rootClass.showMCPVPQueue();
            }
            else {
                this.PVPQueue.warzone = "";
                this.PVPQueue.ts = -1;
                this.PVPQueue.avgWait = -1;
                this.rootClass.hideMCPVPQueue();
            };
            _local2 = this.rootClass.ui.mcPopup;
            if ((((_local2.currentLabel == "PVPPanel")) && (!((_local2.mcPVPPanel == null))))){
                _local2.mcPVPPanel.updateBody();
            };
            this.rootClass.closeModalByStrBody("A new Warzone battle has started!");
        }

        public function updatePVPAvgWait(_arg1:int):void{
            this.PVPQueue.avgWait = _arg1;
        }

        public function duelExpire(){
            this.rootClass.closeModalByStrBody("has challenged you to a duel.");
        }

        public function receivePVPInvite(_arg1:Object){
            var _local2:*;
            var _local3:*;
            var _local4:*;
            _local2 = new ModalMC();
            _local3 = {};
            _local4 = this.getWarzoneByWarzoneName(_arg1.warzone);
            _local3.strBody = (("A new Warzone battle has started!  Will you join " + _local4.nam) + "?");
            _local3.greedy = true;
            _local3.params = {};
            _local3.callback = this.replyToPVPInvite;
            this.rootClass.ui.ModalStack.addChild(_local2);
            this.rootClass.ui.mcPopup.onClose();
            this.rootClass.hideMCPVPQueue();
            _local2.init(_local3);
        }
		
		public function weddingInviteBride(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "wedding", ["wib", _arg1], "str", 1);
        }
		
		public function weddingInviteGroom(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "wedding", ["wig", _arg1], "str", 1);
        }
		
		public function weddingInviteGuest(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "wedding", ["wii", _arg1], "str", 1);
        }

        public function replyToPVPInvite(_arg1:Object):void{
            if (_arg1.accept){
                this.sendPVPInviteAccept();
            }
            else {
                this.sendPVPInviteDecline();
            };
        }

        public function sendPVPInviteAccept():void{
            this.rootClass.sfc.sendXtMessage("zm", "PVPIr", ["1"], "str", this.rootClass.world.curRoom);
        }

        public function sendPVPInviteDecline():void{
            this.rootClass.sfc.sendXtMessage("zm", "PVPIr", ["0"], "str", this.rootClass.world.curRoom);
        }

        public function sendDuelInvite(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "duel", [_arg1], "str", 1);
        }

        public function doDuelAccept(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "da", [_arg1.unm], "str", 1);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "dd", [_arg1.unm], "str", 1);
            };
        }

        public function getWarzoneByName(_arg1:String){
            var _local2:int;
            _local2 = 0;
            while (_local2 < this.PVPMaps.length) {
                if (this.PVPMaps[_local2].nam == _arg1){
                    return (this.PVPMaps[_local2]);
                };
                _local2++;
            };
            return (null);
        }

        public function getWarzoneByWarzoneName(_arg1:String){
            var _local2:int;
            _local2 = 0;
            while (_local2 < this.PVPMaps.length) {
                if (this.PVPMaps[_local2].warzone == _arg1){
                    return (this.PVPMaps[_local2]);
                };
                _local2++;
            };
            return (null);
        }

        public function setPVPFactionData(_arg1:Array):void{
            if (_arg1 != null){
                this.PVPFactions = _arg1;
            }
            else {
                this.PVPFactions = [];
            };
        }

        public function attachMovieFront(_arg1):MovieClip{
            var _local2:MovieClip;
            var _local3:Class;
            var _local4:*;
            var _local5:*;
            _local3 = (this.ldr_map.contentLoaderInfo.applicationDomain.getDefinition(_arg1) as Class);
            _local4 = true;
            if (this.FG.numChildren){
                _local2 = MovieClip(this.FG.getChildAt(0));
                _local5 = (_local2.constructor as Class);
                if (_local5 == _local3){
                    _local4 = false;
                };
            };
            if (_local4){
                this.removeMovieFront();
                _local2 = MovieClip(this.FG.addChild(new (_local3)()));
                this.FG.mouseChildren = true;
            };
            return (_local2);
        }
		
		public function attachIntroMovie(_arg1):MovieClip
        {
            var _local2:MovieClip;
            var _local3:Class;
            var _local4:Boolean;
            var _local5:*;
            _local3 = (this.ldr_map.contentLoaderInfo.applicationDomain.getDefinition(_arg1) as Class);
            _local4 = true;
            if (this.rootClass.ui.HelpStack2.numChildren){
                _local2 = MovieClip(this.rootClass.ui.HelpStack2.getChildAt(0));
                _local5 = (_local2.constructor as Class);
                if (_local5 == _local3){
                    _local4 = false;
                };
            };
            if (_local4){
                this.removeIntroMovie();
                this.rootClass.ui.HelpStack2.addChild(new (_local3)());
            };
        }
		
		public function removeIntroMovie()
        {
            var _local1:int;
            _local1 = 0;
            while ((((this.rootClass.ui.HelpStack2.numChildren > 0)) && ((_local1 < 100)))) {
                _local1++;
                this.rootClass.ui.HelpStack2.removeChildAt(0);
            };
        }
		
		public function attachHelpMovie(_arg1):MovieClip
        {
            var _local2:MovieClip;
            var _local3:Class;
            var _local4:Boolean;
            var _local5:*;
            _local3 = (this.ldr_map.contentLoaderInfo.applicationDomain.getDefinition(_arg1) as Class);
            _local4 = true;
            if (this.rootClass.ui.HelpStack.numChildren){
                _local2 = MovieClip(this.rootClass.ui.HelpStack.getChildAt(0));
                _local5 = (_local2.constructor as Class);
                if (_local5 == _local3){
                    _local4 = false;
                };
            };
            if (_local4){
                this.removeHelpMovie();
                this.rootClass.ui.HelpStack.addChild(new (_local3)());
            };
        }
		
		public function removeHelpMovie()
        {
            var _local1:int;
            _local1 = 0;
            while ((((this.rootClass.ui.HelpStack.numChildren > 0)) && ((_local1 < 100)))) {
                _local1++;
                this.rootClass.ui.HelpStack.removeChildAt(0);
            };
        }

        public function removeMovieFront(){
            var _local1:int;
            _local1 = 0;
            while ((((this.FG.numChildren > 0)) && ((_local1 < 100)))) {
                _local1++;
                this.FG.removeChildAt(0);
            };
            this.rootClass.ldrMC.closeHistory();
            this.rootClass.stage.focus = null;
        }

        public function getMovieFront(){
            if ((((this.FG.numChildren > 0)) && (!((this.FG.getChildAt(0) == null))))){
                return (this.FG.getChildAt(0));
            };
            return (null);
        }

        public function isMovieFront(_arg1:String):Boolean{
            var _local2:MovieClip;
            var _local3:Class;
            var _local4:*;
            var _local5:*;
            _local3 = (this.ldr_map.contentLoaderInfo.applicationDomain.getDefinition(_arg1) as Class);
            _local4 = false;
            if (this.FG.numChildren){
                _local2 = MovieClip(this.FG.getChildAt(0));
                _local5 = (_local2.constructor as Class);
                if (_local5 == _local3){
                    _local4 = true;
                };
            };
            return (_local4);
        }

        public function loadMovieFront(_arg1:String, _arg2:String="Game Files"):void{
            this.removeMovieFront();
            this.rootClass.ldrMC.loadFile(this.FG, (this.rootClass.sFilePath + _arg1), _arg2);
        }
		
		/** TRADE **/
		
		
		public function replyToTradeInvite(_arg1:Object):void{
            if (_arg1.accept){
                this.sendTradeInviteAccept();
            }
            else {
                this.sendTradeInviteDecline();
            };
        }

        public function sendTradeInviteAccept():void{
            this.rootClass.sfc.sendXtMessage("zm", "ti", ["1"], "str", this.rootClass.world.curRoom);
        }

        public function sendTradeInviteDecline():void{
            this.rootClass.sfc.sendXtMessage("zm", "ti", ["0"], "str", this.rootClass.world.curRoom);
        }

        public function sendTradeInvite(_arg1:String):void{
            this.rootClass.sfc.sendXtMessage("zm", "ti", [_arg1], "str", 1);
        }
		
        public function doTradeAccept(_arg1:Object):void{
            if (_arg1.accept){
                this.rootClass.sfc.sendXtMessage("zm", "tia", [_arg1.unm], "str", 1);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "tid", [_arg1.unm], "str", 1);
            };
		}
		
		public function sendLoadOfferRequest(_arg1:Array=null):void{
            var _local2:String;
            if (_arg1[0] == "*"){
                _arg1 = ["All"];
            };
            for each (_local2 in _arg1) {
                this.tradeinfo.hasRequested[_local2] = true;
            };
            this.rootClass.sfc.sendXtMessage("zm", "loadOffer", _arg1, "str", this.curRoom);
        
		}
		
		public function sendLoadAuctionRequest(_arg1:Array=null):void{
            var _local2:String;
            if (_arg1[0] == "*"){
                _arg1 = ["All"];
            };
            for each (_local2 in _arg1) {
                this.auctioninfo.hasRequested[_local2] = true;
            };
            this.rootClass.sfc.sendXtMessage("zm", "loadAuction", _arg1, "str", this.curRoom);
		}

		public function sendLoadRetrieveRequest(_arg1:Array=null):void{
            var _local2:String;
            if (_arg1[0] == "*"){
                _arg1 = ["All"];
            };
            for each (_local2 in _arg1) {
                this.retrieveinfo.hasRequested[_local2] = true;
            };
            this.rootClass.sfc.sendXtMessage("zm", "loadRetrieve", _arg1, "str", this.curRoom);
		}
		
        public function sendTradeFromInvRequest(_arg1:Object){
            var _local2:ModalMC;
            var _local3:Object;
            if (_arg1.bEquip == 1){
                _local2 = new ModalMC();
                _local3 = {};
                _local3.strBody = "You must unequip the item before offering it!";
                _local3.params = {};
                _local3.glow = "red,medium";
                _local3.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(_local2);
                _local2.init(_local3);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "tradeFromInv", [_arg1.ItemID, _arg1.CharItemID, _arg1.TradeID, _arg1.Quantity], "str", this.curRoom);
            };
        }

        public function sendTradeToInvRequest(_arg1:Object){
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "tradeToInv", [_arg1.ItemID, _arg1.CharItemID, _arg1.TradeID], "str", this.curRoom);
        }
		
		public function sendVendingToInventoryDiamond(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "diamondFromVending", [_arg1], "str", this.curRoom);
        }
		
		public function sendVendingToInventoryGold(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "goldFromVending", [_arg1], "str", this.curRoom);
        }
		
		public function sendVendingToInventorySilver(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "silverFromVending", [_arg1], "str", this.curRoom);
        }

		
		public function sendVendingToInventoryCopper(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "copperFromVending", [_arg1], "str", this.curRoom);
        }
		
		public function sendBankToInventoryDiamond(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "diamondToInventory", [_arg1], "str", this.curRoom);
        }
		
		public function sendBankToInventoryGold(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "goldToInventory", [_arg1], "str", this.curRoom);
        }
		
		public function sendBankToInventorySilver(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "silverToInventory", [_arg1], "str", this.curRoom);
        }

		
		public function sendBankToInventoryCopper(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "copperToInventory", [_arg1], "str", this.curRoom);
        }
		
		public function sendInventoryToBankDiamond(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "diamondFromInventory", [_arg1], "str", this.curRoom);
        }
		
		public function sendInventoryToBankGold(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "goldFromInventory", [_arg1], "str", this.curRoom);
        }
		
		public function sendInventoryToBankSilver(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "silverFromInventory", [_arg1], "str", this.curRoom);
        }

		
		public function sendInventoryToBankCopper(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "copperFromInventory", [_arg1], "str", this.curRoom);
        }
		
		public function sendConvertToSilverRequest(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "convertToSilver", [_arg1], "str", this.curRoom);
        }
		
		
		public function sendConvertToGoldRequest(_arg1:Number)
        {
            var _local2:*;
            var _local3:*;
            this.rootClass.sfc.sendXtMessage("zm", "convertToGold", [_arg1], "str", this.curRoom);
        }
		
		public function sendConfirmBankPin(_arg1:String)
        {
			this.rootClass.sfc.sendXtMessage("zm", "bpc", [_arg1], "str", this.curRoom);
        }

        public function sendTradeSwapInvRequest(_arg1:Object, _arg2:Object){
            var _local3:ModalMC;
            var _local4:Object;
            if (_arg2.bEquip == 1){
                _local3 = new ModalMC();
                _local4 = {};
                _local4.strBody = "You must unequip the item before offering it!";
                _local4.params = {};
                _local4.glow = "red,medium";
                _local4.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(_local3);
                _local3.init(_local4);
            }
            else {
                this.rootClass.sfc.sendXtMessage("zm", "tradeSwapInv", [_arg2.ItemID, _arg2.CharItemID, _arg1.ItemID, _arg1.CharItemID, _arg1.TradeID], "str", this.curRoom);
            };
		}
		/** END **/

        public function showPreL(){
            if ((((this.preLMC == null)) || (!(MovieClip(this).contains(this.preLMC))))){
                this.preLMC = new PreL();
                addChild(this.preLMC);
                this.preLMC.x = ((1260 / 2) - (this.preLMC.width / 2));
                this.preLMC.y = ((550 / 2) - (this.preLMC.height / 2));
            };
        }

        public function toggleFPS():void{
            this.rootClass.ui.mcFPS.visible = !(this.rootClass.ui.mcFPS.visible);
        }

		public function toggleModPanel():void{
            this.rootClass.ui.mcInterface.mcMenu.btnModPanel.visible = !(this.rootClass.ui.mcInterface.mcMenu.btnModPanel.visible);
        }
		
		public function toggleModPanelasCharkey():void{
            this.rootClass.ui.mcPopup.fOpen("ModPanel");
        }
		
		public function toggleStatUp():void{
            this.rootClass.ui.mcSkillUp.visible = !(this.rootClass.ui.mcSkillUp.visible);
			this.rootClass.ui.mcSkillUp.gotoAndPlay("In");
        }

        private function calculateFPS():void{
            var _local1:Number;
            var _local2:int;
            var _local3:int;
            var _local4:*;
            var _local5:Number;
            var _local6:int;
            var _local7:Number;
            var _local8:int;
            try {
                if (this.fpsTS != 0){
                    _local1 = new Date().getTime();
                    _local2 = (_local1 - this.fpsTS);
                    _local3 = 0;
                    if (this.ticklist.length == this.TICK_MAX){
                        _local3 = this.ticklist.shift();
                    };
                    this.ticklist.push(_local2);
                    this.ticksum = ((this.ticksum + _local2) - _local3);
                    _local4 = (1000 / (this.ticksum / this.ticklist.length));
                    if (this.rootClass.ui.mcFPS.visible){
                        this.rootClass.ui.mcFPS.txtFPS.text = _local4.toPrecision(4);
                    };
                    if ((((((this.rootClass.userPreference.data.quality == "AUTO")) && ((this.ticklist.length == this.TICK_MAX)))) && (((++this.fpsQualityCounter % 24) == 0)))){
                        this.fpsArrayQuality.push(_local4);
                        if (this.fpsArrayQuality.length == 5){
                            _local5 = 0;
                            _local6 = 0;
                            while (_local6 < this.fpsArrayQuality.length) {
                                _local5 = (_local5 + this.fpsArrayQuality[_local6]);
                                _local6++;
                            };
                            _local7 = (_local5 / this.fpsArrayQuality.length);
                            _local8 = this.arrQuality.indexOf(this.rootClass.stage.quality);
                            if ((((_local7 < 12)) && ((_local8 > 0)))){
                                this.rootClass.stage.quality = this.arrQuality[(_local8 - 1)];
                            };
                            if ((((_local7 >= 12)) && ((_local8 < 2)))){
                                this.rootClass.stage.quality = this.arrQuality[(_local8 + 1)];
                            };
                            this.fpsArrayQuality = new Array();
                        };
                    };
                };
                this.fpsTS = new Date().getTime();
            }
            catch(e) {
            };
        }

        public function onZmanagerEnterFrame(_arg1:Event){
            var _local2:MovieClip;
            var _local3:int;
            var _local4:int;
            var _local5:int;
            var _local6:Number;
            this.calculateFPS();
            this.zSortArr = [];
            _local3 = 0;
            while (_local3 < this.CHARS.numChildren) {
                _local2 = MovieClip(this.CHARS.getChildAt(_local3));
                this.zSortArr.push({
                    mc:_local2,
                    oy:_local2.y
                });
                _local3++;
            };
            this.zSortArr.sortOn("oy", Array.NUMERIC);
            _local4 = 0;
            while (_local4 < this.zSortArr.length) {
                _local2 = this.zSortArr[_local4].mc;
                _local5 = this.CHARS.getChildIndex(_local2);
                if (_local5 != _local4){
                    this.CHARS.swapChildrenAt(_local5, _local4);
                };
                _local4++;
            };
            if (this.EFAO.xpc++ > this.EFAO.xpn){
                this.EFAO.xpc = 0;
                try {
                    if (this.rootClass.stage == null){
                        this.killTimers();
                        this.killListeners();
                        return;
                    };
                    _local6 = new Date().getTime();
					/*
					if (((!((this.rootClass.stage == null))) && (!((this.myAvatar.objData.aura.dur == null))))){
                        if ((this.rootClass.ui.mcStatus.iconStun.boostTS + (this.rootClass.ui.mcStatus.iconStun.aura.dur * 1000)) < (_local6 + 1000)){
                            this.rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["-", "xpboost"], "str", -1);
                        };
                    };
					*/
                    if (((!((this.rootClass.stage == null))) && (!((this.myAvatar.objData.iBoostXP == null))))){
                        if ((this.rootClass.ui.mcPortrait.iconBoostXP.boostTS + (this.rootClass.ui.mcPortrait.iconBoostXP.iBoostXP * 1000)) < (_local6 + 1000)){
                            this.rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["-", "xpboost"], "str", -1);
                        };
                    };
                    if (((!((this.rootClass.stage == null))) && (!((this.myAvatar.objData.iBoostG == null))))){
                        if ((this.rootClass.ui.mcPortrait.iconBoostG.boostTS + (this.rootClass.ui.mcPortrait.iconBoostG.iBoostG * 1000)) < (_local6 + 1000)){
                            this.rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["-", "gboost"], "str", -1);
                        };
                    };
                    if (((!((this.rootClass.stage == null))) && (!((this.myAvatar.objData.iBoostRep == null))))){
                        if ((this.rootClass.ui.mcPortrait.iconBoostRep.boostTS + (this.rootClass.ui.mcPortrait.iconBoostRep.iBoostRep * 1000)) < (_local6 + 1000)){
                            this.rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["-", "repboost"], "str", -1);
                        };
                    };
                    if (((!((this.rootClass.stage == null))) && (!((this.myAvatar.objData.iBoostCP == null))))){
                        if ((this.rootClass.ui.mcPortrait.iconBoostCP.boostTS + (this.rootClass.ui.mcPortrait.iconBoostCP.iBoostCP * 1000)) < (_local6 + 1000)){
                            this.rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["-", "cpboost"], "str", -1);
                        };
                    };
                }
                catch(e:Error) {
                };
            };
        }

        public function iaTrigger(_arg1:MovieClip){
            var _local2:*;
            if (this.coolDown("doIA")){
                _local2 = [];
                _local2.push(_arg1.iaType);
                _local2.push(_arg1.name);
                if (("iaPathMC" in _arg1)){
                    _local2.push(this.myAvatar.dataLeaf.strFrame);
                }
                else {
                    _local2.push(_arg1.iaFrame);
                };
                if (("iaStr" in _arg1)){
                    _local2.push(_arg1.iaStr);
                };
                if (("iaPathMC" in _arg1)){
                    _local2.push(_arg1.iaPathMC);
                };
                this.rootClass.sfc.sendXtMessage("zm", "ia", _local2, "str", 1);
            };
        }

        public function actCastRequest(_arg1:Object):void{
            var _local2:Array;
            var _local3:Array;
            var _local4:Object;
            _local2 = ["castr"];
            _local3 = [];
            switch (_arg1.typ){
                case "sia":
                    if (this.coolDown("doIA")){
                        _local4 = {};
                        _local4.typ = "sia";
                        _local4.callback = this.actCastTrigger;
                        _local4.args = _arg1;
                        _local4.dur = Number(_arg1.sAccessCD);
                        _local4.txt = _arg1.sMsg;
                        this.rootClass.ui.mcCastBar.fOpenWith(_local4);
                        _local3.push(1);
                        _local3.push(_arg1.ID);
                    };
                    break;
            };
            if (_local3.length > 0){
                this.rootClass.sfc.sendXtMessage("zm", _local2, _local3, "str", 1);
            };
        }

        public function actCastTrigger(_arg1:Object):void{
            switch (_arg1.typ){
                case "sia":
                    this.siaTrigger(_arg1);
                    return;
            };
        }

        public function siaTrigger(_arg1:Object):void{
            this.rootClass.sfc.sendXtMessage("zm", ["castt"], [], "str", 1);
        }

        public function uoTreeLeaf(_arg1):Object{
            if (this.uoTree[_arg1.toLowerCase()] == null){
                this.uoTree[_arg1.toLowerCase()] = {};
            };
            return (this.uoTree[_arg1.toLowerCase()]);
        }

        public function myLeaf():Object{
            return (this.uoTreeLeaf(this.rootClass.sfc.myUserName));
        }

        public function uoTreeLeafSet(_arg1, _arg2:Object){
			if (_arg2 == null || _arg1 == null) {
				return;
			}
			
            var _local3:*;
            var _local4:*;
            var _local5:*;
            var _local6:*;
            if (this.uoTree[_arg1.toLowerCase()] == null){
                this.uoTree[_arg1.toLowerCase()] = {};
            };
            _local3 = this.uoTree[_arg1.toLowerCase()];
            _local4 = [];
            for (_local5 in _arg2) {
                _local3[_local5] = _arg2[_local5];
                _local6 = this.getAvatarByUserName(_arg1);
                if (((!((_local6 == null))) && (!((_local6.objData == null))))){
                    _local6.objData[_local5] = _arg2[_local5];
                };
                _local4.push(((_local5 + ":") + String(_arg2[_local5])));
            };
        }

        public function manageAreaUser(_arg1:String, _arg2:String):void{
            var _local3:int;

            _arg1 = _arg1.toLowerCase();
            if (_arg2 == "+"){
                if (this.areaUsers.indexOf(_arg1) == -1){
                    this.areaUsers.push(_arg1);
                };
            }
            else {
                _local3 = this.areaUsers.indexOf(_arg1);
				if (this.areaUsers.indexOf(_arg1) > -1) {
					this.areaUsers.splice(_local3, 1);
				}
            };
            this.rootClass.updateAreaName();
        }

        public function updateAreaUserCount():void{
        }

        public function coolDown(_arg1:String):Boolean{
            var _local2:*;
            var _local3:*;
            var _local4:*;
            var _local5:*;
            _local2 = this.lock[_arg1];
            _local3 = new Date();
            _local4 = _local3.getTime();
            _local5 = (_local4 - _local2.ts);
            if (_local5 < _local2.cd){
                this.rootClass.chatF.pushMsg("warning", "Action taken too quickly, try again in a moment.", "SERVER", "", 0);
                return (false);
            };
            _local2.ts = _local4;
            return (true);
        }

        public function copyAvatarMC(_arg1:MovieClip):void{
            var _local2:AvatarMCCopier;
            _local2 = new AvatarMCCopier(this);
            _local2.copyTo(_arg1);
        }

        public function get Scale():Number{
            return (this.SCALE);
        }
		
		
		public function mapScrollCheck():void
        {
            var p:Point;
            var bounds:Rectangle;
            var cd:int;
            var left:int;
            var right:int;
            var cdy:int;
            var xd:int;
            var xdy:int;
            var bottom:int;
            if (SCROLL){
				//trace("LOCATION: " + myAvatar.pMC.location);
                p = myAvatar.pMC.location;
                bounds = map.walk.getRect(stage);
                cd = (1260 / 2);
                left = 0;
                right = Math.round((1260 - bounds.width));
                if ((((p.x > cd)) && ((p.x < (bounds.width - cd))))){
                    xd = Math.round((cd - (bounds.x + p.x)));
                    if (xd != 0){
                        map.x = (map.x + xd);
                        CHARS.x = (CHARS.x + xd);
                    };
					
                } else {
                    if (p.x < cd){
                        if (map.x != left){
                            map.x = left;
                        };
                        if (CHARS.x != left){
                            CHARS.x = left;
                        };
                    } else {				
                        if (p.x > (bounds.width - cd)){
                            if (map.x != right){
                                map.x = right;
                            };
                            if (CHARS.x != right){
                                CHARS.x = right;
                            };
                        };
                    };
                };
                cdy = ((550 / 2) - 50);
                if ((((p.y > cdy)) && ((p.y < (bounds.height - (550 - cdy)))))){
                    xdy = Math.round((cdy - (bounds.y + p.y)));
                    if (xdy != 0){
                        map.y = (map.y + xdy);
                        CHARS.y = (CHARS.y + xdy);
                    };
                } else {
                    if (p.y < cdy){
                        if (map.y != 0){
                            map.y = 0;
                        };
                        if (CHARS.y != 0){
                            CHARS.y = 0;
                        };
                    } else {
                        if (p.y > (bounds.height - (550 - cdy))){
                            bottom = Math.floor((550 - bounds.height));
                            if (map.y != bottom){
                                map.y = bottom;
                            };
                            if (CHARS.y != bottom){
                                CHARS.y = bottom;
                            };
                        };
                    };
                };
            };
        }
    }
}//package  