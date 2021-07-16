package {
    import flash.display.MovieClip;
    import flash.display.DisplayObject;
	import flash.media.Sound;
	import flash.media.SoundChannel;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import it.gotoandplay.smartfoxserver.SmartFoxClient;
    import flash.net.SharedObject;
    import flash.net.URLLoader;
    import com.wildtangent.WildTangentAPI;
    import flash.net.URLRequest;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import fl.motion.Color;
    import flash.net.navigateToURL;
    //import flash.external.ExternalInterface;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
	import flash.events.ProgressEvent;
    import flash.system.Security;
    import flash.net.URLVariables;
    import flash.net.URLRequestMethod;
    import flash.media.SoundMixer;
    import flash.media.SoundTransform;
    import flash.display.Sprite;
    import flash.filters.ColorMatrixFilter;
    import flash.display.Loader;
    import flash.geom.Point;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import flash.utils.ByteArray;
    import flash.filters.GlowFilter;
    import flash.events.IOErrorEvent;
    import com.adobe.serialization.json.JSON;
    import flash.display.DisplayObjectContainer;
    import flash.geom.Rectangle;
    import flash.display.StageDisplayState;
    import flash.events.FocusEvent;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.utils.getQualifiedClassName;
    import flash.net.URLLoaderDataFormat;
    import flash.text.*;
    import it.gotoandplay.smartfoxserver.*;
    import flash.external.*;
    import com.facebook.graph.*;

    public class Game extends MovieClip {

        public static const ASSETS_LOADED:String = "main_assets_loaded";
        public static const FB_APP_NAME:String = "AQW";
        public static const FB_APP_URL:String = "www.aq.com";
        public static const FB_APP_ID:String = "51356733862";
        public static const FB_APP_SEC:String = "This should never be stored in the client";
        public static var root:DisplayObject;

        public static var serverName:String;
        public static var serverPort:int = 3960;//5588;//3959;
        public static var serverIP:String = "";
        public static var serverURL: String = "http://kuro.test/";
        public static var serverFilePath: String = serverURL + "gamefiles/";
        public static var serverGameLoginURL: String = serverURL + "game/login";

        public static var cLoginZone:String = "zone_master";
        public static var clientToken:String = "N7B5W8W1Y5B1R5VWVZ";
        public static var bPTR:Boolean = false;
        public static var loginInfo:Object = new Object();
        public static var objLogin:Object;
        public static var mcUpgradeWindow:MovieClip;
		public static var mcRefineCalculator:MovieClip;
        public static var mcACWindow:MovieClip;
        public static var ASSETS_READY:Boolean = false;
		
		public var aliasDefault: String = serverURL + "game";
		public var aliasCurrent:String = ExternalInterface.call("window.location.href.toString");
		public var APIKEY:String;

        public const EMAIL_REGEX:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
		public var color:Color = new Color();
		public var LoginTitle:String = null;
		public var LoginBackground:String = null;
		public var LoginMusic:String = null;
		public var LoginBGM:Sound = new Sound();
		public var BGMChannel:SoundChannel = new SoundChannel();
        public var MsgBox:MovieClip;
        public var mcAccount:MovieClip;
        public var mcExtSWF:MovieClip;
		public var mcPetPortrait:MovieClip;
		public var BankCurrency:MovieClip;
		public var Inventory:MovieClip;
        public var ctrlTrade:MovieClip;
        public var tradeItem1:MovieClip;
        public var tradeItem2:MovieClip;
        public var tradeItem3:MovieClip;
		public var SkillAnimOptions:String;
        public var auctionItem1:MovieClip;
		public var SkillSlotMC:String;
		public var showAvatar:String;
        public var auctionItem2:MovieClip;
        public var auctionItem3:MovieClip;
        public var auctionLayout:MovieClip;
        public var auctionPanel:MovieClip;
		public var StageFrame:String = "Characters";
        public var auctionTabs:MovieClip;
		public var vendingLayout:MovieClip;
        public var ui:MovieClip;
		public var redeem:MovieClip;
		public var retrieveClient:String;
		public var skillspanel:MovieClip;
		public var VendingPanelMC:MovieClip;
		public var partypanel:MovieClip;
        public var mcLogin:MovieClip;
		public var TodaysAnnouncement:String;
		public var SignupSWF:String;
        public var sToken:String;
        public var failedServers;
        public var world:World;
        public var bagSpace:String = "interface/bagspace_20140708.swf";
        private var swfObj:String = "AQWGame";
        public var showFB:Boolean = false;
		public var signupToken:String;
		public var signupMasterName:String;
		public var signupID:int;
		public var noCharacters:int = 0;
        public var fbL:fbLinkWindow;
        public var titleDomain:ApplicationDomain;
        public var FBApi:FBListener;
        public var mcO:MovieClip;
		public var objChar:Object;
        private var rn:RandomNumber;
        public var elmType:String;
        public var assetsDomain:ApplicationDomain;
        private var assetsContext:LoaderContext;
        public var handleSessionEvent:Function;
        public var mixer:SoundFX;
        public var sfc:SmartFoxClient;
        public var chatF:Chat;
        public var sFilePath:String = "";
        public var params:Object;
		public var CharacterSWF:String;
		// public var EmojiSWF:String;
		public var sUsername:String;
		public var sPassword:String;
        public var userPreference:SharedObject;
        public var uoPref:Object;
        public var loginLoader:URLLoader;
        public var objServerInfo:Object;
        public var sfcSocial:Boolean = false;
        public var ldrMC:LoaderMC;
        public var mcConnDetail:ConnDetailMC;
        public var querystring:Object;
        public var ts_login_server:Number;
        public var ts_login_client:Number;
        public var aaaloop:int = 0;
        public var totalPingTime:Number = 0;
        public var pingCount:int = 0;
        public var arrRanks:Array;
        public var iRankMax:int = 10;
        public var arrHP:Array;
        private var aswc:Apop;
        public var intLevelCap:int;
        public var PCstBase:int;
        public var PCstRatio:Number;
        public var PCstGoal:int;
        public var GstBase:int;
        public var GstRatio:Number;
        public var GstGoal:int;
        public var PChpBase1:int;
        public var PChpBase100:int;
        public var PChpGoal1:int;
        public var PChpGoal100:int;
        public var PChpDelta:int;
        public var intHPperEND:int;
        public var intAPtoDPS:int;
        public var intSPtoDPS:int;
        public var bigNumberBase:int;
        public var resistRating:Number;
        public var modRating:Number;
        public var baseDodge:Number;
        public var baseBlock:Number;
        public var baseParry:Number;
        public var baseCrit:Number;
        public var baseHit:Number;
        public var baseHaste:Number;
        public var baseMiss:Number;
        public var baseResist:Number;
        public var baseCritValue:Number;
        public var baseBlockValue:Number;
        public var baseResistValue:Number;
        public var baseEventValue:Number;
        public var PCDPSMod:Number = 0.85;
        public var curveExponent:Number = 0.66;
        public var statsExponent:Number = 1.33;
        public var stats:Array;
        public var orderedStats:Array;
        public var ratiosBySlot:Object;
        public var I0pct:Number = 0.8;
        public var I2pct:Number = 1.25;
        public var classCatMap:Object;
        private var travelMapData:Object;
        public var serialCmdMode:Boolean = false;
        public var serialCmd:Object;
        private var conn;
        public var sfcA:Array;
        public var bits:Array;
        private var fbc:MovieClip;
        public var mcGameMenu:MovieClip;
		public var mcCharSWF:MovieClip;
		public var Skeleton:MovieClip;
        public var firstMenu:Boolean = true;
        public var bPassword:Boolean = true;
        private var weakPass:Array;
        public var isWTPromoAvailable:Boolean = false;
        private var wtResponseObject:Object;
        private var wt_promoName:String = "GloBrushPromo";
        private var wt_promoID:int = 1;
        private var wt_sandbox:Boolean = false;
        private var wt:WildTangentAPI;
        private var wtUrlRequest:URLRequest;
        private var wtUrlLoader:URLLoader;
        private var wtRedeemObject:Object;
		public var ldr:Loader;
		public var strSkinLinkage:String;

        {
            MovieClip.prototype.removeAllChildren = function ():void{
                var _local1:* = (this.numChildren - 1);
                while (_local1 >= 0) {
                    this.removeChildAt(_local1);
                    _local1--;
                };
            };
        }

        public function Game(){
            var onMultiConnectionLostHandler:Function;
            var onMultiLogoutHandler:Function;
            var onExtensionResponseHandler:Function;
            var multiO:Object;
            var sfcMulti:SmartFoxClient;
            var sfcO:Object;
            var sfci:int;
            failedServers = {};
            FBApi = new FBListener((this as MovieClip));
            rn = new RandomNumber();
            assetsDomain = new ApplicationDomain();
            assetsContext = new LoaderContext(false, assetsDomain);
            mixer = new SoundFX(assetsDomain);
            params = {};
            uoPref = {};
            loginLoader = new URLLoader();
            ldrMC = new LoaderMC(MovieClip(this));
            querystring = {};
            arrRanks = [0];
            arrHP = [];
            stats = ["STR", "END", "DEX", "INT", "WIS", "LCK"];
            orderedStats = ["STR", "INT", "DEX", "WIS", "END", "LCK"];
            ratiosBySlot = {
                he:0.25,
                ar:0.25,
                ba:0.2,
                Weapon:0.33
            };
            classCatMap = {
                M1:{},
                M2:{},
                M3:{},
                M4:{},
                C1:{},
                C2:{},
                C3:{},
                S1:{}
            };
            serialCmd = {
                cmd:"",
                si:0,
                servers:[],
                callBack:serialCmdDone,
                active:false
            };
            sfcA = [{
                sIP:"74.53.22.41",
                sLogin:"aqwserial01",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.22.42",
                sLogin:"aqwserial02",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.22.43",
                sLogin:"aqwserial03",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.22.44",
                sLogin:"aqwserial04",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.22.45",
                sLogin:"aqwserial05",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.7.196",
                sLogin:"aqwserial06",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.7.197",
                sLogin:"aqwserial07",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.7.198",
                sLogin:"aqwserial08",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.7.199",
                sLogin:"aqwserial09",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.7.200",
                sLogin:"aqwserial10",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.7.201",
                sLogin:"aqwserial11",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.7.202",
                sLogin:"aqwserial12",
                sPass:"",
                sfc:null
            }, {
                sIP:"74.53.7.203",
                sLogin:"aqwserial13",
                sPass:"",
                sfc:null
            }];
            bits = [1, 2, 4, 8, 16, 32, 64, 128, 0x0100, 0x0200, 0x0400, 0x0800, 0x1000, 0x2000, 0x4000, 0x8000, 65536, 131072, 262144, 524288, 0x100000, 0x200000, 0x400000, 0x800000, 16777216, 33554432, 67108864, 134217728, 0x10000000, 0x20000000, 0x40000000, 0x80000000];
            weakPass = new Array("0", "1111", "11111", "111111", "11111111", "112233", "1212", "121212", "123123", "1234", "12345", "123456", "1234567", "12345678", "1313", "131313", "2000", "2112", "2222", "232323", "3333", "4128", "4321", "4444", "5150", "5555", "654321", "6666", "666666", "6969", "696969", "7777", "777777", "7777777", "8675309", "987654", "aaaa", "aaaaaa", "abc123", "abgrtyu", "access", "access14", "action", "albert", "alex", "alexis", "amanda", "amateur", "andrea", "andrew", "angel", "angela", "angels", "animal", "anthony", "apollo", "apple", "apples", "arsenal", "arthur", "asdf", "asdfgh", "ashley", "asshole", "august", "austin", "baby", "badboy", "bailey", "banana", "barney", "baseball", "batman", "beach", "bear", "beaver", "beavis", "beer", "bigcock", "bigdaddy", "bigdick", "bigdog", "bigtits", "bill", "billy", "birdie", "bitch", "bitches", "biteme", "black", "blazer", "blonde", "blondes", "blowjob", "blowme", "blue", "bond007", "bonnie", "booboo", "boobs", "booger", "boomer", "booty", "boston", "brandon", "brandy", "braves", "brazil", "brian", "bronco", "broncos", "bubba", "buddy", "bulldog", "buster", "butter", "butthead", "calvin", "camaro", "cameron", "canada", "captain", "carlos", "carter", "casper", "charles", "charlie", "cheese", "chelsea", "chester", "chevy", "chicago", "chicken", "chris", "cocacola", "cock", "coffee", "college", "compaq", "computer", "cookie", "cool", "cooper", "corvette", "cowboy", "cowboys", "cream", "crystal", "cumming", "cumshot", "cunt", "dakota", "dallas", "daniel", "danielle", "dave", "david", "debbie", "dennis", "diablo", "diamond", "dick", "dirty", "doctor", "doggie", "dolphin", "dolphins", "donald", "dragon", "dreams", "driver", "eagle", "eagle1", "eagles", "edward", "einstein", "enjoy", "enter", "eric", "erotic", "extreme", "falcon", "fender", "ferrari", "fire", "firebird", "fish", "fishing", "florida", "flower", "flyers", "football", "ford", "forever", "frank", "fred", "freddy", "freedom", "fuck", "fucked", "fucker", "fucking", "fuckme", "fuckyou", "gandalf", "gateway", "gators", "gemini", "george", "giants", "ginger", "girl", "girls", "golden", "golf", "golfer", "gordon", "great", "green", "gregory", "guitar", "gunner", "hammer", "hannah", "happy", "hardcore", "harley", "heather", "hello", "helpme", "hentai", "hockey", "hooters", "horney", "horny", "hotdog", "house", "hunter", "hunting", "iceman", "iloveyou", "internet", "iwantu", "jack", "jackie", "jackson", "jaguar", "jake", "james", "japan", "jasmine", "jason", "jasper", "jennifer", "jeremy", "jessica", "john", "johnny", "johnson", "jordan", "joseph", "joshua", "juice", "junior", "justin", "kelly", "kevin", "killer", "king", "kitty", "knight", "ladies", "lakers", "lauren", "leather", "legend", "letmein", "little", "london", "love", "lover", "lovers", "lucky", "maddog", "madison", "maggie", "magic", "magnum", "marine", "mark", "marlboro", "martin", "marvin", "master", "matrix", "matt", "matthew", "maverick", "maxwell", "melissa", "member", "mercedes", "merlin", "michael", "michelle", "mickey", "midnight", "mike", "miller", "mine", "mistress", "money", "monica", "monkey", "monster", "morgan", "mother", "mountain", "movie", "muffin", "murphy", "music", "mustang", "naked", "nascar", "nathan", "naughty", "ncc1701", "newyork", "nicholas", "nicole", "nipple", "nipples", "oliver", "orange", "ou812", "packers", "panther", "panties", "paris", "parker", "pass", "password", "patrick", "paul", "peaches", "peanut", "penis", "pepper", "peter", "phantom", "phoenix", "player", "please", "pookie", "porn", "porno", "porsche", "power", "prince", "princess", "private", "purple", "pussies", "pussy", "qazwsx", "qwert", "qwerty", "qwertyui", "rabbit", "rachel", "pokemon", "racing", "raiders", "rainbow", "ranger", "rangers", "rebecca", "redskins", "redsox", "redwings", "richard", "robert", "rock", "rocket", "rosebud", "runner", "rush2112", "russia", "samantha", "sammy", "samson", "sandra", "saturn", "scooby", "scooter", "scorpio", "scorpion", "scott", "secret", "sexsex", "sexy", "shadow", "shannon", "shaved", "shit", "sierra", "silver", "skippy", "slayer", "slut", "smith", "smokey", "snoopy", "soccer", "sophie", "spanky", "sparky", "spider", "squirt", "srinivas", "star", "stars", "startrek", "starwars", "steelers", "steve", "steven", "sticky", "stupid", "success", "suckit", "summer", "sunshine", "super", "superman", "surfer", "swimming", "sydney", "taylor", "teens", "tennis", "teresa", "test", "tester", "testing", "theman", "thomas", "thunder", "thx1138", "tiffany", "tiger", "tigers", "tigger", "time", "tits", "tomcat", "topgun", "toyota", "travis", "trouble", "trustno1", "tucker", "turtle", "united", "vagina", "victor", "victoria", "video", "viking", "viper", "voodoo", "voyager", "walter", "warrior", "welcome", "whatever", "white", "william", "willie", "wilson", "winner", "winston", "winter", "wizard", "wolf", "women", "xavier", "xxxx", "xxxxx", "xxxxxx", "xxxxxxxx", "yamaha", "yankee", "yankees", "yellow", "young", "zxcvbn", "zxcvbnm", "zzzzzz", "artix", "aqworlds", "adventure", "mechquest", "dragonfable", "123456789", "1234567890", "987654321", "0123456789", "12345678910", "qwertyuiop", "123123123", "asdfghjkl", "123321", "0987654321", "147258369", "789456123", "159753", "741852963", "minecraft", "147852369", "0123456", "qwerty123", "123654789", "naruto", "9876543210", "12341234", "123qwe", "159357", "123654", "gabriel", "123456789a");
            wtResponseObject = {};
            wtRedeemObject = {};
            super();
			//CHARACTER LOGIN
            var onConnectionHandler:Function = function (_arg1:SFSEvent){
                if (_arg1.params.success){
                    sfc.login(cLoginZone, ((clientToken + "~") + loginInfo.strCharacter), loginInfo.strToken);
                    if (world != null){
                        world.uiLock = true;
                    };
                } else {
                    trace("failed >> 1");
					mcConnDetail.showDisconnect("The server is offline.");
                    if (serialCmdMode){
                        serialCmdNext();
                    };
                };
            };
            var onConnectionLostHandler:Function = function (_arg1:SFSEvent){
                if (!serialCmdMode){
                    if (world != null){
                        world.exitCombat();
                        world.setTarget(null);
                        world.killTimers();
                    };
                    if (sfc.isConnected){
                        sfc.disconnect();
                    };
                    gotoAndPlay("Login");
					SoundMixer.stopAll();
					loadTitle();
					loadBGM();
                    if (_arg1.params != null){
                        if (_arg1.params.disconnect == true){
                            mcConnDetail.showDisconnect("Communication with server has been lost. Please check your internet connection and try again.");
                        };
                    };
                };
            };
            var onLoginHandler:Function = function (_arg1:SFSEvent){
            };
            var onLogoutHandler:Function = function (_arg1:SFSEvent){
                if (!serialCmdMode){
                    if (world != null){
                        world.exitCombat();
                        world.setTarget(null);
                        world.killTimers();
                        world.clearLoaders(true);
                    };
                    if (sfc.isConnected){
                        sfc.disconnect();
                    };
                    gotoAndPlay("Login");
					SoundMixer.stopAll();
					loadTitle();
					loadBGM();
                }
                else {
                    if (sfc.isConnected){
                        sfc.disconnect();
                    };
                    serialCmdNext();
                };
            };
            var onMultiConnectionHandler:Function = function (_arg1:SFSEvent){
                if (_arg1.params.success){
                    this.sfc.login(cLoginZone, ((clientToken + "~") + loginInfo.strCharacter), loginInfo.strToken);
                }
                else {
                    trace("failed >> 2");
                };
            };
            onMultiConnectionLostHandler = function (_arg1:SFSEvent){
                trace("");
                trace("** A MULTI CONNECTION WAS LOST");
                trace("");
            };
            onMultiLogoutHandler = function (_arg1:SFSEvent){
                trace("");
                trace("** A MULTI CONNECTION WAS LOGGED OUT");
                trace("");
            };
            var onMultiLoginHandler:Function = function (_arg1:SFSEvent){
            };
			var onSpawnToRoomHandler:Function = function (_arg1:SFSEvent){
            };
            var onJoinRoomHandler:Function = function (_arg1:SFSEvent){
            };
            var onUserEnterRoomHandler:Function = function (_arg1:SFSEvent){
            };
            var onUserLeaveRoomHandler:Function = function (_arg1:SFSEvent){
            };
            var onUserVariablesUpdateHandler:Function = function (_arg1:SFSEvent){
            };
            var onRoomListUpdateHandler:Function = function (_arg1:SFSEvent){
            };
            var onRoomVariablesUpdateHandler:Function = function (_arg1:SFSEvent){
            };
            var onRoomAddedHandler:Function = function (_arg1:SFSEvent){
            };
            var onPublicMessageHandler:Function = function (_arg1:SFSEvent){
            };
            var onPrivateMessageHandler:Function = function (_arg1:SFSEvent){
            };
            var onModeratorMessage:Function = function (_arg1:SFSEvent){
                var _local2:* = _arg1.params.message;
                var _local3:* = _arg1.params.sender;
            };
            var onObjectReceivedHandler:Function = function (_arg1:SFSEvent){
                var _local2:*;
                var _local3:*;
                var _local4:MovieClip;
                var _local5:*;
                var _local6:*;
                trace("OBJ HANDLER");
                if (sfcSocial){
                    _local2 = _arg1.params.sender;
                    _local3 = _arg1.params.obj;
                    switch (_local3.typ){
                        case "flourish":
                            if (world.CHARS.getChildByName(_local3.oName) != null){
                                MovieClip(world.CHARS.getChildByName(_local3.oName)).userName = _local2.getName();
                                MovieClip(world.CHARS.getChildByName(_local3.oName)).gotoAndPlay(_local3.oFrame);
                            };
                            return;
                        case "danceRequest":
                            if (_local3.cell == world.strFrame){
                                _local5 = new ModalMC();
                                _local6 = {};
                                _local6.strBody = "Would you care to dance?";
                                _local6.params = {};
                                _local6.params.emote1 = "/dance";
                                _local6.params.sender = _local2;
                                _local6.callback = world.danceRequest;
                                ui.ModalStack.addChild(_local5);
                                _local5.init(_local6);
                            };
                            return;
                        case "danceDenied":
                            if (_local3.cell == world.strFrame){
                                chatF.submitMsg("/cry", "emotea", sfc.myUserName);
                            };
                            return;
                    };
                };
            };
            var onRoundTripResponseHandler:Function = function (_arg1:SFSEvent):void{
                var _local2:int = _arg1.params.elapsed;
                totalPingTime = (totalPingTime + (_local2 / 2));
                pingCount++;
                var _local3:int = Math.round((totalPingTime / pingCount));
                trace((("Average lag: " + _local3) + " milliseconds"));
            };
            onExtensionResponseHandler = function (_arg1:SFSEvent){
                var resObj:* = undefined;
                var protocol:* = undefined;
                var i:int;
                var s:String;
				var music:String;
                var j:int;
                var o:Object;
                var a:Array;
                var b:Array;
                var mc:MovieClip;
                var tuo:* = undefined;
                var typ:String;
                var nam:String;
                var val:* = undefined;
                var msg:String;
                var msgT:String;
                var snd:String;
                var rcp:String;
                var org:* = undefined;
                var cmd:String;
                var anims:Array;
                var animIndex:uint;
                var monAvt:Avatar;
                var avtAvt:Avatar;
                var Mon:Avatar;
                var avt:Avatar;
                var pMC:MovieClip;
                var unm:String;
                var uid:int;
                var rmId:int;
                var MonMapID:int;
                var MonID:int;
                var prop:String;
                var uoName:* = undefined;
                var uoLeaf:Object;
                var monLeaf:Object;
                var cLeaf:Object;
                var tLeaf:Object;
                var actObj:Object;
                var cell:String;
                var st:int;
                var sta:String;
                var evt:String;
                var modal:MovieClip;
                var modalO:Object;
                var modalRR:* = undefined;
                var modalORR:Object;
                var silentMute:int;
                var filter:int;
                var updateID:String;
                var updateA:Array;
                var updateN:String;
                var updateO:Object;
                var iSel:Object;
                var eSel:Object;
                var now:Number;
                var newmon:Object;
                var cluster:* = undefined;
                var strMsg:* = undefined;
                var strLabel:* = undefined;
                var str:* = undefined;
                var slots:int;
                var dt:* = undefined;
                var motd:* = undefined;
                var MonMapIDs:* = undefined;
                var id:* = undefined;
                var strMonName:String;
                var rand:int;
                var clMon:* = undefined;
                var tAvt:Avatar;
                var cAvt:Avatar;
                var strF:String;
                var ulo:* = undefined;
                var myLeaf:* = undefined;
                var adShown:Boolean;
                var testDate:Date;
                var dropItem:* = undefined;
                var anim:Object;
                var ai:int;
                var slot:int;
                var supressMupltiples:* = undefined;
                var isYou:* = undefined;
                var sMsg:* = undefined;
                var bi:int;
                var branchA:Object;
                var mID:String;
                var deltaXP:int;
                var xp:* = undefined;
                var xpB:* = undefined;
				var deltaCopper:int;
				var deltaSilver:int;
                var deltaGold:int;
				var copper:* = undefined;
				var silver:* = undefined;
                var gold:* = undefined;
                var deltaCP:int;
                var iRank:* = undefined;
                var txtBonusCP:String;
                var flo:* = undefined;
                var fct:Function;
                var item:* = undefined;
                var dID:* = undefined;
                var dItem:* = undefined;
                var dropitem:* = undefined;
                var ItemID:* = undefined;
                var itemObj:* = undefined;
                var fi:* = undefined;
                var iobj:* = undefined;
                var itemArr:* = undefined;
                var dropindex:* = undefined;
                var dropID:* = undefined;
                var dropQty:int;
                var qi:String;
                var qr:String;
                var qj:String;
                var qk:String;
                var qat:Array;
                var ri:* = undefined;
                var fgWin:* = undefined;
                var m:* = undefined;
                var k:* = undefined;
                var blanki:* = undefined;
                var actBar:* = undefined;
                var delIcon:* = undefined;
                var actIconClass:Class;
                var actIcon:* = undefined;
                var actIconMC:* = undefined;
                var blankMC:* = undefined;
                var c:Color;
                var stuS:String;
                var hasteCoeff:Number;
                var cd:* = undefined;
                var mcPath:* = undefined;
                var e:SFSEvent = _arg1;
                resObj = e.params.dataObj;
                protocol = e.params.type;
                i = 0;
                s = "";
                j = 0;
                prop = "";
                var updated:Object = {};
                silentMute = 0;
                filter = 0;
                var cInf:String = "";
                var tInf:String = "";
                var cTyp:String = "";
                var cID:int = -1;
                var tTyp:String = "";
                var tID:int = -1;
                var ul:Array = [];
                var dat:Date = new Date();
                now = dat.getTime();
                if (protocol == "str"){
                    cmd = resObj[0];
                    trace(("responseObject STR: " + cmd));
                    switch (cmd){
                        default: 	 	
                            break;
                        case "loginResponse":
                            if ((((resObj[2] == 1)) || ((resObj[2] == "true")))){
                                mcConnDetail.showConn("Loading Character Data...");
                                sfc.myUserId = Number(resObj[3]);
                                sfc.myUserName = String(resObj[4]);
                                ts_login_client = now;
                                dt = stringToDate(resObj[6]);
                                ts_login_server = dt.getTime();
                                trace(date_server);
                                motd = ("Message of The Day: " + String(resObj[5]));
                                chatF.pushMsg("moderator", motd, "SERVER", "", 0);
                                world.initObjInfo(resObj[7]);
								//WT_init();
                                //WT_checkForPromo();
                                if (ASSETS_READY){
                                    loadGameMenu();
									//loadGameAssets();
                                    resumeOnLoginResponse();
                                } else {
                                    loadExternalAssets();
									//loadGameAssets();
                                };
                            }
                            else {
                                if (resObj[5].indexOf("out of date") >= 0){
                                    navigateToURL(new URLRequest("default.asp?id=0624"), "_self");
                                }
                                else {
                                    mcConnDetail.showError(resObj[5]);
                                };
                            };
                            break;
                        case "loginIterator":
                            if ((((resObj[2] == 1)) || ((resObj[2] == "true")))){
                                sfc.myUserId = Number(resObj[3]);
                                sfc.myUserName = String(resObj[4]);
                                chatF.submitMsg(serialCmd.cmd, "serialCmd", sfc.myUserName);
                            }
                            else {
                                mcConnDetail.showError("Login Failed!");
                            };
                            break;
                        case "iterator":
                            sfc.logout();
                            break;
                        case "loginMulti":
                            if (!(((resObj[2] == 1)) || ((resObj[2] == "true")))){
                                mcConnDetail.showError("Login Failed!");
                            };
                            break;
                        case "notify":
                            typ = "server";
                            msg = resObj[2];
                            msg = chatF.cleanChars(msg);
                            msg = chatF.cleanStr(msg);
                            chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            MsgBox.notify(msg);
                            break;
                        case "logoutWarning":
                            userPreference.data.logoutWarning = String(resObj[2]);
                            userPreference.data.logoutWarningDur = Number(resObj[3]);
                            userPreference.data.logoutWarningTS = now;
                            userPreference.flush();
                            break;
                        case "multiLoginWarning":
                            mcConnDetail.showError("Your Miracle account has been logged on from another computer. Please log back in to play. If you cannot login, please contact Miracle Team via our help page:<br/> <u><a href='http://leviathanworlds.fun/contact' target='_blank'>http://leviathanworlds.fun/contact</a></u>");
                            break;
                        case "server":
                            typ = "server";
                            msg = resObj[2];
                            msg = chatF.cleanChars(msg);
                            msg = chatF.cleanStr(msg);
                            chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            break;
                        case "serverf":
                            msg = String(resObj[2]);
                            typ = "server";
                            str = chatF.cleanStr(msg);
                            unm = String(resObj[3]);
                            uid = int(resObj[4]);
                            rmId = int(resObj[5]);
                            msg = chatF.cleanChars(msg);
                            msgT = stripWhite(msg.toLowerCase());
                            if (chatF.strContains(msgT, chatF.illegalStrings)){
                                silentMute = 1;
                            };
                            msgT = stripWhiteStrict(msg.toLowerCase());
                            if (chatF.strContains(msgT, ["email", "password"])){
                                silentMute = 1;
                            };
                            if (!silentMute){
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;
                        /*case "moderator":
                            if (sfcSocial){
                                typ = "moderator";
                                msg = resObj[2];
                                msg = chatF.cleanChars(msg);
                                msg = chatF.cleanStr(msg);
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;
                        case "wheel":
                            if (sfcSocial){
                                typ = "wheel";
                                msg = resObj[2];
                                msg = chatF.cleanChars(msg);
                                msg = chatF.cleanStr(msg);
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;*/
						case "moderator":
                        case "wheel":
						case "administrator":
                            if (sfcSocial){
                                typ = cmd;
                                msg = resObj[2];
                                //msg = chatF.cleanChars(msg);
                                //msg = chatF.cleanStr(msg);
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;
						case "serverevent":
                            if (sfcSocial){
                                typ = cmd;
                                msg = resObj[2];
                                //msg = chatF.cleanChars(msg);
                                //msg = chatF.cleanStr(msg);
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;
						case "race":
                            if (sfcSocial){
                                typ = cmd;
                                msg = resObj[2];
                                //msg = chatF.cleanChars(msg);
                                //msg = chatF.cleanStr(msg);
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;
                        case "gsupdate":
                            try {
                                world.map.killCount(resObj[2]);
                            }
                            catch(e) {
                                trace(e);
                            };
                            break;
                        case "frostupdate":
                            try {
                                world.map.frostWar(resObj[2], resObj[3]);
                            }
                            catch(e) {
                                trace(e);
                            };
                            break;
                        case "warning":
                            typ = "warning";
                            msg = resObj[2];
                            msg = chatF.cleanChars(msg);
                            msg = chatF.cleanStr(msg);
                            chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            break;
                        case "respawnMon":
                            if (sfcSocial){
                                MonMapIDs = resObj[2].split(",");
                                for (id in MonMapIDs) {
                                    Mon = world.getMonster(MonMapIDs[id]);
                                    monLeaf = world.monTree[MonMapIDs[id]];
                                    if (((((!((monLeaf == null))) && (!((Mon.objData == null))))) && ((Mon.objData.strFrame == world.strFrame)))){
                                        monLeaf.targets = {};
                                        strMonName = "";
                                        if (Number(world.objExtra["bMonName"]) == 1){
                                            rand = Math.round((Math.random() * (world.chaosNames.length - 1)));
                                            if (world.chaosNames[rand] == world.myAvatar.objData.strUsername){
                                             /* CHAOS NAME FUNCTIONS
												rand = (((rand)==0) ? rand = (rand + 1);
												rand : rand = (rand - 1);
												rand);
											 */
                                            };
                                            strMonName = world.chaosNames[rand];
                                        };
                                        Mon.pMC.respawn(strMonName);
                                        Mon.pMC.x = Mon.pMC.ox;
                                        Mon.pMC.y = Mon.pMC.oy;
                                        if ((((Mon.objData.bRed == 1)) && ((world.myAvatar.dataLeaf.intState > 0)))){
                                            world.aggroMon(MonMapIDs[id]);
                                        };
                                    };
                                };
                            };
                            break;
                        case "resTimed":
                            if ((((((resObj.length > 2)) && (!((String(resObj[2]) == null))))) && (!((String(resObj[3]) == null))))){
                                world.moveToCell(String(resObj[2]), String(resObj[3]));
                            } else {
                                world.moveToCell(world.spawnPoint.strFrame, world.spawnPoint.strPad);
                            };
                            world.map.transform.colorTransform = world.defaultCT;
                            world.CHARS.transform.colorTransform = world.defaultCT;
                            break;
                        case "exitArea":
                            uid = int(resObj[2]);
                            unm = String(resObj[3]);
                            world.manageAreaUser(String(resObj[3]), "-");
							
                            avt = world.avatars[uid];
                            if (avt != null){
                                if (avt == world.myAvatar.target){
                                    world.setTarget(null);
                                };
                                if (((!((avt.objData == null))) && (world.isPartyMember(avt.objData.strUsername)))){
                                    world.updatePartyFrame({
                                        unm:avt.objData.strUsername,
                                        range:false
                                    });
                                };
                                world.destroyAvatar(uid);         
                            };
							delete world.uoTree[unm.toLowerCase()];
                            delete world.uoTree[unm];
                            break;
                        case "uotls":
                            trace("uotls");
                            o = {};
                            a = resObj[3].split(",");
                            i = 0;
                            while (i < a.length) {
                                o[a[i].split(":")[0]] = a[i].split(":")[1];
                                i = (i + 1);
                            };
                            userTreeWrite(String(resObj[2]).toLowerCase(), o);
                            break;
                        case "mtls":
                            o = {};
                            a = resObj[3].split(",");
                            i = 0;
                            while (i < a.length) {
                                o[a[i].split(":")[0]] = a[i].split(":")[1];
                                i = (i + 1);
                            };
                            monsterTreeWrite(int(resObj[2]), o);
                            break;
                        case "spcs":
                            MonMapID = int(resObj[2]);
                            MonID = int(resObj[3]);
                            monLeaf = world.monTree[MonMapID];
                            newmon = {};
                            i = 0;
                            while (i < world.mondef.length) {
                                if (world.mondef[i].MonID == MonID){
                                    newmon = world.mondef[i];
                                    i = world.mondef.length;
                                };
                                i = (i + 1);
                            };
                            monLeaf.intHP = 0;
                            monLeaf.intMP = 0;
                            monLeaf.intHPMax = newmon.intHPMax;
                            monLeaf.intMPMax = newmon.intMPMax;
                            monLeaf.intState = 0;
                            monLeaf.iLvl = newmon.iLvl;
                            monLeaf.MonID = MonID;
                            cluster = world.getMonsterCluster(MonMapID);
                            i = 0;
                            while (i < cluster.length) {
                                clMon = cluster[i];
                                if (monLeaf.MonID == clMon.objData.MonID){
                                    if (monLeaf.strFrame == world.strFrame){
                                        world.CHARS.addChild(clMon.pMC);
                                    };
                                    clMon.dataLeaf = monLeaf;
                                }
                                else {
                                    if (monLeaf.strFrame == world.strFrame){
                                        world.TRASH.addChild(clMon.pMC);
                                    };
                                    clMon.dataLeaf = null;
                                };
                                i = (i + 1);
                            };
                            break;
                        case "cc":
                            strMsg = chatF.getCCText(resObj[2]);
                            unm = String(resObj[3]);
                            if (chatF.ignoreList.data.users != undefined){
                                if (chatF.ignoreList.data.users.indexOf(unm) > -1){
                                    filter = 1;
                                };
                            };
                            if (filter == 0){
                                chatF.pushMsg("zone", strMsg, unm, "", 0);
                            };
                            break;
                        case "emotea":
                            strLabel = String(resObj[2]);
                            uid = int(resObj[3]);
                            pMC = world.getMCByUserID(uid);
                            if (pMC != null){
                                pMC.mcChar.gotoAndPlay(strToProperCase(strLabel));
                            };
                            break;
						case "emoticon":
                            strLabel = String(resObj[2]);
							unm = String(resObj[3]);
						
							trace("LABEL: " + strLabel);
							trace("USERID: " + unm);
                            pMC = world.getMCByUserName(unm);
							pMC.EmoticonMC.visible = true;
                            if (pMC != null){
                                pMC.EmoticonMC.gotoAndStop(strToProperCase(strLabel));
                            };
                            break;
                        case "em":
                            unm = String(resObj[2]);
                            msg = chatF.cleanStr(String(resObj[3]));
                            while (msg.indexOf("  ") > -1) {
                                msg = msg.split("  ").join(" ");
                            };
                            msg = chatF.cleanChars(msg);
                            msgT = stripWhiteStrict(msg.toLowerCase());
                            if (chatF.strContains(msgT, chatF.illegalStrings)){
                                silentMute = 1;
                            };
                            if (!silentMute){
                                chatF.pushMsg("event", msg, unm, "", 0);
                            };
                            break;
                        case "chatm":
                            str = String(resObj[2]);
                            str = chatF.cleanStr(str, true, false, Boolean(int(resObj[6])));
                            unm = String(resObj[3]);
                            uid = int(resObj[4]);
                            rmId = int(resObj[5]);
                            typ = str.substr(0, str.indexOf("~"));
                            msg = str.substr((str.indexOf("~") + 1));
                            msg = chatF.cleanChars(msg);
                            if (chatF.ignoreList.data.users != undefined){
                                if (chatF.ignoreList.data.users.indexOf(unm.toLowerCase()) > -1){
                                    filter = 1;
                                };
                            };
                            if (!filter){
                                chatF.pushMsg(typ, msg, unm, uid, 0, int(resObj[6]));
                            };
                            break;
                        case "whisper":
                            typ = "whisper";
                            msg = resObj[2];
                            snd = String(resObj[3]);
                            rcp = String(resObj[4]);
                            org = resObj[5];
                            msg = chatF.cleanStr(msg);
                            msg = chatF.cleanChars(msg);
                            silentMute = 0;
                            if (msg.indexOf(":=sm") > -1){
                                msg = msg.substr(0, msg.indexOf(":=sm"));
                                if (unm != sfc.myUserName){
                                    silentMute = 1;
                                };
                            };
                            if (chatF.ignoreList.data.users != undefined){
                                if (chatF.ignoreList.data.users.indexOf(snd.toLowerCase()) > -1){
                                    filter = 1;
                                };
                            };
                            if (((!(filter)) && (((!(silentMute)) || (((silentMute) && ((snd == rcp)))))))){
                                if (snd.toLowerCase() != sfc.myUserName.toLowerCase()){
                                    chatF.pmSourceA = [snd];
                                    if (chatF.pmSourceA.length > 20){
                                        chatF.pmSourceA.splice(0, (chatF.pmSourceA.length - 20));
                                    };
                                };
								var cBox = new chatboxMC();
                                if (org == 1){
							//Spent hours to decode this.. WHISPER TO
                                    //chatF.pushMsg(typ, msg, snd, rcp, 0);
                                    //chatF.pushMsg(typ, msg, snd, rcp, 1);
									//var cBox = new chatboxMC();
									cBox.name = "chat_" + snd;
									cBox.x = 500;
									cBox.y = 300;
									if(ui.chatbox.getChildByName("chat_" + snd)){
										chat = ui.chatbox.getChildByName("chat_" + snd);
										chat.log_txt.text += snd + ": " + msg + "\n";
										return;
									}
									ui.chatbox.addChild(cBox);
									chat = ui.chatbox.getChildByName("chat_" + snd);
									chat.user_txt.text = rcp;
									chat.log_txt.text = "";
									chat.msg_txt.text = "";
									chat.log_txt.text += snd + ": " + msg + "\n";
									mixer.playSound("Coins");
									chat.info.text = "IF YOU SEE THIS PLEASE CONTACT STAFF!";
									//chat.info.text = "ORG = 1; SND = " + snd + "; RCP = " + rcp + "; MC = chat_" + snd;
									if(chat.boxStage == 2){
										chat.outline.gotoAndStop(2);
									}
                                }
                                else {
									//Spent hours to decode this.. WHISPER FROM
                                    //chatF.pushMsg(typ, msg, snd, rcp, org, int(resObj[6]));
									//var cBox = new chatboxMC();
									if(snd.toLowerCase() != sfc.myUserName.toLowerCase()){
										cBox.name = "chat_" + snd;
									} else {
										cBox.name = "chat_" + rcp;
									}
									//cBox.name = "chat_" + snd;
									cBox.x = 500;
									cBox.y = 300;
									if(ui.chatbox.getChildByName("chat_" + snd) || ui.chatbox.getChildByName("chat_" + rcp)){
										if(snd.toLowerCase() != sfc.myUserName.toLowerCase()){
											chat = ui.chatbox.getChildByName("chat_" + snd);
										} else {
											chat = ui.chatbox.getChildByName("chat_" + rcp);
										}
										//chat = ui.chatbox.getChildByName("chat_" + snd);
										chat.gui.log_txt.text += snd + ": " + msg + "\n";
										chat.gui.log_txt.scrollV = chat.gui.log_txt.numLines;
										chat.gotMessage();
										return;
									}
									ui.chatbox.addChild(cBox);
									if(snd.toLowerCase() != sfc.myUserName.toLowerCase()){
											chat = ui.chatbox.getChildByName("chat_" + snd);
										} else {
											chat = ui.chatbox.getChildByName("chat_" + rcp);
										}
									//chat = ui.chatbox.getChildByName("chat_" + snd);
									if(snd.toLowerCase() != sfc.myUserName.toLowerCase()){
										chat.user_txt.text = snd;
									} else {
										chat.user_txt.text = rcp;
									}
									chat.gui.log_txt.text = "";
									chat.gui.msg_txt.text = "";
									chat.gui.log_txt.text += snd + ": " + msg + "\n";
									//chat.info.text = "ORG = 0; SND = " + snd + "; RCP = " + rcp + "; MC = chat_" + snd;
									//chat.info.text = "MC = " + "chat_" + snd;
									chat.info.text = "";
									//chat.gotMessage();
                                };
                            };
                            break;
                        case "mute":
                            chatF.muteMe(int(resObj[2]));
                            break;
                        case "unmute":
                            chatF.unmuteMe();
                            break;
                        case "mvna":
                            if ((((world.uoTree[sfc.myUserName.toLowerCase()].freeze == null)) || (!(world.uoTree[sfc.myUserName.toLowerCase()].freeze)))){
                                world.uoTree[sfc.myUserName.toLowerCase()].freeze = true;
                            };
                            break;
                        case "mvnb":
                            if (world.uoTree[sfc.myUserName.toLowerCase()].freeze != null){
                                delete world.uoTree[sfc.myUserName.toLowerCase()].freeze;
                            };
                            break;
                        case "gtc":
                            if (((!((String(resObj[2]) == null))) && (!((String(resObj[3]) == null))))){
                                world.moveToCell(String(resObj[2]), String(resObj[3]));
                            };
                            break;
                        case "mtcid":
                            if (resObj.length > 2){
                                world.moveToCellByIDb(Number(resObj[2]));
                            };
                            break;
                        case "hi":
                            trace("");
                            trace("****> SFS Ping response, unlocking all actions, canceling logout timer");
                            trace("");
                            world.connMsgOut = false;
                            world.connTestTimer.reset();
                            world.unlockActions();
                            break;
                        case "Dragon Buff":
                            world.map.doDragonBuff();
                            break;
                        case "trap door":
                            world.map.doTrapDoor(resObj[2]);
                            break;
                        case "gMOTD":
                            world.myAvatar.objData.guild.MOTD = resObj[2];
                            break;
                        case "buyGSlots":
                            slots = int(resObj[2]);
                            if (!isNaN(slots)){
                                world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - (slots * 200));
                            };
                            if (ui.mcPopup.currentLabel == "GuildPanel"){
                                ui.mcPopup.updateGuildWindow();
                            };
                            break;
                        case "gRename":
                            world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - 1000);
                            break;
                        case "fbRes":
                            if (resObj[4] != null){
                                typ = "warning";
                                msg = resObj[4];
                                msg = chatF.cleanChars(msg);
                                msg = chatF.cleanStr(msg);
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            FBApi.handleEvent(resObj);
                            break;
                        case "elmSwitch":
                            try {
                                world.map.setupElement(String(resObj[2]));
                            }
                            catch(e) {
                                trace(("error sending element: " + e));
                            };
                    };
                };
                if (protocol == "json"){
                    cmd = resObj.cmd;
                    trace(("responseObject JSON: " + cmd));
                    strF = "";
                    switch (cmd){
                        default:
                            trace("*>> Unhandled CMD <<*");
                            break;
                        case "who":
                            ulo = {};
                            ulo.typ = "userListA";
                            ulo.ul = resObj.users;
                            ui.mcOFrame.fOpenWith(ulo);
                            break;
                        case "al":
                            areaListShow(resObj);
                            break;
                        case "getinfo":
                            for (prop in resObj) {
                                if (prop != "cmd"){
                                    trace(((("USER INFO >  " + prop) + " : ") + resObj[prop]));
                                };
                            };
                            break;
                        case "reloadmap":
                            if (world.strMapName == resObj.sName){
                                world.setMapEvents(null);
                                world.strMapFileName = resObj.sFileName;
								world.strMapBackgroundMusic = resObj.strMapBackgroundMusic;
                                world.reloadCurrentMap();
                            };
                            break;
                        case "moveToArea":
                            if ((((resObj.areaName.indexOf("battleon") > -1)) && ((resObj.areaName.indexOf("battleontown") < 0)))){
                                world.rootClass.openMenu();
                                world.rootClass.firstMenu = false;
                            }
                            else {
                                if (!world.rootClass.firstMenu){
                                    world.rootClass.menuClose();
                                };
                            };
                            world.mapLoadInProgress = true;
                            world.strAreaName = resObj.areaName;
                            world.initObjExtra(resObj.sExtra);
                            world.areaUsers = [];
                            myLeaf = null;
                            world.modID = -1;
                            if (world.uoTreeLeaf(sfc.myUserName) != null){
                                myLeaf = copyObj(world.uoTreeLeaf(sfc.myUserName));
                            };
                            world.uoTree = {};
                            if (myLeaf != null){
                                world.uoTree[sfc.myUserName.toLowerCase()] = myLeaf;
                            };
                            if (resObj.monName != null){
                                world.chaosNames = resObj.monName.split(",");
                            };
                            if (resObj.pvpTeam != null){
                                myLeaf.pvpTeam = resObj.pvpTeam;
								world.myAvatar.pMC.fly = false;
                                world.bPvP = true;
                                ui.mcPortrait.pvpIcon.visible = true;
                                //ui.mcPortrait.partyLead.y = 18;
								ui.mcPortrait.partyLead.y = 68;
                                world.setPVPFactionData(resObj.PVPFactions);
                                if (world.objExtra["bChaos"] == null){
                                    updatePVPScore(resObj.pvpScore);
                                    showPVPScore();
                                };
                            }
                            else {
                                ui.mcPortrait.pvpIcon.visible = false;
                                //ui.mcPortrait.partyLead.y = 0;
								ui.mcPortrait.partyLead.y = 68;
                                delete myLeaf.pvpTeam;
                                world.bPvP = false;
                                hidePVPScore();
								showMenuButton();
                                world.setPVPFactionData(null);
                            };
                            if (resObj.pvpScore != null){
                                updatePVPScore(resObj.pvpScore);
                            };
                            bi = 0;
                            while (bi < resObj.uoBranch.length) {
                                branchA = resObj.uoBranch[bi];
								if (branchA == null) {
									continue;
								}
                                unm = branchA.uoName.toLowerCase();
                                uoLeaf = {};
                                for (s in branchA) {
                                    nam = s;
                                    val = branchA[s];
                                    if ((((((((((nam.toLowerCase().indexOf("int") > -1)) || ((nam.toLowerCase() == "tx")))) || ((nam.toLowerCase() == "ty")))) || ((nam.toLowerCase() == "sp")))) || ((nam.toLowerCase() == "pvpTeam")))){
                                        val = int(val);
                                    };
                                    uoLeaf[nam] = val;
                                };
                                if (unm != sfc.myUserName.toLowerCase()){
                                    uoLeaf.auras = [];
                                };
                                uoLeaf.targets = {};
                                world.uoTreeLeafSet(unm, uoLeaf);
                                world.manageAreaUser(unm, "+");
                                bi = (bi + 1);
                            };
                            world.monTree = {};
                            world.monsters = [];
                            bi = 0;
                            while (bi < resObj.monBranch.length) {
                                branchA = resObj.monBranch[bi];
                                monLeaf = {};
                                mID = "1";
                                for (s in branchA) {
                                    nam = s;
                                    val = branchA[s];
                                    if (nam.toLowerCase().indexOf("monmapid") > -1){
                                        mID = val;
                                    };
                                    if ((((((nam.toLowerCase().indexOf("int") > -1)) || ((nam.toLowerCase().indexOf("monid") > -1)))) || ((nam.toLowerCase().indexOf("monmapid") > -1)))){
                                        val = int(val);
                                    };
                                    monLeaf[nam] = val;
                                };
                                monLeaf.auras = [];
                                monLeaf.targets = {};
                                monLeaf.strBehave = "walk";
                                world.monTree[mID] = monLeaf;
                                bi = (bi + 1);
                            };
                            if (("event" in resObj)){
                                world.setMapEvents(resObj.event);
                            }
                            else {
                                world.setMapEvents(null);
                            };
                            if (("cellMap" in resObj)){
                                world.setCellMap(resObj.cellMap);
                            }
                            else {
                                world.setCellMap(null);
                            };
                            if (world.strFrame != ""){
                                world.exitCell();
                            };
                            world.killLoaders();
                            world.clearMonstersAndProps();
                            world.clearAllAvatars();
                            world.avatars[sfc.myUserId] = world.myAvatar;
                            world.strMapName = resObj.strMapName;
                            world.strMapFileName = resObj.strMapFileName;
							world.strMapBackgroundMusic = resObj.strMapBackgroundMusic;
                            world.intType = resObj.intType;
                            world.intKillCount = resObj.intKillCount;
                            world.objLock = (((resObj.objLock)!=null) ? resObj.objLock : null);
                            world.mondef = resObj.mondef;
                            world.monmap = resObj.monmap;
                            world.curRoom = Number(resObj.areaId);
                            world.actionResultsMon = {};
                            world.actionResults = {};
                            world.mapBoundsMC = null;
                            chatF.chn.zone.rid = world.curRoom;
                            if (("houseData" in resObj)){
                                world.initHouseData(resObj.houseData);
                            }
                            else {
                                world.initHouseData(null);
                            };
                            world.updatePartyFrame();
                            world.clearLoaders();
                            s = resObj.strMapFileName.toLowerCase();
							music = resObj.strMapBackgroundMusic.toLowerCase();
							
							if (("guildData" in resObj)){
                                world.initGuildhallData(resObj.guildData);
                                world.guildHallData.loadGuildMap(s);
                            }
                            else {
                                try {
                                    world.guildHallData.destroyMenu();
                                }
                                catch(e) {
                                };
                                world.loadMap(s, music);
                            };
							
							//world.loadMap(s, music);
							/*
                            try {
                                world.guildHallData.destroyMenu();
                            }
                            catch(e) {
                            };
							*/
                            //world.loadMap(s, music);
							//world.loadBGM(m);
                            elmType = resObj.elmType;
                            break;
						case "spawnToArea":
                            if ((((resObj.areaName.indexOf("battleon") > -1)) && ((resObj.areaName.indexOf("battleontown") < 0)))){
                                world.rootClass.openMenu();
                                world.rootClass.firstMenu = false;
                            }
                            else {
                                if (!world.rootClass.firstMenu){
                                    world.rootClass.menuClose();
                                };
                            };
                            world.mapLoadInProgress = true;
                            world.strAreaName = resObj.areaName;
                            world.initObjExtra(resObj.sExtra);
                            world.areaUsers = [];
							
							if (resObj.pvpScore != null){
                                updatePVPScore(resObj.pvpScore);
                            };
                            myLeaf = null;
                            world.modID = -1;
                            if (world.uoTreeLeaf(sfc.myUserName) != null){
                                myLeaf = copyObj(world.uoTreeLeaf(sfc.myUserName));
                            };
                            world.uoTree = {};
                            if (myLeaf != null){
                                world.uoTree[sfc.myUserName.toLowerCase()] = myLeaf;
                            };
                            if (resObj.monName != null){
                                world.chaosNames = resObj.monName.split(",");
                            };
                            if (resObj.pvpTeam != null){
                                myLeaf.pvpTeam = resObj.pvpTeam;
								world.myAvatar.pMC.fly = false;
                                world.bPvP = true;
                                ui.mcPortrait.pvpIcon.visible = true;
                                //ui.mcPortrait.partyLead.y = 18;
								ui.mcPortrait.partyLead.y = 68;
                                world.setPVPFactionData(resObj.PVPFactions);
                                if (world.objExtra["bChaos"] == null){
                                    updatePVPScore(resObj.pvpScore);
                                    showPVPScore();
                                };
                            }
                            else {
                                ui.mcPortrait.pvpIcon.visible = false;
                                //ui.mcPortrait.partyLead.y = 0;
								ui.mcPortrait.partyLead.y = 68;
                                delete myLeaf.pvpTeam;
                                world.bPvP = false;
                                hidePVPScore();
                                world.setPVPFactionData(null);
                            };
                            if (resObj.pvpScore != null){
                                updatePVPScore(resObj.pvpScore);
                            };
                            bi = 0;
                            while (bi < resObj.uoBranch.length) {
                                branchA = resObj.uoBranch[bi];
								if (branchA == null) {
									continue;
								}
                                unm = branchA.uoName.toLowerCase();
                                uoLeaf = {};
                                for (s in branchA) {
                                    nam = s;
                                    val = branchA[s];
                                    if ((((((((((nam.toLowerCase().indexOf("int") > -1)) || ((nam.toLowerCase() == "tx")))) || ((nam.toLowerCase() == "ty")))) || ((nam.toLowerCase() == "sp")))) || ((nam.toLowerCase() == "pvpTeam")))){
                                        val = int(val);
                                    };
                                    uoLeaf[nam] = val;
                                };
                                if (unm != sfc.myUserName.toLowerCase()){
                                    uoLeaf.auras = [];
                                };
                                uoLeaf.targets = {};
                                world.uoTreeLeafSet(unm, uoLeaf);
                                world.manageAreaUser(unm, "+");
                                bi = (bi + 1);
                            };
                            world.monTree = {};
                            world.monsters = [];
                            bi = 0;
                            while (bi < resObj.monBranch.length) {
                                branchA = resObj.monBranch[bi];
                                monLeaf = {};
                                mID = "1";
                                for (s in branchA) {
                                    nam = s;
                                    val = branchA[s];
                                    if (nam.toLowerCase().indexOf("monmapid") > -1){
                                        mID = val;
                                    };
                                    if ((((((nam.toLowerCase().indexOf("int") > -1)) || ((nam.toLowerCase().indexOf("monid") > -1)))) || ((nam.toLowerCase().indexOf("monmapid") > -1)))){
                                        val = int(val);
                                    };
                                    monLeaf[nam] = val;
                                };
                                monLeaf.auras = [];
                                monLeaf.targets = {};
                                monLeaf.strBehave = "walk";
                                world.monTree[mID] = monLeaf;
                                bi = (bi + 1);
                            };
                            if (("event" in resObj)){
                                world.setMapEvents(resObj.event);
                            }
                            else {
                                world.setMapEvents(null);
                            };
                            if (("cellMap" in resObj)){
                                world.setCellMap(resObj.cellMap);
                            }
                            else {
                                world.setCellMap(null);
                            };
                            if (world.strFrame != ""){
                                world.exitCell();
                            };
                            world.killLoaders();
                            world.clearMonstersAndProps();
                            world.clearAllAvatars();
                            world.avatars[sfc.myUserId] = world.myAvatar;
                            world.strMapName = resObj.strMapName;
                            world.strMapFileName = resObj.strMapFileName;
							world.strMapBackgroundMusic = resObj.strMapBackgroundMusic;
                            world.intType = resObj.intType;
                            world.intKillCount = resObj.intKillCount;
                            world.objLock = (((resObj.objLock)!=null) ? resObj.objLock : null);
                            world.mondef = resObj.mondef;
                            world.monmap = resObj.monmap;
                            world.curRoom = Number(resObj.areaId);
                            world.actionResultsMon = {};
                            world.actionResults = {};
                            world.mapBoundsMC = null;
                            chatF.chn.zone.rid = world.curRoom;
                            if (("houseData" in resObj)){
                                world.initHouseData(resObj.houseData);
                            }
                            else {
                                world.initHouseData(null);
                            };
                            world.updatePartyFrame();
                            world.clearLoaders();
                            s = resObj.strMapFileName.toLowerCase();
							music = resObj.strMapBackgroundMusic.toLowerCase();
							
							if (("guildData" in resObj)){
                                world.initGuildhallData(resObj.guildData);
                                world.guildHallData.loadGuildMap(s);
                            }
                            else {
                                try {
                                    world.guildHallData.destroyMenu();
                                }
                                catch(e) {
                                };
                                world.loadMap(s, music);
                            };
                            elmType = resObj.elmType;
                            break;
                        case "initUserData":
                            try {
                                avt = world.getAvatarByUserID(resObj.uid);
                                uoLeaf = avt.dataLeaf;
                                if (((!((avt == null))) && (!((uoLeaf == null))))){
                                    avt.initAvatar({data:resObj.data});
                                    if (avt.isMyAvatar){
                                        avt.objData.strHomeTown = avt.objData.strMapName;
                                        if (avt.objData.guild != null){
                                            chatF.chn.guild.act = 1;
                                            if (String(avt.objData.guild.MOTD) != "undefined"){
                                                chatF.pushMsg("guild", ("Message of the day: " + String(avt.objData.guild.MOTD)), "SERVER", "", 0);
                                            };
                                        };
                                        if (avt.objData.iUpg > 0){
                                            if (avt.objData.iUpgDays < 0){
                                                chatF.pushMsg("moderator", "Your membership has expired. Please visit our website to renew your membership.", "SERVER", "", 0);
                                            }
                                            else {
                                                if (avt.objData.iUpgDays < 7){
                                                    chatF.pushMsg("moderator", (("Your membership will expire in " + (Number(avt.objData.iUpgDays) + 1)) + " days. Please visit our website to renew your membership."), "SERVER", "", 0);
                                                };
                                            };
                                        };
                                        updateXPBar();
                                        ui.mcInterface.mcGold.strGold.text = avt.objData.intGold;
										ui.mcInterface.mcGold.strSilver.text = avt.objData.intSilver;
										ui.mcInterface.mcGold.strCopper.text = avt.objData.intCopper;
										ui.mcInterface.mcGold.strCoins.text = avt.objData.intCoins;
                                        if (ui.mcPopup.currentLabel == "Inventory"){
                                            MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                        };
                                        trace(("resObj.uid: " + resObj.uid));
                                        world.getInventory(resObj.uid);
                                        world.initAchievements();
                                        readIA1Preferences();
                                    };
                                };
                            }
                            catch(e:Error) {
                                trace("initUserData > ");
                                trace(e);
                            };
                            break;
                        case "initUserDatas":
                            a = resObj.a;
                            i = 0;
                            while (i < a.length) {
                                o = a[i];
                                try {
                                    avt = world.getAvatarByUserID(o.uid);
                                    uoLeaf = avt.dataLeaf;
                                    if (((!((avt == null))) && (!((uoLeaf == null))))){
                                        avt.initAvatar({data:o.data});
                                        if (((avt.isMyAvatar) && ((((avt.items == null)) || ((avt.items.length < 1)))))){
                                            avt.objData.strHomeTown = avt.objData.strMapName;
                                            if (avt.objData.guild != null){
                                                chatF.chn.guild.act = 1;
                                                if (String(avt.objData.guild.MOTD) != "undefined"){
                                                    chatF.pushMsg("guild", ("Message of the day: " + String(avt.objData.guild.MOTD)), "SERVER", "", 0);
                                                };
                                            };
                                            if (Game.serverFilePath.indexOf("content.aqworlds.com") == -1){
                                                //ExternalInterface.call("showIt", "login", avt.objData.iAge, avt.objData.UserID);
                                            };
                                            if (avt.objData.iUpg > 0){
                                                if (avt.objData.iUpgDays < 0){
                                                    chatF.pushMsg("moderator", "Your membership has expired. Please visit our website to renew your membership.", "SERVER", "", 0);
                                                }
                                                else {
                                                    if (avt.objData.iUpgDays < 7){
                                                        chatF.pushMsg("moderator", (("Your membership will expire in " + (Number(avt.objData.iUpgDays) + 1)) + " days. Please visit our website to renew your membership."), "SERVER", "", 0);
                                                    };
                                                };
                                            };
                                            if (((!((avt.objData.dRefReset == null))) && ((((avt.objData.iRefGold > 0)) || ((avt.objData.iRefExp > 0)))))){
                                                modalRR = new ModalMC();
                                                modalORR = {};
                                                modalORR.strBody = (((("You earned <font color='#FFCC00'><b>" + Math.ceil(avt.objData.iRefGold)) + " Gold</b></font> and <font color='#990099'><b>") + Math.ceil(avt.objData.iRefExp)) + " XP</b></font><br/> from Referred Friends.");
                                                modalORR.callback = world.sendRewardReferralRequest;
                                                modalORR.btns = "mono";
                                                ui.ModalStack.addChild(modalRR);
                                                modalRR.init(modalORR);
                                            };
                                            updateXPBar();
											
                                            ui.mcInterface.mcGold.strGold.text = avt.objData.intGold;
											ui.mcInterface.mcGold.strSilver.text = avt.objData.intSilver;
											ui.mcInterface.mcGold.strCopper.text = avt.objData.intCopper;
											ui.mcInterface.mcGold.strCoins.text = avt.objData.intCoins;
                                            if (ui.mcPopup.currentLabel == "Inventory"){
                                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                            };
                                            world.getInventory(o.uid);
                                            world.initAchievements();
                                            readIA1Preferences();
											showMenuButton();
                                        };
                                    };
                                }
                                catch(e:Error) {
                                    trace("initUserDatas > ");
                                    trace(e);
                                };
                                i = (i + 1);
                            };
                            break;
                        case "changeColor":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (((!((avt == null))) && (avt.bitData))){
                                if (avt.isMyAvatar){
                                    showPortrait(avt);
                                }
                                else {
                                    if (resObj.HairID != null){
                                        avt.objData.HairID = resObj.HairID;
                                        avt.objData.strHairName = resObj.strHairName;
                                        avt.objData.strHairFilename = resObj.strHairFilename;
                                        if (((!((avt.pMC == null))) && (!((avt.pMC.stage == null))))){
                                            avt.pMC.loadHair();
                                        };
                                    };
                                    avt.objData.intColorSkin = resObj.intColorSkin;
                                    avt.objData.intColorHair = resObj.intColorHair;
                                    avt.objData.intColorEye = resObj.intColorEye;
                                    if (((!((avt.pMC == null))) && (!((avt.pMC.stage == null))))){
                                        avt.pMC.updateColor();
                                    };
                                };
                            }
                            else {
                                trace("can't set data!");
                            };
                            break;
                        case "changeArmorColor":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (((!((avt == null))) && (avt.bitData))){
                                if (!avt.isMyAvatar){
                                    avt.objData.intColorBase = resObj.intColorBase;
                                    avt.objData.intColorTrim = resObj.intColorTrim;
                                    avt.objData.intColorAccessory = resObj.intColorAccessory;
                                    if (((!((avt.pMC == null))) && (!((avt.pMC.stage == null))))){
                                        avt.pMC.updateColor();
                                    };
                                };
                            }
                            else {
                                trace("can't set data!");
                            };
                            break;
						case "changeGuildColor":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (((!((avt == null))) && (avt.bitData))){
                                if (!avt.isMyAvatar){
                                    avt.objData.intColorGuildName = resObj.intColorGuildName;
                                    avt.objData.intGuildEmblemBase = resObj.intGuildEmblemBase;
                                    avt.objData.intGuildEmblemTrim = resObj.intGuildEmblemTrim;
                                    if (((!((avt.pMC == null))) && (!((avt.pMC.stage == null))))){
                                        avt.pMC.updateColor();
                                    };
                                };
                            }
                            else {
                                trace("can't set data!");
                            };
                            break;
                        case "addGoldExp":
                            if (((!((resObj.intExp == null))) && ((resObj.intExp > 0)))){
                                deltaXP = resObj.intExp;
                                world.myAvatar.objData.intExp = (world.myAvatar.objData.intExp + deltaXP);
                                updateXPBar();
                                xp = new xpDisplay();
                                xp.t.ti.text = (deltaXP + " xp");
                                xpB = null;
                                if (("bonusExp" in resObj)){
                                    xpB = new xpDisplayBonus();
                                    xpB.t.ti.text = String((("+ " + resObj.bonusExp) + " xp!"));
                                    xp.t.ti.text = ((deltaXP - resObj.bonusExp) + " xp");
                                };
                                if (((!((resObj.typ == null))) && ((resObj.typ == "m")))){
                                    Mon = world.getMonster(resObj.id);
                                    xp.x = Mon.pMC.mcChar.x;
                                    xp.y = (Mon.pMC.mcChar.y - 40);
                                    Mon.pMC.addChild(xp);
                                    if (xpB != null){
                                        xpB.x = xp.x;
                                        xpB.y = xp.y;
                                        Mon.pMC.addChild(xpB);
                                    };
                                }
                                else {
                                    xp.x = world.myAvatar.pMC.mcChar.x;
                                    xp.y = (world.myAvatar.pMC.pname.y + 10);
                                    world.myAvatar.pMC.addChild(xp);
                                    if (xpB != null){
                                        xpB.x = xp.x;
                                        xpB.y = xp.y;
                                        world.myAvatar.pMC.addChild(xpB);
                                    };
                                };
                            };
							if (((!((resObj.intCopper == null))) && ((resObj.intCopper > 0)))){
                                mixer.playSound("Coins");
								
								deltaCopper = resObj.intCopper;
								deltaSilver = resObj.intSilver;
                                deltaGold = resObj.intGold;
								
                                world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + resObj.intGold);
								world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver + resObj.intSilver);
								world.myAvatar.objData.intCopper = (world.myAvatar.objData.intCopper + resObj.intCopper);
                                ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								copper = new copperDisplay();
                                copper.t.ti.text = (deltaCopper + " c");
                                copper.tMask.ti.text = (deltaCopper + " c");
                                if (((!((resObj.typ == null))) && ((resObj.typ == "m")))){
                                    Mon = world.getMonster(resObj.id);
                                    copper.x = Mon.pMC.mcChar.x;
                                    copper.y = (Mon.pMC.mcChar.y - 20);
                                    Mon.pMC.addChild(copper);
                                }
                                else {
                                    copper.x = world.myAvatar.pMC.mcChar.x;
                                    copper.y = (world.myAvatar.pMC.pname.y - 30);
                                    world.myAvatar.pMC.addChild(copper);
                                };
								
                            };
							if (((!((resObj.intSilver == null))) && ((resObj.intSilver > 0)))){
                                mixer.playSound("Coins");
								
								deltaCopper = resObj.intCopper;
								deltaSilver = resObj.intSilver;
                                deltaGold = resObj.intGold;
								
                                world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + resObj.intGold);
								world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver + resObj.intSilver);
								world.myAvatar.objData.intCopper = (world.myAvatar.objData.intCopper + resObj.intCopper);
                                ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };								
								silver = new silverDisplay();
                                silver.t.ti.text = (deltaSilver + " s");
                                silver.tMask.ti.text = (deltaSilver + " s");
                                if (((!((resObj.typ == null))) && ((resObj.typ == "m")))){
                                    Mon = world.getMonster(resObj.id);
                                    silver.x = Mon.pMC.mcChar.x;
                                    silver.y = (Mon.pMC.mcChar.y - 20);
                                    Mon.pMC.addChild(silver);
                                }
                                else {
                                    silver.x = world.myAvatar.pMC.mcChar.x;
                                    silver.y = (world.myAvatar.pMC.pname.y - 30);
                                    world.myAvatar.pMC.addChild(silver);
                                };
								
                            };
                            if (((!((resObj.intGold == null))) && ((resObj.intGold > 0)))){
                                mixer.playSound("Coins");
								
								deltaCopper = resObj.intCopper;
								deltaSilver = resObj.intSilver;
                                deltaGold = resObj.intGold;
								
                                world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + resObj.intGold);
								world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver + resObj.intSilver);
								world.myAvatar.objData.intCopper = (world.myAvatar.objData.intCopper + resObj.intCopper);
                                ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								
                                gold = new goldDisplay();
                                gold.t.ti.text = (deltaGold + " g");
                                gold.tMask.ti.text = (deltaGold + " g");
                                if (((!((resObj.typ == null))) && ((resObj.typ == "m")))){
                                    Mon = world.getMonster(resObj.id);
                                    gold.x = Mon.pMC.mcChar.x;
                                    gold.y = (Mon.pMC.mcChar.y - 20);
                                    Mon.pMC.addChild(gold);
                                }
                                else {
                                    gold.x = world.myAvatar.pMC.mcChar.x;
                                    gold.y = (world.myAvatar.pMC.pname.y - 30);
                                    world.myAvatar.pMC.addChild(gold);
                                };
                            };
                            if (resObj.iCP != null){
                                deltaCP = resObj.iCP;
                                world.myAvatar.objData.iCP = (world.myAvatar.objData.iCP + deltaCP);
                                world.myAvatar.updateArmorRep();
                                iRank = world.myAvatar.objData.iRank;
                                world.myAvatar.updateRep();
                                if (iRank != world.myAvatar.objData.iRank){
                                    world.myAvatar.rankUp(world.myAvatar.objData.strClassName, world.myAvatar.objData.iRank);
                                    FB_showFeedDialog("Rank Up!", (((("reached Rank " + world.myAvatar.objData.iRank) + " ") + world.myAvatar.objData.strClassName) + " in AQWorlds!"), "aqw-rankup.jpg");
                                };
                                txtBonusCP = "";
                                if (resObj.bonusCP == null){
                                    resObj.bonusCP = 0;
                                }
                                else {
                                    txtBonusCP = ((" + " + resObj.bonusCP) + "(Bonus)");
                                };
                                chatF.pushMsg("server", ((((("Class Points for " + world.myAvatar.objData.strClassName) + " increased by ") + (deltaCP - resObj.bonusCP)) + txtBonusCP) + "."), "SERVER", "", 0);
                            };
                            if (resObj.FactionID != null){
                                if (resObj.bonusRep == null){
                                    resObj.bonusRep = 0;
                                };
                                world.myAvatar.addRep(resObj.FactionID, resObj.iRep, resObj.bonusRep);
                            };
							ui.mcPetPortrait.XPBar.mcRep.scaleY = (avt.objData.eqp["pe"].PetExperience / avt.objData.eqp["pe"].intExpToLevel);
							avt = world.getAvatarByUserID(resObj.uid);
                            tLeaf = world.getUoLeafById(resObj.uid);
                            if (avt != null){
                                if (((!((avt.pMC == null))) && (!((avt.objData == null))))){
									if(avt.objData.eqp["pe"] != null){
										deltaXP = resObj.intPetExp;
										avt.objData.eqp["pe"].PetExperience = (avt.objData.eqp["pe"].PetExperience + deltaXP);
										xp = new xpDisplay();
										xp.t.ti.text = (deltaXP + " xp");
										xpB = null;
										if (("bonusPetExp" in resObj)){
											xpB = new xpDisplayBonus();
											xpB.t.ti.text = String((("+ " + resObj.bonusPetExp) + " xp!"));
											xp.t.ti.text = ((deltaXP - resObj.bonusPetExp) + " xp");
										};
										
										xp.x = world.myAvatar.petMC.x;
										xp.y = (world.myAvatar.petMC.pname.y + 10);
										world.myAvatar.petMC.addChild(xp);
										if (xpB != null){
											xpB.x = xp.x;
											xpB.y = xp.y;
											world.myAvatar.petMC.addChild(xpB);
										};
									};
								}
							}
                            break;
                        case "levelUp":
							//world.myAvatar.objData.intSkillPoints = world.myAvatar.objData.intSkillPoints + 1
							//ui.mcPopup.mcSkillTree.txtSkillPoints.text = "Remaining Skill Points: " + world.myAvatar.objData.intSkillPoints;
                            world.myAvatar.objData.intLevel = resObj.intLevel;
                            world.myAvatar.objData.intExpToLevel = resObj.intExpToLevel;
                            world.myAvatar.objData.intExp = 0;
                            updateXPBar();
                            showPortraitBox(world.myAvatar, ui.mcPortrait);
                            world.myAvatar.levelUp();
							showAchievement("Level Up!", resObj.intLevel);
							mixer.playSound("Achievement");
                            if (resObj.intLevel == 10){
                                //ExternalInterface.call("showIt", "level10", 0, world.myAvatar.objData.UserID);
                            };
                            if (("updatePStats" in world.map)){
                                world.map.updatePStats();
                            };
							/* STAT COMPUTE */
							(world.myAvatar.objData.stats.StatPoints = (3 * Number(resObj.intLevel)));
							(world.myAvatar.objData.intSkillPoints = world.myAvatar.objData.intSkillPoints + 1);
							
							/* Backflip Feature */
							sfc.sendXtMessage("zm", "emotea", ["Backflip"], "str", 1);
                            world.myAvatar.pMC.mcChar.gotoAndPlay(strToProperCase("Backflip"));
							ui.mcSkillUp.gotoAndPlay("in")
                            break;
						case "levelUpPet":
							avt = world.getAvatarByUserID(resObj.uid);
                            tLeaf = world.getUoLeafById(resObj.uid);
                            if (avt != null){
                                if (((!((avt.pMC == null))) && (!((avt.objData == null))))){
									avt.objData.eqp["pe"].PetExpToLevel = resObj.intExpToLevel;
                                    avt.objData.eqp["pe"].PetLevel = resObj.intLevel;
									avt.objData.eqp["pe"].PetExperience = 0;
									ui.mcPetPortrait.XPBar.scaleY = (0 / resObj.intExpToLevel);
									ui.mcPetPortrait.strLevel.text = avt.objData.eqp["pe"].PetLevel;
									//world.myAvatar.levelUp();
									showAchievement("Pet Level Up!", resObj.intLevel);
									mixer.playSound("Achievement");
								}
							};
                            break;
                        case "loadInventoryBig":
                            trace("loadInventoryBig");
                            world.myAvatar.iBankCount = int(resObj.bankCount);
                            world.myAvatar.initInventory(resObj.items);
                            world.initHouseInventory({
                                sHouseInfo:world.myAvatar.objData.sHouseInfo,
                                items:resObj.hitems
                            });
                            world.myAvatar.initFactions(resObj.factions);
                            world.myAvatar.initGuild(resObj.guild);
                            world.uiLock = false;
                            world.myAvatar.invLoaded = true;
                            if (("eventTrigger" in MovieClip(world.map))){
                                world.map.eventTrigger({cmd:"userLoaded"});
                            };
                            world.myAvatar.checkItemAnimation();
                            adShown = false;
                            testDate = new Date();
                            if (!FBApi.isLoggedIn){
                            };
                            if ((((world.myAvatar.objData.iUpg < 1)) && (!((world.map.noPopup == true))))){
							//SUPA DOFFY
                                testDate.setDate((testDate.getDate() - 3));
                                if ((((((world.myAvatar.objData.dCreated > testDate)) && ((world.myAvatar.objData.intHits > 1)))) && ((Math.random() < 0.2)))){
									if (world.myAvatar.objData.intlevel > 2){
										adShown = true;
										world.loadMovieFront("interface/DragonHeroOffer-28Feb13.swf", "Inline Asset");
									};
                                };
                            };
                            if ((((((world.myAvatar.objData.intActivationFlag == 1)) && ((world.myAvatar.objData.intHits < 16)))) && (!((world.map.noPopup == true))))){
                                if ((((world.myAvatar.objData.intHits == 5)) || ((world.myAvatar.objData.intHits == 15)))){
                                    world.loadMovieFront("interface/ConfirmedEmailPopup.swf", "Inline Asset");
                                };
                            };
                            break;
                        case "friends":
                            world.myAvatar.initFriendsList(resObj.friends);
                            if (resObj.showList){
                                flo = {};
                                flo.typ = "userListFriends";
                                flo.ul = world.myAvatar.friends;
                                ui.mcOFrame.fOpenWith(flo);
                            };
                            break;
						case "playerkills":
                            world.myAvatar.initPlayerkillsList(resObj.playerkills);
                            if (resObj.showList){
                                flo = {};
                                flo.typ = "userListPK";
                                flo.ul = world.myAvatar.playerkills;
                                ui.mcOFrame.fOpenWith(flo);
                            };
                            break;
                        case "initInventory":
                            world.myAvatar.initInventory(resObj.items);
                            if (("eventTrigger" in MovieClip(world.map))){
                                world.map.eventTrigger({cmd:"userLoaded"});
                            };
                            break;
                        case "loadHouseInventory":
                            world.initHouseInventory(resObj);
                            break;
                        case "house":
                            MsgBox.notify(resObj.msg);
                            break;
                        case "buyBagSlots":
                            world.dispatchEvent(new Event("buyBagSlots"));
                            if (resObj.bitSuccess == 1){
                                mixer.playSound("Heal");
                                world.myAvatar.objData.iBagSlots = (world.myAvatar.objData.iBagSlots + Number(resObj.iSlots));
                                world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - (Number(resObj.iSlots) * 200));
                                MsgBox.notify((("You now have " + world.myAvatar.objData.iBagSlots) + " inventory spaces!"));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshSlots"});
                                };
                                if (ui.mcPopup.currentLabel == "Shop"){
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshSlots"});
                                };
                            };
                            break;
                        case "buyBankSlots":
                            world.dispatchEvent(new Event("buyBankSlots"));
                            if (resObj.bitSuccess == 1){
                                mixer.playSound("Heal");
                                world.myAvatar.objData.iBankSlots = (world.myAvatar.objData.iBankSlots + Number(resObj.iSlots));
                                world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - (Number(resObj.iSlots) * 200));
                                MsgBox.notify((("You now have " + world.myAvatar.objData.iBankSlots) + " bank spaces!"));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshSlots"});
                                };
                                if (ui.mcPopup.currentLabel == "Shop"){
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshSlots"});
                                };
                            };
                            break;
                        case "buyHouseSlots":
                            world.dispatchEvent(new Event("buyHouseSlots"));
                            if (resObj.bitSuccess == 1){
                                mixer.playSound("Heal");
                                world.myAvatar.objData.iHouseSlots = (world.myAvatar.objData.iHouseSlots + Number(resObj.iSlots));
                                world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - (Number(resObj.iSlots) * 200));
                                MsgBox.notify((("You now have " + world.myAvatar.objData.iHouseSlots) + " house inventory spaces!"));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshSlots"});
                                };
                                if (ui.mcPopup.currentLabel == "Shop"){
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshSlots"});
                                };
                            };
                            break;
                        case "callfct":
                            try {
                                fct = world.map[resObj.fctNam];
                                (fct(resObj.fctParams));
                            }
                            catch(e) {
                                trace(e);
                            };
                            break;
                        case "genderSwap":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (((!((avt == null))) && (avt.bitData))){
                                if (resObj.bitSuccess == 1){
                                    if (avt.isMyAvatar){
                                        MsgBox.notify("Your gender has been successfully changed.");
                                        avt.objData.intCoins = (avt.objData.intCoins - resObj.intCoins);
                                    };
                                    avt.objData.strGender = resObj.gender;
                                    avt.objData.HairID = resObj.HairID;
                                    avt.objData.strHairName = resObj.strHairName;
                                    avt.objData.strHairFilename = resObj.strHairFilename;
                                    avt.initAvatar({data:avt.objData});
                                };
                            };
                            break;
                        case "loadOffer":
                            if (resObj.bitSuccess){
                                if (((!((resObj.itemsA == null))) && (!((resObj.itemsA == "undefined"))))){
                                    world.addItemsToTradeA(resObj.itemsA);
                                };
                                if (((!((resObj.itemsB == null))) && (!((resObj.itemsB == "undefined"))))){
                                    world.addItemsToTradeB(resObj.itemsB);
                                };
                                if (ui.mcPopup.currentLabel == "TradePanel"){
                                    MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({eventType:"refreshBank"});								
                                }
                                else {
                                    ui.mcPopup.fOpen("TradePanel");
                                };
                            }
                            else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error loading trade items!  Try logging out and back in to fix this problem.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "buyAuctionItem":
						    if (resObj.bitSuccess) {
	                            item = resObj.item;
                                item.CharItemID = resObj.CharItemID;
								
                                showItemDrop(item, false);
                                if (world.invTree[item.ItemID] == null){
                                    world.invTree[item.ItemID] = copyObj(resObj);
                                };								
								
                                world.myAvatar.auctionToInv(item.AuctionID, item.ItemID);

								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshItems"});
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshBank"});
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshInventory"});
								
                                world.updateQuestProgress("item", item);
							} else {
                                MsgBox.notify(resObj.strMessage);
							}
                            break;
                        case "sellAuctionItem":
						    if (resObj.bitSuccess) {
                                world.myAvatar.removeItem(resObj.CharItemID, resObj.Quantity);                            
                                world.checkAllQuestStatus();
								
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshItems"});
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshBank"});
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshInventory"});
							} else {
							    MsgBox.notify(resObj.strMessage);
							}
                            break;
                        case "retrieveAuctionItem":
						    if (resObj.bitSuccess) {
							    if ("item" in resObj) {
									item = resObj.item;
									item.CharItemID = resObj.CharItemID;
									
									showItemDrop(item, false);
									if (world.invTree[item.ItemID] == null){
										world.invTree[item.ItemID] = copyObj(resObj.item);
									};				
                                   									
									
									world.myAvatar.addItem(item);									
									world.updateQuestProgress("item", item);
								}
								
								world.myAvatar.removeRetrieve(resObj.AuctionID);
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshItems"});
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshBank"});
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshInventory"});
							} else {
                                MsgBox.notify(resObj.strMessage);
							}
                            break;
                        case "retrieveAuctionItems":
						    if (resObj.bitSuccess) {
							    i = 0;
                                while (i < resObj.items.length) {
                                    iobj = copyObj(resObj.items[i]);
									
									if (world.invTree[iobj.ItemID] == null){
										world.invTree[iobj.ItemID] = copyObj(iobj);
									};		
									
									world.myAvatar.addItem(iobj);									
									world.updateQuestProgress("item", iobj);
									showItemDrop(iobj, false);
									world.myAvatar.removeRetrieve(resObj.items[i].AuctionID);
	
                                    i = (i + 1);
                                };
								
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshItems"});
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshBank"});
								MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshInventory"});
							} else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.strMessage;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
							}
                            break;		
                        case "loadAuction":
                            if (resObj.bitSuccess){
                                if (((!((resObj.items == null))) && (!((resObj.items == "undefined"))))){
                                    world.addItemsToAuction(resObj.items);
                                };
                                if (ui.mcPopup.currentLabel == "AuctionPanel"){
									MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshItems"});
									MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshBank"});
									MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshInventory"});
                                }
                                else {
                                    ui.mcPopup.fOpen("AuctionPanel");
                                };
								world.rootClass.auctionTabs.onSearch = false;
                            }
                            else {
                                MsgBox.notify(resObj.strMessage);
                            };
                            break;
	                    case "loadRetrieve":
                            if (resObj.bitSuccess){
                                if (((!((resObj.items == null))) && (!((resObj.items == "undefined"))))){
                                    world.addItemsToRetrieve(resObj.items);
                                };
                                if (ui.mcPopup.currentLabel == "AuctionPanel"){
                                    MovieClip(ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshBank"});
                                }
                                else {
                                    ui.mcPopup.fOpen("AuctionPanel");
                                };
                            }
                            else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error loading auction items!  Try logging out and back in to fix this problem.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "sendLinkedItems":
						    if (resObj.bitSuccess == 1) {
							    i = 0;
                                while (i < resObj.items.length) {
                                    iobj = copyObj(resObj.items[i]);
									world.linkTree[iobj.CharItemID] = copyObj(iobj);
                                    i = (i + 1);
                                };
							} else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.strMessage;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
							};
                            break;	
                        case "tradeDeal":
                            if (resObj.bitSuccess) {
								 if (("onHold" in resObj) && (resObj.onHold == 1)) {
								     ctrlTrade.btnDeal.alpha = 0.5;
			                         ctrlTrade.btnDeal.mouseEnabled = false;	
								 } else {
							         if (ui.mcPopup.currentLabel == "TradePanel") {
								        MovieClip(ui.mcPopup.getChildByName("mcTrade")).notify = false;
                                        MovieClip(ui.mcPopup.getChildByName("mcTrade")).fClose();		
                                     }							
								 }
                            } 
                            else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;		
                        case "tradeCancel":
						    trace("Received cancel");
                            if (resObj.bitSuccess) {
							     world.myAvatar.tradeToInvReset();								 
								 trace("Reset initiated");
								 if (ui.mcPopup.currentLabel == "TradePanel") {
							         MovieClip(ui.mcPopup.getChildByName("mcTrade")).notify = false;
                                     MovieClip(ui.mcPopup.getChildByName("mcTrade")).fClose();
								 }
                            }
                            break;							
                        case "tradeLock":
                            if (resObj.bitSuccess){
								ctrlTrade.txtTargetGold.text = resObj.gold;
								ctrlTrade.txtTargetSilver.text = resObj.silver;
								ctrlTrade.txtTargetCopper.text = resObj.copper;
								ctrlTrade.txtTargetCoins.text = resObj.coins;							
										
								if (("Deal" in resObj) && (resObj.Deal == 1)) {
								    ctrlTrade.btnDeal.alpha = 1;
			                        ctrlTrade.btnDeal.mouseEnabled = true;	
								} 
								if (("Self" in resObj) && (resObj.Self == 1)) {
									ctrlTrade.txtMyGold.mouseEnabled = false;
									ctrlTrade.txtMySilver.mouseEnabled = false;
									ctrlTrade.txtMyCopper.mouseEnabled = false;
								    ctrlTrade.txtMyCoins.mouseEnabled = false;
								    ctrlTrade.txtLock.text = "Unlock";			
									tradeItem1.alpha = 0.5;								    
								} else  {
								    tradeItem2.alpha = 0.5;		
								}								
                            }
                            else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "tradeUnlock":
                            if (resObj.bitSuccess){
                                ctrlTrade.txtLock.text = "Lock";
								ctrlTrade.btnDeal.alpha = 0.5;
			                    ctrlTrade.btnDeal.mouseEnabled = false;	
								ctrlTrade.txtMyGold.mouseEnabled = true;
								ctrlTrade.txtMySilver.mouseEnabled = true;
								ctrlTrade.txtMyCopper.mouseEnabled = true;
								ctrlTrade.txtMyCoins.mouseEnabled = true;
								tradeItem1.alpha = 1;
								tradeItem2.alpha = 1;								
                            }
                            break;
                        case "tradeFromInv":
                            if (((("bSuccess" in resObj)) && ((resObj.bSuccess == 1)))){
                                world.myAvatar.tradeFromInv(resObj.ItemID, resObj.Type, resObj.Quantity);
                                world.checkAllQuestStatus();
                                if (ui.mcPopup.currentLabel == "TradePanel"){
                                    MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({eventType:"refreshItems"});
                                };
                            }
                            else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "tradeToInv":
						    if (resObj.Type == 1) {
                                world.myAvatar.tradeToInvA(resObj.ItemID);
							} else {
                                world.myAvatar.tradeToInvB(resObj.ItemID);
							}
                            world.checkAllQuestStatus();
                            if (ui.mcPopup.currentLabel == "TradePanel"){
                                MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({eventType:"refreshItems"});
                            };
                            break;
                        case "tradeSwapInv":
                            world.myAvatar.tradeSwapInv(resObj.invItemID, resObj.tradeItemID);
                            world.checkAllQuestStatus();
                            if (ui.mcPopup.currentLabel == "TradePanel"){
                                MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({eventType:"refreshItems"});
                            };
                            break;
                        case "loadBank":
                            if (resObj.bitSuccess){
                                if (((!((resObj.items == null))) && (!((resObj.items == "undefined"))))){
                                    world.addItemsToBank(resObj.items);
                                };
                                if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshBank"});
                                }
                                else {
                                    ui.mcPopup.fOpen("Bank");
                                };
                            }
                            else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error loading bank items!  Try logging out and back in to fix this problem.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "newSpawnPoint":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (resObj.Msg);
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error saving spawnpoint.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "bpc":
                            if (resObj.bitSuccess){	
                                mixer.playSound("Heal");
                                //world.toggleBank();
								if (ui.mcPopup.currentLabel == "Bank"){
									MovieClip(ui.mcPopup.getChildByName("mcBank")).fClose();
								} else {
									ui.mcPopup.fOpen("Bank");
								};
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Invalid Pin.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
							}
                            break;
						case "rewardAchievement":
							if (resObj.bitSuccess == 1){
								showAchievement(resObj.Name, resObj.AchievementID);	
								mixer.playSound("Achievement");
							}						
							break;
						case "respawnToCell":
							if (resObj.bitSuccess){
								world.moveToCell(resObj.Frame, resObj.Cell);
								mixer.playSound("Good");
								world.map.transform.colorTransform = world.defaultCT;
								world.CHARS.transform.colorTransform = world.defaultCT;
								//world.showResCounter();
							} else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Failed to Respawn.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
							}
                            break;
						case "respawnClient":
							if (resObj.bitSuccess){
								//avt = world.getAvatarByUserName(resObj.unm);
								//if (avt != null){
									/** REMOVE DEATH FILTERS **/
									//avt.pMC.transform.colorTransform = world.defaultCT;
									world.map.transform.colorTransform = world.defaultCT;
									world.CHARS.transform.colorTransform = world.defaultCT;
									
									/** GETUP ANIMATION **/
									chatF.submitMsg("/getup", "emotea", sfc.myUserName);
									
									/** ENABLE ATTACK AND WALK **/
									world.actionReady = true;
									world.bitWalk = true;
									
									/** HIDES DEATH COUNTDOWN **/
									ui.mcRes.visible = false;
									ui.mcRes.gotoAndStop(1);
								//};
							};
                            break;
						case "convertToSilver":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have gained " + resObj.Quantity) + " silver.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
                                (world.myAvatar.objData.intCopper = (world.myAvatar.objData.intCopper - Number((resObj.Quantity * 50000))));
                                (world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver + Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error converting copper to silver.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "convertToGold":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have gained " + resObj.Quantity) + " gold.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
                                (world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver - Number((resObj.Quantity * 500000))));
                                (world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + Number(resObj.Quantity)));
								
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error converting silver to gold.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "diamondFromVending":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have withdrawn " + resObj.Quantity) + " diamonds.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.vendings.intCoins = (world.myAvatar.objData.vendings.intCoins - Number(resObj.Quantity)));
                                (world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins +  Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "VendingSetup"){
                                    MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on withdrawal.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "goldFromVending":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have withdrawn " + resObj.Quantity) + " gold.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.vendings.intGold = (world.myAvatar.objData.vendings.intGold - Number(resObj.Quantity)));
                                (world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold +  Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "VendingSetup"){
                                    MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on withdrawal.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "silverFromVending":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have withdrawn " + resObj.Quantity) + " silver.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.vendings.intSilver = (world.myAvatar.objData.vendings.intSilver - Number(resObj.Quantity)));
                                (world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver +  Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "VendingSetup"){
                                    MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on withdrawal.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "copperFromVending":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have withdrawn " + resObj.Quantity) + " copper.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.vendings.intCopper = (world.myAvatar.objData.vendings.intCopper - Number(resObj.Quantity)));
                                (world.myAvatar.objData.intCopper = (world.myAvatar.objData.intCopper +  Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "VendingSetup"){
                                    MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on withdrawal.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "diamondToInventory":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have withdrawn " + resObj.Quantity) + " diamonds.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.bank.intCoins = (world.myAvatar.objData.bank.intCoins - Number(resObj.Quantity)));
                                (world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins +  Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on withdrawal.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "goldToInventory":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have withdrawn " + resObj.Quantity) + " gold.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.bank.intGold = (world.myAvatar.objData.bank.intGold - Number(resObj.Quantity)));
                                (world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold +  Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on withdrawal.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "silverToInventory":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have withdrawn " + resObj.Quantity) + " silver.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.bank.intSilver = (world.myAvatar.objData.bank.intSilver - Number(resObj.Quantity)));
                                (world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver +  Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on withdrawal.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "copperToInventory":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have withdrawn " + resObj.Quantity) + " copper.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.bank.intCopper = (world.myAvatar.objData.bank.intCopper - Number(resObj.Quantity)));
                                (world.myAvatar.objData.intCopper = (world.myAvatar.objData.intCopper +  Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on withdrawal.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "diamondFromInventory":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have deposited " + resObj.Quantity) + " diamonds.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.bank.intCoins = (world.myAvatar.objData.bank.intCoins + Number(resObj.Quantity)));
                                (world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on deposit.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "goldFromInventory":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have deposited " + resObj.Quantity) + " gold.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.bank.intGold = (world.myAvatar.objData.bank.intGold + Number(resObj.Quantity)));
                                (world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold - Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on deposit.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "silverFromInventory":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have deposited " + resObj.Quantity) + " silver.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.bank.intSilver = (world.myAvatar.objData.bank.intSilver + Number(resObj.Quantity)));
                                (world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver - Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on deposit.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "copperFromInventory":
                            if (resObj.bitSuccess){								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = (("Congratulations, you have deposited " + resObj.Quantity) + " copper.");
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								
								(world.myAvatar.objData.bank.intCopper = (world.myAvatar.objData.bank.intCopper + Number(resObj.Quantity)));
                                (world.myAvatar.objData.intCopper = (world.myAvatar.objData.intCopper - Number(resObj.Quantity)));
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
								if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshCoins"});
                                };
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on deposit.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "spendStatPoints":
                            if (resObj.bitSuccess){
								var Strength = resObj.Strength;
								var Intellect = resObj.Intellect;
								var Endurance = resObj.Endurance;
								var Dexterity = resObj.Dexterity;
								var Wisdom = resObj.Wisdom;
								var Luck = resObj.Luck;
								
								(world.myAvatar.objData.stats.Strength = (world.myAvatar.objData.stats.Strength + Number(Strength)));
								(world.myAvatar.objData.stats.Intellect = (world.myAvatar.objData.stats.Intellect + Number(Intellect)));
								(world.myAvatar.objData.stats.Endurance = (world.myAvatar.objData.stats.Endurance + Number(Endurance)));
								(world.myAvatar.objData.stats.Dexterity = (world.myAvatar.objData.stats.Dexterity + Number(Dexterity)));
								(world.myAvatar.objData.stats.Wisdom = (world.myAvatar.objData.stats.Wisdom + Number(Wisdom)));
								(world.myAvatar.objData.stats.Luck = (world.myAvatar.objData.stats.Luck + Number(Luck)));

                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error on spending stats.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "vendingFromInv":
							if (resObj.bitSuccess) {
                                world.myAvatar.removeItem(resObj.CharItemID, resObj.Quantity);
								world.checkAllQuestStatus();
								
								world.myAvatar.vendingReset();
								MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshItems"});
								MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshBank"});
								MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshInventory"});
							} else {
							    MsgBox.notify(resObj.strMessage);
							}
                            break;
						case "vendingToInv":
							if (resObj.bSuccess) {
								world.myAvatar.vendingToInv(resObj.VendingID, resObj.ItemID);
								world.checkAllQuestStatus();
								
								world.myAvatar.vendingReset();
								MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshItems"});
								MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshBank"});
								MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshInventory"});							
							} else {
							    MsgBox.notify("Invalid Request");
							}
                            break;
						case "vendingSwapInv":
                            world.myAvatar.vendingSwapInv(resObj.invItemID, resObj.vendingItemID);
                            world.checkAllQuestStatus();
                            if (ui.mcPopup.currentLabel == "VendingSetup"){
								MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshItems"});
								MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshBank"});
								MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshInventory"})
                            };
                            break;
						case "spendSkillPoints":
                            if (resObj.bitSuccess == 1){	
								world.myAvatar.objData.intSkillPoints = world.myAvatar.objData.intSkillPoints - 1;
								ui.mcPopup.mcSkillTree.txtSkillPoints.text = "Remaining Skill Points: " + world.myAvatar.objData.intSkillPoints;
								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								color.brightness = 0;
								
								trace("SLOT: " + SkillSlotMC);
								
								switch (SkillSlotMC){
									case "s1":
										ui.mcPopup.mcSkillTree.s1.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s1.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s1.btnAddSkill.visible = false;
										break;
									case "s2":
										ui.mcPopup.mcSkillTree.s2.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s2.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s2.btnAddSkill.visible = false;
										break;
									case "s3":
										ui.mcPopup.mcSkillTree.s3.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s3.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s3.btnAddSkill.visible = false;
										break;
									case "s4":
										ui.mcPopup.mcSkillTree.s4.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s4.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s4.btnAddSkill.visible = false;
										break;
									case "s5":
										ui.mcPopup.mcSkillTree.s5.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s5.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s5.btnAddSkill.visible = false;
										break;
									case "s6":
										ui.mcPopup.mcSkillTree.s6.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s6.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s6.btnAddSkill.visible = false;
										break;
									case "s7":
										ui.mcPopup.mcSkillTree.s7.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s7.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s7.btnAddSkill.visible = false;
										break;
									case "s8":
										ui.mcPopup.mcSkillTree.s8.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s8.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s8.btnAddSkill.visible = false;
										break;
									case "s9":
										ui.mcPopup.mcSkillTree.s9.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s9.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s9.btnAddSkill.visible = false;
										break;
									case "s10":
										ui.mcPopup.mcSkillTree.s10.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s10.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s10.btnAddSkill.visible = false;
										break;
									case "s11":
										ui.mcPopup.mcSkillTree.s11.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s1.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s1.btnAddSkill.visible = false;
										break;
									case "s12":
										ui.mcPopup.mcSkillTree.s12.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s12.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s12.btnAddSkill.visible = false;
										break;
									case "s13":
										ui.mcPopup.mcSkillTree.s13.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s13.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s13.btnAddSkill.visible = false;
										break;
									case "s14":
										ui.mcPopup.mcSkillTree.s14.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s14.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s14.btnAddSkill.visible = false;
										break;
									case "s15":
										ui.mcPopup.mcSkillTree.s15.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s15.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s15.btnAddSkill.visible = false;
										break;
									case "s16":
										ui.mcPopup.mcSkillTree.s16.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s16.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s16.btnAddSkill.visible = false;
										break;
									case "s17":
										ui.mcPopup.mcSkillTree.s17.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s17.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s17.btnAddSkill.visible = false;
										break;
									case "s18":
										ui.mcPopup.mcSkillTree.s18.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s18.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s18.btnAddSkill.visible = false;
										break;
									case "s19":
										ui.mcPopup.mcSkillTree.s19.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s19.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s19.btnAddSkill.visible = false;
										break;
									case "s20":
										ui.mcPopup.mcSkillTree.s20.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s20.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s20.btnAddSkill.visible = false;
										break;
									case "s21":
										ui.mcPopup.mcSkillTree.s21.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s21.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.s21.btnAddSkill.visible = false;
										break;
									case "a1":
										ui.mcPopup.mcSkillTree.a1.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a1.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a1.btnAddSkill.visible = false;
										break;
									case "a2":
										ui.mcPopup.mcSkillTree.a2.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a2.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a2.btnAddSkill.visible = false;
										break;
									case "a3":
										ui.mcPopup.mcSkillTree.a3.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a3.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a3.btnAddSkill.visible = false;
										break;
									case "a4":
										ui.mcPopup.mcSkillTree.a4.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a4.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a4.btnAddSkill.visible = false;
										break;
									case "a5":
										ui.mcPopup.mcSkillTree.a5.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a5.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a5.btnAddSkill.visible = false;
										break;
									case "a6":
										ui.mcPopup.mcSkillTree.a6.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a6.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a6.btnAddSkill.visible = false;
										break;
									case "a7":
										ui.mcPopup.mcSkillTree.a7.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a7.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a7.btnAddSkill.visible = false;
										break;
									case "a8":
										ui.mcPopup.mcSkillTree.a8.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a8.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a8.btnAddSkill.visible = false;
										break;
									case "a9":
										ui.mcPopup.mcSkillTree.a9.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a9.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a9.btnAddSkill.visible = false;
										break;
									case "a10":
										ui.mcPopup.mcSkillTree.a10.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a10.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a10.btnAddSkill.visible = false;
										break;
									case "a11":
										ui.mcPopup.mcSkillTree.a11.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a1.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a1.btnAddSkill.visible = false;
										break;
									case "a12":
										ui.mcPopup.mcSkillTree.a12.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a12.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a12.btnAddSkill.visible = false;
										break;
									case "a13":
										ui.mcPopup.mcSkillTree.a13.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a13.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a13.btnAddSkill.visible = false;
										break;
									case "a14":
										ui.mcPopup.mcSkillTree.a14.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a14.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a14.btnAddSkill.visible = false;
										break;
									case "a15":
										ui.mcPopup.mcSkillTree.a15.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a15.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a15.btnAddSkill.visible = false;
										break;
									case "a16":
										ui.mcPopup.mcSkillTree.a16.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a16.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a16.btnAddSkill.visible = false;
										break;
									case "a17":
										ui.mcPopup.mcSkillTree.a17.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a17.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a17.btnAddSkill.visible = false;
										break;
									case "a18":
										ui.mcPopup.mcSkillTree.a18.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a18.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a18.btnAddSkill.visible = false;
										break;
									case "a19":
										ui.mcPopup.mcSkillTree.a19.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a19.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a19.btnAddSkill.visible = false;
										break;
									case "a20":
										ui.mcPopup.mcSkillTree.a20.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a20.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a20.btnAddSkill.visible = false;
										break;
									case "a21":
										ui.mcPopup.mcSkillTree.a21.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a21.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.a21.btnAddSkill.visible = false;
										break;
									case "d1":
										ui.mcPopup.mcSkillTree.d1.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d1.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d1.btnAddSkill.visible = false;
										break;
									case "d2":
										ui.mcPopup.mcSkillTree.d2.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d2.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d2.btnAddSkill.visible = false;
										break;
									case "d3":
										ui.mcPopup.mcSkillTree.d3.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d3.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d3.btnAddSkill.visible = false;
										break;
									case "d4":
										ui.mcPopup.mcSkillTree.d4.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d4.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d4.btnAddSkill.visible = false;
										break;
									case "d5":
										ui.mcPopup.mcSkillTree.d5.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d5.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d5.btnAddSkill.visible = false;
										break;
									case "d6":
										ui.mcPopup.mcSkillTree.d6.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d6.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d6.btnAddSkill.visible = false;
										break;
									case "d7":
										ui.mcPopup.mcSkillTree.d7.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d7.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d7.btnAddSkill.visible = false;
										break;
									case "d8":
										ui.mcPopup.mcSkillTree.d8.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d8.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d8.btnAddSkill.visible = false;
										break;
									case "d9":
										ui.mcPopup.mcSkillTree.d9.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d9.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d9.btnAddSkill.visible = false;
										break;
									case "d10":
										ui.mcPopup.mcSkillTree.d10.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d10.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d10.btnAddSkill.visible = false;
										break;
									case "d11":
										ui.mcPopup.mcSkillTree.d11.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d1.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d1.btnAddSkill.visible = false;
										break;
									case "d12":
										ui.mcPopup.mcSkillTree.d12.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d12.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d12.btnAddSkill.visible = false;
										break;
									case "d13":
										ui.mcPopup.mcSkillTree.d13.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d13.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d13.btnAddSkill.visible = false;
										break;
									case "d14":
										ui.mcPopup.mcSkillTree.d4.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d4.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d4.btnAddSkill.visible = false;
										break;
									case "d15":
										ui.mcPopup.mcSkillTree.d15.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d15.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d15.btnAddSkill.visible = false;
										break;
									case "d16":
										ui.mcPopup.mcSkillTree.d16.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d16.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d16.btnAddSkill.visible = false;
										break;
									case "d17":
										ui.mcPopup.mcSkillTree.d17.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d17.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d17.btnAddSkill.visible = false;
										break;
									case "d18":
										ui.mcPopup.mcSkillTree.d18.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d18.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d18.btnAddSkill.visible = false;
										break;
									case "d19":
										ui.mcPopup.mcSkillTree.d19.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d19.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d19.btnAddSkill.visible = false;
										break;
									case "d20":
										ui.mcPopup.mcSkillTree.d20.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d20.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d20.btnAddSkill.visible = false;
										break;
									case "d21":
										ui.mcPopup.mcSkillTree.d21.cnt.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d21.bg.transform.colorTransform = color;
										ui.mcPopup.mcSkillTree.d21.btnAddSkill.visible = false;
										break;
									mixer.playSound("Good");
								}
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								mixer.playSound("Bad");
                            };
                            break;
						case "resetSkillTree":
                            if (resObj.bitSuccess == 1){	
								world.myAvatar.objData.intSkillPoints = resObj.SkillPoints;
								ui.mcPopup.mcSkillTree.txtSkillPoints.text = "Remaining Skill Points: " + resObj.SkillPoints;
								
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "green,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								mixer.playSound("Good");
                            } else {
								modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
								mixer.playSound("Bad");
                            };
                            break;
                        case "bankFromInv":
                            if (((("bSuccess" in resObj)) && ((resObj.bSuccess == 1)))){
                                world.myAvatar.bankFromInv(resObj.ItemID);
                                world.checkAllQuestStatus();
                                if (ui.mcPopup.currentLabel == "Bank"){
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshItems"});
                                };
                            }
                            else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "bankToInv":
                            world.myAvatar.bankToInv(resObj.ItemID);
                            world.checkAllQuestStatus();
                            if (ui.mcPopup.currentLabel == "Bank"){
                                MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshItems"});
                            };
                            break;
                        case "bankSwapInv":
                            world.myAvatar.bankSwapInv(resObj.invItemID, resObj.bankItemID);
                            world.checkAllQuestStatus();
                            if (ui.mcPopup.currentLabel == "Bank"){
                                MovieClip(ui.mcPopup.getChildByName("mcBank")).update({eventType:"refreshItems"});
                            };
                            break;
                        case "loadShop":
                            if (((((((((!((world.shopinfo == null))) && (("ShopID" in world.shopinfo)))) && ((world.shopinfo.ShopID == resObj.shopinfo.ShopID)))) && (("bLimited" in world.shopinfo)))) && (world.shopinfo.bLimited))){
                                trace(" >>>> Shop reload detected");
                                i = 0;
                                while (i < resObj.shopinfo.items.length) {
                                    world.shopinfo.items.push(resObj.shopinfo.items[i]);
                                    world.shopinfo.items.shift();
                                    i = (i + 1);
                                };
                                if (ui.mcPopup.currentLabel == "Shop"){
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshItems"});
                                }
                                else {
                                    ui.mcPopup.fOpen("Shop");
                                };
                            }
							else {
                                world.shopinfo = resObj.shopinfo;
                                if (resObj.shopinfo.bHouse == 1){
                                    trace("House Shop");
                                    ui.mcPopup.fOpen("HouseShop");
									}
									else {
										if (resObj.shopinfo.ShopID == -987){
											trace("Forge Shop");
											ui.mcPopup.fOpen("ForgeShop");
											}
											else {
												if (resObj.shopinfo.ShopID == -528){
													trace("Guild Shop");
													ui.mcPopup.fOpen("GuildShop");
													}
													else {
														if (isMergeShop(resObj.shopinfo)){
														ui.mcPopup.fOpen("MergeShop");
														}
														else {
															ui.mcPopup.fOpen("Shop");
												};
											};
										};
									};
								};
                            break;
						case "loadVending":
							if (resObj.bitSuccess){
								trace(" >>>> Vending reload detected");							
                                if (((!((resObj.items == null))) && (!((resObj.items == "undefined"))))){
                                    world.addItemsToVending(resObj.items);
                                };
                                if (ui.mcPopup.currentLabel == "VendingSetup"){
									MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshBank"});
                                    MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshItems"});
                                } else {
									MovieClip(ui.mcPopup.getChildByName("mcVending")).update({eventType:"refreshBank"});                                    
                                };
                            }
                            else {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error loading vending items!  Try logging out and back in to fix this problem.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
						case "loadVendingShop":
							if (resObj.bitSuccess){
								world.myAvatar.vendingReset();
								world.addItemsToVendingShop(resObj.items);
                                if (ui.mcPopup.currentLabel == "VendingShop"){
									MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshItems"});
									MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshBank"});
									MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshInventory"});
									MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshBank"});
                                } else {
                                    ui.mcPopup.fOpen("VendingShop");
                                };
							}
                            break;
						case "loadRefineShop":
                            world.refineShopID = resObj.shopinfo.ShopID;
                            world.refineShopItems = resObj.shopinfo.items;
                            ui.mcPopup.fOpen("EnhShop");
                            break;
                        case "refineItemShop":
                            if (resObj.iCost != null){
                                world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold - Number(resObj.iCost));
                                ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
								
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                };
                                if (ui.mcPopup.currentLabel == "Shop"){
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshCoins"});
                                };
                            };
                            iSel = null;
                            eSel = null;
                            for each (o in world.myAvatar.items) {
                                if (o.ItemID == resObj.ItemID){
                                    iSel = o;
                                };
                            };
							iSel.iRefine = resObj.RefineID;
							iSel.RefineID = resObj.RefineID;
							iSel.RefinePatternID = resObj.RefinePID;
							iSel.RefineLvl = resObj.RefineLvl;
							iSel.RefineDPS = resObj.RefineDPS;
							iSel.RefineRng = resObj.RefineRng;
							iSel.RefineRty = resObj.RefineRty;
														
                            mixer.playSound("Good");
                            if (ui.mcPopup.currentLabel == "Inventory"){
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
                                    eventType:"refreshItems",
                                    sInstruction:"previewEquipOnly"
                                });
                            };
                            if (ui.mcPopup.currentLabel == "Shop"){
                                MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
                                    eventType:"refreshItems",
                                    sInstruction:"closeWindows"
                                });
                            };
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (((((("You have upgraded <b>" + iSel.sName) + "</b> with <b>") + resObj.iRefine) + "</b>, level <b>") + resObj.RefineLvl) + "</b>!");
                            modalO.params = {};
                            modalO.glow = "white,medium";
                            modalO.btns = "mono";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            break;
						case "refineItemLocal":
                            iSel = null;
                            eSel = null;
                            for each (o in world.myAvatar.items) {
                                if (o.ItemID == resObj.ItemID){
                                    iSel = o;
                                };
                            };
							switch (resObj.bitSuccess){
								case 1:
									iSel.Potential = resObj.Potential;
									iSel.iRefine = resObj.RefineTag;
									iSel.RefineID = resObj.RefineID;
									iSel.RefinePatternID = resObj.RefinePID;
									iSel.RefineLvl = resObj.RefineLvl;
									iSel.RefineDPS = resObj.RefineDPS;
									iSel.RefineRng = resObj.RefineRng;
									iSel.RefineRty = resObj.RefineRty;
									mixer.playSound("Good");
									
									if (ui.mcPopup.currentLabel == "Inventory"){
										MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
											eventType:"refreshItems",
											sInstruction:"updateWindows"
										});
									};
									if (ui.mcPopup.currentLabel == "Shop"){
										MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
											eventType:"refreshItems",
											sInstruction:"updateWindows"
										});
									};
									addUpdate("Congratulations, you have succesfully upgraded your equipment.");
									/*
									modal = new ModalMC();
									modalO = {};
									modalO.strBody = ("Congratulations, you have succesfully upgraded your equipment.");
									modalO.params = {};
									modalO.glow = "green,medium";
									modalO.btns = "mono";
									ui.ModalStack.addChild(modal);
									modal.init(modalO);
									*/
									break;
								case 2:
									iSel.Potential = resObj.Potential;
									mixer.playSound("SynthesisBad");
									
									if (ui.mcPopup.currentLabel == "Inventory"){
										MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
											eventType:"refreshItems",
											sInstruction:"updateWindows"
										});
									};
									if (ui.mcPopup.currentLabel == "Shop"){
										MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
											eventType:"refreshItems",
											sInstruction:"updateWindows"
										});
									};
									addUpdate("Potential points has been increased by " + resObj.PointsGain);
									/*
									modal = new ModalMC();
									modalO = {};
									modalO.strBody = ("Failed to refine the Item," + resObj.PointsGain + " potential points has been added to your equipment.");
									modalO.params = {};
									modalO.glow = "red,medium";
									modalO.btns = "mono";
									ui.ModalStack.addChild(modal);
									modal.init(modalO);	
									*/
									break;
								case 3:
									iSel.Potential = resObj.Potential;
									iSel.iRefine = resObj.RefineTag;
									iSel.RefineID = resObj.RefineID;
									iSel.RefinePatternID = resObj.RefinePID;
									iSel.RefineLvl = resObj.RefineLvl;
									iSel.RefineDPS = resObj.RefineDPS;
									iSel.RefineRng = resObj.RefineRng;
									iSel.RefineRty = resObj.RefineRty;
									mixer.playSound("SynthesisGood");
									
									if (ui.mcPopup.currentLabel == "Inventory"){
										MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
											eventType:"refreshItems",
											sInstruction:"updateWindows"
										});
									};
									if (ui.mcPopup.currentLabel == "Shop"){
										MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
											eventType:"refreshItems",
											sInstruction:"updateWindows"
										});
									};
									addUpdate("Congratulations, your weapon has reached its potential state.");
									/*
									modal = new ModalMC();
									modalO = {};
									modalO.strBody = ("Congratulations, your weapon has reached its potential state.");
									modalO.params = {};
									modalO.glow = "gold,medium";
									modalO.btns = "mono";
									ui.ModalStack.addChild(modal);
									modal.init(modalO);
									*/
									break;
								default:
									modal = new ModalMC();
									modalO = {};	
									modalO.strBody = resObj.msg;
									modalO.params = {};
									modalO.glow = "red,medium";
									modalO.btns = "mono";
									ui.ModalStack.addChild(modal);
									modal.init(modalO);
									break;
							}
                            break;
                        case "loadHairShop":
                            world.hairshopinfo = resObj;
                            openCharacterCustomize();
                            break;
                        case "updateGoldCoins":
						    if ("gold" in resObj) {
                                world.myAvatar.objData.intGold = Number(resObj.gold);		
								ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
                            }	
							
							if ("silver" in resObj) {
                                world.myAvatar.objData.intSilver = Number(resObj.silver);		
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
                            }	
							
							if ("copper" in resObj) {
                                world.myAvatar.objData.intCopper = Number(resObj.copper);		
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
                            }	

							if ("coins" in resObj) {
                                world.myAvatar.objData.intCoins = Number(resObj.coins);		
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
                            }			

                            if (ui.mcPopup.currentLabel == "Inventory"){
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                            };					

                            if (ui.mcPopup.currentLabel == "MergeShop" || ui.mcPopup.currentLabel == "Shop") {
                                MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshCoins"});
                            }
                            mixer.playSound("Coins");							
                            break;
                        case "buyItem":
                            if (resObj.CharItemID == -1){
                                if (((("bSoldOut" in resObj)) && (resObj.bSoldOut))){
                                    if (world.shopinfo.bLimited){
                                        MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
                                            eventType:"refreshShop",
                                            sInstruction:"closeWindows"
                                        });
                                    };
                                    modal = new ModalMC();
                                    modalO = {};
                                    modalO.strBody = (resObj.strMessage + " is no longer in stock.");
                                    modalO.params = {};
                                    modalO.glow = "red,medium";
                                    modalO.btns = "mono";
                                    ui.ModalStack.addChild(modal);
                                    modal.init(modalO);
                                }
                                else {
                                    if (resObj.strMessage != null){
                                        MsgBox.notify(resObj.strMessage);
                                    };
                                };
                            }
                            else {
                                item = copyObj(world.shopBuyItem);
                                item.CharItemID = resObj.CharItemID;
                                if (item.bCoins == 0 && item.bSilver == 0 && item.bCopper == 0){
                                    world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold - Number(item.iCost));
                                    ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
									ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
									ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
									ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
									
                                    if (ui.mcPopup.currentLabel == "Inventory"){
                                        MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                    };
                                } else if (item.bCoins == 0 && item.bSilver == 0){
									world.myAvatar.objData.intCopper = (world.myAvatar.objData.intCopper - Number(item.iCost));
									ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
									ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
									ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
									ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
								
									if (ui.mcPopup.currentLabel == "Inventory"){
                                        MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                    };
								} else if (item.bCoins == 0 && item.bCopper == 0){
									world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver - Number(item.iCost));
									ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
									ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
									ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
									ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
								
									if (ui.mcPopup.currentLabel == "Inventory"){
                                        MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                    };
								} else if (item.bSilver == 0 && item.bCopper == 0){
									world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - Number(item.iCost));
									ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
									ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
									ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
									ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
								
									if (ui.mcPopup.currentLabel == "Inventory"){
                                        MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                    };
								} else {
                                    item.iHrs = 0;
                                    world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - Number(item.iCost));
									ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
                                };
                                showItemDrop(item, false);
                                if (world.invTree[item.ItemID] == null){
                                    world.invTree[item.ItemID] = copyObj(resObj);
                                    world.invTree[item.ItemID].iQty = 0;
                                };
                                world.myAvatar.addItem(item);
                                if (item.bHouse == 1){
                                    if ((((item.sType == "House")) && (!(world.isHouseEquipped())))){
                                        world.sendEquipItemRequest(item);
                                        world.myAvatar.getItemByID(item.ItemID).bEquip = 1;
                                    };
                                    ui.mcPopup.mcHouseShop.reset();
                                }
                                else {
                                    if (ui.mcPopup.currentLabel == "Shop"){
                                        MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshCoins"});
                                        MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
                                            eventType:"refreshItems",
                                            sInstruction:"closeWindows"
                                        });
                                        if (world.shopinfo.bLimited){
                                            MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshShop"});
                                        };
                                    }
                                    else {
                                        if (ui.mcPopup.currentLabel == "MergeShop"){
                                            MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshCoins"});
                                            MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshItems"});
                                        }
                                        else {
                                            if (ui.mcPopup.currentLabel == "Inventory"){
                                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
                                                    eventType:"refreshItems",
                                                    sInstruction:"closeWindows"
                                                });
                                            };
                                        };
                                    };
                                };
                                world.updateQuestProgress("item", item);
                            };
                            break;
                        case "sellItem":
                            world.myAvatar.removeItem(resObj.CharItemID);
                            if (resObj.bCoins == 1){
                                world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins + resObj.intAmount);
								ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
							} else if (resObj.bSilver == 1){
								world.myAvatar.objData.intSilver = (world.myAvatar.objData.intSilver + resObj.intAmount);
								ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
							} else if (resObj.bCopper == 1){
								world.myAvatar.objData.intCopper = (world.myAvatar.objData.intCopper + resObj.intAmount);
								ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
                            } else {
                                world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + resObj.intAmount);
								ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
                            };
                            if (ui.mcPopup.currentLabel == "Shop"){
                                MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshCoins"});
                                MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
                                    eventType:"refreshItems",
                                    sInstruction:"closeWindows"
                                });
                            }
                            else {
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
                                        eventType:"refreshItems",
                                        sInstruction:"closeWindows"
                                    });
                                }
                                else {
                                    if (ui.mcPopup.currentLabel == "HouseShop"){
                                        MovieClip(ui.mcPopup.getChildByName("mcHouseShop")).reset();
                                    };
                                };
                            };
                            world.checkAllQuestStatus();
                            break;
						case "buyVendingItem":
							 if (resObj.bitSuccess) {
	                            item = resObj.item;
                                item.CharItemID = resObj.CharItemID;
								
                                showItemDrop(item, false);
                                if (world.invTree[item.ItemID] == null){
                                    world.invTree[item.ItemID] = copyObj(resObj);
                                };								
								
                                world.myAvatar.vendingShopToInv(item.VendingID, item.ItemID);

								MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshItems"});
								MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshBank"});
								MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshInventory"});
								MovieClip(ui.mcPopup.getChildByName("mcVendingShop")).update({eventType:"refreshCoins"});
								
                                world.updateQuestProgress("item", item);
							} else {
                                MsgBox.notify(resObj.strMessage);
							}
                            break;
                        case "removeItem":
                            if (resObj.iQty != null){
                                world.myAvatar.removeItem(resObj.CharItemID, resObj.iQty);
                            }
                            else {
                                world.myAvatar.removeItem(resObj.CharItemID);
                            };
                            if (ui.mcPopup.currentLabel == "Inventory"){
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshItems"});
                            };
                            world.checkAllQuestStatus();
                            break;
                        case "updateClass":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (((!((avt == null))) && (!((avt.objData == null))))){
                                avt.objData.strClassName = resObj.sClassName;
                                avt.objData.iCP = resObj.iCP;
                                avt.objData.sClassCat = resObj.sClassCat;
                                avt.updateRep();
                                if (resObj.uid == sfc.myUserId){
                                    if (("sDesc" in resObj)){
                                        avt.objData.sClassDesc = resObj.sDesc;
                                    };
                                    if (("sStats" in resObj)){
                                        avt.objData.sClassStats = resObj.sStats;
                                    };
                                    if (("aMRM" in resObj)){
                                        avt.objData.aClassMRM = resObj.aMRM;
                                    };
                                };
                            };
                            break;
                        case "equipItem":
                            avt = world.getAvatarByUserID(resObj.uid);
                            tLeaf = world.getUoLeafById(resObj.uid);
                            if (avt != null){
                                if (((!((avt.pMC == null))) && (!((avt.objData == null))))){
                                    avt.objData.eqp[resObj.strES] = {};
                                    avt.objData.eqp[resObj.strES].sFile = (((resObj.sFile)=="undefined") ? "" : resObj.sFile);
                                    avt.objData.eqp[resObj.strES].sLink = resObj.sLink;
                                    if (("sType" in resObj)){
                                        avt.objData.eqp[resObj.strES].sType = resObj.sType;
                                    };
                                    if (("ItemID" in resObj)){
                                        avt.objData.eqp[resObj.strES].ItemID = resObj.ItemID;
                                    };
                                    if (("sMeta" in resObj)){
                                        avt.objData.eqp[resObj.strES].sMeta = resObj.sMeta;
                                    };
									if (("sName" in resObj)){
										avt.objData.eqp[resObj.strES].sName = resObj.sName;
									};
									if (("iQty" in resObj)){
										avt.objData.eqp[resObj.strES].iQty = resObj.iQty;
									};
									if (("Level" in resObj)){
										avt.objData.eqp[resObj.strES].Level = resObj.Level;
									};
                                    avt.loadMovieAtES(resObj.strES, resObj.sFile, resObj.sLink);
                                };
                                if (avt.isMyAvatar){
                                    avt.equipItem(resObj.ItemID);
                                    if (MovieClip(ui.mcPopup.getChildByName("mcInventory")) != null){
                                        MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshItems"});
                                    };
                                    if (ui.mcPopup.mcTempInventory != null){
                                        ui.mcPopup.mcTempInventory.mcItemList.refreshList();
                                        ui.mcPopup.mcTempInventory.refreshDetail();
                                    };
                                };
                            };
                            break;
                        case "unequipItem":
							trace("HERE");
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (avt != null){
                                if (avt.pMC != null){
                                    delete avt.objData.eqp[resObj.strES];
                                    avt.unloadMovieAtES(resObj.strES);
                                };
                                if (avt.isMyAvatar){
                                    avt.unequipItem(resObj.ItemID);
                                    if (ui.mcPopup.currentLabel == "Inventory"){
                                        MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshItems"});
                                    };
									if(resObj.strES == "pe"){
										ui.mcPetPortrait.visible = false;
									};
                                    if (ui.mcPopup.mcTempInventory != null){
                                        ui.mcPopup.mcTempInventory.mcItemList.refreshList();
                                        ui.mcPopup.mcTempInventory.refreshDetail();
                                    };
                                };
                            };
                            break;
                        case "dropItem":
                            for (dID in resObj.items) {
                                dItem = null;
                                if (world.invTree[dID] == null){
                                    world.invTree[dID] = copyObj(resObj.items[dID]);
                                    world.invTree[dID].iQty = 0;
                                    dItem = resObj.items[dID];
                                }
                                else {
                                    dItem = copyObj(world.invTree[dID]);
                                    dItem.iQty = int(resObj.items[dID].iQty);
                                };
								
                                if (resObj.Wheel != null){
                                    try {
                                        world.map.doWheelDrop(dItem);
                                    }
                                    catch(e) {
                                    };
                                }
                                else {
								    if (!("addItem" in resObj)){
                                        showItemDrop(dItem, true);
									}
                                };
                            };
                            break;
						case "redeemCode":
							if(resObj.items) {
								for (dID in resObj.items) {
									dItem = null;
									if (world.invTree[dID] == null){
										world.invTree[dID] = copyObj(resObj.items[dID]);
										world.invTree[dID].iQty = 0;
										dItem = resObj.items[dID];
									} else {
										dItem = copyObj(world.invTree[dID]);
										dItem.iQty = int(resObj.items[dID].iQty);
									}

									showItemDrop(dItem, true);
								}
							}
							
							if (resObj.bCoins == 1){
                                world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins + resObj.intAmount);
		                        //ui.mcPortrait.strCoins.text = (world.myAvatar.objData.intCoins);
								ui.mcInterface.mcGold.strCoins.text = (world.myAvatar.objData.intCoins);
                            } else {
								world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + resObj.intAmount)
								//ui.mcPortrait.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strGold.text = (world.myAvatar.objData.intGold);
								
								gold = new goldDisplay();
                                gold.t.ti.text = (resObj.intAmount + " g");
                                gold.tMask.ti.text = (resObj.intAmount + " g");
								gold.x = world.myAvatar.pMC.mcChar.x;
								gold.y = (world.myAvatar.pMC.pname.y - 30);
								world.myAvatar.pMC.addChild(gold);
							}
							
							if(resObj.intAmount > 0) {
								mixer.playSound("Coins");
							}
							
							MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
							break;
                        case "referralReward":
                            for (dID in resObj.items) {
                                dItem = null;
                                if (world.invTree[dID] == null){
                                    world.invTree[dID] = copyObj(resObj.items[dID]);
                                    world.invTree[dID].iQty = 0;
                                    dItem = resObj.items[dID];
                                }
                                else {
                                    dItem = copyObj(world.invTree[dID]);
                                    dItem.iQty = int(resObj.items[dID].iQty);
                                };
                            };
                            dropItem = new DFrameMC(dItem);
                            ui.dropStack.addChild(dropItem);
                            dropItem.init();
                            dropItem.fY = (dropItem.y = -((dropItem.fHeight + 8)));
                            dropItem.fX = (dropItem.x = -((dropItem.fWidth / 2)));
                            cleanDropStack();
                            break;
                        case "getDrop":
                            i = 0;
                            while (i < ui.dropStack.numChildren) {
                                mc = (ui.dropStack.getChildAt(i) as MovieClip);
                                if (((!((mc.fData == null))) && ((mc.fData.ItemID == resObj.ItemID)))){
                                    if (resObj.bSuccess == 1){
                                        mc.gotoAndPlay("out");
                                    }
                                    else {
                                        modal = new ModalMC();
                                        modalO = {};
                                        modalO.strBody = "Item could not be added to your inventory! Please make sure your inventory is not full or the item is already present in your inventory/bank.";
                                        modalO.params = {};
                                        modalO.glow = "red,medium";
                                        modalO.btns = "mono";
                                        ui.ModalStack.addChild(modal);
                                        modal.init(modalO);
                                        mc.cnt.ybtn.mouseEnabled = true;
                                        mc.cnt.ybtn.mouseChildren = true;
                                    };
                                };
                                i = (i + 1);
                            };
                            if (resObj.bSuccess == 1){
                                dropitem = copyObj(world.invTree[resObj.ItemID]);
								trace(">> " + resObj.CharItemID);								
                                dropitem.CharItemID = resObj.CharItemID;
                                dropitem.bBank = resObj.bBank;
                                dropitem.iQty = int(resObj.iQty);
                                if (resObj.RefineID != null){
                                    dropitem.RefineID = int(resObj.RefineID);
                                    dropitem.RefineLvl = int(resObj.RefineLvl);
                                    dropitem.RefinePatternID = int(resObj.RefinePatternID);
                                    dropitem.RefineRty = int(resObj.RefineRty);
                                };
								if (resObj.ElementID != null){
                                    dropitem.ElementID = int(resObj.ElementID);
                                };
                                world.myAvatar.addItem(dropitem);
                                world.updateQuestProgress("item", dropitem);
                                if (resObj.showDrop == 1){
                                    showItemDrop(dropitem, false);
                                };
                                if (ui.mcPopup.currentLabel == "Inventory"){
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshItems"});
                                };
                                if ((((ui.mcPopup.currentLabel == "Shop")) || ((ui.mcPopup.currentLabel == "MergeShop")) || ((ui.mcPopup.currentLabel == "ForgeShop")) || ((ui.mcPopup.currentLabel == "GuildShop")))){
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({eventType:"refreshItems"});
                                };
                            };
                            break;
                        case "addItems":
                            for (ItemID in resObj.items) {
                                if (world.invTree[ItemID] == null){
                                    itemObj = copyObj(resObj.items[ItemID]);
                                }
                                else {
                                    itemObj = copyObj(world.invTree[ItemID]);
                                    itemObj.iQty = int(resObj.items[ItemID].iQty);
                                };
                                showItemDrop(itemObj, true);
                                world.myAvatar.addTempItem(itemObj);
                                world.updateQuestProgress("item", itemObj);
                                if (itemObj.sMeta == "doUpdate"){
                                    try {
                                        world.map.doUpdate();
                                    }
                                    catch(e) {
                                    };
                                };
                            };
                            break;
                        case "Wheel":
                            if (resObj.iQty2 > 0) {
                                dropItem = copyObj(resObj.dropItems["18927"]);
                                dropItem.CharItemID = resObj.charItem1;
                                if (world.invTree["18927"] == null){
                                    dropItem.bBank = 0;
                                };
                                trace(("dropQty: " + resObj.dropQty));
                                dropItem.iQty = (((resObj.dropQty)!=null) ? Number(resObj.dropQty) : 1);
                                world.myAvatar.addItem(dropItem);
                            }                            
                            if (resObj.iQty1 > 0) {
                                dropItem = copyObj(resObj.dropItems["19189"]);
                                dropItem.CharItemID = resObj.charItem2;
                                if (world.invTree["19189"] == null){
                                    dropItem.bBank = 0;
                                };
                                dropItem.iQty = 1;
                                world.myAvatar.addItem(dropItem);
                            }
                            if (resObj.Item != null){
                                dropItem = copyObj(resObj.Item);
                                dropItem.CharItemID = resObj.CharItemID;
                                dropItem.bBank = 0;
                                dropItem.iQty = 1;
                                world.myAvatar.addItem(dropItem);
                            };
                            if (ui.mcPopup.currentLabel == "Inventory"){
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshItems"});
                            };
                            try {
                                //world.map.doWheelDrop(resObj.Item, resObj.dropQty);
                                world.map.doWheelDrop(resObj.Item);
                            }
                            catch(e) {
                                trace(("error in wheel function: " + e));
                            };
                        case "powerGem":
                            for (ItemID in resObj.items) {
                                if (world.invTree[ItemID] == null){
                                    itemObj = copyObj(resObj.items[ItemID]);
                                }
                                else {
                                    itemObj = copyObj(world.invTree[ItemID]);
                                    itemObj.iQty = int(resObj.items[ItemID].iQty);
                                };
                                showItemDrop(itemObj, false);
                                world.myAvatar.addItem(itemObj);
                            };
                            break;
                        case "forceAddItem":
                            for (fi in resObj.items) {
                                iobj = copyObj(resObj.items[fi]);
                                world.myAvatar.addItem(iobj);
                            };
                            break;
                        case "warvalues":
                            world.map.updateWarValues(resObj.wars);
                            break;
                        case "refinep":
                            for each (o in resObj.o) {
                                world.refinePatternTree[o.ID] = o;
                            };
                            break;
                        case "turnIn":
                            if (((!((resObj.sItems == null))) && ((resObj.sItems.length >= 3)))){
                                itemArr = resObj.sItems.split(",");
                                dropindex = 0;
                                while (dropindex < itemArr.length) {
                                    dropID = itemArr[dropindex].split(":")[0];
                                    dropQty = int(itemArr[dropindex].split(":")[1]);
                                    if (world.invTree[dropID].bTemp == 0){
									    trace("Removing item: " + dropID + ", Quantity: " + dropQty);
                                        world.myAvatar.removeItemByID(dropID, dropQty);
                                    }
                                    else {
                                        world.myAvatar.removeTempItem(dropID, dropQty);
                                    };
                                    dropindex = (dropindex + 1);
                                };
                            };
                            if (ui.mcPopup.currentLabel == "Inventory"){
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshItems"});
                            };
                            break;
                        case "getQuest":
                            break;
                        case "getQuests":
                            for (qi in resObj.quests) {
                                if (world.questTree[qi] == null){
                                    o = resObj.quests[qi];
                                    world.questTree[qi] = o;
                                    for (qr in o.oReqd) {
                                        if (world.invTree[qr] == null){
                                            world.invTree[qr] = o.oReqd[qr];
                                            world.invTree[qr].iQty = 0;
                                        };
                                    };
                                    for (qj in o.oItems) {
                                        if (world.invTree[qj] == null){
                                            world.invTree[qj] = o.oItems[qj];
                                            world.invTree[qj].iQty = 0;
                                        };
                                    };
                                    qk = "";
                                    qat = ["itemsS", "itemsC", "itemsR", "itemsrand"];
                                    i = 0;
                                    while (i < qat.length) {
                                        s = qat[i];
                                        if (o.oRewards[s] != null){
                                            for (ri in o.oRewards[s]) {
                                                if (isNaN(ri)){
                                                    qk = ri.ItemID;
                                                }
                                                else {
                                                    qk = o.oRewards[s][ri].ItemID;
                                                };
                                                if (world.invTree[qk] == null){
                                                    world.invTree[qk] = copyObj(o.oRewards[s][ri]);
                                                    world.invTree[qk].iQty = 0;
                                                };
                                            };
                                        };
                                        i = (i + 1);
                                    };
                                };
                            };
                            if (ui.ModalStack.numChildren > 0){
                                MovieClip(ui.ModalStack.getChildAt(0)).open();
                            };
                            break;
                        case "ccqr":
                            if (resObj.bSuccess == 0){
                                MsgBox.notify("Quest Complete Failed!");
                            }
                            else {
                                if (("eventTrigger" in MovieClip(world.map))){
                                    world.map.eventTrigger({
                                        cmd:"questComplete",
                                        args:resObj.QuestID
                                    });
                                };
                                world.completeQuest(resObj.QuestID);
                                if (ui.ModalStack.numChildren){
                                    fgWin = ui.ModalStack.getChildAt(0);
                                    if (((!((fgWin == null))) && ((fgWin.toString().indexOf("QFrameMC") > -1)))){
                                        fgWin.turninResult(resObj.QuestID);
                                    };
                                };
                                showQuestpopup(resObj);
                            };
                            break;
                        case "updateQuest":
                            world.setQuestValue(resObj.iIndex, resObj.iValue);
							showMenuButton();
                            break;
                        case "showQuestLink":
                            world.showQuestLink(resObj);
                            break;
                        case "dailylogin":
                            break;
                        case "initMonData":
                            for (m in resObj.mon) {
                                world.updateMonster(resObj.mon[m]);
                            };
                            break;
                        case "aura+":
                        case "aura*":
                        case "aura-":
                        case "aura--":
                        case "aura++":
                        case "aura+p":
                            world.handleAuraEvent(cmd, resObj);
                            break;
                        case "clearAuras":
                            tAvt = world.myAvatar;
                            tLeaf = tAvt.dataLeaf;
                            world.showAuraChange({
                                cmd:"aura-",
                                auras:tLeaf.auras
                            }, tAvt, tLeaf);
                            tLeaf.auras = [];
                            break;
                        case "uotls":
                            userTreeWrite(resObj.unm.toLowerCase(), resObj.o);
                            break;
                        case "mtls":
                            monsterTreeWrite(resObj.id, resObj.o, resObj.targets);
                            break;
                        case "cb":
                            if (resObj.m != null){
                                for (updateID in resObj.m) {
                                    monsterTreeWrite(int(updateID), resObj.m[updateID]);
                                };
                            };
                            if (resObj.p != null){
                                for (updateID in resObj.p) {
                                    userTreeWrite(updateID.toLowerCase(), resObj.p[updateID]);
                                };
                            };
                            if (resObj.anims != null){
                                if (sfcSocial){
                                    for each (o in resObj.anims) {
                                        if (resObj.isProc){

                                            doAnim(o, resObj.isProc);
                                        }
                                        else {
                                            doAnim(o);
                                        };
                                    };
                                };
                            };
                            if (resObj.a != null){
                                i = 0;
                                while (i < resObj.a.length) {
                                    world.handleAuraEvent(resObj.a[i].cmd, resObj.a[i]);
                                    i = (i + 1);
                                };
                            };
                            break;
                        case "ct":
                            anim = new Object();
                            if (resObj.m != null){
                                for (updateID in resObj.m) {
                                    monsterTreeWrite(int(updateID), resObj.m[updateID]);
                                };
                            };
                            if (resObj.p != null){
                                for (updateID in resObj.p) {
                                    userTreeWrite(updateID.toLowerCase(), resObj.p[updateID]);
                                };
                            };
                            if (resObj.a != null){
                                j = 0;
                                while (j < resObj.a.length) {
                                    try {
                                        k = 0;
                                        while (k < resObj.a[j].auras.length) {
                                            if (resObj.a[j].auras[k].spellOn != null){
                                                anim[resObj.a[j].auras[k].spellOn] = resObj.a[j].auras[k].dur;
                                            };
                                            k = (k + 1);
                                        };
                                    }
                                    catch(e) {
                                    };
                                    world.handleAuraEvent(resObj.a[j].cmd, resObj.a[j]);
                                    j = (j + 1);
                                };
                            };
                            if (resObj.sara != null){
                                for each (o in resObj.sara) {
                                    world.handleSAR(o);
                                };
                            };
                            if (resObj.sarsa != null){
                                for each (o in resObj.sarsa) {
                                    world.handleSARS(o);
                                };
                            };
                            if (resObj.anims != null){
                                if (sfcSocial){
                                    for each (o in resObj.anims) {
                                        trace(anim[o.strl]);
                                        if (resObj.isProc){
                                            doAnim(o, resObj.isProc, anim[o.strl]);
                                        }
                                        else {
                                            doAnim(o, false, anim[o.strl]);
                                        };
                                    };
                                };
                            };
                            if (resObj.pvp != null){
                                switch (resObj.pvp.cmd){
                                    case "PVPS":
                                        updatePVPScore(resObj.pvp.pvpScore);
                                        break;
                                    case "PVPC":
                                        world.PVPResults.pvpScore = resObj.pvp.pvpScore;
                                        world.PVPResults.team = resObj.pvp.team;
                                        updatePVPScore(resObj.pvp.pvpScore);
                                        togglePVPPanel("results");
                                        break;
                                };
                            };
                            break;
                        case "sar":
                            world.handleSAR(resObj);
                            break;
                        case "sars":
                            world.handleSARS(resObj);
                            break;
                        case "showAuraResult":
                            world.showAuraImpact(resObj);
                            break;
                        case "anim":
                            if (sfcSocial){
                                doAnim(resObj);
                            };
                            break;
                        case "sAct":
                            world.actions = {};
                            world.actions.active = [];
							world.actions.tree = [];
                            world.actions.passive = [];
							//world.actions.unused = [];
                            world.actionMap = [null, null, null, null, null, null, null, null, null, null, null, null, null];
                            blanki = 0;
							/* NO USE */
                            while (blanki < 12) {
                                ui.mcInterface.actBar.getChildByName(("blank" + blanki)).visible = true;
                                actBar = ui.mcInterface.actBar;
                                delIcon = actBar.getChildByName(("i" + (blanki + 1)));
                                if (delIcon != null){
                                    delIcon.removeEventListener(MouseEvent.CLICK, actIconClick);
                                    delIcon.removeEventListener(MouseEvent.MOUSE_OVER, actIconOver);
                                    delIcon.removeEventListener(MouseEvent.MOUSE_OUT, actIconOut);
                                    if (delIcon.icon2 != null){
                                        delIcon.removeEventListener(Event.ENTER_FRAME, world.countDownAct);
                                        if (delIcon.icon2.mask != null){
                                            actBar.removeChild(delIcon.icon2.mask);
                                            delIcon.icon2.mask = null;
                                        };
                                        actBar.removeChild(delIcon.icon2);
                                    };
                                    actBar.removeChild(delIcon);
                                };
                                blanki = (blanki + 1);
                            };
							/* */
                            ai = 0;
                            slot = 0;
                            while (ai < 10) {//resObj.actions.active.length
                                actObj = resObj.actions.active[ai];
								if(resObj.actions.active[ai] != null){
									trace("HUE");
									actObj.sArg1 = "";
									actObj.sArg2 = "";
									world.actions.active.push(actObj);
									actObj.ts = 0;
									actObj.actID = -1;
									actObj.lock = false;
									world.actionMap[ai] = actObj.ref;
									actIconClass = (getDefinitionByName("ib2") as Class);
									actIcon = new (actIconClass)();
									actIconMC = ui.mcInterface.actBar.addChild(actIcon);
									//slot = (((ai)<(resObj.actions.active.length - 1)) ? ai : 11);
									//blankMC = ui.mcInterface.actBar.getChildByName(("blank" + slot));
									blankMC = ui.mcInterface.actBar.getChildByName(("blank" + (actObj.slot - 1)));
									actIconMC.x = blankMC.x;
									actIconMC.width = 42;
									actIconMC.height = 39;
									actIconMC.name = String(("i" + (ai + 1)));
									actIconMC.actionIndex = ai;
									actIconMC.actObj = actObj;
									actIconMC.icon2 = null;
									actIconMC.tQty.visible = false;
									updateIcons([actIconMC], actObj.icon.split(","), null);
									blankMC.visible = false;
									actIconMC.addEventListener(MouseEvent.MOUSE_OVER, actIconOver, false, 0, true);
									actIconMC.addEventListener(MouseEvent.MOUSE_OUT, actIconOut, false, 0, true);
									actIconMC.mouseChildren = false;
									
									if (actObj.isOK){
										actIconMC.addEventListener(MouseEvent.CLICK, actIconClick, false, 0, true);
										actIconMC.buttonMode = true;
									} else {
										c = new Color();
										c.setTint(0x333333, 0.9);
										actIconMC.cnt.transform.colorTransform = c;
									};
									ai = (ai + 1);
								} else {
									ai = (ai + 1);
								}
                            };
							ai = 0;
                            slot = 0;
							world.myAvatar.dataLeaf.tree = [];
                            while (ai < 66) {//resObj.actions.active.length
                                actObj = resObj.actions.tree[ai];
								if(resObj.actions.tree[ai] != null){
									trace(actObj.nam);
									actObj.sArg1 = "";
									actObj.sArg2 = "";
									world.actions.tree.push(actObj);
									actObj.ts = 0;
									actObj.actID = -1;
									actObj.lock = false;
									ai = (ai + 1);
								} else {
									ai = (ai + 1);
								}
                            };
							/*
							world.myAvatar.dataLeaf.unused = [];
                            if (resObj.actions.unused != null){
                                ai = 0;
                                while (ai < resObj.actions.unused.length) {
                                    actObj = copyObj(resObj.actions.unused[ai]);
                                    actObj.sArg1 = "";
                                    actObj.sArg2 = "";
                                    world.actions.unused.push(actObj);
                                    ai = (ai + 1);
                                };
                            };*/
                            world.myAvatar.dataLeaf.passives = [];
                            if (resObj.actions.passive != null){
                                ai = 0;
                                while (ai < resObj.actions.passive.length) {
                                    actObj = copyObj(resObj.actions.passive[ai]);
                                    actObj.sArg1 = "";
                                    actObj.sArg2 = "";
                                    world.actions.passive.push(actObj);
                                    if (actObj.auras != null){
                                        i = 0;
                                        while (i < actObj.auras.length) {
                                            world.myAvatar.dataLeaf.passives.push(actObj.auras[i]);
                                            i = (i + 1);
                                        };
                                    };
                                    ai = (ai + 1);
                                };
                            };
                            break;
                        case "seia":
                            if (resObj.iRes == 1){
                                ai = 0;
                                while (ai < world.actions.active.length) {
                                    o = world.actions.active[ai];
                                    if (o.ref == "i1"){
                                        if (("tgtMax" in o)){
                                            delete o.tgtMax;
                                        };
                                        if (("tgtMin" in o)){
                                            delete o.tgtMin;
                                        };
                                        if (("auras" in o)){
                                            delete o.auras;
                                        };
                                        if (o.OldCD == null){
                                            o.OldCD = o.cd;
                                        };
                                        for (s in resObj.o) {
                                            if (((((((!((s == "nam"))) && (!((s == "ref"))))) && (!((s == "desc"))))) && (!((s == "typ"))))){
                                                o[s] = resObj.o[s];
                                            };
                                        };
                                    };
                                    ai = (ai + 1);
                                };
                            };
                            break;
                        case "stu":
                            avt = world.myAvatar;
                            unm = sfc.myUserName;
                            uoLeaf = world.uoTreeLeaf(unm);
                            if (resObj.wDPS != null){
                                uoLeaf.wDPS = resObj.wDPS;
                            };
                            if (resObj.mDPS != null){
                                uoLeaf.mDPS = resObj.mDPS;
                            };
                            if (uoLeaf.sta == null){
                                uoLeaf.sta = {};
                            };
                            for (stuS in resObj.sta) {
                                uoLeaf.sta[stuS] = resObj.sta[stuS];
                                if (stats.indexOf(stuS.substr(1)) > -1){
                                    uoLeaf.sta[stuS] = int(uoLeaf.sta[stuS]);
                                }
                                else {
                                    uoLeaf.sta[stuS] = Number(uoLeaf.sta[stuS]);
                                };
                                if (stuS.toLowerCase().indexOf("$tha") > -1){
                                    actObj = world.getAutoAttack();
                                    if (((((!((actObj == null))) && (!((uoLeaf == null))))) && (!((uoLeaf.sta == null))))){
                                        cd = Math.round((actObj.cd * (1 - Math.min(Math.max(uoLeaf.sta.$tha, -1), 0.5))));
                                        if (world.autoActionTimer.running){
                                            world.autoActionTimer.delay = (world.autoActionTimer.delay - (world.autoActionTimer.delay - cd));
                                            world.autoActionTimer.delay = (world.autoActionTimer.delay + 100);
                                            world.autoActionTimer.reset();
                                            world.autoActionTimer.start();
                                        }
                                        else {
                                            world.autoActionTimer.delay = cd;
                                        };
                                    }
                                    else {
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("Login event order error");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                    };
                                    hasteCoeff = (1 - Math.min(Math.max(uoLeaf.sta.$tha, -1), 0.5));
                                    world.GCD = Math.round((hasteCoeff * world.GCDO));
                                    for each (actObj in world.actions.active) {
                                        if (((((((actObj.isOK) && (!((world.getActIcons(actObj)[0] == null))))) && ((world.getActIcons(actObj)[0].icon2 == null)))) && (((now - actObj.ts) < (actObj.cd * hasteCoeff))))){
                                            world.coolDownAct(actObj, ((actObj.cd * hasteCoeff) - (now - actObj.ts)), now);
                                        };
                                    };
                                };
                                if (stuS.toLowerCase().indexOf("$cmc") > -1){
                                    world.updateActBar();
                                };
                            };
                            if (resObj.tempSta != null){
                                uoLeaf.tempSta = resObj.tempSta;
                                if (("updatePStats" in world.map)){
                                    world.map.updatePStats();
                                };
                            };
                            if (avt != null){
                                world.updatePortrait(avt);
                            };
                            break;
                        case "cvu":
                            updateCoreValues(resObj.o);
                            break;
                        case "event":
                            world.map.eventTrigger(resObj);
                            break;
                        case "modinfo":
                            world.map.showModInfo(resObj);
                            break;
                        case "modinc":
                            if (resObj.bSuccess){
                                world.map.hideLoading();
                                world.map.show(resObj.events);
                                world.modID = int(resObj.mID);
                            }
                            else {
                                chatF.pushMsg("warning", resObj.msg, "SERVER", "", 0);
                            };
                            break;
                        case "ia":
                            if (!("iaPathMC" in resObj)){
                                mc = MovieClip(world.CHARS.getChildByName(resObj.oName));
                            }
                            else {
                                try {
                                    mc = world;
                                    mcPath = resObj.iaPathMC.split(".");
                                    while (mcPath.length > 0) {
                                        s = String(mcPath.shift());
                                        if (mc.getChildByName(s) != null){
                                            mc = (mc.getChildByName(s) as MovieClip);
                                        }
                                        else {
                                            mc = mc[s];
                                        };
                                    };
                                }
                                catch(e:Error) {
                                };
                            };
                            if (((!((mc == null))) && (!((mc == world))))){
                                try {
                                    switch (resObj.typ){
                                        case "rval":
                                            mc.userName = resObj.unm;
                                            mc.iaF(resObj);
                                            break;
                                        case "str":
                                            mc.userName = resObj.unm;
                                            mc.iaF(resObj);
                                            break;
                                        case "flourish":
                                            mc.userName = resObj.unm;
                                            mc.gotoAndPlay(resObj.oFrame);
                                            break;
                                    };
                                }
                                catch(e:Error) {
                                };
                            };
                            break;
                        case "siau":
                            world.updateCellMap(resObj);
                            break;
                        case "umsg":
                            addUpdate(resObj.s);
                            break;
						case "usmsg":
                            addSystemUpdate(resObj.s);
                            break;
                        case "gi":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (((resObj.owner + " has invited you to join the guild ") + resObj.gName) + ". Do you accept?");
                            modalO.callback = world.doGuildAccept;
                            modalO.params = {
                                guildID:resObj.guildID,
                                owner:resObj.owner
                            };
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", ((resObj.owner + " has invited you to join the guild ") + resObj.gName), "SERVER", "", 0);
                            break;
						case "wib":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has invited you in a wedding as a Bride Do you accept?");
                            modalO.callback = world.doGuildAccept;
                            modalO.params = {
                                owner:resObj.owner
                            };
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has invited you in a wedding as a Bride Do you accept?"), "SERVER", "", 0);
                            break;
						case "wig":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has invited you in a wedding as a Groom Do you accept?");
                            modalO.callback = world.doGuildAccept;
                            modalO.params = {
                                owner:resObj.owner
                            };
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has invited you in a wedding as a Groom Do you accept?"), "SERVER", "", 0);
                            break;
						case "wii":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has invited you in a wedding as a Guest Do you accept?");
                            modalO.callback = world.doGuildAccept;
                            modalO.params = {
                                owner:resObj.owner
                            };
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has invited you in a wedding as a Guest Do you accept?"), "SERVER", "", 0);
                            break;
						case "wid":
                            chatF.pushMsg("server", (resObj.unm + " has declined your invitation."), "SERVER", "", 0);
                            break;
						case "wia":
                            avt = world.getAvatarByUserName(resObj.unm);
                            if (avt != null){
                                if (avt.isMyAvatar){
                                    chatF.pushMsg("server", "You have joined the wedding.", "SERVER", "", 0);
                                } else {
                                    chatF.pushMsg("server", (avt.pnm + " has joined the wedding."), "SERVER", "", 0);
                                };
                            } else {
								chatF.pushMsg("server", (avt.pnm + " has joined the wedding."), "SERVER", "", 0);
                            };
                            break;
                        case "gd":
                            chatF.pushMsg("server", (resObj.unm + " has declined your invitation."), "SERVER", "", 0);
                            break;
                        case "ga":
                            avt = world.getAvatarByUserName(resObj.unm);
                            if (avt != null){
                                avt.updateGuild(resObj.guild);
                                if (avt.isMyAvatar){
                                    chatF.chn.guild.act = 1;
                                    chatF.pushMsg("server", "You have joined the guild.", "SERVER", "", 0);
                                }
                                else {
                                    if (world.myAvatar.objData.guild.Name == avt.objData.guild.Name){
                                        chatF.pushMsg("server", (avt.pnm + " has joined the guild."), "SERVER", "", 0);
                                        world.myAvatar.updateGuild(resObj.guild);
                                    };
                                };
                            }
                            else {
                                if (resObj.guild.Name == world.myAvatar.objData.guild.Name){
                                    chatF.pushMsg("server", (resObj.unm + " has joined the guild."), "SERVER", "", 0);
                                    world.myAvatar.updateGuild(resObj.guild);
                                };
                            };
                            break;
                        case "gr":
                            avt = world.getAvatarByUserName(resObj.unm);
                            if (avt != null){
                                avt.updateGuild(null);
                                if (avt.isMyAvatar){
                                    chatF.chn.guild.act = 0;
                                    chatF.pushMsg("server", "You have been removed from the guild.", "SERVER", "", 0);
                                }
                                else {
                                    if (world.myAvatar.objData.guild.Name == avt.objData.guild.Name){
                                        chatF.pushMsg("server", (avt.pnm + " has been removed from the guild."), "SERVER", "", 0);
                                        world.myAvatar.updateGuild(resObj.guild);
                                    };
                                };
                            };
                            if (world.myAvatar.objData.guild != null){
                                if (world.myAvatar.objData.guild.Name == resObj.guild.Name){
                                    chatF.pushMsg("server", (resObj.unm + " has been removed from the guild."), "SERVER", "", 0);
                                    world.myAvatar.updateGuild(resObj.guild);
                                };
                            };
                            break;
                        case "guildDelete":
                            avt = world.getAvatarByUserName(resObj.unm);
                            if (avt != null){
                                avt.updateGuild(null);
                                if (avt.isMyAvatar){
                                    chatF.pushMsg("server", resObj.msg, "SERVER", "", 0);
                                };
                            };
                            break;
                        case "gMOTD":
                            world.myAvatar.objData.guild.MOTD = resObj.MOTD[0];
                            break;
                        case "updateGuild":
                            try {
                                if (world.myAvatar.objData != null){
                                    world.myAvatar.updateGuild(resObj.guild);
                                };
                            }
                            catch(e) {
                            };
                            if (resObj.msg != null){
                                chatF.pushMsg("server", resObj.msg, "SERVER", "", 0);
                            };
                            break;
                        case "gc":
                            avt = world.getAvatarByUserID(resObj.uid);
                            avt.initGuild(resObj.guild);
                            break;
                        case "interior":
                            world.guildHallData.updateItems(resObj.items);
                            break;
                        case "guildhall":
                            world.guildHallData.handleHallUpdate(resObj);
                            break;
                        case "guildinv":
                            world.guildHallData.updateInventory(resObj.guildInventory);
                            break;
                        case "startTrade":
						    toggleTradePanel(resObj.userid);
							world.tradeinfo = {
                                itemsA:[],
                                itemsB:[],
                                hasRequested:{}
                            };
							break;
						case "ti":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has requested you to trade. Do you accept?");
                            modalO.callback = world.doTradeAccept;
                            modalO.params = {unm:resObj.owner};
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has requested you to trade."), "SERVER", "", 0);
                            break;
                        case "pi":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has invited you to join their group.  Do you accept?");
                            modalO.callback = world.doPartyAccept;
                            modalO.params = {pid:resObj.pid};
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has invited you to a group."), "SERVER", "", 0);
                            break;
                        case "pa":
                            if (world.partyOwner == ""){
                                world.partyOwner = resObj.owner;
                            };
                            supressMupltiples = false;
                            if (world.partyID == -1){
                                world.partyID = resObj.pid;
                                chatF.chn.party.act = 1;
                                if (resObj.owner.toLowerCase() != sfc.myUserName){
                                    chatF.pushMsg("server", "You have joined the party.", "SERVER", "", 0);
                                    supressMupltiples = true;
                                };
                            };
                            i = 0;
                            while (i < resObj.ul.length) {
                                unm = resObj.ul[i];
                                if (unm.toLowerCase() != sfc.myUserName){
                                    world.addPartyMember(unm);
                                    if (!supressMupltiples){
                                        chatF.pushMsg("server", (unm + " has joined the party."), "SERVER", "", 0);
                                    };
                                };
                                i = (i + 1);
                            };
                            break;
                        case "pr":
                            isYou = false;
                            nam = world.partyOwner;
                            world.partyOwner = resObj.owner;
                            if (nam != world.partyOwner){
                                chatF.pushMsg("server", (world.partyOwner + " is now the party leader."), "SERVER", "", 0);
                            };
                            if (resObj.unm.toLowerCase() == sfc.myUserName.toLowerCase()){
                                isYou = true;
                                chatF.chn.party.act = 0;
                            };
                            if (resObj.typ == "k"){
                                if (isYou){
                                    chatF.pushMsg("server", "You have been removed from the party", "SERVER", "", 0);
                                }
                                else {
                                    chatF.pushMsg("server", (resObj.unm + " has been removed from the party"), "SERVER", "", 0);
                                };
                            }
                            else {
                                if (resObj.typ == "l"){
                                    if (isYou){
                                        chatF.pushMsg("server", "You have left the party", "SERVER", "", 0);
                                    }
                                    else {
                                        chatF.pushMsg("server", (resObj.unm + " has left the party"), "SERVER", "", 0);
                                    };
                                };
                            };
                            world.removePartyMember(String(resObj.unm).toLowerCase());
                            break;
                        case "pp":
                            nam = world.partyOwner;
                            world.partyOwner = resObj.owner;
                            if (nam != world.partyOwner){
                                chatF.pushMsg("server", (world.partyOwner + " is now the party leader."), "SERVER", "", 0);
                            };
                            world.updatePartyFrame();
                            break;
                        case "ps":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.unm + " wants to summon you to them.  Do you accept?");
                            modalO.callback = world.acceptPartySummon;
                            modalO.params = resObj;
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.unm + " is trying to summon you to them."), "SERVER", "", 0);
                            break;
						case "us":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = ("Are you sure to save this stat adjustments?");
                            modalO.callback = world.acceptStatUpdate;
                            modalO.params = resObj;
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            //chatF.pushMsg("server", (resObj.unm + " is trying to summon you to them."), "SERVER", "", 0);
                            break;
                        case "pd":
                            chatF.pushMsg("server", (resObj.unm + " has declined your invitation."), "SERVER", "", 0);
                            break;
                        case "pc":
                            if (world.partyID > -1){
                                chatF.pushMsg("server", "Your party has been disbanded", "SERVER", "", 0);
                            };
                            world.partyID = -1;
                            world.partyOwner = "";
                            world.partyMembers = [];
                            world.updatePartyFrame();
                            chatF.chn.party.act = 0;
                            if (chatF.chn.cur == chatF.chn.party){
                                chatF.chn.cur = chatF.chn.zone;
                            };
                            if (chatF.chn.lastPublic == chatF.chn.party){
                                chatF.chn.lastPublic = chatF.chn.zone;
                            };
                            break;
                        case "PVPQ":
                            world.handlePVPQueue(resObj);
                            break;
                        case "PVPI":
                            world.receivePVPInvite(resObj);
                            break;
                        case "PVPE":
                            relayPVPEvent(resObj);
                            break;
                        case "PVPS":
                            updatePVPScore(resObj.pvpScore);
                            break;
                        case "PVPC":
                            world.PVPResults.pvpScore = resObj.pvpScore;
                            world.PVPResults.team = resObj.team;
                            updatePVPScore(resObj.pvpScore);
                            togglePVPPanel("results");
                            break;
                        case "pvpbreakdown":
                            break;
                        case "di":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has challenged you to a duel.  Do you accept?");
                            modalO.callback = world.doDuelAccept;
                            modalO.params = {unm:resObj.owner};
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has challenged you to a duel."), "SERVER", "", 0);
                            break;
                        case "DuelEX":
                            world.duelExpire();
                            break;
						case "gwi":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has challenged you to a guild war. Do you accept?");
                            modalO.callback = world.doGuildWarAccept;
                            modalO.params = {unm:resObj.owner};
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has challenged you to a guild war."), "SERVER", "", 0);
                            break;
                        case "GuildWarEX":
                            world.GuildWarExpire();
                            break;
						case "gs":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = ("Your guild leader " + resObj.owner + " has summoned you. Do you accept?");
                            modalO.callback = world.doGuildLeaderSummonAccept;
                            modalO.params = {unm:resObj.owner};
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            break;
                        case "GuildSummonEX":
                            world.GuildLeaderSummonExpire();
                            break;
                        case "loadFactions":
                            world.myAvatar.initFactions(resObj.factions);
                            break;
                        case "addFaction":
                            world.myAvatar.addFaction(resObj.faction);
                            break;
                        case "loadFriendsList":
                            world.myAvatar.initFriendsList(resObj.friends);
                            break;
                        case "requestFriend":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.unm + " has invited you to be friends. Do you accept?");
                            modalO.callback = world.addFriend;
                            modalO.params = {
                                ID:resObj.ID,
                                unm:resObj.unm
                            };
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.unm + " has invited you to be friends."), "SERVER", "", 0);
                            break;
                        case "addFriend":
                            world.myAvatar.addFriend(resObj.friend);
                            break;
                        case "updateFriend":
                            world.myAvatar.updateFriend(resObj.friend);
                            break;
                        case "deleteFriend":
                            world.myAvatar.deleteFriend(resObj.ID);
                            break;
                        case "isModerator":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.btns = "mono";
                            if (resObj.val ==  "Moderator"){
                                modalO.strBody = (resObj.unm + " is a Moderator!");
                                modalO.glow = "gold,medium";
                                chatF.pushMsg("server", (resObj.unm + " is a Moderator!"), "SERVER", "", 0);
                            } else if (resObj.val ==  "Administrator"){
                                modalO.strBody = (resObj.unm + " is a Administrator!");
                                modalO.glow = "green,medium";
                                chatF.pushMsg("server", (resObj.unm + " is a Administrator!"), "SERVER", "", 0);
                            } else {
                                modalO.strBody = (resObj.unm + " is NOT a Staff Member!");
                                modalO.glow = "red,medium";
                                chatF.pushMsg("warning", (resObj.unm + " is NOT a Staff Member!"), "SERVER", "", 0);
                            };
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            break;
                        case "loadWarVars":
                            world.objResponse["loadWarVars"] = resObj;
                            world.dispatchEvent(new Event("loadWarVars"));
                            break;
                        case "setAchievement":
                            world.updateAchievement(resObj.field, resObj.index, resObj.value);
                            break;
                        case "loadQuestStringData":
                            world.objQuestString = resObj.obj;
                            world.dispatchEvent(new Event("QuestStringData_Complete"));
                            break;
                        case "getAdData":
                            if (resObj.bSuccess == 1){
                                world.adData = resObj.bh;
                                world.dispatchEvent(new Event("getAdData"));
                            };
                            break;
                        case "getAdReward":
                            world.myAvatar.objData.iDailyAds = (world.myAvatar.objData.iDailyAds + 1);
                            world.adData = null;
                            if (world.myAvatar.objData.iDailyAds < world.myAvatar.objData.iDailyAdCap){
                                world.sendGetAdDataRequest();
                            };
                            world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + int(resObj.iGold));
								ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
								ui.mcInterface.mcGold.strSilver.text = world.myAvatar.objData.intSilver;
								ui.mcInterface.mcGold.strCopper.text = world.myAvatar.objData.intCopper;
								ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins;
                            if (ui.mcPopup.currentLabel == "Inventory"){
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({eventType:"refreshCoins"});
                            };
                            world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins + int(resObj.iCoins));
                            sMsg = (("Congratulations! You just received <font color='#FFCC00'><b>" + resObj.iGold) + " Gold</b></font>");
                            if (resObj.iCoins > 0){
                                sMsg = (sMsg + ((" and <font color='#990099'><b>" + resObj.iCoins) + " Diamonds</b></font>"));
                            };
                            sMsg = (sMsg + " from Ballyhoo.");
                            showMessageBox(sMsg);
                            break;
                        case "xpboost":
                            manageXPBoost(resObj);
                            break;
                        case "gboost":
                            manageGBoost(resObj);
                            break;
                        case "repboost":
                            manageRepBoost(resObj);
                            break;
                        case "cpboost":
                            manageCPBoost(resObj);
                            break;
                        case "gettimes":
                            a = [];
                            for (s in resObj.o) {
                                o = resObj.o[s];
                                o.s = s;
                                a.push(o);
                            };
                            a.sortOn("t", (Array.NUMERIC | Array.DESCENDING));
                            trace(" ** GETTIMES START **");
                            i = 0;
                            while (i < a.length) {
                                o = a[i];
                                trace(((((((((o.s + ",") + o.t) + ",") + o.n) + ",") + numToStr((o.t / o.n))) + ",") + Math.round(o.d)));
                                i = (i + 1);
                            };
                            trace(" ** GETTIMES END **");
                            break;
                        case "clockTick":
                            if (("eventTrigger" in MovieClip(world.map))){
                                world.map.eventTrigger(resObj);
                            };
                            break;
                        case "castWait":
                            try {
                                world.map.fishGame.castingWait(resObj.wait, resObj.derp);
                            }
                            catch(e) {
                            };
                            break;
                        case "CatchResult":
                            world.myAvatar.addRep(20, resObj.catchResult.myRep);
                            try {
                                world.map.fishGame.showCatch(resObj);
                            }
                            catch(e) {
                            };
                            break;
                        case "alchOnStart":
                            world.map.alchemyGame.onStart(resObj);
                            break;
                        case "alchComplete":
                            world.map.alchemyGame.checkComplete(resObj);
                            break;
                        case "bookInfo":
                            world.bookData = resObj.bookData;
                            break;
                        case "spellOnStart":
                            world.map.mcGame.spellOnStart(resObj);
                            break;
                        case "spellComplete":
                            world.map.mcGame.spellComplete(resObj);
                            break;
                        case "spellWaitTimer":
                            world.map.mcGame.spellWaitTimer(resObj);
                            break;
                        case "playerDeath":
                            if (("eventTrigger" in MovieClip(world.map))){
                                world.map.eventTrigger(resObj);
                            };
                            break;
                        case "getScrolls":
                            trace("getScrolls recieved");
                            try {
                                world.scrollData = resObj.scrolls;
                                world.map.initScrollData();
                            }
                            catch(e) {
                                trace("error finding function");
                            };
                            break;
                        case "turninscroll":
                            if (resObj.IDs != null){
                                i = 0;
                                while (i < resObj.IDs.length) {
                                    world.myAvatar.updateScrolls(int(resObj.IDs[i]));
                                    i = (i + 1);
                                };
                                s = "";
                                i = 0;
                                while (i < 500) {
                                    s = (s + String.fromCharCode(0));
                                    i = (i + 1);
                                };
                                world.myAvatar.objData.pending = s;
                                try {
                                    world.map.displayTurnins(resObj.IDs);
                                }
                                catch(e) {
                                    trace("error displaying turnins");
                                };
                            };
                    };
                };
                try {
                    if (world.map.Events != null){
                        trace("events not null");
                        if (world.map.Events[cmd] != null){
                            trace(("sending: " + cmd));
                            world.map.responseEvent(cmd, resObj);
                        };
                    };
                }
                catch(e) {
                    trace(("error in responseEvent: " + e));
                };
            };
            addFrameScript(0, frame1, 9, frame10, 10, frame11, 18, frame19, 28, frame29);
            Security.allowDomain("*");
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            sfc = new SmartFoxClient();
            sfc.debug = true;
            sfc.smartConnect = false;
            sfc.addEventListener(SFSEvent.onConnection, onConnectionHandler);
            sfc.addEventListener(SFSEvent.onConnectionLost, onConnectionLostHandler);
            sfc.addEventListener(SFSEvent.onLogin, onLoginHandler);
            sfc.addEventListener(SFSEvent.onLogout, onLogoutHandler);
            sfc.addEventListener(SFSEvent.onObjectReceived, onObjectReceivedHandler);
            sfc.addEventListener(SFSEvent.onRoundTripResponse, onRoundTripResponseHandler);
            sfc.addEventListener(SFSEvent.onExtensionResponse, onExtensionResponseHandler);
            for each (multiO in sfcA) {
            };
            (classCatMap.M1.ratios = [0.27, 0.3, 0.22, 0.05, 0.1, 0.06]);
            (classCatMap.M2.ratios = [0.2, 0.22, 0.33, 0.05, 0.1, 0.1]);
            (classCatMap.M3.ratios = [0.24, 0.2, 0.2, 0.24, 0.07, 0.05]);
            (classCatMap.M4.ratios = [0.3, 0.18, 0.3, 0.02, 0.06, 0.14]);
            (classCatMap.C1.ratios = [0.06, 0.2, 0.11, 0.33, 0.15, 0.15]);
            (classCatMap.C2.ratios = [0.08, 0.27, 0.1, 0.3, 0.1, 0.15]);
            (classCatMap.C3.ratios = [0.06, 0.23, 0.05, 0.28, 0.28, 0.1]);
            (classCatMap.S1.ratios = [0.22, 0.18, 0.21, 0.08, 0.08, 0.23]);
            sfci = 0;
            while (sfci < sfcA.length) {
                var _local2 = sfcA[sfci];
                sfcO = _local2;
                _local2;
                (sfcO.sfc = new SmartFoxClient());
                (sfcO.sfc.debug = true);
                (sfcO.rootClass = this);
                (sfcO.cLoginZone = cLoginZone);
                (sfcO.clientToken = clientToken);
                (sfcO.serverPort = serverPort);
                (sfcO.loginInfo = {});
                (sfcO.onMultiConnectionHandler = function (_arg1:SFSEvent):void{
                    var _local2:Object;
                    if (_arg1.params.success){
                        _local2 = getSfcBySFC(_arg1.currentTarget);
                        trace(((("MULTI.onMultiConnectionHandler > " + _local2.sLogin) + " on ") + _local2.sIP));
                        _local2.sfc.login(_local2.cLoginZone, ((_local2.clientToken + "~") + _local2.sLogin), _local2.strToken);
                    }
                    else {
                        trace("failed >> 3");
                    };
                });
                (sfcO.onMultiConnectionLostHandler = onMultiConnectionLostHandler);
                (sfcO.onMultiLogoutHandler = onMultiLogoutHandler);
                (sfcO.loginLoader = new URLLoader());
                (sfcO.login = function ():void{
                    var rand:Number;
                    var url:String;
                    var request:URLRequest;
                    var variables:URLVariables;
                    rand = rn.rand();
                    //url = ("http://leviathanworlds.fun/cf-userlogin.php?ran=" + rand);
					url = ("http://localhost/cf-userlogin.php?ran=" + rand);
                    var _local2 = (url);
					/* AQW VERSION
					url = ("cf-userlogin.asp?ran=" + rand);
                    var _local2 = ("http://game.aqworlds.com/game/" + url);
					*/
                    _local2;
                    request = new URLRequest(url);
                    variables = new URLVariables();
                    (variables.strUsername = this.sLogin);
                    (variables.strPassword = this.sPass);
					(variables.strKey = this.sKey);
                    (request.data = variables);
                    (request.method = URLRequestMethod.POST);
                    this.loginLoader.addEventListener(Event.COMPLETE, sfcO.onLoginComplete);
                    try {
                        this.loginLoader.load(request);
                    }
                    catch(e:Error) {
                        trace("Unable to load URL");
                    };
                });
                (sfcO.onLoginComplete = function (_arg1:Event):void{
                    var _local2:Object;
                    var _local3:Object;
                    _local2 = getSfcByLoader(_arg1.currentTarget);
                    if (_local2 != null){
                        trace(((("MULTI.onLoginComplete > " + _local2.sLogin) + " on ") + _local2.sIP));
                        _local3 = XMLtoObject(new XML(_arg1.target.data));
                        _local2.loginLoader.removeEventListener(Event.COMPLETE, _local2.onLoginComplete);
                        (_local2.strToken = _local3.sToken);
                        _local2.sfc.connect(_local2.sIP, _local2.serverPort);
                    }
                    else {
                        trace("MULTI.onLoginComplete > Unable to resolve host object");
                    };
                });
                sfcO.sfc.addEventListener(SFSEvent.onConnection, sfcO.onMultiConnectionHandler);
                sfcO.sfc.addEventListener(SFSEvent.onConnectionLost, sfcO.onMultiConnectionLostHandler);
                sfcO.sfc.addEventListener(SFSEvent.onLogout, sfcO.onMultiLogoutHandler);
                sfci = (sfci + 1);
            };
            (userPreference = SharedObject.getLocal("AQWUserPref", "/"));
            inituoPref();
            if (((!((userPreference.data.bSoundOn == null))) && ((userPreference.data.bSoundOn == false)))){
                (mixer.bSoundOn = false);
            };
            if (!mixer.bSoundOn){
                (SoundMixer.soundTransform = new SoundTransform(0));
            };
            (uoPref.bSoundOn = mixer.bSoundOn);
            if (userPreference.data.quality == null){
                (userPreference.data.quality = "AUTO");
            };
            initArrRep();
            (chatF = new Chat());
            (chatF.rootClass = this);
            //ExternalInterface.addCallback("payment", testJSCallback);
            addChildAt(new Sprite(), 0);
        }

        public static function trim(_arg1:String):String{
            if (_arg1 == null){
                return ("");
            };
            return (_arg1.replace(/^\s+|\s+$/g, ""));
        }

        public static function XMLtoObject(_arg1:XML){
            var _local3:*;
            var _local4:*;
            var _local5:*;
            var _local2:* = {};
            for (_local3 in _arg1.attributes()) {
                _local2[String(_arg1.attributes()[_local3].name())] = String(_arg1.attributes()[_local3]);
            };
            for (_local4 in _arg1.children()) {
                _local5 = _arg1.children()[_local4].name();
                if (_local2[_local5] == undefined){
                    _local2[_local5] = [];
                };
                _local2[_local5].push(XMLtoObject(_arg1.children()[_local4]));
            };
            return (_local2);
        }

        public static function convertXMLtoObject(_arg1:XML){
            var _local3:*;
            var _local4:*;
            var _local5:XML;
            var _local6:*;
            var _local2:* = {};
            for (_local3 in _arg1.attributes()) {
                _local2[String(_arg1.attributes()[_local3].name())] = String(_arg1.attributes()[_local3]);
            };
            for (_local4 in _arg1.children()) {
                _local5 = _arg1.children()[_local4];
                if (_local5.nodeKind() == "text"){
                    if (_local5 == parseFloat(_local5).toString()){
                        return (parseFloat(_local5));
                    };
                    return (_local5);
                };
                if (_local5.nodeKind() == "element"){
                    _local6 = _arg1.children()[_local4].name();
                    if (_local2[_local6] == null){
                        _local2[_local6] = convertXMLtoObject(_arg1.children()[_local4]);
                    }
                    else {
                        if (!(_local2[_local6] is Array)){
                            _local2[_local6] = [_local2[_local6]];
                        };
                        _local2[_local6].push(convertXMLtoObject(_arg1.children()[_local4]));
                    };
                };
            };
            return (_local2);
        }

        private static function makeGrayscale(_arg1:DisplayObject, _arg2:int=0, _arg3:Number=0.33):void{
            var _local6:Color;
            if (_arg1 == null){
                return;
            };
            var _local4:Array = [_arg3, _arg3, _arg3, 0, 0, _arg3, _arg3, _arg3, 0, 0, _arg3, _arg3, _arg3, 0, 0, _arg3, _arg3, _arg3, 1, 0];
            var _local5:ColorMatrixFilter = new ColorMatrixFilter(_local4);
            _arg1.filters = [_local5];
            if (_arg2 != 0){
                _local6 = new Color();
                _local6.brightness = -((_arg2 / 100));
                _arg1.transform.colorTransform = _local6;
            };
        }


        public function loadAccountCreation(_arg1:String){
            mcAccount.removeChildAt(0);
            var _local2:Loader = new Loader();
            trace((("newchar " + Game.serverFilePath) + _arg1));
            _local2.load(new URLRequest((Game.serverFilePath + _arg1)), new LoaderContext(false, new ApplicationDomain(null)));
            mcAccount.addChild(_local2);
        }

        public function monsterTreeWrite(_arg1:int, _arg2:Object, _arg3=null):void{
            var _local5:String;
            var _local6:String;
            var _local7:*;
            var _local8:Avatar;
            var _local9:Avatar;
            var _local10:Avatar;
            var _local11:Avatar;
            var _local12:MovieClip;
            var _local16:int;
            var _local17:String;
            var _local18:int;
            var _local19:*;
            var _local20:*;
            var _local4:int;
            var _local13 = "";
            var _local14:Object = {};
            var _local15:Object = world.monTree[_arg1];
            if (_local15 != null){
                _local16 = -1;
                if (((!((_local15 == null))) && (!((_local15.intState == null))))){
                    _local16 = _local15.intState;
                };
                for (_local17 in _arg2) {
                    _local6 = _local17;
                    _local7 = _arg2[_local17];
                    _local14[_local6] = _local7;
                    if (_local6.toLowerCase().indexOf("int") > -1){
                        _local7 = int(_local7);
                    };
                    if (_local6 == "react"){
                        _local7 = _local7.split(",");
                        _local18 = 0;
                        while (_local18 < _local7.length) {
                            _local7[_local18] = int(_local7[_local18]);
                            _local18++;
                        };
                    };
                    _local15[_local6] = _local7;
                };
                _local13 = "";
                for (_local13 in _local14) {
                    _local6 = _local13;
                    _local7 = _local14[_local13];
                    if (_local6.toLowerCase().indexOf("evt:") < 0){
                        _local10 = world.getMonster(_arg1);
                        if (_local10 != null){
                            if (_local6.toLowerCase().indexOf("hp") > -1){
                                if (((!((_local10 == null))) && (!((_local10.objData == null))))){
                                    _local7 = int(_local7);
                                    _local10.objData[_local13] = _local7;
                                    if (world.myAvatar.target == _local10){
                                        world.updatePortrait(_local10);
                                    };
                                    if (((!((world.objLock == null))) && ((((_local6 == "intHP")) && ((_local7 <= 0)))))){
                                        world.intKillCount++;
                                        world.updatePadNames();
                                    };
                                    if (((!((_local10.objData == null))) && ("boolean"))){
                                        if (_local10.objData.strFrame == world.strFrame){
                                            if (_local7 <= 0){
                                                _local10.pMC.stopWalking();
                                                world.removeAuraFX(_local10.pMC, "all");
                                                _local10.pMC.die();
                                                _local15.auras = [];
                                                _local15.targets = {};
                                                _local10.target = null;
                                                if (("eventTrigger" in MovieClip(world.map))){
                                                    world.map.eventTrigger({
                                                        cmd:"monDeath",
                                                        args:_arg1,
                                                        targets:_arg2.targets
                                                    });
                                                };
                                                if (world.myAvatar.dataLeaf.targets[_local10.objData.MonMapID] != null){
                                                    delete world.myAvatar.dataLeaf.targets[_local10.objData.MonMapID];
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                            if (_local6.toLowerCase().indexOf("state") > -1){
                                if (((!((_local10 == null))) && (!((_local10.objData == null))))){
                                    _local7 = int(_local7);
                                    _local10.objData[_local13] = _local7;
                                    if (_local7 != 2){
                                        _local10.dataLeaf.auras = [];
                                    };
                                    if (((!((_local10.objData.strFrame == null))) && ((_local10.objData.strFrame == world.strFrame)))){
                                        if ((((((_local7 == 1)) && (!((_local10.pMC == null))))) && (((!((_local10.pMC.x == _local10.pMC.ox))) || (!((_local10.pMC.y == _local10.pMC.oy))))))){
                                            _local10.pMC.walkTo(_local10.pMC.ox, _local10.pMC.oy, world.WALKSPEED);
                                        };
                                    };
                                    if (_local7 != 2){
                                        _local15.targets = {};
                                    };
                                };
                            };
                            if (_local6.toLowerCase().indexOf("dx") > -1){
                                _local7 = int(_local7);
                                if (((((!((_local10.objData == null))) && (!((_local10.objData.strFrame == null))))) && ((_local10.objData.strFrame == world.strFrame)))){
                                    _local19 = int(world.monTree[_arg1].dx);
                                    _local20 = int(world.monTree[_arg1].dy);
                                    _local10.pMC.walkTo(_local19, _local20, world.WALKSPEED);
                                };
                            };
                        };
                    };
                };
            };
        }

        public function userTreeWrite(_arg1:String, _arg2:Object):void{
			if (_arg2 == null) {
				return;
			}
			
            var _local4:String;
            var _local5:String;
            var _local6:*;
            var _local7:Avatar;
            var _local8:Avatar;
            var _local9:Avatar;
            var _local10:Avatar;
            var _local11:MovieClip;
            var _local16:String;
            var _local17:int;
            var _local3:int;
            var _local12 = "";
            var _local13:Object = {};
            var _local14:Object = {};
            var _local15:Object = world.uoTree[_arg1.toLowerCase()];
            _local10 = world.getAvatarByUserName(_arg1);
            for (_local16 in _arg2) {
                _local5 = _local16;
                _local6 = _arg2[_local16];
                if ((((((((((_local5.toLowerCase().indexOf("int") > -1)) || ((_local5.toLowerCase() == "tx")))) || ((_local5.toLowerCase() == "ty")))) || ((_local5.toLowerCase() == "sp")))) || ((_local5.toLowerCase() == "pvpTeam")))){
                    _local6 = int(_local6);
                };
                if (((((((((((((((((sfcSocial) && (!((_local15 == null))))) && (!((world.myAvatar.dataLeaf == null))))) && ((_local5.toLowerCase() == "inthp")))) && (!((_arg1.toLowerCase() == sfc.myUserName))))) && ((_local15.strFrame == world.myAvatar.dataLeaf.strFrame)))) && (((!(world.bPvP)) || ((_local15.pvpTeam == world.myAvatar.dataLeaf.pvpTeam)))))) && ((_local6 > 0)))) && (!((world.getFirstHeal() == null))))){
                    if ((((_local6 <= _local15.intHP)) && (((((_local15.intHP - _local6) >= (_local15.intHPMax * 0.15))) || ((_local6 <= (_local15.intHPMax * 0.5))))))){
                        try {
                            _local10.pMC.showHealIcon();
                        }
                        catch(e:Error) {
                        };
                    };
                    if (_local6 > Math.round((_local15.intHPMax * 0.5))){
                        try {
                            if (_local10.pMC.getChildByName("HealIconMC") != null){
                                MovieClip(_local10.pMC.getChildByName("HealIconMC")).fClose();
                            };
                        }
                        catch(e:Error) {
                        };
                    };
                };
                if (_local5.toLowerCase() == "afk"){
                    _local6 = (_local6 == "true");
                };
				if (_local5.toLowerCase() == "vending"){
                    _local6 = (_local6 == "true");
                };
				if (_local5.toLowerCase() == "fly"){
                    _local6 = (_local6 == "true");
                };
                _local13[_local5] = _local6;
                _local14[_local5] = _local6;
            };
            _local17 = -1;
            if (world.uoTree[_arg1.toLowerCase()] != null){
                _local17 = world.uoTree[_arg1.toLowerCase()].intState;
            };
            world.uoTreeLeafSet(_arg1, _local14);
            _local15 = world.uoTree[_arg1.toLowerCase()];
            if (world.isPartyMember(_arg1)){
                world.updatePartyFrame({unm:_local15.strUsername});
            };
            _local12 = "";
            for (_local12 in _local13) {
                _local6 = _local13[_local12];
                if (_local12.toLowerCase() == "strframe"){
                    world.manageAreaUser(_arg1, "+");
                    if (_local13[_local12] != world.strFrame){
                        _local11 = world.getMCByUserID(world.getUserByName(_arg1).getId());
                        if (((!((_local11 == null))) && (!((_local11.stage == null))))){
                            _local11.pAV.hideMC();
                            if (_local11.pAV == world.myAvatar.target){
                                world.setTarget(null);
                            };
                        };
                    }
                    else {
                        if (_local13.sp != null){
                            _local11 = world.getMCByUserID(world.getUserByName(_arg1).getId());
                            if (_local11 != null){
                                _local11.walkTo(_local13.tx, _local13.ty, world.WALKSPEED);
                            };
                        }
                        else {
                            world.objectByID(_local15.entID);
                        };
                    };
                };
                if (_local12.toLowerCase() == "sp"){
                    if (_local13.strFrame == world.strFrame){
                    };
                };
				/*
				if ((((_local12 == "fly")) && (!((_local10.pMC == null))))){
                    _local10.pMC.fly = _local13[_local12];
                    if (_local13.sp == 0){
                        _local10.pMC.stopWalking();
                        if (_local10.pMC.fly){
                            _local10.pMC.GroundToFly();
                        } else {
                            _local10.pMC.FlyToGround();
                        };
                    };
                };
				*/
                if (_local10 != null){
                    if ((((_local12.toLowerCase().indexOf("inthp") > -1)) || ((_local12.toLowerCase().indexOf("intmp") > -1)))){
                        _local6 = int(_local6);
                        if (_local10.objData != null){
                            _local10.objData[_local12] = _local6;
                        };
                        if (((_local10.isMyAvatar) || ((world.myAvatar.target == _local10)))){
                            world.updatePortrait(_local10);
                        };
                        if (_local10.isMyAvatar){
                            world.updateActBar();
                        };
                        if (((!((_local10.pMC == null))) && (world.showHPBar))){
                            _local10.pMC.updateHPBar();
                        };
                    };
                    if (_local12.toLowerCase().indexOf("intlevel") > -1){
                        _local6 = int(_local6);
                        if (_local10.objData != null){
                            _local10.objData[_local12] = _local6;
                            if (((!(_local10.isMyAvatar)) && ((world.myAvatar.target == _local10)))){
                                showPortraitBox(_local10, ui.mcPortraitTarget);
                            };
                        };
                    };
                    if (_local12.toLowerCase().indexOf("intstate") > -1){
                        _local6 = int(_local6);
                        if (((!((_local10.objData == null))) && ((world.uoTree[_arg1.toLowerCase()].strFrame == world.strFrame)))){
                            if ((((_local6 == 1)) && ((_local17 == 0)))){
                                _local10.pMC.gotoAndStop("Idle");
                                _local10.pMC.scale(world.SCALE);
                            };
                            if ((((_local6 == 1)) && ((_local17 == 2)))){
                                if (("eventTrigger" in MovieClip(world.map))){
                                };
                            };
                        };
                        if (_local10.objData != null){
                            _local10.objData[_local12] = _local6;
                        };
                        if ((((((_local6 == 0)) && ((world.uoTree[_arg1.toLowerCase()].strFrame == world.strFrame)))) && (!((_local10.pMC == null))))){
                            _local10.pMC.stopWalking();
                            _local10.pMC.mcChar.gotoAndPlay("Feign");
							if(world.myAvatar.onCasting == true){
								ui.mcCastBar.fClose();
								world.myAvatar.onCasting == false;
								//this.testAction(this.getAutoAttack(), true);
							}
                            world.removeAuraFX(_local10.pMC, "all");
                            if (_local10.pMC.getChildByName("HealIconMC") != null){
                                MovieClip(_local10.pMC.getChildByName("HealIconMC")).fClose();
                            };
                            if (_local10.isMyAvatar){
								mixer.playSound("Dead");
                                world.cancelAutoAttack();
                                world.actionReady = false;
                                world.bitWalk = false;
                                world.map.transform.colorTransform = world.deathCT;
                                world.CHARS.transform.colorTransform = world.deathCT;
                                //_local10.pMC.transform.colorTransform = world.defaultCT;
                                world.showResCounter();
                            };
                        };
                        if (_local6 != 2){
                            _local15.targets = {};
                        };
                    };
                    if (_local12.toLowerCase().indexOf("afk") > -1){
                        if (_local10.pMC != null){
                            _local10.pMC.updateName();
                        };
                    };
					if (_local10.objData.Fly == 1){
                        if (_local10.pMC != null){
							//_local10.pMC.simulateJumpUp();
							if(_local10.pMC.mcChar.onMove){
								_local10.pMC.mcChar.gotoAndStop("FlyWalk");//= 1;
							} else {
								_local10.pMC.mcChar.gotoAndStop("FlyIdle");//= 1;
							}
							//_local10.pMC.GroundToFly();
							_local10.pMC.fly = 1;
                        };
                    };
					if (_local12.toLowerCase().indexOf("vending") > -1){
                        if (_local10.pMC != null){
                            _local10.pMC.updateName();
                        };
                    };
                    if (_local12 == "showCloak"){
                        if (_local10.pMC != null){
                            _local10.pMC.setCloakVisibility(_local6);
                        };
                    };
                    if (_local12 == "showHelm"){
                        if (_local10.pMC != null){
                            _local10.pMC.setHelmVisibility(_local6);
                        };
                    };
                    if (_local12.toLowerCase().indexOf("cast") > -1){
                        if (_local10.pMC != null){
                            if (_local6.t > -1){
                                _local10.pMC.stopWalking();
                                _local10.pMC.queueAnim("Use");
                            }
                            else {
                                _local10.pMC.endAction();
                                if (_local10 == world.myAvatar){
                                    ui.mcCastBar.fClose();
                                };
                            };
                        };
                    };
                };
            };
        }

        public function doAnim(_arg1:Object, _arg2:Boolean=false, _arg3=null):void{
            var anims:Array;
            var animIndex:uint;
            var animStr:String;
            var pMC:MovieClip;
            var cLeaf:Object;
            var tLeaf:Object;
            var tAvt:Avatar;
            var cAvt:Avatar;
            var aura:Object;
            var buffer:* = undefined;
            var xBuffer:* = undefined;
            var yBuffer:* = undefined;
            var animString:String;
            var anim:Object = _arg1;
            var isProc:Boolean = _arg2;
            var dur = _arg3;
            var i:int;
            var cTyp:String = "";
            var cID:int = -1;
            var tTyp:String = "";
            var tID:int = -1;
            var tAvts:Array = [];
            var tInfA:Array = [];
            var strF:String = "";
            cAvt = null;
            tAvt = null;
            var cReg:Point = new Point(0, 0);
            var tReg:Point = new Point(0, 0);
            if (((!((anim.cInf == null))) && (!((anim.tInf == null))))){
                cTyp = String(anim.cInf.split(":")[0]);
                cID = int(anim.cInf.split(":")[1]);
                switch (cTyp){
                    case "p":
                        cAvt = world.getAvatarByUserID(cID);
                        cLeaf = world.getUoLeafById(cID);
                        break;
                    case "m":
                        cAvt = world.getMonster(cID);
                        cLeaf = world.monTree[cID];
                        if (anim.msg != null){
                            if (anim.msg.indexOf("<mon>") > -1){
                                anim.msg = anim.msg.split("<mon>").join(cAvt.objData.strMonName);
                            };
                            addUpdate(anim.msg);
                        };
                        break;
                };
                tInfA = anim.tInf.split(",");
                i = 0;
                while (i < tInfA.length) {
                    tTyp = String(tInfA[i].split(":")[0]);
                    tID = int(tInfA[i].split(":")[1]);
                    switch (tTyp){
                        case "p":
                            tAvt = world.getAvatarByUserID(tID);
                            tLeaf = world.getUoLeafById(tID);
                            break;
                        case "m":
                            tAvt = world.getMonster(tID);
                            tLeaf = world.monTree[tID];
                            break;
                    };
                    tAvts.push(tAvt);
                    i = (i + 1);
                };
                if (tAvts[0] != null){
                    tAvt = tAvts[0];
                };
                if (tAvt != null){
                    tLeaf = tAvt.dataLeaf;
                };
                if (((((((((((!((cAvt == null))) && (!((cAvt.pMC == null))))) && (!((tAvt == null))))) && (!((tAvt.pMC == null))))) && (!((cLeaf == null))))) && (!((tLeaf == null))))){
                    aura = {};
                    for each (aura in cLeaf.auras) {
                        try {
                            if (aura.cat != null){
                                if (aura.cat == "stun"){
                                    return;
                                };
                                if (aura.cat == "stone"){
                                    return;
                                };
                                if (aura.cat == "disabled"){
                                    return;
                                };
                            };
                        }
                        catch(e:Error) {
                            trace(("doAnim > " + e));
                        };
                    };
                    animStr = anim.animStr;
                    switch (cTyp){
                        case "p":
                            if (cAvt.objData != null){
                                if (cAvt != world.myAvatar){
                                    cAvt.target = tAvt;
                                };
                                strF = String(cLeaf.strFrame);
                                cAvt.pMC.spFX.strl = "";
                                if (((((!((strF == null))) && ((strF == world.strFrame)))) && ((cLeaf.intState > 0)))){
                                    if (cAvt != tAvt){
                                        if ((tAvt.pMC.x - cAvt.pMC.x) >= 0){
                                            cAvt.pMC.turn("right");
                                        }
                                        else {
                                            cAvt.pMC.turn("left");
                                        };
                                    };
                                    if (anim.strl != null){
										if(SkillAnimOptions == "On"){
											cAvt.pMC.spFX.strl = anim.strl;
										}
                                    };
                                    if (anim.fx != null){
                                        cAvt.pMC.spFX.fx = anim.fx;
                                    };
                                    if (tAvts != null){
                                        cAvt.pMC.spFX.avts = tAvts;
                                    };
                                    if (!isNaN(dur)){
                                        cAvt.pMC.spellDur = dur;
                                    };
                                    if (animStr.indexOf(",") > -1){
                                        animStr = animStr.split(",")[Math.round((Math.random() * (animStr.split(",").length - 1)))];
                                    };
                                    if (((!((animStr == "Thrash"))) || (!((cAvt.pMC.mcChar.currentLabel == "Thrash"))))){
                                        cAvt.pMC.queueAnim(animStr);
                                    };
                                    if (((isProc) && (cAvt.pMC.mcChar.weapon.mcWeapon.isProc))){
                                        cAvt.pMC.mcChar.weapon.mcWeapon.gotoAndPlay("Proc");
                                    };
                                };
                            };
                            return;
                        case "m":
                            if (cAvt.objData != null){
                                if (cAvt != world.myAvatar){
                                    cAvt.target = tAvt;
                                };
                                strF = String(cLeaf.strFrame);
                                cReg = cAvt.pMC.mcChar.localToGlobal(new Point(0, 0));
                                tReg = tAvt.pMC.mcChar.localToGlobal(new Point(0, 0));
                                cReg = world.CHARS.globalToLocal(cReg);
                                tReg = world.CHARS.globalToLocal(tReg);
                                if (((((!((strF == null))) && ((strF == world.strFrame)))) && ((cLeaf.intState > 0)))){
                                    if (cAvt != tAvt){
                                        if ((tReg.x - cReg.x) >= 0){
                                            cAvt.pMC.turn("right");
                                        }
                                        else {
                                            cAvt.pMC.turn("left");
                                        };
                                    };
                                    if (((((((!((anim.fx == "p"))) && (!((anim.fx == "w"))))) && (!((anim.fx == ""))))) && (((((Math.abs((cReg.x - tReg.x)) * world.SCALE) > 160)) || (((Math.abs((cReg.y - tReg.y)) * world.SCALE) > 15)))))){
                                        buffer = int((110 + (Math.random() * 50)));
                                        xBuffer = ((((tReg.x - cReg.x))>=0) ? -(buffer) : buffer);
                                        xBuffer = int((xBuffer * world.SCALE));
                                        if (((((tReg.x + xBuffer) < 0)) || (((tReg.x + xBuffer) > 1260)))){
                                            xBuffer = (xBuffer * -1);
                                        };
                                        buffer = int(((Math.random() * 30) - 15));
                                        yBuffer = ((((tReg.y - cReg.y) >= 0)) ? -(buffer) : buffer);
                                        yBuffer = int((yBuffer * world.SCALE));
                                        cAvt.pMC.walkTo((tReg.x + xBuffer), (tReg.y + yBuffer), 32);
                                    };
                                    if (cAvt.pMC.spFX != null){
                                        cAvt.pMC.spFX.avt = cAvt.target;
                                    };
                                    cReg = cAvt.pMC.mcChar.localToGlobal(new Point(0, 0));
                                    tReg = tAvt.pMC.mcChar.localToGlobal(new Point(0, 0));
                                    if (cAvt != tAvt){
                                        if ((tReg.x - cReg.x) >= 0){
                                            cAvt.pMC.turn("right");
                                        }
                                        else {
                                            cAvt.pMC.turn("left");
                                        };
                                    };
                                    if (animStr.length > 1){
                                        if (animStr.indexOf(",") > -1){
                                            if (world.objExtra["bChar"] == 1){
                                                animString = cAvt.pMC.Animation;
                                                MovieClip(cAvt.pMC.getChildAt(1)).gotoAndPlay(animString);
                                            }
                                            else {
                                                anims = animStr.split(",");
                                                animIndex = Math.round((Math.random() * (anims.length - 1)));
                                                MovieClip(cAvt.pMC.getChildAt(1)).gotoAndPlay(anims[animIndex]);
                                            };
                                        }
                                        else {
                                            if (world.objExtra["bChar"] == 1){
                                                animString = cAvt.pMC.Animation;
                                                MovieClip(cAvt.pMC.getChildAt(1)).gotoAndPlay(animString);
                                            }
                                            else {
                                                MovieClip(cAvt.pMC.getChildAt(1)).gotoAndPlay(animStr);
                                            };
                                        };
                                    };
                                };
                            };
                            return;
                    };
                };
            };
        }

        public function key_StageLogin(_arg1:KeyboardEvent){
            if (_arg1.target == stage){
                if ((_arg1.charCode == Keyboard.ENTER)){
                    stage.focus = mcLogin.ni;
                };
            };
        }

        public function key_StageGame(_arg1:KeyboardEvent){
            if (!("text" in _arg1.target)){
                if ((((_arg1.charCode == Keyboard.ENTER)) || ((String.fromCharCode(_arg1.charCode) == "/")))){
                    chatF.openMsgEntry();
                };
				/* HP Charcode Features */
				if ((((String.fromCharCode(_arg1.charCode) == "w")) && (world.myAvatar.isStaff()))){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        toggleTradePanel();
                    };
                };
				if ((((String.fromCharCode(_arg1.charCode) == "a")))){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
						_local2 = 11;
                        if (world.actionMap[_local2] != null){
                            _local4 = world.getActionByRef(world.actionMap[_local2]);
                            if (_local4.isOK){
                                world.testAction(_local4);
                            };
                        };
					};
                };
				if ((((String.fromCharCode(_arg1.charCode) == "s")))){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
						_local2 = 10;
						if (world.actionMap[_local2] != null){
							_local4 = world.getActionByRef(world.actionMap[_local2]);
							if (_local4.isOK){
								world.testAction(_local4);
							};
                        };
					};
                };
				if ((((String.fromCharCode(_arg1.charCode) == "n")) && (world.myAvatar.isStaff()))){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
						ui.mcPopup.fOpen("Mail");
                    };
                };
				if ((((String.fromCharCode(_arg1.charCode) == ",")) && (world.myAvatar.isStaff()))){ //Customization
				//if ((((String.fromCharCode(_arg1.charCode) == ".")) && (world.myAvatar.isStaff()))){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        toggleArmorCustomization();
                    };
                };
				if ((((String.fromCharCode(_arg1.charCode) == ".")) && (world.myAvatar.isStaff()))){ //Customization
				//if ((((String.fromCharCode(_arg1.charCode) == ".")) && (world.myAvatar.isStaff()))){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        toggleRefinePanel();
                    };
                };
				if (String.fromCharCode(_arg1.charCode) == "q"){ //Customization
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        toggleSkillTree();
                    };
                };
				/*
				if ((((String.fromCharCode(_arg1.charCode) == "m")))){ //Auction
				//if ((((String.fromCharCode(_arg1.charCode) == ".")) && (world.myAvatar.isStaff()))){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        toggleAuctionPanel();
                    };
                };
				*/
				if ((((String.fromCharCode(_arg1.charCode) == "m")) && (world.myAvatar.isStaff()))){ //Auction
				//if ((((String.fromCharCode(_arg1.charCode) == ".")) && (world.myAvatar.isStaff()))){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        toggleAuctionPanel();
                    };
                };
				
                if (String.fromCharCode(_arg1.charCode) == "`"){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
						ui.mcPopup.fOpen("BankPin");
                    };
                };
				if (String.fromCharCode(_arg1.charCode) == "g"){ //Guilds
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        world.showGuildList();
                    };
                };
				if (String.fromCharCode(_arg1.charCode) == "p"){ //PVP
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus)))))))
                    {
						togglePVPPanel("maps");
					};
				};
				if (String.fromCharCode(_arg1.charCode) == "k"){ //2ndInventory
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus)))))))
                    {
						ui.mcInterface.mcMenu.toggleResourceInventory();
					};
				};
                if (String.fromCharCode(_arg1.charCode) == "t"){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        if (((((!((world.myAvatar.target == null))) && (!((world.myAvatar.target.target == null))))) && (!((world.myAvatar.target == world.myAvatar.target.target))))){
                            world.setTarget(world.myAvatar.target.target);
                        };
                    };
                };
                if ((String.fromCharCode(_arg1.charCode) == ">")){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        if (((!((chatF.pmSourceA[0] == null))) && ((chatF.pmSourceA[0].length >= 1)))){
                            chatF.openPMsg(chatF.pmSourceA[0]);
                            ui.mcInterface.te.text = "> ";
                        };
                    };
                };
                if (String.fromCharCode(_arg1.charCode) == "i"){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        ui.mcInterface.mcMenu.toggleInventory();
                    };
                };
                if ((((String.fromCharCode(_arg1.charCode) == "b")) && (world.myAvatar.isStaff()))){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        world.toggleBank();
                    };
                };
                if (String.fromCharCode(_arg1.charCode) == "l"){
                    if (stage.focus != ui.mcInterface.te){
                        world.toggleQuestLog();
                    };
                };
                if (String.fromCharCode(_arg1.charCode) == "f"){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        if (ui.mcOFrame.isOpen){
                            ui.mcOFrame.fClose();
                        }
                        else {
                            world.showFriendsList();
                        };
                    };
                };
                if (String.fromCharCode(_arg1.charCode) == "c"){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        toggleCharpanel("overview");
                    };
                };
                if (String.fromCharCode(_arg1.charCode) == "v"){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        world.toggleHPBar();
                    };
                };
                if (String.fromCharCode(_arg1.charCode) == "o"){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        if (ui.mcPopup.currentLabel == "Option"){
                            ui.mcPopup.onClose();
                        }
                        else {
                            ui.mcPopup.fOpen("Option");
                        };
                    };
                };
                if (String.fromCharCode(_arg1.charCode) == "u"){
                    if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
                        if (!ui.mcOFrame.isOpen){
                            world.sendWhoRequest();
                        }
                        else {
                            ui.mcOFrame.fClose();
                        };
                    };
                };
                if (_arg1.charCode == Keyboard.SPACE){
                    if (stage.focus != ui.mcInterface.te){
                        world.myAvatar.pMC.mcChar.gotoAndPlay("Jump");
                    };
                };
                if (_arg1.charCode == Keyboard.ESCAPE){
                    if (_arg1.target != ui.mcInterface.te){
                    };
                };
            };
        }

        public function key_TextLogin(_arg1:KeyboardEvent){
            if (_arg1.target != stage){
                if ((_arg1.charCode == Keyboard.ENTER)){
                    onLoginClick(null);
                };
            };
        }

        public function key_ChatEntry(_arg1:KeyboardEvent){

			/*
            if (_arg1.charCode == Keyboard.ENTER){
                chatF.submitMsg(ui.mcInterface.te.text, chatF.chn.cur.typ, chatF.pmNm);
            };
            if (_arg1.charCode == Keyboard.ESCAPE){
                chatF.closeMsgEntry();
            };
			*/
			if (_arg1.charCode == Keyboard.ENTER){
				var chatText = ui.mcInterface.te.htmlText;
				chatText = chatText.replace(chatF.regExpLinking1, "$1")
				chatText = chatText.replace(chatF.regExpLinking2, "$1")
				chatText = chatText.replace(chatF.regExpLinking3, '<A HREF="$1">$2</A>')
				
                chatF.submitMsg(chatText, chatF.chn.cur.typ, chatF.pmNm);
            };
            if (_arg1.charCode == Keyboard.ESCAPE){
                chatF.closeMsgEntry();
            };
        }

        public function talk(_arg1){
            if (_arg1.accept){
                chatF.submitMsg(_arg1.emote1, "emote", sfc.myUserName);
            }
            else {
                chatF.submitMsg(_arg1.emote2, "emote", sfc.myUserName);
            };
        }

        public function key_actBar(_arg1:KeyboardEvent){
            var _local2:int;
            var _local3:String;
            var _local4:*;
			var uVars;
            if ((((stage.focus == null)) || (((!((stage.focus == null))) && (!(("text" in stage.focus))))))){
				switch (_arg1.keyCode){
					case 112:
						sfc.sendXtMessage("zm", "emoticon", ["smile"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Smile");
						return;
					case 113:
						sfc.sendXtMessage("zm", "emoticon", ["angry"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Angry");
						return;
					case 114:
						sfc.sendXtMessage("zm", "emoticon", ["love"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Love");
						return;
					case 115:
						sfc.sendXtMessage("zm", "emoticon", ["kiss"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Kiss");
						return;
					case 116:
						sfc.sendXtMessage("zm", "emoticon", ["wink"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Wink");
						return;
					case 117:
						sfc.sendXtMessage("zm", "emoticon", ["laugh"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Laugh");
						return;
					case 118:
						sfc.sendXtMessage("zm", "emoticon", ["cry"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Cry");
						return;
					case 119:
						sfc.sendXtMessage("zm", "emoticon", ["tongue"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Tongue");
						return;
					case 120:
						sfc.sendXtMessage("zm", "emoticon", ["blush"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Blush");
						return;
					case 121:
						sfc.sendXtMessage("zm", "emoticon", ["sad"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Sad");
						return;
					case 122:
						sfc.sendXtMessage("zm", "emoticon", ["confuse"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Confuse");
						return;
					case 123:
						sfc.sendXtMessage("zm", "emoticon", ["lmao"], "str", 1);
						world.myAvatar.pMC.EmoticonMC.visible = true;
						world.myAvatar.pMC.EmoticonMC.gotoAndStop("Lmao");
						return;
				};
                switch (_arg1.charCode){
					case 48:
						_local2 = 9;
                        if (world.actionMap[_local2] != null){
                            _local4 = world.getActionByRef(world.actionMap[_local2]);
                            if (_local4.isOK){
                                world.testAction(_local4);
                            };
                        };
                        return;
                    case 49:
                        _local2 = 0;
                        world.approachTarget();
                        return;
					case 65:
						_local2 = 10;
                        if (world.actionMap[_local2] != null){
                            _local4 = world.getActionByRef(world.actionMap[_local2]);
                            if (_local4.isOK){
                                world.testAction(_local4);
                            };
                        };
                        return;
					case 83:
						_local2 = 11;
                        if (world.actionMap[_local2] != null){
                            _local4 = world.getActionByRef(world.actionMap[_local2]);
                            if (_local4.isOK){
                                world.testAction(_local4);
                            };
                        };
                        return;
                    default:
                        if ((((_arg1.charCode > 49)) && ((_arg1.charCode < 58)))){//55
                            _local2 = (_arg1.charCode - 49);
                            if (world.actionMap[_local2] != null){
                                _local4 = world.getActionByRef(world.actionMap[_local2]);
                                if (_local4.isOK){
                                    world.testAction(_local4);
                                };
                            };
                        };
                };
            };
        }

        public function decHex(_arg1){
            return (_arg1.toString(16));
        }

        public function hexDec(_arg1){
            return (parseInt(_arg1, 16));
        }

        public function modColor(_arg1, _arg2, _arg3){
            var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local4:* = "";
            var _local8:* = 0;
            while (_local8 < 3) {
                _local5 = hexDec(_arg1.substr((_local8 * 2), 2));
                _local6 = hexDec(_arg2.substr((_local8 * 2), 2));
                switch (_arg3){
                    case "-":
                    default:
                        _local7 = (_local5 - _local6);
                        if (_local7 < 0){
                            _local7 = 0;
                        };
                        _local7 = decHex(_local7);
                        break;
                    case "+":
                        _local7 = (_local5 + _local6);
                        if (_local7 > 0xFF){
                            _local7 = 0xFF;
                        };
                        _local7 = decHex(_local7);
                };
                _local4 = (_local4 + String((((_local7.length)<2) ? ("0" + _local7) : _local7)));
                _local8++;
            };
            return (_local4);
        }
		
		function createChatBoxSender(me, other){
			var chatBox = new chatboxMC();
			chatBox.name = me + other;
			chatBox.x = 200;
			chatBox.y = 200;
			chatboxes.addChild(chatBox);
			var theName:String = me + other;
			chatboxes.theName.user_txt.text = other;
			chatboxes.theName.log_txt.text = "";
			chatboxes.theName.msg_txt.text = "";
		}
		
		function createChatBoxRcp(me, other){
			var chatBox = new chatboxMC();
			chatBox.name = other + me;
			chatBox.x = 200;
			chatBox.y = 200;
			chatboxes.addChild(chatBox);
			var theName:String = other + me;
			chatboxes.theName.user_txt.text = other;
			chatboxes.theName.log_txt.text = "";
			chatboxes.theName.msg_txt.text = "";
		}

        function replaceString(_arg1:String, _arg2:String, _arg3:String):String{
            var _local4:Number = 0;
            var _local5:Number = 0;
            var _local6 = "";
            while ((_local4 = _arg1.indexOf(_arg2, _local4)) != -1) {
                _local6 = (_local6 + (_arg1.substring(_local5, _local4) + _arg3));
                _local4 = (_local4 + _arg2.length);
                _local5 = _local4;
            };
            return ((((_local6)=="") ? _arg1 : _local6));
        }

        public function stripWhite(_arg1:String):String{
            _arg1 = _arg1.split("\r").join("");
            _arg1 = _arg1.split("\t").join("");
            _arg1 = _arg1.split(" ").join("");
            return (_arg1);
        }

        public function stripWhiteStrict(_arg1:String):String{
            _arg1 = stripWhite(_arg1);
            var _local2:int;
            while (_local2 < chatF.strictComparisonChars.length) {
                _arg1 = _arg1.split(chatF.strictComparisonChars.substr(_local2, 1)).join("");
                _local2++;
            };
            return (_arg1);
        }

        public function stripWhiteStrictB(_arg1:String):String{
            _arg1 = stripWhite(_arg1);
            var _local2:int;
            while (_local2 < chatF.strictComparisonCharsB.length) {
                _arg1 = _arg1.split(chatF.strictComparisonCharsB.substr(_local2, 1)).join("");
                _local2++;
            };
            return (_arg1);
        }

        public function stripMarks(_arg1:String):String{
            var _local2:int;
            while (_local2 < chatF.markChars.length) {
                _arg1 = _arg1.split(chatF.markChars.substr(_local2, 1)).join("");
                _local2++;
            };
            return (_arg1);
        }

        public function stripDuplicateVowels(_arg1:String):String{
            _arg1 = _arg1.replace(chatF.regExpA, "a");
            _arg1 = _arg1.replace(chatF.regExpE, "e");
            _arg1 = _arg1.replace(chatF.regExpI, "i");
            _arg1 = _arg1.replace(chatF.regExpO, "o");
            _arg1 = _arg1.replace(chatF.regExpU, "u");
            _arg1 = _arg1.replace(chatF.regExpSPACE, " ");
            return (_arg1);
        }

        public function maskStringBetween(_arg1:String, _arg2:Array):String{
            var _local4:int;
            var _local5:int;
            var _local3 = "";
            if ((((_arg2.length > 0)) && (((_arg2.length % 2) == 0)))){
                _local4 = 0;
                _local5 = 0;
                while (_local5 < _arg1.length) {
                    if ((((_local5 >= _arg2[_local4])) && ((_local5 <= _arg2[(_local4 + 1)])))){
                        if (_arg1.charAt(_local5) == " "){
                            _local3 = (_local3 + " ");
                        }
                        else {
                            _local3 = (_local3 + "*");
                        };
                        if (_local5 == _arg2[(_local4 + 1)]){
                            _local4 = (_local4 + 2);
                        };
                    }
                    else {
                        _local3 = (_local3 + _arg1.charAt(_local5));
                    };
                    _local5++;
                };
            }
            else {
                trace("");
                trace("Utility.maskStringBetween() > Malformed indeces array.  Must be in format [start,end, start,end, etc]");
                trace("");
            };
            return (_local3);
        }

        public function arraySort(_arg1:String, _arg2:String):int{
            if (_arg1 > _arg2){
                return (1);
            };
            if (_arg1 < _arg2){
                return (-1);
            };
            return (0);
        }

        public function convertBubbleText(_arg1:String):String{
            var _local2:String;
            _local2 = world.myAvatar.objData.strUsername;
            if (_arg1.indexOf("@name")){
                _arg1 = _arg1.split("@name").join(_local2);
            };
            _local2 = String(world.myAvatar.objData.intLevel);
            if (_arg1.indexOf("@level")){
                _arg1 = _arg1.split("@level").join(_local2);
            };
            _local2 = world.myAvatar.objData.strClassName;
            if (_arg1.indexOf("@class")){
                _arg1 = _arg1.split("@class").join(_local2);
            };
            _local2 = (((world.myAvatar.objData.strGender.toLowerCase())=="m") ? "Mr." : "Mrs.");
            if (_arg1.indexOf("@prefix")){
                _arg1 = _arg1.split("@prefix").join(_local2);
            };
            _local2 = (((world.myAvatar.objData.strGender.toLowerCase())=="m") ? "He" : "She");
            if (_arg1.indexOf("@He")){
                _arg1 = _arg1.split("@prefix").join(_local2);
            };
            _local2 = (((world.myAvatar.objData.strGender.toLowerCase())=="m") ? "Him" : "Her");
            if (_arg1.indexOf("@Him")){
                _arg1 = _arg1.split("@prefix").join(_local2);
            };
            _local2 = (((world.myAvatar.objData.strGender.toLowerCase())=="m") ? "His" : "Her");
            if (_arg1.indexOf("@His")){
                _arg1 = _arg1.split("@prefix").join(_local2);
            };
            _local2 = (((world.myAvatar.objData.strGender.toLowerCase())=="m") ? "he" : "she");
            if (_arg1.indexOf("@he")){
                _arg1 = _arg1.split("@prefix").join(_local2);
            };
            _local2 = (((world.myAvatar.objData.strGender.toLowerCase())=="m") ? "him" : "her");
            if (_arg1.indexOf("@him")){
                _arg1 = _arg1.split("@prefix").join(_local2);
            };
            _local2 = (((world.myAvatar.objData.strGender.toLowerCase())=="m") ? "his" : "her");
            if (_arg1.indexOf("@his")){
                _arg1 = _arg1.split("@prefix").join(_local2);
            };
            return (_arg1);
        }

        public function strToProperCase(_arg1:String):String{
            _arg1 = (_arg1.slice(0, 1).toUpperCase() + _arg1.slice(1, _arg1.length).toLowerCase());
            return (_arg1);
        }

        public function strSetCharAt(_arg1:String, _arg2:int, _arg3:String):String{
            return (((_arg1.substring(0, _arg2) + _arg3) + _arg1.substring((_arg2 + 1), _arg1.length)));
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

        public function numToStr(_arg1:Number, _arg2:int=2):String{
            var _local3:String = _arg1.toString();
            if (_local3.indexOf(".") == -1){
                _local3 = (_local3 + ".");
            };
            var _local4:Array = _local3.split(".");
            while (_local4[1].length < _arg2) {
                _local4[1] = (_local4[1] + "0");
            };
            if (_local4[1].length > _arg2){
                _local4[1] = _local4[1].substr(0, _arg2);
            };
            if (_arg2 > 0){
                _local3 = ((_local4[0] + ".") + _local4[1]);
            }
            else {
                _local3 = _local4[0];
            };
            return (_local3);
        }

        public function copyObj(_arg1:Object):Object{
            var _local2:ByteArray = new ByteArray();
            _local2.writeObject(_arg1);
            _local2.position = 0;
            return (_local2.readObject());
        }

        public function copyConstructor(_arg1){
            var _local2:ByteArray = new ByteArray();
            _local2.writeObject(_arg1);
            _local2.position = 0;
            return ((_local2.readObject() as Class));
        }

        public function distanceO(_arg1, _arg2):Number{
            return (Math.sqrt((Math.pow(int((_arg2.x - _arg1.x)), 2) + Math.pow(int((_arg2.y - _arg1.y)), 2))));
        }

        public function distanceP(_arg1, _arg2, _arg3, _arg4):Number{
            return (Math.sqrt((Math.pow((_arg3 - _arg1), 2) + Math.pow((_arg4 - _arg2), 2))));
        }

        public function distanceXY(_arg1, _arg2, _arg3, _arg4):Object{
            return ({
                dx:(_arg3 - _arg1),
                dy:(_arg4 - _arg2)
            });
        }

        public function isHouseItem(_arg1:Object):Boolean{
            return ((((((_arg1.sType == "House")) || ((_arg1.sType == "Floor Item")))) || ((_arg1.sType == "Wall Item"))));
        }

        function validateArmor(_arg1){
            var _local10:uint;
            var _local11:uint;
            var _local2:Array = [];
            var _local3:Object = {};
            var _local4:int;
            var _local5:int = 10;
            var _local6:Boolean = true;
            var _local7:Boolean;
            var _local8:Boolean;
            var _local9:int = _arg1.ItemID;
            switch (_local9){
                default:
                    break;
                case 319:
                case 2083:
                    _local7 = true;
                    _local2 = [16, 15654, 407, 20, 15651, 409];
                    break;
                case 409:
                    _local8 = true;
                    _local2 = [20, 15651];
                    break;
                case 408:
                    _local8 = true;
                    _local2 = [17, 15653];
                    break;
                case 410:
                    _local8 = true;
                    _local2 = [18, 15652];
                    break;
                case 407:
                    _local8 = true;
                    _local2 = [16, 15654];
            };
            if (_local7){
                _local10 = 0;
                while (_local10 < _local2.length) {
                    if (world.myAvatar.getCPByID(_local2[_local10]) < 302500){
                        _local6 = false;
                    }
                    else {
                        _local6 = true;
                        if (_local10 < 2){
                            _local10 = 2;
                        };
                        if ((((_local10 < 5)) && ((_local10 > 2)))) break;
                    };
                    _local10++;
                };
                return (_local6);
            };
            if (_local8){
                _local11 = 0;
                while (_local11 < _local2.length) {
                    if (world.myAvatar.getCPByID(_local2[_local11]) >= _arg1.iReqCP){
                        return (true);
                    };
                    _local11++;
                };
                return (false);
            };
            return (!((((Number(_arg1.iClass) > 0)) && ((world.myAvatar.getCPByID(_arg1.iClass) < _arg1.iReqCP)))));
        }

        public function getItemInfoString(_arg1:Object):String{
            var _local3:int;
            var _local4:*;
            var _local5:int;
            var _local6:*;
            var _local7:*;
            var _local8:*;
            var _local9:*;
            var _local10:*;
            var _local11:*;
            var _local12:*;
            var _local13:*;
            var _local14:*;
            var _local15:*;
            var _local2:* = (("<font size='14'><b>" + _arg1.sName) + "</b></font><br>");
            if (((!(validateArmor(_arg1))) && ((_arg1.iClass > 0)))){
                _local2 = (_local2 + "<font size='11' color='#CC0000'>");
                _local3 = getRankFromPoints(_arg1.iReqCP);
                _local4 = (_arg1.iReqCP - arrRanks[(_local3 - 1)]);
                if (_local4 > 0){
                    _local2 = (_local2 + (((((("Requires " + _local4) + " Class Points on ") + _arg1.sClass) + ", Rank ") + _local3) + "."));
                }
                else {
                    _local2 = (_local2 + (((("Requires " + _arg1.sClass) + ", Rank ") + _local3) + "."));
                };
                _local2 = (_local2 + "</font><br>");
            };
            if ((((_arg1.FactionID > 1)) && ((world.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))){
                _local2 = (_local2 + "<font size='11' color='#CC0000'>");
                _local5 = getRankFromPoints(_arg1.iReqRep);
                _local6 = (_arg1.iReqRep - arrRanks[(_local3 - 1)]);
                if (_local6 > 0){
                    _local2 = (_local2 + (((((("Requires " + _local6) + " Reputation on ") + _arg1.sFaction) + ", Rank ") + _local5) + "."));
                }
                else {
                    _local2 = (_local2 + (((("Requires " + _arg1.sFaction) + ", Rank ") + _local5) + "."));
                };
                _local2 = (_local2 + "</font><br>");
            };
            if ((((_arg1.iQSindex >= 0)) && ((world.getQuestValue(_arg1.iQSindex) < int(_arg1.iQSvalue))))){
                _local2 = (_local2 + (("<font size='11' color='#CC0000'>Requires completion of quest \"" + _arg1.sQuest) + '".</font><br>'));
            };
            _local2 = (_local2 + ("<font color='#009900'><b>" + getDisplaysType(_arg1)));
            if (((!((_arg1.sES == "None"))) && (!((_arg1.sES == "co"))))){
                if (_arg1.RefineID > 0){
                    _local2 = (_local2 + (", Lvl " + _arg1.RefineLvl));
                    if (_arg1.sES == "Weapon"){
                        _local7 = getBaseHPByLevel(_arg1.RefineLvl);
                        _local8 = 20;
                        _local9 = 1;
                        _local10 = (_arg1.iRng / 100);
                        _local11 = 2;
                        _local12 = Math.round(((_local7 / _local8) * _local9));
                        _local13 = Math.round((_local12 * _local11));
                        _local14 = Math.floor((_local13 - (_local13 * _local10)));
                        _local15 = Math.ceil((_local13 + (_local13 * _local10)));
                        _local2 = (_local2 + ((((("<br>" + _local14) + " - ") + _local15) + " ") + _arg1.sElmt));
                    };
                }
                else {
                    _local2 = (_local2 + " Design");
                };
            };
            _local2 = (_local2 + (("</b></font><br>" + _arg1.sDesc) + "<br>"));
            return (_local2);
        }

        public function getItemInfoStringB(_arg1:Object):String{
            var _local3:int;
            var _local4:*;
            var _local5:int;
            var _local6:*;
			var iTag;
			if(_arg1.iRefine != ""){
				iTag = _arg1.iRefine + " ";
			} else {
				iTag = "";
			}
            var _local2:* = (("<font size='12'><b><font color='#00FF00'>" + iTag + "</font>" + _arg1.sName) + "</b></font><br>");
            if (((!(validateArmor(_arg1))) && ((_arg1.iClass > 0)))){
                _local2 = (_local2 + "<font size='10' color='#CC0000'>");
                _local3 = getRankFromPoints(_arg1.iReqCP);
                _local4 = (_arg1.iReqCP - arrRanks[(_local3 - 1)]);
                if (_local4 > 0){
                    _local2 = (_local2 + (((((("Requires " + _local4) + " Class Points on ") + _arg1.sClass) + ", Rank ") + _local3) + "."));
                }
                else {
                    _local2 = (_local2 + (((("Requires " + _arg1.sClass) + ", Rank ") + _local3) + "."));
                };
                _local2 = (_local2 + "</font><br>");
            };
            if ((((_arg1.FactionID > 1)) && ((world.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))){
                _local2 = (_local2 + "<font size='10' color='#CC0000'>");
                _local5 = getRankFromPoints(_arg1.iReqRep);
                _local6 = (_arg1.iReqRep - arrRanks[(_local3 - 1)]);
                if (_local6 > 0){
                    _local2 = (_local2 + (((((("Requires " + _local6) + " Reputation on ") + _arg1.sFaction) + ", Rank ") + _local5) + "."));
                }
                else {
                    _local2 = (_local2 + (((("Requires " + _arg1.sFaction) + ", Rank ") + _local5) + "."));
                };
                _local2 = (_local2 + "</font><br>");
            };
            if ((((_arg1.iQSindex >= 0)) && ((world.getQuestValue(_arg1.iQSindex) < int(_arg1.iQSvalue))))){
                _local2 = (_local2 + (("<font size='11' color='#CC0000'>Requires completion of quest \"" + _arg1.sQuest) + '".</font><br>'));
            };
            if (((((!((_arg1.sMeta == null))) && ((getDisplaysType(_arg1) == "Pet")))) && ((_arg1.sMeta.indexOf("Necromancer") > -1)))){
                _local2 = (_local2 + ("<font color='#00CCFF'><b>Battle " + getDisplaysType(_arg1)));
            }
            else {
                _local2 = (_local2 + ("<font color='#00CCFF'><b>" + getDisplaysType(_arg1)));
            };
            if (_arg1.sType.toLowerCase() == "refinement"){
                _local2 = (_local2 + (", Level " + _arg1.iLvl));
            };
            if (((((!((_arg1.sES == "None"))) && (!((_arg1.sES == "co"))))) && (!((_arg1.sES == "pe"))))){
                if (_arg1.RefineID > 0){
                    _local2 = (_local2 + (", Level " + _arg1.RefineLvl));
                    if (_arg1.sES == "ar"){
                        _local2 = (_local2 + ("<br>Rank " + getRankFromPoints(_arg1.iQty)));
                    };
                }
                else {
                    if (_arg1.sType.toLowerCase() != "refinement"){
                        _local2 = (_local2 + " Design");
                    };
                };
            };
            if ((((((((((((_arg1.sES == "Weapon")) || ((_arg1.sES == "co")))) || ((_arg1.sES == "he")))) || ((_arg1.sES == "ba")))) || ((_arg1.sES == "pe")))) || ((_arg1.sES == "am")))){
                if (_arg1.sType.toLowerCase() != "refinement"){
                    _local2 = (_local2 + (("<br>" + getRarityString(_arg1.iRty)) + " Rarity"));
                };
            };
            if (_arg1.sType.toLowerCase() != "refinement"){
                _local2 = (_local2 + (("</b></font><br><font size='10' color='#FFFFFF'>" + _arg1.sDesc) + "<br></font>"));
            }
            else {
                _local2 = (_local2 + "</b></font><br><font size='10' color='#FFFFFF'>");
                _local2 = (_local2 + "Refinements are special items which can apply stats to your weapons and armor. Select a weapon or armor item from the list on the right, and click the <font color='#00CCFF'>\"Refinement\"</font> button that appears below its preview.");
            };
            return (_local2);
        }

        public function getIconByType(_arg1:String):String{
            var _local2 = "";
            switch (_arg1.toLowerCase()){
                case "axe":
                case "bow":
                case "dagger":
                case "gun":
                case "mace":
                case "polearm":
                case "staff":
                case "sword":
                case "wand":
                case "armor":
                    _local2 = ("iw" + _arg1.toLowerCase());
                    break;
                case "cape":
                case "helm":
                case "pet":
                case "class":
                    _local2 = ("ii" + _arg1.toLowerCase());
                    break;
                default:
                    _local2 = "iibag";
            };
            return (_local2);
        }

        public function getIconBySlot(_arg1:String):String{
            var _local2 = "";
            switch (_arg1.toLowerCase()){
                case "weapon":
                    _local2 = "iwsword";
                    break;
                case "back":
                case "ba":
                    _local2 = "iicape";
                    break;
                case "head":
                case "he":
                    _local2 = "iihelm";
                    break;
                case "armor":
                case "ar":
                    _local2 = "iiclass";
                    break;
                case "class":
                    _local2 = "iiclass";
                    break;
                case "pet":
                case "pe":
                    _local2 = "iipet";
                    break;
                default:
                    _local2 = "iibag";
            };
            return (_local2);
        }

        public function getDisplaysType(_arg1:Object){
            var _local2:String = (((_arg1.sType)!=null) ? _arg1.sType : "Unknown");
            var _local3:String = _local2.toLowerCase();
            if ((((_local3 == "clientuse")) || ((_local3 == "serveruse")))){
                _local2 = "Item";
            };
            return (_local2);
        }

        public function stringToDate(_arg1:String):Date{
            var _local2:* = Number(_arg1.substr(0, 4));
            var _local3:* = (Number(_arg1.substr(5, 2)) - 1);
            var _local4:* = Number(_arg1.substr(8, 2));
            var _local5:* = Number(_arg1.substr(11, 2));
            var _local6:* = Number(_arg1.substr(14, 2));
            var _local7:* = Number(_arg1.substr(17));
            return (new Date(_local2, _local3, _local4, _local5, _local6, _local7));
        }

        function traceObject(_arg1, _arg2=1){
            var _local4:*;
            var _local5:*;
            var _local3:* = "";
            while (_local3.length < _arg2) {
                _local3 = (_local3 + " ");
            };
            _arg2++;
            if ((((typeof(_arg1) == "object")) && (!((_arg1.length == null))))){
                _local4 = 0;
                while (_local4 < _arg1.length) {
                    trace((((_local3 + _local4) + ": ") + _arg1[_local4]));
                    _local4++;
                };
            }
            else {
                for (_local5 in _arg1) {
                    trace((((_local3 + _local5) + ": ") + _arg1[_local5]));
                    if (typeof(_arg1[_local5]) == "object"){
                        traceObject(_arg1[_local5], _arg2);
                    };
                };
            };
        }

        public function max(_arg1:int, _arg2:int):int{
            if (_arg1 > _arg2){
                return (_arg1);
            };
            return (_arg2);
        }

        public function clamp(_arg1:Number, _arg2:Number, _arg3:Number):Number{
            if (_arg1 < _arg2){
                return (_arg2);
            };
            if (_arg1 > _arg3){
                return (_arg3);
            };
            return (_arg1);
        }

        public function isValidEmail(_arg1:String):Boolean{
            return (Boolean(_arg1.match(EMAIL_REGEX)));
        }

        public function closeToolTip():void{
            var _local1:*;
            try {
                _local1 = MovieClip(stage.getChildAt(0)).ui.ToolTip;
                _local1.close();
            }
            catch(e:Error) {
            };
        }

        public function updateIcons(_arg1:Array, _arg2:Array, _arg3:Object=null){
            var _local6:MovieClip;
            var _local7:Class;
            var _local8:*;
            var _local9:*;
            var _local10:*;
            var _local11:*;
            var _local12:*;
            var _local13:*;
            var _local4:int;
            var _local5:int;
            _local4 = 0;
            while (_local4 < _arg1.length) {
                _local6 = _arg1[_local4];
                _local6.cnt.removeChildAt(0);
                _local6.item = _arg3;
                if (_local6.item == null){
                    _local6.tQty.visible = false;
                };
                while (_local5 < _arg2.length) {
                    _local7 = (world.getClass(_arg2[_local5]) as Class);
                    _local8 = new (_local7)();
                    _local9 = _local6.cnt.addChild(_local8);
                    _local10 = int(((42 - 8) + (4 * _local5)));
                    _local11 = int(((39 - 8) + (4 * _local5)));
                    _local12 = _local9.width;
                    _local13 = _local9.height;
                    if (_local12 > _local13){
                        //_local9.scaleX = (_local9.scaleY = (_local10 / _local12));
						_local9.scaleX = 1;
						_local9.scaleY = 1;
                    }
                    else {
					////////////////SKILLICON
                        //_local9.scaleX = (_local9.scaleY = (_local11 / _local13));
						_local9.scaleX = 1;
						_local9.scaleY = 1;
                    };
                    //_local9.x = ((_local6.bg.width / 2) - (_local9.width / 2));
                    //_local9.y = ((_local6.bg.height / 2) - (_local9.height / 2));
                    _local5++;
                };
                _local4++;
            };
        }

        public function updateActionObjIcon(_arg1:Object):void{
            var _local3:MovieClip;
            var _local4:Object;
            var _local6:int;
            var _local7:int;
            var _local2:Array = world.getActIcons(_arg1);
            var _local5:* = 0;
            while (_local5 < _local2.length) {
                _local3 = _local2[_local5];
                _local4 = _local3.item;
                if (_local4 != null){
                    _local6 = 0;
                    while (_local7 < world.myAvatar.items.length) {
                        if (world.myAvatar.items[_local7].ItemID == _local4.ItemID){
                            _local6 = int(world.myAvatar.items[_local7].iQty);
                        };
                        _local7++;
                    };
                    if (_local6 > 0){
                        _local3.tQty.visible = true;
                        _local3.tQty.text = _local6;
                    }
                    else {
                        world.unequipUseableItem(_local4);
                    };
                };
                _local5++;
            };
        }

        public function drawChainsSmooth(_arg1:Array, _arg2:int, _arg3:MovieClip):void{
            var _local4:Point;
            var _local5:Point;
            var _local6:int;
            var _local7:Array;
            var _local8:int;
            var _local9:int;
            var _local10:int;
            var _local11:Point;
            var _local12:Array;
            var _local13:MovieClip;
            var _local14:int;
            var _local15:int;
            _local6 = 1;
            while (_local6 < _arg1.length) {
                _local4 = new Point(0, 0);
                _local5 = new Point(0, 0);
                _local4 = _arg1[(_local6 - 1)].localToGlobal(_local4);
                _local5 = _arg1[_local6].localToGlobal(_local5);
                _local7 = [];
                _local8 = 0;
                _local9 = 0;
                _local10 = Math.ceil((Point.distance(_local4, _local5) / _arg2));
                if ((_local10 % 2) == 1){
                    _local10 = (_local10 + 1);
                };
                _local11 = new Point();
                _local12 = [_arg3.fx0, _arg3.fx1, _arg3.fx2];
                _local14 = -1;
                _local8 = 0;
                while (_local8 < _local12.length) {
                    _local7 = [];
                    _local14 = (((Math.random())>0.5) ? 1 : -1);
                    _local15 = 0;
                    _local9 = 1;
                    while (_local9 < _local10) {
                        _local11 = Point.interpolate(_local4, _local5, (1 - (_local9 / _local10)));
                        ++_local15;
                        if ((_local15 % 2) == 1){
                            _local11.x = (_local11.x + (_local14 * Math.round((Math.random() * 30))));
                            _local11.y = (_local11.y + (_local14 * Math.round((Math.random() * 30))));
                            _local14 = -(_local14);
                        };
                        _local7.push(_local11);
                        _local9++;
                    };
                    _local7.push(_local5);
                    _local13 = _local12[_local8];
                    _local13.graphics.lineStyle(2, 0xFFFFFF, 1);
                    _local13.graphics.moveTo(_local4.x, _local4.y);
                    _local9 = 0;
                    while (_local9 < _local7.length) {
                        _local13.graphics.curveTo(_local7[_local9].x, _local7[_local9].y, _local7[(_local9 + 1)].x, _local7[(_local9 + 1)].y);
                        _local9 = (_local9 + 2);
                    };
                    _local8++;
                };
                _local6++;
            };
        }

        public function drawChainsLinear(_arg1:Array, _arg2:int, _arg3:MovieClip):void{
            var _local4:Point;
            var _local5:Point;
            var _local6:MovieClip;
            var _local7:MovieClip;
            var _local8:int;
            var _local9:Array;
            var _local10:int;
            var _local11:int;
            var _local12:int;
            var _local13:Point;
            var _local14:Array;
            var _local15:MovieClip;
            _local8 = 1;
            while (_local8 < _arg1.length) {
                _local6 = _arg1[(_local8 - 1)];
                _local7 = _arg1[_local8];
                _local4 = new Point(0, (-(_local6.height) * 0.5));
                _local5 = new Point(0, (-(_local7.height) * 0.5));
                _local4 = _local6.localToGlobal(_local4);
                _local5 = _local7.localToGlobal(_local5);
                _local9 = [];
                _local10 = 0;
                _local11 = 0;
                _local12 = Math.ceil((Point.distance(_local4, _local5) / _arg2));
                _local13 = new Point();
                _local14 = [_arg3.fx0, _arg3.fx1, _arg3.fx2];
                _local10 = 0;
                while (_local10 < _local14.length) {
                    _local9 = [];
                    _local11 = 1;
                    while (_local11 < _local12) {
                        _local13 = Point.interpolate(_local4, _local5, (1 - (_local11 / (_local12 + 1))));
                        _local13.x = (_local13.x + Math.round(((Math.random() * 25) - 13)));
                        _local13.y = (_local13.y + Math.round(((Math.random() * 25) - 13)));
                        _local9.push(_local13);
                        _local11++;
                    };
                    _local15 = _local14[_local10];
                    _local15.graphics.lineStyle(5, 0xFFFFFF, 1);
                    _local15.graphics.moveTo(_local4.x, _local4.y);
                    _local11 = 0;
                    while (_local11 < _local9.length) {
                        _local15.graphics.lineTo(_local9[_local11].x, _local9[_local11].y);
                        _local11++;
                    };
                    _local15.graphics.lineTo(_local5.x, _local5.y);
                    _local10++;
                };
                _local8++;
            };
        }

        public function drawFunnel(_arg1:Array, _arg2:MovieClip):void{
            var _local3:MovieClip;
            _arg2.numLines = 3;
            _arg2.lineThickness = 3;
            _arg2.lineColors = [0x9900AA, 0, 0x220066];
            _arg2.glowColors = [0];
            _arg2.glowStrength = 4;
            _arg2.glowSize = 4;
            _arg2.dur = 500;
            _arg2.del = 100;
            _arg2.p1StartingValue = 0.12;
            _arg2.p2StartingValue = 0.24;
            _arg2.p3StartingValue = 0.36;
            _arg2.p1EndingValue = 0.66;
            _arg2.p2EndingValue = 0.825;
            _arg2.p3EndingValue = 0.99;
            _arg2.p1ScaleFactor = 0.5;
            _arg2.p3ScaleFactor = 0.5;
            _arg2.easingExponent = 1.5;
            _arg2.targetMCs = _arg1;
            _arg2.filterArr = [];
            _arg2.fxArr = [];
            _arg2.ts = new Date().getTime();
            var _local4:int;
            var _local5:int;
            _local4 = 0;
            while (_local4 < _arg2.glowColors.length) {
                _arg2.filterArr.push([new GlowFilter(_arg2.glowColors[_local4], 1, _arg2.glowSize, _arg2.glowSize, _arg2.glowStrength, 1, false, false)]);
                _local4++;
            };
            _local4 = 0;
            _local5 = 0;
            var _local6:int;
            while (_local6 < _arg2.numLines) {
                _local3 = (_arg2.addChild(new MovieClip()) as MovieClip);
                _local3.filters = _arg2.filterArr[_local4];
                ++_local4;
                if (_local4 >= _arg2.glowColors.length){
                    _local4 = 0;
                };
                _local3.lineColor = _arg2.lineColors[_local5];
                ++_local5;
                if (_local5 >= _arg2.lineColors.length){
                    _local5 = 0;
                };
                _arg2.fxArr.push(_local3);
                _local6++;
            };
            _arg2.addEventListener(Event.ENTER_FRAME, funnelEF, false, 0, true);
        }

        function funnelEF(_arg1:Event):void{
            var _local3:MovieClip;
            var _local8:Number;
            var _local9:Number;
            var _local17:Point;
            var _local18:Point;
            var _local19:Point;
            var _local20:Point;
            var _local21:Point;
            var _local22:Point;
            var _local26:Number;
            var _local29:Number;
            var _local30:Number;
            var _local2:MovieClip = MovieClip(_arg1.currentTarget);
            var _local4:Number = new Date().getTime();
            var _local5:Point = new Point();
            var _local6:Point = new Point();
            var _local7:Point = new Point();
            var _local10:int = 1;
            var _local11:MovieClip = _local2.targetMCs[0];
            var _local12:MovieClip = _local2.targetMCs[1];
            var _local13:Point = _local11.localToGlobal(new Point(0, (-(_local11.height) / 2)));
            var _local14:Point = _local12.localToGlobal(new Point(0, (-(_local12.height) / 2)));
            var _local15:* = _local12.width;
            var _local16:* = _local12.height;
            var _local23:int = -1;
            var _local24:int;
            var _local25:int;
            var _local27:Number = Math.atan2((_local13.y - _local14.y), (_local13.x - _local14.x));
            _local27 = (_local27 - (Math.PI / 2));
            var _local28:int;
            while (_local28 < _local2.fxArr.length) {
                _local3 = _local2.fxArr[_local28];
                _local9 = _local2.ts;
                _local8 = (_local4 - (_local28 * _local2.del));
                if (_local8 > (_local9 + _local2.dur)){
                    if (_local3.visible){
                        _local3.visible = false;
                        _local3.graphics.clear();
                    };
                    if (_local28 == (_local2.fxArr.length - 1)){
                        _local2.removeEventListener(Event.ENTER_FRAME, funnelEF);
                        if (_local2.parent != null){
                            _local2.parent.removeChild(_local2);
                        };
                    };
                }
                else {
                    if (_local8 >= _local2.ts){
                        _local29 = ((_local8 - _local9) / _local2.dur);
                        _local29 = Math.pow((1 - _local29), _local2.easingExponent);
                        _local10 = ((((_local28 % 2))==0) ? 1 : -1);
                        _local17 = new Point((Point.interpolate(_local13, _local14, _local2.p1StartingValue).x + Point.polar((_local10 * (_local12.height / _local2.p1ScaleFactor)), _local27).x), (Point.interpolate(_local13, _local14, _local2.p1StartingValue).y + Point.polar((_local10 * (_local12.height / _local2.p1ScaleFactor)), _local27).y));
                        _local18 = new Point(Point.interpolate(_local13, _local14, _local2.p1EndingValue).x, Point.interpolate(_local13, _local14, _local2.p1EndingValue).y);
                        _local19 = new Point(Point.interpolate(_local13, _local14, _local2.p2StartingValue).x, _local14.y);
                        _local20 = new Point(Point.interpolate(_local13, _local14, _local2.p2EndingValue).x, Point.interpolate(_local13, _local14, _local2.p2EndingValue).y);
                        _local21 = new Point((Point.interpolate(_local13, _local14, _local2.p3StartingValue).x + Point.polar((-(_local10) * (_local12.height / _local2.p3ScaleFactor)), _local27).x), (Point.interpolate(_local13, _local14, _local2.p3StartingValue).y + Point.polar((-(_local10) * (_local12.height / _local2.p3ScaleFactor)), _local27).y));
                        _local22 = new Point(Point.interpolate(_local13, _local14, _local2.p3EndingValue).x, Point.interpolate(_local13, _local14, _local2.p3EndingValue).y);
                        _local5 = Point.interpolate(_local17, _local18, _local29);
                        _local6 = Point.interpolate(_local19, _local20, _local29);
                        _local7 = Point.interpolate(_local21, _local22, _local29);
                        _local26 = _local3.lineColor;
                        _local3.graphics.clear();
                        _local3.graphics.lineStyle(_local2.lineThickness, _local26, 1);
                        _local3.graphics.moveTo(_local14.x, _local14.y);
                        _local3.graphics.curveTo(_local5.x, _local5.y, _local6.x, _local6.y);
                        _local3.graphics.curveTo(_local7.x, _local7.y, _local13.x, _local13.y);
                        _local30 = Math.cos(((((_local8 - _local9) / _local2.dur) * Math.PI) * 2));
                        _local30 = ((_local30 / 2) + 0.5);
                        _local30 = (1 - _local30);
                        _local3.alpha = _local30;
                    };
                };
                _local28++;
            };
        }

        public function updateCoreValues(_arg1:Object):void{
            if (_arg1.intLevelCap != null){
                intLevelCap = _arg1.intLevelCap;
            };
            if (_arg1.PCstBase != null){
                PCstBase = _arg1.PCstBase;
            };
            if (_arg1.PCstRatio != null){
                PCstRatio = _arg1.PCstRatio;
            };
            if (_arg1.PCstGoal != null){
                PCstGoal = _arg1.PCstGoal;
            };
            if (_arg1.GstBase != null){
                GstBase = _arg1.GstBase;
            };
            if (_arg1.GstRatio != null){
                GstRatio = _arg1.GstRatio;
            };
            if (_arg1.GstGoal != null){
                GstGoal = _arg1.GstGoal;
            };
            if (_arg1.PChpBase1 != null){
                PChpBase1 = _arg1.PChpBase1;
            };
            if (_arg1.PChpBase100 != null){
                PChpBase100 = _arg1.PChpBase100;
            };
            if (_arg1.PChpGoal1 != null){
                PChpGoal1 = _arg1.PChpGoal1;
            };
            if (_arg1.PChpGoal100 != null){
                PChpGoal100 = _arg1.PChpGoal100;
            };
            if (_arg1.PChpDelta != null){
                PChpDelta = _arg1.PChpDelta;
            };
            if (_arg1.intHPperEND != null){
                intHPperEND = _arg1.intHPperEND;
            };
            if (_arg1.intAPtoDPS != null){
                intAPtoDPS = _arg1.intAPtoDPS;
            };
            if (_arg1.intSPtoDPS != null){
                intSPtoDPS = _arg1.intSPtoDPS;
            };
            if (_arg1.bigNumberBase != null){
                bigNumberBase = _arg1.bigNumberBase;
            };
            if (_arg1.resistRating != null){
                resistRating = _arg1.resistRating;
            };
            if (_arg1.modRating != null){
                modRating = _arg1.modRating;
            };
            if (_arg1.baseDodge != null){
                baseDodge = _arg1.baseDodge;
            };
            if (_arg1.baseBlock != null){
                baseBlock = _arg1.baseBlock;
            };
            if (_arg1.baseParry != null){
                baseParry = _arg1.baseParry;
            };
            if (_arg1.baseCrit != null){
                baseCrit = _arg1.baseCrit;
            };
            if (_arg1.baseHit != null){
                baseHit = _arg1.baseHit;
            };
            if (_arg1.baseHaste != null){
                baseHaste = _arg1.baseHaste;
            };
            if (_arg1.baseMiss != null){
                baseMiss = _arg1.baseMiss;
            };
            if (_arg1.baseResist != null){
                baseResist = _arg1.baseResist;
            };
            if (_arg1.baseCritValue != null){
                baseCritValue = _arg1.baseCritValue;
            };
            if (_arg1.baseBlockValue != null){
                baseBlockValue = _arg1.baseBlockValue;
            };
            if (_arg1.baseResistValue != null){
                baseResistValue = _arg1.baseResistValue;
            };
            if (_arg1.baseEventValue != null){
                baseEventValue = _arg1.baseEventValue;
            };
            if (_arg1.PCDPSMod != null){
                PCDPSMod = _arg1.PCDPSMod;
            };
            if (_arg1.curveExponent != null){
                curveExponent = _arg1.curveExponent;
            };
            if (_arg1.statsExponent != null){
                statsExponent = _arg1.statsExponent;
            };
        }

        function spaceBy(_arg1:int, _arg2:int):String{
            var _local3:String = String(_arg1);
            while (_local3.length < _arg2) {
                _local3 = (_local3 + " ");
            };
            return (_local3);
        }

        function spaceNumBy(_arg1:Number, _arg2:int):String{
            var _local3:String = _arg1.toString();
            _local3 = _local3.substr(0, _arg2);
            while (_local3.length < _arg2) {
                _local3 = (_local3 + " ");
            };
            return (_local3);
        }

        function showRatings():void{
            var _local6:*;
            var _local7:*;
            var _local8:*;
            var _local9:*;
            var _local10:*;
            var _local11:*;
            var _local12:*;
            var _local13:*;
            var _local14:*;
            var _local15:*;
            var _local16:*;
            trace("showRatings >");
            var _local1:* = world.myAvatar.dataLeaf;
            var _local2:* = "";
            var _local3:* = 1;
            var _local4:* = 0;
            var _local5:* = 0;
            _local3 = 1;
            while (_local3 <= 35) {
                if (_local3 == 0){
                    _local3 = 1;
                };
                _local6 = getInnateStats(_local3);
                _local7 = getIBudget(_local3, 1);
                _local8 = -1;
                _local9 = -1;
                _local10 = -1;
                _local11 = -1;
                _local12 = _local1.sCat;
                _local13 = copyObj(_local1.sta);
                resetTableValues(_local13);
                _local14 = getBaseHPByLevel(_local3);
                _local15 = ((_local14 / 20) * 0.7);
                _local16 = (((2.25 * _local15) / (100 / intAPtoDPS)) / 2);
                trace(("Level " + _local3));
                _local4 = 0;
                while (_local4 < stats.length) {
                    _local2 = stats[_local4];
                    _local11 = _local13[("$" + _local2)];
                    switch (_local2){
                        case "STR":
                            _local8 = _local16;
                            _local13.$ap = (_local13.$ap + (_local11 * 2));
                            _local13.$tcr = (_local13.$tcr + (((_local11 / _local8) / 100) * 0.4));
                            trace(((((((((((("  " + spaceBy(_local14, 5)) + "  |  ") + spaceBy(_local11, 4)) + "  |  ") + spaceNumBy(_local8, 4)) + "  |  ") + spaceNumBy(_local6, 6)) + "  |  ") + spaceNumBy(_local7, 6)) + "  |  ") + spaceNumBy(_local13.$tcr, 6)));
                            break;
                    };
                    _local4++;
                };
                trace("");
                _local3 = (_local3 + 1);
            };
        }
		
		public function showMenuButton():void
        {
			//mcGameMenu.visible = false;
            if (world.myAvatar != null){
				ui.mcInterface.mcMenu.btnRest.visible = true;
				ui.mcInterface.mcMenu.btnChar.visible = false;
				ui.mcInterface.mcMenu.btnQuest.visible = false;
				ui.mcInterface.mcMenu.btnMap.visible = false;
				ui.mcInterface.mcMenu.btnFly.visible = false;
				ui.mcInterface.mcMenu.btnMenu.visible = true;
				ui.mcInterface.mcMenu.btnBag.visible = false;
				ui.mcInterface.mcMenu.btnOption.visible = true;
			};

			/** BUTTON INITIALIZER **/
			if (world.getQuestValue(1) == 0){
				world.attachIntroMovie("MCTutorialIntro");
			};
			if (world.getQuestValue(1) == 2){
				world.attachHelpMovie("MCTutorialInventory");
			};
			if (world.getQuestValue(1) >= 2){
				ui.mcInterface.mcMenu.btnBag.visible = true;
			};
			if (world.getQuestValue(1) == 4){
				world.attachHelpMovie("MCTutorialSkillStat");
			};
			if (world.getQuestValue(1) >= 4){
				ui.mcInterface.mcMenu.btnQuest.visible = true;
				ui.mcInterface.mcMenu.btnChar.visible = true;
			};
			if (world.getQuestValue(1) == 6){
				world.attachHelpMovie("MCTutorialWorldMap");
			};
			if (world.getQuestValue(1) >= 6){
				ui.mcInterface.mcMenu.btnMap.visible = true;
				ui.mcInterface.mcMenu.btnFly.visible = true;
			};
        }
		
		/** BOSS PORTRAIT **/
		public function showPetBox(PetFile:Object, PetLink:Object){
			ldr = new Loader();
			strSkinLinkage = PetLink;
            ldr.load(new URLRequest(serverFilePath + PetFile), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onPetLoadComplete);
            ldr.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        }
		
		public function onPetLoadComplete(evt:Event)
        {
            var AssetClass:Class;
            var evt:Event = evt;
			var mc:MovieClip;
			var child:DisplayObject;
            mc = (ui.mcPetPortrait.mcHead as MovieClip);
			
			var _local4 = (getDefinitionByName(("mcHead" + strSkinLinkage)) as Class);
			AssetClass = _local4;
			_local4 = mc.head.getChildByName("face");
			child = _local4;	
			if (child != null){
                mc.head.removeChild(child);
			};
			(mc.head.addChildAt(new (AssetClass)(), 0).name = "face");
			(mc.head.hair.visible = false);
			(mc.head.helm.visible = false);
			(mc.backhair.visible = false);
			ui.mcPetPortrait.visible = true;
        }
		
		private function ioErrorHandler(event:IOErrorEvent):void
        {
            trace(("ioErrorHandler: " + event));
        }

        public function applyCoreStatRatings(_arg1:Object, _arg2:Object):void{
            var _local3:int = 1;
            var _local4:* = 100;
            var _local5:Object = world.myAvatar.getEquippedItemBySlot("Weapon");
            if (_local5 != null){
                if (_local5.RefineLvl != null){
                    _local3 = _local5.RefineLvl;
                };
                if (_local5.RefineDPS != null){
                    _local4 = Number(_local5.RefineDPS);
                };
                if (_local4 == 0){
                    _local4 = 100;
                };
            };
            _local4 = (_local4 / 100);
            var _local6:int = _arg2.intLevel;
            var _local7 = "";
            var _local8:int = getInnateStats(_local6);
            var _local9:Number = -1;
            var _local10:Number = -1;
            var _local11:Number = -1;
            var _local12:int = -1;
            var _local13:String = world.myAvatar.objData.sClassCat;
            var _local14:int = getBaseHPByLevel(_local6);
            var _local15:int = 20;
            var _local16:* = ((_local14 / 20) * 0.7);
            var _local17:Number = (((2.25 * _local16) / (100 / intAPtoDPS)) / 2);
            resetTableValues(_arg1);
            var _local18:int;
            while (_local18 < stats.length) {
                _local7 = stats[_local18];
                _local12 = (_arg1[("_" + _local7)] + _arg1[("^" + _local7)]);
                switch (_local7){
                    case "STR":
                        _local9 = _local17;
                        if (_local13 == "M1"){
                            _arg1.$sbm = (_arg1.$sbm - (((_local12 / _local9) / 100) * 0.3));
                        };
                        if (_local13 == "S1"){
                            _arg1.$ap = (_arg1.$ap + Math.round((_local12 * 1.4)));
                        }
                        else {
                            _arg1.$ap = (_arg1.$ap + (_local12 * 2));
                        };
                        if ((((((((((_local13 == "M1")) || ((_local13 == "M2")))) || ((_local13 == "M3")))) || ((_local13 == "M4")))) || ((_local13 == "S1")))){
                            if (_local13 == "M4"){
                                _arg1.$tcr = (_arg1.$tcr + (((_local12 / _local9) / 100) * 0.7));
                            }
                            else {
                                _arg1.$tcr = (_arg1.$tcr + (((_local12 / _local9) / 100) * 0.4));
                            };
                        };
                        break;
                    case "INT":
                        _local9 = _local17;
                        _arg1.$cmi = (_arg1.$cmi - ((_local12 / _local9) / 100));
                        if ((((_local13.substr(0, 1) == "C")) || ((_local13 == "M3")))){
                            _arg1.$cmo = (_arg1.$cmo + ((_local12 / _local9) / 100));
                        };
                        if (_local13 == "S1"){
                            _arg1.$sp = (_arg1.$sp + Math.round((_local12 * 1.4)));
                        }
                        else {
                            _arg1.$sp = (_arg1.$sp + (_local12 * 2));
                        };
                        if ((((((((((_local13 == "C1")) || ((_local13 == "C2")))) || ((_local13 == "C3")))) || ((_local13 == "M3")))) || ((_local13 == "S1")))){
                            if (_local13 == "C2"){
                                _arg1.$tha = (_arg1.$tha + (((_local12 / _local9) / 100) * 0.5));
                            }
                            else {
                                _arg1.$tha = (_arg1.$tha + (((_local12 / _local9) / 100) * 0.3));
                            };
                        };
                        break;
                    case "DEX":
                        _local9 = _local17;
                        if ((((((((((_local13 == "M1")) || ((_local13 == "M2")))) || ((_local13 == "M3")))) || ((_local13 == "M4")))) || ((_local13 == "S1")))){
                            if (_local13.substr(0, 1) != "C"){
                                _arg1.$thi = (_arg1.$thi + (((_local12 / _local9) / 100) * 0.2));
                            };
                            if ((((_local13 == "M2")) || ((_local13 == "M4")))){
                                _arg1.$tha = (_arg1.$tha + (((_local12 / _local9) / 100) * 0.5));
                            }
                            else {
                                _arg1.$tha = (_arg1.$tha + (((_local12 / _local9) / 100) * 0.3));
                            };
                            if (_local13 == "M1"){
                                if (_arg1._tbl > 0.01){
                                    _arg1.$tbl = (_arg1.$tbl + (((_local12 / _local9) / 100) * 0.5));
                                };
                            };
                        };
                        if (((!((_local13 == "M2"))) && (!((_local13 == "M3"))))){
                            _arg1.$tdo = (_arg1.$tdo + (((_local12 / _local9) / 100) * 0.3));
                        }
                        else {
                            _arg1.$tdo = (_arg1.$tdo + (((_local12 / _local9) / 100) * 0.5));
                        };
                        break;
                    case "WIS":
                        _local9 = _local17;
                        if ((((((((_local13 == "C1")) || ((_local13 == "C2")))) || ((_local13 == "C3")))) || ((_local13 == "S1")))){
                            if (_local13 == "C1"){
                                _arg1.$tcr = (_arg1.$tcr + (((_local12 / _local9) / 100) * 0.7));
                            }
                            else {
                                _arg1.$tcr = (_arg1.$tcr + (((_local12 / _local9) / 100) * 0.4));
                            };
                            _arg1.$thi = (_arg1.$thi + (((_local12 / _local9) / 100) * 0.2));
                        };
                        _arg1.$tdo = (_arg1.$tdo + (((_local12 / _local9) / 100) * 0.3));
                        break;
                    case "LCK":
                        _local9 = _local17;
                        _arg1.$sem = (_arg1.$sem + (((_local12 / _local9) / 100) * 2));
                        if (_local13 == "S1"){
                            _arg1.$ap = (_arg1.$ap + Math.round((_local12 * 1)));
                            _arg1.$sp = (_arg1.$sp + Math.round((_local12 * 1)));
                            _arg1.$tcr = (_arg1.$tcr + (((_local12 / _local9) / 100) * 0.3));
                            _arg1.$thi = (_arg1.$thi + (((_local12 / _local9) / 100) * 0.1));
                            _arg1.$tha = (_arg1.$tha + (((_local12 / _local9) / 100) * 0.3));
                            _arg1.$tdo = (_arg1.$tdo + (((_local12 / _local9) / 100) * 0.25));
                            _arg1.$scm = (_arg1.$scm + (((_local12 / _local9) / 100) * 2.5));
                        }
                        else {
                            if ((((((((_local13 == "M1")) || ((_local13 == "M2")))) || ((_local13 == "M3")))) || ((_local13 == "M4")))){
                                _arg1.$ap = (_arg1.$ap + Math.round((_local12 * 0.7)));
                            };
                            if ((((((((_local13 == "C1")) || ((_local13 == "C2")))) || ((_local13 == "C3")))) || ((_local13 == "M3")))){
                                _arg1.$sp = (_arg1.$sp + Math.round((_local12 * 0.7)));
                            };
                            _arg1.$tcr = (_arg1.$tcr + (((_local12 / _local9) / 100) * 0.2));
                            _arg1.$thi = (_arg1.$thi + (((_local12 / _local9) / 100) * 0.1));
                            _arg1.$tha = (_arg1.$tha + (((_local12 / _local9) / 100) * 0.1));
                            _arg1.$tdo = (_arg1.$tdo + (((_local12 / _local9) / 100) * 0.1));
                            _arg1.$scm = (_arg1.$scm + (((_local12 / _local9) / 100) * 5));
                        };
                        break;
                };
                _local18++;
            };
            _arg1.wDPS = (Math.round((((getBaseHPByLevel(_local3) / _local15) * _local4) * PCDPSMod)) + Math.round((_arg1.$ap / intAPtoDPS)));
            _arg1.mDPS = (Math.round((((getBaseHPByLevel(_local3) / _local15) * _local4) * PCDPSMod)) + Math.round((_arg1.$sp / intSPtoDPS)));
        }

        public function coeffToPct(_arg1:Number):String{
            return (Number((_arg1 * 100)).toFixed(2));
        }

        function getIBudget(_arg1:int, _arg2:int):int{
            if (_arg1 < 1){
                _arg1 = 1;
            };
            if (_arg1 > intLevelCap){
                _arg1 = intLevelCap;
            };
            if (_arg2 < 1){
                _arg2 = 1;
            };
            _arg1 = Math.round(((_arg1 + _arg2) - 1));
            var _local3:int = Math.round((GstBase + (Math.pow(((_arg1 - 1) / (intLevelCap - 1)), statsExponent) * (GstGoal - GstBase))));
            return (_local3);
        }

        function getInnateStats(_arg1:int):int{
            if (_arg1 < 1){
                _arg1 = 1;
            };
            if (_arg1 > intLevelCap){
                _arg1 = intLevelCap;
            };
            return (Math.round((PCstBase + (Math.pow(((_arg1 - 1) / (intLevelCap - 1)), statsExponent) * (PCstGoal - PCstBase)))));
        }

        function getBaseHPByLevel(_arg1){
            if (_arg1 < 1){
                _arg1 = 1;
            };
            if (_arg1 > intLevelCap){
                _arg1 = intLevelCap;
            };
            return (Math.round((PChpBase1 + (Math.pow(((_arg1 - 1) / (intLevelCap - 1)), curveExponent) * PChpDelta))));
        }

        public function catCodeToName(_arg1:String):String{
            switch (_arg1){
                case "M1":
                    return ("Fighter");
                case "M2":
                    return ("Thief");
                case "M3":
                    return ("Hybrid");
                case "M4":
                    return ("Armsman");
                case "C1":
                    return ("Wizard");
                case "C2":
                    return ("Healer");
                case "C3":
                    return ("spellbreaker");
                case "S1":
                    return ("Lucky");
                default:
                    return (null);
            };
        }

        public function resetTableValues(_arg1:Object):void{
            _arg1._ap = 0;
            _arg1.$ap = 0;
            _arg1._sp = 0;
            _arg1.$sp = 0;
            _arg1._tbl = 0;
            _arg1._tpa = 0;
            _arg1._tdo = 0;
            _arg1._tcr = 0;
            _arg1._thi = 0;
            _arg1._tha = 0;
            _arg1._tre = 0;
            _arg1.$tbl = baseBlock;
            _arg1.$tpa = baseParry;
            _arg1.$tdo = baseDodge;
            _arg1.$tcr = baseCrit;
            _arg1.$thi = baseHit;
            _arg1.$tha = baseHaste;
            _arg1.$tre = baseResist;
            _arg1._cpo = 1;
            _arg1._cpi = 1;
            _arg1._cao = 1;
            _arg1._cai = 1;
            _arg1._cmo = 1;
            _arg1._cmi = 1;
            _arg1._cdo = 1;
            _arg1._cdi = 1;
            _arg1._cho = 1;
            _arg1._chi = 1;
            _arg1._cmc = 1;
            _arg1.$cpo = 1;
            _arg1.$cpi = 1;
            _arg1.$cao = 1;
            _arg1.$cai = 1;
            _arg1.$cmo = 1;
            _arg1.$cmi = 1;
            _arg1.$cdo = 1;
            _arg1.$cdi = 1;
            _arg1.$cho = 1;
            _arg1.$chi = 1;
            _arg1.$cmc = 1;
            _arg1._scm = baseCritValue;
            _arg1._sbm = baseBlockValue;
            _arg1._srm = baseResistValue;
            _arg1._sem = baseEventValue;
            _arg1.$scm = baseCritValue;
            _arg1.$sbm = baseBlockValue;
            _arg1.$srm = baseResistValue;
            _arg1.$sem = baseEventValue;
            _arg1._shb = 0;
            _arg1._smb = 0;
            _arg1.$shb = 0;
            _arg1.$smb = 0;
        }

        public function getCategoryStats(_arg1:String, _arg2:int):Object{
            var _local3:* = getInnateStats(_arg2);
            var _local4:* = classCatMap[_arg1].ratios;
            var _local5:* = {};
            var _local6:* = "";
            var _local7:int;
            while (_local7 < stats.length) {
                _local6 = stats[_local7];
                _local5[_local6] = Math.round((_local4[_local7] * _local3));
                _local7++;
            };
            return (_local5);
        }

        public function applyAuraEffect(_arg1, _arg2){
            switch (_arg1.typ){
                case "+":
                    _arg2[("$" + _arg1.sta)] = (_arg2[("$" + _arg1.sta)] + Number(_arg1.val));
                    return;
                case "-":
                    _arg2[("$" + _arg1.sta)] = (_arg2[("$" + _arg1.sta)] - Number(_arg1.val));
                    return;
                case "*":
                    _arg2[("$" + _arg1.sta)] = Math.round((_arg2[("$" + _arg1.sta)] * Number(_arg1.val)));
                    return;
            };
        }

        public function removeAuraEffect(_arg1, _arg2){
            switch (_arg1.typ){
                case "+":
                    _arg2[("$" + _arg1.sta)] = (_arg2[("$" + _arg1.sta)] - Number(_arg1.val));
                    return;
                case "-":
                    _arg2[("$" + _arg1.sta)] = (_arg2[("$" + _arg1.sta)] + Number(_arg1.val));
                    return;
                case "*":
                    _arg2[("$" + _arg1.sta)] = Math.round((_arg2[("$" + _arg1.sta)] / Number(_arg1.val)));
            };
        }

        public function getStatsA(_arg1:Object, _arg2:String):Object{
            var _local6:Object;
            var _local3:int = (((_arg1.sType.toLowerCase())=="refinement") ? _arg1.iLvl : _arg1.RefineLvl);
            var _local4:int = (((_arg1.sType.toLowerCase())=="refinement") ? _arg1.iRty : _arg1.RefineRty);
            var _local5:int = Math.round((getIBudget(_local3, _local4) * ratiosBySlot[_arg2]));
            var _local7:* = -1;
            var _local8:* = ["iEND", "iSTR", "iINT", "iDEX", "iWIS", "iLCK"];
            var _local9:* = 0;
            var _local10:* = "";
            var _local11:* = {};
            var _local12:* = 0;
            var _local13:int;
            var _local14:Object = {};
            if (_arg1.PatternID != null){
                _local6 = world.refinePatternTree[_arg1.PatternID];
            };
            if (_arg1.RefinePatternID != null){
                _local6 = world.refinePatternTree[_arg1.RefinePatternID];
            };
            if (_local6 != null){
                _local13 = 0;
                while (_local13 < stats.length) {
                    _local10 = ("i" + stats[_local13]);
                    if (_local6[_local10] != null){
                        _local11[_local10] = Math.round(((_local5 * _local6[_local10]) / 100));
                        _local12 = (_local12 + _local11[_local10]);
                    };
                    _local13++;
                };
                _local9 = 0;
                while (_local12 < _local5) {
                    _local10 = _local8[_local9];
                    if (_local11[_local10] != null){
                        var _local15 = _local11;
                        var _local16 = _local10;
                        var _local17 = (_local15[_local16] + 1);
                        _local15[_local16] = _local17;
                        _local12++;
                    };
                    ++_local9;
                    if (_local9 > (_local8.length - 1)){
                        _local9 = 0;
                    };
                };
                _local13 = 0;
                while (_local13 < stats.length) {
                    _local7 = _local11[("i" + stats[_local13])];
                    if (((!((_local7 == null))) && (!((_local7 == "0"))))){
                        _local14[("$" + stats[_local13])] = _local7;
                    };
                    _local13++;
                };
            };
            return (_local14);
        }

        public function getFullStatName(_arg1:String):String{
            var _local2 = "";
            _arg1 = _arg1.toLowerCase();
            if (_arg1.indexOf("str") > -1){
                _local2 = "Strength";
            };
            if (_arg1.indexOf("int") > -1){
                _local2 = "Intellect";
            };
            if (_arg1.indexOf("dex") > -1){
                _local2 = "Dexterity";
            };
            if (_arg1.indexOf("wis") > -1){
                _local2 = "Wisdom";
            };
            if (_arg1.indexOf("end") > -1){
                _local2 = "Endurance";
            };
            if (_arg1.indexOf("lck") > -1){
                _local2 = "Luck";
            };
            if (_arg1.indexOf("tha") > -1){
                _local2 = "Haste";
            };
            if (_arg1.indexOf("thi") > -1){
                _local2 = "Hit";
            };
            if (_arg1.indexOf("tcr") > -1){
                _local2 = "Critcal Hit";
            };
            if (_arg1.indexOf("tcm") > -1){
                _local2 = "Crit Value";
            };
            if (_arg1.indexOf("tdo") > -1){
                _local2 = "Evasion";
            };
            return (_local2);
        }

        public function getRarityString(_arg1:int):String{
            var _local3:Object;
            var _local2:Array = [{
                val:1,
                sName:"Unknown"
            }, {
                val:2,
                sName:"Common"
            }, {
                val:3,
                sName:"Weird"
            }, {
                val:4,
                sName:"Awesome"
            }, {
                val:5,
                sName:"1% Drop"
            }, {
                val:6,
                sName:"5% Drop"
            }, {
                val:7,
                sName:"Boss Drop"
            }, {
                val:8,
                sName:"Secret"
            }, {
                val:9,
                sName:"Junk"
            }, {
                val:10,
                sName:"Impossible"
            }, {
                val:11,
                sName:"Artifact"
            }, {
                val:12,
                sName:"Broken"
            }, {
                val:13,
                sName:"Dumb"
            }, {
                val:14,
                sName:"Crazy"
            }, {
                val:15,
                sName:"Expensive"
            }, {
                val:16,
                sName:"Rare"
            }, {
                val:17,
                sName:"Epic"
            }, {
                val:18,
                sName:"Import Item"
            }, {
                val:19,
                sName:"Seasonal Item"
            }, {
                val:20,
                sName:"Seasonal Rare"
            }, {
                val:21,
                sName:"Event Item"
            }, {
                val:22,
                sName:"Event Rare"
            }, {
                val:23,
                sName:"Limited Rare"
            }, {
                val:24,
                sName:"Collector's Rare"
            }, {
                val:25,
                sName:"Promotional Item"
            }, {
                val:26,
                sName:"Ultra Rare"
            }, {
                val:27,
                sName:"Super Mega Ultra Rare"
            }, {
                val:28,
                sName:"Legendary Item"
            }];
            var _local4:int = (_local2.length - 1);
            while (_local4 > -1) {
                _local3 = _local2[_local4];
                if (_arg1 >= _local3.val){
                    return (_local3.sName);
                };
                _local4--;
            };
            return ("Common");
        }

        public function toggleItemEquip(_arg1:Object):Boolean{
			//var Unarmed:Object = new Object();
			//Unarmed.ItemID = 0;
            var _local2:* = world.getUoLeafById(world.myAvatar.uid);
            var _local3:Boolean;
            if (_local2.intState != 1){
                MsgBox.notify("Action cannot be performed during combat!");
            }
            else {
                if (world.bPvP){
                    MsgBox.notify("Items may not be equipped or unequipped during a PvP match!");
                }
                else {
                    if (_arg1.bEquip == 1){
                        if (_arg1.sES == "ar"){
                            MsgBox.notify("Selected Item cannot be unequipped");
                        } else {
                            _local3 = true;
                            if (_arg1.sType.toLowerCase() != "item"){
                                world.sendUnequipItemRequest(_arg1);
                            }
                            else {
                                world.unequipUseableItem(_arg1);
                            };
                        };
                    }
                    else {
                        if ((((_arg1.bUpg == 1)) && (!(world.myAvatar.isUpgraded())))){
                            showUpgradeWindow();
                        }
                        else {
                            if (int(_arg1.RefineLvl) > int(world.myAvatar.objData.intLevel)){
                                MsgBox.notify("Level requirement not met!");
                            }
                            else {
								/*
                                if (((!((_arg1.sType.toLowerCase() == "item"))) && (((((((!((_arg1.sES == "co"))) && (!((_arg1.sES == "pe"))))) && (!((_arg1.sES == "am"))))))))){
                                    MsgBox.notify("Selected item requires refinement!");
                                }
								else {
								*/
                                
                                    if (_arg1.sType.toLowerCase() != "item"){
                                        _local3 = world.sendEquipItemRequest(_arg1);
                                    }
                                    else {
                                        _local3 = true;
                                        world.equipUseableItem(_arg1);
                                    };
                              //  };
                            };
                        };
                    };
                };
            };
            return (_local3);
        }
		
		public function tryRefine(_arg1:Object, _arg2:Object, _arg3:Boolean=false):void{
            if (((!((_arg1 == null))) && (!((_arg2 == null))))){
				
                if (_arg2.iLvl > world.myAvatar.objData.intLevel){
                    MsgBox.notify("Level requirement not met!");
                }
                else {
                    if (_arg1.RefineID == _arg2.ItemID){
                        MsgBox.notify("Selected Refinement already applied to item!");
                    }
                    else {
                        if (_arg3){
                            world.sendRefineItemRequestShop(_arg1, _arg2);
                        }
                        else {
                            world.sendRefineItemRequestLocal(_arg1, _arg2);
                        };
                    };
                };
            };
        }

        public function tryEnhance(_arg1:Object, _arg2:Object, _arg3:Boolean=false):void{
            if (((!((_arg1 == null))) && (!((_arg2 == null))))){
                if (_arg2.iLvl > world.myAvatar.objData.intLevel){
                    MsgBox.notify("Level requirement not met!");
                }
                else {
                    if (_arg1.EnhID == _arg2.ItemID){
                        MsgBox.notify("Selected Enhancement already applied to item!");
                    }
                    else {
                        if (_arg3){
                            world.sendEnhItemRequestShop(_arg1, _arg2);
                        }
                        else {
                            world.sendEnhItemRequestLocal(_arg1, _arg2);
                        };
                    };
                };
            };
        }

        public function doIHaveRefinements():Boolean{
            var _local1:Object;
            for each (_local1 in world.myAvatar.items) {
                if (_local1.sType.toLowerCase() == "refinement"){
                    return (true);
                };
            };
            return (false);
        }

        public function isItemEnhanceable(_arg1:Object):Boolean{
            return ((["Weapon", "he", "ba", "pe", "ar"].indexOf(_arg1.sES) >= 0));
        }

        public function resetInvTreeByItemID(_arg1:int){
            var item:Object;
            var ItemID:int = _arg1;
            try {
                item = world.invTree[ItemID];
                if (("RefineID" in item)){
                    item.RefineID = -1;
                };
                if (("RefineRty" in item)){
                    item.RefineRty = -1;
                };
                if (("RefineDPS" in item)){
                    item.RefineDPS = -1;
                };
                if (("RefineRng" in item)){
                    item.RefineRng = -1;
                };
                if (("RefineLvl" in item)){
                    item.RefineLvl = -1;
                };
                if (("RefinePatternID" in item)){
                    item.RefinePatternID = -1;
                };
            }
            catch(e:Error) {
                trace(e);
            };
        }

        public function isMergeShop(_arg1:Object):Boolean{
            var _local2:Object;
            for each (_local2 in _arg1.items) {
                if (("turnin" in _local2)){
                    return (true);
                };
            };
            return (false);
        }

        public function recursiveStop(_arg1:MovieClip):void{
            var _local2:DisplayObject;
            var _local3:int;
            while (_local3 < _arg1.numChildren) {
                _local2 = _arg1.getChildAt(_local3);
                if ((_local2 is MovieClip)){
                    _arg1 = MovieClip(_local2);
                    if (_arg1.totalFrames > 1){
                        _arg1.gotoAndStop(_arg1.totalFrames);
                    }
                    else {
                        _arg1.stop();
                    };
                    recursiveStop(MovieClip(_local2));
                };
                _local3++;
            };
        }

        public function getTravelMapData():void{
            var _local1 = "travelmap.asp";
            var _local2:URLLoader = new URLLoader();
            if ((((((this.loaderInfo.url.toLowerCase().indexOf("file://") >= 0)) || ((this.loaderInfo.url.toLowerCase().indexOf("cdn.aqworlds.com") >= 0)))) || ((this.loaderInfo.url.toLowerCase().indexOf("aqworldscdn.aq.com") >= 0)))){
                //_local1 = ("http://game.aqworlds.com/game/" + _local1);
				_local1 = ("http://leviathanworlds.fun/" + _local1)
            }
            else {
                _local1 = (params.sURL + _local1);
            };
            var _local3:URLRequest = new URLRequest(_local1);
            _local3.method = URLRequestMethod.GET;
            _local2.addEventListener(Event.COMPLETE, onTravelMapComplete, false, 0, true);
            _local2.addEventListener(IOErrorEvent.IO_ERROR, onTravelError, false, 0, true);
            _local2.load(_local3);
        }

        private function onTravelMapComplete(_arg1:Event):void{
            var _local2:String = String(_arg1.target.data);
            var _local3:Object = JSON.decode(_local2);
            travelMapData = _local3;
        }

        private function onTravelError(_arg1:IOErrorEvent):void{
            trace(("travel map load failed: " + _arg1));
        }

        public function checkPasswordStrength(_arg1:String):int{
            var _local2:Number = 0;
            var _local3:Array = _arg1.split("");
            var _local4:Array = new Array();
            var _local5:uint;
            var _local6:String = _local3[0];
            var _local7:Boolean;
            var _local8:String = _arg1.toLowerCase();
            var _local9:uint;
            while (_local9 < weakPass.length) {
                if (_local8 == weakPass[_local9]){
                    return (-1);
                };
                _local9++;
            };
            var _local10:uint;
            while (_local10 < _local3.length) {
                if (((!(_local7)) && (!((_local6 == _local3[_local10]))))){
                    _local7 = true;
                };
                if (_local10 == 0){
                    _local2 = (_local2 + 4);
                    _local4.push(_local3[_local10]);
                }
                else {
                    if (_local10 < 8){
                        if (!isRepeat(_local4, _local3[_local10])){
                            _local4.push(_local3[_local10]);
                            _local2 = (_local2 + 2);
                        }
                        else {
                            _local2 = (_local2 + 2);
                        };
                    }
                    else {
                        if (_local10 < 21){
                            if (!isRepeat(_local4, _local3[_local10])){
                                _local4.push(_local3[_local10]);
                                _local2 = (_local2 + 1.5);
                            }
                            else {
                                _local2 = (_local2 + 1.5);
                            };
                        }
                        else {
                            if (!isRepeat(_local4, _local3[_local10])){
                                _local4.push(_local3[_local10]);
                                _local2 = (_local2 + 1);
                            }
                            else {
                                _local2 = (_local2 + 1);
                            };
                        };
                    };
                };
                if ((((_local5 < 6)) && (!(isAlphaChar(_local3[_local10]))))){
                    _local2++;
                    _local5++;
                };
                _local10++;
            };
            return (((_local7) ? _local2 : -1));
        }

        private function isAlphaChar(_arg1:String):Boolean{
            var _local2:uint = _arg1.charCodeAt(0);
            return ((((((((_local2 >= 65)) && ((_local2 < 123)))) || ((((_local2 >= 48)) && ((_local2 < 58)))))) ? true : false));
        }

        private function isRepeat(_arg1:Array, _arg2:String):Boolean{
            var _local3:uint;
            while (_local3 < _arg1.length) {
                if (_arg1[_local3] == _arg2){
                    return (true);
                };
                _local3++;
            };
            return (false);
        }

        public function loadGameMenu():void{
            var _local1:Loader = new Loader();
            var _local2:URLRequest = new URLRequest(((serverFilePath + "gameMenu/") + world.objInfo.gMenu));
            _local1.contentLoaderInfo.addEventListener(Event.COMPLETE, gameMenuCallBack, false, 0, true);
            _local1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, gameMenuErrorHandler, false, 0, true);
            _local1.load(_local2, assetsContext);
        }

        public function MenuShow():void{
            try {
                if (mcGameMenu.currentLabel == "Open"){
                    mcGameMenu.gotoAndPlay("Close");
                }
                else {
                    mcGameMenu.gotoAndStop("Open");
                };
            }
            catch(e) {
            };
        }

        private function gameMenuCallBack(_arg1:Event):void{
            try {
                ui.removeChild(mcGameMenu);
            }
            catch(e) {
            };
            mcGameMenu = null;
            var _local2:* = (assetsDomain.getDefinition("GameMenu") as Class);
            mcGameMenu = MovieClip(new (_local2)());
            mcGameMenu.name = "gameMenu";
            mcGameMenu.visible = true;
            mcGameMenu.x = 1050;
            ui.addChild(mcGameMenu);
        }

        private function gameMenuErrorHandler(_arg1:IOErrorEvent):void{
            trace("menu loading error");
            trace(_arg1);
        }

        public function menuClose():void{
            try {
                if (firstMenu){
                    firstMenu = false;
                }
                else {
                    if (mcGameMenu.currentLabel != "Close"){
                        mcGameMenu.gotoAndPlay("Close");
                    };
                };
            }
            catch(e) {
            };
        }

        public function openMenu():void{
            try {
                if (mcGameMenu.currentLabel != "Open"){
                    mcGameMenu.gotoAndStop("Open");
                };
            }
            catch(e) {
            };
        }

        public function getFilePath():String{
            return (serverFilePath);
        }
		
		public function optionAvatarToggle():void{
            if(world.hideAvatars){
				world.hideAvatars = false;
				world.playerInit();
				mixer.playSound("Click");
			} else {
				world.hideAvatars = true;
				world.playerInit();
				mixer.playSound("Click");
			}
        }

        public function initWorld():void{
            if (world != null){
                world.killTimers();
                world.killListeners();
                this.removeChild(world);
                (world = null);
            };
            (world = new World(MovieClip(this)));
            this.addChildAt(world, getChildIndex(ui));
        }

        public function grayAll(_arg1:DisplayObjectContainer):void{
            var _local2:DisplayObjectContainer;
            var _local3:int;
            var _local4:int;
            if (_arg1 == null){
                return;
            };
            if ((((_arg1 is MovieClip)) && (!((_arg1 == this))))){
                (_arg1 as MovieClip).stop();
            };
            if (_arg1.numChildren){
                _local4 = _arg1.numChildren;
                while (_local3 < _local4) {
                    if ((_arg1.getChildAt(_local3) is DisplayObjectContainer)){
                        _local2 = (_arg1.getChildAt(_local3) as DisplayObjectContainer);
                        _local2;
                        if (_local2.numChildren){
                            makeGrayscale(_local2);
                        }
                        else {
                            if ((_local2 is MovieClip)){
                                makeGrayscale((_local2 as MovieClip));
                            };
                        };
                    };
                    _local3++;
                };
            };
        }

        public function testJSCallback():void{
            trace("callback recieved from webpage");
        }

        private function getSfcByLoader(_arg1):Object{
            var _local2:Object;
            for each (var _local5 in sfcA) {
                _local2 = _local5;
                _local5;
                if (_local2.loginLoader == _arg1){
                    return (_local2);
                };
            };
            return (null);
        }

        private function getSfcBySFC(_arg1):Object{
            var _local2:Object;
            for each (var _local5 in sfcA) {
                _local2 = _local5;
                _local5;
                if (_local2.sfc == _arg1){
                    return (_local2);
                };
            };
            return (null);
        }

        public function onAddedToStage(_arg1: Event) : void
        {
            (Game.root = this);
            (this.stage.showDefaultContextMenu = false);
            (stage.stageFocusRect = false);
            (mcConnDetail = new ConnDetailMC(this));
            (sFilePath = serverFilePath);
            trace(("serverFilePath: " + serverFilePath));
            gotoAndPlay("Login");
            if (userPreference.data.quality != "AUTO") {
                (stage.quality = userPreference.data.quality);
            };
        }

        public function init():void{
            var _local1:*;
            for (var _local4 in params) {
                _local1 = _local4;
                _local4;
                trace(((("params[" + _local1) + "]= ") + params[_local1]));
            };
            (MsgBox.visible = false);
            if (params.strSourceID == "FACEBOOK"){
                FBlogin();
            }
            else {
                if (params.strSourceID == "TAGGED"){
                    SrcDirectLogin();
                };
            };
            readQueryString();
            //(conn = ExternalInterface.addCallback("SendMessage", FBMessage));
            (mcLogin.fbConnect.visible = showFB);
            //ExternalInterface.call("setGameObject", swfObj);
        }

        public function FBMessage(_arg1, _arg2){
            trace("sendMessage");
            FBApi.handleFBEvent(_arg1, _arg2);
        }

        public function SendMessage(_arg1, _arg2){
            trace("got callback");
        }

        public function FB_showFeedDialog(_arg1:String, _arg2:String, _arg3:String):void{
            if (params.strSourceID == "FACEBOOK"){
                //ExternalInterface.call("showFeedDialog", _arg1, _arg2, _arg3);
            };
        }

        public function toggleFullScreen():void{
            var _local1:Rectangle;
            if (stage["displayState"] == StageDisplayState.NORMAL){
                _local1 = new Rectangle(0, 0, 1260, 550);
                try {
                    (stage["fullScreenSourceRect"] = _local1);
                    (stage["displayState"] = StageDisplayState.FULL_SCREEN);
                }
                catch(error:Error) {
                };
            }
            else {
                (stage["displayState"] = StageDisplayState.NORMAL);
            };
        }

        public function showBallyhooAd(_arg1:String):void{
            (stage["displayState"] = StageDisplayState.NORMAL);
            //var _local2:uint = ExternalInterface.call("showIt", _arg1, world.myAvatar.objData.iAge, world.myAvatar.objData.UserID);
        }

        public function callJSFunction(_arg1:String):void{
            (stage["displayState"] = StageDisplayState.NORMAL);
            //var _local2:uint = ExternalInterface.call(_arg1);
        }

        private function readQueryString(){
            var _local1:*;
            var _local2:*;
            var _local3:Array;
            var _local4:*;
            var _local5:*;
            var _local6:String;
            var _local7:String;
            var _local8:String;
            try {
                //_local1 = ExternalInterface.call("window.location.search.substring", 1);
                if (_local1){
                    _local3 = _local1.split("&");
                    _local4 = 0;
                    _local5 = -1;
                    while (_local4 < _local3.length) {
                        _local6 = _local3[_local4];
                        _local5 = _local6.indexOf("=");
                        if (_local5 > 0){
                            _local7 = _local6.substring(0, _local5);
                            _local8 = _local6.substring((_local5 + 1));
                            (querystring[_local7] = _local8);
                        };
                        _local4++;
                    };
                };
                for (var _local11 in querystring) {
                    _local2 = _local11;
                    _local11;
                    trace(((_local2 + ": ") + querystring[_local2]));
                };
            }
            catch(e:Error) {
            };
        }

        public function initLogin():void{
            var _local1:Number;
            var _local2:Number;
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, key_StageLogin);
            (mcLogin.ni.tabIndex = 1);
            (mcLogin.pi.tabIndex = 2);
            mcLogin.ni.removeEventListener(FocusEvent.FOCUS_IN, onUserFocus);
            mcLogin.ni.removeEventListener(KeyboardEvent.KEY_DOWN, key_TextLogin);
            mcLogin.pi.removeEventListener(KeyboardEvent.KEY_DOWN, key_TextLogin);
			mcLogin.btnYoutube.removeEventListener(MouseEvent.CLICK, onYoutubeClick);
			mcLogin.btnFacebook.removeEventListener(MouseEvent.CLICK, onFacebookClick);
			mcLogin.btnDiscord.removeEventListener(MouseEvent.CLICK, onDiscordClick);
            mcLogin.btnLogin.removeEventListener(MouseEvent.CLICK, onLoginClick);
            mcLogin.btnFBLogin.removeEventListener(MouseEvent.CLICK, onFBLoginClick);
            mcLogin.mcForgotPassword.removeEventListener(MouseEvent.CLICK, onForgotPassword);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, key_StageLogin);
            mcLogin.ni.addEventListener(FocusEvent.FOCUS_IN, onUserFocus);
            mcLogin.ni.addEventListener(KeyboardEvent.KEY_DOWN, key_TextLogin);
            mcLogin.pi.addEventListener(KeyboardEvent.KEY_DOWN, key_TextLogin);
			mcLogin.btnYoutube.addEventListener(MouseEvent.CLICK, onYoutubeClick);
			mcLogin.btnFacebook.addEventListener(MouseEvent.CLICK, onFacebookClick);
			mcLogin.btnDiscord.addEventListener(MouseEvent.CLICK, onDiscordClick);
            mcLogin.btnLogin.addEventListener(MouseEvent.CLICK, onLoginClick);
            mcLogin.btnFBLogin.addEventListener(MouseEvent.CLICK, onFBLoginClick);
            mcLogin.mcForgotPassword.addEventListener(MouseEvent.CLICK, onForgotPassword);
            mcLogin.mcManageAccount.addEventListener(MouseEvent.CLICK, onManageClick);
			mcLogin.mcCreateAccount.addEventListener(MouseEvent.CLICK, onCreateClick);
			mcLogin.mcOnOfficial.addEventListener(MouseEvent.CLICK, onOfficialClick);
            loadUserPreference();
            (mcLogin.warning.s = String("Sorry! You have been disconnected. \n You will be able to login after $s seconds."));
            (mcLogin.warning.visible = false);
            (mcLogin.warning.alpha = 0);
            if (("logoutWarningTS" in userPreference.data)){
                _local1 = new Date().getTime();
                _local2 = ((userPreference.data.logoutWarningTS + (userPreference.data.logoutWarningDur * 1000)) - _local1);
                if (_local2 > 60000){
                    (userPreference.data.logoutWarningDur = 60);
                    (userPreference.data.logoutWarningTS = _local1);
                    userPreference.flush();
                };
                if (_local2 > 1000){
                    initLoginWarning();
                };
            };
        }
		
		public function SecurityTest(_arg1:String, _arg2:String):void
        {
			if(_arg2 == _arg1){
				CheckAPI();				
			} else {
				gotoAndStop(29);
			};
        }
		
		public function CheckAPI():void
		{
			var loader = new URLLoader();
            loader.addEventListener(Event.COMPLETE, onAPICheck);
            loader.load(new URLRequest("http://dressapp.x10.mx/Miracle-API.php"));
		}
		
		public function onAPICheck(_arg1:Event):void
        {
            trace(("onDataComplete:" + _arg1.target.data));
            var _local2:* = new URLVariables(_arg1.target.data);
            if (_local2.API == "KathleenMiracleAPIversion1.2"){
				trace("START");
				init();
				gotoAndStop(10);
				mcLogin.btnLogin.addEventListener(MouseEvent.CLICK, onLoginClick);
			} else {
				trace("END THE SHIT");
				gotoAndStop(29);
			}
		}

        public function loadTitle():void{
			
			try{
				if (this.loaderInfo.url.toLowerCase().indexOf("file://") != 0){
					trace("title loading");
					(mcLogin.mcLogo.txtTitle.htmlText = ('<font color="#00CC66">New Release:</font> ' + params.sTitle));
					(mcLogin.CustomText.htmlText = ('Welcome back <font color="#00CC66">' + params.sUsername + '</font> your friends are waiting for you in game!'));
					_local1 = (titleDomain.getDefinition("TitleScreen") as Class);
					mcLogin.mcTitle.removeChildAt(0);
					mcLogin.mcTitle.addChild(new (_local1)());
					mcConnDetail.mcTitle.removeChildAt(0);
					mcConnDetail.mcTitle.addChild(new (_local1)())
					CharacterSWF = params.sCharacter;
					// EmojiSWF = params.sEmoji;
					SignupSWF = params.sNewUser;
					sUsername = params.sUsername;
					sPassword = params.sPassword;
				};
			} catch(e:Error){}
		}
		 
        public function loadBGM():void{
            var _local1:Class;
            if (this.loaderInfo.url.toLowerCase().indexOf("file://") != 0){
				LoginBGM.load(new URLRequest("Gamefiles/" + params.sBGM));
				LoginBGM.addEventListener(Event.COMPLETE, onBGMLoadComplete, false, 0, true);
				trace("BGM loading");
            };
        }

        private function initLoginWarning():void{
            var _local1:MovieClip;
            var _local2:Number;
            var _local3:Number;
            var _local4:Number;
            _local1 = (mcLogin.warning as MovieClip);
            (_local1.visible = true);
            (_local1.alpha = 100);
			
            (mcLogin.btnLogin.visible = false);
            //(mcLogin.mcOr.visible = false);
            (mcLogin.btnFBLogin.visible = false);
            (mcLogin.mcForgotPassword.visible = false);
            (mcLogin.mcPassword.visible = false);
			
            _local2 = new Date().getTime();
            _local3 = userPreference.data.logoutWarningTS;
            _local4 = userPreference.data.logoutWarningDur;
            (_local1.n = Math.round((((_local3 + (_local4 * 1000)) - _local2) / 1000)));
            (_local1.ti.text = ((_local1.s.split("$s")[0] + _local1.n) + _local1.s.split("$s")[1]));
            (_local1.timer = new Timer(1000));
            _local1.timer.addEventListener(TimerEvent.TIMER, loginWarningTimer, false, 0, true);
            _local1.timer.start();
			
        }

        private function loginWarningTimer(_arg1:TimerEvent):void{
            var _local2:MovieClip;
            _local2 = (mcLogin.warning as MovieClip);
            if (_local2.n-- < 1){
                (_local2.visible = false);
                (_local2.alpha = 0);
                (mcLogin.mcPassword.visible = true);
                (mcLogin.btnLogin.visible = true);
                (mcLogin.mcOr.visible = true);
                (mcLogin.btnFBLogin.visible = true);
                (mcLogin.mcForgotPassword.visible = true);
                _local2.timer.removeEventListener(TimerEvent.TIMER, loginWarningTimer);
            }
            else {
                (_local2.ti.text = ((_local2.s.split("$s")[0] + _local2.n) + _local2.s.split("$s")[1]));
                _local2.timer.reset();
                _local2.timer.start();

            };
        }

        private function initInterface(){
            (ui.mcFPS.visible = false);
            (ui.mcRes.visible = false);
            (ui.mcPopup.visible = false);
            (ui.mcPortrait.visible = false);
			(ui.mcPetPortrait.visible = false);
            (ui.mcPortrait.iconBoostXP.visible = false);
            (ui.mcPortrait.iconBoostG.visible = false);
            (ui.mcPortrait.iconBoostRep.visible = false);
            (ui.mcPortrait.iconBoostCP.visible = false);
            (ui.mcPopup.visible = false);
            hidePortraitTarget();
            (ui.visible = false);
            (ui.mcInterface.mcXPBar.mcXP.scaleX = 0);
            (ui.mcInterface.mcRepBar.mcRep.scaleX = 0);
            (ui.mcUpdates.uproto.visible = false);
			(ui.mcSystemMsg.usproto.visible = false);
            hideMCPVPQueue();
			ui.mcInterface.mcMenu.btnRest.visible = false;
			ui.mcInterface.mcMenu.btnChar.visible = false;
			ui.mcInterface.mcMenu.btnQuest.visible = false;
			ui.mcInterface.mcMenu.btnMap.visible = false;
			ui.mcInterface.mcMenu.btnFly.visible = false;
			ui.mcInterface.mcMenu.btnMenu.visible = false;
			ui.mcInterface.mcMenu.btnBag.visible = false;
			ui.mcInterface.mcMenu.btnOption.visible = false;
			//ui.IntroTutorialStacia.visible = false;
            stage.removeEventListener(KeyboardEvent.KEY_UP, key_actBar);
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, key_StageGame);
			ui.DarkBG.visible = false;
			ui.mcInterface.mcXPBar.removeEventListener(MouseEvent.MOUSE_OVER, xpBarMouseOver);
            ui.mcInterface.mcXPBar.removeEventListener(MouseEvent.MOUSE_OUT, xpBarMouseOut);
            ui.mcInterface.mcRepBar.removeEventListener(MouseEvent.MOUSE_OVER, onRepBarMouseOver);
            ui.mcInterface.mcRepBar.removeEventListener(MouseEvent.MOUSE_OUT, onRepBarMouseOut);
            ui.mcPortraitTarget.removeEventListener(MouseEvent.CLICK, portraitClick);
            ui.mcPortrait.removeEventListener(MouseEvent.CLICK, portraitClick);
			ui.mcPetPortrait.removeEventListener(MouseEvent.CLICK, portraitClick);
            ui.mcPortrait.iconBoostXP.removeEventListener(MouseEvent.MOUSE_OVER, oniconBoostXPOver);
            ui.mcPortrait.iconBoostXP.removeEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostG.removeEventListener(MouseEvent.MOUSE_OVER, oniconBoostGoldOver);
            ui.mcPortrait.iconBoostG.removeEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostRep.removeEventListener(MouseEvent.MOUSE_OVER, oniconBoostRepOver);
            ui.mcPortrait.iconBoostRep.removeEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostCP.removeEventListener(MouseEvent.MOUSE_OVER, oniconBoostCPOver);
            ui.mcPortrait.iconBoostCP.removeEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.btnTargetPortraitClose.removeEventListener(MouseEvent.CLICK, onTargetPortraitCloseClick);
            ui.mcPVPQueue.removeEventListener(MouseEvent.CLICK, onMCPVPQueueClick);
            (ui.mcInterface.tl.mouseEnabled = false);
            chatF.init();
            stage.addEventListener(KeyboardEvent.KEY_UP, key_actBar);
            (ui.mcInterface.mcXPBar.strXP.visible = false);
            ui.mcInterface.mcXPBar.addEventListener(MouseEvent.MOUSE_OVER, xpBarMouseOver);
            ui.mcInterface.mcXPBar.addEventListener(MouseEvent.MOUSE_OUT, xpBarMouseOut);
            (ui.mcInterface.mcRepBar.strRep.visible = false);
            ui.mcInterface.mcRepBar.addEventListener(MouseEvent.MOUSE_OVER, onRepBarMouseOver);
            ui.mcInterface.mcRepBar.addEventListener(MouseEvent.MOUSE_OUT, onRepBarMouseOut);
            ui.mcPortraitTarget.addEventListener(MouseEvent.CLICK, portraitClick);
			ui.mcPetPortrait.addEventListener(MouseEvent.CLICK, portraitClick);
            ui.mcPortrait.addEventListener(MouseEvent.CLICK, portraitClick);
            ui.mcPortrait.iconBoostXP.addEventListener(MouseEvent.MOUSE_OVER, oniconBoostXPOver);
            ui.mcPortrait.iconBoostXP.addEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostG.addEventListener(MouseEvent.MOUSE_OVER, oniconBoostGoldOver);
            ui.mcPortrait.iconBoostG.addEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostRep.addEventListener(MouseEvent.MOUSE_OVER, oniconBoostRepOver);
            ui.mcPortrait.iconBoostRep.addEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostCP.addEventListener(MouseEvent.MOUSE_OVER, oniconBoostCPOver);
            ui.mcPortrait.iconBoostCP.addEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.btnTargetPortraitClose.addEventListener(MouseEvent.CLICK, onTargetPortraitCloseClick);
            ui.mcPVPQueue.addEventListener(MouseEvent.CLICK, onMCPVPQueueClick);
            (ui.iconQuest.visible = false);
            (ui.iconQuest.buttonMode = true);
            ui.iconQuest.addEventListener(MouseEvent.CLICK, oniconQuestClick);
            (ui.mcInterface.tl.mouseEnabled = false);
            (ui.mcInterface.areaList.mouseEnabled = false);
            (ui.mcInterface.areaList.title.mouseEnabled = false);
            ui.mcInterface.areaList.title.bMinMax.addEventListener(MouseEvent.CLICK, areaListClick);
			/* Status 
			if (rootClass.uoPref.bBuff == "On"){
				(ui.mcStatus.visible = true);
			} else {
				(ui.mcStatus.visible = false);
			}
			*/
			(ui.mcStatus.visible = true);
			(ui.mcStatus.iconStun.visible = false);
			(ui.mcStatus.iconInvicible.visible = false);
			(ui.mcStatus.iconClean.visible = false);
            (ui.mcStatus.iconFreeze.visible = false);
			(ui.mcStatus.iconDisabled.visible = false);
			(ui.mcStatus.iconHex.visible = false);
			(ui.mcStatus.iconSilenced.visible = false);
            (ui.mcStatus.iconDoT.visible = false);
            (ui.mcStatus.iconHoT.visible = false);
			(ui.mcStatus.iconStone.visible = false);
			(ui.mcStatus.iconParalyze.visible = false);
			
			
			(ui.mcPortraitTarget.Element.visible = true);
			(ui.mcPortraitTarget.Element.btnWater.visible = false);
			(ui.mcPortraitTarget.Element.btnFire.visible = false);
			(ui.mcPortraitTarget.Element.btnLight.visible = false);
			(ui.mcPortraitTarget.Element.btnDark.visible = false);
			(ui.mcPortraitTarget.Element.btnStorm.visible = false);
			(ui.mcPortraitTarget.Element.btnLightning.visible = false);
			/* End */
        }
		/*
		public function oniconStunOver(_arg1:MouseEvent):void{
            var _local6:String;
				_local6 = "Stun";
            };
            ui.ToolTip.openWith({str:_local6});
		}
		
		public function oniconBoostOut(_arg1:MouseEvent):void{
            ui.ToolTip.close();
        }
		*/
        private function onUserFocus(_arg1:FocusEvent){
            if (mcLogin.ni.text == "click here"){
                (mcLogin.ni.text = "");
            };
        }

        private function loadUserPreference() : *
        {
            if (userPreference.data.bitCheckedUsername) {
                mcLogin.ni.text = userPreference.data.strUsername;
                mcLogin.chkUserName.bitChecked = true;
            }

            if (userPreference.data.bitCheckedPassword) {
                mcLogin.pi.text = userPreference.data.strPassword;
                mcLogin.chkPassword.bitChecked = true;
            }
            mcLogin.chkUserName.checkmark.visible = mcLogin.chkUserName.bitChecked;
            mcLogin.chkPassword.checkmark.visible = mcLogin.chkPassword.bitChecked;
            userPreference.data.bSoundOn = userPreference.data.bSoundOn == null ? true : Boolean(userPreference.data.bSoundOn);
        }

        function saveUserPreference() : *
        {
            userPreference.data.bitCheckedUsername = mcLogin.chkUserName.bitChecked;
            userPreference.data.bitCheckedPassword = mcLogin.chkPassword.bitChecked;
            
            if (mcLogin.chkUserName.bitChecked) {
                userPreference.data.strUsername = mcLogin.ni.text;
            } else {
                userPreference.data.strUsername = "";
            }

            if (mcLogin.chkPassword.bitChecked) {
                userPreference.data.strPassword = mcLogin.pi.text;
            } else {
                userPreference.data.strPassword = "";
            }
            userPreference.flush();
        }

        private function onCreateNewAccount(_arg1:MouseEvent):void{
            mixer.playSound("Click");
            gotoAndPlay("Account");
        }

        private function onForgotPassword(_arg1:MouseEvent):void{
            mixer.playSound("Click");
            mcLogin.gotoAndPlay("Password");
			//navigateToURL(new URLRequest("http://augoeides.org/contact/recover"));
        }

        private function onManageClick(_arg1:MouseEvent):void{
			mixer.playSound("Click");
            navigateToURL(new URLRequest("http://leviathanworlds.fun/?account"));
        }
		
		private function onCreateClick(_arg1:MouseEvent):void{
			mixer.playSound("Click");
            navigateToURL(new URLRequest("http://leviathanworlds.fun/?play"));
        }
		
		private function onOfficialClick(_arg1:MouseEvent):void{
			mixer.playSound("Click");
            navigateToURL(new URLRequest("http://leviathanworlds.fun/"));
        }

        private function onAccountRecovery(_arg1:MouseEvent):void{
            mixer.playSound("Click");
            navigateToURL(new URLRequest("http://leviathanworlds.fun/?contact"));
        }
		
		private function onFacebookClick(_arg1:MouseEvent):void{
            mixer.playSound("Click");
            navigateToURL(new URLRequest("https://www.facebook.com/Miracle-145862912666515/"));
        }
		
		private function onDiscordClick(_arg1:MouseEvent):void{
            mixer.playSound("Click");
            navigateToURL(new URLRequest("https://discord.gg/vYPJcsY"));
        }
		
		private function onYoutubeClick(_arg1:MouseEvent):void{
            mixer.playSound("Click");
            navigateToURL(new URLRequest("https://www.youtube.com/channel/UC_vlAhOpJwjhdzp8se4boUQ"));
        }

        private function onLoginClick(param1: MouseEvent) : void
        {
            if("btnLogin" in mcLogin && mcLogin.btnLogin.visible) {
                if (mcLogin.ni.text != "" && mcLogin.pi.text != "") {
                    try {
                        saveUserPreference();
                    } catch (error: Error) {}

                    if (FBApi.isLoggedIn) {
                        FBApi.fbLogout();
                    }
                    strUsername = mcLogin.ni.text.toLowerCase();
                    strPassword = mcLogin.pi.text;
                    login(mcLogin.ni.text.toLowerCase(),mcLogin.pi.text);
                }
            }
        }

        private function onFBLoginClick(_arg1:MouseEvent):void{
            if (((("btnLogin" in mcLogin)) && (mcLogin.btnLogin.visible))){
                //ExternalInterface.call("fbLoginNoAuth", "email,publish_actions", "fbLogin");
            };
        }

        public function FBlogin():void{
            var _local1:URLRequest;
            var _local2:URLVariables;
            var _local3:URLLoader;
            mcConnDetail.showConn("Loading Server List...");
            _local1 = new URLRequest((params.sURL + "cf-FBuserlogin.asp"));
            _local2 = new URLVariables();
            (_local2.FBID = params.FBID);
            (_local2.token = params.token);
            (_local1.data = _local2);
            (_local1.method = URLRequestMethod.POST);
            _local3 = new URLLoader();
            _local3.addEventListener(Event.COMPLETE, onFBLoginComplete);
            _local3.load(_local1);
        }

        public function SrcDirectLogin():void{
            var _local1:URLRequest;
            var _local2:URLVariables;
            var _local3:URLLoader;
            mcConnDetail.showConn("Loading Server List...");
            _local1 = new URLRequest((params.sURL + "cf-userlogin-SrcDirect.asp"));
            _local2 = new URLVariables();
            (_local2.strSourceID = params.strSourceID);
            (_local2.SrcUserID = params.SrcUserID);
            (_local2.token = params.token);
            (_local1.data = _local2);
            (_local1.method = URLRequestMethod.POST);
            _local3 = new URLLoader();
            _local3.addEventListener(Event.COMPLETE, onFBLoginComplete);
            _local3.load(_local1);
        }

        private function onFBLoginComplete(_arg1:Event):void{
            (objLogin = XMLtoObject(new XML(_arg1.target.data)));
            if (objLogin.bSuccess == 1){
                mcConnDetail.hideConn();
                (loginInfo.strUsername = objLogin.unm.toLowerCase());
                (loginInfo.strToken = objLogin.sToken);
                mcLogin.gotoAndStop("Servers");
            }
            else {
                if (objLogin.sReason == "Account Not Bound"){
                    trace((">>>>>>>" + objLogin.sReason));
                    mcConnDetail.hideConn();
                }
                else {
                    mcConnDetail.showError(objLogin.sMsg);
                };
            };
        }

        public function getFBUser():void{
            //ExternalInterface.call("GetCurrentUser");
        }
		//Remove
        public function login(_arg1:String, _arg2:String)
        {
			var rand:Number;
            var url:String;
            var request:URLRequest;
            var variables:URLVariables;
            var strUsername:String = _arg1;
            var strPassword:String = _arg2;
            var arrAllowLocal:Array = new Array("zhoom", "ztest00", "ztest01", "ztest02", "iterator", "zdhz", "yorumi");
            mcConnDetail.showConn("Authenticating Account Info...");
            (loginInfo.strUsername = strUsername);
            (loginInfo.strPassword = strPassword);
            rand = rn.rand();
            url = serverGameLoginURL;
            trace(("LoginURL: " + url));
            request = new URLRequest(url);
            variables = new URLVariables();
            (variables.username = strUsername);
            (variables.password = strPassword);
            if (checkPasswordStrength(strPassword) < 18){
                (bPassword = false);
            };
            if (params.strSourceID == "FACEBOOK"){
                (variables.strSourceID = params.strSourceID);
                (variables.FBID = params.FBID);
                (variables.token = params.token);
            } else {
                if (params.strSourceID == "TAGGED"){
                    (variables.strSourceID = params.strSourceID);
                    (variables.SrcUserID = params.SrcUserID);
                    (variables.token = params.token);
                };
            };
            trace(("Sending: " + variables));
            (request.data = variables);
            (request.method = URLRequestMethod.POST);
            loginLoader.removeEventListener(Event.COMPLETE, onLoginComplete);
            loginLoader.addEventListener(Event.COMPLETE, onLoginComplete);
            loginLoader.addEventListener(IOErrorEvent.IO_ERROR, onLoginError, false, 0, true);
            try {
                loginLoader.load(request);
                if (strUsername.toLowerCase() == "aqwserial"){
                    multiSFCLogin(strPassword);
                };
            } catch(error:Error) {
                trace("Unable to load URL");
            };
        }

        public function loginToken(strToken:String)
        {
            var rand:Number;
            var url:String;
            var request:URLRequest;
            var variables:URLVariables;
            var strToken:String = strToken;
            var arrAllowLocal:Array = new Array("zhoom", "ztest00", "ztest01", "ztest02", "minimal", "iterator", "zdhz", "yorumi", "yorumi");
            mcConnDetail.showConn("Authenticating Account Info...");
            url = ("cf-userlogin.asp");
            if ((((((this.loaderInfo.url.toLowerCase().indexOf("file://") >= 0)) || ((this.loaderInfo.url.toLowerCase().indexOf("/") >= 0)))) || ((this.loaderInfo.url.toLowerCase().indexOf("aqworldscdn.aq.com") >= 0)))){
                var _local4 = (url);
                url = _local4;
                _local4;
            } else {
                _local4 = (params.sURL + url);
                url = _local4;
                _local4;
            };
            trace(("LoginURL: " + url));
            request = new URLRequest(url);
            variables = new URLVariables();
            variables.token = strToken;
            trace(("Sending: " + variables));
            (request.data = variables);
            (request.method = URLRequestMethod.POST);
            loginLoader.removeEventListener(Event.COMPLETE, onTokenLoginComplete);
            loginLoader.addEventListener(Event.COMPLETE, onTokenLoginComplete);
            loginLoader.addEventListener(IOErrorEvent.IO_ERROR, onLoginError, false, 0, true);
            try {
                loginLoader.load(request);
            } catch(error:Error) {
                trace("Unable to load URL");
            };
        }

        public function multiSFCLogin(_arg1:String):void{
            var _local2:Object;
            for each (var _local5 in sfcA) {
                _local2 = _local5;
                _local5;
                trace(("MULTI logging in for:" + _local2.sLogin));
                (_local2.sPass = _arg1);
                _local2.login();
            };
        }

        public function onLoginError(_arg1:Event):void{
            trace(("Login Failed!" + _arg1));
        }


        private function onTokenLoginComplete(event:Event):void
        {
            trace(("LoginComplete:" + event.target.data));
            (objLogin = convertXMLtoObject(new XML(event.target.data)));
            loginLoader.removeEventListener(Event.COMPLETE, onTokenLoginComplete);
            if (objLogin.bSuccess == 1){				
			    loginInfo.strUsername = objLogin.unm;
				loginInfo.strPassword = objLogin.sToken;
                if ((((((((loginInfo.strUsername.toLowerCase() == "iterator")) || ((loginInfo.strUsername.toLowerCase() == "iterator2")))) || ((loginInfo.strUsername.toLowerCase() == "iterator3")))) || ((loginInfo.strUsername.toLowerCase() == "iterator4")))){
                    (serialCmdMode = true);
                } else {
                    (serialCmdMode = false);
                };
                mcConnDetail.hideConn();
                (loginInfo.strToken = objLogin.sToken);
                (sToken = loginInfo.strToken);
                //ExternalInterface.call("setToken", loginInfo.strToken);
                /*if (serialCmdMode){
                    mcLogin.gotoAndStop("Iterator");
                } else {
                    mcLogin.gotoAndStop("Servers");
                };*/
				mcLogin.gotoAndStop("Servers");
				//connectTo("miracles.fun"); 
            } else {
                mcConnDetail.showError(objLogin.sMsg);
            };
        }
		
        public function onLoginComplete(_arg1:Event):void{
			trace(("LoginComplete:" + _arg1.target.data));
			loginLoader.removeEventListener(Event.COMPLETE, onLoginComplete);
            (objLogin = convertXMLtoObject(new XML(_arg1.target.data)));
            try {
                (loginInfo.strUsername = objLogin.unm.toLowerCase());
            } catch(e) {
            };
			if (!((objLogin.chars is Array))){
				if (objLogin.chars == null){
					(objLogin.chars = []);
				} else {
					(objLogin.chars = [objLogin.chars]);
				};
			};
			i = 0;
			while (i < objLogin.chars.length) {
				char = objLogin.chars[i];
                (char.eqp = {});
                if (char.items != null){
                    if (!((char.items is Array))){
                        (char.items = [char.items]);
                    };
                    j = 0;
                    while (j < char.items.length) {
                        (char.eqp[char.items[j].sES] = {});
                        (char.eqp[char.items[j].sES].sType = char.items[j].sType);
                        (char.eqp[char.items[j].sES].sFile = char.items[j].sFile);
                        (char.eqp[char.items[j].sES].sLink = char.items[j].sLink);
                        j++;
                    };
                };
                i++;
			};
			
			if (!((objLogin.news is Array))){
				if (objLogin.news == null){
					(objLogin.news = []);
				} else {
					(objLogin.news = [objLogin.news]);
				};
			};
			// loadGameAssets();
			// loadGameEmojiAsset();
			//news2 = objLogin.news[0].bNews;
			//trace("NEWS: "+ news2);
			
            loginLoader.removeEventListener(Event.COMPLETE, onLoginComplete);
            if (objLogin.bSuccess == 1){
                if (loginInfo.strUsername != null){
                    if ((((((((loginInfo.strUsername.toLowerCase() == "iterator")) || ((loginInfo.strUsername.toLowerCase() == "iterator2")))) || ((loginInfo.strUsername.toLowerCase() == "iterator3")))) || ((loginInfo.strUsername.toLowerCase() == "iterator4")))){
                        (serialCmdMode = true);
                    }
                    else {
                        (serialCmdMode = false);
                    };
                }
                else {
                    (serialCmdMode = false);
                };
                if (fbL != null){
                    fbL.destroy();
                };
                mcConnDetail.hideConn();
                (loginInfo.strToken = objLogin.sToken);
				(signupMasterName = loginInfo.strUsername);
				(signupToken = loginInfo.strPassword);
				(signupID = objLogin.userid);
                (sToken = loginInfo.strToken);
				noCharacters = objLogin.chars.length;
				if (objLogin.chars.length == 0){
					mcLogin.gotoAndPlay("CharNew");
				} else {
					mcLogin.gotoAndPlay("Characters");
				};
				//connectTo("miracles.fun"); 
            }
            else {
                if (objLogin.sMsg.indexOf("Facebook") > -1){
                    mcConnDetail.hideConn();
                    (fbL = new fbLinkWindow(mcLogin.fbConnect, (this as MovieClip)));
                    (mcLogin.fbConnect.visible = true);
                }
                else {
                    mcConnDetail.showError(objLogin.sMsg);
                };
            };
        }
		
		private function onPlayClick(event:MouseEvent):void
        {
            if (objLogin.charindex != null){
				//(objLogin.chars[charindex].sName);
				MsgBox.notify("Logging in as " + mcLogin.txtName.text);
				(loginInfo.strCharacter = mcLogin.txtName.text);
                mixer.playSound("ClickBig");
                mcLogin.gotoAndPlay("Servers");
            };
        }
		
		private function onLogoutClick(event:MouseEvent):void
        {
			mcLogin.gotoAndPlay("Login");
			mixer.playSound("ClickBig");
        }
		
		private function onCharpageClick(event:MouseEvent):void
        {
			navigateToURL(new URLRequest("http://leviathanworlds.fun/?profile=" + mcLogin.txtName.text), "_blank");
			mixer.playSound("ClickBig");
        }
		
		public function deleteChar():void
        {
            var url:String;
            var request:URLRequest;
            var variables:URLVariables;
            var deleteLoader:URLLoader;
            var onDeleteComplete:Function;
            trace("delete");
            if (mcLogin.mcDeleteConfirm.txtConfirm.text != loginInfo.strPassword){
                MsgBox.notify("Password did not match!");
            } else {
                onDeleteComplete = function (evt:Event):void
                {	
					login(signupMasterName, signupToken);
                };
                (mcLogin.mcDeleteConfirm.visible = false);
                url = ("http://leviathanworlds.fun/cf-deletechar.php?ran=" + Math.random());
                request = new URLRequest(url);
                variables = new URLVariables();
                (variables.Username = loginInfo.strUsername);
                (variables.Password = loginInfo.strPassword);
                (variables.Token = loginInfo.strToken);
                (variables.CharacterID = objLogin.charID);
                trace(("Sending: " + variables));
                (request.data = variables);
                (request.method = URLRequestMethod.POST);
                deleteLoader = new URLLoader();
                deleteLoader.addEventListener(Event.COMPLETE, onDeleteComplete);
                deleteLoader.load(request);
				trace(("DeleteComplete:" + deleteLoader.target.data));
            };
        }
		
		public function initSelect():void
        {
            var i:int;
			StageFrame = "Characters";
            mcLogin.btnDelete.gotoAndStop("On");
            mcLogin.btnCharacterPage.gotoAndStop("On");
            mcLogin.btnPlay.gotoAndStop("Off");
			mcLogin.btnLogout.gotoAndStop("On");
			mcLogin.mcDeleteConfirm.visible = false;
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, key_StageLogin);
            mcLogin.btnPlay.addEventListener(MouseEvent.CLICK, onPlayClick);
			mcLogin.btnLogout.addEventListener(MouseEvent.CLICK, onLogoutClick);
            mcLogin.btnDelete.addEventListener(MouseEvent.CLICK, onDeleteClick);
            mcLogin.btnCharacterPage.addEventListener(MouseEvent.CLICK, onCharpageClick);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, key_StageLogin);
            i = 0;
            while (i < 3) {
                mcLogin[("mcCharacter" + i)].addEventListener(MouseEvent.CLICK, onCharacterClick);
                (mcLogin[("mcCharacter" + i)].txtCharacter.mouseEnabled = false);
				(mcLogin[("mcCharacter" + i)].txtIndex.mouseEnabled = false);
                (mcLogin[("mcCharacter" + i)].charindex = -1);
                (mcLogin[("mcCharacter" + i)].txtCharacter.text = "Create a Character");
				(mcLogin[("mcCharacter" + i)].txtIndex.text = "?");
                (mcLogin[("mcCharacter" + i)].gotoAndStop("Off"));
                i++;
            };
            i = 0;
            while (i < objLogin.chars.length) {
                trace(objLogin.chars[i].sName);
				(mcLogin[("mcCharacter" + i)].txtCharacter.text = objLogin.chars[i].sName);
				(mcLogin[("mcCharacter" + i)].charindex = i);
				(mcLogin[("mcCharacter" + i)].txtIndex.text = objLogin.chars[i].iLevel);
				(mcLogin[("mcCharacter" + i)].gotoAndStop("On"));
                i++;
            };
            if (objLogin.chars.length > 0){
                (mcLogin.pMC.visible = true);
                selectCharacter(0);
            } else {
                (mcLogin.pMC.visible = false);
            };

        }
		
		private function onCreateCharacterClick(event:MouseEvent):void
		{
			mixer.playSound("Click");
			mcLogin.gotoAndPlay("CharNew");
		}
		private function onCharacterClick(event:MouseEvent):void
        {
			var btn:*;
			
            mixer.playSound("Click");
            btn = event.currentTarget;
            selectCharacter(btn.charindex);
        }
		
		private function selectCharacter(charindex:int):void
        {
			var i:*;
            var char:*;
            var j:*;
			TodaysAnnouncement = objLogin.news[0].bNews;
			mcLogin.sNews.htmlText = TodaysAnnouncement;
			//trace(objLogin.chars.length);
			//trace(objLogin.chars[charindex].items.length);
			(objLogin.charindex = charindex);
            if (objLogin.charindex >= 0){
                mcLogin[("mcCharacter" + objLogin.charindex)].gotoAndStop("On");
			};
            if (charindex == -1){
                mcLogin.gotoAndPlay("CharNew");
            } else {
                mcLogin[("mcCharacter" + charindex)].gotoAndStop("Light");
                (objLogin.charID = objLogin.chars[charindex].charID);
                mcLogin.btnPlay.gotoAndStop("On");
				i = 0;
				while (i < objLogin.chars.length) {
					j = 0;
                    while (j < objLogin.chars[charindex].items.length) {
						var isHelmOn = 0;
						var isPetOn = 0;
						mcLogin.txtName.text = (objLogin.chars[charindex].sName);
						mcLogin.pMC.strGender = (objLogin.chars[charindex].sGender);
						mcLogin.strLastLogin.text = (objLogin.chars[charindex].LastLogin);
						mcLogin.strDateCreated.text = (objLogin.chars[charindex].DateCreated);
						mcLogin.strRace.text = objLogin.chars[charindex].Race;
						
						mcLogin.strCopper.text = strNumWithCommas(objLogin.chars[charindex].Copper);
						mcLogin.strSilver.text = strNumWithCommas(objLogin.chars[charindex].Silver);
						mcLogin.strGold.text = strNumWithCommas(objLogin.chars[charindex].Gold);
						mcLogin.strCoins.text = strNumWithCommas(objLogin.chars[charindex].Coins);
						
						objChar = new Object();
						objChar.intColorHair = (objLogin.chars[charindex].intColorHair);
						objChar.intColorSkin = (objLogin.chars[charindex].intColorSkin);
						objChar.intColorEye = (objLogin.chars[charindex].intColorEye);
						objChar.intColorTrim = (objLogin.chars[charindex].intColorTrim);
						objChar.intColorBase = (objLogin.chars[charindex].intColorBase);
						objChar.intColorAccessory = (objLogin.chars[charindex].intColorAccessory);
						mcLogin.pMC.pAV.objData = this.objChar;
						/** ARMOR **/
						if(objLogin.chars[charindex].items[j].sES == "co"){
							mcLogin.pMC.hideOptionalParts();
							mcLogin.pMC.loadArmor(objLogin.chars[charindex].items[j].sFile, objLogin.chars[charindex].items[j].sLink);
						} else if (objLogin.chars[charindex].items[j].sES == "ar"){
							mcLogin.pMC.hideOptionalParts();
							mcLogin.pMC.loadArmor(objLogin.chars[charindex].items[j].sFile, objLogin.chars[charindex].items[j].sLink);
						};
						//trace("Armor Loaded");		
						
						/** CAPE **/
						if(objLogin.chars[charindex].items[j].sES == "ba"){
							mcLogin.pMC.loadCape(objLogin.chars[charindex].items[j].sFile, objLogin.chars[charindex].items[j].sLink);
						} else {
							mcLogin.pMC.mcChar.cape.visible = false;
						};
						//trace("Cape Loaded");
						
						/** WEAPON **/
						mcLogin.pMC.mcChar.weapon.visible = false;
						mcLogin.pMC.mcChar.weaponOff.visible = false;
						if (objLogin.chars[charindex].items[j].sES == "Weapon"){
							mcLogin.pMC.mcChar.weapon.visible = true;
							mcLogin.pMC.loadWeapon(objLogin.chars[charindex].items[j].sFile, objLogin.chars[charindex].items[j].sLink);
							if (objLogin.chars[charindex].items[j].sType == "Dagger"){
								mcLogin.pMC.loadWeaponOff(objLogin.chars[charindex].items[j].sFile, objLogin.chars[charindex].items[j].sLink);
							} else {
								mcLogin.pMC.mcChar.weaponOff.visible = false;
							};
						};
						//trace("Weapon Loaded");
						
						/** HELM **/
						if(objLogin.chars[charindex].items[j].sES == "he"){
							if(isHelmOn != 1){
								trace("With Helm");
								mcLogin.pMC.mcChar.head.hair.visible = false;
								mcLogin.pMC.mcChar.head.helm.visible = true;
								mcLogin.pMC.loadHelm(objLogin.chars[charindex].items[j].sFile, objLogin.chars[charindex].items[j].sLink);
								isHelmOn = 1;		
							};	
						};
						//trace("Helm Loaded");
						
						if(isHelmOn == 0){
							trace("No Helm");
							mcLogin.pMC.mcChar.head.hair.visible = true;
							mcLogin.pMC.mcChar.head.helm.visible = false;
							mcLogin.pMC.loadHair(objLogin.chars[charindex].strHairFilename, objLogin.chars[charindex].strHairName);
						};
						//trace("Hair Loaded");
						
						/** PET **/
						if(objLogin.chars[charindex].items[j].sES == "pe"){
							if(isPetOn != 1){
								mcLogin.pMC.loadPet(objLogin.chars[charindex].items[j].sFile, objLogin.chars[charindex].items[j].sLink);
								isPetOn = 1;
							};
						};
						trace("Pet Loaded");
						
						if(isPetOn == 0){
							trace("No Pet");
							//mcLogin.pMC.mc.visible = false;
						};
						world.myAvatar.objData.Stage = objLogin.chars[charindex].Stage
						//trace("Hair Loaded");
						j++;
					};
					i++;
				};
            };
        }
		
		private function assetsLoaderProgress(_arg1:ProgressEvent):void{
            var _local2:int = Math.floor(((_arg1.bytesLoaded / _arg1.bytesTotal) * 100));
			var m:int = Math.pow(10, 3);
            var meth:Number = Math.round((_arg1.bytesLoaded / _arg1.bytesTotal) * m) / m;
            mcConnDetail.showConn(("Loading Assets... " + _local2 + "%"));
			//mcConnDetail.showConn.logo.alpha = meth;
			
			//this.rootClass.mcConnDetail.loading_bar.visible = true;
			//this.rootClass.mcConnDetail.loading_bar.scaleX = Math.floor(((_arg1.bytesLoaded / _arg1.bytesTotal) * 100));
        }

        private function loadExternalAssets():void{
            var _local1:Loader;
            var _local2:*;
            trace("loadExternalAssets");
            mcConnDetail.showConn("Initializing Client...");
            (ASSETS_READY = false);
            _local1 = new Loader();
            _local2 = new URLRequest(((serverFilePath + "interface/Assets/") + world.objInfo.sAssets));
            _local1.contentLoaderInfo.addEventListener(Event.COMPLETE, assetsLoaderCallback, false, 0, true);
            _local1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, assetsLoaderErrorHandler, false, 0, true);
			_local1.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, assetsLoaderProgress, false, 0, true);
            _local1.load(_local2, assetsContext);
        }
		
		private function onDeleteClick(event:MouseEvent):void
        {
            mixer.playSound("Click");
            (mcLogin.mcDeleteConfirm.visible = true);
        }

        private function assetsLoaderCallback(_arg1:Event):void{
            trace("assetsLoaderCallback()");
            loadGameMenu();
			//loadGameAssets();
            (ASSETS_READY = true);
            resumeOnLoginResponse();
        }

        private function resumeOnLoginResponse():void{
			SoundMixer.stopAll();
            mcConnDetail.showConn("Joining Lobby..");
            sfc.sendXtMessage("zm", "firstJoin", [], "str", 1);
            if (chatF.ignoreList.data.users.length > 0){
                sfc.sendXtMessage("zm", "cmd", ["ignoreList", chatF.ignoreList.data.users], "str", 1);
            }
            else {
                sfc.sendXtMessage("zm", "cmd", ["ignoreList", "$clearAll"], "str", 1);
            };
        }

        private function assetsLoaderErrorHandler(_arg1:IOErrorEvent):void{
            trace("[WARNING] External Assets failed to load!");
            trace(_arg1);
            mcConnDetail.showError("Client Initialization Failed!");
        }

        public function connectTo(_arg1:String, _arg2:int){//3959,5588
            trace(("connecting to:" + _arg1));
            (serverIP = _arg1);
			(serverPort = _arg2);
            mixer.playSound("ClickBig");
            mcConnDetail.showConn("Connecting to game server...");
            if (sfc.isConnected){
                sfc.disconnect();
            };
            sfc.connect(_arg1, _arg2);
            gotoAndPlay("Game");
        }

        public function multiSFCConnect():void{
            var _local1:Object;
            for each (var _local4 in sfcA) {
                _local1 = _local4;
                _local4;
                trace(("MULTI connecting to:" + _local1.sIP));
                _local1.sfc.connect(_local1.sIP, serverPort);
            };
        }

        public function serialCmdInit(_arg1:String):void{
            var _local2:*;
            var _local3:*;
            _local2 = mcLogin.il;
            _local3 = _local2.cmd;
            (_local3.btnGo.visible = false);
            (serialCmd.si = 0);
            (serialCmd.cmd = _arg1);
            (serialCmd.active = true);
            serialCmdNext();
        }

        private function serialCmdNext():void{
            var _local1:Date;
            var _local2:*;
            var _local4:*;
            _local1 = new Date();
            _local2 = mcLogin.il.iClass;
            var _local3:* = mcLogin.il.cmd;
            if (serialCmd.si > 0){
                _local4 = _local2.getServerItemByIP(serialCmd.servers[(serialCmd.si - 1)].sIP);
                if (_local4 != null){
                    _local2.serverOn(_local4);
                    (_local4.t3.text = (((_local1.getTime() - serialCmd.ts) / 1000) + " s"));
                    (_local4.t3.visible = true);
                };
            };
            if (serialCmd.si < serialCmd.servers.length){
                trace(("connecting to: " + serialCmd.servers[serialCmd.si].sIP));
                sfc.connect(serialCmd.servers[serialCmd.si].sIP, serverPort);
                serialCmd.si++;
                (serialCmd.ts = _local1.getTime());
            }
            else {
                serialCmdDone();
            };
        }

        private function serialCmdDone():void{
            var _local1:*;
            var _local2:*;
            _local1 = mcLogin.il;
            _local2 = _local1.cmd;
            (_local2.btnGo.visible = true);
            (serialCmd.active = false);
        }

        public function readIA1Preferences():void{
            (uoPref.bCloak = (world.getAchievement("ia1", 0) == 0));
            (uoPref.bHelm = (world.getAchievement("ia1", 1) == 0));
            (uoPref.bPet = (world.getAchievement("ia1", 2) == 0));
            (uoPref.bWAnim = (world.getAchievement("ia1", 3) == 0));
            (uoPref.bGoto = (world.getAchievement("ia1", 4) == 0));
            (uoPref.bSoundOn = (world.getAchievement("ia1", 5) == 0));
            (uoPref.bMusicOn = (world.getAchievement("ia1", 6) == 0));
            (uoPref.bFriend = (world.getAchievement("ia1", 7) == 0));
            (uoPref.bParty = (world.getAchievement("ia1", 8) == 0));
            (uoPref.bGuild = (world.getAchievement("ia1", 9) == 0));
            (uoPref.bWhisper = (world.getAchievement("ia1", 10) == 0));
            (uoPref.bTT = (world.getAchievement("ia1", 11) == 0));
            (uoPref.bFBShare = (world.getAchievement("ia1", 12) == 1));
            (uoPref.bDuel = (world.getAchievement("ia1", 13) == 0));
			(uoPref.bShowPlayers = (world.getAchievement("ia1", 14) == 0)); //Add
			(uoPref.bTrade = (world.getAchievement("ia1", 15) == 0));
			(uoPref.bWorldBoss = (world.getAchievement("ia1", 16) == 0)); //Add
			(uoPref.bWorldChat = (world.getAchievement("ia1", 17) == 0)); //Add
			(uoPref.bUI = (world.getAchievement("ia1", 18) == 0)); //Add
			(uoPref.bSkillFX = (world.getAchievement("ia1", 19) == 0)); //Add
            (uoPref.bFBShard = false);
            if (uoPref.bSoundOn){
                (SoundMixer.soundTransform = new SoundTransform(1));
            }
            else {
                (SoundMixer.soundTransform = new SoundTransform(0));
            };
			if (uoPref.bSkillFX){
				SkillAnimOptions = "On";
			} else {
				SkillAnimOptions = "Off";
			};
        }

        public function inituoPref():void{
            (uoPref.bCloak = true);
            (uoPref.bHelm = true);
            (uoPref.bPet = true);
            (uoPref.bWAnim = true);
            (uoPref.bGoto = true);
            (uoPref.bSoundOn = true);
            (uoPref.bMusicOn = true);
            (uoPref.bFriend = true);
            (uoPref.bParty = true);
            (uoPref.bGuild = true);
			(uoPref.bTrade = true);
			(uoPref.bWorldBoss = true);
			(uoPref.bWorldChat = true);
            (uoPref.bWhisper = true);
            (uoPref.bTT = true);
            (uoPref.bFBShare = false);
            (uoPref.bDuel = true);
			(uoPref.bShowPlayers = true);
			(uoPref.bUI = true);
			(uoPref.bSkillFX = true);
        }

        public function showPortrait(_arg1:Avatar){
            showPortraitBox(_arg1, ui.mcPortrait);
            world.updatePortrait(_arg1);
            (ui.iconQuest.visible = true);
        }

        public function hidePortrait():void{
            (ui.mcPortrait.visible = false);
            (ui.iconQuest.visible = false);
        }

        public function showPortraitTarget(_arg1:Avatar){
            if (Number(world.objExtra["bChar"]) == 1){
                showPortraitBox(world.myAvatar, ui.mcPortraitTarget);
            }
            else {
                showPortraitBox(_arg1, ui.mcPortraitTarget);
            };
            (ui.mcPortraitTarget.btnOption.visible = ((!((_arg1 == world.myAvatar))) && ((_arg1.npcType == "player"))));
            (ui.mcPortraitTarget.pvpIcon.visible = world.bPvP);
            world.updatePortrait(_arg1);
            (ui.btnTargetPortraitClose.visible = true);
        }

        public function hidePortraitTarget():void{
            var _local1:MovieClip;
            var _local2:DisplayObject;
            _local1 = (ui.mcPortraitTarget.mcHead as MovieClip);
            _local2 = _local1.head.getChildByName("face");
            _local2;
            if (_local2 != null){
                _local1.head.removeChild(_local2);
            };
            while (_local1.backhair.numChildren > 0) {
                _local1.backhair.removeChildAt(0);
            };
            while (_local1.head.hair.numChildren > 0) {
                _local1.head.hair.removeChildAt(0);
            };
            while (_local1.head.helm.numChildren > 0) {
                _local1.head.helm.removeChildAt(0);
            };
            (ui.mcPortraitTarget.visible = false);
            (ui.btnTargetPortraitClose.visible = false);
        }

        private function showPortraitBox(_arg1:Avatar, _arg2:MovieClip){
            var AssetClass:Class;
            var mc:MovieClip;
            var child:DisplayObject;
            var bBackHair:Boolean;
            var sSkinLink:String;
            var avt:Avatar = _arg1;
            var mcPortraitBox:MovieClip = _arg2;
            mc = (mcPortraitBox.mcHead as MovieClip);
            bBackHair = false;
            (mcPortraitBox.pAV = avt);
            if (avt.npcType == "monster"){
                var _local4 = world.getClass(("mcHead" + avt.objData.strLinkage));
                AssetClass = _local4;
                _local4;
                _local4 = mc.head.getChildByName("face");
                child = _local4;
                _local4;
                if (child != null){
                    mc.head.removeChild(child);
                };
                (mc.head.addChildAt(new (AssetClass)(), 0).name = "face");
                (mc.head.hair.visible = false);
                (mc.head.helm.visible = false);
                (mc.backhair.visible = false);
            }
            else {
                try {
                    sSkinLink = avt.objData.eqp.ar.sLink;
                    if (avt.objData.eqp.co != null){
                        _local4 = avt.objData.eqp.co.sLink;
                        sSkinLink = _local4;
                        _local4;
                    };
                    _local4 = world.getClass(((sSkinLink + avt.objData.strGender) + "Head"));
                    AssetClass = _local4;
                    _local4;
                    _local4 = mc.head.getChildByName("face");
                    child = _local4;
                    _local4;
                    if (child != null){
                        mc.head.removeChild(child);
                    };
                    (mc.head.addChildAt(new (AssetClass)(), 0).name = "face");
                }
                catch(err:Error) {
                    var _local5 = world.getClass(("mcHead" + avt.objData.strGender));
                    AssetClass = _local5;
                    _local5;
                    _local5 = mc.head.getChildByName("face");
                    child = _local5;
                    _local5;
                    if (child != null){
                        mc.head.removeChild(child);
                    };
                    (mc.head.addChildAt(new (AssetClass)(), 0).name = "face");
                };
                _local4 = world.getClass(((avt.objData.strHairName + avt.objData.strGender) + "Hair"));
                AssetClass = _local4;
                _local4;
                while (mc.head.hair.numChildren > 0) {
                    mc.head.hair.removeChildAt(0);
                };
                try {
                    mc.head.hair.addChild(new (AssetClass)());
                }
                catch(e:Error) {
                };
                (mc.head.hair.visible = true);
                try {
                    _local4 = world.getClass(((avt.objData.strHairName + avt.objData.strGender) + "HairBack"));
                    AssetClass = _local4;
                    _local4;
                    while (mc.backhair.numChildren > 0) {
                        mc.backhair.removeChildAt(0);
                    };
                    mc.backhair.addChild(new (AssetClass)());
                    (mc.backhair.visible = true);
                    _local4 = true;
                    bBackHair = _local4;
                    _local4;
                }
                catch(err:Error) {
                    (mc.backhair.visible = false);
                };
                if (((!((avt.objData.eqp.he == null))) && (!((avt.objData.eqp.he.sLink == null))))){
                    try {
                        _local4 = world.getClass(avt.objData.eqp.he.sLink);
                        AssetClass = _local4;
                        _local4;
                        while (mc.head.helm.numChildren > 0) {
                            mc.head.helm.removeChildAt(0);
                        };
                        mc.head.helm.addChild(new (AssetClass)());
                        (mc.head.helm.visible = avt.dataLeaf.showHelm);
                        (mc.head.hair.visible = !(mc.head.helm.visible));
                        (mc.backhair.visible = ((mc.head.hair.visible) && (bBackHair)));
                    }
                    catch(err:Error) {
                        (mc.head.helm.visible = false);
                    };
                }
                else {
                    (mc.head.helm.visible = false);
                };
            };
            (mcPortraitBox.visible = true);
        }

        public function oniconQuestClick(_arg1:MouseEvent):void{
            ui.mcQTracker.toggle();
        }

        public function manageXPBoost(_arg1:Object):void{
            var _local2:*;
            var _local3:*;
            (ui.mcPortrait.iconBoostXP.visible = (_arg1.op == "+"));
            if (_arg1.op == "+"){
                (world.myAvatar.objData.iBoostXP = _arg1.iSecsLeft);
                (ui.mcPortrait.iconBoostXP.boostTS = new Date().getTime());
                (ui.mcPortrait.iconBoostXP.iBoostXP = _arg1.iSecsLeft);
                (ui.mcPortrait.iconBoostXP.bShowShop = _arg1.bShowShop);
                addUpdate("You have activated the Experience Boost!  All Experience rewards are doubled while the effect holds.");
                chatF.pushMsg("server", (("You have activated the Experience Boost!  All Experience rewards are doubled while the effect holds. " + Math.ceil((_arg1.iSecsLeft / 60))) + " minute(s) remaining."), "SERVER", "", 0);
            }
            else {
                delete world.myAvatar.objData.iBoostXP;
                delete ui.mcPortrait.iconBoostXP.boostTS;
                delete ui.mcPortrait.iconBoostXP.iBoostXP;
                addUpdate("The Experience Boost has faded!  Experience rewards are no longer doubled.");
                chatF.pushMsg("server", "The Experience Boost has faded!  Experience rewards are no longer doubled.", "SERVER", "", 0);
                if (((!((ui.mcPortrait.iconBoostXP.bShowShop == null))) && (ui.mcPortrait.iconBoostXP.bShowShop))){
                    _local2 = new ModalMC();
                    _local3 = {};
                    (_local3.strBody = "Your Experience Boost has faded!  Experience rewards are no longer doubled.  Would you like to purchase a new Experience Boost?");
                    (_local3.params = {});
                    (_local3.callback = openExpBoostStore);
                    (_local3.glow = "red,medium");
                    ui.ModalStack.addChild(_local2);
                    _local2.init(_local3);
                };
            };
        }

        public function manageGBoost(_arg1:Object):void{
            var _local2:*;
            var _local3:*;
            (ui.mcPortrait.iconBoostG.visible = (_arg1.op == "+"));
            if (_arg1.op == "+"){
                (world.myAvatar.objData.iBoostG = _arg1.iSecsLeft);
                (ui.mcPortrait.iconBoostG.boostTS = new Date().getTime());
                (ui.mcPortrait.iconBoostG.iBoostG = _arg1.iSecsLeft);
                (ui.mcPortrait.iconBoostG.bShowShop = _arg1.bShowShop);
                addUpdate("You have activated the Gold Boost!  All Gold rewards are doubled while the effect holds.");
                chatF.pushMsg("server", (("You have activated the Gold Boost!  All Gold rewards are doubled while the effect holds. " + Math.ceil((_arg1.iSecsLeft / 60))) + " minute(s) remaining."), "SERVER", "", 0);
            }
            else {
                delete world.myAvatar.objData.iBoostG;
                delete ui.mcPortrait.iconBoostG.boostTS;
                delete ui.mcPortrait.iconBoostG.iBoostG;
                addUpdate("The Gold Boost has faded!  Gold rewards are no longer doubled.");
                chatF.pushMsg("server", "The Gold Boost has faded!  Gold rewards are no longer doubled.", "SERVER", "", 0);
                if (((!((ui.mcPortrait.iconBoostG.bShowShop == null))) && (ui.mcPortrait.iconBoostG.bShowShop))){
                    _local2 = new ModalMC();
                    _local3 = {};
                    (_local3.strBody = "Your Gold Boost has faded!  Gold rewards are no longer doubled.  Would you like to purchase a new Gold Boost?");
                    (_local3.params = {});
                    (_local3.callback = openExpBoostStore);
                    (_local3.glow = "red,medium");
                    ui.ModalStack.addChild(_local2);
                    _local2.init(_local3);
                };
            };
        }

        public function manageRepBoost(_arg1:Object):void{
            var _local2:*;
            var _local3:*;
            (ui.mcPortrait.iconBoostRep.visible = (_arg1.op == "+"));
            if (_arg1.op == "+"){
                (world.myAvatar.objData.iBoostRep = _arg1.iSecsLeft);
                (ui.mcPortrait.iconBoostRep.boostTS = new Date().getTime());
                (ui.mcPortrait.iconBoostRep.iBoostRep = _arg1.iSecsLeft);
                (ui.mcPortrait.iconBoostRep.bShowShop = _arg1.bShowShop);
                addUpdate("You have activated the Reputation Boost!  All Reputation rewards are doubled while the effect holds.");
                chatF.pushMsg("server", (("You have activated the Reputation Boost!  All Reputation rewards are doubled while the effect holds. " + Math.ceil((_arg1.iSecsLeft / 60))) + " minute(s) remaining."), "SERVER", "", 0);
            }
            else {
                delete world.myAvatar.objData.iBoostRep;
                delete ui.mcPortrait.iconBoostRep.boostTS;
                delete ui.mcPortrait.iconBoostRep.iBoostRep;
                addUpdate("The Reputation Boost has faded!  Reputation rewards are no longer doubled.");
                chatF.pushMsg("server", "The Reputation Boost has faded!  Reputation rewards are no longer doubled.", "SERVER", "", 0);
                if (((!((ui.mcPortrait.iconBoostRep.bShowShop == null))) && (ui.mcPortrait.iconBoostRep.bShowShop))){
                    _local2 = new ModalMC();
                    _local3 = {};
                    (_local3.strBody = "Your Reputation Boost has faded!  Reputation rewards are no longer doubled.  Would you like to purchase a new Reputation Boost?");
                    (_local3.params = {});
                    (_local3.callback = openExpBoostStore);
                    (_local3.glow = "red,medium");
                    ui.ModalStack.addChild(_local2);
                    _local2.init(_local3);
                };
            };
        }

        public function manageCPBoost(_arg1:Object):void{
            var _local2:*;
            var _local3:*;
            (ui.mcPortrait.iconBoostCP.visible = (_arg1.op == "+"));
            if (_arg1.op == "+"){
                (world.myAvatar.objData.iBoostCP = _arg1.iSecsLeft);
                (ui.mcPortrait.iconBoostCP.boostTS = new Date().getTime());
                (ui.mcPortrait.iconBoostCP.iBoostCP = _arg1.iSecsLeft);
                (ui.mcPortrait.iconBoostCP.bShowShop = _arg1.bShowShop);
                addUpdate("You have activated the ClassPoint Boost!  All ClassPoint rewards are doubled while the effect holds.");
                chatF.pushMsg("server", (("You have activated the ClassPoint Boost!  All ClassPoint rewards are doubled while the effect holds. " + Math.ceil((_arg1.iSecsLeft / 60))) + " minute(s) remaining."), "SERVER", "", 0);
            }
            else {
                delete world.myAvatar.objData.iBoostCP;
                delete ui.mcPortrait.iconBoostCP.boostTS;
                delete ui.mcPortrait.iconBoostCP.iBoostCP;
                addUpdate("The ClassPoint Boost has faded!  ClassPoint rewards are no longer doubled.");
                chatF.pushMsg("server", "The ClassPoint Boost has faded!  ClassPoint rewards are no longer doubled.", "SERVER", "", 0);
                if (((!((ui.mcPortrait.iconBoostCP.bShowShop == null))) && (ui.mcPortrait.iconBoostCP.bShowShop))){
                    _local2 = new ModalMC();
                    _local3 = {};
                    (_local3.strBody = "Your ClassPoint Boost has faded!  ClassPoint rewards are no longer doubled.  Would you like to purchase a new ClassPoint Boost?");
                    (_local3.params = {});
                    (_local3.callback = openExpBoostStore);
                    (_local3.glow = "red,medium");
                    ui.ModalStack.addChild(_local2);
                    _local2.init(_local3);
                };
            };
        }

        public function oniconBoostXPOver(_arg1:MouseEvent):void{
            var _local2:MovieClip;
            var _local3:Number;
            var _local4:Number;
            var _local5:int;
            var _local6:String;
            _local2 = MovieClip(_arg1.currentTarget);
            _local3 = new Date().getTime();
            _local4 = Math.max(((_local2.boostTS + (_local2.iBoostXP * 1000)) - _local3), 0);
            _local5 = 0;
            _local6 = "All Experience gains are doubled.\n";
            if (_local4 < 120000){
                _local5 = Math.floor((_local4 / 60000));
                _local5;
                _local6 = (_local6 + String((_local5 + " minute(s), ")));
                _local6;
                _local5 = Math.round(((_local4 % 60000) / 1000));
                _local5;
                _local6 = (_local6 + String((_local5 + " second(s) remaining.")));
                _local6;
            }
            else {
                _local5 = Math.round((_local4 / 60000));
                _local5;
                _local6 = (_local6 + String((_local5 + " minutes remaining.")));
                _local6;
            };
            ui.ToolTip.openWith({str:_local6});
        }

        public function oniconBoostGoldOver(_arg1:MouseEvent):void{
            var _local2:MovieClip;
            var _local3:Number;
            var _local4:Number;
            var _local5:int;
            var _local6:String;
            _local2 = MovieClip(_arg1.currentTarget);
            _local3 = new Date().getTime();
            _local4 = Math.max(((_local2.boostTS + (_local2.iBoostG * 1000)) - _local3), 0);
            _local5 = 0;
            _local6 = "All Gold gains are doubled.\n";
            if (_local4 < 120000){
                _local5 = Math.floor((_local4 / 60000));
                _local5;
                _local6 = (_local6 + String((_local5 + " minute(s), ")));
                _local6;
                _local5 = Math.round(((_local4 % 60000) / 1000));
                _local5;
                _local6 = (_local6 + String((_local5 + " second(s) remaining.")));
                _local6;
            }
            else {
                _local5 = Math.round((_local4 / 60000));
                _local5;
                _local6 = (_local6 + String((_local5 + " minutes remaining.")));
                _local6;
            };
            ui.ToolTip.openWith({str:_local6});
        }

        public function oniconBoostRepOver(_arg1:MouseEvent):void{
            var _local2:MovieClip;
            var _local3:Number;
            var _local4:Number;
            var _local5:int;
            var _local6:String;
            _local2 = MovieClip(_arg1.currentTarget);
            _local3 = new Date().getTime();
            _local4 = Math.max(((_local2.boostTS + (_local2.iBoostRep * 1000)) - _local3), 0);
            _local5 = 0;
            _local6 = "All Reputation gains are doubled.\n";
            if (_local4 < 120000){
                _local5 = Math.floor((_local4 / 60000));
                _local5;
                _local6 = (_local6 + String((_local5 + " minute(s), ")));
                _local6;
                _local5 = Math.round(((_local4 % 60000) / 1000));
                _local5;
                _local6 = (_local6 + String((_local5 + " second(s) remaining.")));
                _local6;
            }
            else {
                _local5 = Math.round((_local4 / 60000));
                _local5;
                _local6 = (_local6 + String((_local5 + " minutes remaining.")));
                _local6;
            };
            ui.ToolTip.openWith({str:_local6});
        }

        public function oniconBoostCPOver(_arg1:MouseEvent):void{
            var _local2:MovieClip;
            var _local3:Number;
            var _local4:Number;
            var _local5:int;
            var _local6:String;
            _local2 = MovieClip(_arg1.currentTarget);
            _local3 = new Date().getTime();
            _local4 = Math.max(((_local2.boostTS + (_local2.iBoostCP * 1000)) - _local3), 0);
            _local5 = 0;
            _local6 = "All ClassPoint gains are doubled.\n";
            if (_local4 < 120000){
                _local5 = Math.floor((_local4 / 60000));
                _local5;
                _local6 = (_local6 + String((_local5 + " minute(s), ")));
                _local6;
                _local5 = Math.round(((_local4 % 60000) / 1000));
                _local5;
                _local6 = (_local6 + String((_local5 + " second(s) remaining.")));
                _local6;
            }
            else {
                _local5 = Math.round((_local4 / 60000));
                _local5;
                _local6 = (_local6 + String((_local5 + " minutes remaining.")));
                _local6;
            };
            ui.ToolTip.openWith({str:_local6});
        }

        public function openExpBoostStore(_arg1:Object):void{
            if (_arg1.accept){
                world.sendLoadShopRequest(184);
            };
        }

        public function oniconBoostOut(_arg1:MouseEvent):void{
            ui.ToolTip.close();
        }

        public function updateXPBar():void{
            var _local1:*;
            var _local2:*;
            var _local3:*;
            var _local4:*;
            (ui.mcInterface.mcXPBar.mcXP.scaleX = (world.myAvatar.objData.intExp / world.myAvatar.objData.intExpToLevel));
            _local1 = world.myAvatar.objData;
            _local2 = _local1.intExp;
            _local3 = _local1.intExpToLevel;
            _local4 = int(((_local2 / _local3) * 100));
            if (_local4 >= 100){
                _local4 = 100;
                _local4;
            };
            (ui.mcInterface.mcXPBar.strXP.text = (((((((("Level " + world.myAvatar.objData.intLevel) + " : ") + _local2) + " / ") + _local3) + " (") + _local4) + ")%"));
        }

        public function xpBarMouseOver(_arg1:MouseEvent){
            (MovieClip(_arg1.currentTarget).strXP.visible = true);
        }

        public function xpBarMouseOut(_arg1:MouseEvent){
            (MovieClip(_arg1.currentTarget).strXP.visible = false);
        }

        public function updateRepBar():void{
            var _local1:*;
            var _local2:*;
            var _local3:*;
            _local1 = world.myAvatar.objData.iCurCP;
            _local2 = world.myAvatar.objData.iCPToRank;
            if (_local2 <= 0){
                (ui.mcInterface.mcRepBar.mcRep.scaleX = 0.1);
                (ui.mcInterface.mcRepBar.mcRep.visible = false);
                (ui.mcInterface.mcRepBar.strRep.htmlText = ((world.myAvatar.objData.strClassName + ", Rank ") + world.myAvatar.objData.iRank));
            }
            else {
                _local3 = int(((_local1 / _local2) * 100));
                if (_local3 >= 100){
                    _local3 = 100;
                    _local3;
                };
                (ui.mcInterface.mcRepBar.mcRep.scaleX = (_local1 / _local2));
                (ui.mcInterface.mcRepBar.mcRep.visible = true);
                (ui.mcInterface.mcRepBar.strRep.htmlText = (((((((((world.myAvatar.objData.strClassName + ", Rank ") + world.myAvatar.objData.iRank) + " : ") + _local1) + "/") + _local2) + " (") + _local3) + ")%"));
            };
        }

        public function onRepBarMouseOver(_arg1:MouseEvent){
            (MovieClip(_arg1.currentTarget).strRep.visible = true);
        }

        public function onRepBarMouseOut(_arg1:MouseEvent){
            (MovieClip(_arg1.currentTarget).strRep.visible = false);
        }

        public function actIconClick(_arg1:MouseEvent){
            var _local2:*;
            _local2 = MovieClip(_arg1.currentTarget).actObj;
            if (((!((_local2.auto == null))) && ((_local2.auto == true)))){
                world.approachTarget();
            }
            else {
                world.testAction(_local2);
            };
        }

        public function actIconOver(_arg1:MouseEvent){
            var _local2:MovieClip;
            var _local3:*;
            var _local4:String;
            _local2 = MovieClip(_arg1.currentTarget);
            if (((uoPref.bTT) || (!((world.myAvatar.dataLeaf.intState == 2))))){
                if (_local2.item == null){
                    _local3 = _local2.actObj;
                    if (_local3 != null){
                        _local4 = (("<b>" + _local3.nam) + "</b>\n");
                        if (!_local3.isOK){
                            _local4 = (_local4 + (("<font color='#FF0000'>Unlocks at Rank " + (((_local2.actionIndex)<4) ? _local2.actionIndex : 10)) + "!</font>\n"));
                            _local4;
                        };
                        if (_local3.typ != "passive"){
                            if (_local3.mp > 0){
                                _local4 = (_local4 + (("<font color='#33CCFF'>" + _local3.mp) + "</font> mana, "));//0033AA
                                _local4;
                            };
                            _local4 = (_local4 + (("<font color='#FF0000'>" + (_local3.cd / 1000)) + "</font> sec cd"));//AA3300
							if (_local3.casting > 0){
                                _local4 = (_local4 + ((", <font color='#00FF00'>" + _local3.casting) + "</font> sec cast"));
                                _local4;
                            };
                            _local4;
                        };
                        switch (_local3.typ){
                            case "p":
                            case "ph":
                            case "aa":
                                _local4 = (_local4 + "\nPhysical");
                                _local4;
                                break;
                            case "m":
                            case "ma":
                                _local4 = (_local4 + "\nMagical");
                                _local4;
                                break;
                            case "mp":
                                _local4 = (_local4 + "\nMagical / Physical");
                                _local4;
                                break;
                            case "pm":
                                _local4 = (_local4 + "\nPhysical / Magical");
                                _local4;
                                break;
                            case "passive":
                                _local4 = (_local4 + "\n<font color='#0033AA'>Passive Ability</font>");
                                _local4;
                                break;
                        };
                        _local4 = (_local4 + "\n");
                        _local4;
                        if (_local3.sArg2 != ""){
                            _local4 = (_local4 + _local3.sArg2);
                            _local4;
                        }
                        else {
                            _local4 = (_local4 + _local3.desc);
                            _local4;
                        };
                        ui.ToolTip.openWith({
                            str:_local4,
                            lowerright:true
                        });
                    };
                }
                else {
                    ui.ToolTip.openWith({
                        str:((_local2.item.sName + "\n") + _local2.item.sDesc),
                        lowerright:true
                    });
                };
            };
        }

        public function actIconOut(_arg1:MouseEvent){
            var _local2:*;
            _local2 = MovieClip(stage.getChildAt(0)).ui.ToolTip;
            _local2.close();
        }

        public function portraitClick(_arg1:MouseEvent){
            var _local2:*;
            var _local3:*;
            _local2 = MovieClip(_arg1.currentTarget);
			if (_local2.PortraitType == "Pet"){
				ui.cMenu.fOpenWith("pet", _local3);
			} else {
				if (_local2.pAV.npcType == "player"){
					_local3 = {};
					(_local3.ID = _local2.pAV.objData.CharID);
					(_local3.strUsername = _local2.pAV.objData.strUsername);
					if (_local2.pAV != world.myAvatar){
						ui.cMenu.fOpenWith("user", _local3);
					}
					else {
						ui.cMenu.fOpenWith("self", _local3);
					};
				};
			}   
        }

        private function onTargetPortraitCloseClick(_arg1:MouseEvent):void{
            world.cancelTarget();
        }

        public function showMap():void{
            (ui.mcInterface.mcMenu.mcMenuButtons.visible = true);
            ui.mcPopup.fOpen("Map");
        }

        public function logout():void{
            (firstMenu = true);
            if (sfc.isConnected){
                sfc.disconnect();
            };
            if (this.currentLabel != "Login"){
                FBApi.fbLogout();
                if (world != null){
                    world.killTimers();
                    world.killListeners();
                    try {
                        world.removeChild(world.map);
                    }
                    catch(e) {
                    };
                    this.removeChild(world);
                    (world = null);
                };
                gotoAndPlay("Login");
				SoundMixer.stopAll();
				loadTitle();
				loadBGM();
            };
        }

        public function showServerList():void{
            if (sfc.isConnected){
                sfc.disconnect();
            };
            if (FBApi.isLoggedIn){
                //ExternalInterface.call("fbLoginNoAuth", "email,publish_actions", "fbLogin");
            }
            else {
                //login(loginInfo.strUsername, loginInfo.strPassword);
            };
        }
		
		public function showCharacterList():void{
            if (sfc.isConnected){
                sfc.disconnect();
            };
            if (FBApi.isLoggedIn){
                //ExternalInterface.call("fbLoginNoAuth", "email,publish_actions", "fbLogin");
            } else {
                login(loginInfo.strUsername, loginInfo.strPassword);
            };
        }

        public function showUpgradeWindow(_arg1:Object=null):void{
            var _local2:MovieClip;
            if (mcUpgradeWindow == null){
                (mcUpgradeWindow = new MCUpgradeWindow());
            };
            _local2 = (mcUpgradeWindow as MovieClip);
            var _local3:* = (((_arg1)!=null) ? _arg1 : world.myAvatar.objData);
            _local2.btnClose.addEventListener(MouseEvent.CLICK, hideUpgradeWindow, false, 0, true);
            _local2.btnClose2.addEventListener(MouseEvent.CLICK, hideUpgradeWindow, false, 0, true);
            _local2.btnBuy.addEventListener(MouseEvent.CLICK, onUpgradeClick, false, 0, true);
            addChild(mcUpgradeWindow);
            try {
                (ui.mouseChildren = false);
                (world.mouseChildren = false);
            }
            catch(e:Error) {
            };
            try {
                (mcLogin.sl.mouseChildren = false);
            }
            catch(e:Error) {
            };
        }
		
		public function showCalculationsRefine(_arg1:Object=null):void{
            var _local2:MovieClip;
            if (mcRefineCalculator == null){
                (mcRefineCalculator = new MCRefineCalculator());
            };
            _local2 = (mcRefineCalculator as MovieClip);
			
            var _local3:* = (((_arg1)!=null) ? _arg1 : world.myAvatar.objData);
            _local2.btnClose.addEventListener(MouseEvent.CLICK, hideCalculationsRefine, false, 0, true);
            /*_local2.btnClose2.addEventListener(MouseEvent.CLICK, hideUpgradeWindow, false, 0, true);
            _local2.btnBuy.addEventListener(MouseEvent.CLICK, onUpgradeClick, false, 0, true);*/
            addChild(mcRefineCalculator);
            try {
                (ui.mouseChildren = false);
                (world.mouseChildren = false);
            }
            catch(e:Error) {
            };
            try {
                (mcLogin.sl.mouseChildren = false);
            }
            catch(e:Error) {
            };
        }
		
		public function hideCalculationsRefine(_arg1:MouseEvent):void{
            removeChild(mcRefineCalculator);
            try {
                (ui.mouseChildren = true);
                (world.mouseChildren = true);
            }
            catch(e:Error) {
            };
            try {
                (mcLogin.sl.mouseChildren = true);
            }
            catch(e:Error) {
            };
        }

        public function hideUpgradeWindow(_arg1:MouseEvent):void{
            removeChild(mcUpgradeWindow);
            try {
                (ui.mouseChildren = true);
                (world.mouseChildren = true);
            }
            catch(e:Error) {
            };
            try {
                (mcLogin.sl.mouseChildren = true);
            }
            catch(e:Error) {
            };
        }

        function onUpgradeClick(_arg1:Event):void{
            mixer.playSound("Click");
            //ExternalInterface.call("setUpPayment", world.myAvatar.objData.CharID, sToken, "");
        }

        public function showACWindow():void{
            var _local1:MovieClip;
            if (mcACWindow == null){
                (mcACWindow = new MCACWindow());
            };
            _local1 = (mcACWindow as MovieClip);
            _local1.btnClose.addEventListener(MouseEvent.CLICK, hideACWindow, false, 0, true);
            _local1.btnClose2.addEventListener(MouseEvent.CLICK, hideACWindow, false, 0, true);
            _local1.btnBuy.addEventListener(MouseEvent.CLICK, onUpgradeClick, false, 0, true);
            _local1.btnUpgrade.addEventListener(MouseEvent.CLICK, onUpgradeClick, false, 0, true);
            addChild(mcACWindow);
            try {
                (ui.mouseChildren = false);
                (world.mouseChildren = false);
            }
            catch(e:Error) {
            };
            try {
                (mcLogin.sl.mouseChildren = false);
            }
            catch(e:Error) {
            };
        }

        public function hideACWindow(_arg1:MouseEvent):void{
            removeChild(mcACWindow);
            try {
                (ui.mouseChildren = true);
                (world.mouseChildren = true);
            }
            catch(e:Error) {
            };
            try {
                (mcLogin.sl.mouseChildren = true);
            }
            catch(e:Error) {
            };
        }

        public function initArrHP():void{
            var _local1:int;
            var _local2:int;
            var _local3:int;
            var _local4:Number;
            var _local5:int;
            var _local6:int;
            var _local7:Number;
            var _local8:int;
            var _local9:int;
            var _local10:Number;
            var _local11:*;
            _local1 = 100;
            _local2 = 550;
            _local3 = 275;
            _local4 = 0.8;
            _local5 = 720;
            _local6 = 200;
            _local7 = 0.92;
            _local8 = 350;
            _local9 = 3650;
            _local10 = 1.1;
            _local11 = 0;
            while (_local11 < _local1) {
                if (_local11 > 19){
                    arrHP.push(Math.round((_local8 + (Math.pow((_local11 / _local1), _local10) * _local9))));
                }
                else {
                    if (_local11 > 7){
                        arrHP.push(Math.round((_local5 + (Math.pow((_local11 / 20), _local7) * _local6))));
                    }
                    else {
                        arrHP.push(Math.round((_local2 + (Math.pow((_local11 / 8), _local4) * _local3))));
                    };
                };
                _local11++;
            };
        }

        public function initArrRep():void{
            var _local1:int;
            var _local2:*;
            _local1 = 0;
            _local2 = 1;
            while (_local2 < 10) {
                _local1 = (Math.pow((_local2 + 1), 3) * 100);
                _local1;
                if (_local2 > 1){
                    arrRanks.push((_local1 + arrRanks[(_local2 - 1)]));
                }
                else {
                    arrRanks.push((_local1 + 100));
                };
                _local2++;
            };
        }

        public function getRankFromPoints(_arg1:int):int{
            var _local2:int;
            var _local3:*;
            _local2 = 1;
            if (_arg1 < 0){
                _arg1 = 0;
                _arg1;
            };
            _local3 = 1;
            while (_local3 < arrRanks.length) {
                if (_arg1 < arrRanks[_local3]){
                    return (_local2);
                };
                _local2++;
                _local3++;
            };
            return (_local2);
        }

        public function attachOnModalStack(_arg1:String):MovieClip{
            var _local2:MovieClip;
            var _local3:Class;
            var _local4:*;
            var _local5:*;
            _local3 = (world.getClass(_arg1) as Class);
            _local4 = true;
            if (ui.ModalStack.numChildren){
                _local2 = MovieClip(ui.ModalStack.getChildAt(0));
                _local2;
                _local5 = (_local2.constructor as Class);
                if (_local5 == _local3){
                    _local4 = false;
                    _local4;
                };
            };
            if (_local4){
                clearModalStack();
                _local2 = MovieClip(ui.ModalStack.addChild(new (_local3)()));
                _local2;
                (ui.ModalStack.mouseChildren = true);
            };
            return (_local2);
        }

        public function getInstanceFromModalStack(_arg1:String):MovieClip{
            var _local2:int;
            _local2 = 0;
            while (_local2 < ui.ModalStack.numChildren) {
                if (getQualifiedClassName((ui.ModalStack.getChildAt(_local2) == _arg1))){
                    return (ui.ModalStack.getChildAt(_local2));
                };
                _local2++;
            };
            return (null);
        }

        public function isDialoqueUp():Boolean{
            var _local1:int;
            var _local2:*;
            var _local3:*;
            _local1 = 0;
            while (_local1 < world.FG.numChildren) {
                _local2 = world.FG.getChildAt(_local1);
                _local3 = String((_local2 as MovieClip));
                if (_local3.indexOf("dlg_") > -1){
                    return (true);
                };
                _local1++;
            };
            return (false);
        }

        public function clearModalStack():Boolean{
            var _local1:int;
            if (isGreedyModalInStack()){
                return (false);
            };
            _local1 = 0;
            while ((((ui.ModalStack.numChildren > 0)) && ((_local1 < 100)))) {
                _local1++;
                ui.ModalStack.removeChildAt(0);
            };
            (stage.focus = null);
            return (true);
        }

        public function closeModalByStrBody(_arg1:String):void{
            var _local2:int;
            var _local3:MovieClip;
            _local2 = 0;
            _local2 = 0;
            while (_local2 < ui.ModalStack.numChildren) {
                _local3 = (ui.ModalStack.getChildAt(_local2) as MovieClip);
                _local3;
                if ((((_local3.cnt.strBody.htmlText.indexOf(_arg1) > -1)) && (!((_local3.currentLabel == "out"))))){
                    _local3.fClose();
                };
                _local2++;
            };
        }

        public function isGreedyModalInStack():Boolean{
            var _local1:int;
            var _local2:MovieClip;
            _local1 = 0;
            _local1 = 0;
            while (_local1 < ui.ModalStack.numChildren) {
                _local2 = (ui.ModalStack.getChildAt(_local1) as MovieClip);
                _local2;
                if (((((("greedy" in _local2)) && (!((_local2.greedy == null))))) && ((_local2.greedy == true)))){
                    return (true);
                };
                _local1++;
            };
            return (false);
        }

        public function clearPopups(_arg1:Array=null):void{
            if (ui.mcPopup.currentLabel == "House"){
                ui.mcPopup.mcHouseMenu.hideItemHandle();
            };
            if ((((_arg1 == null)) || ((_arg1.indexOf(ui.mcPopup.currentLabel) < 0)))){
                ui.mcPopup.onClose();
            };
            world.removeMovieFront();
			//world.removeHelpMovie();
			//world.removeIntroMovie();
            clearModalStack();
        }

        public function clearPopupsQ():void{
            if (((!((ui.mcPopup.currentLabel == "House"))) && (!((ui.mcPopup.currentLabel == "HouseShop"))))){
                ui.mcPopup.onClose();
            };
        }

        public function addUpdate(_arg1:String, _arg2:Boolean=false):void{
            var _local3:MovieClip;
            var _local4:MovieClip;
            var _local5:int;
            _local3 = ui.mcUpdates;
            _local4 = (_local3.addChildAt(new uProto(), 1) as MovieClip);
            (_local4.y = 0);
            (_local4.x = _local3.uproto.x);
            //(_local4.t1.ti.text = _arg1);
			(_local4.t1.ti.htmlText = _arg1);
            if (_arg2){
                (_local4.t1.ti.textColor = 0xFF0000);
            };
            _local4.gotoAndPlay("in");
            _local5 = 2;
            if (_local3.numChildren > 2){
                _local5 = 2;
                while (_local5 < _local3.numChildren) {
                    if (_local5 < 4){
                        (_local3.getChildAt(_local5).y = (_local3.getChildAt(_local5).y - 18));
                    }
                    else {
                        MovieClip(_local3.getChildAt(_local5)).stop();
                        _local3.removeChildAt(_local5);
                        _local5--;
                    };
                    _local5++;
                };
            };
        }

        public function clearUpdates():void{
            var _local1:MovieClip;
            _local1 = ui.mcUpdates;
            while (_local1.numChildren > 1) {
                _local1.removeChildAt(1);
            };
        }
		
		public function addSystemUpdate(_arg1:String, _arg2:Boolean=false):void{
            var _local3:MovieClip;
            var _local4:MovieClip;
            var _local5:int;
            _local3 = ui.mcSystemMsg;
            _local4 = (_local3.addChildAt(new usProto(), 1) as MovieClip);
            (_local4.y = 0);
            (_local4.x = _local3.usproto.x);
            //(_local4.t1.ti.text = _arg1);
			(_local4.t1.ti.htmlText = _arg1);
            if (_arg2){
                (_local4.t1.ti.textColor = 0x00CC66);
            };
            _local4.gotoAndPlay("in");
            _local5 = 2;
            if (_local3.numChildren > 2){
                _local5 = 2;
                while (_local5 < _local3.numChildren) {
                    if (_local5 < 4){
                        (_local3.getChildAt(_local5).y = (_local3.getChildAt(_local5).y - 18));
                    }
                    else {
                        MovieClip(_local3.getChildAt(_local5)).stop();
                        _local3.removeChildAt(_local5);
                        _local5--;
                    };
                    _local5++;
                };
            };
        }

        public function clearSystemUpdate():void{
            var _local1:MovieClip;
            _local1 = ui.mcSystemMsg;
            while (_local1.numChildren > 1) {
                _local1.removeChildAt(1);
            };
        }

        public function showItemDrop(_arg1, _arg2):void{
            var _local3:*;
            if (((!((_arg1.bTemp == 0))) || (!(_arg2)))){
                _local3 = new DFrameMC(_arg1);
                _local3;
            }
            else {
                _local3 = new DFrame2MC(_arg1);
                _local3;
            };
            ui.dropStack.addChild(_local3);
            _local3.init();
            (_local3.fY = (_local3.y = -((_local3.fHeight + 8))));
            (_local3.fX = (_local3.x = -((_local3.fWidth / 2))));
            cleanDropStack();
        }

        public function cleanDropStack():void{
            var _local1:MovieClip;
            var _local2:MovieClip;
            var _local3:*;
            _local1 = null;
            _local2 = null;
            _local3 = (ui.dropStack.numChildren - 2);
            while (_local3 > -1) {
                _local1 = (ui.dropStack.getChildAt(_local3) as MovieClip);
                _local1;
                _local2 = (ui.dropStack.getChildAt((_local3 + 1)) as MovieClip);
                _local2;
                (_local1.fY = (_local1.y = (_local2.fY - (_local2.fHeight + 8))));
                _local3--;
            };
        }

        public function dropStackBoost():void{
            (ui.dropStack.y = 438);
        }

        public function dropStackReset():void{
            (ui.dropStack.y = 493);
        }

        public function showAchievement(_arg1:String, _arg2:int):void{
            var _local3:mcAchievement;
            var _local4:MovieClip;
            _local3 = new mcAchievement();
            _local4 = (ui.dropStack.addChild(_local3) as MovieClip);
            (_local4.cnt.tBody.text = _arg1);
            (_local4.cnt.tPts.text = _arg2);
            (_local4.fWidth = 348);//348
            (_local4.fHeight = 90);
            (_local4.fX = (_local4.x = -((_local4.fWidth / 2))));
            (_local4.fY = (_local4.y = -((_local4.fHeight + 8))));
			_local4.x = -170;
            cleanDropStack();
        }

        public function showQuestpopup(_arg1:Object):void{
            var _local2:mcQuestpopup;
            var _local3:MovieClip;
            var _local4:String;
            var _local5:Object;
            var _local6:int;
            _local2 = new mcQuestpopup();
            (_local2.cnt.mcAC.visible = false);
            _local3 = (ui.dropStack.addChild(_local2) as MovieClip);
            (_local3.cnt.tName.text = _arg1.sName);
            (_local3.cnt.rewards.tRewards.htmlText = "");
            _local4 = "";
            _local5 = _arg1.rewardObj;
            trace(("rewardtype: " + _arg1.rewardType));
            if (_arg1.rewardType == "ac"){
                _local4 = (("<font color='#FFFFFF'>" + _arg1.intAmount) + "</font>");
                _local4;
                _local4 = (_local4 + "<font color='#FFCC00'> Diamonds</font>");
                _local4;
                (_local3.cnt.mcAC.visible = true);
            }
            else {
				if (((("intCopper" in _local5)) && ((_local5.intCopper > 0)))){
                    _local4 = (("<font color='#FFFFFF'>" + _local5.intCopper) + "</font>");
                    _local4;
                    _local4 = (_local4 + "<font color='#FFCC00'>c</font>");
                    _local4;
                };
				if (((("intSilver" in _local5)) && ((_local5.intSilver > 0)))){
					 if (_local4.length > 0){
                        _local4 = (_local4 + "<font color='#FFFFFF'>, </font>");
                        _local4;
                    };
                    _local4 = (("<font color='#FFFFFF'>" + _local5.intSilver) + "</font>");
                    _local4;
                    _local4 = (_local4 + "<font color='#FFCC00'>s</font>");
                    _local4;
                };			
                if (((("intGold" in _local5)) && ((_local5.intGold > 0)))){
					 if (_local4.length > 0){
                        _local4 = (_local4 + "<font color='#FFFFFF'>, </font>");
                        _local4;
                    };
                    _local4 = (("<font color='#FFFFFF'>" + _local5.intGold) + "</font>");
                    _local4;
                    _local4 = (_local4 + "<font color='#FFCC00'>g</font>");
                    _local4;
                };
                if (((("intExp" in _local5)) && ((_local5.intExp > 0)))){
                    if (_local4.length > 0){
                        _local4 = (_local4 + "<font color='#FFFFFF'>, </font>");
                        _local4;
                    };
                    _local4 = (_local4 + (("<font color='#FFFFFF'>" + _local5.intExp) + "</font>"));
                    _local4;
                    _local4 = (_local4 + "<font color='#FF00FF'>xp</font>");
                    _local4;
                };
                if (((("iRep" in _local5)) && ((_local5.iRep > 0)))){
                    if (_local4.length > 0){
                        _local4 = (_local4 + "<font color='#FFFFFF'>, </font>");
                        _local4;
                    };
                    _local4 = (_local4 + (("<font color='#FFFFFF'>" + _local5.iRep) + "</font>"));
                    _local4;
                    _local4 = (_local4 + "<font color='#00CCFF'>rep</font>");
                    _local4;
                };
                if (((("guildRep" in _local5)) && ((_local5.guildRep > 0)))){
                    if (_local4.length > 0){
                        _local4 = (_local4 + "<font color='#FFFFFF'>, </font>");
                        _local4;
                    };
                    _local4 = (_local4 + (("<font color='#FFFFFF'>" + _local5.guildRep) + "</font>"));
                    _local4;
                    _local4 = (_local4 + "<font color='#00CCFF'>guild rep</font>");
                    _local4;
                };
            };
            (_local3.cnt.rewards.tRewards.htmlText = _local4);
            (_local3.fWidth = 240);
            (_local3.fHeight = 70);
            _local6 = (_local3.cnt.rewards.tRewards.x + _local3.cnt.rewards.tRewards.textWidth);
            (_local3.cnt.rewards.x = Math.round(((_local3.fWidth / 2) - (_local6 / 2))));
            (_local3.fX = (_local3.x = -((_local3.fWidth / 2))));
            (_local3.fY = (_local3.y = -((_local3.fHeight + 8))));
            mixer.playSound("Good");
            cleanDropStack();
        }

        public function toggleCharpanel(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "Charpanel"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("Charpanel");
                }
                else {
                    _local2.mcCharpanel.fClose();
                };
            };
			
        }
		
		public function toggleTradePanel(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "TradePanel"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.tradeId = _arg1);
                    (_local2.visible = true);
                    _local2.gotoAndPlay("TradePanel");
                }
                else {
                    _local2.onClose();
                };
            };	
		}
		
		public function toggleArmorCustomization(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "ArmorColor"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.tradeId = _arg1);
                    (_local2.visible = true);
                    _local2.gotoAndPlay("ArmorColor");
                }
                else {
                    _local2.onClose();
                };
            };	
		}
		
		public function toggleGuildCustomization(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "GuildCustomization"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.tradeId = _arg1);
                    (_local2.visible = true);
                    _local2.gotoAndPlay("GuildCustomization");
                }
                else {
                    _local2.onClose();
                };
            };	
			
		}
		
		public function toggleAuctionPanel(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "AuctionPanel"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("AuctionPanel");
                }
                else {
                    _local2.onClose();
                };
            };
        
		}
		
		public function toggleRefinePanel(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "RefinePanel"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("RefinePanel");
                }
                else {
                    _local2.onClose();
                };
            };
        
		}
		
		public function toggleRedeemPanel(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "Redeem"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("Redeem");
                }
                else {
                    _local2.onClose();
                };
            };
        
		}
		
		public function toggleSkillTree(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "SkillTree"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("SkillTree");
                }
                else {
                    _local2.onClose();
                };
            };
        
		}
		
		
		public function toggleVendingSetup(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "VendingSetup"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("VendingSetup");
                }
                else {
                    _local2.mcRedeem.onClose();
                };
            };
        
		}
		
		public function toggleVendingShop(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "VendingShop"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("VendingShop");
                }
                else {
                    _local2.onClose();
                };
            };
        
		}

        public function togglePVPPanel(_arg1:String=""):void{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "PVPPanel"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("PVPPanel");
                }
                else {
                    _local2.onClose();
                };
            };
        }

        public function showPVPScore():void{
            var bar:MovieClip;
            var i:int;
            var o:Object;
            var a:Array;
            var bx:int;
            (ui.mcPVPScore.visible = true);
            (ui.mcPVPScore.y = 2);
            i = 0;
            a = [{sName:"Team A"}, {sName:"Team B"}];
            bx = 200;
            if (world.PVPFactions.length > 0){
                var _local2 = world.PVPFactions;
                a = _local2;
                _local2;
            };
            i = 0;
            while (i < a.length) {
                _local2 = a[i];
                o = _local2;
                _local2;
                try {
                    _local2 = ui.mcPVPScore.getChildByName(("bar" + i));
                    bar = _local2;
                    _local2;
                    (bar.tTeam.text = o.sName);
                    if ((((bar.tTeam.x + bar.tTeam.width) - bar.tTeam.textWidth) - 6) < bx){
                        _local2 = Math.round((((bar.tTeam.x + bar.tTeam.width) - bar.tTeam.textWidth) - 6));
                        bx = _local2;
                        _local2;
                    };
                }
                catch(e:Error) {
                    trace("*** >");
                    trace("*** > PvP Faction data could not be found or set.");
                    trace("*** >");
                };
                i = (i + 1);
            };
            i = 0;
            while (i < a.length) {
                _local2 = a[i];
                o = _local2;
                _local2;
                try {
                    _local2 = ui.mcPVPScore.getChildByName(("bar" + i));
                    bar = _local2;
                    _local2;
                    (bar.cap.x = bx);
                }
                catch(e:Error) {
                };
                i = (i + 1);
            };
        }

        public function hidePVPScore():void{
            (ui.mcPVPScore.visible = false);
            (ui.mcPVPScore.y = -300);
        }

        public function showMCPVPQueue():void{
            var _local1:Object;
            _local1 = world.getWarzoneByWarzoneName(world.PVPQueue.warzone);
            (ui.mcPVPQueue.t1.text = _local1.nam);
            ui.mcPVPQueue.removeEventListener(Event.ENTER_FRAME, MCPVPQueueEF);
            (ui.mcPVPQueue.t2label.visible = false);
            (ui.mcPVPQueue.t2.visible = false);
            if (world.PVPQueue.avgWait > -1){
                (ui.mcPVPQueue.t2label.visible = true);
                (ui.mcPVPQueue.t2.visible = true);
                ui.mcPVPQueue.addEventListener(Event.ENTER_FRAME, MCPVPQueueEF, false, 0, true);
            };
            (ui.mcPVPQueue.visible = true);
            (ui.mcPVPQueue.y = 120);
        }

        public function hideMCPVPQueue():void{
            ui.mcPVPQueue.removeEventListener(Event.ENTER_FRAME, MCPVPQueueEF);
            (ui.mcPVPQueue.visible = false);
            (ui.mcPVPQueue.y = -300);
        }

        public function onMCPVPQueueClick(_arg1:MouseEvent):void{
            var _local2:*;
            _local2 = {};
            try {
                (_local2.strUsername = world.myAvatar.objData.strUsername);
                ui.cMenu.fOpenWith("pvpqueue", _local2);
            }
            catch(e:Error) {
            };
        }

        public function MCPVPQueueEF(_arg1:Event):void{
            var _local2:Number;
            var _local3:*;
            _local2 = new Date().getTime();
            _local3 = Math.ceil(((((world.PVPQueue.avgWait * 1000) - (_local2 - world.PVPQueue.ts)) / 1000) / 60));
            (ui.mcPVPQueue.t2.htmlText = (('<font color="#FFFFFF"' + _local3) + '</font><font color="#999999"m</font>'));
            if (_local3 <= 1){
                (ui.mcPVPQueue.t2.htmlText = ("<" + ui.mcPVPQueue.t2.htmlText));
            };
        }

        public function updatePVPScore(_arg1:Array):void{
            var _local2:Object;
            var _local3:MovieClip;
            var _local4:int;
            var _local5:int;
            _local2 = {};
            _local4 = 0;
            while (_local4 < _arg1.length) {
                _local2 = _arg1[_local4];
                _local2;
                _local3 = (ui.mcPVPScore.getChildByName(("bar" + _local4)) as MovieClip);
                _local3;
                if (_local3 != null){
                    (_local3.ti.text = (_local2.v + "/1000"));
                    _local5 = int(((_local2.v / 1000) * _local3.bar.width));
                    _local5 = Math.max(Math.min(_local5, _local3.bar.width), 0);
                    _local5;
                    (_local3.bar.x = (-(_local3.bar.width) + _local5));
                };
                _local4++;
            };
        }

        public function relayPVPEvent(_arg1:Object):void{
            if (_arg1.typ == "kill"){
                if (_arg1.team == world.myAvatar.dataLeaf.pvpTeam){
                    if (_arg1.val == "Restorer"){
                        addUpdate("An enemy Restorer has been defeated!  The Captain's healing powers are waning!");
                    };
                    if (_arg1.val == "Brawler"){
                        addUpdate("An enemy Brawler has been defeated!  The Captain's attacks grow weaker!");
                    };
                    if (_arg1.val == "Captain"){
                        addUpdate("The enemy captain has been defeated!");
                    };
                    if (_arg1.val == "General"){
                        addUpdate("Victory! The enemy general has been defeated!");
                    };
                    if (_arg1.val == "Knight"){
                        addUpdate("A knight of the enemy has fallen! Victory draws closer!");
                    };
                }
                else {
                    if (_arg1.val == "Restorer"){
                        addUpdate("A Restorer has been defeated!  Our Captain's healing powers are waning!", true);
                    };
                    if (_arg1.val == "Brawler"){
                        addUpdate("A Brawler has been defeated!  Rally to the Captain's defense!", true);
                    };
                    if (_arg1.val == "Captain"){
                        addUpdate("Our Captain has been fallen to the enemy!", true);
                    };
                    if (_arg1.val == "General"){
                        addUpdate("Oh no!  Our general has been defeated!", true);
                    };
                    if (_arg1.val == "Knight"){
                        addUpdate("A knight has fallen to the enemy!");
                    };
                };
            };
        }
	
		
        public function mcSetColor(_arg1:MovieClip, _arg2:String, _arg3:String){
            var _local4:MovieClip;
            var _local6:String;
            _local4 = _arg1;
            var _local5:Boolean;
            _local6 = "none";
            while (((((!((_local4 == null))) && (!((_local4.parent == null))))) && (!((_local4.parent == _local4.stage))))) {
                if (("pAV" in _local4)){
                    if (_local4.name.indexOf("previewMC") > -1){
                        _local6 = "e";
                        _local6;
                    }
                    else {
                        if (_local4.name.indexOf("Dummy") > -1){
                            _local6 = "d";
                            _local6;
                        }
                        else {
                            if (_local4.name.indexOf("mcPortraitTarget") > -1){
                                _local6 = "c";
                                _local6;
                            }
                            else {
                                if (_local4.name.indexOf("mcPortrait") > -1){
                                    _local6 = "b";
                                    _local6;
                                }
                                else {
                                    _local6 = "a";
                                    _local6;
                                };
                            };
                        };
                    };
                    break;
                };
                _local4 = MovieClip(_local4.parent);
                _local4;
            };
            if (_local6 != "none"){
				trace("STAGE: " + StageFrame);
				if(StageFrame == "Characters"){
					mcLogin.pMC.setColor(_arg1, _arg2, _arg3);
				};
				if(StageFrame == "Signup"){
					mcLogin.mcAccount.pMC.setColor(_arg1, _local6, _arg2, _arg3);
				};
				if(StageFrame == "Game"){
					_local4.pAV.pMC.setColor(_arg1, _local6, _arg2, _arg3);
				};
				
				
            };
		}
		
        public function areaListClick(_arg1:MouseEvent):void{
            var _local2:*;
            _local2 = MovieClip(_arg1.currentTarget.parent.parent);
            switch (_local2.currentLabel){
                case "init":
                    _local2.gotoAndPlay("in");
                    return;
                case "hold":
                    _local2.gotoAndPlay("out");
                    return;
            };
        }

        public function updateAreaName():void{
            var _local1:String;
            _local1 = (String(world.areaUsers.length) + " player");
            if (world.areaUsers.length > 1){
                _local1 = (_local1 + "(s)");
                _local1;
            };
            _local1 = (_local1 + " in <font color ='#FFFF00'>");
            _local1;
            if (world.strAreaName.indexOf(":") > -1){
                _local1 = (_local1 + (world.strAreaName.split(":")[0] + " (party)"));
                _local1;
            }
            else {
                _local1 = (_local1 + world.strAreaName);
                _local1;
            };
            _local1 = (_local1 + "</font>");
            _local1;
            (ui.mcInterface.areaList.title.t1.htmlText = _local1);
        }

        public function areaListGet():void{
            var _local1:Object;
            var _local2:Object;
            var _local3:String;
            var _local4:*;
            _local1 = {};
            _local2 = sfc.getRoom(world.curRoom).getUserList();
            for (var _local7 in _local2) {
                _local3 = _local7;
                _local4 = world.uoTree[_local2[_local3].getName().toLowerCase()];
                if (_local4 != null){
                    (_local1[_local3.toLowerCase()] = {
                        strUsername:_local4.strUsername,
                        intLevel:_local4.intLevel
                    });
                };
            };
            areaListShow(_local1);
        }

        public function areaListNameClick(_arg1:MouseEvent):void{
            var _local2:*;
            var _local3:*;
            _local2 = MovieClip(_arg1.currentTarget);
            _local3 = {};
            (_local3.ID = _local2.objData.ID);
            (_local3.strUsername = _local2.objData.strUsername);
            if (_local2.objData.strUsername == world.myAvatar.objData.strUsername){
                ui.cMenu.fOpenWith("self", _local3);
            }
            else {
                ui.cMenu.fOpenWith("user", _local3);
            };
        }

        public function areaListShow(_arg1:Object):void{
            var _local2:MovieClip;
            var _local3:int;
            var _local4:String;
            var _local5:*;
            _local2 = ui.mcInterface.areaList;
            _local3 = 0;
            for (var _local8 in _arg1) {
                _local4 = _local8;
                _local8;
                _local5 = _local2.cnt.addChild(new aProto());
                (_local5.objData = _arg1[_local4]);
                (_local5.txtName.text = _arg1[_local4].strUsername);
                (_local5.txtLevel.text = _arg1[_local4].intLevel);
                _local5.addEventListener(MouseEvent.CLICK, areaListNameClick, false, 0, true);
                (_local5.buttonMode = true);
                (_local5.y = -(int((_local3 * 14))));
                _local3++;
            };
            (_local2.cnt.iproto.visible = false);
            (_local2.visible = true);
        }

        public function showFBShare(_arg1:Object):void{
            var fbTab:FacebookTabMC;
            var o:Object = _arg1;
            trace(((("showFBShare > " + o.isActive) + ", ") + uoPref.bFBShare));
            var mc:MovieClip = MovieClip(o.parent);
            var FBShareTabClass:Class = (getDefinitionByName("FacebookTabMC") as Class);
            if (((uoPref.bFBShare) && (o.isActive))){
                trace("  trying to show the tab");
                try {
                    var _local3 = (o.parent.getChildByName("fbTab") as FacebookTabMC);
                    fbTab = _local3;
                    _local3;
                }
                catch(error:Error) {
                    trace(error);
                };
                if (fbTab == null){
                    _local3 = new (FBShareTabClass)();
                    fbTab = _local3;
                    _local3;
                    (fbTab.name = "fbTab");
                    (fbTab.filters = [new GlowFilter(12892822, 1, 10, 10, 2, 2, false, false)]);
                    o.parent.addChild(fbTab);
                    trace(" tab drawn");
                };
                fbTab.init(o);
                (fbTab.visible = true);
                if (("position" in o)){
                    fbTab.positionBy(o);
                };
            }
            else {
                try {
                    (o.parent.getChildByName("fbTab").visible = false);
                }
                catch(error:Error) {
                };
            };
        }

        public function closeFBC():void{
            trace("closeFBC()");
            if (fbc != null){
                fbc.fClose();
            };
        }

        public function getAppName():String{
            return (Game.FB_APP_NAME);
        }

        public function getAppID():String{
            return (Game.FB_APP_ID);
        }

        public function getAppSec():String{
            return (Game.FB_APP_SEC);
        }

        public function getAppURL():String{
            return (Game.FB_APP_URL);
        }

        public function getUserName():String{
            if (((((((!((world == null))) && (!((world.myAvatar == null))))) && (!((world.myAvatar.objData == null))))) && (("strUserName" in world.myAvatar.objData)))){
                return (world.myAvatar.objData.strUserName);
            };
            return ("");
        }

        public function toggleFaction():void{
            if (ui.mcPopup.currentLabel != "Faction"){
                ui.mcPopup.fOpen("Faction");
            }
            else {
                if (("cnt" in MovieClip(ui.mcPopup))){
                    MovieClip(MovieClip(ui.mcPopup).cnt).xClick();
                };
            };
        }

        public function hideInterface():void{
            (ui.visible = false);
        }

        public function showInterface():void{
            (ui.visible = true);
        }

        public function loadExternalSWF(_arg1:String):void{
            if (_arg1.indexOf("http://") == -1){
                _arg1 = ("maps/" + _arg1);
                _arg1;
            };
            ldrMC.loadFile(mcExtSWF, _arg1, "Game Files");
            hideInterface();
            (world.visible = false);
        }

        public function clearExternamSWF():void{
            while (mcExtSWF.numChildren > 0) {
                mcExtSWF.removeChildAt(0);
            };
            (world.visible = true);
            showInterface();
        }

        public function openCharacterCustomize():void{
            ui.mcPopup.fOpen("Customize");
        }

        public function openArmorCustomize():void{
            ui.mcPopup.fOpen("ArmorColor");
        }

        public function showFactionInterface():void{
            ui.mcPopup.fOpen("Faction");
        }

        public function showConfirmtaionBox(_arg1:String, _arg2:Function):void{
            var modal:* = undefined;
            var modalO:* = undefined;
            var sMsg:String = _arg1;
            var fHandler:Function = _arg2;
            modal = new ModalMC();
            modalO = {};
            (modalO.strBody = sMsg);
            (modalO.btns = "dual");
            (modalO.params = {});
            (modalO.callback = function (_arg1:Object){
                fHandler(_arg1.accept);
            });
            ui.ModalStack.addChild(modal);
            modal.init(modalO);
        }

        public function showMessageBox(_arg1:String, _arg2:Function=null):void{
            var modal:* = undefined;
            var modalO:* = undefined;
            var sMsg:String = _arg1;
            var fHandler = _arg2;
            modal = new ModalMC();
            modalO = {};
            (modalO.strBody = sMsg);
            (modalO.btns = "mono");
            (modalO.params = {});
            (modalO.callback = function (_arg1:Object){
                if (fHandler != null){
                    fHandler();
                };
            });
            ui.ModalStack.addChild(modal);
            modal.init(modalO);
        }

        public function getServerTime():Date{
            var _local1:Date;
            var _local2:*;
            _local1 = new Date();
            _local2 = (ts_login_server + (_local1.getTime() - ts_login_client));
            return (new Date(_local2));
        }

        public function get date_server():Date{
            return (getServerTime());
        }

        public function WT_init(){
            (wt = new WildTangentAPI());
            (wt.userId = objLogin.userid);
            (wt.gameName = "aqworld");
            (wt.partnerName = "artix");
            (wt.siteName = "artix_v1");
            (wt.BrandBoost.handlePromo = WT_handlePromo);
            (wt.Vex.redeemCode = WT_redeemCode);
            (wt.BrandBoost.closed = WT_closed);
            try {
                if (world.objInfo.sWTSandbox == "true"){
                    (wt.sandbox = true);
                    (wt_sandbox = true);
                };
            }
            catch(e:Error) {
                (wt.sandbox = false);
                (wt_sandbox = false);
            };
            (wt = (addChildAt(wt, 0) as WildTangentAPI));
        }

        public function WT_checkForPromo(){
            var _local1:String;
            _local1 = String((wt_promoName + wt_promoID));
            wt_promoID++;
            (isWTPromoAvailable = false);
            (wtResponseObject = {});
            (wtRedeemObject = {});
            try {
                wt.BrandBoost.getPromo({promoName:_local1});
            }
            catch(e:Error) {
            };
        }

        public function WT_handlePromo(_arg1:Object):void{
            (wtResponseObject = _arg1);
            if (_arg1.available){
                (isWTPromoAvailable = true);
            };
            try {
                world.map.eventTrigger({cmd:"wt_draw"});
            }
            catch(e:Error) {
            };
        }

        public function WT_launch():void{
            if (isWTPromoAvailable){
                //ExternalInterface.call("UpdateMain", "hidden");
                wt.BrandBoost.launch(wtResponseObject);
            };
        }

        public function WT_trace():void{
            var _local1:String;
            trace("WT_trace() >>>");
            trace("  WT WTresponseObject > ");
            for (var _local4 in wtResponseObject) {
                _local1 = _local4;
                _local4;
                trace(((("    " + _local1) + " : ") + wtResponseObject[_local1]));
            };
            trace("");
        }
		
        public function WT_redeemCode(_arg1:Object):void{
            (wtRedeemObject = _arg1);
            if (wtResponseObject.itemKey.indexOf(":") > -1){
                world.getMapItem(wtResponseObject.itemKey.split(":")[0]);
            }
            else {
                world.getMapItem(wtResponseObject.itemKey);
            };
            if (wt_sandbox){
                (wtUrlRequest = new URLRequest(("http://vex.bpi.wildtangent.com/v1/client/Verification?vexCode=" + _arg1.vexCode)));
            }
            else {
                (wtUrlRequest = new URLRequest(("http://vex.wildtangent.com/v1/client/Verification?vexCode=" + _arg1.vexCode)));
            };
            (wtUrlLoader = new URLLoader());
            (wtUrlLoader.dataFormat = URLLoaderDataFormat.VARIABLES);
            wtUrlLoader.addEventListener(Event.COMPLETE, WT_VexVerify_complete);
            wtUrlLoader.addEventListener(IOErrorEvent.IO_ERROR, WT_VexVerify_error);
            wtUrlLoader.load(wtUrlRequest);
        }

        public function WT_VexVerify_complete(_arg1:Event):void{
            var _local2:String;
            var _local3:String;
            var _local4:String;
            if (((((!((wtUrlLoader == null))) && (!((wtUrlLoader.data == null))))) && (("ItemName" in wtUrlLoader.data)))){
                wt.Vex.redemptionComplete(wtRedeemObject);
            };
        }

        function WT_VexVerify_error(_arg1:Event){
            trace(_arg1);
        }

        public function WT_closed(_arg1:Object):void{
            var _local2:String;
            var _local3:*;
            var _local4:*;
            //ExternalInterface.call("UpdateMain", "visible");
            _local2 = "item";
            try {
                _local2 = world.invTree[wtResponseObject.itemKey.split(":")[1]].sName;
                _local2;
            }
            catch(e:Error) {
            };
            _local3 = new ModalMC();
            _local4 = {};
            switch (_arg1.reason){
                case "redeemed":
                    (_local4.strBody = (("Congratulations!  You have successfully redeemed your " + _local2) + "!"));
                    (_local4.btns = "mono");
                    (_local4.params = {});
                    (_local4.glow = "green,medium");
                    WT_checkForPromo();
                    break;
                case "abandon":
                    (_local4.strBody = "You have closed out of the video.  No items were redeemed.");
                    (_local4.btns = "mono");
                    (_local4.params = {});
                    (_local4.glow = "red,medium");
                    break;
                case "error":
                    (_local4.strBody = "Oh no, the item redemption didn't work!  Please clear your cache, refresh your browser, and try again.");
                    (_local4.btns = "mono");
                    (_local4.params = {});
                    (_local4.glow = "red,medium");
                    break;
            };
            ui.ModalStack.addChild(_local3);
            _local3.init(_local4);
        }

        public function rand(_arg1:Number=0, _arg2:Number=1):Number{
            return (rn.rand(_arg1, _arg2));
        }

        public function get TravelMap():Object{
            return (travelMapData);
        }
		
		function onBGMLoadComplete(evt:Event):void {
			BGMChannel = LoginBGM.play(0, 9999);
		}
		
		public function loadGameAssets():void{	
			trace("loadGameAssets()");
			var _local1:Loader = new Loader();
			var _local2:URLRequest;
			mcConnDetail.showConn("Loading Avatar...");
			if (CharacterSWF != ""){
				_local2 = new URLRequest(serverFilePath + "interface/assets/" + CharacterSWF);
			} else {
				_local2 = new URLRequest(serverFilePath + "interface/assets/" + CharacterSWF);
			};
            _local1.contentLoaderInfo.addEventListener(Event.COMPLETE, onGameAssetsLoaded, false, 0, true);
            _local1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onGameAssetsLoadError, false, 0, true);
            _local1.load(_local2, assetsContext);			           
        }
		
		private function onGameAssetsLoaded(e:Event):void
        {
			trace("*** LOADED ***");
            // mcConnDetail.hideConn();
        }
		
        private function onGameAssetsLoadError(e:Event):void
        {
           trace("*** Game Assets could not be loaded ***");
		}
		
		public function getAssetClass(assetLinkageID:String):Class
        {
            return ((assetsDomain.getDefinition(assetLinkageID) as Class));
        }
		
		public function gotoCharSelection():void
        {
			if (objLogin.chars.length == 0){
				mcLogin.gotoAndPlay("CharNew");
			} else {
				mcLogin.gotoAndPlay("Chars");
			};
		}
		
        function frame1(){
            stop();
        }

        function frame10(){
            init();
			SecurityTest(aliasDefault, aliasCurrent);
			CheckAPI();
			loadTitle();
			loadBGM();
        }

        function frame11(){
            loadTitle();
			loadBGM();
            stop();
        }

        function frame19(){
            trace("at game");
			stage.frameRate = 120;
			trace(stage.frameRate) 
            initInterface();
            initWorld();
            stop();
        }

        function frame29(){
            //loadAccountCreation("newuser/HiddenProject-Landing-12Feb14.swf");
            stop();
        }


    }
}//package