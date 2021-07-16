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

    public dynamic class MCTutorialWorldMap extends MovieClip 
    {
        public var mcClickArea1:MovieClip;
        public var mcClickArea2:MovieClip;
		public var mcClickArea3:MovieClip;
		public var mcClickArea4:MovieClip;
		public var mcClickArea5:MovieClip;
		public var rootClass:MovieClip;

        public function MCTutorialWorldMap()
        {
            addFrameScript(0, frame1);
			rootClass = MovieClip(Game.root);
			
        }
		
		public function onMouseClickArea(_arg1:MouseEvent):void
        {
            if (mcClickArea1.hitTestPoint(_arg1.stageX, _arg1.stageY)){
				rootClass.sfc.sendXtMessage("zm", "acceptQuest", [7], "str", -1);
				rootClass.sfc.sendXtMessage("zm", "tryQuestComplete", [7, -1, false, "wvz"], "str", -1);
				rootClass.world.removeHelpMovie();
                rootClass.stage.removeEventListener(MouseEvent.CLICK, onMouseClickArea);
            };
        }
        
        function frame1()
        {			
            rootClass.ui.mcPopup.gotoAndStop("Init");
            rootClass.stage.addEventListener(MouseEvent.CLICK, onMouseClickArea);
			stop();
        }
		
    }
}//package 

