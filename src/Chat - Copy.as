// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Chat

package {
    import flash.display.MovieClip;
    import flash.net.SharedObject;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    import flash.filters.BevelFilter;
    import flash.geom.Point;
    import flash.geom.ColorTransform;
    import flash.events.TextEvent;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFieldType;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import flash.geom.Rectangle;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.display.DisplayObjectContainer;
    import flash.text.*;

    public class Chat {

        public var rootClass;
        public var iChat:int = 1;
        public var mode:int = 1;
        var pmMode = 0;
        private var chatArray:Array;
        private var tradeArray:Array;
        private var t1Arr;
        private var t2Arr;
        public var tl:MovieClip;
        private var silentMute = 0;
        private var profanityF:int = 0;
        private var lineLimit:int = 100;
        public var mci:MovieClip;
		public var mci2:MovieClip;
        public var pmSourceA;
        public var pmI:int = 0;
        public var pmNm:String = "";
        public var ignoreList:SharedObject;
        public var muteData:SharedObject;
        public var mute;
        public var myMsgs;
        public var myMsgsI:int = 0;
        public var chn;
        public var emailWarning:String = "WARNING: Never give your email or password to anyone else. Moderators have gold names. If a player does not have a gold name they are NOT a moderator or staff member.";
        public var legalChars:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*_+-=:\"?,./;'\\|<>() ";
        public var legalCharsStrict:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        public var markChars = "~!@#$%^&*()_+-=:\"<>?,.;'\\";
        public var strictComparisonChars = "~!@#$%^&*()_+-=:\"<>?,.;'\\ÇüéâäåçêëèïîìÄÅæÆôöòûùÿ֣¥áíóúñ?£ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝß";
        public var strictComparisonCharsB = "~!#%^&()_+-=:\"<>?,.;'\\ÇüéâäåçêëèïîìÄÅæÆôöòûùÿ֣¥áíóúñ?£ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝß";
        public var illegalStrings;
        public var modWhisperCheckList:Array;
        public var regExpA:RegExp;
        public var regExpE:RegExp;
        public var regExpI:RegExp;
        public var regExpO:RegExp;
        public var regExpU:RegExp;
        public var regExpSPACE:RegExp;
		
        public var regExpLinking1:RegExp;
        public var regExpLinking2:RegExp;
        public var regExpLinking3:RegExp;		
		
        var regExpMod:RegExp;
        public var regExpURL:RegExp;
        public var unsendable;
        private var whichField = 0;
        private var msgFields;
        private var drawnA:Array;
        public var tfHeight:int = 126;
        public var t1Shorty:int = -137;
        public var t1Tally:int = -378;
        public var tfdH:int;
        public var panelIndex:int = 0;
        private var msgID:int = 0;
        var xmlCannedOptions:XML;
        private var profanityA:Array;
        private var profanityB:Array;
        private var profanityC:Array;
        private var mcCannedChat:MovieClip;
        public var t:Timer;
        public var windowTimer:Timer;

        public function Chat(){
            chatArray = [];
            tradeArray = [];
            t1Arr = [];
            t2Arr = [];
            pmSourceA = [];
            ignoreList = SharedObject.getLocal("ignoreList");
            muteData = SharedObject.getLocal("muteData");
            mute = {
                ts:0,
                cd:0,
                timer:new Timer(0, 1)
            };
            myMsgs = [];
            chn = new Object();
            illegalStrings = ["&#", "www", "http", "ftp", ".com", ".c0m", ".net", ".org", ".de", ".ru", ".sg", ".ph", ".tk", "dotcom", "freegold", "freecoins", "freeadventurecoins", "freelevels", "freeitems", "freeupgrades", "gmail", "yahoo", "hotmail", "aol", "formfacil", "email", "password", "hyperderp"];
            modWhisperCheckList = ["free", "acs", "member", "pass", "login", "user", "imamod", "iamamod", "i'mamod", "account"];
            regExpA = /(a{2,})/gi;
            regExpE = /(e{2,})/gi;
            regExpI = /(i{2,})/gi;
            regExpO = /(o{2,})/gi;
            regExpU = /(u{2,})/gi;
            regExpSPACE = /(\s{2,})/gi;
            regExpMod = /(\(|<)mod(era(t|d)or)?(>|\))/gi;
            regExpURL = new RegExp("\\bhttp://[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]", "i");
            regExpLinking1 = /<\s*P\b.*?>(.*?)<\s*\/P\s*>/gi;
            regExpLinking2 = /<\s*FONT\b.*?>(.*?)<\s*\/FONT\s*>/gi;
            regExpLinking3 = /<\s*A HREF="(.*?)" TARGET="">(.*?)<\s*\/A\s*>/gi;			
			
            unsendable = ["@"];
            msgFields = ["t1:", "t2:say,zone,trade,moderator"];
            drawnA = [];
            tfdH = Math.abs((t1Tally - t1Shorty));
            xmlCannedOptions = <CannedChat>
	<l1 display="Emotes">
		<l2 id="emote" display="Dance" text="dance"/>
		<l2 id="emote" display="Dance2" text="dance2"/>
		<l2 id="emote" display="Laugh" text="laugh"/>
		<l2 id="emote" display="Cry" text="cry"/>
		<l2 id="emote" display="Cheer" text="cheer"/>
		<l2 id="emote" display="Point" text="point"/>
		<l2 id="emote" display="Use" text="use"/>
		<l2 id="emote" display="Feign" text="feign"/>
		<l2 id="emote" display="Sleep" text="sleep"/>
		<l2 id="emote" display="Jump" text="jump"/>
		<l2 id="emote" display="Punt" text="punt"/>
		<l2 id="emote" display="Wave" text="wave"/>
		<l2 id="emote" display="Bow" text="bow"/>
		<l2 id="emote" display="Salute" text="Salute"/>
		<l2 id="emote" display="Backflip" text="backflip"/>
		<l2 id="emote" display="Swordplay" text="swordplay"/>
		<l2 id="emote" display="Unsheath" text="unsheath"/>
		<l2 id="emote" display="Facepalm" text="facepalm"/>
		<l2 id="emote" display="Air Guitar" text="airguitar"/>
		<l2 id="emote" display="Stern" text="stern"/>
		<l2 id="emote" display="Fart" text="fart"/>
	</l1>
	<l1 display="VIP Emotes">
		<l2 id="emote" display="Powerup" text="powerup"/>
		<l2 id="emote" display="Kneel" text="kneel"/>
		<l2 id="emote" display="Jumpcheer" text="jumpcheer"/>
		<l2 id="emote" display="Salute2" text="salute2"/>
		<l2 id="emote" display="Cry2" text="cry2"/>
		<l2 id="emote" display="Spar" text="spar"/>
		<l2 id="emote" display="Stepdance" text="stepdance"/>
		<l2 id="emote" display="Headbang" text="headbang"/>
		<l2 id="emote" display="Dazed" text="dazed"/>
		<l2 id="emote" display="Samba" text="samba"/>
		<l2 id="emote" display="Useweapon" text="useweapon"/>
		<l2 id="emote" display="Danceweapon" text="danceweapon"/>
	</l1>
	<l1 display="Unlock Emotes">
		<l2 id="emote" display="Dab" text="dab"/>
		<l2 id="emote" display="Headscratch" text="headscratch"/>
		<l2 id="emote" display="Shock" text="shock"/>
		<l2 id="emote" display="Gangnam" text="gangnam"/>
	</l1>
	
	<l1 display="Answers">
		<l2 id="jo" display="I can only use Canned Chat." text="I can only use Canned Chat."/>
	</l1>
</CannedChat>
            ;
            profanityA = new Array("@$$", "&&##", "anal", "arse", "ass", "a55", "a5s", "as5", "a$$", "a$s", "as$", "a5$", "a$5", "a*s", "*ss", "a**", "as*", "assclown", "assface", "asshole", "asswipe", "bastard", "beating the meat", "beef curtains", "beef flaps", "betch", "biatch", "bich", "bish", "b1ch", "b!ch", "blch", "b|ch", "bitch", "b1tch", "b!tch", "bltch", "b|tch", "bizzach", "blowjob", "boobies", "boobs", "b00bs", "buggery", "bullshit", "buttsex", "carpet muncher", "carpet munchers", "carpetlicker", "carpetlickers", "ch1nk", "chink", "chode", "clit", "cocaine", "cock", "cocks", "c0ck", "co*k", "c*ck", "cocksucker", "condom", "cracka", "cum", "cunt", "cunts", "c*nt", "cu*t", "*unt", "cun*", "damn", "d1ck", "dick", "di*k", "d*ck", "d**k", "d|ck", "dildo", "d1ldo", "dumbass", "dumb4ss", "dyke", "ejaculate", "f*ck", "feck", "f@g", "fag", "f4ggot", "f4gg0t", "faggot", "fap", "f4p", "fapping", "f4pping", "fatass", "fack", "feck", "felcher", "foreskin", "fhuck", "fking", "fuk", "fck", "fuc", "fu*k", "fuck", "fuuck", "fuuk", "fcuk", "fvck", "fvk", "fvvck", "fvvk", "fock", "fux0r", "fucken", "fucker", "fucking", "fudgepacker", "ganja", "g4y", "gay", "gey", "gook", "g*y", "h0r", "h*re", "hentai", "heroin", "h0mo", "h0m0", "homo", "horny", "injun", "jack off", "jerk off", "jackass", "j1sm", "jism", "j1zz", "jizz", "kawk", "kike", "klootzak", "knulle", "kraut", "kuk", "kunt", "kuksuger", "kurac", "kurwa", "kusi", "kyrpa", "l3+ch", "lesbian", "lesbo", "lez", "marijuana", "masturbate", "masturbation", "meat puppet", "merd", "milf", "molester", "m0lester", "m0l3ster", "m0l3st3r", "motherfucker", "muie", "mulkku", "nads", "nazi", "n1gga", "nigga", "nigger", "nutsack", "orospu", "orgasm", "orgy", "p0rn", "paska", "penis", "phuck", "pierdol", "pillu", "pimmel", "pimp", "piss", "poontsee", "porn", "p0rno", "p0rn0", "porno", "pr0n", "preteen", "pron", "prostitute", "pussy", "pussie", "pu$$y", "puta", "puto", "queef", "r4pe", "rape", "r4ped", "raped", "rapist", "retard", "rimjob", "schaffer", "schiess", "schlampe", "screw", "scrotum", "secks", "s3x", "sex", "s*x", "se*", "sharmuta", "sharmute", "shipal", "shit", "sh1t", "sh!t", "shlt", "sh|t", "shiz", "sh1z", "sh!z", "shlz", "sh|z", "shiit", "shi!t", "sh!it", "shilt", "shlit", "sh||t", "shi|t", "sh|it", "shiiz", "shi t", "shyt", "sh*t", "s*it", "s**t", "s***", "shlong", "skank", "skurwysyn", "slut", "sl*t", "s**t", "smartass", "smut", "spierdalaj", "splooge", "threesome", "tit", "tits", "titties", "twat", "vagina", "wank", "weed", "wetback", "whack off", "wh0re", "whore", "whoring", "wichser", "yolasite", "zabourah", "yolas1te", "y0lasite", "y0las1te", "webly", "w33bly", "web1y", "w33b1y", "anus", "4nus", "rectum", "r3ctum", "foda", "fodao", "phoda", "phodao", "hyperderp", "hyp3rd3rp", "hyp3rderp", "hyperd3rp");
            profanityB = [];
            profanityC = ["bitch", "b1tch", "b!tch", "bltch", "b|tch", "damn", "dick", "fag", "fuk", "fvk", "fvck", "fuck", "pussy", "shit", "sh1t", "sh!t", "shlt", "sh|t"];
            t = new Timer(500, 1);
            windowTimer = new Timer(60000, 1);
			
			super();
            chn.cur = {};
            chn.lastPublic = {};            
            chn.xt = "zm";
            chn.zone = {};
            chn.trade = {};
            chn.moderator = {};
			chn.mod = {};
            chn.admin = {};
			chn.ps = {};
			chn.vip = {};
			chn.world = {};
            chn.warning = {};
            chn.server = {};
            chn.event = {};
            chn.whisper = {};
            chn.party = {};
            chn.guild = {};
            chn.warlord = {};
            chn.champion = {};
            chn.knight = {};
            chn.archangel = {};
			
        
			
            chn.wheel = {};
            chn.wheel.col = "FFCC33";
			chn.wheel.tag = "Carnaval";
			chn.wheel.str = "wheel";
			chn.wheel.typ = "whisper";
			chn.wheel.rid = 0;
			chn.wheel.act = 1;
            chn.administrator = {};
            chn.administrator.col = "FFCC33";
			chn.administrator.tag = "Administrator";
			chn.administrator.str = "administrator";
			chn.administrator.typ = "whisper";
			chn.administrator.rid = 0;
			chn.administrator.act = 1;			
			chn.mod.col = "FF9900";
            chn.mod.tag = "";
            chn.mod.str = "mod";
            chn.mod.typ = "message";
            chn.mod.rid = 0;
            chn.mod.act = 1;
			chn.admin.col = "FF3333";
            chn.admin.tag = "";
            chn.admin.str = "admin";
            chn.admin.typ = "message";
            chn.admin.rid = 0;
			chn.admin.act = 1;
            chn.ps.col = "99FF66";
            chn.ps.tag = "";
            chn.ps.str = "ps";
            chn.ps.typ = "message";
            chn.ps.rid = 0;
            chn.ps.act = 1;
            chn.vip.col = "00FFFF";
            chn.vip.str = "vip";
            chn.vip.typ = "message";
            chn.vip.tag = "";
            chn.vip.rid = 0;
            chn.vip.act = 1;
			chn.world.col = "FFCC99";
            chn.world.str = "world";
            chn.world.typ = "message";
            chn.world.tag = "World";
            chn.world.rid = 0;
            chn.world.act = 1;
            chn.warlord.col = "CE5DFF";
            chn.warlord.str = "warlord";
            chn.warlord.typ = "message";
            chn.warlord.tag = "";
            chn.warlord.rid = 0;
            chn.warlord.act = 1;
            chn.champion.col = "CE5DFF";
            chn.champion.str = "champion";
            chn.champion.typ = "message";
            chn.champion.tag = "";
            chn.champion.rid = 0;
            chn.champion.act = 1;
            chn.knight.col = "CE5DFF";
            chn.knight.str = "knight";
            chn.knight.typ = "message";
            chn.knight.tag = "";
            chn.knight.rid = 0;
            chn.knight.act = 1;
			chn.archangel.col = "FFFF00";
            chn.archangel.str = "archangel";
            chn.archangel.typ = "message";
            chn.archangel.tag = "";
            chn.archangel.rid = 0;
            chn.archangel.act = 1;
            chn.zone.col = "9CCAFD";
            chn.trade.col = "306754";
            chn.moderator.col = "FFCC33";
            chn.warning.col = "FF0000";
            chn.server.col = "00FFFF";
            chn.event.col = "00FF00";
            chn.whisper.col = "FF00FF";
            chn.party.col = "00CCFF"; //00CCFF
            chn.guild.col = "99FF00";
            chn.zone.str = "zone";
            chn.trade.str = "trade";
            chn.moderator.str = "moderator";
            chn.warning.str = "warning";
            chn.server.str = "server";
            chn.event.str = "event";
            chn.whisper.str = "whisper";
            chn.party.str = "party";
            chn.guild.str = "guild";
            chn.zone.typ = "message";
            chn.trade.typ = "message";
            chn.moderator.typ = "whisper";
            chn.warning.typ = "server";
            chn.server.typ = "server";
            chn.event.typ = "event";
            chn.whisper.typ = "whisper";
            chn.party.typ = "message";
            chn.guild.typ = "message";
            chn.zone.tag = "";
            chn.trade.tag = "Trade";
            chn.moderator.tag = "Moderator";
            chn.warning.tag = "";
            chn.server.tag = "";
            chn.whisper.tag = "Whisper";
            chn.event.tag = "";
            chn.party.tag = "Party";
            chn.guild.tag = "Guild";
            chn.zone.rid = 0;
            chn.trade.rid = 0;
            chn.moderator.rid = 0;
            chn.warning.rid = 0;
            chn.server.rid = 0;
            chn.event.rid = 0;
            chn.whisper.rid = 0;
            chn.party.rid = 32123;
            chn.guild.rid = 0;
            chn.zone.act = 1;
            chn.trade.act = 0;
            chn.moderator.act = 1;
            chn.warning.act = 1;
            chn.server.act = 1;
            chn.event.act = 1;
            chn.whisper.act = 1;
            chn.party.act = 0;
            chn.guild.act = 0;
            chn.cur = chn.zone;
            chn.lastPublic = chn.cur;
            if (ignoreList.data.users == undefined){
                ignoreList.data.users = new Array();
            };
            
        }

        private function initProfanity():void{
            var _local4:String;
            var _local1:Array = new Array("butt", "pron", "rape", "tits", "shi t", "shi t");
            var _local2:Array = new Array("as5", "a5s", "a$$", "a5$", "a$5", "as$", "fck", "fkc", "fvk", "fuck", "fvck", "fukk", "fvkk", "sh!t", "sh|t", "sh1t", "shiz");
            var _local3:int;
            while (_local3 < profanityA.length) {
                _local4 = rootClass.stripWhiteStrict(profanityA[_local3]);
                if ((((_local1.indexOf(_local4) == -1)) && ((((_local4.length > 4)) || ((_local2.indexOf(_local4) > -1)))))){
                    profanityB.push(_local4);
                }
                else {
                    if (profanityA[_local3].indexOf("*") > -1){
                        profanityB.push(profanityA[_local3]);
                    };
                };
                _local3++;
            };
        }

        function init(){
            mci = rootClass.ui.mcInterface;
			mci2 = rootClass.ui.mcInterface.chatLog;
            chatArray = [];
            tradeArray = [];
            t1Arr = [];
            drawnA = [];
            msgID = 0;
            panelIndex = 0;
            tfHeight = 126;
            t1Shorty = -137;
            t1Tally = -378;
            tfdH = Math.abs((t1Tally - t1Shorty));
            initProfanity();
            if (muteData.data != null){
                mute.ts = muteData.data.ts;
                mute.cd = muteData.data.cd;
            };
            mute.timer.addEventListener(TimerEvent.TIMER, unmuteMe, false, 0, true);
            if (mcCannedChat == null){
                mcCannedChat = initCannedChat(xmlCannedOptions.children());
            };
            mci.tt.mouseEnabled = false;
			
            tl = (mci2.textLine as MovieClip);
            tl.ti.htmlText = "";
            tl.ti.autoSize = "left";
            tl.visible = false;
			
            mci.bMinMax.buttonMode = true;
            mci.bMinMax.a2.visible = false;
            mci.bShortTall.buttonMode = true;
            mci.bShortTall.a2.visible = false;
            mci.te.text = "";
            mci.te.visible = false;
            mci.tt.text = "";
            mci.tt.visible = false;
            mci.te.maxChars = 150;
            mci.bCannedChat.removeEventListener(MouseEvent.CLICK, onCannedChatClick);
            mci.bsend.removeEventListener(MouseEvent.CLICK, chat_btnSend);
            mci.tebg.removeEventListener(MouseEvent.CLICK, chat_tebgClick);
            mci.bMinMax.removeEventListener(MouseEvent.CLICK, bMinMaxClick);
            mci.bMinMax.removeEventListener(MouseEvent.MOUSE_OVER, bMinMaxMouseOver);
            mci.bMinMax.removeEventListener(MouseEvent.MOUSE_OUT, bMinMaxMouseOut);
            mci.bShortTall.removeEventListener(MouseEvent.CLICK, bShortTallClick);
            mci.bShortTall.removeEventListener(MouseEvent.MOUSE_OVER, bShortTallMouseOver);
            mci.bShortTall.removeEventListener(MouseEvent.MOUSE_OUT, bShortTallMouseOut);
            rootClass.stage.removeEventListener(KeyboardEvent.KEY_DOWN, rootClass.key_StageLogin);
            rootClass.stage.removeEventListener(KeyboardEvent.KEY_DOWN, rootClass.key_StageGame);
            mci.te.removeEventListener(KeyboardEvent.KEY_DOWN, rootClass.key_ChatEntry);
            mci.te.removeEventListener(Event.CHANGE, checkMsgType);
            rootClass.stage.removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelEvent);
            mcCannedChat.removeEventListener(MouseEvent.MOUSE_OVER, onCannedChatOver);
            mcCannedChat.removeEventListener(MouseEvent.MOUSE_OUT, onCannedChatOut);
            t.removeEventListener(TimerEvent.TIMER, closeCannedChatTimer);
            windowTimer.removeEventListener(TimerEvent.TIMER, timedWindowHide);
            mci.bCannedChat.addEventListener(MouseEvent.CLICK, onCannedChatClick);
            mci.bsend.addEventListener(MouseEvent.CLICK, chat_btnSend);
            mci.tebg.addEventListener(MouseEvent.CLICK, chat_tebgClick);
            mci.bMinMax.addEventListener(MouseEvent.CLICK, bMinMaxClick);
            mci.bMinMax.addEventListener(MouseEvent.MOUSE_OVER, bMinMaxMouseOver);
            mci.bMinMax.addEventListener(MouseEvent.MOUSE_OUT, bMinMaxMouseOut);
            mci.bShortTall.addEventListener(MouseEvent.CLICK, bShortTallClick);
            mci.bShortTall.addEventListener(MouseEvent.MOUSE_OVER, bShortTallMouseOver);
            mci.bShortTall.addEventListener(MouseEvent.MOUSE_OUT, bShortTallMouseOut);
            rootClass.stage.addEventListener(KeyboardEvent.KEY_DOWN, rootClass.key_StageGame);
            mci.te.addEventListener(KeyboardEvent.KEY_DOWN, rootClass.key_ChatEntry);
            mci.te.addEventListener(Event.CHANGE, checkMsgType);
            rootClass.stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelEvent);
            rootClass.ui.mouseEnabled = false;
            mci.mouseEnabled = false;
            mci.t1.mouseEnabled = false;
            mci.addChild(mcCannedChat);
            mcCannedChat.addEventListener(MouseEvent.MOUSE_OVER, onCannedChatOver);
            mcCannedChat.addEventListener(MouseEvent.MOUSE_OUT, onCannedChatOut);
            mcCannedChat.y = (-(mcCannedChat.numChildren) * 23);
            mcCannedChat.visible = false;
            t.addEventListener(TimerEvent.TIMER, closeCannedChatTimer);
            windowTimer.addEventListener(TimerEvent.TIMER, timedWindowHide);
        }

        private function timedWindowHide(_arg1:Event):void{
            mci.t1.visible = false;
        }

        private function startWindowTimer():void{
            var _local1:MovieClip = mci.bMinMax;
            if (!mci.t1.visible){
            };
        }

        private function bMinMaxMouseOver(_arg1:MouseEvent){
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            if (!mci.t1.visible){
                rootClass.ui.ToolTip.openWith({str:"Show the chat pane"});
            }
            else {
                rootClass.ui.ToolTip.openWith({str:"Hide the chat pane"});
            };
        }

        private function bMinMaxMouseOut(_arg1:MouseEvent){
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            rootClass.closeToolTip();
        }

        private function bMinMaxClick(_arg1:MouseEvent):void{
            toggleChatPane();
        }

        public function toggleChatPane(_arg1:Boolean=true){
            var _local2:MovieClip = mci.bMinMax;
            trace(("toggleChatPane, visible: " + mci.t1.visible));
            if (!mci.t1.visible){
                mci.t1.visible = true;
                _local2.a1.visible = true;
                _local2.a2.visible = false;
				
				mode = 1;
				if (chn.zone.act){
					chn.cur = chn.zone;
					chn.lastPublic = chn.zone;
					mci.te.text = mci.te.text.substr((mci.te.text.split(" ")[0].substr(1).length + 2));
				};
                if (_arg1){
                    rootClass.ui.ToolTip.openWith({str:"Hide the chat pane"});
                };
            }
            else {
                mci.t1.visible = false;
                _local2.a1.visible = false;
                _local2.a2.visible = true;
                if (_arg1){
                    rootClass.ui.ToolTip.openWith({str:"Show the chat pane"});
                };
            };
			

        }

        private function bShortTallMouseOver(_arg1:MouseEvent){
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            if (mci.t1.y == t1Shorty){
                rootClass.ui.ToolTip.openWith({str:"Set the chat pane to full height"});
            }
            else {
                rootClass.ui.ToolTip.openWith({str:"Return the chat pane to normal height"});
            };
        }

        private function bShortTallMouseOut(_arg1:MouseEvent){
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            rootClass.closeToolTip();
        }

        public function bShortTallClick(_arg1:MouseEvent):void{
            var _local2:MovieClip = mci.bShortTall;
            if (mci.t1.y == t1Tally){
                mci.t1.y = t1Shorty;
                tfHeight = (tfHeight - tfdH);
                _local2.a1.visible = true;
                _local2.a2.visible = false;
                rootClass.ui.ToolTip.openWith({str:"Set the chat pane to full height"});
            }
            else {
                mci.t1.y = t1Tally;			
                tfHeight = (tfHeight + tfdH);
                _local2.a1.visible = false;
                _local2.a2.visible = true;
                rootClass.ui.ToolTip.openWith({str:"Return the chat pane to normal height"});
            };
            writeText(panelIndex, "");
        }

        private function onCannedChatClick(_arg1:MouseEvent):void{
            mcCannedChat.visible = !(mcCannedChat.visible);
        }

        public function closeCannedChat():void{
            mcCannedChat.visible = false;
        }

        private function initCannedChat(_arg1:XMLList):MovieClip{
            var _local7:XML;
            var _local8:*;
            var _local9:MovieClip;
            var _local2:MovieClip = new MovieClip();
            var _local3:Number = 0;
            var _local4:int;
            while (_local4 < _arg1.length()) {
                _local7 = _arg1[_local4];
                _local8 = new CannedOption();
                _local8.y = (_local4 * 23);
                _local8.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
                _local8.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
                _local8.txtChat.text = _local7.attribute("display").toString();
                if (_local8.txtChat.textWidth > _local3){
                    _local3 = _local8.txtChat.textWidth;
                };
                _local8.strMsg = _local7.attribute("text").toString();
                _local8.id = _local7.attribute("id").toString();
                _local2.addChild(_local8);
                if (_local7.children().length() > 0){
                    _local8.mcMoreOptions = initCannedChat(_local7.children());
                    _local8.addChild(_local8.mcMoreOptions);
                    _local8.mcMoreOptions.visible = false;
                }
                else {
                    _local8.mcMore.visible = false;
                    _local8.addEventListener(MouseEvent.CLICK, onMouseClick);
                };
                _local4++;
            };
            var _local5:int;
            while (_local5 < _local2.numChildren) {
                _local9 = MovieClip(_local2.getChildAt(_local5));
                _local9.txtChat.width = (_local3 + 6);
                _local9.bg.width = (_local3 + 20);
                _local9.mcMore.x = (_local9.bg.width - 10);
                if (_local9.mcMoreOptions != null){
                    _local9.mcMoreOptions.x = _local9.bg.width;
                };
                _local5++;
            };
            var _local6:BevelFilter = new BevelFilter(1, 45, 0, 1, 0, 1, 0, 0, 1, 3);
            _local2.filters = [_local6];
            return (_local2);
        }

        private function onRollOver(_arg1:MouseEvent){
            var _local3:*;
            var _local4:Point;
            var _local5:Point;
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.bg.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 25, 25, 25, 0);
            if (_arg1.currentTarget.mcMoreOptions != null){
                _arg1.currentTarget.mcMoreOptions.visible = true;
                _local3 = _arg1.currentTarget;
                _local4 = new Point(_local3.x, ((_local3.y + _local3.mcMoreOptions.y) + (_local3.mcMoreOptions.numChildren * 23)));
                _local5 = mcCannedChat.localToGlobal(_local4);
                if (_local5.y > 500){
                    _local3.mcMoreOptions.y = (_local3.mcMoreOptions.y - (_local5.y - 500));
                };
            };
        }

        private function onRollOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.bg.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
            if (_arg1.currentTarget.mcMoreOptions != null){
                _arg1.currentTarget.mcMoreOptions.visible = false;
            };
        }

        private function onMouseClick(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            if (_local2.id == "emote"){
                submitMsg(("/" + _local2.strMsg), "emote", rootClass.sfc.myUserName);
            }
            else {
                rootClass.sfc.sendXtMessage("zm", "cc", [_local2.id], "str", 1);
            };
            closeCannedChat();
        }

        private function onCannedChatOver(_arg1:MouseEvent){
            if (t != null){
                t.reset();
            };
        }

        private function onCannedChatOut(_arg1:MouseEvent){
            t.start();
        }

        private function closeCannedChatTimer(_arg1:TimerEvent){
            closeCannedChat();
        }

        public function getCCText(_arg1:String):String{
            var _local2:XML = getCCOption(_arg1, xmlCannedOptions.children());
            if (_local2 != null){
                return (_local2.attribute("text").toString());
            };
            return ("");
        }

        private function getCCOption(_arg1:String, _arg2:XMLList):XML{
            var _local4:XML;
            var _local5:XML;
            var _local3:int;
            while (_local3 < _arg2.length()) {
                _local4 = _arg2[_local3];
                if (_local4.children().length() == 0){
                    if (_local4.attribute("id").toString() == _arg1){
                        return (_local4);
                    };
                }
                else {
                    _local5 = getCCOption(_arg1, _local4.children());
                    if (_local5 != null){
                        return (_local5);
                    };
                };
                _local3++;
            };
            return (null);
        }

        private function chat_btnSend(_arg1:MouseEvent){
			var chatText = mci.te.htmlText;
			chatText = chatText.replace(regExpLinking1, "$1")
			chatText = chatText.replace(regExpLinking2, "$1")
			chatText = chatText.replace(regExpLinking3, '<A HREF="$1">$2</A>')
			
            submitMsg(chatText, chn.cur.typ, pmNm);
            rootClass.stage.focus = null;
        }

        private function chat_tebgClick(_arg1:MouseEvent){
            if (rootClass.stage.focus != mci.te){
                openMsgEntry();
            };
        }

        private function chat_linkHandler(_arg1:TextEvent){
            var _local2:String;
            var _local3:String;
            _local2 = String(_arg1.text.split(",")[0]);
            switch (_local2){
                case "openPMsg":
                    pmMode = 1;
                    _local3 = String(_arg1.text.split(",")[1]);
                    openPMsg(_local3);
                    return;
            };
        }

        function onMouseWheelEvent(_arg1:MouseEvent):void{
            var _local2:*;
            if (mci.t1.hitTestPoint(_arg1.stageX, _arg1.stageY)){
                _local2 = t1Arr.length;
                if (_arg1.delta > 0){
                    if (panelIndex > 0){
                        panelIndex--;
                    };
                }
                else {
                    if (panelIndex < (t1Arr.length - 1)){
                        panelIndex++;
                    };
                };
                writeText(panelIndex, "");
            };
        }

        function resetAreaChannels(){
            chn.zone.act = 0;
            chn.trade.act = 0;
        }

        public function mapChannels(_arg1){
            var _local3:*;
            resetAreaChannels();
            var _local2:* = 0;
            while (_local2 < _arg1.length) {
                _local3 = _arg1[_local2].split(",")[0].toString();
                if (_local3.indexOf("trade") > -1){
                    chn.trade.rid = rootClass.sfc.getRoom(_local3).getId();
                    chn.trade.act = 1;
                };
                _local2++;
            };
            chn.zone.act = 1;
        }

        function popBubble(_arg1, _arg2, _arg3){
            var _local4:* = null;
            var _local5:* = _arg1.split(":")[0];
            _arg1 = _arg1.substr(2);
            switch (_local5){
                case "u":
                    _local4 = rootClass.world.getMCByUserName(_arg1);
                    break;
            };
            if (_local4 != null){
                _local4.bubble.ti.autoSize = TextFieldAutoSize.CENTER;
                _local4.bubble.ti.wordWrap = true;
                _local4.bubble.ti.htmlText = _arg2;
                _local4.bubble.bg.width = int((_local4.bubble.ti.textWidth + 12));
                _local4.bubble.bg.height = int((_local4.bubble.ti.textHeight + 8));
                _local4.bubble.y = ((_local4.pname.y - _local4.bubble.bg.height) - 4);
                _local4.bubble.bg.x = (0 - (_local4.bubble.bg.width / 2));
                _local4.bubble.arrow.y = ((_local4.bubble.bg.y + _local4.bubble.bg.height) - 2);
                _local4.bubble.visible = true;
                _local4.bubble.alpha = 100;
                if (_local4.kv == null){
                    _local4.kv = new Killvis();
                    _local4.kv.kill(_local4.bubble, 3000);
                }
                else {
                    _local4.kv.resetkill();
                };
            };
        }

        private function getRoomType(_arg1){
            if (_arg1.indexOf("trade") > -1){
                return ("trade");
            };
            if (_arg1.indexOf("party") > -1){
                return ("party");
            };
            return ("zone");
        }

        public function formatMsgEntry(_arg1){
            mci.te.setSelection(0, 0);
            if (chn.cur != chn.whisper){
                if (chn.cur == chn.zone){
                    mci.tt.text = "";
                    mci.tt.visible = false;
                }
                else {
                    mci.tt.text = (chn.cur.tag + ": ");
                    mci.tt.visible = true;
                };
            }
            else {
                if ((((typeof(_arg1) == "undefined")) || ((_arg1 == "")))){
                    mci.tt.text = "";
                    mci.tt.visible = false;
                }
                else {
                    pmNm = _arg1;
                    mci.tt.text = (("To " + _arg1) + ": ");
                    mci.tt.visible = true;
                };
            };
        }

        public function updateMsgEntry(){
            mci.te.x = ((mci.tt.x + mci.tt.textWidth) + ((mci.tt.text.length) ? 1 : 0));
            mci.te.width = ((mci.bsend.x - mci.te.x) - 3);
            mci.te.textColor = "0xFFFFFF";
            mci.tt.textColor = "0xFFFFFF";
        }

        private function checkMsgType(_arg1:Event){
            var _local4:*;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local2:* = mci.te.text;
			
            var _local3:* = _local2.split(" ");
            if (_local3.length > 1){
                _local4 = _local3[0];
                _local5 = "";
                if (_local4.charAt(0) == "/"){
                    switch (_local4.substr(1)){
                        case "1":
                        case "s":
                        case "say":							
							switch (mode){
								case 3:
								case 4:
								case 5:
								case 6:
									if (mci2.btnAll != null){
										mci2.btnAll.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
									};
								break;
							}
							if (chn.zone.act){
								chn.cur = chn.zone;
								chn.lastPublic = chn.zone;
								mci.te.text = mci.te.text.substr((mci.te.text.split(" ")[0].substr(1).length + 2));
							};
							formatMsgEntry("");
							updateMsgEntry();
                            break;
                        case "p":
							switch (mode){
								case 3:
								case 5:
								case 6:
									if (mci2.btnParty != null){
										mci2.btnParty.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
									};
								break;
							}
							if (chn.party.act){
								chn.cur = chn.party;
								chn.lastPublic = chn.party;
								mci.te.text = mci.te.text.substr(3);
							};
							formatMsgEntry("");
							updateMsgEntry();
                            break;
                        case "r":
                            if (pmSourceA.length){
                                pmMode = 1;
                                chn.cur = chn.whisper;
                                mci.te.text = mci.te.text.substr(3);
                                formatMsgEntry(pmSourceA[0]);
                                updateMsgEntry();
                            };
                            break;
                        case "tell":
                        case "w":
                            if (_local3.length > 2){
                                pmMode = 1;
                                chn.cur = chn.whisper;
                                mci.te.text = mci.te.text.substr(((_local3[0].length + _local3[1].length) + 1));
                                formatMsgEntry(_local3[1]);
                                updateMsgEntry();
                            };
                            break;
                        case "c":
                            pmMode = 2;
                            chn.cur = chn.whisper;
                            mci.te.text = mci.te.text.substr(((_local3[0].length + _local3[1].length) + 1));
                            formatMsgEntry(pmSourceA[0]);
                            updateMsgEntry();
                            break;
                        case "g":
							switch (mode){
								case 3:
								case 4:
								case 6:
									if (mci2.btnGuild != null){
										mci2.btnGuild.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
									};
								break;
							}
                            if (chn.guild.act){
                                chn.cur = chn.guild;
                                chn.lastPublic = chn.guild;
                                mci.te.text = mci.te.text.substr(3);
                            };
                            formatMsgEntry("");
                            updateMsgEntry();
                            break;
						case "trade":
							switch (mode){
								case 2:
								case 3:
								case 4:
								case 5:
									if (mci2.btnTrade != null){
										mci2.btnTrade.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
									};
									break;
							}
							chn.cur = chn.trade;
							chn.lastPublic = chn.trade;
							mci.te.text = mci.te.text.substr(7);							
                            formatMsgEntry("");
                            updateMsgEntry();
                            break;
						case "world":
							switch (mode){
								case 2:
								case 4:
								case 5:
								case 6:
									if (mci2.btnWorld != null){
										mci2.btnWorld.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
									};
									break;
							}
							chn.cur = chn.world;
							chn.lastPublic = chn.world;
							mci.te.text = mci.te.text.substr(7);							
                            formatMsgEntry("");
                            updateMsgEntry();
                            break;
                    };
                };
                if (_local4.charAt(0) == ">"){
                    if (pmSourceA.length){
                        pmMode = 1;
                        chn.cur = chn.whisper;
                        mci.te.text = mci.te.text.substr(2);
                        formatMsgEntry(pmSourceA[0]);
                        updateMsgEntry();
                    };
                };
                _local6 = [];
                if ((((_local2.indexOf(" > ") > 1)) && ((((_local2.indexOf("<") == -1)) || ((_local2.indexOf(" > ") < _local2.indexOf("<"))))))){
                    _local7 = _local2.split(">");
                    while (_local7[0].charAt((_local7[0].length - 1)) == " ") {
                        _local7[0] = _local7[0].substr(0, (_local7[0].length - 1));
                    };
                    pmMode = 1;
                    chn.cur = chn.whisper;
                    mci.te.text = _local7[1];
                    formatMsgEntry(_local7[0]);
                    updateMsgEntry();
                };
            };
        }

        function openMsgEntry(){
            pmI = 0;
            myMsgsI = 0;
            mci.tebg.addEventListener(MouseEvent.CLICK, chat_tebgClick);
            mci.te.visible = true;
            mci.te.type = TextFieldType.INPUT;

            rootClass.stage.focus = null;
            rootClass.stage.focus = mci.te;
            formatMsgEntry(pmNm);
            updateMsgEntry();
        }

        function openPMsg(_arg1){
            pmNm = _arg1;
            chn.cur = chn.whisper;
            openMsgEntry();
        }

        function closeMsgEntry(){
            mci.tebg.addEventListener(MouseEvent.CLICK, chat_tebgClick);
            mci.te.text = "";
            mci.tt.text = "";
            mci.te.visible = false;
            mci.tt.visible = false;
            if (pmMode != 2){
                chn.cur = chn.lastPublic;
            };
            mci.te.type = TextFieldType.DYNAMIC;
            rootClass.stage.focus = null;
        }

        public function cleanStr(_arg1:String, _arg2:Boolean=true, _arg3:Boolean=false, _arg4:Boolean=false){			
            _arg1 = _arg1.split("&#").join("");
            if (!_arg4){
                _arg1 = _arg1.split("#038:").join("");
            }
            else {
                _arg1 = _arg1.split("#038:#").join("");
            };
            /*if (_arg3){
                _arg1 = removeHTML(_arg1);
            };*/
            if (_arg1.indexOf("%") > -1){
                _arg1 = _arg1.split("%").join("#037:");
            };

            if (((_arg2) && ((_arg1.indexOf("#037:") > -1)))){
                _arg1 = _arg1.split("#037:").join("%");
            };
			/*
            if (_arg1.indexOf("&") > -1){
                _arg1 = _arg1.split("&").join("#038:");
            };
            if (((_arg2) && ((_arg1.indexOf("#038:") > -1)))){
                _arg1 = _arg1.split("#038:").join("&");
            };
            if (_arg1.indexOf("<") > -1){
                _arg1 = _arg1.split("<").join("#060:");
            };
            if (((_arg2) && ((_arg1.indexOf("#060:") > -1)))){
                _arg1 = _arg1.split("#060:").join("&lt;");
            };
            if (_arg1.indexOf(">") > -1){
                _arg1 = _arg1.split(">").join("#062:");
            };
            if (((_arg2) && ((_arg1.indexOf("#062:") > -1)))){
                _arg1 = _arg1.split("#062:").join("&gt;");
            };
            /*if (_arg2){
                _arg1 = removeHTML(_arg1);
            };*/
            return (_arg1);
        }

        public function cleanChars(_arg1:String):String{
            _arg1 = _arg1.replace(regExpMod, "");
            var _local2:int;
            while (_local2 < _arg1.length) {
                if (legalChars.indexOf(_arg1.charAt(_local2)) < 0){
                    _arg1 = _arg1.replace(_arg1.charAt(_local2), "?");
                };
                _local2++;
            };
            return (_arg1);
        }

        public function strContains(_arg1:String, _arg2:Array):Boolean{
            var _local3:int;
            while (_local3 < _arg2.length) {
                if (_arg1.indexOf(_arg2[_local3]) > -1){
                    return (true);
                };
                _local3++;
            };
            return (false);
        }

        public function submitMsg(_arg1:String, _arg2, _arg3, _arg4:Boolean=false){
            var tuo:* = undefined;
            var uName:String;
            var rmId:int;
            var tuoNm:String;
            var parta:* = undefined;
            var partb:String;
            var i:int;
            var multiO:Object;
            var strPassword:* = undefined;
            var uoData:* = undefined;
            var modal:MovieClip;
            var modalO:* = undefined;
            var strA:String;
            var ei:int;
            var xtArr:* = undefined;
            var cmd:* = undefined;
            var params:* = undefined;
            var paramStr:* = undefined;
            var s:* = undefined;
            var bAch:* = undefined;
            var uVars:* = undefined;
            var avt:* = undefined;
            var guildName:String;
            var strMap:String;
            var m:uint;
            var emStr:* = undefined;
            var index:int;
            var myAvatar:Avatar;
            var profanityResult:Object;
            var iDiff:Number;
            var iHrs:int;
            var iMins:int;
            var msg:String = _arg1;
            var typ:* = _arg2;
            var unm:* = _arg3;
            var isMulti:Boolean = _arg4;
            msg = cleanChars(msg);
            var msgOK:Boolean = true;
            var warningModal:Boolean = true;
            var strEmail:String;
            if (Game.loginInfo.strPassword != null){
                strPassword = Game.loginInfo.strPassword.toLowerCase();
                if (msg.toLowerCase().indexOf(strPassword) > -1){
                    msgOK = false;
                };
            };
            if (((!((rootClass.world == null))) && (!((rootClass.world.myAvatar == null))))){
                if ((((rootClass.world.myAvatar.items == null)) || ((rootClass.world.myAvatar.items.length < 1)))){
                    msgOK = false;
                    warningModal = false;
                    pushMsg("warning", "Character is still being loaded, please wait a moment.", "SERVER", "", 0);
                };
                if (rootClass.world.myAvatar.objData != null){
                    uoData = rootClass.world.myAvatar.objData;
                    if (uoData.strEmail != null){
                        strEmail = uoData.strEmail.toLowerCase();
                    };
                    if (((!((strEmail == null))) && ((strEmail.length > 5)))){
                        if (msg.toLowerCase().indexOf(strEmail) > -1){
                            msgOK = false;
                        };
                    };
                };
            };
            if (((!(msgOK)) && (warningModal))){
                modal = new ModalMC();
                modalO = {};
                modalO.strBody = "Never give your password or email to anyone. Please note that Hidden Project staff will never ask for your password or email. We do not need that information to look up your account.";
                modalO.callback = null;
                modalO.btns = "mono";
                rootClass.ui.ModalStack.addChild(modal);
                modal.init(modalO);
                strA = "";
                ei = 0;
                if (strEmail != null){
                    if (msg.indexOf(strEmail) > -1){
                        ei = 0;
                        while (ei < strEmail.length) {
                            strA = (strA + (((ei)==0) ? strEmail.charAt(0) : "*"));
                            ei = (ei + 1);
                        };
                        msg = msg.split(strEmail).join(strA);
                    };
                };
                ei = 0;
                strA = "";
                if (msg.indexOf(strPassword) > -1){
                    ei = 0;
                    while (ei < strPassword.length) {
                        strA = (strA + (((ei)==0) ? strPassword.charAt(0) : "*"));
                        ei = (ei + 1);
                    };
                    msg = msg.split(strPassword).join(strA);
                };
                pushMsg("warning", msg, "SERVER", "", 0);
                closeMsgEntry();
                return;
            };
            i = 0;
            var str:* = rootClass.stripWhite(msg);
            if (str.length){
                myMsgs.push(msg);
                xtArr = [];
                cmd = "";
                if (msg.substr(0, 1) == "/"){
                    params = msg.substr(1).split(" ");
                    paramStr = params[0].toLowerCase();
                    switch (paramStr){
                        case "multi":
                            msg = ("/" + msg.substr(7));
                            submitMsg(msg, typ, unm, true);
                            return;
                        case "reload":
                            cmd = null;
                            if (rootClass.world.myAvatar.isStaff()){
                                rootClass.world.reloadCurrentMap();
                            };
                            break;
                        case "cell":
                            cmd = null;
                            if (rootClass.world.myAvatar.objData.intAccessLevel >= 40){
                                if (params.length > 1){
                                    parta = params[1];
                                }
                                else {
                                    parta = "none";
                                };
                                if (params.length > 2){
                                    partb = params[2];
                                }
                                else {
                                    partb = "none";
                                };
                                if (parta != "none"){
                                    rootClass.world.moveToCell(parta, partb);
                                };
                            };
                            break;
                        case "shop":
                            cmd = null;
                            if (rootClass.world.myAvatar.objData.intAccessLevel >= 40){
                                if (params.length > 1){
                                    parta = int(params[1]);
                                }
                                else {
                                    parta = 1;
                                };
                                rootClass.world.sendLoadShopRequest(parta);
                            };
                            break;
                        case "sound":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                if (params[1] == "off"){
                                    rootClass.mixer.bSoundOn = false;
                                }
                                else {
                                    if (params[1] == "on"){
                                        rootClass.mixer.bSoundOn = true;
                                    };
                                };
                            };
                            break;
                        case "ignore":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                if (tuoNm.toLowerCase() != rootClass.sfc.myUserName){
                                    cmd = "cmd";
                                    ignore(tuoNm);
                                    msg = ("You are now ignoring user " + tuoNm);
                                    pushMsg("server", msg, "SERVER", "", 0);
                                }
                                else {
                                    msg = "You cannot ignore yourself!";
                                    pushMsg("warning", msg, "SERVER", "", 0);
                                };
                            };
                            break;
                        case "unignore":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                cmd = "cmd";
                                unignore(tuoNm);
                                msg = (("User " + tuoNm) + " is no longer being ignored");
                                pushMsg("server", msg, "SERVER", "", 0);
                            };
                            break;
                        case "ignoreclear":
                            cmd = null;
                            ignoreList.data.users = new Array();
                            pushMsg("warning", "Ignore List Cleared!", "SERVER", "", 0);
                            rootClass.sfc.sendXtMessage("zm", "cmd", ["ignoreList", "$clearAll"], "str", 1);
                            break;
                        case "report":
                        case "reportlang":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                rootClass.ui.mcPopup.fOpen("Report", {unm:tuoNm});
                            };
                            break;
                        case "reporthack":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                parta = params.split(":")[0];
                                partb = params.split(":")[1];
                                tuoNm = parta.slice(1).join(" ");
                                cmd = "cmd";
                                xtArr.push("reporthack");
                                xtArr.push(tuoNm);
                                xtArr.push(partb);
                            };
                            break;
                        case "modon":
                        case "modoff":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            break;
                        case "getinfo":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                cmd = "cmd";
                                xtArr.push(params[0]);
                                xtArr.push(tuoNm);
                            };
                            break;
                        case "size":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                        case "getroomname":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                cmd = "cmd";
                                xtArr.push(params[0]);
                                xtArr.push(params[1]);
                            };
                            break;
                        case "event":
                            if (params.length > 2){
                                cmd = "cmd";
                                xtArr.push(params[0]);
                                xtArr.push(params[1]);
                                xtArr.push(params.slice(2).join(" "));
                            };
                            break;
                        case "tfer":
                            if (((((((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))) && (!((typeof(params[2]) == "undefined"))))) && ((params[2].length > 0)))){
                                cmd = "cmd";
                                xtArr.push(params[0]);
                                xtArr.push(params[1]);
                                xtArr.push(params[2]);
                            };
                            break;
                        case "guild":
                            rootClass.world.showGuildList();
                            break;
                        case "guildInvite":
                        case "gi":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                rootClass.world.guildInvite(tuoNm);
                            };
                            break;
                        case "guildremove":
                        case "gr":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                avt = rootClass.world.getAvatarByUserName(tuoNm);
                                if ((((rootClass.world.myAvatar.objData.guildRank >= 2)) || (avt.isMyAvatar))){
                                    modal = new ModalMC();
                                    modalO = {};
                                    modalO.strBody = (("Do you want to remove " + tuoNm) + " from the guild?");
                                    modalO.callback = rootClass.world.guildRemove;
                                    modalO.params = {userName:tuoNm};
                                    modalO.btns = "dual";
                                    rootClass.ui.ModalStack.addChild(modal);
                                    modal.init(modalO);
                                };
                            };
                            break;
                        case "guildPromote":
                        case "gp":
                            cmd = null;
                            if (rootClass.world.myAvatar.objData.guildRank >= 2){
                                if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                    tuoNm = params.slice(1).join(" ");
                                    rootClass.world.guildPromote(tuoNm);
                                };
                            };
                            break;
						case "guildSummon":
						case "gs":
                            cmd = null;
							if (rootClass.world.myAvatar.objData.guildRank >= 3){
								rootClass.world.sendGuildLeaderSummonInvite();
							};
                            break;
						case "gcl":
                            cmd = null;
							if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                avt = rootClass.world.getAvatarByUserName(tuoNm);
								if (rootClass.world.myAvatar.objData.guildRank >= 3){
                                //if ((((rootClass.world.myAvatar.objData.guildRank >= 3)) || (avt.isMyAvatar))){
                                    modal = new ModalMC();
                                    modalO = {};
                                    modalO.strBody = ("Are you sure to transfer guild leadership to " + tuoNm + "? Do you accept?");
                                    modalO.callback = rootClass.world.doGuildLeaderChangeAccept;
                                    modalO.params = {userName:tuoNm};
                                    modalO.btns = "dual";
                                    rootClass.ui.ModalStack.addChild(modal);
                                    modal.init(modalO);
									//pushMsg("server", ("Are you sure to transfer guild leadership to " + tuoNm + "? Do you accept?"), "SERVER", "", 0);
                                };
                            };
                            break;
                        case "guildDemote":
                        case "gd":
                            cmd = null;
                            if (rootClass.world.myAvatar.objData.guildRank >= 2){
                                if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                    tuoNm = params.slice(1).join(" ");
                                    rootClass.world.guildDemote(tuoNm);
                                };
                            };
                            break;
                        case "motd":
                            if (msg.length == 5){
                                if (rootClass.world.myAvatar.objData.guild != null){
                                    if (((!((rootClass.world.myAvatar.objData.guild.MOTD == null))) && (!((String(rootClass.world.myAvatar.objData.guild.MOTD) == "undefined"))))){
                                        pushMsg("guild", ("Message of the day: " + String(rootClass.world.myAvatar.objData.guild.MOTD)), "SERVER", "", 0);
                                    }
                                    else {
                                        pushMsg("guild", "No Message of the day has been set.", "SERVER", "", 0);
                                    };
                                };
                            }
                            else {
                                rootClass.world.setGuildMOTD(msg.substr(5));
                            };
                            break;
                        case "gc":
                        case "guildcreate":
                            if (rootClass.world.myAvatar.isUpgraded()){
                                if (params[1].length > 0){
                                    guildName = params[1];
                                    i = 2;
                                    while (i < params.length) {
                                        guildName = ((guildName + " ") + params[i]);
                                        i = (i + 1);
                                    };
                                    if (guildName.length <= 25){
                                        modal = new ModalMC();
                                        modalO = {};
                                        modalO.strBody = (("Do you want to create the guild " + guildName) + "?");
                                        modalO.callback = rootClass.world.createGuild;
                                        modalO.params = {guildName:guildName};
                                        modalO.btns = "dual";
                                        rootClass.ui.ModalStack.addChild(modal);
                                        modal.init(modalO);
                                    }
                                    else {
                                        pushMsg("server", "Guild names must be 25 characters or less.", "SERVER", "", 0);
                                    };
                                }
                                else {
                                    pushMsg("server", "Please specify a name for your guild.", "SERVER", "", 0);
                                };
                            }
                            else {
                                pushMsg("server", "Only VIP's may create guilds.", "SERVER", "", 0);
                            };
                            break;
                        case "renameGuild":
                        case "rg":
                            if (rootClass.world.myAvatar.objData.guildRank == 3){
                                if (rootClass.world.myAvatar.objData.intCoins >= 1000){
                                    if (params[1].length > 0){
                                        guildName = params[1];
                                        i = 2;
                                        while (i < params.length) {
                                            guildName = ((String(guildName) + " ") + String(params[i]));
                                            i = (i + 1);
                                        };
                                        if (guildName.length <= 25){
                                            modal = new ModalMC();
                                            modalO = {};
                                            modalO.strBody = (("Do you want to rename the guild to " + guildName) + "? This will cost 1000 RCs.");
                                            modalO.callback = rootClass.world.renameGuild;
                                            modalO.params = {guildName:guildName};
                                            modalO.btns = "dual";
                                            rootClass.ui.ModalStack.addChild(modal);
                                            modal.init(modalO);
                                        }
                                        else {
                                            pushMsg("server", "Guild names must be 25 characters or less.", "SERVER", "", 0);
                                        };
                                    }
                                    else {
                                        pushMsg("server", "Please specify a name for your guild.", "SERVER", "", 0);
                                    };
                                }
                                else {
                                    pushMsg("server", "You do not have enough RCs.", "SERVER", "", 0);
                                };
                            };
                            break;
                        case "addquest":
                        case "removequest":
                        case "forcestart":
                        case "forcestop":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                try {
                                    rootClass.sfc.sendXtMessage("zm", "dynamic", [paramStr, params[1], params[2]], "str", 1);
                                }
                                catch(e) {
                                    rootClass.sfc.sendXtMessage("zm", "dynamic", [paramStr, params[1]], "str", 1);
                                };
                            };
                            break;
                        case "guildreset":
                            rootClass.sfc.sendXtMessage("zm", "guild", ["guildreset"], "str", 1);
                            break;
                        case "yuki":
                            rmId = chn.cur.rid;
                            cmd = "message";
                            msg = cleanStr(msg, false, true);
                            xtArr.push(msg.substring((msg.indexOf("//yuki ") + 6), msg.length));
                            xtArr.push(chn.cur.str);
                            xtArr.push("yuki");
                            break;
                        case "ginv":
                            cmd = null;
                            s = String(params[1]);
                            i = 2;
                            while (i < params.length) {
                                s = ((s + " ") + String(params[i]));
                                i = (i + 1);
                            };
                            rootClass.sfc.sendXtMessage("zm", "guild", ["gInv", s], "str", 1);
                            break;
                        case "invite":
                        case "pi":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                if ((((rootClass.world.partyMembers.length < 4)) || (!(rootClass.world.isPartyMember(tuoNm))))){
                                    rootClass.world.partyInvite(tuoNm);
                                };
                            };
                            break;
                        case "ps":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                rootClass.world.partySummon(tuoNm);
                            };
                            break;
                        case "pk":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                rootClass.world.doPartyKick(tuoNm);
                            };
                            break;
                        case "duel":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                rootClass.world.sendDuelInvite(tuoNm);
                            };
                            break;
						case "gw":
                            cmd = null;
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                rootClass.world.sendGuildWarInvite(tuoNm);
                            };
                            break;
                        case "friends":
                            cmd = null;
                            rootClass.world.showFriendsList();
                            break;
                        case "friend":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                tuoNm = params.slice(1).join(" ");
                                if (tuoNm.toLowerCase() != rootClass.sfc.myUserName){
                                    rootClass.world.requestFriend(tuoNm);
                                };
                            };
                            break;
                        case "modban":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                cmd = "cmd";
                                tuoNm = params.slice(1).join(" ");
                                xtArr.push(params[0]);
                                xtArr.push(tuoNm);
                                xtArr.push(24);
                            };
                            break;
						case "wipe":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                cmd = "cmd";
                                tuoNm = params.slice(1).join(" ");
                                xtArr.push(params[0]);
                                xtArr.push(tuoNm);
                                xtArr.push(24);
                            };
                            break;
                        case "join":
                            if (((((((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))) && (!((rootClass.world.uoTree[rootClass.sfc.myUserName.toLowerCase()].intState == 0))))) && (rootClass.world.coolDown("tfer")))){
								rootClass.world.returnInfo = null;
                                cmd = "cmd";
                                uName = rootClass.sfc.myUserName;
                                strMap = params[1];
                                if (params.length > 2){
                                    m = 2;
                                    while (m < params.length) {
                                        strMap = ((strMap + " ") + params[m]);
                                        m = (m + 1);
                                    };
                                };
								pushMsg("server", "Teleporting to " + strMap + ".", "SERVER", "", 0);
								var xtJoin:Array = new Array();
								
								xtJoin.push("tfer");
								xtJoin.push(rootClass.sfc.myUserName);
								xtJoin.push(strMap);
								
								castJoin(xtJoin);
                            }
                            break;
                        case "roomid":
                            cmd = "cmd";
                            xtArr.push("roomID");
                            xtArr.push(rootClass.sfc.myUserName);
                            xtArr.push(params[1]);
                            break;
                        case "house":
                            cmd = null;
                            if (params[1] == null){
                                tuoNm = rootClass.sfc.myUserName;
                            }
                            else {
                                tuoNm = params.slice(1).join(" ");
                            };
							pushMsg("server", "Joining " + tuoNm + "'s House.", "SERVER", "", 0);
                            rootClass.world.gotoHouse(tuoNm);
                            break;
                        case "kick":
                        case "ipkick":
                        case "ipunmute":
                        case "unmute":
                        case "freeze":
                        case "unfreeze":
                        case "watch":
                        case "unwatch":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                cmd = "cmd";
                                tuoNm = params.slice(1).join(" ");
                                xtArr.push(params[0]);
                                xtArr.push(tuoNm);
                            };
                            break;
                        case "mute":
                        case "ban":
                        case "ipmute":
                            if (((((rootClass.world.myAvatar.isStaff()) && (!((typeof(params[1]) == "undefined"))))) && ((params[1].length > 0)))){
                                cmd = "cmd";
                                tuoNm = params.slice(2).join(" ");
                                xtArr.push(params[0]);
                                xtArr.push(params[1]);
                                xtArr.push(tuoNm);
                            };
                            break;
                        case "goto":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0))) && (rootClass.world.coolDown("tfer"))){
                                cmd = null;
                                rootClass.world.goto(params.slice(1).join(" "));
								strGotoName = params[1];
                            };
								pushMsg("server", "Teleporting to user " + strGotoName +".", "SERVER", "", 0);
								var xtGoto:Array = new Array();
								
								xtGoto.push("tfer");
								xtGoto.push(rootClass.sfc.myUserName);
								xtGoto.push(strMap);
								
								castGoto(xtGoto);
                            break;
                        case "pull":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                cmd = null;
                                rootClass.world.pull(params.slice(1).join(" "));
                            };
                            break;
                        case "clear":
                        case "bonus":
                        case "boost":
                            if (params.length > 1){
                                cmd = "cmd";
                                i = 0;
                                while (i < params.length) {
                                    xtArr.push(params[i]);
                                    i = (i + 1);
                                };
                            };
                            break;
                        case "frostreset":
                            cmd = "cmd";
                            xtArr.push("frostreset");
                            break;
                        case "queue":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            break;
                        case "killmap":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                cmd = "cmd";
                                xtArr.push(params[0]);
                                xtArr.push(params[1]);
                            };
                            break;
                        case "item":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                cmd = "cmd";
                                xtArr.push(params[0]);
                                xtArr.push(params[1]);
                                xtArr.push(params[2]);
                            };
                            break;
                        case "combat":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            xtArr.push(params[1]);
                            break;
                        case "addrep":
                        case "addxp":
                        case "addv":
                        case "hp":
                        case "level":
                        case "getevents":
                        case "getevent":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                cmd = "cmd";
                                xtArr.push(params[0]);
                                xtArr.push(params[1]);
                            };
                            break;
                        case "datadump":
                        case "monitor":
                        case "resetevents":
                        case "resetlogins":
                        case "resetgrove":
                        case "resettimes":
                        case "getlogins":
                        case "gettimes":
                        case "clock":
                        case "whitelist":
                            cmd = "cmd";
                            i = 0;
                            while (i < params.length) {
                                xtArr.push(params[i]);
                                i = (i + 1);
                            };
                            break;
                        case "getbreakdown":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            break;
                        case "adminyell":
                        case "iay":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                cmd = "cmd";
                                xtArr.push(params[0]);
                                msg = params.slice(1).join(" ");
                                msg = cleanStr(msg, false, true);
                                xtArr.push(msg);
                            };
                            break;
                        case "iteratortest":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            break;
                        case "fps":
                            cmd = null;
                            if (rootClass.world.myAvatar.objData.intAccessLevel >= 40){
                                rootClass.world.toggleFPS();
                            };
                            break;
						case "acp":
                            cmd = null;
                            if (rootClass.world.myAvatar.objData.intAccessLevel >= 60){
                                rootClass.world.toggleModPanelasCharkey();
                            };
                            break;
						//Stats
						case "stats":
							//if (rootClass.world.myAvatar.objData.intAccessLevel >= 40){
								rootClass.world.toggleStatUp();
							//};
							break;
                        case "mod":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            break;
                        case "pmoff":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            xtArr.push(msg.substr(7));
                            break;
                        case "pmon":
                        case "partyon":
                        case "partyoff":
                        case "chaton":
                        case "chatoff":
                        case "friendon":
                        case "friendoff":
                        case "waron":
                        case "waroff":
                        case "kickall":
                        case "restart":
                        case "restartnow":
                        case "shutdown":
                        case "shutdownnow":
                        case "empty":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            break;
                        case "roll":
                            cmd = "util";
                            xtArr.push(params[0]);
                            break;
                        case "geta":
                            if (((rootClass.world.myAvatar.isStaff()) && ((params.length == 3)))){
                                pushMsg("warning", ((((("geta " + params[1]) + ",") + params[2]) + ": ") + rootClass.world.getAchievement(params[1], params[2])), "SERVER", "", 0);
                            };
                            break;
                        case "seta":
                            if (((rootClass.world.myAvatar.isStaff()) && ((params.length == 4)))){
                                rootClass.world.setAchievement(params[1], params[2], params[3]);
                            };
                            break;
                        case "queststring":
                            if (rootClass.world.myAvatar.isStaff()){
                                rootClass.world.loadQuestStringData();
                                cmd = "cmd";
                                i = 0;
                                while (i < params.length) {
                                    xtArr.push(params[i]);
                                    i = (i + 1);
                                };
                            };
                            break;
                        case "e":
                        case "me":
                        case "em":
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                emStr = params.slice(1).join(" ");
                                emStr = cleanStr(emStr, false, false);
                                rmId = chn.cur.rid;
                                cmd = "em";
                                xtArr.push(emStr);
                                xtArr.push(chn.event.str);
                            };
                            break;
                        case "who":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                xtArr.push(params[1]);
                            };
                            break;
						case "queuecount":
                            cmd = "cmd";
                            xtArr.push(params[0]);
                            if (((!((typeof(params[1]) == "undefined"))) && ((params[1].length > 0)))){
                                xtArr.push(params[1]);
                            };
                            break;
                        case "afk":
                            cmd = null;
                            rootClass.world.afkToggle();
                            break;
                        case "rest":
                            rootClass.world.rest();
                            break;
                        case "repairavatars":
                            cmd = null;
                            rootClass.world.repairAvatars();
                            break;
						/*
                        case "samba":
                            bAch = rootClass.world.getAchievement("ia0", 11);
                            if (!bAch){
                                pushMsg("warning", "You must learn this dance from Samba in Bloodtusk Ravine.", "SERVER", "", 0);
                                break;
                            };
						*/
                            if (!rootClass.world.myAvatar.isUpgraded()){
                                pushMsg("warning", "Requires VIP to use this emote.", "SERVER", "", 0);
                                break;
                            };
						case "castmagic":
						case "headscratch":
						case "shock":
						case "gangnam":
							questVal = rootClass.world.getQuestValue(94);
							if (questVal < 6){
								pushMsg("warning", "You must learn this emote in Yuno.", "SERVER", "", 0);
								break;
                            };
                        case "danceweapon":
						case "rangeattack2":
						case "gunattack1":
						case "gunattack2":
						case "firewings":
						case "firejump":
                        case "useweapon":
                        case "powerup":
                        case "kneel":
                        case "jumpcheer":
                        case "salute2":
                        case "cry2":
                        case "spar":
                        case "stepdance":
                        case "headbang":
                        case "dazed":
                            if (!rootClass.world.myAvatar.isUpgraded()){
                                pushMsg("warning", "Requires VIP to use this emote.", "SERVER", "", 0);
                                break;
                            };
						case "dab":
						case "samba":
                        case "dance":
                        case "laugh":
                        case "lol":
                        case "point":
                        case "use":
                        case "fart":
                        case "backflip":
                        case "sleep":
                        case "jump":
                        case "punt":
						case "casting":
						case "fishing":
						case "mining":
                        case "dance2":
                        case "swordplay":
                        case "feign":
                        case "wave":
                        case "bow":
                        case "cry":
                        case "unsheath":
                        case "cheer":
                        case "stern":
                        case "salute":
                        case "airguitar":
                        case "facepalm":
                            uVars = {};
                            cmd = (uVars.typ = "emotea");
                            uVars.strEmote = paramStr;
                            if (uVars.strEmote == "lol"){
                                uVars.strEmote = "laugh";
                            };
                            uVars.strChar = params[1];
                            break;
                        default:
                            if ((((unm == "iterator")) || (rootClass.world.myAvatar.isStaff()))){
                                cmd = "cmd";
                                index = 0;
                                while (index < params.length) {
                                    xtArr.push(params[index]);
                                    index = (index + 1);
                                };
                            };
                    };
                }
                else {
                    if (typ != "whisper"){
                        rmId = chn.cur.rid;						
                        cmd = "message";
                        msg = cleanStr(msg, false, true);
                        xtArr.push(msg);
                        xtArr.push(chn.cur.str);
                    }
                    else {
                        rmId = 1;
                        cmd = "whisper";
                        msg = cleanStr(msg, false, true);
                        xtArr.push(msg);
                        xtArr.push(unm);
                    };
                };
                if (cmd == "emotea"){
                    rootClass.world.myAvatar.pMC.mcChar.gotoAndPlay(rootClass.strToProperCase(uVars.strEmote));
                    rootClass.sfc.sendXtMessage("zm", cmd, [uVars.strEmote], "str", 1);
                }
                else {
                    if ((((cmd == "mod")) || ((cmd == "cmd")))){
                        if (xtArr.length){
                            rootClass.sfc.sendXtMessage("zm", cmd, xtArr, "str", 1);
                            if (isMulti){
                                trace("** submitMsg multi ");
                                for each (multiO in rootClass.sfcA) {
                                    trace(("    > " + multiO.sIP));
                                    multiO.sfc.sendXtMessage("zm", cmd, xtArr, "str", 1);
                                };
                            };
                        };
                    }
                    else {
                        if (cmd != "simple"){
                            if (!(((cmd == null)) || ((xtArr.length < 1)))){
                                if (!rootClass.serialCmdMode){
                                    rootClass.world.afkPostpone();
                                    myAvatar = rootClass.world.myAvatar;
                                    profanityResult = {};
                                    profanityResult = profanityCheck(cleanStr(msg));
                                    if (iChat == 0){
                                        pushMsg("warning", "This server only allows canned chat.", "SERVER", "", 0);
                                    }
                                    else {
                                                if (myAvatar.objData.bPermaMute == 1){
                                                    pushMsg("warning", "You are mute! Chat privileges have been permanently revoked.", "SERVER", "", 0);
                                                }
                                                else {
                                                    if (((!((myAvatar.objData.dMutedTill == null))) && ((myAvatar.objData.dMutedTill.getTime() > rootClass.date_server.getTime())))){
                                                        iDiff = ((myAvatar.objData.dMutedTill.getTime() - rootClass.date_server.getTime()) / 1000);
                                                        iHrs = (iDiff / (60 * 60));
                                                        iMins = ((iDiff - ((iHrs * 60) * 60)) / 60);
                                                        pushMsg("warning", (((("You are mute! Chat privileges have been revoked for next " + iHrs) + " h ") + iMins) + " m!"), "SERVER", "", 0);
                                                    }
                                                    else {
                                                        if (amIMute()){
                                                            pushMsg("warning", "You are mute! Chat privileges have been temporarily revoked.", "SERVER", "", 0);
                                                        }
                                                        else {
                                                            if (profanityResult.code == 1){
                                                                pushMsg("warning", (("Do not use inappropriate language such as '" + profanityResult.term) + "'."), "SERVER", "", 0);
                                                                rootClass.world.selfMute(2);
                                                            }
                                                            else {
                                                                if (profanityResult.code == 2){
                                                                    pushMsg("warning", (("Please do not use inappropriate language such as '" + profanityResult.term) + "'."), "SERVER", "", 0);
                                                                }
                                                                else {
                                                                    if (isUnsendable(msg)){
                                                                        pushMsg("warning", "Please do not send messages that may contain private information, such as an email address.", "SERVER", "", 0);
                                                                    }
                                                                    else {
                                                                        if (xtArr[0].length > 0){
                                                                            rootClass.sfc.sendXtMessage("zm", cmd, xtArr, "str", rmId);
                                                                        };
                                                                    };
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                    };
                                }
                                else {
                                    rootClass.sfc.sendXtMessage("zm", cmd, xtArr, "str", rmId);
                                    if (isMulti){
                                        trace("** submitMsg multi ");
                                        for each (multiO in rootClass.sfcA) {
                                            trace(("    > " + multiO.sIP));
                                            try {
                                                if (multiO.sfc.isConnected){
                                                    multiO.sfc.sendXtMessage("zm", cmd, xtArr, "str", -1);
                                                };
                                            }
                                            catch(e:Error) {
                                                trace(((("MULTI error on handler for " + multiO.sIP) + " >> ") + e));
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if (!rootClass.serialCmdMode){
                closeMsgEntry();
            };
			
			
        }

        private function checkFieldsVPos(){
            var _local1:* = mci.t1;
            _local1.resetVPos = 0;
            if (panelIndex == (t1Arr.length - 1)){
                _local1.resetVPos = 1;
            };
        }

        private function setFieldsVPos(){
            var _local1:* = mci.t1;
            if (_local1.resetVPos){
                panelIndex = (t1Arr.length - 1);
            };
            panelIndex = Math.min(panelIndex, (t1Arr.length - 1));
        }

        private function html2Fields(_arg1, _arg2, _arg3, _arg4){
            var _local5:* = mci.t1;
            switch (_arg2){
                case "=":
                default:
                    t1Arr = [{
                        s:_arg1,
                        id:_arg4
                    }];
                    return;
                case "+=":
                    t1Arr.push({
                        s:_arg1,
                        id:_arg4
                    });
            };
        }

        public function writeText(_arg1:int, channel:String):void{
            var _local2:DisplayObject;
            var _local3:MovieClip;
            var _local6:int;
            var _local4:* = true;
            var _local5:Array = [];
            var _local7:int;
            var _local8:int;
            _local7 = (t1Arr.length - 1);
            while (_local7 > -1) {
                if ((((_local7 <= _arg1)) && (_local4))){
                    _local8 = t1Arr[_local7].id;
                    tl.ti.htmlText = t1Arr[_local7].s;
                    formatWithoutTextLinks(tl.ti);
                    _local6 = checkPos(tl, _local7, _local8, _arg1);
                    if (_local6 <= 0){
                        _local4 = false;
                    }
                    else {
                        _local5.push(_local8);
                        if (drawnA.indexOf(_local8) > -1){
                            _local2 = getBitmapByIndex(_local8, mci.t1);
                        }
                        else {
                            _local2 = buildTextLinks(tl.ti, t1Arr[_local7].s, mci.t1, drawnA, _local8, channel);
                        };
                        _local2.y = _local6;
                        MovieClip(_local2).mouseEnabled = false;
                    };
                };
                _local7--;
            };
            _local7 = 0;
            while (_local7 < drawnA.length) {
                if (_local5.indexOf(drawnA[_local7]) < 0){
                    _local2 = getBitmapByIndex(drawnA[_local7], mci.t1);
                    if (_local2 != null){
                        mci.t1.removeChild(_local2);
                        drawnA.splice(_local7, 1);
                        _local7--;
                    };
                };
                _local7++;
            };
		}
		
		public function joinCallback(_arg1):void{
            trace(_arg1.str);
		
        }
		
		public function gotoCallback(_arg1):void{
            trace(_arg1.str);
		
        }
		
		public function castJoin(xtArr:Array): void {
			submitMsg("/casting", "emotea", rootClass.sfc.myUserName);
			
			var xtObj:* = {};
			
			xtObj.cmd = "cmd";
			xtObj.args = xtArr;
			
			var castObj:* = {};
			castObj.typ = "generic";
			castObj.callback = this.joinCallback;
			castObj.args = {str:"Cast Complete"};
			castObj.dur = 1.5;
			castObj.txt = "Teleporting...";
			castObj.xtObj = xtObj;
			rootClass.ui.mcCastBar.fOpenWith(castObj);
			
        }
		
		public function castGoto(xtArr:Array): void {
			submitMsg("/casting", "emotea", rootClass.sfc.myUserName);
			
			var xtObj:* = {};
			
			xtObj.cmd = "cmd";
			xtObj.args = xtArr;
			
			var castingGoto:* = {};
			castingGoto.typ = "generic";
			castingGoto.callback = this.gotoCallback;
			castingGoto.args = {str:"Cast Complete"};
			castingGoto.dur = 0.5;
			castingGoto.txt = "Teleporting...";
			castingGoto.xtObj = xtObj;
			rootClass.ui.mcCastBar.fOpenWith(castingGoto);
			
        }

        private function formatWithoutTextLinks(_arg1:TextField):void{
            var _local7:String;
            var _local8:String;
            var _local9:String;
            var _local10:String;
            var _local11:Array;
            var _local12:String;
            var _local13:String;
            var _local14:int;
            var _local15:String;
            var _local16:String;
            var _local2 = "$({";
            var _local3 = "})$";
            var _local4:* = '<font color="#';
            var _local5:* = '">';
            var _local6:* = "</font>";
            while ((((_arg1.htmlText.indexOf(_local2) > -1)) && ((_arg1.htmlText.indexOf(_local3) > -1)))) {
                _local7 = _arg1.htmlText;
                _local8 = _local7.substr(0, _local7.indexOf(_local2));
                _local9 = _local7.substr((_local7.indexOf(_local3) + _local3.length));
                _local10 = _local7.substr((_local7.indexOf(_local2) + _local2.length));
                _local11 = _local10.substr(0, _local10.indexOf(_local3)).split(",");
                _local12 = _local11[0];
                _local13 = _local11[1];
                _local14 = _arg1.text.indexOf(_local2);
                switch (_local12){
                    case "url":
                        _local16 = _local13;
                        _local15 = ((((((_local4 + "FFFF99") + _local5) + "<u>") + _local16) + "</u>") + _local6);
                        break;
                    case "user":
                        _local16 = _local13;
                        _local15 = ((((_local4 + "FFFFFF") + _local5) + _local16) + _local6);
                        break;
                    case "item":
                    case "quest":
                        _local16 = (("[" + _local13) + "]");
                        _local15 = ((((_local4 + "00CCFF") + _local5) + _local16) + _local6);
                        break;
                };
                _arg1.htmlText = ((_local8 + _local15) + _local9);
            };
        }

        private function buildTextLinks(_arg1:TextField, _arg2:String, _arg3:MovieClip, _arg4:Array, _arg5:int, channel:String):DisplayObject{
		
            var _local13:String;
            var _local14:String;
            var _local15:String;
            var _local16:String;
            var _local17:Array;
            var _local18:String;
            var _local19:String;
            var _local20:int;
            var _local21:String;
            var _local22:String;
            var _local23:Object;
            var _local24:*;
            var _local25:*;
            var _local26:int;
            var _local27:int;
            var _local28:int;
            var _local29:*;
            var _local30:Rectangle;
            var _local31:Rectangle;
            var _local32:MovieClip;
            var _local33:*;
            var _local34:String;
            var _local6:MovieClip = new MovieClip();
            _local6.name = ("b" + _arg5);
            var _local7 = "$({";
            var _local8 = "})$";
            var _local9:* = '<font color="#';
            var _local10:* = '">';
            var _local11:* = "</font>";
            _arg1.htmlText = _arg2;
            while ((((_arg1.htmlText.indexOf(_local7) > -1)) && ((_arg1.htmlText.indexOf(_local8) > -1)))) {
                _local13 = _arg1.htmlText;
                _local14 = _local13.substr(0, _local13.indexOf(_local7));
                _local15 = _local13.substr((_local13.indexOf(_local8) + _local8.length));
                _local16 = _local13.substr((_local13.indexOf(_local7) + _local7.length));
                _local17 = _local16.substr(0, _local16.indexOf(_local8)).split(",");
                _local18 = _local17[0];
                _local19 = _local17[1];
                _local19 = _local19.split("&amp;").join("&");
                _local20 = _arg1.text.indexOf(_local7);
                _local23 = {};
                switch (_local18){
                    case "url":
                        _local22 = _local19;
                        _local21 = ((((((_local9 + "FFFF99") + _local10) + "<u>") + _local22) + "</u>") + _local11);
                        _local23.callback = urlClick;
                        break;
                    case "user":
                        _local22 = _local19;
                        _local21 = ((((_local9 + "FFFFFF") + _local10) + _local22) + _local11);
                        _local23.callback = pMClick;
                        break;
                    case "item":						
                        _local22 = _local19;
                        _local21 = ((((((_local9 + "FFFF99") + _local10) + "&lt;") + _local22) + "&gt;") + _local11);
						_local22 = "<" +_local19+ ">";
						_local22 = _local22.replace(/&apos;/g, "'");
						
						_local19 = _local17[2];
                        _local23.callback = linkClick;
                        break;
                    case "quest":
                        _local23.sName = _local17[1];
                        _local23.QuestID = _local17[2];
                        _local23.iLvl = _local17[3];
                        _local23.unm = _local17[4];
                        _local22 = (("[" + _local19) + "]");
                        _local21 = ((((_local9 + "00CCFF") + _local10) + _local22) + _local11);
                        _local23.callback = rootClass.world.doCTAClick;
                        break;
                };
                _arg1.htmlText = ((_local14 + _local21) + _local15);
                _local24 = _local20;
                _local25 = ((_local20 + _local22.length) - 1);
                _local26 = _arg1.getLineIndexOfChar(_local24);
                _local27 = _arg1.getLineIndexOfChar(_local25);
                _local28 = _local26;
                while (_local28 <= _local27) {
                    if (_local28 == _local26){
                        _local29 = _arg1.getCharBoundaries(_local24);
                    }
                    else {
                        _local29 = _arg1.getCharBoundaries(_arg1.getLineOffset(_local28));
                    };
                    if (_local28 == _local27){
                        _local30 = _arg1.getCharBoundaries(_local25);
                    }
                    else {
                        _local30 = _arg1.getCharBoundaries((_arg1.getLineOffset((_local28 + 1)) - 1));
                    };
                    _local31 = new Rectangle(_local29.x, _local29.y, ((_local30.x - _local29.x) + _local30.width), ((_local30.y - _local29.y) + _local30.height));
                    _local32 = new MovieClip();
                    _local32.graphics.beginFill(52479);
                    _local32.graphics.drawRect(0, 0, _local31.width, _local31.height);
                    _local32.graphics.endFill();
                    _local33 = _local6.addChild(_local32);
                    _local33.alpha = 0;
                    _local33.x = (_arg1.x + _local29.x);
                    _local33.y = (_arg1.y + _local29.y);
                    for (_local34 in _local23) {
                        if (_local34 != "callback"){
                            _local33[_local34] = _local23[_local34];
                        };
                    };
                    _local33.str = _local19;
                    _local33.buttonMode = true;
                    _local33.addEventListener(MouseEvent.CLICK, _local23.callback, false, 0, true);
                    _local28++;
                };
            };
            var _local12:* = new uiTextLine();
            _local12.ti.htmlText = tl.ti.htmlText;
            _local12.ti.autoSize = "left";
            _local12.ti.multiline = true;
            //_local12.ti.visible = false;
            MovieClip(_local12).mouseEnabled = false;
            MovieClip(_local12).mouseChildren = false;
			//default
			_local12.name = "general";
			/*
			switch (mode){
                case 1:
					_local12.name = "general";
					//_local12.visible = false;
					break;
				case 2:
					_local12.name = "zone";
					//_local12.visible = false;
					break;
				case 3:
					_local12.name = "world";
					//_local12.visible = false;
					break;
				case 4:
					_local12.name = "party";
					//_local12.visible = false;
					break;
				case 5:
					_local12.name = "guild";
					//_local12.visible = false;
					break;
				case 6:
					_local12.name = "trade";
					//_local12.visible = false;
					break;
			};
			*/
            if (_local6.numChildren > 0){
                _local6.swapChildren(_local6.getChildAt(0), _local6.addChildAt(_local12, 0));
            }
            else {
                _local6.addChild(_local12);
            };
            _arg4.push(_arg5);
            return (_arg3.addChild(_local6));
        }

        private function checkPos(_arg1:MovieClip, _arg2:int, _arg3:int, _arg4:int):int{
            var _local5:DisplayObject = getBitmapByIndex((_arg3 + 1), mci.t1);
            if (((!((_local5 == null))) && ((_arg2 < _arg4)))){
                return (((_local5.y - _arg1.height) + 2));
            };
            return (Math.round((tfHeight - _arg1.height)));
        }

        private function pMClick(_arg1:MouseEvent):void{
            var _local2:*;
            if (_arg1.shiftKey){
                _local2 = (_arg1.currentTarget as MovieClip);
                openPMsg(_local2.str);
            }
            else {
                rootClass.world.onWalkClick();
            };
        }

        private function urlClick(_arg1:MouseEvent):void{
            var _local2:* = (_arg1.currentTarget as MovieClip);
            navigateToURL(new URLRequest(_local2.str), "_blank");
        }

		private function linkClick(_arg1:MouseEvent):void{
            var _local2:* = (_arg1.currentTarget as MovieClip);
			var itemId = _local2.str.split("loadItem:")[1];
			if (rootClass.world.linkTree[itemId] != null) {

				if (rootClass.ui.mcPopup.currentLabel == "ItemPreview"){
					MovieClip(rootClass.ui.mcPopup.getChildByName("mcPreview")).fClose();
				}
				
				rootClass.world.selectPreview = rootClass.world.linkTree[itemId];				
				rootClass.ui.mcPopup.fOpen("ItemPreview");
				
			}
        }
		
        private function getBitmapByIndex(_arg1:int, _arg2:DisplayObjectContainer):DisplayObject{
            var _local3:DisplayObject;
            var _local4:int;
            while (_local4 < _arg2.numChildren) {
                if (int(_arg2.getChildAt(_local4).name.substr(1)) == _arg1){
                    _local3 = _arg2.getChildAt(_local4);
                    return (_local3);
                };
                _local4++;
            };
            return (null);
        }

        public function pushMsg(_arg1, _arg2, _arg3, _arg4, _arg5, _arg6:int=0){
			switch(mode){
				case 1:
					if (_arg1 == "world"){
                        return;
                    };
					break;
				case 2:
					// SEE ZONE ONLY
					if (_arg1 != "zone" && _arg1 != "wheel" && _arg1 != "whisper" && _arg1 != "server" && _arg1 != "warning" && _arg1 != "whisper"  && _arg1 != "administrator"  && _arg1 != "moderator") {
						return;
					}
					break;
				case 3:
					// SEE WORLD ONLY
					if (_arg1 != "world" && _arg1 != "wheel" && _arg1 != "whisper" && _arg1 != "server" && _arg1 != "warning" && _arg1 != "whisper"  && _arg1 != "administrator"  && _arg1 != "moderator") {
						return;
					}
					break;
				case 4:
					// SEE GUILD ONLY
					if (_arg1 != "party" && _arg1 != "wheel" && _arg1 != "whisper" && _arg1 != "server" && _arg1 != "warning" && _arg1 != "world" && _arg1 != "whisper"  && _arg1 != "administrator"  && _arg1 != "moderator") {
						return;
					}
					break;
				case 5:
					// SEE GUILD ONLY
					if (_arg1 != "guild" && _arg1 != "wheel" && _arg1 != "whisper" && _arg1 != "server" && _arg1 != "warning" && _arg1 != "world" && _arg1 != "whisper"  && _arg1 != "administrator"  && _arg1 != "moderator") {
						return;
					}
					break;
				case 6:
					// SEE TRADE ONLY
					if (_arg1 != "trade" && _arg1 != "wheel" && _arg1 != "whisper" && _arg1 != "server" && _arg1 != "warning" && _arg1 != "world" && _arg1 != "whisper"  && _arg1 != "administrator"  && _arg1 != "moderator") {
						return;
					}
					break;
			}
            var _local10:int;
            var _local11:*;
            var _local12:Object;
            var _local13:*;
            var _local14:*;
            var _local15:*;
            var _local16:*;
            var _local17:*;
            var _local18:*;
            var _local19:*;
            var _local20:*;
            var _local21:*;
            var _local22:*;
            var _local23:*;
            var _local24:*;
            var _local25:*;
            var _local26:String;
            trace(((("msg> " + _arg2) + " ?> ") + _arg3));
            var _local7:Boolean;
            if (((!((ignoreList.data.users == null))) && ((ignoreList.data.users.indexOf(_arg3) > -1)))){
                return;
            };
            if (_arg3 != "SERVER"){
                _local10 = 0;
                _local11 = rootClass.stripWhite(_arg2.toLowerCase());
                _local12 = profanityCheck(_arg2.toLowerCase());
                if (((!((_arg3.toLowerCase() == rootClass.sfc.myUserName))) && ((_arg6 == 0)))){
                    if (((strContains(_local11, illegalStrings)) || (strContains(_local11, unsendable)))){
                        _local10 = 1;
                    };
                    _local11 = rootClass.stripWhiteStrict(_arg2.toLowerCase());
                    if (strContains(_local11, ["email", "password"])){
                        _local10 = 1;
                    };
                    if ((((_local12.code == 1)) || ((_local12.code == 2)))){
                        _local10 = 1;
                    };
                    if ((((_arg1 == "whisper")) && ((modWhisperCheck(_arg2) > 0)))){
                        _local7 = true;
                    };
                    if (_local10){
                        return;
                    };
                };
                if (_local12.code == 3){
                    _arg2 = rootClass.maskStringBetween(_arg2, _local12.indeces);
                };
            };
            var _local8 = "$({";
            var _local9 = "})$";
            //startWindowTimer();
            if (isChannel(_arg1)){
             
				if (_arg1 == "zone" || _arg1 == "admin" || _arg1 == "ps" || _arg1 == "vip" || _arg1 == "mod"|| _arg1 == "warlord" || _arg1 == "archangel" || _arg1 == "champion" || _arg1 == "knight"){
					_arg3 = rootClass.strToProperCase(_arg3);
					if ((((_arg3 == "Eienyuki")) && ((_arg6 == 1)))){
						popBubble("u:yorumi", ("Eienyuki: " + _arg2), _arg1);
					}
					else {
						popBubble(("u:" + _arg3), _arg2, _arg1);
					};
				};
				checkFieldsVPos();
				chatArray.push([_arg1, _arg2, _arg3, _arg4, _arg5, msgID]);
				if (chatArray.length > lineLimit){
					chatArray.splice(0, (chatArray.length - lineLimit));
				};
				html2Fields("", "=", "server", 0);
				t1Arr = [];
				_local13 = 0;
				while (_local13 < chatArray.length) {
					_local14 = chatArray[_local13][0];
					_local15 = chatArray[_local13][1];
					_local16 = chatArray[_local13][2];
					_local17 = chatArray[_local13][3];
					_local18 = chatArray[_local13][4];
					_local19 = int(chatArray[_local13][5]);
					_local20 = '<font color="#';
					_local21 = '">';
					_local22 = "</font>";
					_local23 = (((chn[_local14].tag)=="") ? "" : (("[" + chn[_local14].tag) + "] "));
					_local24 = _local16;
					_local15 = _local15.replace(regExpLinking2, "$1")
					_local15 = _local15.replace(/<\s*A HREF="(.*?)">&lt;(.*?)&gt;<\s*\/A\s*>/ig, "$({item,$2,$1})$");
					_local15 = _local15.replace(regExpURL, "$({url,$&})$");
					if (((!((_local16 == null))) && (!((_local16 == "SERVER"))))){
						_local25 = ((((_local8 + "user,") + _local24) + _local9) + ": ");
					};
					if (_local16 == "SERVER"){
						_local25 = "";
					};
					//chatcolor
					if (_local14 != "whisper"){
						if (_local14 != "event"){		
							var xColor = chn[_local14].col;
							var rainbow = false;
							if (_local16 != null && _local16 != "SERVER") {
								var uChat = rootClass.world.getAvatarByUserName(_local16.toLowerCase());									
								if (uChat != null && uChat.objData != null) {
									if (_local14 != null && _local14 == "zone") {
										xColor = uChat.objData.strChatColor;
										if (xColor == "000000") {
											rainbow = true;
										}
									}
								} 
							}
							
							_local15 = _local15.split("#037:").join("%");
							
							if (rainbow) {
								//local25 = userName
								//local15 = text
								//local23 = tag
								
								var center = 128;
								var width = 127;
								var colorful = "";
								var frequency = Math.PI*2/_local15.length;
								var skip = false;
					
								_local15 = _local15.split("&amp;").join("&");
								_local15 = _local15.split("&quot;").join("\"");
								_local15 = _local15.split("&apos;").join("'");
								_local15 = _local15.split("&gt;").join(">");
								
								for (var i = 0; i < _local15.length; ++i)
								{
									if (_local15.charAt(i) == "}" && _local15.charAt(i + 1) == ")" && _local15.charAt(i + 2) == "$") {
										colorful += '})$';
										i += 3;
										skip = false;
									}
									   
									if (_local15.charAt(i) == "$" && _local15.charAt(i + 1) == "(" && _local15.charAt(i + 2) == "{") {
										colorful += '$({';
										i += 3;
										skip = true;
									}
									if (skip) {
										colorful += _local15.charAt(i);
										continue;
									}
									var red;
									var grn;
									var blu;
									
									if (_local15.charAt(i) == "&" && _local15.charAt(i + 1) == "l" && _local15.charAt(i + 2) == "t") {
										red = Math.sin(frequency*i + 0) * width + center;
										grn = Math.sin(frequency*i + 2) * width + center;
										blu = Math.sin(frequency*i + 4) * width + center;
										colorful += '<font color="' + RGB2Color(red,grn,blu) + '">&lt;</font>';
										i += 3;
									} else {										
										red = Math.sin(frequency*i + 0) * width + center;
										grn = Math.sin(frequency*i + 2) * width + center;
										blu = Math.sin(frequency*i + 4) * width + center;
										colorful += '<font color="' + RGB2Color(red,grn,blu) + '">' + _local15.charAt(i) + '</font>';
									}
								}
								_local15 = colorful;									
								html2Fields(_local23 + _local25 + _local15 + "<br>", "+=", _local14, _local19);									
							} else {							
								html2Fields((((((((_local20 + xColor) + _local21) + _local23) + _local25) + _local15) + _local22) + "<br>"), "+=", _local14, _local19);
							}
						}
						else {
							html2Fields((((((((((((((((_local20 + "CCCCCC") + _local21) + "*") + _local20) + "FFFFFF") + _local21) + _local24) + _local22) + _local20) + "CCCCCC") + _local21) + " ") + _local15) + _local22) + "*<br>"), "+=", _local14, _local19);
						};
					}
					else {
						if ((((_local16 == rootClass.sfc.myUserName)) || (isMyModHandle(_local16)))){
							if (_local18 == 0){
								html2Fields(((((((('<font color="#' + rootClass.modColor(chn[_local14].col, "666666", "-")) + '">') + "To ") + _local17) + ": ") + _local15) + "</font><br>"), "+=", _local14, _local19);
							}
							else {
								html2Fields(((((('<font color="#' + chn[_local14].col) + '">From ') + _local25) + _local15) + "</font><br>"), "+=", _local14, _local19);
							};
						}
						else {
							html2Fields(((((('<font color="#' + chn[_local14].col) + '">From ') + _local25) + _local15) + "</font><br>"), "+=", _local14, _local19);
						};
					};
					_local13++;
				};
				setFieldsVPos();
				writeText(panelIndex, _arg1);						
                msgID++;
            };
            if (_local7){
                pushMsg("warning", (("<font color='#FFFFFF'>" + _arg3) + "</font> IS NOT A MODERATOR.  DO NOT GIVE ACCOUNT INFORMATION TO OTHER PLAYERS."), "SERVER", "", 0);
            };
        }
		
		function RGB2Color(r,g,b){
			return '#' + byte2Hex(r) + byte2Hex(g) + byte2Hex(b);
		}
	  
		function byte2Hex(n){
			var nybHexString = "0123456789ABCDEF";
			return String(nybHexString.substr((n >> 4) & 0x0F,1)) + nybHexString.substr(n & 0x0F,1);
		}
		
        public function profanityCheck(_arg1:String):Object{
            var _local2:String;
            var _local3:int;
            var _local4:Object = {
                code:0,
                term:"",
                index:-1,
                indeces:[]
            };
            _local2 = ((" " + removeHTML(cleanStr(_arg1.toLowerCase()))) + " ");
            _local2 = rootClass.stripMarks(_local2);
            _local2 = rootClass.stripDuplicateVowels(_local2);
            _local3 = 0;
            while (_local3 < profanityA.length) {
                if (profanityA[_local3] == "weebly"){
                    trace("weebly found");
                };
                _local4.index = _local2.indexOf(((" " + profanityA[_local3]) + " "));
                if (_local4.index > -1){
                    _local4.term = profanityA[_local3];
                    _local4.code = 1;
                    return (_local4);
                };
                _local3++;
            };
            _local2 = rootClass.stripDuplicateVowels(removeHTML(cleanStr(_arg1.toLowerCase())));
            _local2 = rootClass.stripWhiteStrict(_local2);
            _local3 = 0;
            while (_local3 < profanityB.length) {
                _local4.index = _local2.indexOf(profanityB[_local3]);
                if (_local4.index > -1){
                    _local4.term = profanityB[_local3];
                    _local4.code = 2;
                    return (_local4);
                };
                _local3++;
            };
            _local2 = rootClass.stripDuplicateVowels(removeHTML(cleanStr(_arg1.toLowerCase())));
            _local2 = rootClass.stripWhiteStrictB(_local2);
            _local3 = 0;
            while (_local3 < profanityB.length) {
                _local4.index = _local2.indexOf(profanityB[_local3]);
                if (_local4.index > -1){
                    _local4.term = profanityB[_local3];
                    _local4.code = 2;
                    return (_local4);
                };
                _local3++;
            };
            var _local5:Array = [];
            var _local6 = "";
            var _local7:int;
            while (_local7 < _arg1.length) {
                if (legalCharsStrict.indexOf(_arg1.charAt(_local7)) > -1){
                    if ((((_local6.length == 0)) || (!((_arg1.charAt(_local7) == _local6.charAt((_local6.length - 1))))))){
                        _local6 = (_local6 + _arg1.charAt(_local7));
                        _local5.push(_local7);
                    };
                };
                _local7++;
            };
            _local3 = 0;
            while (_local3 < profanityC.length) {
                _local4.index = _local6.indexOf(profanityC[_local3]);
                if (_local4.index > -1){
                    _local4.code = 3;
                    _local4.indeces.push(_local5[_local4.index]);
                    _local4.indeces.push(((_local5[_local4.index] + profanityC[_local3].length) - 1));
                };
                _local3++;
            };
            return (_local4);
        }

        public function modWhisperCheck(_arg1:String):int{
            var _local3:String;
            var _local2:String = rootClass.stripWhiteStrict(removeHTML(_arg1.toLowerCase()));
            for each (_local3 in modWhisperCheckList) {
                if (_local2.indexOf(_local3) > -1){
                    return (1);
                };
            };
            return (0);
        }

        private function removeHTML(_arg1:String):String{
            var _local5:int;
            var _local6:String;
            var _local2:String = _arg1.toLowerCase();
            var _local3:String = ("" + _arg1);
            var _local4:Array = ["&nbsp;", "<br>"];
            for each (_local6 in _local4) {
                while (_local2.indexOf(_local6) > -1) {
                    _local5 = _local2.indexOf(_local6);
                    _local2 = ((_local2.substr(0, _local5) + " ") + _local2.substr((_local5 + _local6.length), _local2.length));
                    _local3 = ((_local3.substr(0, _local5) + " ") + _local3.substr((_local5 + _local6.length), _local3.length));
                };
            };
            return (_local3);
        }

        public function isUnsendable(_arg1:String):Boolean{
            var _local2:* = 0;
            while (_local2 < unsendable.length) {
                if (_arg1.toLowerCase().indexOf(unsendable[_local2]) > -1){
                    return (true);
                };
                _local2++;
            };
            return (false);
        }

        public function isIgnored(_arg1:String):Boolean{
            return ((ignoreList.data.users.indexOf(_arg1.toLowerCase()) >= 0));
        }

        public function ignore(_arg1:String):void{
            var _local2:*;
            if (ignoreList.data.users.indexOf(_arg1.toLowerCase()) == -1){
                ignoreList.data.users.push(_arg1.toLowerCase());
                ignoreList.flush();
                _local2 = rootClass.world.getAvatarByUserName(_arg1.toLowerCase());
                if (_local2 != null){
                    _local2.pMC.ignore.visible = true;
                };
                rootClass.sfc.sendXtMessage("zm", "cmd", ["ignoreList", ignoreList.data.users], "str", 1);
            };
            try {
                if (rootClass.ui.mcOFrame.fData.typ == "userListIgnore"){
                    rootClass.ui.mcOFrame.update();
                };
            }
            catch(e:Error) {
            };
        }

        public function unignore(_arg1:String):void{
            var _local2:* = ignoreList.data.users.indexOf(_arg1.toLowerCase());
            while (_local2 > -1) {
                ignoreList.data.users.splice(_local2, 1);
                _local2 = ignoreList.data.users.indexOf(_arg1.toLowerCase());
            };
            ignoreList.flush();
            var _local3:* = rootClass.world.getAvatarByUserName(_arg1.toLowerCase());
            if (_local3 != null){
                _local3.pMC.ignore.visible = false;
            };
            rootClass.sfc.sendXtMessage("zm", "cmd", ["ignoreList", ignoreList.data.users], "str", 1);
            try {
                if (rootClass.ui.mcOFrame.fData.typ == "userListIgnore"){
                    rootClass.ui.mcOFrame.update();
                };
            }
            catch(e:Error) {
            };
        }

        public function muteMe(_arg1:int):void{
            var _local2:Date = new Date();
            mute.ts = Number(_local2.getTime());
            mute.cd = _arg1;
            mute.timer.delay = _arg1;
            mute.timer.start();
            muteData.data.ts = mute.ts;
            muteData.data.cd = mute.cd;
            muteData.flush();
            pushMsg("warning", "You have been muted! Chat privileges are temporarily revoked.", "SERVER", "", 0);
        }

        public function unmuteMe(_arg1:Event=null):void{
            mute.ts = 0;
            mute.cd = 0;
            muteData.clear();
            mute.timer.reset();
            pushMsg("server", "You have been unmuted.  Chat privileges are restored.", "SERVER", "", 0);
        }

        public function amIMute():Boolean{
            var _local2:Date;
            var _local3:Number;
            var _local1:Boolean;
            if (mute.ts > 0){
                _local2 = new Date();
                _local3 = _local2.getTime();
                if ((_local3 - mute.ts) >= mute.cd){
                    mute.ts = 0;
                    mute.cd = 0;
                }
                else {
                    _local1 = true;
                };
            };
            return (_local1);
        }

        public function isChannel(_arg1:String):Boolean{
            var _local2:*;
            for (_local2 in chn) {
                if (_local2.toLowerCase() == _arg1.toLowerCase()){
                    return (true);
                };
            };
            return (false);
        }

        private function isMyModHandle(_arg1:String):Boolean{
            if ((((_arg1.split("-")[0] == "Moderator")) && (int((_arg1.split("-")[1] == rootClass.world.modID))))){
                return (true);
            };
            return (false);
        }


    }
}//package 

