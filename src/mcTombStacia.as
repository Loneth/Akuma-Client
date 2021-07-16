// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.cnt_166

package {
    import flash.display.MovieClip;
    import flash.net.sendToURL;
    import flash.net.URLRequest;
    import flash.net.navigateToURL;
    import flash.events.MouseEvent;
    import flash.display.Loader;
    import flash.events.Event;
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

    public dynamic class mcTombStacia extends MovieClip {

        public var mcTimer:MovieClip;
		public var RespawnIn:MovieClip;
		public var btnRes:SimpleButton;
        public var rootClass;

        public function mcTombStacia(){
            addFrameScript(0, frame1, 19, frame20);
        }

        public function onRespawn(_arg1:MouseEvent){
			rootClass = MovieClip(stage.getChildAt(0));
            var _local2:* = MovieClip(this.rootClass.ui.mcRes);
			_local2.visible = false;
			_local2.gotoAndStop(1);
			rootClass.world.map.transform.colorTransform = rootClass.world.defaultCT;
			rootClass.world.CHARS.transform.colorTransform = rootClass.world.defaultCT;
			//rootClass.world.updateActBar();
			rootClass.world.resPlayer();
        }

        
        function frame1(){
            rootClass = MovieClip(stage.getChildAt(0));
            stop();
		}
		
		function frame20(){
			btnRes.addEventListener(MouseEvent.CLICK, onRespawn);
			stop();
		}


    }
}//package Game_fla

