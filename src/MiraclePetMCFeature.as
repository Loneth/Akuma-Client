// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.ui_200

package {
    import flash.display.MovieClip;
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

    public dynamic class MiraclePetMCFeature extends MovieClip {

        public var mcHead:MovieClip;
        public var HP:MovieClip;
        public var strLevel:TextField;
        public var strName:TextField;
        public var strClass:TextField;
		public var XPBar:MovieClip;
		public var PortraitType:String = "Pet";

        public function MiraclePetMCFeature(){
            addFrameScript(0, frame1);
        }

        function frame1(){
            mcHead.backhair.visible = false;
        }


    }
}//package Game_fla

