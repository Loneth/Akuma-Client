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

    public dynamic class MCTutorialInventory extends MovieClip 
    {
        public var mcClickArea1:MovieClip;
        public var mcClickArea2:MovieClip;
		public var mcClickArea3:MovieClip;
		public var mcClickArea4:MovieClip;
		public var mcClickArea5:MovieClip;
		public var btnClose:SimpleButton;
		public var rootClass:MovieClip;

        public function MCTutorialInventory()
        {
			//rootClass = stage.getChildAt(0);
            addFrameScript(0, frame1, 19, frame20, 39, frame40, 59, frame60, 79, frame80);
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
			if (mcClickArea4.hitTestPoint(_arg1.stageX, _arg1.stageY)){
				play();
            };
			if (mcClickArea5.hitTestPoint(_arg1.stageX, _arg1.stageY)){
				rootClass.sfc.sendXtMessage("zm", "acceptQuest", [3], "str", -1);
				rootClass.sfc.sendXtMessage("zm", "tryQuestComplete", [3, -1, false, "wvz"], "str", -1);
				rootClass.world.removeHelpMovie();
                rootClass.stage.removeEventListener(MouseEvent.CLICK, onMouseClickArea);
            };
        }
		
		public function onClosePanel(_arg1:MouseEvent):void
        {
			rootClass.sfc.sendXtMessage("zm", "acceptQuest", [3], "str", -1);
			rootClass.sfc.sendXtMessage("zm", "tryQuestComplete", [3, -1, false, "wvz"], "str", -1);
			rootClass.world.removeHelpMovie();
			rootClass.stage.removeEventListener(MouseEvent.CLICK, onMouseClickArea);
        }
        
        function frame1()
        {			
            rootClass.ui.mcPopup.gotoAndStop("Init");
            rootClass.stage.addEventListener(MouseEvent.CLICK, onMouseClickArea);
			stop();
        }
		
		function frame20()
        {
			stop();
        }
		
		function frame40()
        {
			stop();
        }
		
		function frame60()
		{
			stop();
		}
		
		function frame80()
		{
			btnClose.addEventListener(MouseEvent.CLICK, onClosePanel);
			stop();
		}
		
    }
}//package 

