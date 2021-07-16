// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.game_1_mcNotificationWrapper_136

package Game_fla{
    import flash.display.MovieClip;
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

    public dynamic class game_1_mcNotificationWrapper_136 extends MovieClip {

        public var mcNoticeBubble:MovieClip;

        public function game_1_mcNotificationWrapper_136(){
            addFrameScript(0, frame1, 59, frame60);
        }

        public function notify(_arg1:String):void{
            mcNoticeBubble.strNotice.text = _arg1;
            gotoAndPlay(3);
            visible = true;
        }

        function frame1(){
            visible = false;
            stop();
        }

        function frame60(){
            visible = false;
            stop();
        }


    }
}//package Game_fla

