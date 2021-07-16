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

    public dynamic class MCTutorialSkillStat extends MovieClip 
    {
        public var mcClickArea1:MovieClip;
        public var mcClickArea2:MovieClip;
		public var mcClickArea3:MovieClip;
		public var btnSkillTree:SimpleButton;
		public var btnCharPanel:SimpleButton;
		public var btnClose:SimpleButton;
		public var rootClass:MovieClip;

        public function MCTutorialSkillStat()
        {
            addFrameScript(0, frame1, 19, frame20, 39, frame40, 59, frame60, 79, frame80, 99, frame100, 119, frame120, 139, frame140, 159, frame160, 179, frame180, 199, frame200, 219, frame220, 239, frame240, 259, frame260);
			rootClass = MovieClip(Game.root);
        }
		
		public function onMouseClickArea(_arg1:MouseEvent):void
        {
            if (mcClickArea1.hitTestPoint(_arg1.stageX, _arg1.stageY)){
				play();
            };
            if (mcClickArea2.hitTestPoint(_arg1.stageX, _arg1.stageY)){
				play();
            };
			if (mcClickArea3.hitTestPoint(_arg1.stageX, _arg1.stageY)){
				play();
            };
        }
		
		public function onSkillTree(_arg1:MouseEvent):void
        {
            rootClass.toggleSkillTree();
			play();
        }
		
		public function onCharpanel(_arg1:MouseEvent):void
        {
            rootClass.toggleCharpanel("overview");
			play();
        }
		
		public function onClosePanel(_arg1:MouseEvent):void
        {
            rootClass.ui.mcPopup.gotoAndStop("Init");
			play();
        }
        
        function frame1()
        {			
            rootClass.ui.mcPopup.gotoAndStop("Init");
            rootClass.stage.addEventListener(MouseEvent.CLICK, onMouseClickArea, false, 0, true);
			stop();
        }
		
		function frame20()
        {
			stop();
        }
		
		function frame40()
        {
			btnSkillTree.addEventListener(MouseEvent.CLICK, onSkillTree, false, 0, true);
			stop();
        }
		
		function frame60()
		{
			stop();
		}
		
		function frame80()
		{
			stop();
		}
		
		function frame100()
		{
			stop();
		}
		
		function frame120()
		{
			btnClose.addEventListener(MouseEvent.CLICK, onClosePanel);
			stop();
		}
		
		function frame140()
		{
			btnCharPanel.addEventListener(MouseEvent.CLICK, onCharpanel);
			stop();
		}
		
		function frame160()
		{
			stop();
		}
		
		function frame180()
		{
			stop();
		}
		
		function frame200()
		{
			stop();
		}
		
		function frame220()
		{
			stop();
		}
		
		function frame240()
		{
			stop();
		}
		
		function frame260()
		{
			rootClass.world.removeHelpMovie();
			rootClass.stage.removeEventListener(MouseEvent.CLICK, onMouseClickArea);
			rootClass.sfc.sendXtMessage("zm", "acceptQuest", [5], "str", -1);
			rootClass.sfc.sendXtMessage("zm", "tryQuestComplete", [5, -1, false, "wvz"], "str", -1);
			stop();
		}
		
    }
}//package 

