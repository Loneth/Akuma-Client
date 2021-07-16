// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.Symbol_732

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

    public dynamic class Symbol_732 extends MovieClip 
    {

        public var randomNumber:int;

        public function Symbol_732()
        {
            addFrameScript(0, frame1);
        }
        function frame1()
        {
            stop();
            mouseEnabled = false;
            mouseChildren = false;
            randomNumber = Math.round((Math.random() * 5));
            gotoAndStop((randomNumber + 1));
        }

    }
}//package Game_new_fla

