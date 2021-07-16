// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.VIPbutton_902

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
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

    public dynamic class VIPbutton_902 extends MovieClip 
    {

        public var btnButton:SimpleButton;

        public function VIPbutton_902()
        {
            addFrameScript(0, frame1);
        }
        public function onButtonPress(_arg1:MouseEvent):void
        {
            MovieClip(parent).gotoAndPlay(this.strFrame);
        }
        function frame1()
        {
            btnButton.addEventListener(MouseEvent.MOUSE_DOWN, onButtonPress, false, 0, true);
            stop();
        }

    }
}//package Game_new_fla

