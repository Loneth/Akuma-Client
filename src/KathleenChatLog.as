//mcChatLog

package 
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
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

    public dynamic class KathleenChatLog extends MovieClip 
    {
		
		public var btnAll:SimpleButton;
		public var btnZone:SimpleButton;
		public var btnWorld:SimpleButton;
		public var btnParty:SimpleButton;
		public var btnGuild:SimpleButton;
		public var btnTrade:SimpleButton;
		public var channel:int = 1;
		public var rootClass;

        public function KathleenChatLog()
        {
			rootClass = MovieClip(stage.getChildAt(0));
            addFrameScript(0, frame1);
        }
				
		function frame1()
		{
			btnAll.addEventListener(MouseEvent.CLICK, onMouseClick);
			btnZone.addEventListener(MouseEvent.CLICK, onMouseClick);
			btnWorld.addEventListener(MouseEvent.CLICK, onMouseClick);
			btnParty.addEventListener(MouseEvent.CLICK, onMouseClick);
			btnGuild.addEventListener(MouseEvent.CLICK, onMouseClick);
			btnTrade.addEventListener(MouseEvent.CLICK, onMouseClick);	
			stop();
		}
		
		public function onMouseClick(btnEvent:MouseEvent){
			rootClass.mixer.playSound("Click");
			switch (btnEvent.currentTarget.name){
				case "btnAll":
					changeChannel(1);
					break;
				case "btnZone":
					changeChannel(2);
					break;
				case "btnWorld":
					changeChannel(3);
					break;
				case "btnParty":
					changeChannel(4);
					break;
				case "btnGuild":
					changeChannel(5);
					break;
				case "btnTrade":
					changeChannel(6);
					break;
			}
		}
		
		public function changeChannel(newChannel:int):void{
			var mainClass = MovieClip(Game.root);
			channel = newChannel;
			switch (channel){
				case 1:
					mainClass.chatF.pushMsg("server", "You have switched to general channel.", "SERVER", "", 0);				
					mainClass.chatF.mode = 1;
					if (mainClass.chatF.chn.zone.act){
						mainClass.chatF.chn.cur = mainClass.chatF.chn.zone;
						mainClass.chatF.chn.lastPublic = mainClass.chatF.chn.zone;
						mainClass.chatF.mci.te.text = mainClass.chatF.mci.te.text.substr((mainClass.chatF.mci.te.text.split(" ")[0].substr(1).length + 2));
					};
					mainClass.chatF.formatMsgEntry("");
					mainClass.chatF.updateMsgEntry();
					break;
				case 2:
					mainClass.chatF.pushMsg("server", "You have switched to zone channel.", "SERVER", "", 0);				
					mainClass.chatF.mode = 2;
					if (mainClass.chatF.chn.zone.act){
						mainClass.chatF.chn.cur = mainClass.chatF.chn.zone;
						mainClass.chatF.chn.lastPublic = mainClass.chatF.chn.zone;
						mainClass.chatF.mci.te.text = mainClass.chatF.mci.te.text.substr((mainClass.chatF.mci.te.text.split(" ")[0].substr(1).length + 2));
					};
					mainClass.chatF.formatMsgEntry("");
					mainClass.chatF.updateMsgEntry();
					break;
				case 3:
					mainClass.chatF.pushMsg("server", "You have switched to world channel.", "SERVER", "", 0);				
					mainClass.chatF.mode = 3;
					mainClass.chatF.chn.cur = mainClass.chatF.chn.world;
					mainClass.chatF.chn.lastPublic = mainClass.chatF.chn.world;
					mainClass.chatF.mci.te.text = mainClass.chatF.mci.te.text.substr(5);
					mainClass.chatF.formatMsgEntry("");
					mainClass.chatF.updateMsgEntry();
					break;
				case 4:
					mainClass.chatF.pushMsg("server", "You have switched to party channel.", "SERVER", "", 0);				
					mainClass.chatF.mode = 4;
					mainClass.chatF.chn.cur = mainClass.chatF.chn.party;
					mainClass.chatF.chn.lastPublic = mainClass.chatF.chn.party;
					mainClass.chatF.mci.te.text = mainClass.chatF.mci.te.text.substr(5);
					mainClass.chatF.formatMsgEntry("");
					mainClass.chatF.updateMsgEntry();
					break;
				case 5:
					mainClass.chatF.pushMsg("server", "You have switched to guild channel.", "SERVER", "", 0);				
					mainClass.chatF.mode = 5;
					mainClass.chatF.chn.cur = mainClass.chatF.chn.guild;
					mainClass.chatF.chn.lastPublic = mainClass.chatF.chn.guild;
					mainClass.chatF.mci.te.text = mainClass.chatF.mci.te.text.substr(5);
					mainClass.chatF.formatMsgEntry("");
					mainClass.chatF.updateMsgEntry();
					break;
				case 6:
					mainClass.chatF.pushMsg("server", "You have switched to trade channel.", "SERVER", "", 0);				
					mainClass.chatF.mode = 6;
					mainClass.chatF.chn.cur = mainClass.chatF.chn.trade;
					mainClass.chatF.chn.lastPublic = mainClass.chatF.chn.trade;
					mainClass.chatF.mci.te.text = mainClass.chatF.mci.te.text.substr(5);
					mainClass.chatF.formatMsgEntry("");
					mainClass.chatF.updateMsgEntry();
					break;
			}
		}
    }
}

