package Game_fla{
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
	
	
	public class AwesomePanel extends MovieClip {
		
		public var Panel:MovieClip;

		public function AwesomePanel(){
            addFrameScript(0, frame1);
			var rootClass:* = MovieClip(stage.getChildAt(0));
        }
		
		public function frame1(){
			if (rootClass.world.myAvatar.objData.intAccessLevel >= 40){
				Panel.visible = true;
			} else {
				Panel.visible = false;
			};
		}
	}
	
}
