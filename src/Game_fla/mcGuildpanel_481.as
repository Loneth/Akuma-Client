// Decompiled by AS3 Sorcerer 2.99
// http://www.as3sorcerer.com/

//Game_fla.mcGuildpanel_481

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
	import flash.text.TextField;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class mcGuildpanel_481 extends MovieClip {


        public var mcBuyButtons:MovieClip;
        public var guildDisplay:MovieClip;
		public var guildDisplayOnline:MovieClip;
        public var btnOverview:MovieClip;
        public var rootClass:MovieClip;
        public var btnPerks:MovieClip;
		public var btnParameters:MovieClip;
        public var cntMask:MovieClip;
        public var tScores:MovieClip;
        public var __id0_:MovieClip;
        public var frame:MovieClip;
        public var scr:MovieClip;
        public var bg:MovieClip;
		
		public var DefaultLogo:MovieClip;
		public var ARise:MovieClip;
		
        public var tSlots:TextField;
        public var tTitle:TextField;
		public var guildPoint:TextField;
        public var tMemCount:TextField;
        public var intLoses:TextField;
        public var intWins:TextField;
		
		public var btnOfflineYes:SimpleButton;
		public var btnOfflineNo:SimpleButton;
        public var btnClose:SimpleButton;
		public var ShowOffline = "On";
		public var onlineCount:int;
		public var guildLenght:int;
		public var onlineCountDisplay:int;
		public var guildLenghtDisplay:int;
		public var contributionCount:int;
		public var Rank:int;
        public var i;
		public var io;
		public var ic;
		public var guild;
        public var li:mcGuildListItem;
		//public var lc:mcGuildContributonListItem;
        public var hRun:Number;
        public var dRun:Number;
        public var oy:Number;
        public var mbY:int;
        public var mhY:int;
        public var mbD:int;
        public var mDown:Boolean;
		
		public var txtRestCost:TextField;
		public var txtRest:TextField;

        public function mcGuildpanel_481(){
			/** SET FRAMES **/
			addFrameScript(0, frame1);
			
			/** SET PROPERTIES **/
			rootClass = MovieClip(stage.getChildAt(0));
			guild = rootClass.world.myAvatar.objData.guild;
			drag = new Object();
			
			//mcGuildContributions.visible = false;
			btnOfflineYes.visible = false;
			
			/** SET TITLE **/
			tTitle.text = guild.Name;	
			tTitle.mouseEnabled = false;
        }
				
        function frame1(){
			/** CALL BUTTON PROPERTIES **/
			
			/*mcBuyButtons.txtRestCost.mouseChildren = false;
			mcBuyButtons.txtRestCost.mouseEnabled = false;
			mcBuyButtons.txtRest.mouseChildren = false;
			mcBuyButtons.txtRest.mouseEnabled = false;*/
			btnOfflineYes.addEventListener(MouseEvent.CLICK, onOnline2Offline, false, 0, true);
			btnOfflineNo.addEventListener(MouseEvent.CLICK, onOffline2Online, false, 0, true);			
			loadGuildList();
            stop();
        }
		
		public function loadGuildList(){
			i = 0;
			io = 0;
			/** ONLINE LIST **/
			if(ShowOffline == "Off"){
				while (i < guild.ul.length) {
					if (guild.ul[i].Server.toLowerCase() != "offline"){
						li = new mcGuildListItem();
						li.x = 0;
						li.y = (io * 17);
						li.tName.text = guild.ul[i].userName;
						li.tRank.text = getRank(guild.ul[i].Rank);
						if (guild.ul[i].Server.toLowerCase() != "offline"){
							li.tServer.htmlText = ('<font color="#00FF00">Online</font>');
						} else {
							li.tServer.htmlText = ('<font color="#FFFFFF">' + guild.ul[i].Server + '</font>');
						};
						li.tLevel.text = String(guild.ul[i].Level);
						li.tContribution.text = String(guild.ul[i].Contribution);
						if (guild.ul[i].Server.toLowerCase() != "offline"){
							onlineCount++;
						};
						io++;
					};
					guildDisplayOnline.addChild(li);
					i++;
				};
				btnOfflineYes.visible = true;
				guildDisplayOnline.visible = true;
				guildDisplay.visible = false;
			/** DEFAULT **/
			} else {
				while (i < guild.ul.length) {
					li = new mcGuildListItem();
					li.x = 0;
					li.y = (i * 17);
					li.tName.text = guild.ul[i].userName;
					li.tRank.text = getRank(guild.ul[i].Rank);
					if (guild.ul[i].Server.toLowerCase() != "offline"){
						li.tServer.htmlText = ('<font color="#00FF00">Online</font>');
					} else {
						li.tServer.htmlText = ('<font color="#FFFFFF">' + guild.ul[i].Server + '</font>');
					};
					li.tLevel.text = String(guild.ul[i].Level);
					li.tContribution.text = String(guild.ul[i].Contribution);
					if (guild.ul[i].Server.toLowerCase() != "offline"){
						onlineCount++;
					};
					guildDisplay.addChild(li);
					i++;
				};
				btnOfflineYes.visible = false;
				guildDisplay.visible = true;
				guildDisplayOnline.visible = false;
			};
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
		
		public function onScrDown(_arg_1:MouseEvent){
            mbY = int(mouseY);
            mhY = int(mcMemberContribution.scr.h.y);
            mDown = true;
        }
		
        public function onScrUp(_arg_1:MouseEvent):void{
            mDown = false;
        }
		
        public function hEF(_arg_1:Event){
            var _local_2:*;
            if (mDown){
                _local_2 = mcMemberContribution.scr;
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
            var _local_2:* = mcMemberContribution.scr;
            var _local_3:* = mcMemberContribution.guildDisplay;
            var _local_4:* = (-(_local_2.h.y) / hRun);
            var _local_5:* = (int((_local_4 * dRun)) + oy);
            if (Math.abs((_local_5 - _local_3.y)) > 0.2){
                _local_3.y = (_local_3.y + ((_local_5 - _local_3.y) / 4));
            } else {
                _local_3.y = _local_5;
            };
        }
		
		public function onOffline2Online(_arg_1:MouseEvent):void{
            rootClass.mixer.playSound("Click");
            ShowOffline = "Off";
			loadGuildList();
        }
		
		public function onOnline2Offline(_arg_1:MouseEvent):void{
            rootClass.mixer.playSound("Click");
            ShowOffline = "On";
			loadGuildList();
        }
		
		function onInit(_arg_1:MouseEvent):void{
            rootClass.mixer.playSound("Click");
            gotoAndPlay("Init");
        }
    }
}//package Game_fla

