// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcNotificationWrapper_70

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.external.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class mcNotificationWrapper_70 extends MovieClip 
    {

        public var mcNoticeBubble:MovieClip;

        public function mcNotificationWrapper_70()
        {
            addFrameScript(0, frame1, 59, frame60);
        }
        public function notify(_arg1:String):void
        {
            mcNoticeBubble.strNotice.text = _arg1;
            gotoAndPlay(3);
            visible = true;
        }
        function frame1()
        {
            visible = false;
            stop();
        }
        function frame60()
        {
            visible = false;
            stop();
        }

    }
}//package Game_new_fla

