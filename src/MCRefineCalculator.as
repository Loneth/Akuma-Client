// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//MCUpgradeWindow

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
	import flash.display.DisplayObject
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

    public dynamic class MCRefineCalculator extends MovieClip {

        public var btnClose2:SimpleButton;
        public var btnClose:SimpleButton;
        public var rootClass:MovieClip;

        public function MCRefineCalculator(){
            addFrameScript(0, frame1);
		}
		
        function frame1(){
            rootClass = stage.getChildAt(0);
			//rootClass.showCalculationsRefine();
			/*
            iDiff = ((rootClass.date_server.getTime() - rootClass.world.myAvatar.objData.dCreated.getTime()) / 1000);
            iHrs = (iDiff / (60 * 60));
            if ((((iHrs < 72)) && (!(rootClass.world.myAvatar.isUpgraded())))){
                gotoAndPlay("DragonHero");
            }
            else {
                if (rootClass.world.myAvatar.hasUpgraded()){
                    gotoAndPlay("Renew");
                };
            };*/
            stop();
        }
    }
}//package 

