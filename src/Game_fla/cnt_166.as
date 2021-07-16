// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.cnt_166

package Game_fla{
    import flash.display.MovieClip;
    import flash.net.sendToURL;
    import flash.net.URLRequest;
    import flash.net.navigateToURL;
    import flash.events.MouseEvent;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.media.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.ui.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.xml.*;

    public dynamic class cnt_166 extends MovieClip {

        public var mcContent:MovieClip;
        public var mcTomb:MovieClip;
        public var rootClass;
        public var arrTips:Array;
        public var arrAds:Array;
        public var iAdIndex:int;

        public function cnt_166(){
            addFrameScript(0, frame1, 4, frame5, 19, frame20, 56, frame57);
        }

        public function clickGo(_arg1:MouseEvent){
            var _local2:String = ("http://tracking.battleon.com/click.asp?game=AW&campaign=DEATHAQW_" + arrAds[iAdIndex].sType.toUpperCase());
            sendToURL(new URLRequest(_local2));
            navigateToURL(new URLRequest(arrAds[iAdIndex].sTarget), "_blank");
        }

        public function loadAd():void{
            var _local1:Number;
            var _local2:int;
            var _local3:int;
            var _local4:Loader;
            var _local5:String;
            mcContent.mcButtons.chkAds.checkmark.visible = (mcContent.mcButtons.chkAds.bitChecked = !(rootClass.userPreference.data.bDeathAd));
            trace("line 90");
            mcContent.mcAd.visible = false;
            trace("line 92");
            if (rootClass.userPreference.data.bDeathAd){
                _local1 = ((rootClass.date_server.getTime() - rootClass.world.myAvatar.objData.dCreated.getTime()) / 1000);
                _local2 = (_local1 / (60 * 60));
                _local3 = 0;
                while (_local3 < arrAds.length) {
                    if ((((((((arrAds[_local3].sType == "member")) && (rootClass.world.myAvatar.isUpgraded()))) || ((((arrAds[_local3].sType == "aeextra")) && ((int(rootClass.world.myAvatar.objData.iAge) < 13)))))) || ((((arrAds[_local3].sType == "dragonhero")) && ((((_local2 >= 72)) || (rootClass.world.myAvatar.isUpgraded()))))))){
                        arrAds.splice(_local3, 1);
                        _local3--;
                    };
                    _local3++;
                };
                iAdIndex = Math.floor((Math.random() * arrAds.length));
                mcContent.mcAd.removeChildAt(0);
                _local4 = new Loader();
                _local4.load(new URLRequest((rootClass.sFilePath + arrAds[iAdIndex].sURL)));
                mcContent.mcAd.addChild(_local4);
                mcContent.mcAd.visible = true;
                _local5 = ("http://tracking.battleon.com/click.asp?game=AW&campaign=DEATHAQW_IMP_" + arrAds[iAdIndex].sType.toUpperCase());
                sendToURL(new URLRequest(_local5));
            }
            else {
                mcContent.mcAd.visible = false;
            };
        }

        public function onCheckBoxClick(_arg1:Event):void{
            if (rootClass.world.myAvatar.isUpgraded()){
                rootClass.userPreference.data.bDeathAd = !(mcContent.mcButtons.chkAds.bitChecked);
                rootClass.userPreference.flush();
                loadAd();
            };
        }

        function frame1(){
            rootClass = MovieClip(stage.getChildAt(0));
			rootClass.mixer.playSound("Dead");
            arrTips = new Array("Never give you password to ANYONE. HP staff will never ask for it.", "Never share your password or your account with anyone.", "Sharing accounts is against the rules and might get you banned!", "Strength improves your chance of a critical strike for melee classes.", "Learn about Enhancing your weapons by clicking the ENHANCEMENT button in Town of Beginning!", "Keep your enhancements up to date!", "Remember to rest in between battles!", "Intellect increases Magic Power and boosts magical damage and crit for caster classes.", "Wisdom only increases evasion for melee classes.", "Make sure yo read your tool tips for each skill you unlock!", "Mayonnaise should never be heated. It might make you ill!", "We were all noobs once. Help out new players!", "Members get access to special Member-only areas, classes and items!", "Don't stare at the sun.", "If someone is misbehaving, click on their character portrait to report them!", "Go easy on the carbs unless you move a lot.", '"A lot" is two words, not one.', "Sneevils LOVE boxes!", "You can get more item storage from the BANK! Visit Valencia in Battleontown!", "You can store items you got with AdventureCoins for FREE in the bank!", "Try having breakfast for dinner. You can thank me later.", "Clown pants are not heroic.", "Remember to link your HP account to your MASTER ACCOUNT for additional safety!", "Lost? You can always /join Initium", "Trying to catch up with a friend? Type /goto <player name>", "You can hide the chat panel by clicking on the arrow on your interface.", "If someone is being rude you can IGNORE them by clicking on their character portrait.", "To Reply to a private message, just type /r and hit ENTER!", "Gain experience, gold and rep by completing quests.", "You can buy more space in your backpack from Goldeva in Town of Beginning!", "You can use potions or food in battle if you equip it!", "Spotted a game bug? Report it on the official HP facebook Page!", "Staff will NEVER offer you free items, gold, RCs, or VIPship over Twitter or Facebook.", "Looking for things to do? Check your Book of Lore or the Adventure Button in Initium!", "Always read the HP Facebook Updates to find out what's coming next!", "Check out le-miracle.online/?upgrade for lots of cool HP shirts, games and more!", "Buying stuff at le-miracle.online/?upgrade will earn you special in-game items!", "Game Moderators, Developers and Staff always have a gold name above their head.", "Give us your feedback on this week's release on the forum, Twitter and Facebook!", "Do not share your account information with ANYONE, no matter what they promise you.", "Confirm your email to unlock chat and gain Power Gem! Refer a friend to get Friend Gems and unlock Twilly's shop!", "Never give your email password to anyone!", "Gavenda's left sock might be in your backpack right now!", "Don't give up now, you're just about to win!", "YOU are the only Hero who can save Lore. You must return to battle!", "Never leave home without an extra HP potion!");
            arrAds = new Array({
                sURL:"DeathAds/DragonHero.swf",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"dragonhero"
            }, {
                sURL:"DeathAds/DeathAd-TwoForOne.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"member"
            }, {
                sURL:"DeathAds/DeathAd-MemberUpgrade.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"member"
            }, {
                sURL:"DeathAds/250w-aextras.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"aeextra"
            }, {
                sURL:"DeathAds/ad-2012Calendar.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"heromart"
            }, {
                sURL:"DeathAds/ad-PrePaidCards.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"prepaidcard"
            }, {
                sURL:"DeathAds/ModPacks.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"heromart"
            }, {
                sURL:"DeathAds/ED_320x250-Death.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"epicduel"
            }, {
                sURL:"DeathAds/320x250-Oversoul-Death2.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"oversoul"
            }, {
                sURL:"DeathAds/320x250-Oversoul-Death.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"oversoul"
            }, {
                sURL:"DeathAds/ED_Death_320x250.jpg",
                sTarget:"http://le-miracle.online/?upgrade",
                sType:"Epic Duel"
            });
            iAdIndex = 0;
            mcContent.mcAd.addEventListener(MouseEvent.CLICK, clickGo);
            mcContent.mcAd.buttonMode = true;
            if (rootClass.userPreference.data.bDeathAd == null){
                rootClass.userPreference.data.bDeathAd = true;
            };
            mcContent.mcButtons.chkAds.chkBtn.addEventListener(MouseEvent.CLICK, onCheckBoxClick, false, 0, true);
            stop();
        }

        function frame5(){
            this.visible = true;
            mcContent.txtTip.htmlText = ("<b>Death's Note:</b> " + arrTips[Math.floor((Math.random() * arrTips.length))]);
            loadAd();
        }

        function frame20(){
            stop();
        }

        function frame57(){
            stop();
        }


    }
}//package Game_fla

