// Decompiled by AS3 Sorcerer 1.40
// http://www.as3sorcerer.com/

//ToolTipMC

package 
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.events.*;
    import flash.media.*;
    import flash.display.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;

    public dynamic class MCTutorialIntro extends MovieClip 
    {
        public var mcClickArea:MovieClip;
		public var rootClass:MovieClip;
		public var mcPortrait:MovieClip;

        public function MCTutorialIntro()
        {
            addFrameScript(0, frame1, 9, frame10, 19, frame20, 29, frame30, 39, frame40, 49, frame50, 59, frame60, 69, frame70, 79, frame80, 89, frame90, 99, frame100, 109, frame110, 119, frame120, 129, frame130, 139, frame140, 149, frame150, 159, frame160, 169, frame170, 179, frame180, 189, frame190, 199, frame200, 209, frame210, 219, frame220, 229, frame230, 239, frame240, 249, frame250, 259, frame260);
			rootClass = MovieClip(Game.root);
			Glow = new GlowFilter(16777215, 1, 3, 3, 2, 1, false, false);
            Normal = new GlowFilter(0, 0, 0, 0, 0, 0, false, false)
        }
		
		public function onMouseClickArea(_arg1:MouseEvent):void
        {
            if (mcClickArea.hitTestPoint(_arg1.stageX, _arg1.stageY)){
				play();
            };
        }
        
        function frame1()
        {	
            rootClass.stage.addEventListener(MouseEvent.CLICK, onMouseClickArea);
			rootClass.ui.DarkBG.visible = true;
			rootClass.ui.iconQuest.visible = false;
			rootClass.ui.mcServerTime.visible = false;
			rootClass.ui.mcInterface.visible = false;
			rootClass.ui.mcInterface.mcPlate.visible = false;
			rootClass.ui.mcInterface.mcServerTime.visible = false;
			rootClass.ui.mcInterface.mcXPBar.visible = false;
			rootClass.ui.mcInterface.mcRepBar.visible = false;
			rootClass.ui.mcInterface.actBar.visible = false;
			rootClass.ui.mcInterface.mcActBarUI.visible = false;
			rootClass.ui.mcInterface.mcMenu.visible = false;
			rootClass.ui.mcInterface.mcMenu.btnRest.visible = false;
			rootClass.ui.mcInterface.mcMenu.btnOption.visible = false;
			rootClass.ui.mcInterface.areaList.visible = false;
			
			/** THE CHAT **/
			rootClass.ui.mcInterface.bShortTall.visible = false;
			rootClass.ui.mcInterface.bMinMax.visible = false;
			rootClass.ui.mcInterface.bsend.visible = false;
			rootClass.ui.mcInterface.tebg.visible = false;
			rootClass.ui.mcInterface.bCannedChat.visible = false;
			stop();
        }
		
		function frame10()
        {
			rootClass.ui.iconQuest.visible = false;
			stop();
        }
		
		function frame20()
        {
			rootClass.ui.mcPortrait.strName.filters = [Glow];
			stop();
        }
		
		function frame30()
        {
			rootClass.ui.mcPortrait.strName.filters = [Normal];
			rootClass.ui.mcPortrait.strClass.filters = [Glow];
			stop();
        }
		
		function frame40()
        {
			rootClass.ui.mcPortrait.strClass.filters = [Normal];
			rootClass.ui.mcPortrait.HP.filters = [Glow];
			rootClass.ui.mcPortrait.MP.filters = [Glow];
			stop();
        }
		
		function frame50()
        {
			rootClass.ui.mcPortrait.HP.filters = [Normal];
			rootClass.ui.mcPortrait.MP.filters = [Normal];
			rootClass.ui.mcPortrait.mcLevel.filters = [Glow];
			stop();
        }
		
		function frame60()
        {
			rootClass.ui.mcPortrait.mcLevel.filters = [Normal];
			rootClass.ui.mcPortrait.iconBoostXP.filters = [Glow];
			stop();
        }
		
		function frame70()
        {
			rootClass.ui.mcPortrait.iconBoostXP.filters = [Normal];
			rootClass.ui.mcPortrait.iconBoostG.filters = [Glow];
			stop();
        }
		
		function frame80()
        {
			rootClass.ui.mcPortrait.iconBoostG.filters = [Normal];
			rootClass.ui.mcPortrait.iconBoostCP.filters = [Glow];
			stop();
        }
		
		function frame90()
        {
			rootClass.ui.mcPortrait.iconBoostCP.filters = [Normal];
			rootClass.ui.mcPortrait.iconBoostRep.filters = [Glow];
			stop();
        }
		
		function frame100()
        {
			rootClass.ui.mcPortrait.iconBoostRep.filters = [Normal];
			stop();
        }
		
		function frame110()
        {
			rootClass.ui.DarkBG.visible = false;
			stop();
        }
		
		function frame120()
        {
			rootClass.ui.mcInterface.visible = true;
			rootClass.ui.mcInterface.mcPlate.visible = true;
			rootClass.ui.mcInterface.mcPlate.filters = [Glow];
			stop();
        }
		
		function frame130()
        {
			rootClass.ui.mcInterface.mcPlate.filters = [Normal];
			rootClass.ui.mcInterface.bCannedChat.visible = true;
			rootClass.ui.mcInterface.bCannedChat.filters = [Glow];
			stop();
        }
		
		function frame140()
        {
			rootClass.ui.mcInterface.bCannedChat.filters = [Normal];
			rootClass.ui.mcInterface.tebg.visible = true;
			rootClass.ui.mcInterface.tebg.filters = [Glow];
			stop();
        }
		
		function frame150()
        {
			rootClass.ui.mcInterface.tebg.filters = [Normal];
			rootClass.ui.mcInterface.bMinMax.visible = true;
			rootClass.ui.mcInterface.bMinMax.filters = [Glow];
			rootClass.ui.mcInterface.bShortTall.visible = true;
			rootClass.ui.mcInterface.bShortTall.filters = [Glow];
			rootClass.ui.mcInterface.bsend.visible = true;
			rootClass.ui.mcInterface.bsend.filters = [Glow];
			stop();
        }
		
		function frame160()
        {
			rootClass.ui.mcInterface.bMinMax.filters = [Normal];
			rootClass.ui.mcInterface.bShortTall.filters = [Normal];
			rootClass.ui.mcInterface.bsend.filters = [Normal];
			rootClass.ui.mcServerTime.visible = true;
			rootClass.ui.mcInterface.mcServerTime.visible = true;
			rootClass.ui.mcInterface.mcServerTime.filters = [Glow];
			stop();
        }
		
		function frame170()
        {
			rootClass.ui.mcInterface.mcServerTime.filters = [Normal];
			rootClass.ui.mcInterface.actBar.visible = true;
			rootClass.ui.mcInterface.mcActBarUI.visible = true;
			rootClass.ui.mcInterface.mcActBarUI.filters = [Glow];
			rootClass.ui.mcInterface.actBar.filters = [Glow];
			stop();
        }
		
		function frame180()
        {
			stop();
        }
				
		function frame190()
        {
			rootClass.ui.mcInterface.mcMenu.visible = true;
			rootClass.ui.mcInterface.actBar.filters = [Normal];
			rootClass.ui.mcInterface.mcActBarUI.filters = [Normal];
			rootClass.ui.mcInterface.mcMenu.btnRest.visible = true;
			rootClass.ui.mcInterface.mcMenu.btnRest.filters = [Glow];
			stop();
        }
		
		function frame200()
        {
			rootClass.ui.mcInterface.mcMenu.btnRest.filters = [Normal];
			rootClass.ui.mcInterface.mcMenu.btnOption.visible = true;
			rootClass.ui.mcInterface.mcMenu.btnOption.filters = [Glow];
			stop();
        }
		
		function frame210()
        {
			rootClass.ui.mcInterface.mcMenu.btnOption.filters = [Normal];
			rootClass.ui.iconQuest.visible = true;
			rootClass.ui.iconQuest.filters = [Glow];
			stop();
        }
		
		function frame220()
        {
			rootClass.ui.iconQuest.filters = [Normal];
			rootClass.ui.mcInterface.mcGold.visible = true;
			rootClass.ui.mcInterface.mcGold.filters = [Glow];
			stop();
        }
		
		function frame230()
        {
			rootClass.ui.mcInterface.mcGold.filters = [Normal];
			rootClass.ui.mcInterface.areaList.visible = true;
			rootClass.ui.mcInterface.areaList.filters = [Glow];
			stop();
        }
		
		function frame240()
		{
			rootClass.ui.mcInterface.areaList.filters = [Normal];
			rootClass.ui.mcInterface.mcXPBar.visible = true;
			rootClass.ui.mcInterface.mcXPBar.filters = [Glow];			
			stop();
		}
		
		function frame250(){
			rootClass.ui.mcInterface.mcXPBar.filters = [Normal];
			rootClass.ui.mcInterface.mcRepBar.visible = true;
			rootClass.ui.mcInterface.mcRepBar.filters = [Glow];
			stop();
		}
		
		function frame260(){
			rootClass.stage.removeEventListener(MouseEvent.CLICK, onMouseClickArea);
			rootClass.ui.mcInterface.mcRepBar.filters = [Normal];
			rootClass.sfc.sendXtMessage("zm", "acceptQuest", [1], "str", -1);
			rootClass.sfc.sendXtMessage("zm", "tryQuestComplete", [1, -1, false, "wvz"], "str", -1);
			visible = false; 
			stop();
		}
		
    }
}//package 

