// Decompiled by AS3 Sorcerer 2.99
// http://www.as3sorcerer.com/

//LPFPanelBg8

package {
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

    public dynamic class LPFPanelBg8 extends MovieClip {

        public var dragonRight:MovieClip;
        public var btnClose:SimpleButton;
        public var dragonLeft:MovieClip;
		public var btnChances:SimpleButton;
        public var tTitle:TextField;
		public var tPane1:TextField;
        public var tPane2:TextField;
		public var tPane3:TextField;
		public var tPane4:TextField;
        public var bg:MovieClip;

		public function LPFPanelBg8(){
			addFrameScript(0, frame1);
			rootClass = MovieClip(Game.root);
			super();
		}
		
		function frame1(){
			btnChances.addEventListener(MouseEvent.CLICK, onChances, false, 0, true);
		}
		
		function onChances(evt:MouseEvent):void {
			rootClass.showCalculationsRefine();
		}
	}
}