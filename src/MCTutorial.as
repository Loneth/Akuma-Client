// Decompiled by AS3 Sorcerer 1.40
// http://www.as3sorcerer.com/

//ToolTipMC

package 
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
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

    public class MCTutorial extends MovieClip 
    {

        public var rootClass:MovieClip;
		public var btnBag:SimpleButton;
        public var mcClickArea:MovieClip;
        public var mcClickArea2:MovieClip;

        public function MCTutorial()
        {
            addFrameScript(0, frame1, 1, frame2);
        }
		
		public function onMouseClickArea(_arg1:MouseEvent):void
        {
            if (mcClickArea.hitTestPoint(_arg1.stageX, _arg1.stageY)){
				play();
            };
            if (mcClickArea2.hitTestPoint(_arg1.stageX, _arg1.stageY)){
				rootClass.world.removeHelpMovie();
                rootClass.stage.removeEventListener(MouseEvent.CLICK, onMouseClickArea);
            };
        }
        
        function frame1()
        {
			rootClass = stage.getChildAt(0);
			rootClass.stage.addEventListener(MouseEvent.CLICK, onMouseClickArea);
			stop();
        }
		
		function frame2()
        {
			stop();
        }
		

    }
}//package 

